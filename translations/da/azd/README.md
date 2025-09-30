<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:24:07+00:00",
  "source_file": "azd/README.md",
  "language_code": "da"
}
-->
# Azure Developer CLI (azd) Hurtig Start

## 🚀 Udrul med Azure Developer CLI

Dette projekt er nu fuldt kompatibelt med Azure Developer CLI (azd) for automatiseret udrulning af både infrastruktur og MCP-serverapplikationen.

### Forudsætninger

1. **Installer Azure Developer CLI**:
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

2. **Log ind på Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Udrulning med én kommando

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

### 🔧 Udviklingsworkflow

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

### 📦 Hvad bliver udrullet

#### **Infrastruktur**
- Ressourcegruppe
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (med OpenAI-modeller)
- Container App Environment

#### **Applikation**
- MCP-server (Container App)
- Sundhedsovervågning aktiveret
- Miljøvariabler konfigureret
- Application Insights-integration

### 🌍 Miljøvariabler

Efter udrulning er disse variabler automatisk tilgængelige:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Overvågning & Administration

- **Azure Portal**: Se alle ressourcer i din ressourcegruppe
- **Application Insights**: Overvåg applikationsydelse og logfiler
- **Container Apps**: Se applikationslogfiler og metrikker
- **AI Studio**: Administrer OpenAI-modeludrulninger

### 📋 Fejlfinding

#### **Almindelige problemer**

1. **Placering ikke understøttet**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Ressourcekvoter overskredet**:
   - Tjek dine abonnementsgrænser i Azure Portal
   - Prøv en anden region

3. **Autentificeringsproblemer**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Se udrulningslogfiler**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativ: Manuel udrulning

Hvis du foretrækker manuel udrulning, kan du stadig bruge infrastrukturen i mappen `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Lær Mere

- [Azure Developer CLI Dokumentation](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Dokumentation](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Dokumentation](https://docs.microsoft.com/azure/ai-services/)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.