<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:17:19+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "hr"
}
-->
# Upute za implementaciju ARM predloška

Ovaj dokument pruža upute za implementaciju infrastrukture MCP Retail Analytics koristeći ARM predložak.

## 📋 Pregled

ARM predložak `azuredeploy.json` omogućuje potpunu implementaciju:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opcije implementacije

### Opcija 1: Implementacija putem Azure CLI

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

### Opcija 2: Implementacija putem PowerShell-a

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

### Opcija 3: Azure Portal

1. Otvorite [Azure Portal](https://portal.azure.com)
2. Potražite "Deploy a custom template"
3. Kliknite "Build your own template in the editor"
4. Kopirajte i zalijepite sadržaj datoteke `azuredeploy.json`
5. Kliknite "Save", a zatim "Review + create"
6. Ispunite potrebne parametre i implementirajte

## 🔧 Parametri predloška

| Parametar | Tip | Zadano | Opis |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefiks za nazive resursa |
| `location` | string | `westus2` | Azure regija za implementaciju |
| `uniqueSuffix` | string | Automatski generirano | Jedinstveni identifikator od 4 znaka |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Prikazni naziv za AI projekt |
| `aiProjectDescription` | string | Opis projekta | Opis prikazan u Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapacitet tokena za GPT model |
| `embeddingModelCapacity` | int | `50` | Kapacitet tokena za embedding model |
| `tags` | object | Zadane oznake | Oznake resursa za upravljanje |

## 📤 Izlazi predloška

Predložak pruža sljedeće izlaze:

| Izlaz | Opis |
|--------|-------------|
| `subscriptionId` | ID Azure pretplate |
| `resourceGroupName` | Naziv kreirane resource grupe |
| `aiFoundryName` | Naziv Azure AI Foundry usluge |
| `foundryEndpoint` | URL krajnje točke AI usluge |
| `foundryAccountKey` | Ključ za pristup AI usluzi |
| `deployedModels` | Niz implementiranih OpenAI modela |
| `applicationInsightsConnectionString` | Connection string za Application Insights |
| `logAnalyticsWorkspaceName` | Naziv Log Analytics radnog prostora |

## 🔍 Verifikacijske naredbe

Nakon implementacije, provjerite resurse:

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

Ovaj projekt pruža i ARM i Bicep predloške:

### ARM predložak (`azuredeploy.json`)
- ✅ Izvorni format Azure Resource Manager-a
- ✅ Radi svugdje gdje je ARM podržan
- ✅ Nije potreban dodatni alat
- ❌ Opširnija JSON sintaksa
- ❌ Teže za čitanje i održavanje

### Bicep predložak (`main.bicep`)
- ✅ Modernija, čista sintaksa
- ✅ Bolji alati i IntelliSense
- ✅ Lakše za čitanje i održavanje
- ✅ Validacija tijekom kompilacije
- ❌ Zahtijeva Bicep CLI
- ❌ Dodatni korak kompilacije

**Preporuka**: Koristite Bicep predloške (`main.bicep`) za razvoj, a ARM predložak (`azuredeploy.json`) za scenarije koji zahtijevaju čisti ARM JSON.

## 🔧 Prilagodba

### Dodavanje prilagođenih resursa

Za dodavanje dodatnih resursa u ARM predložak:

1. Dodajte definiciju resursa u `resources` niz ugniježđenog predloška
2. Dodajte nove parametre u sekciju `parameters`
3. Dodajte odgovarajuće izlaze ako je potrebno
4. Ažurirajte datoteku parametara s zadanim vrijednostima

### Primjer: Dodavanje Storage Account-a

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

## 🐛 Rješavanje problema

### Uobičajeni problemi

#### 1. Pogreške validacije predloška
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Sukobi u nazivima resursa
- Provjerite da je `uniqueSuffix` zaista jedinstven
- Koristite funkciju `uniqueString()` za automatsko generiranje
- Provjerite postojeće resurse u ciljanoj regiji

#### 3. Ograničenja kvota
- Provjerite dostupnost OpenAI modela u ciljanoj regiji
- Provjerite kvote pretplate za AI usluge
- Razmotrite korištenje drugih regija ako su kvote dosegnute

#### 4. Problemi s dozvolama
- Provjerite ima li račun Contributor ulogu na pretplati
- Provjerite je li pretplata omogućena za AI usluge
- Provjerite registracije pružatelja resursa

### Naredbe za otklanjanje grešaka

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

## 🔐 Sigurnosni aspekti

### Kontrola pristupa
- AI usluga koristi upravljani identitet za siguran pristup
- Resource grupa pruža granicu za RBAC
- Application Insights ima zasebne kontrole pristupa

### Sigurnost mreže
- Javna mrežna dostupnost omogućena je prema zadanim postavkama
- Razmotrite privatne krajnje točke za produkciju
- Mrežni ACL-ovi mogu se konfigurirati za dodatnu sigurnost

### Upravljanje ključevima
- Ključevi AI usluge automatski se generiraju
- Koristite Azure Key Vault za produkcijske tajne
- Redovito rotirajte ključeve radi sigurnosti

## 📚 Sljedeći koraci

Nakon uspješne implementacije:

1. **Konfigurirajte varijable okruženja**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Pokrenite MCP server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testirajte integraciju**:
   - Otvorite VS Code s projektom
   - Konfigurirajte MCP servere u `.vscode/mcp.json`
   - Testirajte AI Chat s upitima o maloprodajnim podacima

4. **Pratite performanse**:
   - Pregledajte metrike u Application Insights
   - Provjerite logove u Log Analytics radnom prostoru
   - Postavite upozorenja za važne događaje

---

Za više informacija, pogledajte [glavni README](../README.md) ili [QUICKSTART vodič](../QUICKSTART.md).

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.