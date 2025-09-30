<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:27:02+00:00",
  "source_file": "azd/README.md",
  "language_code": "hr"
}
-->
# Azure Developer CLI (azd) Brzi početak

## 🚀 Implementacija s Azure Developer CLI

Ovaj projekt je sada potpuno kompatibilan s Azure Developer CLI (azd) za automatiziranu implementaciju infrastrukture i MCP server aplikacije.

### Preduvjeti

1. **Instalirajte Azure Developer CLI**:
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

2. **Prijavite se na Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Implementacija jednim naredbom

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

### 🔧 Radni tijek razvoja

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

### 📦 Što se implementira

#### **Infrastruktura**
- Resource Group (Grupa resursa)
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (s OpenAI modelima)
- Okruženje za Container App

#### **Aplikacija**
- MCP Server (Container App)
- Omogućeno praćenje zdravlja
- Konfigurirane varijable okruženja
- Integracija s Application Insights

### 🌍 Varijable okruženja

Nakon implementacije, ove varijable automatski su dostupne:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Praćenje i upravljanje

- **Azure Portal**: Pregled svih resursa u vašoj grupi resursa
- **Application Insights**: Praćenje performansi aplikacije i logova
- **Container Apps**: Pregled logova i metrika aplikacije
- **AI Studio**: Upravljanje implementacijama OpenAI modela

### 📋 Rješavanje problema

#### **Uobičajeni problemi**

1. **Lokacija nije podržana**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Prekoračene kvote resursa**:
   - Provjerite ograničenja pretplate u Azure Portalu
   - Pokušajte s drugom regijom

3. **Problemi s autentifikacijom**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Pregled logova implementacije**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Ručna implementacija

Ako preferirate ručnu implementaciju, i dalje možete koristiti infrastrukturu u mapi `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Saznajte više

- [Dokumentacija za Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija za Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentacija za Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.