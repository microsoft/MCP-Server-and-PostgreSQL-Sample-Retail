<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:23:57+00:00",
  "source_file": "azd/README.md",
  "language_code": "sv"
}
-->
# Azure Developer CLI (azd) Snabbstart

## 🚀 Distribuera med Azure Developer CLI

Det här projektet är nu fullt kompatibelt med Azure Developer CLI (azd) för automatiserad distribution av både infrastruktur och MCP-serverapplikationen.

### Förutsättningar

1. **Installera Azure Developer CLI**:
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

2. **Logga in på Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Distribuera med ett kommando

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

### 🔧 Utvecklingsarbetsflöde

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

### 📦 Vad som distribueras

#### **Infrastruktur**
- Resursgrupp
- Log Analytics Workspace  
- Application Insights
- Azure AI-tjänster (med OpenAI-modeller)
- Container App-miljö

#### **Applikation**
- MCP-server (Container App)
- Hälsokontroll aktiverad
- Miljövariabler konfigurerade
- Application Insights-integrering

### 🌍 Miljövariabler

Efter distribution är dessa variabler automatiskt tillgängliga:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Övervakning och hantering

- **Azure Portal**: Visa alla resurser i din resursgrupp
- **Application Insights**: Övervaka applikationens prestanda och loggar
- **Container Apps**: Visa applikationsloggar och mätvärden
- **AI Studio**: Hantera OpenAI-modellens distributioner

### 📋 Felsökning

#### **Vanliga problem**

1. **Plats stöds inte**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Resurskvoter överskridna**:
   - Kontrollera dina prenumerationsgränser i Azure Portal
   - Försök med en annan region

3. **Autentiseringsproblem**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Visa distributionsloggar**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativ: Manuell distribution

Om du föredrar manuell distribution kan du fortfarande använda infrastrukturen i mappen `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Läs mer

- [Azure Developer CLI-dokumentation](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps-dokumentation](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI-tjänster dokumentation](https://docs.microsoft.com/azure/ai-services/)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som kan uppstå vid användning av denna översättning.