// Container App Environment for hosting the MCP Server
@description('Primary location for all resources')
param location string

@description('Name for the Container App Environment')
param containerAppEnvironmentName string

@description('Log Analytics Workspace ID')
param logAnalyticsWorkspaceId string

@description('Set of tags to apply to all resources')
param tags object = {}

// Container App Environment
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: containerAppEnvironmentName
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: reference(logAnalyticsWorkspaceId, '2023-09-01').customerId
        sharedKey: listKeys(logAnalyticsWorkspaceId, '2023-09-01').primarySharedKey
      }
    }
  }
  tags: tags
}

// Output
output containerAppEnvironmentId string = containerAppEnvironment.id
output containerAppEnvironmentName string = containerAppEnvironment.name