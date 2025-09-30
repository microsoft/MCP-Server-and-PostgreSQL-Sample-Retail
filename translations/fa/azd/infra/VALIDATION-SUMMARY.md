<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:51:17+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "fa"
}
-->
# اعتبارسنجی زیرساخت Azure Developer CLI (azd)

## ✅ **وضعیت فعلی: آماده برای azd**

پوشه `azd\infra` اکنون **کاملاً سازگار** با استقرار Azure Developer CLI است. تمام فایل‌های موردنیاز ایجاد و پیکربندی شده‌اند.

### 📁 **ساختار کامل azd**
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

### ✅ **اجزای Azure Developer CLI**

#### 1. `azure.yaml` ✅ **آماده**
- **مکان**: `azd/azure.yaml`
- **هدف**: فایل اصلی پیکربندی azd
- **وضعیت**: ✅ ایجاد و پیکربندی شده
- **ویژگی‌ها**:
  - تعریف سرویس برای سرور MCP
  - پیکربندی میزبانی Container App
  - نگاشت متغیرهای محیطی
  - هوک‌های استقرار برای مدیریت چرخه عمر

#### 2. **زیرساخت Bicep** ✅ **آماده**
- **قالب اصلی**: `main.bicep` (در سطح اشتراک)
- **پارامترها**: `main.parameters.json` با متغیرهای azd
- **ماژول‌ها**: معماری ماژولار Bicep
- **وضعیت**: ✅ استقرار کامل زیرساخت

#### 3. **پیکربندی سرویس** ✅ **آماده**
- **سرور MCP**: آماده برای استقرار Container App
- **Docker**: فایل Docker موجود پیکربندی شده
- **متغیرهای محیطی**: یکپارچه‌سازی با خدمات Azure AI
- **نظارت**: Application Insights متصل شده

### 🚀 **آماده برای استقرار azd**

اکنون می‌توانید با استفاده از Azure Developer CLI استقرار را انجام دهید:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **منابع مستقر شده**

استقرار azd موارد زیر را ایجاد خواهد کرد:

#### **زیرساخت**
- ✅ گروه منابع (`rg-<env-name>`)
- ✅ فضای کاری Log Analytics
- ✅ Application Insights
- ✅ خدمات Azure AI (Foundry)
- ✅ استقرار مدل‌های OpenAI:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ محیط Container App

#### **برنامه**
- ✅ سرور MCP (Container App)
- ✅ بررسی‌های سلامت فعال
- ✅ نظارت متصل شده
- ✅ متغیرهای محیطی پیکربندی شده

### 📊 **مقایسه azd و استقرار دستی**

| ویژگی | azd `/azd` | دستی `/infra` |
|-------|------------|---------------|
| **وضعیت** | ✅ آماده و کامل | ✅ در حال کار |
| **قالب** | ماژول‌های Bicep | ماژول‌های Bicep |
| **استقرار** | اتوماسیون `azd up` | اسکریپت‌های دستی |
| **محیط** | متغیرهای محیطی خودکار | تنظیمات دستی |
| **خدمات** | Container Apps | فقط زیرساخت |
| **پیکربندی** | کامل با خدمات | متمرکز بر زیرساخت |

### 🛠️ **متغیرهای محیطی**

azd به طور خودکار این متغیرهای خروجی را تنظیم می‌کند:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **خلاصه اعتبارسنجی**

- **azure.yaml**: ✅ ایجاد و پیکربندی شده
- **قالب‌های Bicep**: ✅ معماری ماژولار کامل
- **فایل پارامترها**: ✅ متغیرهای سازگار با azd
- **تعریف سرویس**: ✅ آماده برای Container App
- **پیکربندی Docker**: ✅ استفاده از فایل Docker موجود
- **متغیرهای محیطی**: ✅ یکپارچه‌سازی با خدمات Azure AI
- **آماده برای azd**: ✅ **بله - کاملاً سازگار**

**توصیه**: از `azd up` برای استقرار خودکار کامل شامل زیرساخت و خدمات برنامه استفاده کنید.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را رعایت کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادقتی‌هایی باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه انسانی حرفه‌ای توصیه می‌شود. ما هیچ مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.