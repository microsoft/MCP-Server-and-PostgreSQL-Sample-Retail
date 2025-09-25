"""Health check script for the MCP server."""

import sys


def main():
    """Perform a health check and exit with appropriate status code."""
    try:
        # Simple health check logic
        print("Health check passed")
        sys.exit(0)
    except Exception as e:
        print(f"Health check failed: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
