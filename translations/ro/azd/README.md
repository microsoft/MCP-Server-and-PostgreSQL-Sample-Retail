<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:26:25+00:00",
  "source_file": "azd/README.md",
  "language_code": "ro"
}
-->
# Ghid rapid Azure Developer CLI (azd)

## 🚀 Implementare cu Azure Developer CLI

Acest proiect este acum complet compatibil cu Azure Developer CLI (azd) pentru implementarea automată a infrastructurii și a aplicației server MCP.

### Cerințe preliminare

1. **Instalează Azure Developer CLI**:
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

2. **Autentifică-te în Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Implementare cu o singură comandă

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

### 🔧 Flux de lucru pentru dezvoltare

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

### 📦 Ce se implementează

#### **Infrastructură**
- Grup de resurse
- Log Analytics Workspace  
- Application Insights
- Servicii Azure AI (cu modele OpenAI)
- Mediu pentru Container App

#### **Aplicație**
- Server MCP (Container App)
- Monitorizare a stării activată
- Variabile de mediu configurate
- Integrare cu Application Insights

### 🌍 Variabile de mediu

După implementare, aceste variabile sunt disponibile automat:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitorizare și gestionare

- **Portalul Azure**: Vizualizează toate resursele din grupul tău de resurse
- **Application Insights**: Monitorizează performanța aplicației și jurnalele
- **Container Apps**: Vizualizează jurnalele și metricile aplicației
- **AI Studio**: Gestionează implementările modelelor OpenAI

### 📋 Depanare

#### **Probleme comune**

1. **Locație nesuportată**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Cote de resurse depășite**:
   - Verifică limitele abonamentului tău în Portalul Azure
   - Încearcă o altă regiune

3. **Probleme de autentificare**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Vizualizează jurnalele de implementare**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativă: Implementare manuală

Dacă preferi implementarea manuală, poți folosi în continuare infrastructura din folderul `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Află mai multe

- [Documentația Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentația Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Documentația Servicii Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.