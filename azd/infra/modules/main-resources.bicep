// Bicep module for main infrastructure resources
@description('Primary location for all resources')
param location string

@description('Name for the Azure AI Foundry resource')
param foundryResourceName string

@description('Name for Application Insights')
param applicationInsightsName string

@description('Name for Log Analytics Workspace')
param logAnalyticsWorkspaceName string

@description('Capacity for the GPT-4o-mini model deployment')
param gptModelCapacity int = 120

@description('Capacity for the text-embedding-3-small model deployment')
param embeddingModelCapacity int = 50

@description('Set of tags to apply to all resources')
param tags object = {}

// Log Analytics Workspace
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    features: {
      searchVersion: 1
      legacy: 0
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
  tags: tags
}

// Application Insights
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
  tags: tags
}

// Azure AI Services (Foundry)
resource aiFoundry 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: foundryResourceName
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'AIServices'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    customSubDomainName: foundryResourceName
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
    disableLocalAuth: false
  }
  tags: tags
}

// GPT-4o-mini Model Deployment
resource gptModelDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: aiFoundry
  name: 'gpt-4o-mini'
  sku: {
    capacity: gptModelCapacity
    name: 'Standard'
  }
  properties: {
    model: {
      name: 'gpt-4o-mini'
      format: 'OpenAI'
      version: '2024-07-18'
    }
    versionUpgradeOption: 'OnceNewDefaultVersionAvailable'
  }
}

// Text Embedding Model Deployment
resource embeddingModelDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: aiFoundry
  name: 'text-embedding-3-small'
  dependsOn: [gptModelDeployment]
  sku: {
    capacity: embeddingModelCapacity
    name: 'Standard'
  }
  properties: {
    model: {
      name: 'text-embedding-3-small'
      format: 'OpenAI'
      version: '1'
    }
    versionUpgradeOption: 'OnceNewDefaultVersionAvailable'
  }
}

// Outputs
output foundryAccountName string = aiFoundry.name
output foundryAccountKey string = aiFoundry.listKeys().key1
output foundryEndpoint string = aiFoundry.properties.endpoint
output applicationInsightsConnectionString string = applicationInsights.properties.ConnectionString
output applicationInsightsInstrumentationKey string = applicationInsights.properties.InstrumentationKey
output logAnalyticsWorkspaceId string = logAnalyticsWorkspace.id