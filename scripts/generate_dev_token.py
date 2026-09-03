#!/usr/bin/env python3
"""
Mint a local test JWT for the sample's AUTH_DEV_HMAC_SECRET auth mode.

This is a development/testing convenience only. It has nothing to do with
Azure Entra ID and must never be used against a real deployment - a real
deployment authenticates callers through Entra ID (see
walkthrough/02-Security/README.md and mcp_server/auth.py), where tokens are
issued by Microsoft, not by this script.

Usage:
    export AUTH_DEV_HMAC_SECRET=some-random-local-only-value
    python scripts/generate_dev_token.py --rls-user-id f47ac10b-58cc-4372-a567-0e02b2c3d479

Then call the server with:
    curl -H "Authorization: Bearer <token printed above>" ...
"""

import argparse
import os
import sys
import time

import jwt


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--rls-user-id",
        required=True,
        help="The RLS user id to embed (a store's rls_user_id, or the "
        "documented all-store value).",
    )
    parser.add_argument(
        "--expires-in-seconds",
        type=int,
        default=3600,
        help="Token lifetime in seconds. Defaults to 3600 (1 hour).",
    )
    args = parser.parse_args()

    secret = os.getenv("AUTH_DEV_HMAC_SECRET", "")
    if not secret:
        print(
            "Error: AUTH_DEV_HMAC_SECRET is not set. Export the same value the "
            "MCP server is configured with before running this script.",
            file=sys.stderr,
        )
        sys.exit(1)

    claim_name = os.getenv("AUTH_RLS_CLAIM", "rls_user_id")
    now = int(time.time())
    payload = {
        claim_name: args.rls_user_id,
        "iat": now,
        "exp": now + args.expires_in_seconds,
    }
    token = jwt.encode(payload, secret, algorithm="HS256")
    print(token)


if __name__ == "__main__":
    main()
