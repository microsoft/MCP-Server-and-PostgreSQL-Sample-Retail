#!/usr/bin/env bash

###############################################################################
# init-pg.sh - macOS PostgreSQL 17 + pgvector setup
#
# Simplified macOS-only script that:
#   1. Creates ASIF disk image for persistent storage
#   2. Runs PostgreSQL 17 with pgvector in container
#   3. Creates 'zava' database and 'store_manager' user
#.  4. Restores 'zava' database from local backup file
#
# Usage:
#   ./scripts/init-pg.sh [--force] [--password <pw>] [--db <name>] [--size <size>]
#   ./scripts/init-pg.sh --help
#
# Requirements: macOS, container CLI (installed at /usr/local/bin/container)
###############################################################################

set -euo pipefail
IFS=$'\n\t'

# Configuration
PG_IMAGE="docker.io/pgvector/pgvector:pg17"
CONTAINER_NAME="pg17"
DEFAULT_DB="appdb"
DEFAULT_USER="postgres"
DEFAULT_PASSWORD="change-me"
ASIF_VOL_NAME="pg-asif"
ASIF_IMAGE_DIR="${HOME}/Containers"
ASIF_IMAGE_PATH="${ASIF_IMAGE_DIR}/${ASIF_VOL_NAME}.dimage"
ASIF_MOUNT_POINT="/Volumes/${ASIF_VOL_NAME}"
ASIF_SIZE="50G"
FORCE=0

# macOS version check - require Tahoe (15.0) or later
MIN_VERSION="15.0"   # macOS Tahoe
OS_VERSION=$(sw_vers -productVersion)

if [ "$(printf '%s\n' "$MIN_VERSION" "$OS_VERSION" | sort -V | head -n1)" = "$MIN_VERSION" ]; then
  echo "Running on macOS $OS_VERSION (Tahoe or newer)"
else
  echo "Requires macOS Tahoe (15.0) or newer, but found $OS_VERSION"
  exit 1
fi

log() { printf "[%s] %s\n" "$(date '+%Y-%m-%dT%H:%M:%S')" "$*"; }
err() { printf "[ERROR] %s\n" "$*" >&2; }
die() { err "$*"; exit 1; }

show_help() {
	cat <<EOF
macOS PostgreSQL 17 + pgvector initializer

Options:
	--force              Recreate container even if already running
	--password <pw>      Postgres superuser password (default: ${DEFAULT_PASSWORD})
	--db <name>          Initial database name (default: ${DEFAULT_DB})
	--size <size>        ASIF sparse image max size (default: ${ASIF_SIZE})
	-h, --help           Show this help
EOF
}

# Ensure we're on macOS
if [[ "$(uname -s)" != "Darwin" ]]; then
die "This script is designed for macOS only"
fi

# Add common paths to ensure we can find tools
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# Parse arguments
POSTGRES_PASSWORD="${DEFAULT_PASSWORD}"
POSTGRES_DB="${DEFAULT_DB}"

while [[ $# -gt 0 ]]; do
case "$1" in
--force) FORCE=1; shift ;;
--password) POSTGRES_PASSWORD="$2"; shift 2 ;;
--db) POSTGRES_DB="$2"; shift 2 ;;
--size) ASIF_SIZE="$2"; shift 2 ;;
-h|--help) show_help; exit 0 ;;
*) die "Unknown argument: $1" ;;
esac
done

# Ensure container CLI is available
if ! command -v container >/dev/null 2>&1; then
    if [[ -f /usr/local/bin/container ]]; then
        # Add to PATH if container exists in /usr/local/bin
        export PATH="/usr/local/bin:$PATH"
        log "Added /usr/local/bin to PATH for container CLI"
    else
        die "Container CLI not found. Install container CLI first."
    fi
fi

# Create container image directory
if [[ ! -d "${ASIF_IMAGE_DIR}" ]]; then
log "Creating container image directory: ${ASIF_IMAGE_DIR}"
mkdir -p "${ASIF_IMAGE_DIR}"
fi

# Create ASIF image if missing
if [[ ! -f "${ASIF_IMAGE_PATH}" ]]; then
log "Creating ASIF sparse image (${ASIF_SIZE}) at ${ASIF_IMAGE_PATH}"
diskutil image create blank \
--format ASIF \
--size "${ASIF_SIZE}" \
--volumeName "${ASIF_VOL_NAME}" \
"${ASIF_IMAGE_PATH}" || die "Failed to create ASIF image"
else
log "ASIF image already exists: ${ASIF_IMAGE_PATH}"
fi

# Attach ASIF image if not mounted
if ! mount | grep -q "/Volumes/${ASIF_VOL_NAME} "; then
log "Attaching ASIF image"
diskutil image attach "${ASIF_IMAGE_PATH}" || die "Failed to attach ASIF image"
else
log "ASIF image already attached"
fi

# Verify mount point exists
if ! mount | grep -q "/Volumes/${ASIF_VOL_NAME} "; then
die "ASIF mount point not found after attach"
fi

# Create pgdata directory with proper permissions
if [[ ! -d "${ASIF_MOUNT_POINT}/pgdata" ]]; then
log "Creating pgdata directory"
mkdir -p "${ASIF_MOUNT_POINT}/pgdata"
chmod 700 "${ASIF_MOUNT_POINT}/pgdata"
else
chmod 700 "${ASIF_MOUNT_POINT}/pgdata" || true
fi

# Check if container exists and handle accordingly
if container list --all 2>/dev/null | grep -q "${CONTAINER_NAME}"; then
if [[ ${FORCE} -eq 1 ]]; then
log "Stopping and removing existing ${CONTAINER_NAME} container"
container stop "${CONTAINER_NAME}" 2>/dev/null || true
container rm "${CONTAINER_NAME}" 2>/dev/null || true
log "Container ${CONTAINER_NAME} removed successfully"
else
log "Container ${CONTAINER_NAME} already exists (use --force to recreate)"
exit 0
fi
fi

# Start PostgreSQL container
log "Starting ${CONTAINER_NAME} from image ${PG_IMAGE}"
container run -d --name "${CONTAINER_NAME}" \
-p 5432:5432 \
-e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
-e POSTGRES_USER="${DEFAULT_USER}" \
-e POSTGRES_DB="${POSTGRES_DB}" \
-e PGDATA=/var/lib/postgresql/data/pgdata \
--volume "${ASIF_MOUNT_POINT}/pgdata:/var/lib/postgresql/data" \
--volume "/Users/dave/GitHub/mcp_server_container/data:/backup_data" \
"${PG_IMAGE}" || die "Failed to start container"

# Show container status
log "Container started successfully:"
container list | head -n1
container list | grep "${CONTAINER_NAME}" || true

# Show recent logs
log "Recent container logs:"
container logs "${CONTAINER_NAME}" 2>&1 | tail -n 20 || true

# Wait for PostgreSQL to be ready and create database/user
log "Waiting for PostgreSQL to be ready..."
RETRIES=30
RETRY_COUNT=0

while [[ $RETRY_COUNT -lt $RETRIES ]]; do
    if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "SELECT 1" >/dev/null 2>&1; then
        log "PostgreSQL is ready!"
        break
    else
        log "Waiting for PostgreSQL... (attempt $((RETRY_COUNT + 1))/${RETRIES})"
        sleep 2
        RETRY_COUNT=$((RETRY_COUNT + 1))
    fi
done

if [[ $RETRY_COUNT -eq $RETRIES ]]; then
    err "PostgreSQL failed to start within expected time"
    exit 1
fi

# Create zava database
log "Checking for existing 'zava' database..."
if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "SELECT 1 FROM pg_database WHERE datname='zava';" 2>/dev/null | grep -q "1 row"; then
    log "Dropping existing 'zava' database..."
    container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "DROP DATABASE zava;" 2>/dev/null || {
        err "Failed to drop existing 'zava' database"
        exit 1
    }
    log "Existing 'zava' database dropped"
fi

log "Creating 'zava' database..."
if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "CREATE DATABASE zava;" 2>/dev/null; then
    log "Database 'zava' created successfully"
else
    err "Failed to create database 'zava'"
    exit 1
fi

# Create store_manager user
log "Checking for existing 'store_manager' user..."
if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "SELECT 1 FROM pg_roles WHERE rolname='store_manager';" 2>/dev/null | grep -q "1"; then
    log "Dropping existing 'store_manager' user..."
    container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "DROP USER store_manager;" 2>/dev/null || {
        err "Failed to drop existing 'store_manager' user"
        exit 1
    }
    log "Existing 'store_manager' user dropped"
fi

log "Creating 'store_manager' user..."
STORE_MANAGER_PASSWORD="StoreManager123"

# Use container exec to run psql inside the container
log "Executing CREATE USER command via container exec..."
if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "CREATE USER store_manager WITH PASSWORD '${STORE_MANAGER_PASSWORD}';" 2>&1; then
    log "User 'store_manager' created successfully"
else
    err "Failed to create user 'store_manager'"
    exit 1
fi

# Grant privileges to store_manager on zava database
log "Granting privileges to 'store_manager' on 'zava' database..."
container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "GRANT ALL PRIVILEGES ON DATABASE zava TO store_manager;" >/dev/null 2>&1 || err "Failed to grant privileges"

# Restore zava database from backup
log "Restoring zava database from backup..."
BACKUP_FILE="zava_retail_2025_07_21_postgres_rls.backup"

# The backup file is now available at /backup_data/ inside the container
log "Restoring database contents..."
if container exec "${CONTAINER_NAME}" pg_restore -U "${DEFAULT_USER}" -d zava -v /backup_data/${BACKUP_FILE} 2>&1; then
    log "Database restoration completed successfully"
else
    log "Warning: Some restoration errors occurred (this may be normal for certain backup types)"
fi

# Update privileges after restore
log "Updating privileges after restore..."
container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d zava -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_manager;" >/dev/null 2>&1 || true
container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d zava -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO store_manager;" >/dev/null 2>&1 || true
container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d zava -c "GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO store_manager;" >/dev/null 2>&1 || true

log "Database setup complete!"

# Restart container without backup volume for security
log "Restarting container without backup data mount for production use..."
container stop "${CONTAINER_NAME}" || {
    err "Failed to stop container for restart"
    exit 1
}

container rm "${CONTAINER_NAME}" || {
    err "Failed to remove container for restart" 
    exit 1
}

# Start clean production container without backup volume
log "Starting production container without backup data access..."
container run -d --name "${CONTAINER_NAME}" \
-p 5432:5432 \
-e POSTGRES_PASSWORD="${POSTGRES_PASSWORD}" \
-e POSTGRES_USER="${DEFAULT_USER}" \
-e POSTGRES_DB="${POSTGRES_DB}" \
-e PGDATA=/var/lib/postgresql/data/pgdata \
--volume "${ASIF_MOUNT_POINT}/pgdata:/var/lib/postgresql/data" \
"${PG_IMAGE}" || die "Failed to start production container"

# Wait for PostgreSQL to be ready after restart
log "Waiting for PostgreSQL to be ready after restart..."
RESTART_RETRIES=15
RESTART_RETRY_COUNT=0

while [[ $RESTART_RETRY_COUNT -lt $RESTART_RETRIES ]]; do
    if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d "${POSTGRES_DB}" -c "SELECT 1" >/dev/null 2>&1; then
        log "PostgreSQL is ready after restart!"
        break
    else
        log "Waiting for PostgreSQL restart... (attempt $((RESTART_RETRY_COUNT + 1))/${RESTART_RETRIES})"
        sleep 2
        RESTART_RETRY_COUNT=$((RESTART_RETRY_COUNT + 1))
    fi
done

if [[ $RESTART_RETRY_COUNT -eq $RESTART_RETRIES ]]; then
    err "PostgreSQL failed to restart within expected time"
    exit 1
fi

# Verify database and user are still accessible
log "Verifying database integrity after restart..."
if container exec "${CONTAINER_NAME}" psql -U "${DEFAULT_USER}" -d zava -c "SELECT COUNT(*) FROM retail.products;" >/dev/null 2>&1; then
    log "Database verification successful - retail data is accessible"
else
    err "Database verification failed after restart"
    exit 1
fi

log "Setup complete!"
log ""
log "Production container is running securely without backup data access."
log "Container status:"
container list | head -n1
container list | grep "${CONTAINER_NAME}" || true
log ""
log "Connections available:"
log "  Admin: postgres://${DEFAULT_USER}:${POSTGRES_PASSWORD}@localhost:5432/${POSTGRES_DB}"
log "  Zava DB (admin): postgres://${DEFAULT_USER}:${POSTGRES_PASSWORD}@localhost:5432/zava"
log "  Zava DB (store_manager): postgres://store_manager:${STORE_MANAGER_PASSWORD}@localhost:5432/zava"