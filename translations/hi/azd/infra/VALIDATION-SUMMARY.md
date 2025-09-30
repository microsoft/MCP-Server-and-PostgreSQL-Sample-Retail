<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:53:12+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "hi"
}
-->
# Azure Developer CLI (azd) इंफ्रास्ट्रक्चर वैलिडेशन

## ✅ **वर्तमान स्थिति: azd के लिए तैयार**

`azd\infra` फ़ोल्डर अब Azure Developer CLI डिप्लॉयमेंट के साथ **पूरी तरह संगत** है। सभी आवश्यक फाइलें बनाई और कॉन्फ़िगर कर दी गई हैं।

### 📁 **पूर्ण azd संरचना**
```
azd/
├── azure.yaml                       ✅ Main azd configuration
├── infra/
│   ├── main.bicep                   ✅ Subscription-scoped Bicep template
│   ├── main.parameters.json         ✅ Parameters with azd variables
│   ├── modules/
│   │   ├── main-resources.bicep     ✅ Core infrastructure module
│   │   └── container-app-environment.bicep ✅ Container Apps environment
│   ├── azuredeploy.json            📄 Legacy ARM template (backup)
│   ├── azuredeploy.parameters.json  📄 Legacy parameters (backup)
│   ├── ARM-DEPLOYMENT.md           📄 ARM deployment documentation
│   ├── README.md                   📄 Infrastructure overview
│   └── VALIDATION-SUMMARY.md       📝 This file
```

### ✅ **Azure Developer CLI घटक**

#### 1. `azure.yaml` ✅ **तैयार**
- **स्थान**: `azd/azure.yaml`
- **उद्देश्य**: मुख्य azd कॉन्फ़िगरेशन फ़ाइल
- **स्थिति**: ✅ बनाई और कॉन्फ़िगर की गई
- **विशेषताएँ**:
  - MCP सर्वर के लिए सेवा परिभाषा
  - कंटेनर ऐप होस्टिंग कॉन्फ़िगरेशन
  - पर्यावरणीय वेरिएबल मैपिंग
  - जीवनचक्र प्रबंधन के लिए डिप्लॉयमेंट हुक

#### 2. **Bicep इंफ्रास्ट्रक्चर** ✅ **तैयार**
- **मुख्य टेम्पलेट**: `main.bicep` (सब्सक्रिप्शन-स्कोप्ड)
- **पैरामीटर्स**: `main.parameters.json` azd वेरिएबल्स के साथ
- **मॉड्यूल्स**: मॉड्यूलर Bicep आर्किटेक्चर
- **स्थिति**: ✅ पूर्ण इंफ्रास्ट्रक्चर डिप्लॉयमेंट

#### 3. **सेवा कॉन्फ़िगरेशन** ✅ **तैयार**
- **MCP सर्वर**: कंटेनर ऐप डिप्लॉयमेंट तैयार
- **Docker**: मौजूदा Dockerfile कॉन्फ़िगर किया गया
- **पर्यावरणीय वेरिएबल्स**: Azure AI सेवाओं का एकीकरण
- **मॉनिटरिंग**: Application Insights कनेक्टेड

### 🚀 **azd डिप्लॉयमेंट तैयार**

अब आप Azure Developer CLI का उपयोग करके डिप्लॉय कर सकते हैं:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **डिप्लॉय किए गए संसाधन**

azd डिप्लॉयमेंट निम्नलिखित बनाएगा:

#### **इंफ्रास्ट्रक्चर** 
- ✅ रिसोर्स ग्रुप (`rg-<env-name>`)
- ✅ लॉग एनालिटिक्स वर्कस्पेस
- ✅ एप्लिकेशन इनसाइट्स
- ✅ Azure AI सेवाएं (Foundry)
- ✅ OpenAI मॉडल डिप्लॉयमेंट:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ कंटेनर ऐप एनवायरनमेंट

#### **एप्लिकेशन**
- ✅ MCP सर्वर (कंटेनर ऐप)
- ✅ हेल्थ चेक्स सक्षम
- ✅ मॉनिटरिंग कनेक्टेड
- ✅ पर्यावरणीय वेरिएबल्स कॉन्फ़िगर किए गए

### 📊 **azd बनाम मैनुअल डिप्लॉयमेंट**

| विशेषता | azd `/azd` | मैनुअल `/infra` |
|---------|------------|-----------------|
| **स्थिति** | ✅ तैयार और पूर्ण | ✅ कार्यशील |
| **टेम्पलेट** | Bicep मॉड्यूल्स | Bicep मॉड्यूल्स |
| **डिप्लॉयमेंट** | `azd up` स्वचालन | मैनुअल स्क्रिप्ट्स |
| **पर्यावरण** | स्वचालित वेरिएबल्स | मैनुअल सेटअप |
| **सेवाएं** | कंटेनर ऐप्स | केवल इंफ्रास्ट्रक्चर |
| **कॉन्फ़िगरेशन** | सेवाओं के साथ पूर्ण | इंफ्रास्ट्रक्चर केंद्रित |

### 🛠️ **पर्यावरणीय वेरिएबल्स**

azd स्वचालित रूप से इन आउटपुट वेरिएबल्स को सेट करेगा:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **वैलिडेशन सारांश**

- **azure.yaml**: ✅ बनाई और कॉन्फ़िगर की गई
- **Bicep टेम्पलेट्स**: ✅ पूर्ण मॉड्यूलर आर्किटेक्चर
- **पैरामीटर्स फ़ाइल**: ✅ azd-संगत वेरिएबल्स
- **सेवा परिभाषा**: ✅ कंटेनर ऐप तैयार
- **Docker कॉन्फ़िगरेशन**: ✅ मौजूदा Dockerfile का उपयोग
- **पर्यावरणीय वेरिएबल्स**: ✅ Azure AI सेवाओं का एकीकरण
- **azd के लिए तैयार**: ✅ **हां - पूरी तरह संगत**

**सिफारिश**: `azd up` का उपयोग करें, जो इंफ्रास्ट्रक्चर और एप्लिकेशन सेवाओं दोनों के लिए पूर्ण स्वचालित डिप्लॉयमेंट प्रदान करता है।

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।