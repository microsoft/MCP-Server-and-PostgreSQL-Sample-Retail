<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:07:19+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "mr"
}
-->
# ARM टेम्पलेट डिप्लॉयमेंट सूचना

या दस्तऐवजात MCP रिटेल अॅनालिटिक्स इन्फ्रास्ट्रक्चर ARM टेम्पलेट वापरून डिप्लॉय करण्याच्या सूचना दिल्या आहेत.

## 📋 आढावा

`azuredeploy.json` ARM टेम्पलेट खालील गोष्टींचे संपूर्ण डिप्लॉयमेंट प्रदान करते:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI मॉडेल डिप्लॉयमेंट्स (GPT-4o-mini, text-embedding-3-small)

## 🚀 डिप्लॉयमेंट पर्याय

### पर्याय 1: Azure CLI डिप्लॉयमेंट

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

### पर्याय 2: PowerShell डिप्लॉयमेंट

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

### पर्याय 3: Azure पोर्टल

1. [Azure पोर्टल](https://portal.azure.com) वर जा
2. "Deploy a custom template" शोधा
3. "Build your own template in the editor" वर क्लिक करा
4. `azuredeploy.json` ची सामग्री कॉपी करून पेस्ट करा
5. "Save" नंतर "Review + create" वर क्लिक करा
6. आवश्यक पॅरामीटर्स भरा आणि डिप्लॉय करा

## 🔧 टेम्पलेट पॅरामीटर्स

| पॅरामीटर | प्रकार | डीफॉल्ट | वर्णन |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | संसाधन नावांसाठी प्रीफिक्स |
| `location` | string | `westus2` | डिप्लॉयमेंटसाठी Azure क्षेत्र |
| `uniqueSuffix` | string | स्वयंचलित निर्माण | 4-अक्षरी अद्वितीय ओळख |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI प्रकल्पासाठी डिस्प्ले नाव |
| `aiProjectDescription` | string | प्रकल्प वर्णन | Azure AI Foundry मध्ये दाखवले जाणारे वर्णन |
| `gptModelCapacity` | int | `120` | GPT मॉडेलसाठी टोकन क्षमता |
| `embeddingModelCapacity` | int | `50` | एम्बेडिंग मॉडेलसाठी टोकन क्षमता |
| `tags` | object | डीफॉल्ट टॅग्स | गव्हर्नन्ससाठी संसाधन टॅग्स |

## 📤 टेम्पलेट आउटपुट्स

टेम्पलेट खालील आउटपुट्स प्रदान करते:

| आउटपुट | वर्णन |
|--------|-------------|
| `subscriptionId` | Azure सदस्यता ID |
| `resourceGroupName` | तयार केलेल्या संसाधन गटाचे नाव |
| `aiFoundryName` | Azure AI Foundry सेवा नाव |
| `foundryEndpoint` | AI सेवा एंडपॉइंट URL |
| `foundryAccountKey` | AI सेवा प्रवेश की |
| `deployedModels` | डिप्लॉय केलेल्या OpenAI मॉडेल्सची यादी |
| `applicationInsightsConnectionString` | Application Insights कनेक्शन स्ट्रिंग |
| `logAnalyticsWorkspaceName` | Log Analytics कार्यक्षेत्राचे नाव |

## 🔍 सत्यापन आदेश

डिप्लॉयमेंटनंतर संसाधने सत्यापित करा:

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

## 🆚 ARM विरुद्ध Bicep

या प्रकल्पात ARM आणि Bicep टेम्पलेट्स उपलब्ध आहेत:

### ARM टेम्पलेट (`azuredeploy.json`)
- ✅ मूळ Azure Resource Manager स्वरूप
- ✅ जिथे ARM समर्थित आहे तिथे कार्य करते
- ✅ अतिरिक्त साधनांची आवश्यकता नाही
- ❌ अधिक विस्तृत JSON सिंटॅक्स
- ❌ वाचणे आणि व्यवस्थापित करणे कठीण

### Bicep टेम्पलेट (`main.bicep`)
- ✅ आधुनिक, स्वच्छ सिंटॅक्स
- ✅ चांगली साधने आणि IntelliSense
- ✅ वाचणे आणि व्यवस्थापित करणे सोपे
- ✅ संकलन-वेळ सत्यापन
- ❌ Bicep CLI आवश्यक
- ❌ अतिरिक्त बिल्ड स्टेप

**शिफारस**: विकासासाठी Bicep टेम्पलेट्स (`main.bicep`) वापरा आणि शुद्ध ARM JSON आवश्यक असलेल्या परिस्थितीत ARM टेम्पलेट (`azuredeploy.json`) वापरा.

## 🔧 सानुकूलन

### सानुकूल संसाधने जोडणे

ARM टेम्पलेटमध्ये अतिरिक्त संसाधने जोडण्यासाठी:

1. नेस्टेड टेम्पलेटच्या `resources` अॅरेमध्ये संसाधन परिभाषा जोडा
2. `parameters` विभागात नवीन पॅरामीटर्स जोडा
3. आवश्यक असल्यास संबंधित आउटपुट्स जोडा
4. पॅरामीटर्स फाइलमध्ये डीफॉल्ट मूल्ये अपडेट करा

### उदाहरण: स्टोरेज खाते जोडणे

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

## 🐛 समस्या निराकरण

### सामान्य समस्या

#### 1. टेम्पलेट सत्यापन त्रुटी
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. संसाधन नाव संघर्ष
- `uniqueSuffix` खरोखर अद्वितीय असल्याचे सुनिश्चित करा
- स्वयंचलित निर्मितीसाठी `uniqueString()` फंक्शन वापरा
- लक्ष्य क्षेत्रातील विद्यमान संसाधने तपासा

#### 3. कोटा मर्यादा
- लक्ष्य क्षेत्रातील OpenAI मॉडेल उपलब्धता सत्यापित करा
- AI सेवांसाठी सदस्यता कोटा तपासा
- मर्यादा गाठल्यास वेगवेगळ्या क्षेत्रांचा विचार करा

#### 4. परवानगी समस्या
- खात्याकडे सदस्यता वर Contributor भूमिका असल्याचे सुनिश्चित करा
- सदस्यता AI सेवांसाठी सक्षम असल्याचे तपासा
- संसाधन प्रदाता नोंदणी सत्यापित करा

### डीबगिंग आदेश

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

### प्रवेश नियंत्रण
- AI सेवा सुरक्षित प्रवेशासाठी व्यवस्थापित ओळख वापरते
- संसाधन गट RBAC साठी सीमा प्रदान करतो
- Application Insights साठी स्वतंत्र प्रवेश नियंत्रण आहे

### नेटवर्क सुरक्षा
- सार्वजनिक नेटवर्क प्रवेश डीफॉल्टने सक्षम
- उत्पादनासाठी खाजगी एंडपॉइंट्सचा विचार करा
- अतिरिक्त सुरक्षेसाठी नेटवर्क ACLs कॉन्फिगर करू शकता

### की व्यवस्थापन
- AI सेवा की स्वयंचलितपणे तयार होतात
- उत्पादन गुपितांसाठी Azure Key Vault वापरा
- सुरक्षिततेसाठी की नियमितपणे फिरवा

## 📚 पुढील पावले

यशस्वी डिप्लॉयमेंटनंतर:

1. **पर्यावरणीय चल बदल कॉन्फिगर करा**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP सर्व्हर सुरू करा**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **इंटिग्रेशन चाचणी करा**:
   - प्रकल्पासह VS Code उघडा
   - `.vscode/mcp.json` मध्ये MCP सर्व्हर कॉन्फिगर करा
   - रिटेल डेटा क्वेरीजसह AI चॅट चाचणी करा

4. **कामगिरीचे निरीक्षण करा**:
   - Application Insights मध्ये मेट्रिक्स पहा
   - Log Analytics कार्यक्षेत्रात लॉग तपासा
   - महत्त्वाच्या घटनांसाठी अलर्ट सेट करा

---

अधिक माहितीसाठी, [मुख्य README](../README.md) किंवा [QUICKSTART मार्गदर्शक](../QUICKSTART.md) पहा.

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.