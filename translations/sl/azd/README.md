<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:27:13+00:00",
  "source_file": "azd/README.md",
  "language_code": "sl"
}
-->
# Azure Developer CLI (azd) Hitri Začetek

## 🚀 Namestitev z Azure Developer CLI

Ta projekt je zdaj popolnoma združljiv z Azure Developer CLI (azd) za avtomatizirano namestitev tako infrastrukture kot aplikacije MCP strežnika.

### Predpogoji

1. **Namestite Azure Developer CLI**:
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

2. **Prijavite se v Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Namestitev z enim ukazom

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

### 🔧 Razvojni potek dela

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

### 📦 Kaj se namesti

#### **Infrastruktura**
- Skupina virov
- Delovni prostor za analitiko dnevnikov  
- Application Insights
- Azure AI storitve (z modeli OpenAI)
- Okolje za aplikacije v kontejnerjih

#### **Aplikacija**
- MCP strežnik (aplikacija v kontejnerju)
- Omogočeno spremljanje stanja
- Konfigurirane okoljske spremenljivke
- Integracija z Application Insights

### 🌍 Okoljske spremenljivke

Po namestitvi so te spremenljivke samodejno na voljo:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Spremljanje in upravljanje

- **Azure Portal**: Oglejte si vse vire v vaši skupini virov
- **Application Insights**: Spremljajte zmogljivost aplikacije in dnevnike
- **Aplikacije v kontejnerjih**: Oglejte si dnevnike in metrike aplikacije
- **AI Studio**: Upravljajte namestitve modelov OpenAI

### 📋 Odpravljanje težav

#### **Pogoste težave**

1. **Lokacija ni podprta**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Presežene kvote virov**:
   - Preverite omejitve vaše naročnine v Azure Portalu
   - Poskusite z drugo regijo

3. **Težave z avtentikacijo**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Oglejte si dnevnike namestitve**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Ročna namestitev

Če raje uporabljate ročno namestitev, lahko še vedno uporabite infrastrukturo v mapi `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Več informacij

- [Dokumentacija Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacija za aplikacije v kontejnerjih](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentacija za Azure AI storitve](https://docs.microsoft.com/azure/ai-services/)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.