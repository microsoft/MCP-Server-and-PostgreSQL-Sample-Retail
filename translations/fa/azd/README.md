<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:19:57+00:00",
  "source_file": "azd/README.md",
  "language_code": "fa"
}
-->
# شروع سریع Azure Developer CLI (azd)

## 🚀 استقرار با Azure Developer CLI

این پروژه اکنون کاملاً با Azure Developer CLI (azd) سازگار است و امکان استقرار خودکار زیرساخت و برنامه سرور MCP را فراهم می‌کند.

### پیش‌نیازها

1. **نصب Azure Developer CLI**:
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

2. **ورود به Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 استقرار با یک فرمان

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

### 🔧 جریان کاری توسعه

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

### 📦 مواردی که استقرار می‌یابند

#### **زیرساخت**
- گروه منابع
- فضای کاری Log Analytics  
- Application Insights
- خدمات Azure AI (با مدل‌های OpenAI)
- محیط برنامه‌های کانتینری

#### **برنامه**
- سرور MCP (برنامه کانتینری)
- نظارت بر سلامت فعال شده
- متغیرهای محیطی پیکربندی شده
- یکپارچه‌سازی با Application Insights

### 🌍 متغیرهای محیطی

پس از استقرار، این متغیرها به‌طور خودکار در دسترس خواهند بود:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 نظارت و مدیریت

- **پرتال Azure**: مشاهده تمام منابع در گروه منابع شما
- **Application Insights**: نظارت بر عملکرد و لاگ‌های برنامه
- **برنامه‌های کانتینری**: مشاهده لاگ‌ها و معیارهای برنامه
- **AI Studio**: مدیریت استقرار مدل‌های OpenAI

### 📋 رفع اشکال

#### **مشکلات رایج**

1. **مکان پشتیبانی نمی‌شود**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **سهمیه منابع تمام شده**:
   - محدودیت‌های اشتراک خود را در پرتال Azure بررسی کنید
   - منطقه دیگری را امتحان کنید

3. **مشکلات احراز هویت**:
   ```bash
   azd auth login --use-device-code
   ```

4. **مشاهده لاگ‌های استقرار**:
   ```bash
   azd show --output json
   ```

### 🔄 جایگزین: استقرار دستی

اگر ترجیح می‌دهید استقرار دستی انجام دهید، همچنان می‌توانید از زیرساخت موجود در پوشه `/infra` استفاده کنید:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 اطلاعات بیشتر

- [مستندات Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [مستندات برنامه‌های کانتینری](https://docs.microsoft.com/azure/container-apps/)
- [مستندات خدمات Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.