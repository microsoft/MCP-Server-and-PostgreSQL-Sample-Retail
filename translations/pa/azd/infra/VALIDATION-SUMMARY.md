<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:54:18+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "pa"
}
-->
# ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI (azd) ਢਾਂਚੇ ਦੀ ਜਾਂਚ

## ✅ **ਮੌਜੂਦਾ ਸਥਿਤੀ: azd ਲਈ ਤਿਆਰ**

`azd\infra` ਫੋਲਡਰ ਹੁਣ **ਪੂਰੀ ਤਰ੍ਹਾਂ ਅਨੁਕੂਲ** ਹੈ ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI ਡਿਪਲੌਇਮੈਂਟ ਲਈ। ਸਾਰੇ ਲੋੜੀਂਦੇ ਫਾਈਲਾਂ ਬਣਾਈਆਂ ਅਤੇ ਸੰਰਚਿਤ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ।

### 📁 **ਪੂਰਾ azd ਢਾਂਚਾ**
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

### ✅ **ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI ਹਿੱਸੇ**

#### 1. `azure.yaml` ✅ **ਤਿਆਰ**
- **ਸਥਿਤੀ**: `azd/azure.yaml`
- **ਉਦੇਸ਼**: ਮੁੱਖ azd ਸੰਰਚਨਾ ਫਾਈਲ
- **ਸਥਿਤੀ**: ✅ ਬਣਾਈ ਅਤੇ ਸੰਰਚਿਤ
- **ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ**:
  - MCP ਸਰਵਰ ਲਈ ਸੇਵਾ ਪਰਿਭਾਸ਼ਾ
  - ਕੰਟੇਨਰ ਐਪ ਹੋਸਟਿੰਗ ਸੰਰਚਨਾ
  - ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਮੈਪਿੰਗ
  - ਡਿਪਲੌਇਮੈਂਟ ਹੂਕਸ ਲਈ ਲਾਈਫਸਾਈਕਲ ਪ੍ਰਬੰਧਨ

#### 2. **Bicep ਢਾਂਚਾ** ✅ **ਤਿਆਰ**
- **ਮੁੱਖ ਟੈਂਪਲੇਟ**: `main.bicep` (ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਕੋਪਡ)
- **ਪੈਰਾਮੀਟਰਸ**: `main.parameters.json` azd ਵੈਰੀਏਬਲਾਂ ਨਾਲ
- **ਮੋਡੀਊਲਸ**: ਮੋਡੀਊਲਰ Bicep ਆਰਕੀਟੈਕਚਰ
- **ਸਥਿਤੀ**: ✅ ਪੂਰਾ ਢਾਂਚਾ ਡਿਪਲੌਇਮੈਂਟ

#### 3. **ਸੇਵਾ ਸੰਰਚਨਾ** ✅ **ਤਿਆਰ**
- **MCP ਸਰਵਰ**: ਕੰਟੇਨਰ ਐਪ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਤਿਆਰ
- **ਡੌਕਰ**: ਮੌਜੂਦਾ Dockerfile ਸੰਰਚਿਤ
- **ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਸ**: ਐਜ਼ਰ AI ਸੇਵਾਵਾਂ ਦਾ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- **ਮਾਨੀਟਰਿੰਗ**: ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਜੁੜੇ ਹੋਏ

### 🚀 **azd ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਤਿਆਰ**

ਤੁਸੀਂ ਹੁਣ ਐਜ਼ਰ ਡਿਵੈਲਪਰ CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇ ਕਰ ਸਕਦੇ ਹੋ:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **ਡਿਪਲੌਇਡ ਸਰੋਤ**

azd ਡਿਪਲੌਇਮੈਂਟ ਇਹ ਬਣਾਏਗਾ:

#### **Infrastructure** 
- ✅ ਰਿਸੋਰਸ ਗਰੁੱਪ (`rg-<env-name>`)
- ✅ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਵਰਕਸਪੇਸ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ
- ✅ ਐਜ਼ਰ AI ਸੇਵਾਵਾਂ (Foundry)
- ✅ OpenAI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ ਕੰਟੇਨਰ ਐਪ ਵਾਤਾਵਰਣ

#### **ਐਪਲੀਕੇਸ਼ਨ**
- ✅ MCP ਸਰਵਰ (ਕੰਟੇਨਰ ਐਪ)
- ✅ ਹੈਲਥ ਚੈਕਸ ਐਨੇਬਲਡ
- ✅ ਮਾਨੀਟਰਿੰਗ ਜੁੜੀ ਹੋਈ
- ✅ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਸ ਸੰਰਚਿਤ

### 📊 **azd ਵਿਰੁੱਧ ਮੈਨੂਅਲ ਡਿਪਲੌਇਮੈਂਟ**

| ਵਿਸ਼ੇਸ਼ਤਾ | azd `/azd` | ਮੈਨੂਅਲ `/infra` |
|-----------|------------|-----------------|
| **ਸਥਿਤੀ** | ✅ ਤਿਆਰ ਅਤੇ ਪੂਰਾ | ✅ ਕੰਮ ਕਰ ਰਿਹਾ |
| **ਟੈਂਪਲੇਟ** | Bicep ਮੋਡੀਊਲਸ | Bicep ਮੋਡੀਊਲਸ |
| **ਡਿਪਲੌਇਮੈਂਟ** | `azd up` ਆਟੋਮੇਸ਼ਨ | ਮੈਨੂਅਲ ਸਕ੍ਰਿਪਟਸ |
| **ਵਾਤਾਵਰਣ** | ਆਟੋ ਵੈਰੀਏਬਲਸ | ਮੈਨੂਅਲ ਸੈਟਅੱਪ |
| **ਸੇਵਾਵਾਂ** | ਕੰਟੇਨਰ ਐਪਸ | ਸਿਰਫ ਢਾਂਚਾ |
| **ਸੰਰਚਨਾ** | ਸੇਵਾਵਾਂ ਸਮੇਤ ਪੂਰੀ | ਢਾਂਚਾ ਕੇਂਦਰਿਤ |

### 🛠️ **ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਸ**

azd ਇਹ ਆਉਟਪੁੱਟ ਵੈਰੀਏਬਲਸ ਆਟੋਮੈਟਿਕ ਸੈਟ ਕਰੇਗਾ:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **ਜਾਂਚ ਸਾਰਾਂਸ਼**

- **azure.yaml**: ✅ ਬਣਾਈ ਅਤੇ ਸੰਰਚਿਤ
- **Bicep ਟੈਂਪਲੇਟਸ**: ✅ ਪੂਰਾ ਮੋਡੀਊਲਰ ਆਰਕੀਟੈਕਚਰ
- **ਪੈਰਾਮੀਟਰਸ ਫਾਈਲ**: ✅ azd-ਅਨੁਕੂਲ ਵੈਰੀਏਬਲਸ
- **ਸੇਵਾ ਪਰਿਭਾਸ਼ਾ**: ✅ ਕੰਟੇਨਰ ਐਪ ਤਿਆਰ
- **ਡੌਕਰ ਸੰਰਚਨਾ**: ✅ ਮੌਜੂਦਾ Dockerfile ਦੀ ਵਰਤੋਂ
- **ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਸ**: ✅ ਐਜ਼ਰ AI ਸੇਵਾਵਾਂ ਜੁੜੀਆਂ
- **azd ਲਈ ਤਿਆਰ**: ✅ **ਹਾਂ - ਪੂਰੀ ਤਰ੍ਹਾਂ ਅਨੁਕੂਲ**

**ਸਿਫਾਰਸ਼**: ਪੂਰੇ ਆਟੋਮੈਟਿਕ ਡਿਪਲੌਇਮੈਂਟ ਲਈ, ਜਿਸ ਵਿੱਚ ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਦੋਵੇਂ ਸ਼ਾਮਲ ਹਨ, `azd up` ਦੀ ਵਰਤੋਂ ਕਰੋ।

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਹਾਲਾਂਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤ ਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।