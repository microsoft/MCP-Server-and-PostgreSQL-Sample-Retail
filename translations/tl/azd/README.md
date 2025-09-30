<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:31+00:00",
  "source_file": "azd/README.md",
  "language_code": "tl"
}
-->
# Azure Developer CLI (azd) Mabilisang Pagsisimula

## 🚀 Mag-deploy gamit ang Azure Developer CLI

Ang proyektong ito ay ganap nang compatible sa Azure Developer CLI (azd) para sa awtomatikong pag-deploy ng parehong infrastructure at MCP server application.

### Mga Kinakailangan

1. **I-install ang Azure Developer CLI**:
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

2. **Mag-login sa Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Isang Utos na Pag-deploy

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

### 🔧 Workflow ng Pag-develop

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

### 📦 Ano ang Na-deploy

#### **Infrastructure**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (kasama ang OpenAI models)
- Container App Environment

#### **Application**
- MCP Server (Container App)
- Naka-enable ang health monitoring
- Nakakonfigura ang environment variables
- Integrasyon sa Application Insights

### 🌍 Mga Environment Variable

Pagkatapos ng deployment, ang mga variable na ito ay awtomatikong magagamit:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Pag-monitor at Pamamahala

- **Azure Portal**: Tingnan ang lahat ng resources sa iyong resource group
- **Application Insights**: I-monitor ang performance ng application at mga log
- **Container Apps**: Tingnan ang mga log at metrics ng application
- **AI Studio**: Pamahalaan ang mga deployment ng OpenAI model

### 📋 Pag-troubleshoot

#### **Karaniwang Problema**

1. **Hindi suportado ang lokasyon**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Lumampas sa resource quotas**:
   - Suriin ang mga limitasyon ng iyong subscription sa Azure Portal
   - Subukang gumamit ng ibang rehiyon

3. **Problema sa authentication**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Tingnan ang mga deployment log**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatibo: Manual na Pag-deploy

Kung mas gusto mo ang manual na pag-deploy, maaari mo pa ring gamitin ang infrastructure sa folder na `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Matuto Pa

- [Dokumentasyon ng Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasyon ng Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentasyon ng Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.