<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:09:10+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "it"
}
-->
# Istruzioni per il Deployment del Template ARM

Questo documento fornisce istruzioni per il deployment dell'infrastruttura MCP Retail Analytics utilizzando il template ARM.

## 📋 Panoramica

Il template ARM `azuredeploy.json` consente il deployment completo di:
- Gruppo di risorse Azure
- Workspace Log Analytics  
- Application Insights
- Servizi Azure AI (Foundry)
- Deployment di modelli OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opzioni di Deployment

### Opzione 1: Deployment tramite Azure CLI

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### Opzione 2: Deployment tramite PowerShell

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### Opzione 3: Azure Portal

1. Vai su [Azure Portal](https://portal.azure.com)
2. Cerca "Deploy a custom template"
3. Clicca su "Build your own template in the editor"
4. Copia e incolla il contenuto di `azuredeploy.json`
5. Clicca su "Save" e poi su "Review + create"
6. Compila i parametri richiesti e avvia il deployment

## 🔧 Parametri del Template

| Parametro | Tipo | Default | Descrizione |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefisso per i nomi delle risorse |
| `location` | string | `westus2` | Regione Azure per il deployment |
| `uniqueSuffix` | string | Generato automaticamente | Identificatore unico di 4 caratteri |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nome visualizzato per il progetto AI |
| `aiProjectDescription` | string | Descrizione del progetto | Descrizione mostrata in Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Capacità di token per il modello GPT |
| `embeddingModelCapacity` | int | `50` | Capacità di token per il modello di embedding |
| `tags` | object | Tag predefiniti | Tag delle risorse per la governance |

## 📤 Output del Template

Il template fornisce i seguenti output:

| Output | Descrizione |
|--------|-------------|
| `subscriptionId` | ID della sottoscrizione Azure |
| `resourceGroupName` | Nome del gruppo di risorse creato |
| `aiFoundryName` | Nome del servizio Azure AI Foundry |
| `foundryEndpoint` | URL dell'endpoint del servizio AI |
| `foundryAccountKey` | Chiave di accesso al servizio AI |
| `deployedModels` | Array di modelli OpenAI deployati |
| `applicationInsightsConnectionString` | Stringa di connessione di Application Insights |
| `logAnalyticsWorkspaceName` | Nome del workspace Log Analytics |

## 🔍 Comandi di Verifica

Dopo il deployment, verifica le risorse:

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM vs Bicep

Questo progetto fornisce sia template ARM che Bicep:

### Template ARM (`azuredeploy.json`)
- ✅ Formato nativo di Azure Resource Manager
- ✅ Funziona ovunque sia supportato ARM
- ✅ Non richiede strumenti aggiuntivi
- ❌ Sintassi JSON più prolissa
- ❌ Più difficile da leggere e mantenere

### Template Bicep (`main.bicep`)
- ✅ Sintassi moderna e pulita
- ✅ Migliori strumenti e IntelliSense
- ✅ Più facile da leggere e mantenere
- ✅ Validazione durante la compilazione
- ❌ Richiede il CLI di Bicep
- ❌ Passo di build aggiuntivo

**Raccomandazione**: Usa i template Bicep (`main.bicep`) per lo sviluppo e il template ARM (`azuredeploy.json`) per scenari che richiedono JSON ARM puro.

## 🔧 Personalizzazione

### Aggiunta di Risorse Personalizzate

Per aggiungere risorse aggiuntive al template ARM:

1. Aggiungi la definizione della risorsa all'array `resources` del template nidificato
2. Aggiungi eventuali nuovi parametri alla sezione `parameters`
3. Aggiungi gli output corrispondenti, se necessario
4. Aggiorna il file dei parametri con valori predefiniti

### Esempio: Aggiunta di un Account di Archiviazione

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 Risoluzione dei Problemi

### Problemi Comuni

#### 1. Errori di Validazione del Template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Conflitti nei Nomi delle Risorse
- Assicurati che `uniqueSuffix` sia veramente unico
- Usa la funzione `uniqueString()` per la generazione automatica
- Controlla le risorse esistenti nella regione di destinazione

#### 3. Limiti di Quota
- Verifica la disponibilità dei modelli OpenAI nella regione di destinazione
- Controlla le quote della sottoscrizione per i servizi AI
- Considera l'uso di regioni diverse se i limiti sono raggiunti

#### 4. Problemi di Permessi
- Assicurati che l'account abbia il ruolo di Contributor sulla sottoscrizione
- Verifica che la sottoscrizione sia abilitata per i servizi AI
- Controlla la registrazione dei provider di risorse

### Comandi di Debug

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 Considerazioni sulla Sicurezza

### Controllo degli Accessi
- Il servizio AI utilizza un'identità gestita per l'accesso sicuro
- Il gruppo di risorse fornisce un confine per RBAC
- Application Insights ha controlli di accesso separati

### Sicurezza di Rete
- L'accesso alla rete pubblica è abilitato di default
- Considera l'uso di endpoint privati per l'ambiente di produzione
- Gli ACL di rete possono essere configurati per maggiore sicurezza

### Gestione delle Chiavi
- Le chiavi del servizio AI sono generate automaticamente
- Usa Azure Key Vault per i segreti in produzione
- Ruota regolarmente le chiavi per garantire la sicurezza

## 📚 Prossimi Passi

Dopo un deployment riuscito:

1. **Configura le Variabili d'Ambiente**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Avvia il Server MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testa l'Integrazione**:
   - Apri VS Code con il progetto
   - Configura i server MCP in `.vscode/mcp.json`
   - Testa la chat AI con query sui dati retail

4. **Monitora le Prestazioni**:
   - Visualizza le metriche in Application Insights
   - Controlla i log nel workspace Log Analytics
   - Configura avvisi per eventi importanti

---

Per maggiori informazioni, consulta il [README principale](../README.md) o la [guida QUICKSTART](../QUICKSTART.md).

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.