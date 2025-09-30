<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:22:57+00:00",
  "source_file": "azd/README.md",
  "language_code": "it"
}
-->
# Azure Developer CLI (azd) Guida Rapida

## 🚀 Distribuisci con Azure Developer CLI

Questo progetto è ora completamente compatibile con Azure Developer CLI (azd) per la distribuzione automatizzata sia dell'infrastruttura che dell'applicazione server MCP.

### Prerequisiti

1. **Installa Azure Developer CLI**:
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

2. **Accedi ad Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Distribuzione con un solo comando

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

### 🔧 Workflow di Sviluppo

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

### 📦 Cosa viene distribuito

#### **Infrastruttura**
- Gruppo di risorse
- Workspace Log Analytics  
- Application Insights
- Servizi Azure AI (con modelli OpenAI)
- Ambiente per Container App

#### **Applicazione**
- Server MCP (Container App)
- Monitoraggio della salute abilitato
- Variabili di ambiente configurate
- Integrazione con Application Insights

### 🌍 Variabili di Ambiente

Dopo la distribuzione, queste variabili saranno automaticamente disponibili:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitoraggio e Gestione

- **Portale Azure**: Visualizza tutte le risorse nel tuo gruppo di risorse
- **Application Insights**: Monitora le prestazioni e i log dell'applicazione
- **Container Apps**: Visualizza i log e le metriche dell'applicazione
- **AI Studio**: Gestisci le distribuzioni dei modelli OpenAI

### 📋 Risoluzione dei Problemi

#### **Problemi Comuni**

1. **Località non supportata**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Quote di risorse superate**:
   - Controlla i limiti della tua sottoscrizione nel Portale Azure
   - Prova una regione diversa

3. **Problemi di autenticazione**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Visualizza i log di distribuzione**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Distribuzione Manuale

Se preferisci una distribuzione manuale, puoi comunque utilizzare l'infrastruttura nella cartella `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Scopri di più

- [Documentazione Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentazione Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Documentazione Servizi Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.