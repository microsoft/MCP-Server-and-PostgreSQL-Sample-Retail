FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install your app deps + Azure CLI from PyPI
COPY requirements.lock.txt .
RUN pip install --no-cache-dir -r requirements.lock.txt \
    && pip install --no-cache-dir azure-cli \
    && az --version

# App code
COPY mcp_server/ /app/mcp_server/

EXPOSE 8000
ENV PORT=8000 \
    AZURE_EXTENSION_USE_DYNAMIC_INSTALL=yes_without_prompt

# Add a health check to periodically verify the container's health
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD python -m mcp_server.health_check || exit 1

CMD ["python", "-m", "mcp_server.sales_analysis"]