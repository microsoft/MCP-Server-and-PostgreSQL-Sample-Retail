#!/bin/bash
set -e  # Exit on any error

echo "Deploying the Azure resources..."

# --- Prompt for GPT model deployment ---
read -p "Do you want to deploy the GPT-4o-mini model? (y/N): " DEPLOY_GPT
case "$DEPLOY_GPT" in
    [Yy]*)
        INCLUDE_GPT_MODEL=true
        echo "Including both GPT-4o-mini and text-embedding-3-small models"
        ;;
    *)
        INCLUDE_GPT_MODEL=false
        echo "Including only text-embedding-3-small model"
        ;;
esac

# --- Parameters (match deploy.ps1) ---
RG_LOCATION="westus"
RESOURCE_PREFIX="zava-mcp-server"
# unique suffix: lowercase letters + digits, 4 chars (macOS compatible)
UNIQUE_SUFFIX=$(openssl rand -hex 2 | tr '[:upper:]' '[:lower:]')

echo "Creating agent resources in resource group: rg-$RESOURCE_PREFIX-$UNIQUE_SUFFIX"
DEPLOYMENT_NAME="azure-zava-mcp-server-$(date +%Y%m%d%H%M%S)"

# --- Configure models array based on user choice ---
if [ "$INCLUDE_GPT_MODEL" = true ]; then
    MODELS_JSON='[
  {
    "name": "gpt-4o-mini",
    "format": "OpenAI",
    "version": "2024-07-18",
    "skuName": "GlobalStandard",
    "capacity": 120
  },
  {
    "name": "text-embedding-3-small",
    "format": "OpenAI",
    "version": "1",
    "skuName": "GlobalStandard",
    "capacity": 120
  }
]'
else
    MODELS_JSON='[
  {
    "name": "text-embedding-3-small",
    "format": "OpenAI",
    "version": "1",
    "skuName": "GlobalStandard",
    "capacity": 120
  }
]'
fi

echo "Starting Azure deployment..."
if ! az deployment sub create \
  --name "$DEPLOYMENT_NAME" \
  --location "$RG_LOCATION" \
  --template-file main.bicep \
  --parameters '@main.parameters.json' \
  --parameters location="$RG_LOCATION" \
  --parameters resourcePrefix="$RESOURCE_PREFIX" \
  --parameters uniqueSuffix="$UNIQUE_SUFFIX" \
  --parameters models="$MODELS_JSON" \
  --output json > output.json; then
    echo "Deployment failed. Check output.json for details."
    exit 1
fi

if [ ! -f output.json ]; then
    echo "Error: output.json not found."
    exit 1
fi

# Parse JSON output (requires jq)
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed. Please install jq to continue."
    exit 1
fi

# Extract outputs from JSON
PROJECTS_ENDPOINT=$(jq -r '.properties.outputs.projectsEndpoint.value // empty' output.json)
RESOURCE_GROUP_NAME=$(jq -r '.properties.outputs.resourceGroupName.value // empty' output.json)
AI_FOUNDRY_NAME=$(jq -r '.properties.outputs.aiFoundryName.value // empty' output.json)
AI_PROJECT_NAME=$(jq -r '.properties.outputs.aiProjectName.value // empty' output.json)
AZURE_OPENAI_ENDPOINT=$(echo "$PROJECTS_ENDPOINT" | sed 's|api/projects/.*$||')
APPLICATIONINSIGHTS_CONNECTION_STRING=$(jq -r '.properties.outputs.applicationInsightsConnectionString.value // empty' output.json)
APPLICATION_INSIGHTS_NAME=$(jq -r '.properties.outputs.applicationInsightsName.value // empty' output.json)

if [ -z "$PROJECTS_ENDPOINT" ] || [ "$PROJECTS_ENDPOINT" = "null" ]; then
    echo "Error: projectsEndpoint not found. Possible deployment failure."
    exit 1
fi

echo "Getting current Azure subscription..."
SUB_ID=$(az account show --query id -o tsv 2>/dev/null)
if [ -z "$SUB_ID" ]; then
    echo "Error: Could not get current subscription ID. Please login with 'az login'"
    exit 1
fi

# Get subscription name for display
SUB_NAME=$(az account show --query name -o tsv 2>/dev/null)
echo "Using subscription: $SUB_NAME ($SUB_ID)"

# Create service principal
echo "Creating service principal..."
if ! SP_RESULT=$(az ad sp create-for-rbac \
    --name "zava-mcp-server-sp" \
    --role "Cognitive Services OpenAI User" \
    --scopes "/subscriptions/$SUB_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.CognitiveServices/accounts/$AI_FOUNDRY_NAME" \
    --output json 2>/dev/null); then
    echo "Failed to create service principal"
    exit 1
fi

CLIENT_ID=$(echo "$SP_RESULT" | jq -r '.appId // empty')
CLIENT_SECRET=$(echo "$SP_RESULT" | jq -r '.password // empty')
TENANT_ID=$(echo "$SP_RESULT" | jq -r '.tenant // empty')

# Verify we got the values
if [ -z "$CLIENT_ID" ] || [ -z "$CLIENT_SECRET" ] || [ -z "$TENANT_ID" ]; then
    echo "Failed to parse service principal response"
    exit 1
fi

# Write .env for workshop (overwrite)
ENV_FILE_PATH="../.env"

# Ensure directory exists
mkdir -p "$(dirname "$ENV_FILE_PATH")"

# Remove existing .env file if it exists
[ -f "$ENV_FILE_PATH" ] && rm -f "$ENV_FILE_PATH"

# Configure GPT model deployment name based on what was deployed
if [ "$INCLUDE_GPT_MODEL" = true ]; then
    GPT_MODEL_LINE='GPT_MODEL_DEPLOYMENT_NAME="gpt-4o-mini"'
else
    GPT_MODEL_LINE='# GPT_MODEL_DEPLOYMENT_NAME="gpt-4o-mini"  # Not deployed'
fi

cat > "$ENV_FILE_PATH" << EOF
POSTGRES_DB_HOST=pg17
POSTGRES_DB_PORT=5432
POSTGRES_DB="zava"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="change-me"
POSTGRES_APPLICATION_NAME="mcp-server"
PROJECT_ENDPOINT=$PROJECTS_ENDPOINT
AZURE_OPENAI_ENDPOINT=$AZURE_OPENAI_ENDPOINT
$GPT_MODEL_LINE
EMBEDDING_MODEL_DEPLOYMENT_NAME="text-embedding-3-small"
APPLICATIONINSIGHTS_CONNECTION_STRING="$APPLICATIONINSIGHTS_CONNECTION_STRING"
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED="true"
AZURE_CLIENT_ID=$CLIENT_ID
AZURE_CLIENT_SECRET=$CLIENT_SECRET
AZURE_TENANT_ID=$TENANT_ID
AZURE_EXTENSION_USE_DYNAMIC_INSTALL="yes_without_prompt"
EOF

# Write resources summary
RESOURCES_FILE_PATH="../resources.txt"
mkdir -p "$(dirname "$RESOURCES_FILE_PATH")"
[ -f "$RESOURCES_FILE_PATH" ] && rm -f "$RESOURCES_FILE_PATH"

cat > "$RESOURCES_FILE_PATH" << EOF
Azure AI Foundry Resources:
- Resource Group Name: $RESOURCE_GROUP_NAME
- AI Project Name: $AI_PROJECT_NAME
- Foundry Resource Name: $AI_FOUNDRY_NAME
- Application Insights Name: $APPLICATION_INSIGHTS_NAME
EOF

# Clean up output.json
rm -f output.json

echo "Adding Azure AI Developer user role"

# Role assignments
OBJECT_ID=$(az ad signed-in-user show --query id -o tsv)

echo "Ensuring Azure AI Developer role assignment..."
if ROLE_RESULT=$(az role assignment create \
  --role "Azure AI Developer" \
  --assignee "$OBJECT_ID" \
  --scope "/subscriptions/$SUB_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.CognitiveServices/accounts/$AI_FOUNDRY_NAME" 2>&1); then
    echo "✅ Azure AI Developer role assignment created successfully."
elif echo "$ROLE_RESULT" | grep -q "RoleAssignmentExists\|already exists"; then
    echo "✅ Azure AI Developer role assignment already exists."
else
    echo "❌ User role assignment failed with unexpected error:"
    echo "$ROLE_RESULT"
    exit 1
fi

echo "Ensuring Azure AI User role assignment..."
if ROLE_RESULT_USER=$(az role assignment create \
  --assignee "$OBJECT_ID" \
  --role "Azure AI User" \
  --scope "/subscriptions/$SUB_ID/resourceGroups/$RESOURCE_GROUP_NAME" 2>&1); then
    echo "✅ Azure AI User role assignment created successfully."
elif echo "$ROLE_RESULT_USER" | grep -q "RoleAssignmentExists\|already exists"; then
    echo "✅ Azure AI User role assignment already exists."
else
    echo "❌ Azure AI User role assignment failed with unexpected error:"
    echo "$ROLE_RESULT_USER"
    exit 1
fi

echo "Ensuring Azure AI Project Manager role assignment..."
if ROLE_RESULT_MANAGER=$(az role assignment create \
  --assignee "$OBJECT_ID" \
  --role "Azure AI Project Manager" \
  --scope "/subscriptions/$SUB_ID/resourceGroups/$RESOURCE_GROUP_NAME" 2>&1); then
    echo "✅ Azure AI Project Manager role assignment created successfully."
elif echo "$ROLE_RESULT_MANAGER" | grep -q "RoleAssignmentExists\|already exists"; then
    echo "✅ Azure AI Project Manager role assignment already exists."
else
    echo "❌ Azure AI Project Manager role assignment failed with unexpected error:"
    echo "$ROLE_RESULT_MANAGER"
    exit 1
fi

echo ""
echo "🎉 Deployment completed successfully!"
echo ""
echo "📋 Resource Information:"
echo "  Resource Group: $RESOURCE_GROUP_NAME"
echo "  AI Project: $AI_PROJECT_NAME"
echo "  Foundry Resource: $AI_FOUNDRY_NAME"
echo "  Application Insights: $APPLICATION_INSIGHTS_NAME"
echo "  Text Embedding Model Deployment: text-embedding-3-small"
if [ "$INCLUDE_GPT_MODEL" = true ]; then
    echo "  GPT Model Deployment: gpt-4o-mini"
else
    echo "  GPT Model Deployment: Not deployed (skipped by user choice)"
fi
echo ""
