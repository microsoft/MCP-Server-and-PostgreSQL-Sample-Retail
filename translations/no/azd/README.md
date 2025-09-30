<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:24:18+00:00",
  "source_file": "azd/README.md",
  "language_code": "no"
}
-->
# Azure Developer CLI (azd) Hurtigstart

## 🚀 Distribuer med Azure Developer CLI

Dette prosjektet er nå fullt kompatibelt med Azure Developer CLI (azd) for automatisert distribusjon av både infrastruktur og MCP-serverapplikasjonen.

### Forutsetninger

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

2. **Logg inn på Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Distribusjon med én kommando

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

### 🔧 Utviklingsarbeidsflyt

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

### 📦 Hva som distribueres

#### **Infrastruktur**
- Ressursgruppe
- Logganalysearbeidsområde  
- Application Insights
- Azure AI-tjenester (med OpenAI-modeller)
- Miljø for Container App

#### **Applikasjon**
- MCP-server (Container App)
- Helseovervåking aktivert
- Miljøvariabler konfigurert
- Integrasjon med Application Insights

### 🌍 Miljøvariabler

Etter distribusjon er disse variablene automatisk tilgjengelige:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Overvåking og administrasjon

- **Azure Portal**: Se alle ressurser i ressursgruppen din
- **Application Insights**: Overvåk applikasjonsytelse og logger
- **Container Apps**: Se applikasjonslogger og -målinger
- **AI Studio**: Administrer OpenAI-modellutplasseringer

### 📋 Feilsøking

#### **Vanlige problemer**

1. **Lokasjon ikke støttet**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Ressurskvoter overskredet**:
   - Sjekk abonnementsgrensene dine i Azure Portal
   - Prøv en annen region

3. **Autentiseringsproblemer**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Se distribusjonslogger**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativ: Manuell distribusjon

Hvis du foretrekker manuell distribusjon, kan du fortsatt bruke infrastrukturen i `/infra`-mappen:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Lær mer

- [Azure Developer CLI-dokumentasjon](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps-dokumentasjon](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI-tjenester-dokumentasjon](https://docs.microsoft.com/azure/ai-services/)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.