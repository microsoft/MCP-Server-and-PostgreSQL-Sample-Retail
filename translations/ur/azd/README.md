<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:20:07+00:00",
  "source_file": "azd/README.md",
  "language_code": "ur"
}
-->
# Azure Developer CLI (azd) Quick Start

## 🚀 Azure Developer CLI کے ساتھ تعیناتی کریں

یہ پروجیکٹ اب Azure Developer CLI (azd) کے ساتھ مکمل طور پر مطابقت رکھتا ہے تاکہ انفراسٹرکچر اور MCP سرور ایپلیکیشن کی خودکار تعیناتی کی جا سکے۔

### ضروریات

1. **Azure Developer CLI انسٹال کریں**:
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

2. **Azure میں لاگ ان کریں**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 ایک کمانڈ کے ذریعے تعیناتی

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

### 🔧 ترقیاتی ورک فلو

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

### 📦 کیا تعینات ہوتا ہے

#### **انفراسٹرکچر**
- ریسورس گروپ
- لاگ اینالیٹکس ورک اسپیس  
- ایپلیکیشن انسائٹس
- Azure AI سروسز (OpenAI ماڈلز کے ساتھ)
- کنٹینر ایپ ماحول

#### **ایپلیکیشن**
- MCP سرور (کنٹینر ایپ)
- صحت کی نگرانی فعال
- ماحول کے متغیرات ترتیب دیے گئے
- ایپلیکیشن انسائٹس انضمام

### 🌍 ماحول کے متغیرات

تعیناتی کے بعد، یہ متغیرات خود بخود دستیاب ہوں گے:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 نگرانی اور انتظام

- **Azure پورٹل**: اپنے ریسورس گروپ میں تمام وسائل دیکھیں
- **ایپلیکیشن انسائٹس**: ایپلیکیشن کی کارکردگی اور لاگز کی نگرانی کریں
- **کنٹینر ایپس**: ایپلیکیشن لاگز اور میٹرکس دیکھیں
- **AI اسٹوڈیو**: OpenAI ماڈل کی تعیناتی کا انتظام کریں

### 📋 مسائل کا حل

#### **عام مسائل**

1. **مقام کی حمایت نہیں**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **وسائل کے کوٹہ ختم ہو گئے**:
   - Azure پورٹل میں اپنی سبسکرپشن کی حدود چیک کریں
   - کسی دوسرے علاقے کو آزمائیں

3. **توثیق کے مسائل**:
   ```bash
   azd auth login --use-device-code
   ```

4. **تعیناتی لاگز دیکھیں**:
   ```bash
   azd show --output json
   ```

### 🔄 متبادل: دستی تعیناتی

اگر آپ دستی تعیناتی کو ترجیح دیتے ہیں، تو آپ `/infra` فولڈر میں موجود انفراسٹرکچر کا استعمال کر سکتے ہیں:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 مزید سیکھیں

- [Azure Developer CLI دستاویزات](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [کنٹینر ایپس دستاویزات](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI سروسز دستاویزات](https://docs.microsoft.com/azure/ai-services/)

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔