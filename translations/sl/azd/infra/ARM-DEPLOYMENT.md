<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:17:40+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "sl"
}
-->
# Navodila za namestitev ARM predloge

Ta dokument vsebuje navodila za namestitev infrastrukture MCP Retail Analytics z uporabo ARM predloge.

## 📋 Pregled

ARM predloga `azuredeploy.json` omogoča popolno namestitev:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Možnosti namestitve

### Možnost 1: Namestitev prek Azure CLI

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

### Možnost 2: Namestitev prek PowerShell

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

### Možnost 3: Azure Portal

1. Odprite [Azure Portal](https://portal.azure.com)
2. Poiščite "Deploy a custom template"
3. Kliknite "Build your own template in the editor"
4. Kopirajte in prilepite vsebino datoteke `azuredeploy.json`
5. Kliknite "Save" in nato "Review + create"
6. Izpolnite zahtevane parametre in izvedite namestitev

## 🔧 Parametri predloge

| Parameter | Tip | Privzeto | Opis |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Predpona za imena virov |
| `location` | string | `westus2` | Azure regija za namestitev |
| `uniqueSuffix` | string | Samodejno generirano | 4-znakovni edinstveni identifikator |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Prikazno ime za AI projekt |
| `aiProjectDescription` | string | Opis projekta | Opis, prikazan v Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapaciteta žetonov za GPT model |
| `embeddingModelCapacity` | int | `50` | Kapaciteta žetonov za embedding model |
| `tags` | object | Privzete oznake | Oznake virov za upravljanje |

## 📤 Izhodi predloge

Predloga zagotavlja naslednje izhode:

| Izhod | Opis |
|-------|------|
| `subscriptionId` | ID naročnine v Azure |
| `resourceGroupName` | Ime ustvarjene skupine virov |
| `aiFoundryName` | Ime storitve Azure AI Foundry |
| `foundryEndpoint` | URL končne točke AI storitve |
| `foundryAccountKey` | Ključ za dostop do AI storitve |
| `deployedModels` | Seznam nameščenih OpenAI modelov |
| `applicationInsightsConnectionString` | Povezovalni niz za Application Insights |
| `logAnalyticsWorkspaceName` | Ime delovnega prostora Log Analytics |

## 🔍 Preverjanje z ukazi

Po namestitvi preverite vire:

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

Ta projekt vključuje tako ARM kot Bicep predloge:

### ARM predloga (`azuredeploy.json`)
- ✅ Izvorni format Azure Resource Manager
- ✅ Deluje povsod, kjer je podprt ARM
- ✅ Brez dodatnih orodij
- ❌ Bolj obsežna JSON sintaksa
- ❌ Težje berljivo in vzdrževano

### Bicep predloga (`main.bicep`)
- ✅ Sodobna, čista sintaksa
- ✅ Boljša orodja in IntelliSense
- ✅ Lažje berljivo in vzdrževano
- ✅ Validacija med prevajanjem
- ❌ Zahteva Bicep CLI
- ❌ Dodatni korak gradnje

**Priporočilo**: Uporabite Bicep predloge (`main.bicep`) za razvoj in ARM predlogo (`azuredeploy.json`) za scenarije, ki zahtevajo čisti ARM JSON.

## 🔧 Prilagoditev

### Dodajanje prilagojenih virov

Za dodajanje dodatnih virov v ARM predlogo:

1. Dodajte definicijo vira v polje `resources` v gnezdeni predlogi
2. Dodajte nove parametre v razdelek `parameters`
3. Po potrebi dodajte ustrezne izhode
4. Posodobite datoteko s parametri z privzetimi vrednostmi

### Primer: Dodajanje Storage Account

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

## 🐛 Odpravljanje težav

### Pogoste težave

#### 1. Napake pri validaciji predloge
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikti imen virov
- Prepričajte se, da je `uniqueSuffix` resnično edinstven
- Uporabite funkcijo `uniqueString()` za samodejno generacijo
- Preverite obstoječe vire v ciljni regiji

#### 3. Omejitve kvot
- Preverite razpoložljivost OpenAI modelov v ciljni regiji
- Preverite kvote naročnine za AI storitve
- Razmislite o uporabi drugih regij, če so omejitve dosežene

#### 4. Težave z dovoljenji
- Prepričajte se, da ima račun vlogo Contributor na naročnini
- Preverite, ali je naročnina omogočena za AI storitve
- Preverite registracije ponudnikov virov

### Ukazi za odpravljanje težav

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

## 🔐 Varnostni vidiki

### Nadzor dostopa
- AI storitev uporablja upravljano identiteto za varni dostop
- Skupina virov zagotavlja mejo za RBAC
- Application Insights ima ločene nadzore dostopa

### Omrežna varnost
- Dostop do javnega omrežja je privzeto omogočen
- Razmislite o zasebnih končnih točkah za produkcijo
- Omrežni ACL-ji se lahko konfigurirajo za dodatno varnost

### Upravljanje ključev
- Ključi za AI storitev so samodejno generirani
- Uporabite Azure Key Vault za produkcijske skrivnosti
- Redno rotirajte ključe za varnost

## 📚 Naslednji koraki

Po uspešni namestitvi:

1. **Konfigurirajte okoljske spremenljivke**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Zaženite MCP strežnik**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Preizkusite integracijo**:
   - Odprite VS Code s projektom
   - Konfigurirajte MCP strežnike v `.vscode/mcp.json`
   - Preizkusite AI Chat z vprašanji o podatkih maloprodaje

4. **Spremljajte zmogljivost**:
   - Oglejte si metrike v Application Insights
   - Preverite dnevnike v delovnem prostoru Log Analytics
   - Nastavite opozorila za pomembne dogodke

---

Za več informacij si oglejte [glavni README](../README.md) ali [QUICKSTART vodič](../QUICKSTART.md).

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.