<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:22:20+00:00",
  "source_file": "azd/README.md",
  "language_code": "pa"
}
-->
# Azure Developer CLI (azd) Quick Start

## 🚀 Azure Developer CLI ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਕਰੋ

ਇਹ ਪ੍ਰੋਜੈਕਟ ਹੁਣ ਪੂਰੀ ਤਰ੍ਹਾਂ Azure Developer CLI (azd) ਨਾਲ ਅਨੁਕੂਲ ਹੈ, ਜੋ ਇੰਫਰਾਸਟਰਕਚਰ ਅਤੇ MCP ਸਰਵਰ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਆਟੋਮੈਟਿਕ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਹੈ।

### ਪੂਰਵ ਸ਼ਰਤਾਂ

1. **Azure Developer CLI ਇੰਸਟਾਲ ਕਰੋ**:
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

2. **Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 ਇੱਕ ਕਮਾਂਡ ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ

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

### 🔧 ਵਿਕਾਸ ਵਰਕਫਲੋ

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

### 📦 ਕੀ ਡਿਪਲੌਇ ਕੀਤਾ ਜਾਂਦਾ ਹੈ

#### **ਇੰਫਰਾਸਟਰਕਚਰ**
- ਰਿਸੋਰਸ ਗਰੁੱਪ
- ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਵਰਕਸਪੇਸ  
- ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ
- Azure AI ਸੇਵਾਵਾਂ (OpenAI ਮਾਡਲਾਂ ਨਾਲ)
- ਕੰਟੇਨਰ ਐਪ ਵਾਤਾਵਰਣ

#### **ਐਪਲੀਕੇਸ਼ਨ**
- MCP ਸਰਵਰ (ਕੰਟੇਨਰ ਐਪ)
- ਹੈਲਥ ਮਾਨੀਟਰਿੰਗ ਸਚਾਲਿਤ
- ਵਾਤਾਵਰਣ ਚਰਾਂ (Environment Variables) ਸੰਰਚਿਤ
- ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

### 🌍 ਵਾਤਾਵਰਣ ਚਰਾਂ (Environment Variables)

ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ, ਇਹ ਚਰਾਂ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਉਪਲਬਧ ਹੁੰਦੀਆਂ ਹਨ:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਪ੍ਰਬੰਧਨ

- **Azure ਪੋਰਟਲ**: ਆਪਣੇ ਰਿਸੋਰਸ ਗਰੁੱਪ ਵਿੱਚ ਸਾਰੇ ਰਿਸੋਰਸ ਵੇਖੋ
- **ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ**: ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਪ੍ਰਦਰਸ਼ਨਸ਼ੀਲਤਾ ਅਤੇ ਲੌਗਸ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
- **ਕੰਟੇਨਰ ਐਪਸ**: ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਸ ਅਤੇ ਮੈਟਰਿਕਸ ਵੇਖੋ
- **AI ਸਟੂਡੀਓ**: OpenAI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ

### 📋 ਸਮੱਸਿਆ ਹੱਲ

#### **ਆਮ ਸਮੱਸਿਆਵਾਂ**

1. **ਸਥਾਨ ਸਹਾਇਕ ਨਹੀਂ**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **ਰਿਸੋਰਸ ਕੋਟਾ ਖਤਮ ਹੋਏ**:
   - Azure ਪੋਰਟਲ ਵਿੱਚ ਆਪਣੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
   - ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ

3. **ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ**:
   ```bash
   azd auth login --use-device-code
   ```

4. **ਡਿਪਲੌਇਮੈਂਟ ਲੌਗਸ ਵੇਖੋ**:
   ```bash
   azd show --output json
   ```

### 🔄 ਵਿਕਲਪ: ਹੱਥੋਂ ਡਿਪਲੌਇਮੈਂਟ

ਜੇ ਤੁਸੀਂ ਹੱਥੋਂ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਤਰਜੀਹ ਦਿੰਦੇ ਹੋ, ਤਾਂ ਤੁਸੀਂ `/infra` ਫੋਲਡਰ ਵਿੱਚ ਮੌਜੂਦ ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦੇ ਹੋ:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 ਹੋਰ ਸਿੱਖੋ

- [Azure Developer CLI ਦਸਤਾਵੇਜ਼](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [ਕੰਟੇਨਰ ਐਪਸ ਦਸਤਾਵੇਜ਼](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI ਸੇਵਾਵਾਂ ਦਸਤਾਵੇਜ਼](https://docs.microsoft.com/azure/ai-services/)

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਮੂਲ ਰੂਪ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।