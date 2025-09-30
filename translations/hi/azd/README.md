<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:21:34+00:00",
  "source_file": "azd/README.md",
  "language_code": "hi"
}
-->
# Azure Developer CLI (azd) त्वरित शुरुआत

## 🚀 Azure Developer CLI के साथ परिनियोजन करें

यह प्रोजेक्ट अब Azure Developer CLI (azd) के साथ पूरी तरह संगत है, जो इन्फ्रास्ट्रक्चर और MCP सर्वर एप्लिकेशन दोनों के स्वचालित परिनियोजन के लिए है।

### आवश्यकताएँ

1. **Azure Developer CLI इंस्टॉल करें**:
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **Azure में लॉगिन करें**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 एक-कमांड परिनियोजन

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 विकास वर्कफ़्लो

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 क्या परिनियोजित होता है

#### **इन्फ्रास्ट्रक्चर**
- रिसोर्स ग्रुप
- लॉग एनालिटिक्स वर्कस्पेस  
- एप्लिकेशन इनसाइट्स
- Azure AI सेवाएँ (OpenAI मॉडल्स के साथ)
- कंटेनर ऐप एनवायरनमेंट

#### **एप्लिकेशन**
- MCP सर्वर (कंटेनर ऐप)
- स्वास्थ्य निगरानी सक्षम
- पर्यावरणीय वेरिएबल्स कॉन्फ़िगर किए गए
- एप्लिकेशन इनसाइट्स एकीकरण

### 🌍 पर्यावरणीय वेरिएबल्स

परिनियोजन के बाद, ये वेरिएबल्स स्वचालित रूप से उपलब्ध होंगे:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 निगरानी और प्रबंधन

- **Azure पोर्टल**: अपने रिसोर्स ग्रुप में सभी संसाधनों को देखें
- **एप्लिकेशन इनसाइट्स**: एप्लिकेशन प्रदर्शन और लॉग्स की निगरानी करें
- **कंटेनर ऐप्स**: एप्लिकेशन लॉग्स और मेट्रिक्स देखें
- **AI स्टूडियो**: OpenAI मॉडल परिनियोजन प्रबंधित करें

### 📋 समस्या निवारण

#### **सामान्य समस्याएँ**

1. **स्थान समर्थित नहीं है**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **संसाधन कोटा समाप्त हो गया**:
   - Azure पोर्टल में अपनी सदस्यता सीमाएँ जांचें
   - किसी अन्य क्षेत्र का प्रयास करें

3. **प्रमाणीकरण समस्याएँ**:
   ```bash
   azd auth login --use-device-code
   ```

4. **परिनियोजन लॉग्स देखें**:
   ```bash
   azd show --output json
   ```

### 🔄 वैकल्पिक: मैनुअल परिनियोजन

यदि आप मैनुअल परिनियोजन पसंद करते हैं, तो आप `/infra` फ़ोल्डर में उपलब्ध इन्फ्रास्ट्रक्चर का उपयोग कर सकते हैं:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 अधिक जानें

- [Azure Developer CLI दस्तावेज़](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर ऐप्स दस्तावेज़](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI सेवाएँ दस्तावेज़](https://docs.microsoft.com/azure/ai-services/)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।