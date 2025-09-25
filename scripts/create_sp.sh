#!/bin/bash

# Simple Azure Service Principal Creator for Workshop
# Usage: ./create_sp.sh (no parameters needed)

# Check if Azure CLI is installed first
if ! command -v az &> /dev/null; then
    echo "❌ Error: Azure CLI is not installed or not in PATH"
    echo ""
    echo "To install Azure CLI on macOS:"
    echo "  brew install azure-cli"
    echo ""
    echo "Or visit: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
    exit 1
fi

# Check if any parameters were passed
if [ $# -gt 0 ]; then
    echo "This script does not accept any parameters."
    echo "Usage: scripts/create_sp.sh"
    echo ""
    echo "The script will automatically:"
    echo "  - Use your current Azure subscription"
    echo "  - List available Azure AI Services"
    echo "  - Let you select which one to configure"
    exit 1
fi

# Function to display colored output
Log() {
    local message="$1"
    local color="$2"
    
    case $color in
        "Orange") echo -e "\033[38;5;208m$message\033[0m" ;;  # Orange (readable on both backgrounds)
        "Green") echo -e "\033[32m$message\033[0m" ;;
        "Blue") echo -e "\033[34m$message\033[0m" ;;  # Blue instead of Cyan
        "Red") echo -e "\033[31m$message\033[0m" ;;
        *) echo "$message" ;;
    esac
}

# Check if running from project root
if [ ! -f "docker-compose.yml" ] || [ ! -d "scripts" ]; then
    echo -e "\033[31mError: This script must be run from the project root directory\033[0m"
    echo -e "\033[38;5;208mCurrent directory: $(pwd)\033[0m"
    echo -e "\033[38;5;208mExpected to find: docker-compose.yml and scripts/ directory\033[0m"
    echo ""
    echo -e "\033[34mUsage: scripts/create_sp.sh\033[0m"
    exit 1
fi

# Function to show usage
usage() {
    echo "Usage: scripts/create_sp.sh"
    echo ""
    echo "Note: Run this script from the project root directory"
    echo "Uses your current Azure subscription (run 'az account show' to check)"
    echo ""
    echo "This script will:"
    echo "  1. List all Azure AI Services in your current subscription"
    echo "  2. Allow you to select which service to use"
    echo "  3. Create a service principal with proper permissions"
    echo "  4. Update the .env file with the credentials"
    exit 1
}

# Check if user is logged in to Azure CLI
Log "Checking Azure CLI authentication..." "Orange"
if ! az account show &>/dev/null; then
    Log "❌ Error: Not logged into Azure CLI" "Red"
    echo ""
    echo "Please login first:"
    echo "  az login"
    echo ""
    echo "Then run this script again."
    exit 1
fi

# Get current subscription ID
Log "Getting current Azure subscription..." "Orange"
SubId=$(az account show --query id -o tsv 2>/dev/null)
if [ -z "$SubId" ]; then
    Log "Error: Could not get current subscription ID. Please login with 'az login'" "Red"
    exit 1
fi

# Get subscription name for display
SubName=$(az account show --query name -o tsv 2>/dev/null)
Log "Using subscription: $SubName ($SubId)" "Blue"

# List all Azure AI Services
Log "Fetching Azure AI Services..." "Orange"
aiServices=$(az cognitiveservices account list --query "[?kind=='AIServices'].{name:name, resourceGroup:resourceGroup, endpoint:properties.endpoint}" --output json)

if [ -z "$aiServices" ] || [ "$aiServices" = "[]" ]; then
    Log "No Azure AI Services found in subscription $SubId" "Red"
    Log "Make sure you have Azure OpenAI resources deployed and accessible." "Orange"
    exit 1
fi

# Display services and let user select
Log "Available Azure AI Services:" "Green"
echo "$aiServices" | jq -r '.[] | "\(.name) (Resource Group: \(.resourceGroup))"' | nl -w2 -s'. '

# Get user selection
echo ""
read -p "Select a service by number: " selection

# Validate selection
serviceCount=$(echo "$aiServices" | jq length)
if ! [[ "$selection" =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt "$serviceCount" ]; then
    Log "Invalid selection. Please run the script again." "Red"
    exit 1
fi

# Extract selected service details
selectedService=$(echo "$aiServices" | jq ".[$((selection-1))]")
aiFoundryName=$(echo "$selectedService" | jq -r '.name')
ResourceGroup=$(echo "$selectedService" | jq -r '.resourceGroup')
endpoint=$(echo "$selectedService" | jq -r '.endpoint')

Log "Selected service:" "Green"
Log "  Name: $aiFoundryName" "Blue"
Log "  Resource Group: $ResourceGroup" "Blue" 
Log "  Endpoint: $endpoint" "Blue"
Log "" ""

Log "Creating Azure Service Principal..." "Orange"

# Create service principal
spResult=$(az ad sp create-for-rbac \
    --name "zava-mcp-server-sp" \
    --role "Cognitive Services OpenAI User" \
    --scopes "/subscriptions/$SubId/resourceGroups/$ResourceGroup/providers/Microsoft.CognitiveServices/accounts/$aiFoundryName" \
    --output json)

if [ $? -ne 0 ]; then
    Log "Failed to create service principal" "Red"
    exit 1
fi

# Parse JSON result using jq (fallback to basic parsing if jq not available)
if command -v jq &> /dev/null; then
    clientId=$(echo "$spResult" | jq -r '.appId')
    clientSecret=$(echo "$spResult" | jq -r '.password')
    tenantId=$(echo "$spResult" | jq -r '.tenant')
else
    # Basic parsing without jq (less robust but works)
    clientId=$(echo "$spResult" | grep -o '"appId": "[^"]*"' | cut -d'"' -f4)
    clientSecret=$(echo "$spResult" | grep -o '"password": "[^"]*"' | cut -d'"' -f4)
    tenantId=$(echo "$spResult" | grep -o '"tenant": "[^"]*"' | cut -d'"' -f4)
fi

# Verify we got the values
if [ -z "$clientId" ] || [ -z "$clientSecret" ] || [ -z "$tenantId" ]; then
    Log "Failed to parse service principal response" "Red"
    exit 1
fi

# Update .env file with Azure Service Principal credentials
ENV_FILE=".env"

# Remove existing Azure credentials from .env file
sed -i.bak '/^AZURE_CLIENT_ID=/d; /^AZURE_CLIENT_SECRET=/d; /^AZURE_TENANT_ID=/d; /^AZURE_OPENAI_ENDPOINT=/d' "$ENV_FILE" 2>/dev/null || true

# Add new Azure Service Principal credentials to .env file
{
    echo "AZURE_CLIENT_ID=\"$clientId\""
    echo "AZURE_CLIENT_SECRET=\"$clientSecret\""
    echo "AZURE_TENANT_ID=\"$tenantId\""
    echo "AZURE_OPENAI_ENDPOINT=\"$endpoint\""
} >> "$ENV_FILE"

# Display results
Log "✓ SUCCESS!" "Green"
Log ""
Log "Azure Service Principal credentials updated in .env file:" "Blue"
Log "AZURE_CLIENT_ID: $clientId"
Log "AZURE_CLIENT_SECRET: [HIDDEN]"
Log "AZURE_TENANT_ID: $tenantId"
Log "AZURE_OPENAI_ENDPOINT: $endpoint"
Log ""
Log "✓ Environment file updated: $ENV_FILE" "Green"