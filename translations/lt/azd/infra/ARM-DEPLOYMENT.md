<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:18:46+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "lt"
}
-->
# ARM šablono diegimo instrukcijos

Šiame dokumente pateikiamos instrukcijos, kaip diegti MCP Retail Analytics infrastruktūrą naudojant ARM šabloną.

## 📋 Apžvalga

`azuredeploy.json` ARM šablonas suteikia pilną diegimą, įskaitant:
- „Azure“ išteklių grupę
- Log Analytics darbo sritį  
- Application Insights
- Azure AI paslaugas (Foundry)
- OpenAI modelių diegimus (GPT-4o-mini, text-embedding-3-small)

## 🚀 Diegimo parinktys

### Parinktis 1: „Azure CLI“ diegimas

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

### Parinktis 2: „PowerShell“ diegimas

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

### Parinktis 3: „Azure Portal“

1. Eikite į [Azure Portal](https://portal.azure.com)
2. Ieškokite „Deploy a custom template“
3. Spustelėkite „Build your own template in the editor“
4. Nukopijuokite ir įklijuokite `azuredeploy.json` turinį
5. Spustelėkite „Save“, tada „Review + create“
6. Užpildykite reikiamus parametrus ir pradėkite diegimą

## 🔧 Šablono parametrai

| Parametras | Tipas | Numatytasis | Aprašymas |
|------------|-------|-------------|-----------|
| `resourcePrefix` | string | `mcpretail` | Išteklių pavadinimų priešdėlis |
| `location` | string | `westus2` | „Azure“ regionas diegimui |
| `uniqueSuffix` | string | Automatiškai sugeneruotas | 4 simbolių unikalus identifikatorius |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI projekto pavadinimas |
| `aiProjectDescription` | string | Projekto aprašymas | Aprašymas, rodomas Azure AI Foundry |
| `gptModelCapacity` | int | `120` | GPT modelio žetonų talpa |
| `embeddingModelCapacity` | int | `50` | Įterpimo modelio žetonų talpa |
| `tags` | object | Numatytosios žymos | Išteklių žymos valdymui |

## 📤 Šablono rezultatai

Šablonas pateikia šiuos rezultatus:

| Rezultatas | Aprašymas |
|------------|-----------|
| `subscriptionId` | „Azure“ prenumeratos ID |
| `resourceGroupName` | Sukurtos išteklių grupės pavadinimas |
| `aiFoundryName` | „Azure AI Foundry“ paslaugos pavadinimas |
| `foundryEndpoint` | AI paslaugos URL adresas |
| `foundryAccountKey` | AI paslaugos prieigos raktas |
| `deployedModels` | Diegtų OpenAI modelių sąrašas |
| `applicationInsightsConnectionString` | Application Insights prisijungimo eilutė |
| `logAnalyticsWorkspaceName` | Log Analytics darbo srities pavadinimas |

## 🔍 Patikrinimo komandos

Po diegimo patikrinkite išteklius:

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

Šis projektas pateikia tiek ARM, tiek Bicep šablonus:

### ARM šablonas (`azuredeploy.json`)
- ✅ Natūralus „Azure Resource Manager“ formatas
- ✅ Veikia visur, kur palaikomas ARM
- ✅ Nereikia papildomų įrankių
- ❌ Daugiau išplėstinė JSON sintaksė
- ❌ Sunkiau skaityti ir prižiūrėti

### Bicep šablonas (`main.bicep`)
- ✅ Moderni, aiški sintaksė
- ✅ Geresni įrankiai ir IntelliSense
- ✅ Lengviau skaityti ir prižiūrėti
- ✅ Kompiliavimo laiko patikrinimas
- ❌ Reikalingas Bicep CLI
- ❌ Papildomas kūrimo žingsnis

**Rekomendacija**: Naudokite Bicep šablonus (`main.bicep`) kūrimui ir ARM šabloną (`azuredeploy.json`) scenarijams, kuriems reikalingas grynas ARM JSON.

## 🔧 Pritaikymas

### Papildomų išteklių pridėjimas

Norėdami pridėti papildomus išteklius prie ARM šablono:

1. Pridėkite išteklių apibrėžimą į įdėto šablono `resources` masyvą
2. Pridėkite naujus parametrus į `parameters` skyrių
3. Jei reikia, pridėkite atitinkamus rezultatus
4. Atnaujinkite parametrų failą su numatytosiomis reikšmėmis

### Pavyzdys: Saugyklos paskyros pridėjimas

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

## 🐛 Trikčių šalinimas

### Dažnos problemos

#### 1. Šablono validacijos klaidos
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Išteklių pavadinimų konfliktai
- Įsitikinkite, kad `uniqueSuffix` yra tikrai unikalus
- Naudokite `uniqueString()` funkciją automatiškai generavimui
- Patikrinkite esamus išteklius tiksliniame regione

#### 3. Kvotų apribojimai
- Patikrinkite OpenAI modelių prieinamumą tiksliniame regione
- Patikrinkite prenumeratos kvotas AI paslaugoms
- Apsvarstykite galimybę naudoti kitus regionus, jei pasiekiamos ribos

#### 4. Leidimų problemos
- Įsitikinkite, kad paskyra turi „Contributor“ rolę prenumeratoje
- Patikrinkite, ar prenumerata įgalinta AI paslaugoms
- Patikrinkite išteklių teikėjo registracijas

### Derinimo komandos

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

## 🔐 Saugumo aspektai

### Prieigos kontrolė
- AI paslauga naudoja valdomą tapatybę saugiai prieigai
- Išteklių grupė suteikia ribas RBAC
- Application Insights turi atskirą prieigos kontrolę

### Tinklo saugumas
- Vieša tinklo prieiga įjungta pagal numatytąją reikšmę
- Apsvarstykite privačius galinius taškus gamybai
- Tinklo ACL galima konfigūruoti papildomam saugumui

### Raktų valdymas
- AI paslaugų raktai generuojami automatiškai
- Naudokite „Azure Key Vault“ gamybos paslaptims
- Reguliariai keiskite raktus saugumui užtikrinti

## 📚 Tolimesni žingsniai

Po sėkmingo diegimo:

1. **Konfigūruokite aplinkos kintamuosius**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Paleiskite MCP serverį**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testuokite integraciją**:
   - Atidarykite VS Code su projektu
   - Konfigūruokite MCP serverius `.vscode/mcp.json` faile
   - Testuokite AI pokalbius su mažmeninės prekybos duomenų užklausomis

4. **Stebėkite našumą**:
   - Peržiūrėkite metrikas Application Insights
   - Patikrinkite žurnalus Log Analytics darbo srityje
   - Nustatykite įspėjimus svarbiems įvykiams

---

Daugiau informacijos rasite [pagrindiniame README](../README.md) arba [QUICKSTART vadove](../QUICKSTART.md).

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.