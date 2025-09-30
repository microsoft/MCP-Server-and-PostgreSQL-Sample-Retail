<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:27:56+00:00",
  "source_file": "azd/README.md",
  "language_code": "lt"
}
-->
# Azure Developer CLI (azd) Greitas Pradėjimas

## 🚀 Diegimas su Azure Developer CLI

Šis projektas dabar visiškai suderinamas su Azure Developer CLI (azd), leidžiančiu automatizuotai diegti tiek infrastruktūrą, tiek MCP serverio programą.

### Reikalavimai

1. **Įdiekite Azure Developer CLI**:
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

2. **Prisijunkite prie Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Diegimas vienu komandu

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

### 🔧 Kūrimo procesas

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

### 📦 Kas yra diegiama

#### **Infrastruktūra**
- Išteklių grupė
- Log Analytics Workspace  
- Application Insights
- Azure AI paslaugos (su OpenAI modeliais)
- Container App aplinka

#### **Programa**
- MCP serveris (Container App)
- Įjungtas sveikatos stebėjimas
- Suformuoti aplinkos kintamieji
- Application Insights integracija

### 🌍 Aplinkos kintamieji

Po diegimo šie kintamieji bus automatiškai prieinami:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Stebėjimas ir valdymas

- **Azure Portal**: Peržiūrėkite visus išteklius savo išteklių grupėje
- **Application Insights**: Stebėkite programos našumą ir žurnalus
- **Container Apps**: Peržiūrėkite programos žurnalus ir metrikas
- **AI Studio**: Valdykite OpenAI modelių diegimus

### 📋 Trikčių šalinimas

#### **Dažnos problemos**

1. **Nepalaikoma vieta**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Viršytos išteklių kvotos**:
   - Patikrinkite savo prenumeratos limitus Azure Portal
   - Pabandykite kitą regioną

3. **Autentifikacijos problemos**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Peržiūrėkite diegimo žurnalus**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatyva: Rankinis diegimas

Jei norite diegti rankiniu būdu, vis dar galite naudoti infrastruktūrą iš `/infra` aplanko:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Sužinokite daugiau

- [Azure Developer CLI Dokumentacija](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Dokumentacija](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Dokumentacija](https://docs.microsoft.com/azure/ai-services/)

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.