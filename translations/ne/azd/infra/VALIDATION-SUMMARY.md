<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:54:01+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "ne"
}
-->
# Azure Developer CLI (azd) पूर्वाधार प्रमाणीकरण

## ✅ **हालको स्थिति: azd को लागि तयार**

`azd\infra` फोल्डर अब Azure Developer CLI तैनातीसँग **पूर्ण रूपमा उपयुक्त** छ। आवश्यक सबै फाइलहरू सिर्जना गरिएका छन् र कन्फिगर गरिएका छन्।

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

### ✅ **Azure Developer CLI कम्पोनेन्टहरू**

#### 1. `azure.yaml` ✅ **तयार**
- **स्थान**: `azd/azure.yaml`
- **उद्देश्य**: मुख्य azd कन्फिगरेसन फाइल
- **स्थिति**: ✅ सिर्जना गरिएको र कन्फिगर गरिएको
- **विशेषताहरू**:
  - MCP सर्भरको सेवा परिभाषा
  - कन्टेनर एप होस्टिङ कन्फिगरेसन
  - वातावरण चरहरूको म्यापिङ
  - जीवनचक्र व्यवस्थापनको लागि तैनाती हुकहरू

#### 2. **Bicep पूर्वाधार** ✅ **तयार**
- **मुख्य टेम्प्लेट**: `main.bicep` (सब्स्क्रिप्सन-स्कोप गरिएको)
- **प्यारामिटरहरू**: `main.parameters.json` azd चरहरूसँग
- **मोड्युलहरू**: मोड्युलर Bicep आर्किटेक्चर
- **स्थिति**: ✅ पूर्ण पूर्वाधार तैनाती

#### 3. **सेवा कन्फिगरेसन** ✅ **तयार**
- **MCP सर्भर**: कन्टेनर एप तैनाती तयार
- **Docker**: विद्यमान Dockerfile कन्फिगर गरिएको
- **वातावरण चरहरू**: Azure AI सेवाहरूको एकीकरण
- **मोनिटरिङ**: एप्लिकेसन इनसाइट्स जडान गरिएको

### 🚀 **azd तैनाती तयार**

अब तपाईं Azure Developer CLI प्रयोग गरेर तैनाती गर्न सक्नुहुन्छ:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **तैनात गरिएका स्रोतहरू**

azd तैनातीले निम्न सिर्जना गर्नेछ:

#### **पूर्वाधार** 
- ✅ स्रोत समूह (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ एप्लिकेसन इनसाइट्स
- ✅ Azure AI सेवाहरू (Foundry)
- ✅ OpenAI मोडेल तैनातीहरू:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ कन्टेनर एप वातावरण

#### **अनुप्रयोग**
- ✅ MCP सर्भर (कन्टेनर एप)
- ✅ स्वास्थ्य जाँच सक्षम
- ✅ मोनिटरिङ जडान गरिएको
- ✅ वातावरण चरहरू कन्फिगर गरिएको

### 📊 **azd बनाम म्यानुअल तैनाती**

| विशेषता | azd `/azd` | म्यानुअल `/infra` |
|---------|------------|-----------------|
| **स्थिति** | ✅ तयार र पूर्ण | ✅ कार्यरत |
| **टेम्प्लेट** | Bicep मोड्युलहरू | Bicep मोड्युलहरू |
| **तैनाती** | `azd up` स्वचालन | म्यानुअल स्क्रिप्टहरू |
| **वातावरण** | स्वतः वातावरण चरहरू | म्यानुअल सेटअप |
| **सेवाहरू** | कन्टेनर एपहरू | केवल पूर्वाधार |
| **कन्फिगरेसन** | सेवाहरू सहित पूर्ण | पूर्वाधार केन्द्रित |

### 🛠️ **वातावरण चरहरू**

azd ले यी आउटपुट चरहरू स्वतः सेट गर्नेछ:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **प्रमाणीकरण सारांश**

- **azure.yaml**: ✅ सिर्जना गरिएको र कन्फिगर गरिएको
- **Bicep टेम्प्लेटहरू**: ✅ पूर्ण मोड्युलर आर्किटेक्चर
- **प्यारामिटर फाइल**: ✅ azd-संगत चरहरू
- **सेवा परिभाषा**: ✅ कन्टेनर एप तयार
- **Docker कन्फिगरेसन**: ✅ विद्यमान Dockerfile प्रयोग गर्दै
- **वातावरण चरहरू**: ✅ Azure AI सेवाहरू एकीकृत
- **azd को लागि तयार**: ✅ **हो - पूर्ण रूपमा उपयुक्त**

**सिफारिस**: `azd up` प्रयोग गर्नुहोस् पूर्ण स्वचालित तैनातीको लागि जसले पूर्वाधार र अनुप्रयोग सेवाहरू दुवै समावेश गर्दछ।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी यथासम्भव शुद्धता सुनिश्चित गर्न प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। मूल दस्तावेज़ यसको मातृभाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौं।