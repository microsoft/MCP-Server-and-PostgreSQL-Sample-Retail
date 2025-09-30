<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:06:35+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "hi"
}
-->
# ARM टेम्पलेट डिप्लॉयमेंट निर्देश

यह दस्तावेज़ MCP रिटेल एनालिटिक्स इंफ्रास्ट्रक्चर को ARM टेम्पलेट का उपयोग करके डिप्लॉय करने के निर्देश प्रदान करता है।

## 📋 अवलोकन

`azuredeploy.json` ARM टेम्पलेट निम्नलिखित का पूर्ण डिप्लॉयमेंट प्रदान करता है:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 डिप्लॉयमेंट विकल्प

### विकल्प 1: Azure CLI डिप्लॉयमेंट

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

### विकल्प 2: PowerShell डिप्लॉयमेंट

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

### विकल्प 3: Azure पोर्टल

1. [Azure पोर्टल](https://portal.azure.com) पर जाएं
2. "Deploy a custom template" खोजें
3. "Build your own template in the editor" पर क्लिक करें
4. `azuredeploy.json` की सामग्री कॉपी और पेस्ट करें
5. "Save" और फिर "Review + create" पर क्लिक करें
6. आवश्यक पैरामीटर भरें और डिप्लॉय करें

## 🔧 टेम्पलेट पैरामीटर

| पैरामीटर | प्रकार | डिफ़ॉल्ट | विवरण |
|----------|-------|----------|--------|
| `resourcePrefix` | string | `mcpretail` | संसाधन नामों के लिए प्रीफिक्स |
| `location` | string | `westus2` | डिप्लॉयमेंट के लिए Azure क्षेत्र |
| `uniqueSuffix` | string | ऑटो-जनरेटेड | 4-अक्षर का यूनिक पहचानकर्ता |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI प्रोजेक्ट का डिस्प्ले नाम |
| `aiProjectDescription` | string | प्रोजेक्ट विवरण | Azure AI Foundry में दिखाया गया विवरण |
| `gptModelCapacity` | int | `120` | GPT मॉडल के लिए टोकन क्षमता |
| `embeddingModelCapacity` | int | `50` | एम्बेडिंग मॉडल के लिए टोकन क्षमता |
| `tags` | object | डिफ़ॉल्ट टैग्स | गवर्नेंस के लिए संसाधन टैग्स |

## 📤 टेम्पलेट आउटपुट्स

टेम्पलेट निम्नलिखित आउटपुट्स प्रदान करता है:

| आउटपुट | विवरण |
|--------|--------|
| `subscriptionId` | Azure सब्सक्रिप्शन ID |
| `resourceGroupName` | बनाए गए संसाधन समूह का नाम |
| `aiFoundryName` | Azure AI Foundry सेवा का नाम |
| `foundryEndpoint` | AI सेवा का एंडपॉइंट URL |
| `foundryAccountKey` | AI सेवा का एक्सेस की |
| `deployedModels` | डिप्लॉय किए गए OpenAI मॉडल्स की सूची |
| `applicationInsightsConnectionString` | Application Insights कनेक्शन स्ट्रिंग |
| `logAnalyticsWorkspaceName` | Log Analytics वर्कस्पेस का नाम |

## 🔍 सत्यापन कमांड्स

डिप्लॉयमेंट के बाद, संसाधनों को सत्यापित करें:

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

यह प्रोजेक्ट ARM और Bicep दोनों टेम्पलेट्स प्रदान करता है:

### ARM टेम्पलेट (`azuredeploy.json`)
- ✅ नेटिव Azure Resource Manager फॉर्मेट
- ✅ हर जगह काम करता है जहां ARM समर्थित है
- ✅ कोई अतिरिक्त टूलिंग की आवश्यकता नहीं
- ❌ अधिक विस्तृत JSON सिंटैक्स
- ❌ पढ़ने और बनाए रखने में कठिन

### Bicep टेम्पलेट (`main.bicep`)
- ✅ आधुनिक, साफ सिंटैक्स
- ✅ बेहतर टूलिंग और IntelliSense
- ✅ पढ़ने और बनाए रखने में आसान
- ✅ कंपाइल-टाइम वैलिडेशन
- ❌ Bicep CLI की आवश्यकता
- ❌ अतिरिक्त बिल्ड स्टेप

**सिफारिश**: विकास के लिए Bicep टेम्पलेट्स (`main.bicep`) का उपयोग करें और शुद्ध ARM JSON की आवश्यकता वाले परिदृश्यों के लिए ARM टेम्पलेट (`azuredeploy.json`) का उपयोग करें।

## 🔧 कस्टमाइज़ेशन

### कस्टम संसाधन जोड़ना

ARM टेम्पलेट में अतिरिक्त संसाधन जोड़ने के लिए:

1. नेस्टेड टेम्पलेट के `resources` ऐरे में संसाधन परिभाषा जोड़ें
2. `parameters` सेक्शन में कोई नया पैरामीटर जोड़ें
3. यदि आवश्यक हो तो संबंधित आउटपुट्स जोड़ें
4. डिफ़ॉल्ट मानों के साथ पैरामीटर फ़ाइल अपडेट करें

### उदाहरण: स्टोरेज अकाउंट जोड़ना

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

## 🐛 समस्या निवारण

### सामान्य समस्याएं

#### 1. टेम्पलेट वैलिडेशन त्रुटियां
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. संसाधन नाम संघर्ष
- सुनिश्चित करें कि `uniqueSuffix` वास्तव में यूनिक है
- स्वचालित जनरेशन के लिए `uniqueString()` फ़ंक्शन का उपयोग करें
- लक्ष्य क्षेत्र में मौजूदा संसाधनों की जांच करें

#### 3. कोटा सीमाएं
- लक्ष्य क्षेत्र में OpenAI मॉडल उपलब्धता सत्यापित करें
- AI सेवाओं के लिए सब्सक्रिप्शन कोटा जांचें
- यदि सीमाएं पहुंच गई हैं तो विभिन्न क्षेत्रों का उपयोग करने पर विचार करें

#### 4. अनुमति समस्याएं
- सुनिश्चित करें कि खाते में सब्सक्रिप्शन पर Contributor भूमिका है
- जांचें कि सब्सक्रिप्शन AI सेवाओं के लिए सक्षम है
- संसाधन प्रदाता पंजीकरण सत्यापित करें

### डिबगिंग कमांड्स

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

## 🔐 सुरक्षा विचार

### एक्सेस नियंत्रण
- AI सेवा सुरक्षित एक्सेस के लिए प्रबंधित पहचान का उपयोग करती है
- संसाधन समूह RBAC के लिए सीमा प्रदान करता है
- Application Insights के अलग-अलग एक्सेस नियंत्रण हैं

### नेटवर्क सुरक्षा
- सार्वजनिक नेटवर्क एक्सेस डिफ़ॉल्ट रूप से सक्षम है
- प्रोडक्शन के लिए प्राइवेट एंडपॉइंट्स पर विचार करें
- अतिरिक्त सुरक्षा के लिए नेटवर्क ACLs कॉन्फ़िगर किए जा सकते हैं

### की प्रबंधन
- AI सेवा कीज़ स्वचालित रूप से जनरेट होती हैं
- प्रोडक्शन सीक्रेट्स के लिए Azure Key Vault का उपयोग करें
- सुरक्षा के लिए कीज़ को नियमित रूप से रोटेट करें

## 📚 अगले कदम

सफल डिप्लॉयमेंट के बाद:

1. **पर्यावरण वेरिएबल्स कॉन्फ़िगर करें**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP सर्वर शुरू करें**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **इंटीग्रेशन टेस्ट करें**:
   - प्रोजेक्ट के साथ VS Code खोलें
   - `.vscode/mcp.json` में MCP सर्वर कॉन्फ़िगर करें
   - रिटेल डेटा क्वेरी के साथ AI चैट टेस्ट करें

4. **प्रदर्शन मॉनिटर करें**:
   - Application Insights में मेट्रिक्स देखें
   - Log Analytics वर्कस्पेस में लॉग्स जांचें
   - महत्वपूर्ण घटनाओं के लिए अलर्ट सेट करें

---

अधिक जानकारी के लिए, [मुख्य README](../README.md) या [QUICKSTART गाइड](../QUICKSTART.md) देखें।

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।