<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:07:42+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ne"
}
-->
# ARM टेम्प्लेट परिनियोजन निर्देशनहरू

यो दस्तावेजले MCP Retail Analytics पूर्वाधारलाई ARM टेम्प्लेट प्रयोग गरेर परिनियोजन गर्ने निर्देशनहरू प्रदान गर्दछ।

## 📋 अवलोकन

`azuredeploy.json` ARM टेम्प्लेटले निम्न परिनियोजनको पूर्ण सेटअप प्रदान गर्दछ:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI मोडेल परिनियोजनहरू (GPT-4o-mini, text-embedding-3-small)

## 🚀 परिनियोजन विकल्पहरू

### विकल्प १: Azure CLI परिनियोजन

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

### विकल्प २: PowerShell परिनियोजन

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

### विकल्प ३: Azure Portal

1. [Azure Portal](https://portal.azure.com) मा जानुहोस्
2. "Deploy a custom template" खोज्नुहोस्
3. "Build your own template in the editor" क्लिक गर्नुहोस्
4. `azuredeploy.json` को सामग्री प्रतिलिपि गरेर टेम्प्लेटमा टाँस्नुहोस्
5. "Save" अनि "Review + create" क्लिक गर्नुहोस्
6. आवश्यक प्यारामिटरहरू भर्नुहोस् र परिनियोजन गर्नुहोस्

## 🔧 टेम्प्लेट प्यारामिटरहरू

| प्यारामिटर | प्रकार | डिफल्ट | विवरण |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | स्रोत नामहरूको लागि प्रिफिक्स |
| `location` | string | `westus2` | परिनियोजनको लागि Azure क्षेत्र |
| `uniqueSuffix` | string | स्वतः उत्पन्न | ४-वर्णको अद्वितीय पहिचानकर्ता |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI परियोजनाको प्रदर्शन नाम |
| `aiProjectDescription` | string | परियोजनाको विवरण | Azure AI Foundry मा देखिने विवरण |
| `gptModelCapacity` | int | `120` | GPT मोडेलको टोकन क्षमता |
| `embeddingModelCapacity` | int | `50` | embedding मोडेलको टोकन क्षमता |
| `tags` | object | डिफल्ट ट्यागहरू | शासनको लागि स्रोत ट्यागहरू |

## 📤 टेम्प्लेट आउटपुटहरू

टेम्प्लेटले निम्न आउटपुटहरू प्रदान गर्दछ:

| आउटपुट | विवरण |
|--------|-------------|
| `subscriptionId` | Azure सदस्यता ID |
| `resourceGroupName` | सिर्जना गरिएको स्रोत समूहको नाम |
| `aiFoundryName` | Azure AI Foundry सेवाको नाम |
| `foundryEndpoint` | AI सेवाको अन्त बिन्दु URL |
| `foundryAccountKey` | AI सेवाको पहुँच कुञ्जी |
| `deployedModels` | परिनियोजित OpenAI मोडेलहरूको सूची |
| `applicationInsightsConnectionString` | Application Insights कनेक्शन स्ट्रिङ |
| `logAnalyticsWorkspaceName` | Log Analytics कार्यक्षेत्रको नाम |

## 🔍 सत्यापन आदेशहरू

परिनियोजनपछि स्रोतहरू सत्यापन गर्नुहोस्:

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

## 🆚 ARM बनाम Bicep

यस परियोजनाले ARM र Bicep टेम्प्लेट दुवै प्रदान गर्दछ:

### ARM टेम्प्लेट (`azuredeploy.json`)
- ✅ मूल Azure Resource Manager ढाँचा
- ✅ जहाँसुकै ARM समर्थित छ, त्यहाँ काम गर्दछ
- ✅ थप उपकरण आवश्यक छैन
- ❌ JSON सिंट्याक्स बढी विस्तृत
- ❌ पढ्न र मर्मत गर्न गाह्रो

### Bicep टेम्प्लेट (`main.bicep`)
- ✅ आधुनिक, सफा सिंट्याक्स
- ✅ राम्रो उपकरण र IntelliSense
- ✅ पढ्न र मर्मत गर्न सजिलो
- ✅ कम्पाइल-समय मान्यता
- ❌ Bicep CLI आवश्यक
- ❌ थप निर्माण चरण

**सिफारिस**: विकासको लागि Bicep टेम्प्लेट (`main.bicep`) प्रयोग गर्नुहोस् र शुद्ध ARM JSON आवश्यक पर्ने परिदृश्यहरूको लागि ARM टेम्प्लेट (`azuredeploy.json`) प्रयोग गर्नुहोस्।

## 🔧 अनुकूलन

### अनुकूल स्रोतहरू थप्दै

ARM टेम्प्लेटमा थप स्रोतहरू थप्न:

1. स्रोत परिभाषालाई nested टेम्प्लेटको `resources` array मा थप्नुहोस्
2. नयाँ प्यारामिटरहरू `parameters` खण्डमा थप्नुहोस्
3. आवश्यक परेमा सम्बन्धित आउटपुटहरू थप्नुहोस्
4. डिफल्ट मानहरूसहित प्यारामिटर फाइल अद्यावधिक गर्नुहोस्

### उदाहरण: Storage Account थप्दै

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

## 🐛 समस्या समाधान

### सामान्य समस्याहरू

#### १. टेम्प्लेट मान्यता त्रुटिहरू
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### २. स्रोत नामको द्वन्द्व
- सुनिश्चित गर्नुहोस् कि `uniqueSuffix` वास्तवमै अद्वितीय छ
- स्वतः उत्पन्न गर्न `uniqueString()` function प्रयोग गर्नुहोस्
- लक्षित क्षेत्रमा पहिले नै भएका स्रोतहरू जाँच गर्नुहोस्

#### ३. कोटा सीमा
- लक्षित क्षेत्रमा OpenAI मोडेल उपलब्धता जाँच गर्नुहोस्
- AI सेवाहरूको लागि सदस्यता कोटा जाँच गर्नुहोस्
- सीमा पुगेको अवस्थामा अन्य क्षेत्रहरू प्रयोग गर्ने विचार गर्नुहोस्

#### ४. अनुमति समस्याहरू
- सुनिश्चित गर्नुहोस् कि खाता सदस्यतामा Contributor भूमिका छ
- सदस्यता AI सेवाहरूको लागि सक्षम छ भनी जाँच गर्नुहोस्
- स्रोत प्रदायक दर्ता जाँच गर्नुहोस्

### डिबगिङ आदेशहरू

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

## 🔐 सुरक्षा विचारहरू

### पहुँच नियन्त्रण
- AI सेवाले सुरक्षित पहुँचको लागि प्रबन्धित पहिचान प्रयोग गर्दछ
- स्रोत समूहले RBAC को लागि सीमा प्रदान गर्दछ
- Application Insights मा अलग पहुँच नियन्त्रणहरू छन्

### नेटवर्क सुरक्षा
- सार्वजनिक नेटवर्क पहुँच डिफल्ट रूपमा सक्षम छ
- उत्पादनको लागि निजी अन्त बिन्दुहरू विचार गर्नुहोस्
- थप सुरक्षाको लागि नेटवर्क ACLs कन्फिगर गर्न सकिन्छ

### कुञ्जी व्यवस्थापन
- AI सेवाका कुञ्जीहरू स्वतः उत्पन्न हुन्छन्
- उत्पादन गोप्यहरूको लागि Azure Key Vault प्रयोग गर्नुहोस्
- सुरक्षाको लागि कुञ्जीहरू नियमित रूपमा घुमाउनुहोस्

## 📚 आगामी चरणहरू

सफल परिनियोजनपछि:

1. **Environment Variables कन्फिगर गर्नुहोस्**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP Server सुरु गर्नुहोस्**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **एकीकरण परीक्षण गर्नुहोस्**:
   - परियोजनासँग VS Code खोल्नुहोस्
   - `.vscode/mcp.json` मा MCP सर्भरहरू कन्फिगर गर्नुहोस्
   - खुद्रा डेटा क्वेरीहरूसँग AI Chat परीक्षण गर्नुहोस्

4. **प्रदर्शन अनुगमन गर्नुहोस्**:
   - Application Insights मा मेट्रिक्स हेर्नुहोस्
   - Log Analytics कार्यक्षेत्रमा लगहरू जाँच गर्नुहोस्
   - महत्त्वपूर्ण घटनाहरूको लागि अलर्ट सेट गर्नुहोस्

---

थप जानकारीको लागि, [मुख्य README](../README.md) वा [QUICKSTART मार्गदर्शन](../QUICKSTART.md) हेर्नुहोस्।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी यथार्थताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। मूल दस्तावेज़ यसको मातृभाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौं।