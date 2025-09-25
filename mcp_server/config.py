import logging
import os
import re

# Load environment variables from .env file if dotenv is available
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    # dotenv not available, continue without it
    pass

# Configure basic logging to show INFO level messages
logging.basicConfig(level=logging.INFO, format="%(levelname)s:     %(message)s")
logger = logging.getLogger(__name__)


class Config:
    """Configuration class for managing application settings."""

    def __init__(self):
        """Initialize configuration with environment variables."""
        # Load and clean individual PostgreSQL properties
        self._postgres_host: str = self._clean_env_value(os.getenv("POSTGRES_DB_HOST", "localhost"))
        self._postgres_port: int = int(self._clean_env_value(os.getenv("POSTGRES_DB_PORT", "5432")))
        self._postgres_database: str = self._clean_env_value(os.getenv("POSTGRES_DB", "zava"))
        self._postgres_user: str = self._clean_env_value(os.getenv("POSTGRES_USER", "postgres"))
        self._postgres_password: str = self._clean_env_value(os.getenv("POSTGRES_PASSWORD", ""))
        self._postgres_application_name: str = self._clean_env_value(os.getenv("POSTGRES_APPLICATION_NAME", "mcp-server"))

        # Load and clean Application Insights connection string
        appinsights_raw = os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING", "")
        self._appinsights_connection_string: str = self._clean_env_value(
            appinsights_raw
        )

        # Always log configuration info
        self._log_config_info()

    def _clean_env_value(self, value: str) -> str:
        """Strip surrounding quotes that might be added by Docker."""
        return value.strip('"').strip("'") if value else ""

    def _log_config_info(self) -> None:
        """Log configuration information."""
        logger.info("POSTGRES_DB_HOST: '%s'", self._postgres_host)
        logger.info("POSTGRES_DB_PORT: %d", self._postgres_port)
        logger.info("POSTGRES_DB: '%s'", self._postgres_database)
        logger.info("POSTGRES_USER: '%s'", self._postgres_user)
        logger.info("POSTGRES_APPLICATION_NAME: '%s'", self._postgres_application_name)
        logger.info(
            "APPLICATIONINSIGHTS_CONNECTION_STRING: '%s'",
            self._appinsights_connection_string,
        )

    @property
    def postgres_host(self) -> str:
        """Returns the PostgreSQL host."""
        return self._postgres_host

    @property
    def postgres_port(self) -> int:
        """Returns the PostgreSQL port."""
        return self._postgres_port

    @property
    def postgres_database(self) -> str:
        """Returns the PostgreSQL database name."""
        return self._postgres_database

    @property
    def postgres_user(self) -> str:
        """Returns the PostgreSQL username."""
        return self._postgres_user

    @property
    def postgres_password(self) -> str:
        """Returns the PostgreSQL password."""
        return self._postgres_password

    @property
    def postgres_application_name(self) -> str:
        """Returns the PostgreSQL application name."""
        return self._postgres_application_name

    def get_postgres_connection_params(self) -> dict:
        """Returns PostgreSQL connection parameters as a dictionary for asyncpg."""
        return {
            "host": self._postgres_host,
            "port": self._postgres_port,
            "database": self._postgres_database,
            "user": self._postgres_user,
            "password": self._postgres_password,
            "server_settings": {
                "application_name": self._postgres_application_name
            }
        }

    @property
    def postgres_url(self) -> str:
        """Returns the PostgreSQL connection URL constructed from individual components."""
        return f"postgresql://{self._postgres_user}:{self._postgres_password}@{self._postgres_host}:{self._postgres_port}/{self._postgres_database}?application_name={self._postgres_application_name}"

    @property
    def applicationinsights_connection_string(self) -> str:
        """
        Returns the Application Insights connection string with cleaned endpoint URLs.
        Ensures endpoint URLs do not have trailing slashes.
        """
        if not self._appinsights_connection_string:
            return ""

        # Remove trailing slashes from IngestionEndpoint and LiveEndpoint
        connection_string = re.sub(
            r"(IngestionEndpoint|LiveEndpoint)=([^;]+)/",
            r"\1=\2",
            self._appinsights_connection_string,
        )
        return connection_string

    def validate_required_env_vars(self) -> None:
        """
        Validate that all required environment variables are set.

        Raises:
            ValueError: If any required environment variables are missing or invalid
        """
        missing_vars = []

        if not self._postgres_host:
            missing_vars.append("POSTGRES_DB_HOST")
        if not self._postgres_database:
            missing_vars.append("POSTGRES_DB")
        if not self._postgres_user:
            missing_vars.append("POSTGRES_USER")
        if not self._postgres_password:
            missing_vars.append("POSTGRES_PASSWORD")

        if not self.applicationinsights_connection_string:
            missing_vars.append("APPLICATIONINSIGHTS_CONNECTION_STRING")

        if missing_vars:
            raise ValueError(
                f"Missing or invalid required environment variables: {', '.join(missing_vars)}"
            )
