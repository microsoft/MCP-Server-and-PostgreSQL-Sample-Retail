<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:51:34+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "ur"
}
-->
# Azure Developer CLI (azd) انفراسٹرکچر کی تصدیق

## ✅ **موجودہ حالت: azd کے لیے تیار**

`azd\infra` فولڈر اب Azure Developer CLI ڈپلائمنٹ کے ساتھ **مکمل طور پر مطابقت پذیر** ہے۔ تمام مطلوبہ فائلیں بنائی اور ترتیب دی جا چکی ہیں۔

### 📁 **مکمل azd ساخت**
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

### ✅ **Azure Developer CLI اجزاء**

#### 1. `azure.yaml` ✅ **تیار**
- **مقام**: `azd/azure.yaml`
- **مقصد**: مرکزی azd کنفیگریشن فائل
- **حالت**: ✅ بنائی اور ترتیب دی گئی
- **خصوصیات**:
  - MCP سرور کے لیے سروس کی تعریف
  - کنٹینر ایپ ہوسٹنگ کنفیگریشن
  - ماحول کے متغیرات کی میپنگ
  - لائف سائیکل مینجمنٹ کے لیے ڈپلائمنٹ ہکس

#### 2. **Bicep انفراسٹرکچر** ✅ **تیار**
- **مرکزی ٹیمپلیٹ**: `main.bicep` (سبسکرپشن-اسکوپڈ)
- **پیرامیٹرز**: `main.parameters.json` azd متغیرات کے ساتھ
- **ماڈیولز**: ماڈیولر Bicep آرکیٹیکچر
- **حالت**: ✅ مکمل انفراسٹرکچر ڈپلائمنٹ

#### 3. **سروس کنفیگریشن** ✅ **تیار**
- **MCP سرور**: کنٹینر ایپ ڈپلائمنٹ کے لیے تیار
- **Docker**: موجودہ Dockerfile ترتیب دیا گیا
- **ماحول کے متغیرات**: Azure AI سروسز انٹیگریشن
- **مانیٹرنگ**: Application Insights سے منسلک

### 🚀 **azd ڈپلائمنٹ کے لیے تیار**

اب آپ Azure Developer CLI استعمال کرتے ہوئے ڈپلائمنٹ کر سکتے ہیں:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **ڈپلائمنٹ کے وسائل**

azd ڈپلائمنٹ درج ذیل وسائل تخلیق کرے گا:

#### **انفراسٹرکچر** 
- ✅ ریسورس گروپ (`rg-<env-name>`)
- ✅ لاگ اینالیٹکس ورک اسپیس
- ✅ ایپلیکیشن انسائٹس
- ✅ Azure AI سروسز (Foundry)
- ✅ OpenAI ماڈل ڈپلائمنٹس:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ کنٹینر ایپ ماحول

#### **ایپلیکیشن**
- ✅ MCP سرور (کنٹینر ایپ)
- ✅ ہیلتھ چیکس فعال
- ✅ مانیٹرنگ منسلک
- ✅ ماحول کے متغیرات ترتیب دیے گئے

### 📊 **azd بمقابلہ دستی ڈپلائمنٹ**

| خصوصیت | azd `/azd` | دستی `/infra` |
|---------|------------|-----------------|
| **حالت** | ✅ تیار اور مکمل | ✅ کام کر رہا ہے |
| **ٹیمپلیٹ** | Bicep ماڈیولز | Bicep ماڈیولز |
| **ڈپلائمنٹ** | `azd up` آٹومیشن | دستی اسکرپٹس |
| **ماحول** | خودکار ماحول کے متغیرات | دستی ترتیب |
| **سروسز** | کنٹینر ایپس | صرف انفراسٹرکچر |
| **کنفیگریشن** | خدمات کے ساتھ مکمل | انفراسٹرکچر پر مرکوز |

### 🛠️ **ماحول کے متغیرات**

azd خود بخود یہ آؤٹ پٹ متغیرات ترتیب دے گا:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **تصدیق کا خلاصہ**

- **azure.yaml**: ✅ بنائی اور ترتیب دی گئی
- **Bicep ٹیمپلیٹس**: ✅ مکمل ماڈیولر آرکیٹیکچر
- **پیرامیٹرز فائل**: ✅ azd-مطابقت پذیر متغیرات
- **سروس کی تعریف**: ✅ کنٹینر ایپ کے لیے تیار
- **Docker کنفیگریشن**: ✅ موجودہ Dockerfile استعمال کر رہا ہے
- **ماحول کے متغیرات**: ✅ Azure AI سروسز انٹیگریٹڈ
- **azd کے لیے تیار**: ✅ **ہاں - مکمل طور پر مطابقت پذیر**

**تجویز**: مکمل خودکار ڈپلائمنٹ کے لیے `azd up` استعمال کریں، جس میں انفراسٹرکچر اور ایپلیکیشن سروسز دونوں شامل ہیں۔

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔