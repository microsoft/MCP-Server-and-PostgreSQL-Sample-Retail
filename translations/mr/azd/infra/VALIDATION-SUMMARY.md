<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:53:44+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "mr"
}
-->
# Azure Developer CLI (azd) इन्फ्रास्ट्रक्चर पडताळणी

## ✅ **सध्याची स्थिती: azd साठी तयार**

`azd\infra` फोल्डर आता Azure Developer CLI डिप्लॉयमेंटसाठी **पूर्णतः सुसंगत** आहे. सर्व आवश्यक फाइल्स तयार करून कॉन्फिगर करण्यात आल्या आहेत.

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

#### 1. `azure.yaml` ✅ **तयार**
- **स्थान**: `azd/azure.yaml`
- **उद्देश**: मुख्य azd कॉन्फिगरेशन फाइल
- **स्थिती**: ✅ तयार आणि कॉन्फिगर केलेली
- **वैशिष्ट्ये**:
  - MCP सर्व्हरसाठी सेवा परिभाषा
  - कंटेनर अ‍ॅप होस्टिंग कॉन्फिगरेशन
  - पर्यावरणीय व्हेरिएबल्स मॅपिंग
  - जीवनचक्र व्यवस्थापनासाठी डिप्लॉयमेंट हुक्स

#### 2. **Bicep इन्फ्रास्ट्रक्चर** ✅ **तयार**
- **मुख्य टेम्पलेट**: `main.bicep` (सबस्क्रिप्शन-स्कोप्ड)
- **पॅरामीटर्स**: `main.parameters.json` azd व्हेरिएबल्ससह
- **मॉड्यूल्स**: मॉड्युलर Bicep आर्किटेक्चर
- **स्थिती**: ✅ पूर्ण इन्फ्रास्ट्रक्चर डिप्लॉयमेंट

#### 3. **सेवा कॉन्फिगरेशन** ✅ **तयार**
- **MCP सर्व्हर**: कंटेनर अ‍ॅप डिप्लॉयमेंट तयार
- **Docker**: विद्यमान Dockerfile कॉन्फिगर केलेला
- **पर्यावरणीय व्हेरिएबल्स**: Azure AI Services एकत्रित
- **मॉनिटरिंग**: Application Insights जोडलेले

### 🚀 **azd डिप्लॉयमेंट तयार**

Azure Developer CLI वापरून तुम्ही आता डिप्लॉय करू शकता:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **डिप्लॉय केलेले संसाधने**

azd डिप्लॉयमेंट खालील तयार करेल:

#### **इन्फ्रास्ट्रक्चर** 
- ✅ रिसोर्स ग्रुप (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ OpenAI मॉडेल डिप्लॉयमेंट्स:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ कंटेनर अ‍ॅप वातावरण

#### **अ‍ॅप्लिकेशन**
- ✅ MCP सर्व्हर (कंटेनर अ‍ॅप)
- ✅ हेल्थ चेक्स सक्षम
- ✅ मॉनिटरिंग जोडलेले
- ✅ पर्यावरणीय व्हेरिएबल्स कॉन्फिगर केलेले

### 📊 **azd vs मॅन्युअल डिप्लॉयमेंट**

| वैशिष्ट्य | azd `/azd` | मॅन्युअल `/infra` |
|-----------|------------|-------------------|
| **स्थिती** | ✅ तयार आणि पूर्ण | ✅ कार्यरत |
| **टेम्पलेट** | Bicep मॉड्युल्स | Bicep मॉड्युल्स |
| **डिप्लॉयमेंट** | `azd up` ऑटोमेशन | मॅन्युअल स्क्रिप्ट्स |
| **पर्यावरण** | ऑटो env vars | मॅन्युअल सेटअप |
| **सेवा** | कंटेनर अ‍ॅप्स | फक्त इन्फ्रास्ट्रक्चर |
| **कॉन्फिगरेशन** | सेवांसह पूर्ण | फक्त इन्फ्रास्ट्रक्चर केंद्रित |

### 🛠️ **पर्यावरणीय व्हेरिएबल्स**

azd स्वयंचलितपणे खालील आउटपुट व्हेरिएबल्स सेट करेल:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **पडताळणी सारांश**

- **azure.yaml**: ✅ तयार आणि कॉन्फिगर केलेले
- **Bicep टेम्पलेट्स**: ✅ पूर्ण मॉड्युलर आर्किटेक्चर
- **पॅरामीटर्स फाइल**: ✅ azd-सुसंगत व्हेरिएबल्स
- **सेवा परिभाषा**: ✅ कंटेनर अ‍ॅप तयार
- **Docker कॉन्फिगरेशन**: ✅ विद्यमान Dockerfile वापरून
- **पर्यावरणीय व्हेरिएबल्स**: ✅ Azure AI Services एकत्रित
- **azd साठी तयार**: ✅ **होय - पूर्णतः सुसंगत**

**शिफारस**: `azd up` वापरा संपूर्ण स्वयंचलित डिप्लॉयमेंटसाठी ज्यामध्ये इन्फ्रास्ट्रक्चर आणि अ‍ॅप्लिकेशन सेवा दोन्ही समाविष्ट आहेत.

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.