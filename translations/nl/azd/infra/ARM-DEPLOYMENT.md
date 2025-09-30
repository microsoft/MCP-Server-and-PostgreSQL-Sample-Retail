<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:12:37+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "nl"
}
-->
# ARM Template Implementatie-Instructies

Dit document biedt instructies voor het implementeren van de MCP Retail Analytics-infrastructuur met behulp van de ARM-template.

## 📋 Overzicht

De `azuredeploy.json` ARM-template biedt een volledige implementatie van:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Implementaties (GPT-4o-mini, text-embedding-3-small)

## 🚀 Implementatieopties

### Optie 1: Azure CLI Implementatie

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

### Optie 2: PowerShell Implementatie

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

### Optie 3: Azure Portal

1. Ga naar [Azure Portal](https://portal.azure.com)
2. Zoek naar "Een aangepaste template implementeren"
3. Klik op "Maak uw eigen template in de editor"
4. Kopieer en plak de inhoud van `azuredeploy.json`
5. Klik op "Opslaan" en vervolgens op "Controleren + maken"
6. Vul de vereiste parameters in en implementeer

## 🔧 Template Parameters

| Parameter | Type | Standaard | Beschrijving |
|-----------|------|-----------|--------------|
| `resourcePrefix` | string | `mcpretail` | Voorvoegsel voor resourcenamen |
| `location` | string | `westus2` | Azure-regio voor implementatie |
| `uniqueSuffix` | string | Automatisch gegenereerd | 4-karakter unieke identificatie |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Weergavenaam voor AI-project |
| `aiProjectDescription` | string | Projectbeschrijving | Beschrijving weergegeven in Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Token capaciteit voor GPT-model |
| `embeddingModelCapacity` | int | `50` | Token capaciteit voor embedding-model |
| `tags` | object | Standaard tags | Resource tags voor governance |

## 📤 Template Outputs

De template biedt de volgende outputs:

| Output | Beschrijving |
|--------|--------------|
| `subscriptionId` | Azure-abonnement ID |
| `resourceGroupName` | Naam van aangemaakte resourcegroep |
| `aiFoundryName` | Naam van Azure AI Foundry-service |
| `foundryEndpoint` | URL van AI-service endpoint |
| `foundryAccountKey` | Toegangssleutel voor AI-service |
| `deployedModels` | Array van geïmplementeerde OpenAI-modellen |
| `applicationInsightsConnectionString` | Connection string voor Application Insights |
| `logAnalyticsWorkspaceName` | Naam van Log Analytics workspace |

## 🔍 Verificatiecommando's

Na implementatie, verifieer resources:

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

Dit project biedt zowel ARM- als Bicep-templates:

### ARM Template (`azuredeploy.json`)
- ✅ Native Azure Resource Manager formaat
- ✅ Werkt overal waar ARM wordt ondersteund
- ✅ Geen extra tooling nodig
- ❌ Meer uitgebreide JSON-syntaxis
- ❌ Moeilijker te lezen en te onderhouden

### Bicep Template (`main.bicep`)
- ✅ Moderne, overzichtelijke syntaxis
- ✅ Betere tooling en IntelliSense
- ✅ Makkelijker te lezen en te onderhouden
- ✅ Validatie tijdens compilatie
- ❌ Vereist Bicep CLI
- ❌ Extra bouwstap nodig

**Aanbeveling**: Gebruik Bicep-templates (`main.bicep`) voor ontwikkeling en de ARM-template (`azuredeploy.json`) voor scenario's die puur ARM JSON vereisen.

## 🔧 Aanpassingen

### Toevoegen van Aangepaste Resources

Om extra resources toe te voegen aan de ARM-template:

1. Voeg de resource-definitie toe aan de `resources` array van de nested template
2. Voeg eventuele nieuwe parameters toe aan de `parameters` sectie
3. Voeg indien nodig bijbehorende outputs toe
4. Werk het parametersbestand bij met standaardwaarden

### Voorbeeld: Toevoegen van Storage Account

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

## 🐛 Problemen oplossen

### Veelvoorkomende Problemen

#### 1. Template Validatiefouten
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Resource Naamconflicten
- Zorg ervoor dat `uniqueSuffix` echt uniek is
- Gebruik de `uniqueString()` functie voor automatische generatie
- Controleer bestaande resources in de doelregio

#### 3. Quota Limieten
- Controleer beschikbaarheid van OpenAI-modellen in de doelregio
- Controleer abonnementquota voor AI-services
- Overweeg andere regio's te gebruiken als limieten zijn bereikt

#### 4. Machtigingsproblemen
- Zorg ervoor dat het account de Contributor-rol heeft op het abonnement
- Controleer of het abonnement is ingeschakeld voor AI-services
- Verifieer resourceproviderregistraties

### Debugging Commando's

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

## 🔐 Beveiligingsoverwegingen

### Toegangscontrole
- AI-service gebruikt managed identity voor veilige toegang
- Resourcegroep biedt grens voor RBAC
- Application Insights heeft aparte toegangscontroles

### Netwerkbeveiliging
- Publieke netwerktoegang standaard ingeschakeld
- Overweeg private endpoints voor productie
- Netwerk ACL's kunnen worden geconfigureerd voor extra beveiliging

### Sleutelbeheer
- AI-service sleutels worden automatisch gegenereerd
- Gebruik Azure Key Vault voor productiegeheimen
- Draai sleutels regelmatig voor beveiliging

## 📚 Volgende Stappen

Na succesvolle implementatie:

1. **Configureer Omgevingsvariabelen**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Start MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Test Integratie**:
   - Open VS Code met het project
   - Configureer MCP-servers in `.vscode/mcp.json`
   - Test AI Chat met retail data queries

4. **Monitor Prestaties**:
   - Bekijk metrics in Application Insights
   - Controleer logs in Log Analytics workspace
   - Stel waarschuwingen in voor belangrijke gebeurtenissen

---

Voor meer informatie, zie de [hoofd README](../README.md) of [QUICKSTART gids](../QUICKSTART.md).

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.