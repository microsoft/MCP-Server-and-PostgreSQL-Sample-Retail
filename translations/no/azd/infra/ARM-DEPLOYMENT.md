<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:11:50+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "no"
}
-->
# ARM-mal distribusjonsinstruksjoner

Dette dokumentet gir instruksjoner for å distribuere MCP Retail Analytics-infrastrukturen ved hjelp av ARM-malen.

## 📋 Oversikt

`azuredeploy.json` ARM-malen gir en komplett distribusjon av:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI-modelldistribusjoner (GPT-4o-mini, text-embedding-3-small)

## 🚀 Distribusjonsalternativer

### Alternativ 1: Azure CLI-distribusjon

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

### Alternativ 2: PowerShell-distribusjon

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

### Alternativ 3: Azure Portal

1. Gå til [Azure Portal](https://portal.azure.com)
2. Søk etter "Deploy a custom template"
3. Klikk "Build your own template in the editor"
4. Kopier og lim inn innholdet i `azuredeploy.json`
5. Klikk "Save" deretter "Review + create"
6. Fyll inn de nødvendige parameterne og distribuer

## 🔧 Malparametere

| Parameter | Type | Standard | Beskrivelse |
|-----------|------|----------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefiks for ressursnavn |
| `location` | string | `westus2` | Azure-region for distribusjon |
| `uniqueSuffix` | string | Auto-generert | 4-tegns unik identifikator |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Visningsnavn for AI-prosjekt |
| `aiProjectDescription` | string | Prosjektbeskrivelse | Beskrivelse vist i Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Tokenkapasitet for GPT-modellen |
| `embeddingModelCapacity` | int | `50` | Tokenkapasitet for embedding-modellen |
| `tags` | object | Standard tags | Ressursmerker for styring |

## 📤 Malutganger

Malen gir følgende utganger:

| Utgang | Beskrivelse |
|--------|-------------|
| `subscriptionId` | Azure-abonnements-ID |
| `resourceGroupName` | Opprettet ressursgruppe navn |
| `aiFoundryName` | Azure AI Foundry tjenestenavn |
| `foundryEndpoint` | AI-tjenestens endepunkt-URL |
| `foundryAccountKey` | AI-tjenestens tilgangsnøkkel |
| `deployedModels` | Array av distribuerte OpenAI-modeller |
| `applicationInsightsConnectionString` | Application Insights tilkoblingsstreng |
| `logAnalyticsWorkspaceName` | Log Analytics arbeidsområde navn |

## 🔍 Verifiseringskommandoer

Etter distribusjon, verifiser ressurser:

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

Dette prosjektet tilbyr både ARM- og Bicep-maler:

### ARM-mal (`azuredeploy.json`)
- ✅ Naturlig Azure Resource Manager-format
- ✅ Fungerer overalt hvor ARM støttes
- ✅ Ingen ekstra verktøy nødvendig
- ❌ Mer detaljert JSON-syntaks
- ❌ Vanskeligere å lese og vedlikeholde

### Bicep-mal (`main.bicep`)
- ✅ Moderne, ren syntaks
- ✅ Bedre verktøy og IntelliSense
- ✅ Enklere å lese og vedlikeholde
- ✅ Validering ved kompilering
- ❌ Krever Bicep CLI
- ❌ Ekstra byggeprosess

**Anbefaling**: Bruk Bicep-maler (`main.bicep`) for utvikling og ARM-malen (`azuredeploy.json`) for scenarier som krever ren ARM JSON.

## 🔧 Tilpasning

### Legge til egendefinerte ressurser

For å legge til ekstra ressurser i ARM-malen:

1. Legg til ressursdefinisjonen i den nestede malens `resources`-array
2. Legg til eventuelle nye parametere i `parameters`-seksjonen
3. Legg til tilsvarende utganger hvis nødvendig
4. Oppdater parameterfilen med standardverdier

### Eksempel: Legge til lagringskonto

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

## 🐛 Feilsøking

### Vanlige problemer

#### 1. Valideringsfeil i mal
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikter med ressursnavn
- Sørg for at `uniqueSuffix` er virkelig unik
- Bruk `uniqueString()`-funksjonen for automatisk generering
- Sjekk eksisterende ressurser i målregionen

#### 3. Kvotebegrensninger
- Verifiser tilgjengeligheten av OpenAI-modeller i målregionen
- Sjekk abonnementskvoter for AI-tjenester
- Vurder å bruke andre regioner hvis grenser er nådd

#### 4. Tillatelsesproblemer
- Sørg for at kontoen har Contributor-rolle på abonnementet
- Sjekk at abonnementet er aktivert for AI-tjenester
- Verifiser registreringer av ressursleverandører

### Feilsøkingskommandoer

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

## 🔐 Sikkerhetsvurderinger

### Tilgangskontroll
- AI-tjenesten bruker administrert identitet for sikker tilgang
- Ressursgruppen gir grense for RBAC
- Application Insights har separate tilgangskontroller

### Nettverkssikkerhet
- Offentlig nettverkstilgang er aktivert som standard
- Vurder private endepunkter for produksjon
- Nettverks-ACL-er kan konfigureres for ekstra sikkerhet

### Nøkkelhåndtering
- AI-tjenestenøkler genereres automatisk
- Bruk Azure Key Vault for produksjonshemmeligheter
- Roter nøkler regelmessig for sikkerhet

## 📚 Neste steg

Etter vellykket distribusjon:

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

3. **Test integrasjon**:
   - Åpne VS Code med prosjektet
   - Konfigurer MCP-servere i `.vscode/mcp.json`
   - Test AI-chat med detaljhandelsdataforespørsler

4. **Overvåk ytelse**:
   - Se på metrikker i Application Insights
   - Sjekk logger i Log Analytics arbeidsområde
   - Sett opp varsler for viktige hendelser

---

For mer informasjon, se [main README](../README.md) eller [QUICKSTART guide](../QUICKSTART.md).

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.