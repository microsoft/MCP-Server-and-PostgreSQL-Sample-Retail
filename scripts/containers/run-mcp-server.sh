#!/usr/bin/env bash

###############################################################################
# run-mcp-server.sh - Run MCP Server with dynamic PostgreSQL IP
#
# This script dynamically gets the PostgreSQL container IP and runs the MCP server
#
# Usage:
#   ./scripts/run-mcp-server.sh [--force]
#   --force: Force rebuild the container image even if it exists
###############################################################################

set -euo pipefail

# Parse command line arguments
FORCE_REBUILD=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --force)
            FORCE_REBUILD=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--force]"
            echo "  --force: Force rebuild the container image even if it exists"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--force]"
            exit 1
            ;;
    esac
done

# Configuration
PG_CONTAINER_NAME="pg17"
MCP_CONTAINER_NAME="zava_mcp_server"
MCP_IMAGE="zava_mcp_server:latest"

log() { printf "[%s] %s\n" "$(date '+%Y-%m-%dT%H:%M:%S')" "$*"; }
err() { printf "[ERROR] %s\n" "$*" >&2; }
die() { err "$*"; exit 1; }

# Add common paths to ensure we can find tools
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Check if container CLI is available
if ! command -v container >/dev/null 2>&1; then
    if [[ -f /usr/local/bin/container ]]; then
        export PATH="/usr/local/bin:$PATH"
        log "Added /usr/local/bin to PATH for container CLI"
    else
        die "Container CLI not found. Install container CLI first."
    fi
fi

# Check if jq is available
if ! command -v jq >/dev/null 2>&1; then
    die "jq is required but not installed. Install with: brew install jq"
fi

# Check if MCP server image exists, build if not
if [[ "${FORCE_REBUILD}" == "true" ]]; then
    log "Force rebuild requested. Building MCP server image '${MCP_IMAGE}'..."
else
    log "Checking if MCP server image '${MCP_IMAGE}' exists..."
    # Extract image name and tag for flexible matching
    IMAGE_NAME=$(echo "${MCP_IMAGE}" | cut -d':' -f1)
    IMAGE_TAG=$(echo "${MCP_IMAGE}" | cut -d':' -f2)
    if container images list | grep -q "${IMAGE_NAME}.*${IMAGE_TAG}"; then
        log "MCP server image '${MCP_IMAGE}' already exists"
        # Skip to PostgreSQL container check
        skip_build=true
    fi
fi

if [[ "${FORCE_REBUILD}" == "true" ]] || [[ "${skip_build:-false}" != "true" ]]; then
    if [[ "${FORCE_REBUILD}" != "true" ]]; then
        log "MCP server image '${MCP_IMAGE}' not found. Building image..."
    fi
    
    # Change to the project root directory (assuming script is in scripts/ subdirectory)
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "${SCRIPT_DIR}")"
    
    log "Building image from directory: ${PROJECT_ROOT}"
    cd "${PROJECT_ROOT}"
    
    if ! container build -t "${MCP_IMAGE}" .; then
        die "Failed to build MCP server image '${MCP_IMAGE}'"
    fi
    
    log "Successfully built MCP server image '${MCP_IMAGE}'"
fi

# Check if PostgreSQL container is running
if ! container list | grep -q "${PG_CONTAINER_NAME}"; then
    die "PostgreSQL container '${PG_CONTAINER_NAME}' is not running. Run ./init-pg.sh first."
fi

# Stop and remove existing MCP server container if it exists
if container list | grep -q "${MCP_CONTAINER_NAME}"; then
    log "Stopping existing MCP server container..."
    container stop "${MCP_CONTAINER_NAME}" || true
    container rm "${MCP_CONTAINER_NAME}" || true
fi

# Run MCP server container
log "Starting MCP server container..."
container run -d -p 8000:8000 \
  --name "${MCP_CONTAINER_NAME}" \
  -v "$HOME/.azure:/root/.azure" \
  -e AZURE_CONFIG_DIR=/root/.azure \
  -e POSTGRES_URL="postgresql://postgres:change-me@pg17.zava:5432/zava?application_name=mcp-server" \
  -e APPLICATIONINSIGHTS_CONNECTION_STRING="InstrumentationKey=edce0a10-7b0e-48f0-b2d7-4037e7e8e813;IngestionEndpoint=https://westus-0.in.applicationinsights.azure.com/;LiveEndpoint=https://westus.livediagnostics.monitor.azure.com/;ApplicationId=88fc4158-bf5b-4917-a2ab-09e33376b33f" \
  -e AZURE_OPENAI_ENDPOINT="https://fdy-zava-agent-wks-yf9x.services.ai.azure.com/" \
  -e EMBEDDING_MODEL_DEPLOYMENT_NAME="text-embedding-3-small" \
  "${MCP_IMAGE}" || die "Failed to start MCP server container"

log "MCP server started successfully!"
log "Server should be available at: http://localhost:8000"

# Show container status
log "Container status:"
container list | head -n1
container list | grep "${MCP_CONTAINER_NAME}" || true