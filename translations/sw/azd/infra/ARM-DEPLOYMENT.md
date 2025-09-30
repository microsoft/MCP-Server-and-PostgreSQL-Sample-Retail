<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:14:34+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "sw"
}
-->
# Maelekezo ya Utekelezaji wa Kiolezo cha ARM

Hati hii inatoa maelekezo ya kupeleka miundombinu ya MCP Retail Analytics kwa kutumia kiolezo cha ARM.

## 📋 Muhtasari

Kiolezo cha `azuredeploy.json` cha ARM kinatoa utekelezaji kamili wa:
- Kikundi cha Rasilimali cha Azure  
- Workspace ya Log Analytics  
- Application Insights  
- Huduma za AI za Azure (Foundry)  
- Utekelezaji wa Miundo ya OpenAI (GPT-4o-mini, text-embedding-3-small)  

## 🚀 Chaguo za Utekelezaji

### Chaguo 1: Utekelezaji kwa Azure CLI

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

### Chaguo 2: Utekelezaji kwa PowerShell

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

### Chaguo 3: Azure Portal

1. Tembelea [Azure Portal](https://portal.azure.com)  
2. Tafuta "Deploy a custom template"  
3. Bonyeza "Build your own template in the editor"  
4. Nakili na bandika maudhui ya `azuredeploy.json`  
5. Bonyeza "Save" kisha "Review + create"  
6. Jaza vigezo vinavyohitajika na upeleke  

## 🔧 Vigezo vya Kiolezo

| Kigezo | Aina | Chaguo-msingi | Maelezo |
|--------|------|--------------|----------|
| `resourcePrefix` | string | `mcpretail` | Kiambishi awali cha majina ya rasilimali |
| `location` | string | `westus2` | Eneo la Azure kwa utekelezaji |
| `uniqueSuffix` | string | Auto-generated | Kitambulisho cha kipekee cha herufi 4 |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Jina la kuonyesha la mradi wa AI |
| `aiProjectDescription` | string | Maelezo ya mradi | Maelezo yanayoonyeshwa katika Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Uwezo wa tokeni kwa modeli ya GPT |
| `embeddingModelCapacity` | int | `50` | Uwezo wa tokeni kwa modeli ya embedding |
| `tags` | object | Lebo za chaguo-msingi | Lebo za rasilimali kwa usimamizi |

## 📤 Matokeo ya Kiolezo

Kiolezo kinatoa matokeo yafuatayo:

| Matokeo | Maelezo |
|---------|----------|
| `subscriptionId` | Kitambulisho cha usajili wa Azure |
| `resourceGroupName` | Jina la kikundi cha rasilimali kilichoundwa |
| `aiFoundryName` | Jina la huduma ya Azure AI Foundry |
| `foundryEndpoint` | URL ya endpoint ya huduma ya AI |
| `foundryAccountKey` | Funguo ya ufikiaji wa huduma ya AI |
| `deployedModels` | Orodha ya miundo ya OpenAI iliyotekelezwa |
| `applicationInsightsConnectionString` | Mstari wa muunganisho wa Application Insights |
| `logAnalyticsWorkspaceName` | Jina la workspace ya Log Analytics |

## 🔍 Amri za Uhakiki

Baada ya utekelezaji, hakiki rasilimali:

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

Mradi huu unatoa violezo vya ARM na Bicep:

### Kiolezo cha ARM (`azuredeploy.json`)
- ✅ Muundo wa asili wa Azure Resource Manager  
- ✅ Inafanya kazi kila mahali ARM inakubaliwa  
- ✅ Hakuna zana za ziada zinazohitajika  
- ❌ Sintaksia ya JSON yenye maneno mengi  
- ❌ Ngumu kusoma na kudumisha  

### Kiolezo cha Bicep (`main.bicep`)
- ✅ Sintaksia ya kisasa, safi  
- ✅ Zana bora na IntelliSense  
- ✅ Rahisi kusoma na kudumisha  
- ✅ Uthibitishaji wa wakati wa kuunda  
- ❌ Inahitaji Bicep CLI  
- ❌ Hatua ya ziada ya ujenzi  

**Pendekezo**: Tumia violezo vya Bicep (`main.bicep`) kwa maendeleo na kiolezo cha ARM (`azuredeploy.json`) kwa hali zinazohitaji JSON safi ya ARM.

## 🔧 Uboreshaji

### Kuongeza Rasilimali za Kawaida

Ili kuongeza rasilimali za ziada kwenye kiolezo cha ARM:

1. Ongeza ufafanuzi wa rasilimali kwenye safu ya `resources` ya kiolezo kilichojikita  
2. Ongeza vigezo vipya kwenye sehemu ya `parameters`  
3. Ongeza matokeo yanayolingana ikiwa yanahitajika  
4. Sasisha faili ya vigezo na maadili ya chaguo-msingi  

### Mfano: Kuongeza Akaunti ya Hifadhi

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

## 🐛 Utatuzi wa Matatizo

### Masuala ya Kawaida

#### 1. Makosa ya Uthibitishaji wa Kiolezo
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Migongano ya Majina ya Rasilimali
- Hakikisha `uniqueSuffix` ni ya kipekee kweli  
- Tumia kazi ya `uniqueString()` kwa kizazi cha kiotomatiki  
- Angalia rasilimali zilizopo katika eneo lengwa  

#### 3. Vikomo vya Quota
- Hakiki upatikanaji wa modeli ya OpenAI katika eneo lengwa  
- Angalia vikomo vya usajili kwa huduma za AI  
- Fikiria kutumia maeneo tofauti ikiwa vikomo vimefikiwa  

#### 4. Masuala ya Ruhusa
- Hakikisha akaunti ina jukumu la Contributor kwenye usajili  
- Angalia kuwa usajili umewezeshwa kwa huduma za AI  
- Hakiki usajili wa watoa huduma wa rasilimali  

### Amri za Urekebishaji

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

## 🔐 Masuala ya Usalama

### Udhibiti wa Ufikiaji
- Huduma ya AI hutumia utambulisho unaosimamiwa kwa ufikiaji salama  
- Kikundi cha rasilimali kinatoa mipaka ya RBAC  
- Application Insights ina udhibiti wa ufikiaji tofauti  

### Usalama wa Mtandao
- Ufikiaji wa mtandao wa umma umewezeshwa kwa chaguo-msingi  
- Fikiria kutumia endpoints za kibinafsi kwa uzalishaji  
- ACL za mtandao zinaweza kusanidiwa kwa usalama wa ziada  

### Usimamizi wa Funguo
- Funguo za huduma ya AI zinazalishwa kiotomatiki  
- Tumia Azure Key Vault kwa siri za uzalishaji  
- Badilisha funguo mara kwa mara kwa usalama  

## 📚 Hatua Zifuatazo

Baada ya utekelezaji uliofanikiwa:

1. **Sanidi Vigezo vya Mazingira**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Anzisha Seva ya MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Jaribu Muunganisho**:
   - Fungua VS Code na mradi  
   - Sanidi seva za MCP katika `.vscode/mcp.json`  
   - Jaribu AI Chat na maswali ya data ya rejareja  

4. **Fuatilia Utendaji**:
   - Tazama vipimo katika Application Insights  
   - Angalia kumbukumbu katika workspace ya Log Analytics  
   - Sanidi arifa kwa matukio muhimu  

---

Kwa maelezo zaidi, angalia [README kuu](../README.md) au [mwongozo wa QUICKSTART](../QUICKSTART.md).

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.