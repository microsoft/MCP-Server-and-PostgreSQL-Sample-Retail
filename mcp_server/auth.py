"""
JWT-based authentication for the MCP server's Row Level Security identity.

This replaces blind trust in the client-supplied `x-rls-user-id` header with
an RLS user id derived from a verified JWT bearer token, wiring the Azure
Entra ID validation approach sketched in walkthrough/02-Security/README.md
into the actual server.

Two verification modes are supported, selected automatically from
configuration:

1. Azure Entra ID (for a real deployment). Set both AZURE_TENANT_ID and
   AZURE_AUDIENCE explicitly. (AZURE_TENANT_ID/AZURE_CLIENT_ID are also used
   for the server's own outbound authentication to Azure OpenAI and can be
   populated by infra/deploy.sh for that unrelated reason, so AZURE_AUDIENCE
   is deliberately required on its own - this mode only turns on when it is
   set on purpose.) The server fetches the tenant's JWKS from Microsoft's
   discovery endpoint and verifies the token's RS256 signature, expiry,
   audience, and issuer.

2. Local/dev shared-secret mode (sample only, never for production). Set
   AUTH_DEV_HMAC_SECRET to a random value and sign test tokens with
   scripts/generate_dev_token.py. This lets the sample and its walkthrough
   run end-to-end without a real Azure AD tenant. There is no key rotation
   and no issuer check in this mode - anyone holding the shared secret can
   mint any identity, so it must stay off in any real deployment.

If neither is configured, every request is rejected. There is no
unauthenticated fallback identity.

In both modes the verified token must carry a claim - named by
AUTH_RLS_CLAIM, default "rls_user_id" - whose value is the RLS identity to
apply (a store's `stores.rls_user_id`, or the documented all-store value).
A real Entra ID deployment needs an optional claim or claims-mapping policy
on its app registration to emit this claim (or AUTH_RLS_CLAIM can be
pointed at whatever claim the tenant already emits, e.g. a custom security
attribute), so that a verified token - not client-supplied text - decides
which store's data a caller can see.
"""

import logging
import os
from typing import Any, Dict, Optional

import jwt

try:
    from dotenv import load_dotenv

    load_dotenv()
except ImportError:
    pass

logger = logging.getLogger(__name__)


class AuthenticationError(Exception):
    """Raised when a request cannot be tied to a verified RLS identity.

    Callers must treat this as a hard failure and reject the request -
    never fall back to a default or unauthenticated identity.
    """


def _clean(value: str) -> str:
    """Strip surrounding quotes that Docker's env_file directive may leave in place."""
    return value.strip('"').strip("'") if value else ""


_AZURE_TENANT_ID = _clean(os.getenv("AZURE_TENANT_ID", ""))
# Deliberately NOT falling back to AZURE_CLIENT_ID here. AZURE_TENANT_ID and
# AZURE_CLIENT_ID are also used for the server's own outbound authentication
# to Azure OpenAI (see .env.template) and get populated automatically by
# infra/deploy.sh and infra/deploy.ps1 for that unrelated purpose. Inbound
# caller-token verification must only turn on when AZURE_AUDIENCE is set
# deliberately for that purpose - never as a side effect of those scripts.
_AZURE_AUDIENCE = _clean(os.getenv("AZURE_AUDIENCE", ""))
_AUTH_ISSUER = _clean(os.getenv("AUTH_ISSUER", ""))
_AUTH_JWKS_URI = _clean(os.getenv("AUTH_JWKS_URI", ""))
_AUTH_DEV_HMAC_SECRET = _clean(os.getenv("AUTH_DEV_HMAC_SECRET", ""))
_AUTH_RLS_CLAIM = _clean(os.getenv("AUTH_RLS_CLAIM", "")) or "rls_user_id"

# .env.template ships these as literal placeholders; treat them as "unset".
_PLACEHOLDER_VALUES = {"", "YOUR_TENANT_ID", "YOUR_CLIENT_ID"}


def _entra_configured() -> bool:
    return (
        _AZURE_TENANT_ID not in _PLACEHOLDER_VALUES
        and _AZURE_AUDIENCE not in _PLACEHOLDER_VALUES
    )


def _issuer() -> str:
    return _AUTH_ISSUER or f"https://login.microsoftonline.com/{_AZURE_TENANT_ID}/v2.0"


def _jwks_uri() -> str:
    return (
        _AUTH_JWKS_URI
        or f"https://login.microsoftonline.com/{_AZURE_TENANT_ID}/discovery/v2.0/keys"
    )


_jwks_client: Optional["jwt.PyJWKClient"] = None


def _get_jwks_client() -> "jwt.PyJWKClient":
    global _jwks_client
    if _jwks_client is None:
        # cache_keys/lifespan avoid a network round trip to Microsoft's JWKS
        # endpoint on every request; keys are re-fetched hourly or on a
        # cache miss (e.g. after Microsoft rotates a signing key).
        _jwks_client = jwt.PyJWKClient(_jwks_uri(), cache_keys=True, lifespan=3600)
    return _jwks_client


def _verify_entra_token(token: str) -> Dict[str, Any]:
    # _entra_configured() already guarantees AZURE_TENANT_ID and
    # AZURE_AUDIENCE are both set before this is called.
    signing_key = _get_jwks_client().get_signing_key_from_jwt(token)
    return jwt.decode(
        token,
        signing_key.key,
        algorithms=["RS256"],
        audience=_AZURE_AUDIENCE,
        issuer=_issuer(),
        options={"require": ["exp", "iss", "aud"]},
    )


def _verify_dev_token(token: str) -> Dict[str, Any]:
    logger.warning(
        "Verifying request using AUTH_DEV_HMAC_SECRET - this is a sample/testing "
        "mode only and must never be enabled in a real deployment."
    )
    return jwt.decode(
        token,
        _AUTH_DEV_HMAC_SECRET,
        algorithms=["HS256"],
        options={"require": ["exp"]},
    )


def _verify_token(token: str) -> Dict[str, Any]:
    if _entra_configured():
        return _verify_entra_token(token)
    if _AUTH_DEV_HMAC_SECRET:
        return _verify_dev_token(token)
    raise AuthenticationError(
        "No identity provider is configured. Set AZURE_TENANT_ID (and "
        "AZURE_AUDIENCE) for Azure Entra ID verification, or "
        "AUTH_DEV_HMAC_SECRET for local/dev testing - see README.md. "
        "Refusing to guess the caller's identity."
    )


def auth_configured() -> bool:
    """True if either verification mode has been configured."""
    return _entra_configured() or bool(_AUTH_DEV_HMAC_SECRET)


def get_verified_rls_user_id(authorization_header: Optional[str]) -> str:
    """Verify the bearer token in `authorization_header` and return the RLS
    user id from its verified claims.

    Raises AuthenticationError if the header is missing or malformed, the
    token fails verification (bad signature, expired, wrong audience or
    issuer), or the verified token has no usable AUTH_RLS_CLAIM claim.
    There is no default - callers must fail closed on this exception.
    """
    if not authorization_header:
        raise AuthenticationError("Missing Authorization header")

    scheme, _, token = authorization_header.partition(" ")
    if scheme.lower() != "bearer" or not token:
        raise AuthenticationError("Authorization header must be 'Bearer <token>'")

    try:
        payload = _verify_token(token)
    except AuthenticationError:
        raise
    except jwt.ExpiredSignatureError as e:
        raise AuthenticationError("Token has expired") from e
    except jwt.PyJWTError as e:
        # Covers every other PyJWT failure mode - malformed tokens, bad
        # signatures, wrong audience/issuer, and JWKS lookup failures (e.g.
        # jwt.PyJWKClientError for a token with no/unknown `kid`) all land
        # here so they fail closed the same way rather than propagating as
        # an unhandled exception.
        raise AuthenticationError(f"Token validation failed: {e}") from e

    rls_user_id = payload.get(_AUTH_RLS_CLAIM)
    if not rls_user_id or not isinstance(rls_user_id, str):
        raise AuthenticationError(
            f"Verified token has no usable '{_AUTH_RLS_CLAIM}' claim"
        )
    return rls_user_id
