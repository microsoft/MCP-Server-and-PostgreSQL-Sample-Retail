#!/bin/bash
set -e

# This script runs during PostgreSQL initialization
# It will create the store_manager user and restore the zava database from the backup file

echo "Starting database initialization process..."

# Wait for PostgreSQL to be ready
until pg_isready -U postgres -d zava; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# Check if the database has already been restored (check for a specific table)
if psql -U postgres -d zava -c "SELECT 1 FROM information_schema.tables WHERE table_name = 'customers' AND table_schema = 'retail';" 2>/dev/null | grep -q "1"; then
  echo "Database appears to already be restored. Skipping restoration."
  exit 0
fi

# Create store_manager user if it doesn't exist
echo "Creating store_manager user..."
STORE_MANAGER_PASSWORD="StoreManager123"

# Check if user already exists
if psql -U postgres -d postgres -c "SELECT 1 FROM pg_roles WHERE rolname='store_manager';" 2>/dev/null | grep -q "1"; then
    echo "User 'store_manager' already exists"
else
    echo "Creating 'store_manager' user..."
    psql -U postgres -d postgres -c "CREATE USER store_manager WITH PASSWORD '${STORE_MANAGER_PASSWORD}';" || {
        echo "Warning: Failed to create store_manager user"
    }
    echo "User 'store_manager' created successfully"
fi

# Grant privileges to store_manager on zava database
echo "Granting privileges to 'store_manager' on 'zava' database..."
psql -U postgres -d postgres -c "GRANT ALL PRIVILEGES ON DATABASE zava TO store_manager;" || {
    echo "Warning: Failed to grant database privileges to store_manager"
}

echo "Restoring database from backup file..."
BACKUP_FILE="/backup_data/zava_retail_2025_07_21_postgres_rls.backup"

if [ -f "$BACKUP_FILE" ]; then
  echo "Found backup file: $BACKUP_FILE"
  echo "Restoring database contents..."
  
  # Restore the database
  pg_restore -U postgres -d zava -v "$BACKUP_FILE" || {
    echo "Warning: Some restoration errors occurred. This may be normal for certain backup types."
    echo "Continuing with startup..."
  }
  
  # Update privileges after restore
  echo "Updating privileges after restore..."
  psql -U postgres -d zava -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO store_manager;" || true
  psql -U postgres -d zava -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO store_manager;" || true
  psql -U postgres -d zava -c "GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO store_manager;" || true
  psql -U postgres -d zava -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA retail TO store_manager;" || true
  psql -U postgres -d zava -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA retail TO store_manager;" || true
  
  echo "Database restoration completed."
else
  echo "Warning: Backup file not found at $BACKUP_FILE"
  echo "Database will start empty."
fi

echo "Database initialization complete."