<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:24:40+00:00",
  "source_file": "azd/README.md",
  "language_code": "nl"
}
-->
# Azure Developer CLI (azd) Snelstartgids

## 🚀 Implementeren met Azure Developer CLI

Dit project is nu volledig compatibel met Azure Developer CLI (azd) voor geautomatiseerde implementatie van zowel de infrastructuur als de MCP-serverapplicatie.

### Vereisten

1. **Installeer Azure Developer CLI**:
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

2. **Inloggen bij Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Implementatie met één opdracht

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

### 🔧 Ontwikkelworkflow

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

### 📦 Wat wordt geïmplementeerd

#### **Infrastructuur**
- Resourcegroep
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (met OpenAI-modellen)
- Container App-omgeving

#### **Applicatie**
- MCP-server (Container App)
- Gezondheidsmonitoring ingeschakeld
- Omgevingsvariabelen geconfigureerd
- Integratie met Application Insights

### 🌍 Omgevingsvariabelen

Na implementatie zijn deze variabelen automatisch beschikbaar:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitoring & Beheer

- **Azure Portal**: Bekijk alle resources in je resourcegroep
- **Application Insights**: Monitor applicatieprestaties en logs
- **Container Apps**: Bekijk applicatielogs en -statistieken
- **AI Studio**: Beheer OpenAI-modelimplementaties

### 📋 Problemen oplossen

#### **Veelvoorkomende problemen**

1. **Locatie niet ondersteund**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Resourcequota overschreden**:
   - Controleer je abonnementslimieten in Azure Portal
   - Probeer een andere regio

3. **Authenticatieproblemen**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Bekijk implementatielogs**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatief: Handmatige implementatie

Als je de voorkeur geeft aan handmatige implementatie, kun je nog steeds de infrastructuur in de map `/infra` gebruiken:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Meer informatie

- [Azure Developer CLI Documentatie](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Documentatie](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Documentatie](https://docs.microsoft.com/azure/ai-services/)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.