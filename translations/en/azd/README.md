<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:18:47+00:00",
  "source_file": "azd/README.md",
  "language_code": "en"
}
-->
# Azure Developer CLI (azd) Quick Start

## 🚀 Deploy with Azure Developer CLI

This project is now fully compatible with Azure Developer CLI (azd) for automated deployment of both infrastructure and the MCP server application.

### Prerequisites

1. **Install Azure Developer CLI**:
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **Login to Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 One-Command Deployment

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 Development Workflow

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 What Gets Deployed

#### **Infrastructure**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (with OpenAI models)
- Container App Environment

#### **Application**
- MCP Server (Container App)
- Health monitoring enabled
- Environment variables configured
- Application Insights integration

### 🌍 Environment Variables

After deployment, these variables are automatically available:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitoring & Management

- **Azure Portal**: View all resources in your resource group
- **Application Insights**: Monitor application performance and logs
- **Container Apps**: View application logs and metrics
- **AI Studio**: Manage OpenAI model deployments

### 📋 Troubleshooting

#### **Common Issues**

1. **Location not supported**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Resource quotas exceeded**:
   - Check your subscription limits in Azure Portal
   - Try a different region

3. **Authentication issues**:
   ```bash
   azd auth login --use-device-code
   ```

4. **View deployment logs**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternative: Manual Deployment

If you prefer manual deployment, you can still use the infrastructure in the `/infra` folder:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Learn More

- [Azure Developer CLI Documentation](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Documentation](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Documentation](https://docs.microsoft.com/azure/ai-services/)

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may contain errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is recommended. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.