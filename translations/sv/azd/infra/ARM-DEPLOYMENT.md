<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:11:06+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "sv"
}
-->
# Instruktioner för ARM-mallens distribution

Detta dokument ger instruktioner för att distribuera MCP Retail Analytics-infrastrukturen med hjälp av ARM-mallen.

## 📋 Översikt

ARM-mallen `azuredeploy.json` tillhandahåller en komplett distribution av:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI-modelldistributioner (GPT-4o-mini, text-embedding-3-small)

## 🚀 Distributionsalternativ

### Alternativ 1: Azure CLI-distribution

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

### Alternativ 2: PowerShell-distribution

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

1. Gå till [Azure Portal](https://portal.azure.com)
2. Sök efter "Deploy a custom template"
3. Klicka på "Build your own template in the editor"
4. Kopiera och klistra in innehållet i `azuredeploy.json`
5. Klicka på "Save" och sedan "Review + create"
6. Fyll i de obligatoriska parametrarna och distribuera

## 🔧 Mallparametrar

| Parameter | Typ | Standard | Beskrivning |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefix för resursnamn |
| `location` | string | `westus2` | Azure-region för distribution |
| `uniqueSuffix` | string | Auto-genererad | 4-teckens unik identifierare |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Visningsnamn för AI-projekt |
| `aiProjectDescription` | string | Projektbeskrivning | Beskrivning som visas i Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Tokenkapacitet för GPT-modellen |
| `embeddingModelCapacity` | int | `50` | Tokenkapacitet för inbäddningsmodellen |
| `tags` | object | Standardtaggar | Resurstaggar för styrning |

## 📤 Mallutdata

Mallen tillhandahåller följande utdata:

| Utdata | Beskrivning |
|--------|-------------|
| `subscriptionId` | Azure-abonnemangs-ID |
| `resourceGroupName` | Namn på skapad resursgrupp |
| `aiFoundryName` | Namn på Azure AI Foundry-tjänsten |
| `foundryEndpoint` | URL för AI-tjänstens slutpunkt |
| `foundryAccountKey` | Åtkomstnyckel för AI-tjänsten |
| `deployedModels` | Array av distribuerade OpenAI-modeller |
| `applicationInsightsConnectionString` | Anslutningssträng för Application Insights |
| `logAnalyticsWorkspaceName` | Namn på Log Analytics-arbetsyta |

## 🔍 Verifieringskommandon

Efter distribution, verifiera resurser:

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

Detta projekt tillhandahåller både ARM- och Bicep-mallar:

### ARM-mall (`azuredeploy.json`)
- ✅ Native Azure Resource Manager-format
- ✅ Fungerar överallt där ARM stöds
- ✅ Ingen extra verktyg krävs
- ❌ Mer detaljerad JSON-syntax
- ❌ Svårare att läsa och underhålla

### Bicep-mall (`main.bicep`)
- ✅ Modern, ren syntax
- ✅ Bättre verktyg och IntelliSense
- ✅ Lättare att läsa och underhålla
- ✅ Validering vid kompilering
- ❌ Kräver Bicep CLI
- ❌ Extra byggsteg

**Rekommendation**: Använd Bicep-mallar (`main.bicep`) för utveckling och ARM-mallen (`azuredeploy.json`) för scenarier som kräver ren ARM JSON.

## 🔧 Anpassning

### Lägga till anpassade resurser

För att lägga till ytterligare resurser i ARM-mallen:

1. Lägg till resursdefinitionen i den inbäddade mallens `resources`-array
2. Lägg till eventuella nya parametrar i `parameters`-sektionen
3. Lägg till motsvarande utdata om det behövs
4. Uppdatera parameterfilen med standardvärden

### Exempel: Lägga till lagringskonto

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

## 🐛 Felsökning

### Vanliga problem

#### 1. Valideringsfel i mallen
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikter med resursnamn
- Säkerställ att `uniqueSuffix` är verkligen unik
- Använd funktionen `uniqueString()` för automatisk generering
- Kontrollera befintliga resurser i målregionen

#### 3. Kvotbegränsningar
- Verifiera tillgängligheten för OpenAI-modeller i målregionen
- Kontrollera abonnemangets kvoter för AI-tjänster
- Överväg att använda andra regioner om gränserna är nådda

#### 4. Behörighetsproblem
- Säkerställ att kontot har Contributor-roll på abonnemanget
- Kontrollera att abonnemanget är aktiverat för AI-tjänster
- Verifiera registreringar av resursleverantörer

### Felsökningskommandon

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

## 🔐 Säkerhetsöverväganden

### Åtkomstkontroll
- AI-tjänsten använder hanterad identitet för säker åtkomst
- Resursgruppen tillhandahåller gränser för RBAC
- Application Insights har separata åtkomstkontroller

### Nätverkssäkerhet
- Offentlig nätverksåtkomst är aktiverad som standard
- Överväg privata slutpunkter för produktion
- Nätverks-ACL:er kan konfigureras för ytterligare säkerhet

### Nyckelhantering
- AI-tjänstens nycklar genereras automatiskt
- Använd Azure Key Vault för produktionshemligheter
- Rotera nycklar regelbundet för säkerhet

## 📚 Nästa steg

Efter lyckad distribution:

1. **Konfigurera miljövariabler**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Starta MCP-server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testa integration**:
   - Öppna VS Code med projektet
   - Konfigurera MCP-servrar i `.vscode/mcp.json`
   - Testa AI-chatten med detaljhandelsdatafrågor

4. **Övervaka prestanda**:
   - Visa mätvärden i Application Insights
   - Kontrollera loggar i Log Analytics-arbetsyta
   - Ställ in varningar för viktiga händelser

---

För mer information, se [huvud-README](../README.md) eller [QUICKSTART-guide](../QUICKSTART.md).

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen notera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.