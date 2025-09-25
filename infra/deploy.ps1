Write-Host "Deploying the Azure resources..."

# --- Prompt for GPT model deployment ---
$deployGpt = Read-Host "Do you want to deploy the GPT-4o-mini model? (y/N)"
$includeGptModel = $deployGpt -match '^[Yy]'

# --- Parameters (match deploy.sh) ---
$RG_LOCATION = "westus"
$AI_PROJECT_FRIENDLY_NAME = "Zava Agent Service Workshop"
$RESOURCE_PREFIX = "zava-mcp-server"
# unique suffix: lowercase letters + digits, 4 chars (similar to deploy.sh)
$UNIQUE_SUFFIX = -join ((97..122) + (48..57) | Get-Random -Count 4 | ForEach-Object { [char]$_ })

Write-Host "Creating agent resources in resource group: rg-$RESOURCE_PREFIX-$UNIQUE_SUFFIX"
$DEPLOYMENT_NAME = "azure-zava-mcp-server-$(Get-Date -Format 'yyyyMMddHHmmss')"

# --- Configure models array based on user choice ---
$modelsJson = if ($includeGptModel) {
    Write-Host "Including both GPT-4o-mini and text-embedding-3-small models"
    @'
[
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
]
'@
} else {
    Write-Host "Including only text-embedding-3-small model"
    @'
[
  {
    "name": "text-embedding-3-small",
    "format": "OpenAI",
    "version": "1",
    "skuName": "GlobalStandard",
    "capacity": 120
  }
]
'@
}

Write-Host "Starting Azure deployment..."
az deployment sub create `
  --name "$DEPLOYMENT_NAME" `
  --location "$RG_LOCATION" `
  --template-file main.bicep `
  --parameters '@main.parameters.json' `
  --parameters location="$RG_LOCATION" `
  --parameters resourcePrefix="$RESOURCE_PREFIX" `
  --parameters uniqueSuffix="$UNIQUE_SUFFIX" `
  --parameters models="$modelsJson" `
  --output json | Out-File -FilePath output.json -Encoding utf8

if ($LASTEXITCODE -ne 0) {
    Write-Host "Deployment failed. Check output.json for details." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path -Path output.json)) {
    Write-Host "Error: output.json not found." -ForegroundColor Red
    exit 1
}

try {
    $jsonData = Get-Content output.json -Raw | ConvertFrom-Json
} catch {
    Write-Host "Failed to parse output.json" -ForegroundColor Red
    Write-Host $_.Exception.Message
    exit 1
}

$outputs = $jsonData.properties.outputs

$PROJECTS_ENDPOINT = $outputs.projectsEndpoint.value
$RESOURCE_GROUP_NAME = $outputs.resourceGroupName.value
$SUBSCRIPTION_ID = $outputs.subscriptionId.value
$AI_FOUNDRY_NAME = $outputs.aiFoundryName.value
$AI_PROJECT_NAME = $outputs.aiProjectName.value
$AZURE_OPENAI_ENDPOINT = ($PROJECTS_ENDPOINT -replace 'api/projects/.*$','')
$APPLICATIONINSIGHTS_CONNECTION_STRING = $outputs.applicationInsightsConnectionString.value
$APPLICATION_INSIGHTS_NAME = $outputs.applicationInsightsName.value

if ([string]::IsNullOrEmpty($PROJECTS_ENDPOINT) -or $PROJECTS_ENDPOINT -eq 'null') {
    Write-Host "Error: projectsEndpoint not found. Possible deployment failure." -ForegroundColor Red
    exit 1
}

Write-Host "Getting current Azure subscription..." -ForegroundColor DarkYellow
try {
    $SubId = az account show --query id -o tsv 2>$null
    if (!$SubId) {
        throw "Could not get subscription ID"
    }
    
    # Get subscription name for display
    $SubName = az account show --query name -o tsv 2>$null
    Write-Host "Using subscription: $SubName ($SubId)" -ForegroundColor Blue
}
catch {
    Write-Host "Error: Could not get current subscription ID. Please login with 'az login'" -ForegroundColor Red
    exit 1
}


# Create service principal
try {
    $spResultJson = az ad sp create-for-rbac `
        --name "zava-mcp-server-sp" `
        --role "Cognitive Services OpenAI User" `
        --scopes "/subscriptions/$SubId/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.CognitiveServices/accounts/$AI_FOUNDRY_NAME" `
        --output json 2>$null
    
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to create service principal"
    }
    
    $spResult = $spResultJson | ConvertFrom-Json
    $clientId = $spResult.appId
    $clientSecret = $spResult.password
    $tenantId = $spResult.tenant
    
    # Verify we got the values
    if (!$clientId -or !$clientSecret -or !$tenantId) {
        throw "Failed to parse service principal response"
    }
}
catch {
    Write-Host "Failed to create service principal: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Write .env for workshop (overwrite)
$ENV_FILE_PATH = "../.env"

# Ensure directory exists
$envDir = Split-Path -Parent $ENV_FILE_PATH
if (-not (Test-Path $envDir)) { New-Item -ItemType Directory -Path $envDir -Force | Out-Null }

if (Test-Path $ENV_FILE_PATH) { Remove-Item -Path $ENV_FILE_PATH -Force }

# Write .env for workshop (overwrite)
$ENV_FILE_PATH = "../.env"

# Ensure directory exists
$envDir = Split-Path -Parent $ENV_FILE_PATH
if (-not (Test-Path $envDir)) { New-Item -ItemType Directory -Path $envDir -Force | Out-Null }

if (Test-Path $ENV_FILE_PATH) { Remove-Item -Path $ENV_FILE_PATH -Force }

# Configure GPT model deployment name based on what was deployed
$gptModelLine = if ($includeGptModel) {
    'GPT_MODEL_DEPLOYMENT_NAME="gpt-4o-mini"'
} else {
    '# GPT_MODEL_DEPLOYMENT_NAME="gpt-4o-mini"  # Not deployed'
}

@"
POSTGRES_DB_HOST=pg17
POSTGRES_DB_PORT=5432
POSTGRES_DB="zava"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="change-me"
POSTGRES_APPLICATION_NAME="mcp-server"
PROJECT_ENDPOINT=$PROJECTS_ENDPOINT
AZURE_OPENAI_ENDPOINT=$AZURE_OPENAI_ENDPOINT
$gptModelLine
EMBEDDING_MODEL_DEPLOYMENT_NAME="text-embedding-3-small"
APPLICATIONINSIGHTS_CONNECTION_STRING="$APPLICATIONINSIGHTS_CONNECTION_STRING"
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED="true"
AZURE_CLIENT_ID=$clientId
AZURE_CLIENT_SECRET=$clientSecret
AZURE_TENANT_ID=$tenantId
AZURE_EXTENSION_USE_DYNAMIC_INSTALL="yes_without_prompt"
"@ | Out-File -FilePath $ENV_FILE_PATH -Encoding utf8

# Write resources summary
$RESOURCES_FILE_PATH = "../resources.txt"
$resDir = Split-Path -Parent $RESOURCES_FILE_PATH
if (-not (Test-Path $resDir)) { New-Item -ItemType Directory -Path $resDir -Force | Out-Null }
if (Test-Path $RESOURCES_FILE_PATH) { Remove-Item -Path $RESOURCES_FILE_PATH -Force }

@(
  "Azure AI Foundry Resources:",
  "- Resource Group Name: $RESOURCE_GROUP_NAME",
  "- AI Project Name: $AI_PROJECT_NAME",
  "- Foundry Resource Name: $AI_FOUNDRY_NAME",
  "- Application Insights Name: $APPLICATION_INSIGHTS_NAME"
) | Out-File -FilePath $RESOURCES_FILE_PATH -Encoding utf8


# Clean up output.json
Remove-Item -Path output.json -ErrorAction SilentlyContinue

Write-Host "Adding Azure AI Developer user role"

# Role assignments
$objectId = az ad signed-in-user show --query id -o tsv

Write-Host "Ensuring Azure AI Developer role assignment..."
try {
    $roleResult = az role assignment create `
      --role "Azure AI Developer" `
      --assignee "$objectId" `
      --scope "/subscriptions/$SubId/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.CognitiveServices/accounts/$AI_FOUNDRY_NAME" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Azure AI Developer role assignment created successfully."
    } elseif ($roleResult -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI Developer role assignment already exists."
    } else {
        Write-Host "❌ User role assignment failed with unexpected error:"; Write-Host $roleResult; exit 1
    }
} catch {
    $err = $_.Exception.Message
    if ($err -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI Developer role assignment already exists."
    } else {
        Write-Host "❌ User role assignment failed: $err"; exit 1
    }
}

Write-Host "Ensuring Azure AI User role assignment..."
try {
    $roleResultUser = az role assignment create `
      --assignee "$objectId" `
      --role "Azure AI User" `
      --scope "/subscriptions/$SubId/resourceGroups/$RESOURCE_GROUP_NAME" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Azure AI User role assignment created successfully."
    } elseif ($roleResultUser -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI User role assignment already exists."
    } else {
        Write-Host "❌ Azure AI User role assignment failed with unexpected error:"; Write-Host $roleResultUser; exit 1
    }
} catch {
    $err = $_.Exception.Message
    if ($err -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI User role assignment already exists."
    } else {
        Write-Host "❌ Azure AI User role assignment failed: $err"; exit 1
    }
}

Write-Host "Ensuring Azure AI Project Manager role assignment..."
try {
    $roleResultManager = az role assignment create `
      --assignee "$objectId" `
      --role "Azure AI Project Manager" `
      --scope "/subscriptions/$SubId/resourceGroups/$RESOURCE_GROUP_NAME" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Azure AI Project Manager role assignment created successfully."
    } elseif ($roleResultManager -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI Project Manager role assignment already exists."
    } else {
        Write-Host "❌ Azure AI Project Manager role assignment failed with unexpected error:"; Write-Host $roleResultManager; exit 1
    }
} catch {
    $err = $_.Exception.Message
    if ($err -match 'RoleAssignmentExists|already exists') {
        Write-Host "✅ Azure AI Project Manager role assignment already exists."
    } else {
        Write-Host "❌ Azure AI Project Manager role assignment failed: $err"; exit 1
    }
}

Write-Host ""
Write-Host "🎉 Deployment completed successfully!"
Write-Host ""
Write-Host "📋 Resource Information:"
Write-Host "  Resource Group: $RESOURCE_GROUP_NAME"
Write-Host "  AI Project: $AI_PROJECT_NAME"
Write-Host "  Foundry Resource: $AI_FOUNDRY_NAME"
Write-Host "  Application Insights: $APPLICATION_INSIGHTS_NAME"
Write-Host "  Text Embedding Model Deployment: text-embedding-3-small"
if ($includeGptModel) {
    Write-Host "  GPT Model Deployment: gpt-4o-mini"
} else {
    Write-Host "  GPT Model Deployment: Not deployed (skipped by user choice)"
}
Write-Host ""
