<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:25:59+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "it"
}
-->
# Modelli di Infrastruttura

Questa cartella contiene i modelli di distribuzione dell'infrastruttura per il progetto MCP Retail Analytics.

## 📁 Panoramica dei File

| File | Descrizione | Caso d'Uso |
|------|-------------|------------|
| `azuredeploy.json` | **Template ARM** - Distribuzione completa a livello di sottoscrizione | Consigliato per tutte le distribuzioni |
| `azuredeploy.parameters.json` | **Parametri ARM** - Valori di configurazione statici | Utilizzato con `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Guida alla distribuzione ARM** - Istruzioni dettagliate | Documentazione completa della distribuzione |
| `README.md` | **Questo file** - Panoramica dell'infrastruttura | Riferimento rapido |

## 🚀 Opzioni di Distribuzione

### Opzione 1: Azure CLI (Consigliata)
Distribuzione completa con creazione del gruppo di risorse:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opzione 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opzione 3: Portale Azure
1. Vai al [Portale Azure](https://portal.azure.com)
2. Cerca "Distribuisci un modello personalizzato"
3. Carica `azuredeploy.json`
4. Configura i parametri e avvia la distribuzione

## 🏗️ Componenti dell'Infrastruttura

Il template ARM distribuisce la seguente infrastruttura:

- **Gruppo di Risorse**: Contenitore per tutte le risorse con una nomenclatura coerente
- **Log Analytics Workspace**: Monitoraggio e registrazione centralizzati (conservazione di 30 giorni)
- **Application Insights**: Monitoraggio delle prestazioni delle applicazioni integrato con Log Analytics
- **Servizi AI di Azure**: Hub multi-servizio AI (livello S0) con identità gestita
- **Modelli OpenAI**:
  - `gpt-4o-mini` (capacità 120) - Modello di chat e completamento
  - `text-embedding-3-small` (capacità 50) - Embedding di testo per la ricerca semantica

## 🔧 Configurazione del Template

### Parametri
Il template ARM accetta i seguenti parametri personalizzabili:

| Parametro | Valore Predefinito | Descrizione |
|-----------|--------------------|-------------|
| `resourcePrefix` | `mcpretail` | Prefisso per tutti i nomi delle risorse |
| `location` | `westus2` | Regione Azure per la distribuzione |
| `uniqueSuffix` | Generato automaticamente | Identificatore univoco di 4 caratteri |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nome visualizzato |
| `gptModelCapacity` | `120` | Capacità di token del modello GPT |
| `embeddingModelCapacity` | `50` | Capacità di token del modello di embedding |

### Convenzione di Nomenclatura delle Risorse
Tutte le risorse seguono il modello: `{type}-{resourcePrefix}-{uniqueSuffix}`

Esempi:
- Gruppo di Risorse: `rg-mcpretail-demo`
- Servizio AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validazione del Template

### Validare Prima della Distribuzione
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Verificare lo Stato della Distribuzione
```bash
az deployment sub list --output table
```

## 💰 Stima dei Costi

Costi mensili stimati per carico di lavoro di sviluppo:

| Servizio | Configurazione | Costo Stimato/Mese |
|----------|----------------|--------------------|
| Servizi AI di Azure | Livello S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI Embeddings | 50K token | $5-15 |
| Application Insights | Monitoraggio di base | $5-15 |
| Log Analytics | 1GB/mese | $2-5 |
| **Totale** | | **$42-115** |

## 📚 Risorse Aggiuntive

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Guida dettagliata alla distribuzione con risoluzione dei problemi
- [Documentazione Template ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Documentazione Servizi AI di Azure](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Risultati della validazione dei file

## 🆘 Risoluzione Rapida dei Problemi

### Problemi Comuni
- **Autenticazione**: Esegui `az login` per autenticarti
- **Limiti di Quota**: Verifica la disponibilità del modello OpenAI nella regione di destinazione
- **Conflitti di Nomenclatura**: Utilizza un parametro `uniqueSuffix` diverso
- **Permessi**: Assicurati che l'account abbia il ruolo di Collaboratore sulla sottoscrizione

### Ottenere Aiuto
- Consulta [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) per una risoluzione dettagliata dei problemi
- Controlla i log di distribuzione nel Portale Azure
- Visita [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Per la configurazione completa del progetto, consulta il [README principale](../../README.md) o il [walkthrough del progetto](../../walkthrough/README.md).

---

**Avvertenza**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.