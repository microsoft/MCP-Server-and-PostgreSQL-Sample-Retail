<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:01:56+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "en"
}
-->
# ARM Template Deployment Instructions

This document provides instructions for deploying the MCP Retail Analytics infrastructure using the ARM template.

## 📋 Overview

The `azuredeploy.json` ARM template enables the deployment of:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Deployment Options

### Option 1: Azure CLI Deployment

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### Option 2: PowerShell Deployment

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### Option 3: Azure Portal

1. Go to [Azure Portal](https://portal.azure.com)
2. Search for "Deploy a custom template"
3. Select "Build your own template in the editor"
4. Paste the contents of `azuredeploy.json`
5. Click "Save" and then "Review + create"
6. Provide the required parameters and deploy

## 🔧 Template Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefix for resource names |
| `location` | string | `westus2` | Azure region for deployment |
| `uniqueSuffix` | string | Auto-generated | 4-character unique identifier |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Display name for AI project |
| `aiProjectDescription` | string | Project description | Description shown in Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Token capacity for GPT model |
| `embeddingModelCapacity` | int | `50` | Token capacity for embedding model |
| `tags` | object | Default tags | Resource tags for governance |

## 📤 Template Outputs

The template provides the following outputs:

| Output | Description |
|--------|-------------|
| `subscriptionId` | Azure subscription ID |
| `resourceGroupName` | Created resource group name |
| `aiFoundryName` | Azure AI Foundry service name |
| `foundryEndpoint` | AI service endpoint URL |
| `foundryAccountKey` | AI service access key |
| `deployedModels` | Array of deployed OpenAI models |
| `applicationInsightsConnectionString` | Application Insights connection string |
| `logAnalyticsWorkspaceName` | Log Analytics workspace name |

## 🔍 Verification Commands

After deployment, verify resources:

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM vs Bicep

This project provides both ARM and Bicep templates:

### ARM Template (`azuredeploy.json`)
- ✅ Native Azure Resource Manager format
- ✅ Works everywhere ARM is supported
- ✅ No additional tooling required
- ❌ More verbose JSON syntax
- ❌ Harder to read and maintain

### Bicep Template (`main.bicep`)
- ✅ Modern, clean syntax
- ✅ Better tooling and IntelliSense
- ✅ Easier to read and maintain
- ✅ Compile-time validation
- ❌ Requires Bicep CLI
- ❌ Additional build step

**Recommendation**: Use Bicep templates (`main.bicep`) for development and the ARM template (`azuredeploy.json`) for scenarios requiring pure ARM JSON.

## 🔧 Customization

### Adding Custom Resources

To add additional resources to the ARM template:

1. Add the resource definition to the nested template's `resources` array
2. Add any new parameters to the `parameters` section
3. Add corresponding outputs if needed
4. Update the parameters file with default values

### Example: Adding Storage Account

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Template Validation Errors
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Resource Name Conflicts
- Ensure `uniqueSuffix` is truly unique
- Use `uniqueString()` function for automatic generation
- Check existing resources in the target region

#### 3. Quota Limits
- Verify OpenAI model availability in target region
- Check subscription quotas for AI services
- Consider using different regions if limits are reached

#### 4. Permission Issues
- Ensure account has Contributor role on subscription
- Check that subscription is enabled for AI services
- Verify resource provider registrations

### Debugging Commands

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 Security Considerations

### Access Control
- AI service uses managed identity for secure access
- Resource group provides boundary for RBAC
- Application Insights has separate access controls

### Network Security
- Public network access enabled by default
- Consider private endpoints for production
- Network ACLs can be configured for additional security

### Key Management
- AI service keys are auto-generated
- Use Azure Key Vault for production secrets
- Rotate keys regularly for security

## 📚 Next Steps

After successful deployment:

1. **Configure Environment Variables**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Start MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Test Integration**:
   - Open VS Code with the project
   - Configure MCP servers in `.vscode/mcp.json`
   - Test AI Chat with retail data queries

4. **Monitor Performance**:
   - View metrics in Application Insights
   - Check logs in Log Analytics workspace
   - Set up alerts for important events

---

For more information, see the [main README](../README.md) or [QUICKSTART guide](../QUICKSTART.md).

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may contain errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is recommended. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.