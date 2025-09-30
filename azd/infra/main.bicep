// Azure Developer CLI compatible Bicep template for MCP Retail Analytics
targetScope = 'subscription'

@description('Name of the environment (e.g., dev, test, prod)')
param environmentName string

@description('Primary location for all resources')
param location string

@description('Friendly name for your Azure AI resource')
param aiProjectFriendlyName string = 'MCP Retail Analytics Project'

@description('Description of your Azure AI resource displayed in Azure AI Foundry')
param aiProjectDescription string = 'MCP Server for Retail Sales Analysis with PostgreSQL integration'

@description('Capacity for the GPT-4o-mini model deployment')
param gptModelCapacity int = 120

@description('Capacity for the text-embedding-3-small model deployment')
param embeddingModelCapacity int = 50

@description('Set of tags to apply to all resources')
param tags object = {
  'azd-env-name': environmentName
  source: 'Azure Developer CLI - MCP Retail Sample'
  environment: 'development'
  project: 'mcp-retail-analytics'
}

// Generate unique suffix from subscription ID
var uniqueSuffix = substring(uniqueString(subscription().subscriptionId), 0, 4)
var resourceGroupName = 'rg-${environmentName}'
var aiProjectName = 'prj-${environmentName}-${uniqueSuffix}'
var foundryResourceName = 'fdy-${environmentName}-${uniqueSuffix}'
var applicationInsightsName = 'appi-${environmentName}-${uniqueSuffix}'
var logAnalyticsWorkspaceName = 'law-${environmentName}-${uniqueSuffix}'
var containerAppEnvironmentName = 'cae-${environmentName}-${uniqueSuffix}'

// Create resource group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

// Deploy infrastructure resources
module infrastructure 'modules/main-resources.bicep' = {
  name: 'infrastructure'
  scope: resourceGroup
  params: {
    location: location
    foundryResourceName: foundryResourceName
    applicationInsightsName: applicationInsightsName
    logAnalyticsWorkspaceName: logAnalyticsWorkspaceName
    gptModelCapacity: gptModelCapacity
    embeddingModelCapacity: embeddingModelCapacity
    tags: tags
  }
}

// Deploy Container App Environment
module containerAppEnv 'modules/container-app-environment.bicep' = {
  name: 'container-app-environment'
  scope: resourceGroup
  dependsOn: [infrastructure]
  params: {
    location: location
    containerAppEnvironmentName: containerAppEnvironmentName
    logAnalyticsWorkspaceId: infrastructure.outputs.logAnalyticsWorkspaceId
    tags: tags
  }
}

// Outputs for azd
output AZURE_RESOURCE_GROUP string = resourceGroup.name
output AZURE_LOCATION string = location
output AZURE_OPENAI_ENDPOINT string = infrastructure.outputs.foundryEndpoint
output AZURE_OPENAI_API_KEY string = infrastructure.outputs.foundryAccountKey
output AZURE_OPENAI_DEPLOYMENT_NAME string = 'gpt-4o-mini'
output AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME string = 'text-embedding-3-small'
output APPLICATIONINSIGHTS_CONNECTION_STRING string = infrastructure.outputs.applicationInsightsConnectionString
output AI_FOUNDRY_NAME string = foundryResourceName
output AI_PROJECT_NAME string = aiProjectName
output LOG_ANALYTICS_WORKSPACE_NAME string = logAnalyticsWorkspaceName
output AZURE_CONTAINER_APP_ENVIRONMENT_ID string = containerAppEnv.outputs.containerAppEnvironmentId
output AZURE_CONTAINER_APP_ENVIRONMENT_NAME string = containerAppEnv.outputs.containerAppEnvironmentName