<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:16:17+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ro"
}
-->
# Instrucțiuni de Implementare a Șablonului ARM

Acest document oferă instrucțiuni pentru implementarea infrastructurii MCP Retail Analytics utilizând șablonul ARM.

## 📋 Prezentare Generală

Șablonul ARM `azuredeploy.json` oferă o implementare completă a:
- Grupului de Resurse Azure
- Workspace Log Analytics  
- Application Insights
- Servicii Azure AI (Foundry)
- Implementări de modele OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opțiuni de Implementare

### Opțiunea 1: Implementare cu Azure CLI

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

### Opțiunea 2: Implementare cu PowerShell

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

### Opțiunea 3: Portalul Azure

1. Accesați [Portalul Azure](https://portal.azure.com)
2. Căutați "Deploy a custom template"
3. Faceți clic pe "Build your own template in the editor"
4. Copiați și lipiți conținutul fișierului `azuredeploy.json`
5. Faceți clic pe "Save" apoi "Review + create"
6. Completați parametrii necesari și implementați

## 🔧 Parametrii Șablonului

| Parametru | Tip | Implicit | Descriere |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefix pentru numele resurselor |
| `location` | string | `westus2` | Regiunea Azure pentru implementare |
| `uniqueSuffix` | string | Generat automat | Identificator unic de 4 caractere |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nume afișat pentru proiectul AI |
| `aiProjectDescription` | string | Descrierea proiectului | Descriere afișată în Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Capacitatea de tokeni pentru modelul GPT |
| `embeddingModelCapacity` | int | `50` | Capacitatea de tokeni pentru modelul de embedding |
| `tags` | object | Etichete implicite | Etichete de resurse pentru guvernanță |

## 📤 Rezultatele Șablonului

Șablonul oferă următoarele rezultate:

| Rezultat | Descriere |
|----------|-------------|
| `subscriptionId` | ID-ul abonamentului Azure |
| `resourceGroupName` | Numele grupului de resurse creat |
| `aiFoundryName` | Numele serviciului Azure AI Foundry |
| `foundryEndpoint` | URL-ul endpoint-ului serviciului AI |
| `foundryAccountKey` | Cheia de acces pentru serviciul AI |
| `deployedModels` | Lista modelelor OpenAI implementate |
| `applicationInsightsConnectionString` | String de conexiune pentru Application Insights |
| `logAnalyticsWorkspaceName` | Numele workspace-ului Log Analytics |

## 🔍 Comenzi de Verificare

După implementare, verificați resursele:

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

Acest proiect oferă atât șabloane ARM, cât și Bicep:

### Șablon ARM (`azuredeploy.json`)
- ✅ Format nativ Azure Resource Manager
- ✅ Funcționează oriunde este suportat ARM
- ✅ Nu necesită unelte suplimentare
- ❌ Sintaxă JSON mai detaliată
- ❌ Mai greu de citit și întreținut

### Șablon Bicep (`main.bicep`)
- ✅ Sintaxă modernă și curată
- ✅ Instrumente mai bune și IntelliSense
- ✅ Mai ușor de citit și întreținut
- ✅ Validare la compilare
- ❌ Necesită CLI Bicep
- ❌ Pas suplimentar de compilare

**Recomandare**: Utilizați șabloanele Bicep (`main.bicep`) pentru dezvoltare și șablonul ARM (`azuredeploy.json`) pentru scenarii care necesită JSON ARM pur.

## 🔧 Personalizare

### Adăugarea Resurselor Personalizate

Pentru a adăuga resurse suplimentare în șablonul ARM:

1. Adăugați definiția resursei în array-ul `resources` al șablonului nested
2. Adăugați orice parametri noi în secțiunea `parameters`
3. Adăugați rezultatele corespunzătoare, dacă este necesar
4. Actualizați fișierul de parametri cu valori implicite

### Exemplu: Adăugarea unui Cont de Stocare

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

## 🐛 Depanare

### Probleme Frecvente

#### 1. Erori de Validare a Șablonului
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Conflicte de Nume ale Resurselor
- Asigurați-vă că `uniqueSuffix` este cu adevărat unic
- Utilizați funcția `uniqueString()` pentru generare automată
- Verificați resursele existente în regiunea țintă

#### 3. Limite de Cote
- Verificați disponibilitatea modelului OpenAI în regiunea țintă
- Verificați cotele abonamentului pentru serviciile AI
- Luați în considerare utilizarea altor regiuni dacă limitele sunt atinse

#### 4. Probleme de Permisiuni
- Asigurați-vă că contul are rolul Contributor pe abonament
- Verificați dacă abonamentul este activat pentru serviciile AI
- Verificați înregistrările furnizorului de resurse

### Comenzi de Depanare

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

## 🔐 Considerații de Securitate

### Controlul Accesului
- Serviciul AI utilizează identitate gestionată pentru acces securizat
- Grupul de resurse oferă o limită pentru RBAC
- Application Insights are controale de acces separate

### Securitatea Rețelei
- Accesul la rețea publică este activat implicit
- Luați în considerare utilizarea endpoint-urilor private pentru producție
- ACL-urile de rețea pot fi configurate pentru securitate suplimentară

### Managementul Cheilor
- Cheile serviciului AI sunt generate automat
- Utilizați Azure Key Vault pentru secretele de producție
- Rotiți cheile periodic pentru securitate

## 📚 Pași Următori

După implementarea cu succes:

1. **Configurați Variabilele de Mediu**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Porniți Serverul MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testați Integrarea**:
   - Deschideți VS Code cu proiectul
   - Configurați serverele MCP în `.vscode/mcp.json`
   - Testați AI Chat cu interogări de date retail

4. **Monitorizați Performanța**:
   - Vizualizați metricile în Application Insights
   - Verificați logurile în workspace-ul Log Analytics
   - Configurați alerte pentru evenimente importante

---

Pentru mai multe informații, consultați [README principal](../README.md) sau ghidul [QUICKSTART](../QUICKSTART.md).

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.