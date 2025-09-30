<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:14:17+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "tl"
}
-->
# Mga Tagubilin sa Pag-deploy ng ARM Template

Ang dokumentong ito ay nagbibigay ng mga tagubilin para sa pag-deploy ng MCP Retail Analytics infrastructure gamit ang ARM template.

## 📋 Pangkalahatang-ideya

Ang `azuredeploy.json` ARM template ay nagbibigay ng kumpletong pag-deploy ng:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Mga Opsyon sa Pag-deploy

### Opsyon 1: Azure CLI Deployment

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

### Opsyon 2: PowerShell Deployment

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

### Opsyon 3: Azure Portal

1. Pumunta sa [Azure Portal](https://portal.azure.com)
2. Hanapin ang "Deploy a custom template"
3. I-click ang "Build your own template in the editor"
4. Kopyahin at i-paste ang nilalaman ng `azuredeploy.json`
5. I-click ang "Save" pagkatapos "Review + create"
6. Punan ang mga kinakailangang parameter at i-deploy

## 🔧 Mga Parameter ng Template

| Parameter | Uri | Default | Paglalarawan |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefix para sa mga pangalan ng resource |
| `location` | string | `westus2` | Azure region para sa pag-deploy |
| `uniqueSuffix` | string | Auto-generated | 4-character na natatanging identifier |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Pangalan ng proyekto para sa pagpapakita |
| `aiProjectDescription` | string | Paglalarawan ng proyekto | Paglalarawan na ipinapakita sa Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Token capacity para sa GPT model |
| `embeddingModelCapacity` | int | `50` | Token capacity para sa embedding model |
| `tags` | object | Default tags | Mga tag ng resource para sa pamamahala |

## 📤 Mga Output ng Template

Ang template ay nagbibigay ng mga sumusunod na output:

| Output | Paglalarawan |
|--------|-------------|
| `subscriptionId` | Azure subscription ID |
| `resourceGroupName` | Pangalan ng nalikhang resource group |
| `aiFoundryName` | Pangalan ng Azure AI Foundry service |
| `foundryEndpoint` | URL ng AI service endpoint |
| `foundryAccountKey` | Access key ng AI service |
| `deployedModels` | Array ng mga na-deploy na OpenAI models |
| `applicationInsightsConnectionString` | Application Insights connection string |
| `logAnalyticsWorkspaceName` | Pangalan ng Log Analytics workspace |

## 🔍 Mga Command para sa Pag-verify

Pagkatapos ng pag-deploy, i-verify ang mga resource:

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

Ang proyektong ito ay nagbibigay ng parehong ARM at Bicep templates:

### ARM Template (`azuredeploy.json`)
- ✅ Native Azure Resource Manager format
- ✅ Gumagana saanman suportado ang ARM
- ✅ Walang karagdagang tool na kinakailangan
- ❌ Mas mahaba ang JSON syntax
- ❌ Mas mahirap basahin at i-maintain

### Bicep Template (`main.bicep`)
- ✅ Moderno, malinis na syntax
- ✅ Mas mahusay na tooling at IntelliSense
- ✅ Mas madaling basahin at i-maintain
- ✅ Compile-time validation
- ❌ Kinakailangan ang Bicep CLI
- ❌ May karagdagang build step

**Rekomendasyon**: Gamitin ang Bicep templates (`main.bicep`) para sa development at ang ARM template (`azuredeploy.json`) para sa mga senaryong nangangailangan ng purong ARM JSON.

## 🔧 Pag-customize

### Pagdaragdag ng Custom na Mga Resource

Para magdagdag ng karagdagang mga resource sa ARM template:

1. Idagdag ang resource definition sa `resources` array ng nested template
2. Idagdag ang anumang bagong parameter sa `parameters` section
3. Idagdag ang kaukulang output kung kinakailangan
4. I-update ang parameters file gamit ang default values

### Halimbawa: Pagdaragdag ng Storage Account

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

## 🐛 Pag-troubleshoot

### Karaniwang Mga Isyu

#### 1. Mga Error sa Template Validation
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Mga Konflikto sa Pangalan ng Resource
- Siguraduhing ang `uniqueSuffix` ay tunay na natatangi
- Gamitin ang `uniqueString()` function para sa awtomatikong paglikha
- Suriin ang mga umiiral na resource sa target na rehiyon

#### 3. Mga Limitasyon sa Quota
- Suriin ang availability ng OpenAI model sa target na rehiyon
- Suriin ang subscription quotas para sa AI services
- Isaalang-alang ang paggamit ng ibang rehiyon kung naabot ang mga limitasyon

#### 4. Mga Isyu sa Pahintulot
- Siguraduhing ang account ay may Contributor role sa subscription
- Suriin na ang subscription ay naka-enable para sa AI services
- I-verify ang mga resource provider registrations

### Mga Command para sa Debugging

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

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Access Control
- Ang AI service ay gumagamit ng managed identity para sa secure na access
- Ang resource group ay nagbibigay ng boundary para sa RBAC
- Ang Application Insights ay may hiwalay na access controls

### Network Security
- Ang public network access ay naka-enable bilang default
- Isaalang-alang ang private endpoints para sa production
- Ang Network ACLs ay maaaring i-configure para sa karagdagang seguridad

### Key Management
- Ang mga key ng AI service ay awtomatikong nalilikha
- Gamitin ang Azure Key Vault para sa production secrets
- Regular na i-rotate ang mga key para sa seguridad

## 📚 Mga Susunod na Hakbang

Pagkatapos ng matagumpay na pag-deploy:

1. **I-configure ang Environment Variables**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Simulan ang MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Subukan ang Integrasyon**:
   - Buksan ang VS Code gamit ang proyekto
   - I-configure ang MCP servers sa `.vscode/mcp.json`
   - Subukan ang AI Chat gamit ang mga retail data query

4. **I-monitor ang Performance**:
   - Tingnan ang metrics sa Application Insights
   - Suriin ang logs sa Log Analytics workspace
   - Mag-set up ng alerts para sa mahahalagang events

---

Para sa karagdagang impormasyon, tingnan ang [main README](../README.md) o [QUICKSTART guide](../QUICKSTART.md).

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.