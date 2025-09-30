<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:19:07+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "en"
}
-->
# Infrastructure Templates

This folder contains the infrastructure deployment templates for the MCP Retail Analytics project.

## 📁 Files Overview

| File | Description | Use Case |
|------|-------------|----------|
| `azuredeploy.json` | **ARM template** - Complete subscription-scoped deployment | Recommended for all deployments |
| `azuredeploy.parameters.json` | **ARM parameters** - Static configuration values | Used with `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM deployment guide** - Detailed instructions | Complete deployment documentation |
| `README.md` | **This file** - Infrastructure overview | Quick reference |

## 🚀 Deployment Options

### Option 1: Azure CLI (Recommended)
Complete deployment with resource group creation:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Option 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Option 3: Azure Portal
1. Navigate to [Azure Portal](https://portal.azure.com)
2. Search for "Deploy a custom template"
3. Upload `azuredeploy.json`
4. Configure parameters and deploy

## 🏗️ Infrastructure Components

The ARM template deploys the following infrastructure:

- **Resource Group**: Container for all resources with consistent naming
- **Log Analytics Workspace**: Central logging and monitoring (30-day retention)
- **Application Insights**: Application performance monitoring integrated with Log Analytics
- **Azure AI Services**: Multi-service AI hub (S0 tier) with managed identity
- **OpenAI Models**:
  - `gpt-4o-mini` (120 capacity) - Chat and completion model
  - `text-embedding-3-small` (50 capacity) - Text embeddings for semantic search

## 🔧 Template Configuration

### Parameters
The ARM template accepts the following customizable parameters:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Prefix for all resource names |
| `location` | `westus2` | Azure region for deployment |
| `uniqueSuffix` | Auto-generated | 4-character unique identifier |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Display name |
| `gptModelCapacity` | `120` | GPT model token capacity |
| `embeddingModelCapacity` | `50` | Embedding model capacity |

### Resource Naming Convention
All resources follow the pattern: `{type}-{resourcePrefix}-{uniqueSuffix}`

Examples:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Template Validation

### Validate Before Deployment
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Check Deployment Status
```bash
az deployment sub list --output table
```

## 💰 Cost Estimation

Estimated monthly costs for development workload:

| Service | Configuration | Est. Cost/Month |
|---------|---------------|-----------------|
| Azure AI Services | S0 tier | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Basic monitoring | $5-15 |
| Log Analytics | 1GB/month | $2-5 |
| **Total** | | **$42-115** |

## 📚 Additional Resources

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detailed deployment guide with troubleshooting
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - File validation results

## 🆘 Quick Troubleshooting

### Common Issues
- **Authentication**: Run `az login` to authenticate
- **Quota Limits**: Check OpenAI model availability in target region
- **Naming Conflicts**: Use a different `uniqueSuffix` parameter
- **Permissions**: Ensure account has Contributor role on subscription

### Get Help
- See [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) for detailed troubleshooting
- Check deployment logs in Azure Portal
- Visit [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

For complete project setup, see the [main README](../../README.md) or [project walkthrough](../../walkthrough/README.md).

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may contain errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is recommended. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.