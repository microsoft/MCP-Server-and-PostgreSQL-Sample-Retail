#!/usr/bin/env pwsh

# Simple Azure Service Principal Creator for Workshop
# Usage: ./create_sp.ps1 (no parameters needed)

param()

# Check if any parameters were passed
if ($args.Count -gt 0) {
    Write-Host "This script does not accept any parameters." -ForegroundColor Red
    Write-Host "Usage: scripts/create_sp.ps1" -ForegroundColor Blue
    Write-Host ""
    Write-Host "The script will automatically:" -ForegroundColor Blue
    Write-Host "  - Use your current Azure subscription" -ForegroundColor Blue
    Write-Host "  - List available Azure AI Services" -ForegroundColor Blue
    Write-Host "  - Let you select which one to configure" -ForegroundColor Blue
    exit 1
}

# Function to display colored output
function Write-Log {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    
    switch ($Color) {
        "DarkYellow" { Write-Host $Message -ForegroundColor DarkYellow }
        "Green" { Write-Host $Message -ForegroundColor Green }
        "Blue" { Write-Host $Message -ForegroundColor Blue }
        "Red" { Write-Host $Message -ForegroundColor Red }
        default { Write-Host $Message }
    }
}

# Check if Azure CLI is installed first
try {
    $null = Get-Command az -ErrorAction Stop
}
catch {
    Write-Log "❌ Error: Azure CLI is not installed or not in PATH" "Red"
    Write-Host ""
    Write-Host "To install Azure CLI:"
    Write-Host "  Windows: Download from https://aka.ms/installazurecliwindows"
    Write-Host "  macOS: brew install azure-cli"
    Write-Host "  Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"
    Write-Host ""
    Write-Host "Or visit: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
    exit 1
}

# Check if running from project root
if (!(Test-Path "docker-compose.yml") -or !(Test-Path "scripts" -PathType Container)) {
    Write-Log "Error: This script must be run from the project root directory" "Red"
    Write-Log "Current directory: $(Get-Location)" "DarkYellow"
    Write-Log "Expected to find: docker-compose.yml and scripts/ directory" "DarkYellow"
    Write-Host ""
    Write-Log "Usage: scripts/create_sp.ps1" "Blue"
    exit 1
}

# Function to show usage
function Show-Usage {
    Write-Host "Usage: scripts/create_sp.ps1"
    Write-Host ""
    Write-Host "Note: Run this script from the project root directory"
    Write-Host "Uses your current Azure subscription (run 'az account show' to check)"
    Write-Host ""
    Write-Host "This script will:"
    Write-Host "  1. List all Azure AI Services in your current subscription"
    Write-Host "  2. Allow you to select which service to use"
    Write-Host "  3. Create a service principal with proper permissions"
    Write-Host "  4. Update the .env file with the credentials"
    exit 1
}

# Check if user is logged in to Azure CLI
Write-Log "Checking Azure CLI authentication..." "DarkYellow"
try {
    $accountInfo = az account show 2>$null | ConvertFrom-Json
    if (!$accountInfo) {
        throw "Not logged in"
    }
}
catch {
    Write-Log "❌ Error: Not logged into Azure CLI" "Red"
    Write-Host ""
    Write-Host "Please login first:"
    Write-Host "  az login"
    Write-Host ""
    Write-Host "Then run this script again."
    exit 1
}

# Get current subscription ID
Write-Log "Getting current Azure subscription..." "DarkYellow"
try {
    $SubId = az account show --query id -o tsv 2>$null
    if (!$SubId) {
        throw "Could not get subscription ID"
    }
    
    # Get subscription name for display
    $SubName = az account show --query name -o tsv 2>$null
    Write-Log "Using subscription: $SubName ($SubId)" "Blue"
}
catch {
    Write-Log "Error: Could not get current subscription ID. Please login with 'az login'" "Red"
    exit 1
}

# List all Azure AI Services
Write-Log "Fetching Azure AI Services..." "DarkYellow"
try {
    $aiServicesJson = az cognitiveservices account list --query "[?kind=='AIServices'].{name:name, resourceGroup:resourceGroup, endpoint:properties.endpoint}" --output json 2>$null
    $aiServices = $aiServicesJson | ConvertFrom-Json
    
    if (!$aiServices -or $aiServices.Count -eq 0) {
        Write-Log "No Azure AI Services found in subscription $SubId" "Red"
        Write-Log "Make sure you have Azure OpenAI resources deployed and accessible." "DarkYellow"
        exit 1
    }
}
catch {
    Write-Log "Error fetching Azure AI Services" "Red"
    exit 1
}

# Display services and let user select
Write-Log "Available Azure AI Services:" "Green"
for ($i = 0; $i -lt $aiServices.Count; $i++) {
    $service = $aiServices[$i]
    Write-Host "$($i + 1). $($service.name) (Resource Group: $($service.resourceGroup))"
}

# Get user selection
Write-Host ""
do {
    $selection = Read-Host "Select a service by number"
    $selectionInt = 0
    $validSelection = [int]::TryParse($selection, [ref]$selectionInt) -and 
                     $selectionInt -ge 1 -and 
                     $selectionInt -le $aiServices.Count
    
    if (!$validSelection) {
        Write-Log "Invalid selection. Please enter a number between 1 and $($aiServices.Count)." "Red"
    }
} while (!$validSelection)

# Extract selected service details
$selectedService = $aiServices[$selectionInt - 1]
$aiFoundryName = $selectedService.name
$ResourceGroup = $selectedService.resourceGroup
$endpoint = $selectedService.endpoint

Write-Log "Selected service:" "Green"
Write-Log "  Name: $aiFoundryName" "Blue"
Write-Log "  Resource Group: $ResourceGroup" "Blue"
Write-Log "  Endpoint: $endpoint" "Blue"
Write-Host ""

Write-Log "Creating Azure Service Principal..." "DarkYellow"

# Create service principal
try {
    $spResultJson = az ad sp create-for-rbac `
        --name "zava-mcp-server-sp" `
        --role "Cognitive Services OpenAI User" `
        --scopes "/subscriptions/$SubId/resourceGroups/$ResourceGroup/providers/Microsoft.CognitiveServices/accounts/$aiFoundryName" `
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
    Write-Log "Failed to create service principal: $($_.Exception.Message)" "Red"
    exit 1
}

# Update .env file with Azure Service Principal credentials
$ENV_FILE = ".env"

try {
    # Read existing .env file content (if it exists)
    $envContent = @()
    if (Test-Path $ENV_FILE) {
        $envContent = Get-Content $ENV_FILE | Where-Object { 
            $_ -notmatch '^AZURE_CLIENT_ID=' -and 
            $_ -notmatch '^AZURE_CLIENT_SECRET=' -and 
            $_ -notmatch '^AZURE_TENANT_ID=' -and 
            $_ -notmatch '^AZURE_OPENAI_ENDPOINT='
        }
    }
    
    # Add new Azure Service Principal credentials
    $newCredentials = @(
        "AZURE_CLIENT_ID=`"$clientId`"",
        "AZURE_CLIENT_SECRET=`"$clientSecret`"",
        "AZURE_TENANT_ID=`"$tenantId`"",
        "AZURE_OPENAI_ENDPOINT=`"$endpoint`""
    )
    
    # Combine existing content with new credentials
    $finalContent = $envContent + $newCredentials
    
    # Write to .env file
    $finalContent | Set-Content $ENV_FILE -Encoding UTF8
}
catch {
    Write-Log "Failed to update .env file: $($_.Exception.Message)" "Red"
    exit 1
}

# Display results
Write-Log "✓ SUCCESS!" "Green"
Write-Host ""
Write-Log "Azure Service Principal credentials updated in .env file:" "Blue"
Write-Log "AZURE_CLIENT_ID: $clientId"
Write-Log "AZURE_CLIENT_SECRET: [HIDDEN]"
Write-Log "AZURE_TENANT_ID: $tenantId"
Write-Log "AZURE_OPENAI_ENDPOINT: $endpoint"
Write-Host ""
Write-Log "✓ Environment file updated: $ENV_FILE" "Green"
