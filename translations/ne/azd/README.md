<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:22:09+00:00",
  "source_file": "azd/README.md",
  "language_code": "ne"
}
-->
# Azure Developer CLI (azd) छिटो सुरु

## 🚀 Azure Developer CLI प्रयोग गरेर परिनियोजन गर्नुहोस्

यो प्रोजेक्ट अब Azure Developer CLI (azd) सँग पूर्ण रूपमा उपयुक्त छ, जसले पूर्वाधार र MCP सर्भर एप्लिकेसनको स्वचालित परिनियोजनलाई समर्थन गर्दछ।

### पूर्वशर्तहरू

1. **Azure Developer CLI स्थापना गर्नुहोस्**:
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

2. **Azure मा लगइन गर्नुहोस्**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 एक आदेशमा परिनियोजन

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

### 📦 के-के परिनियोजन हुन्छ

#### **पूर्वाधार**
- रिसोर्स ग्रुप
- लग एनालिटिक्स कार्यक्षेत्र  
- एप्लिकेसन इनसाइट्स
- Azure AI सेवाहरू (OpenAI मोडेलहरूसहित)
- कन्टेनर एप वातावरण

#### **एप्लिकेसन**
- MCP सर्भर (कन्टेनर एप)
- स्वास्थ्य अनुगमन सक्षम
- वातावरणीय भेरिएबलहरू कन्फिगर गरिएको
- एप्लिकेसन इनसाइट्स एकीकरण

### 🌍 वातावरणीय भेरिएबलहरू

परिनियोजनपछि, यी भेरिएबलहरू स्वचालित रूपमा उपलब्ध हुन्छन्:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 अनुगमन र व्यवस्थापन

- **Azure पोर्टल**: तपाईंको रिसोर्स ग्रुपमा सबै स्रोतहरू हेर्नुहोस्
- **एप्लिकेसन इनसाइट्स**: एप्लिकेसनको प्रदर्शन र लगहरू अनुगमन गर्नुहोस्
- **कन्टेनर एप्स**: एप्लिकेसनका लगहरू र मेट्रिक्स हेर्नुहोस्
- **AI स्टुडियो**: OpenAI मोडेल परिनियोजनहरू व्यवस्थापन गर्नुहोस्

### 📋 समस्या समाधान

#### **सामान्य समस्याहरू**

1. **स्थान समर्थित छैन**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **स्रोत कोटा नाघियो**:
   - Azure पोर्टलमा तपाईंको सदस्यता सीमाहरू जाँच गर्नुहोस्
   - अर्को क्षेत्र प्रयास गर्नुहोस्

3. **प्रमाणीकरण समस्याहरू**:
   ```bash
   azd auth login --use-device-code
   ```

4. **परिनियोजन लगहरू हेर्नुहोस्**:
   ```bash
   azd show --output json
   ```

### 🔄 वैकल्पिक: म्यानुअल परिनियोजन

यदि तपाईं म्यानुअल परिनियोजनलाई प्राथमिकता दिनुहुन्छ भने, तपाईं अझै पनि `/infra` फोल्डरमा रहेको पूर्वाधार प्रयोग गर्न सक्नुहुन्छ:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 थप जान्नुहोस्

- [Azure Developer CLI कागजात](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [कन्टेनर एप्स कागजात](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI सेवाहरू कागजात](https://docs.microsoft.com/azure/ai-services/)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी यथासम्भव शुद्धता सुनिश्चित गर्न प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। मूल दस्तावेज़ यसको मातृभाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौं।