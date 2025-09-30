<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:11:26+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "da"
}
-->
# ARM Template Implementeringsinstruktioner

Dette dokument giver instruktioner til implementering af MCP Retail Analytics-infrastrukturen ved hjælp af ARM-skabelonen.

## 📋 Oversigt

ARM-skabelonen `azuredeploy.json` leverer en komplet implementering af:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Implementeringer (GPT-4o-mini, text-embedding-3-small)

## 🚀 Implementeringsmuligheder

### Mulighed 1: Azure CLI Implementering

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

### Mulighed 2: PowerShell Implementering

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

### Mulighed 3: Azure Portal

1. Gå til [Azure Portal](https://portal.azure.com)
2. Søg efter "Deploy a custom template"
3. Klik på "Build your own template in the editor"
4. Kopiér og indsæt indholdet af `azuredeploy.json`
5. Klik på "Save" og derefter "Review + create"
6. Udfyld de nødvendige parametre og implementer

## 🔧 Skabelonparametre

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `resourcePrefix` | string | `mcpretail` | Præfiks for ressource-navne |
| `location` | string | `westus2` | Azure-region for implementering |
| `uniqueSuffix` | string | Auto-genereret | 4-tegns unik identifikator |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Visningsnavn for AI-projekt |
| `aiProjectDescription` | string | Projektbeskrivelse | Beskrivelse vist i Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Token-kapacitet for GPT-model |
| `embeddingModelCapacity` | int | `50` | Token-kapacitet for embedding-model |
| `tags` | object | Standard tags | Ressourcetags til styring |

## 📤 Skabelonoutputs

Skabelonen leverer følgende outputs:

| Output | Beskrivelse |
|--------|-------------|
| `subscriptionId` | Azure-abonnements-ID |
| `resourceGroupName` | Navn på oprettet resource group |
| `aiFoundryName` | Navn på Azure AI Foundry-tjeneste |
| `foundryEndpoint` | URL til AI-tjenestens endpoint |
| `foundryAccountKey` | Adgangsnøgle til AI-tjenesten |
| `deployedModels` | Array af implementerede OpenAI-modeller |
| `applicationInsightsConnectionString` | Forbindelsesstreng til Application Insights |
| `logAnalyticsWorkspaceName` | Navn på Log Analytics workspace |

## 🔍 Verifikationskommandoer

Efter implementering, verificér ressourcer:

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

Dette projekt tilbyder både ARM- og Bicep-skabeloner:

### ARM-skabelon (`azuredeploy.json`)
- ✅ Native Azure Resource Manager-format
- ✅ Fungerer overalt, hvor ARM understøttes
- ✅ Ingen ekstra værktøjer kræves
- ❌ Mere detaljeret JSON-syntaks
- ❌ Sværere at læse og vedligeholde

### Bicep-skabelon (`main.bicep`)
- ✅ Moderne, ren syntaks
- ✅ Bedre værktøjer og IntelliSense
- ✅ Nem at læse og vedligeholde
- ✅ Validering ved kompilering
- ❌ Kræver Bicep CLI
- ❌ Ekstra byggeproces

**Anbefaling**: Brug Bicep-skabeloner (`main.bicep`) til udvikling og ARM-skabelonen (`azuredeploy.json`) til scenarier, der kræver ren ARM JSON.

## 🔧 Tilpasning

### Tilføjelse af brugerdefinerede ressourcer

For at tilføje yderligere ressourcer til ARM-skabelonen:

1. Tilføj ressource-definitionen til den indlejrede skabelons `resources`-array
2. Tilføj eventuelle nye parametre til `parameters`-sektionen
3. Tilføj tilsvarende outputs, hvis nødvendigt
4. Opdater parameterfilen med standardværdier

### Eksempel: Tilføjelse af Storage Account

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

## 🐛 Fejlfinding

### Almindelige problemer

#### 1. Skabelonvalideringsfejl
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikter med ressourcenavne
- Sørg for, at `uniqueSuffix` er virkelig unik
- Brug funktionen `uniqueString()` til automatisk generering
- Tjek eksisterende ressourcer i den målrettede region

#### 3. Kvotebegrænsninger
- Verificér OpenAI-modeltilgængelighed i den målrettede region
- Tjek abonnementskvoter for AI-tjenester
- Overvej at bruge andre regioner, hvis grænser er nået

#### 4. Tilladelsesproblemer
- Sørg for, at kontoen har Contributor-rolle på abonnementet
- Tjek, at abonnementet er aktiveret for AI-tjenester
- Verificér registrering af ressourceudbydere

### Fejlfindingskommandoer

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

## 🔐 Sikkerhedsovervejelser

### Adgangskontrol
- AI-tjenesten bruger managed identity for sikker adgang
- Resource group giver grænser for RBAC
- Application Insights har separate adgangskontroller

### Netværkssikkerhed
- Offentlig netværksadgang er aktiveret som standard
- Overvej private endpoints til produktion
- Netværks-ACL'er kan konfigureres for ekstra sikkerhed

### Nøglehåndtering
- AI-tjenestenøgler genereres automatisk
- Brug Azure Key Vault til produktionshemmeligheder
- Roter nøgler regelmæssigt for sikkerhed

## 📚 Næste trin

Efter vellykket implementering:

1. **Konfigurer miljøvariabler**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Start MCP-server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Test integration**:
   - Åbn VS Code med projektet
   - Konfigurer MCP-servere i `.vscode/mcp.json`
   - Test AI Chat med forespørgsler på detaildata

4. **Overvåg ydeevne**:
   - Se metrikker i Application Insights
   - Tjek logs i Log Analytics workspace
   - Opsæt alarmer for vigtige hændelser

---

For mere information, se [main README](../README.md) eller [QUICKSTART guide](../QUICKSTART.md).

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at levere nøjagtige oversættelser, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.