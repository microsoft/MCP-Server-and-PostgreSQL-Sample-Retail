<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:21:57+00:00",
  "source_file": "azd/README.md",
  "language_code": "mr"
}
-->
# Azure Developer CLI (azd) जलद सुरुवात

## 🚀 Azure Developer CLI सह त्वरित डिप्लॉयमेंट

हे प्रकल्प आता Azure Developer CLI (azd) सह पूर्णपणे सुसंगत आहे, ज्यामुळे इन्फ्रास्ट्रक्चर आणि MCP सर्व्हर अनुप्रयोगाचे स्वयंचलित डिप्लॉयमेंट शक्य होते.

### पूर्वतयारी

1. **Azure Developer CLI स्थापित करा**:
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

2. **Azure मध्ये लॉगिन करा**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 एकाच कमांडने डिप्लॉयमेंट

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

### 🔧 विकास कार्यप्रवाह

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

### 📦 काय डिप्लॉय केले जाते

#### **इन्फ्रास्ट्रक्चर**
- रिसोर्स ग्रुप
- लॉग अॅनालिटिक्स कार्यक्षेत्र  
- ऍप्लिकेशन इनसाइट्स
- Azure AI सेवा (OpenAI मॉडेलसह)
- कंटेनर अॅप वातावरण

#### **अनुप्रयोग**
- MCP सर्व्हर (कंटेनर अॅप)
- आरोग्य मॉनिटरिंग सक्षम
- पर्यावरणीय व्हेरिएबल्स कॉन्फिगर केलेले
- ऍप्लिकेशन इनसाइट्स एकत्रीकरण

### 🌍 पर्यावरणीय व्हेरिएबल्स

डिप्लॉयमेंटनंतर, हे व्हेरिएबल्स स्वयंचलितपणे उपलब्ध असतात:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 मॉनिटरिंग आणि व्यवस्थापन

- **Azure पोर्टल**: तुमच्या रिसोर्स ग्रुपमधील सर्व संसाधने पहा
- **ऍप्लिकेशन इनसाइट्स**: अनुप्रयोगाची कार्यक्षमता आणि लॉग्स मॉनिटर करा
- **कंटेनर अॅप्स**: अनुप्रयोगाचे लॉग्स आणि मेट्रिक्स पहा
- **AI स्टुडिओ**: OpenAI मॉडेल डिप्लॉयमेंट व्यवस्थापित करा

### 📋 समस्या निवारण

#### **सामान्य समस्या**

1. **स्थान समर्थित नाही**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **रिसोर्स कोटा ओलांडले**:
   - Azure पोर्टलमध्ये तुमच्या सबस्क्रिप्शन मर्यादा तपासा
   - वेगळ्या प्रदेशाचा प्रयत्न करा

3. **प्रमाणीकरण समस्या**:
   ```bash
   azd auth login --use-device-code
   ```

4. **डिप्लॉयमेंट लॉग्स पहा**:
   ```bash
   azd show --output json
   ```

### 🔄 पर्याय: मॅन्युअल डिप्लॉयमेंट

जर तुम्हाला मॅन्युअल डिप्लॉयमेंट करणे पसंत असेल, तर तुम्ही `/infra` फोल्डरमधील इन्फ्रास्ट्रक्चर वापरू शकता:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 अधिक जाणून घ्या

- [Azure Developer CLI दस्तऐवज](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर अॅप्स दस्तऐवज](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI सेवा दस्तऐवज](https://docs.microsoft.com/azure/ai-services/)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.