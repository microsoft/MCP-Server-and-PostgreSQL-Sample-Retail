<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:03:51+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "fa"
}
-->
# دستورالعمل‌های استقرار قالب ARM

این سند دستورالعمل‌هایی برای استقرار زیرساخت تحلیل خرده‌فروشی MCP با استفاده از قالب ARM ارائه می‌دهد.

## 📋 مرور کلی

قالب `azuredeploy.json` ARM شامل استقرار کامل موارد زیر است:
- گروه منابع Azure  
- فضای کاری Log Analytics  
- Application Insights  
- خدمات Azure AI (Foundry)  
- استقرار مدل‌های OpenAI (GPT-4o-mini، text-embedding-3-small)  

## 🚀 گزینه‌های استقرار

### گزینه ۱: استقرار با Azure CLI

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### گزینه ۲: استقرار با PowerShell

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### گزینه ۳: پورتال Azure

1. به [پورتال Azure](https://portal.azure.com) بروید  
2. عبارت "Deploy a custom template" را جستجو کنید  
3. روی "Build your own template in the editor" کلیک کنید  
4. محتوای فایل `azuredeploy.json` را کپی و جای‌گذاری کنید  
5. روی "Save" و سپس "Review + create" کلیک کنید  
6. پارامترهای موردنیاز را پر کرده و استقرار را انجام دهید  

## 🔧 پارامترهای قالب

| پارامتر | نوع | مقدار پیش‌فرض | توضیحات |
|---------|-----|---------------|---------|
| `resourcePrefix` | string | `mcpretail` | پیشوند برای نام منابع |
| `location` | string | `westus2` | منطقه Azure برای استقرار |
| `uniqueSuffix` | string | به‌صورت خودکار تولید می‌شود | شناسه منحصربه‌فرد ۴ کاراکتری |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | نام نمایشی برای پروژه AI |
| `aiProjectDescription` | string | توضیحات پروژه | توضیحاتی که در Azure AI Foundry نمایش داده می‌شود |
| `gptModelCapacity` | int | `120` | ظرفیت توکن برای مدل GPT |
| `embeddingModelCapacity` | int | `50` | ظرفیت توکن برای مدل embedding |
| `tags` | object | برچسب‌های پیش‌فرض | برچسب‌های منابع برای مدیریت |

## 📤 خروجی‌های قالب

قالب خروجی‌های زیر را ارائه می‌دهد:

| خروجی | توضیحات |
|-------|---------|
| `subscriptionId` | شناسه اشتراک Azure |
| `resourceGroupName` | نام گروه منابع ایجادشده |
| `aiFoundryName` | نام سرویس Azure AI Foundry |
| `foundryEndpoint` | URL نقطه پایانی سرویس AI |
| `foundryAccountKey` | کلید دسترسی سرویس AI |
| `deployedModels` | آرایه‌ای از مدل‌های OpenAI مستقرشده |
| `applicationInsightsConnectionString` | رشته اتصال Application Insights |
| `logAnalyticsWorkspaceName` | نام فضای کاری Log Analytics |

## 🔍 دستورات تأیید

پس از استقرار، منابع را تأیید کنید:

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM در مقابل Bicep

این پروژه قالب‌های ARM و Bicep را ارائه می‌دهد:

### قالب ARM (`azuredeploy.json`)
- ✅ فرمت بومی Azure Resource Manager  
- ✅ در هر جایی که ARM پشتیبانی می‌شود کار می‌کند  
- ✅ نیاز به ابزار اضافی ندارد  
- ❌ سینتکس JSON طولانی‌تر  
- ❌ خواندن و نگهداری سخت‌تر  

### قالب Bicep (`main.bicep`)
- ✅ سینتکس مدرن و تمیز  
- ✅ ابزارها و IntelliSense بهتر  
- ✅ خواندن و نگهداری آسان‌تر  
- ✅ اعتبارسنجی در زمان کامپایل  
- ❌ نیاز به CLI Bicep  
- ❌ یک مرحله ساخت اضافی  

**توصیه**: از قالب‌های Bicep (`main.bicep`) برای توسعه و از قالب ARM (`azuredeploy.json`) برای سناریوهایی که نیاز به JSON خالص ARM دارند استفاده کنید.

## 🔧 سفارشی‌سازی

### افزودن منابع سفارشی

برای افزودن منابع اضافی به قالب ARM:

1. تعریف منبع را به آرایه `resources` در قالب تو در تو اضافه کنید  
2. هر پارامتر جدید را به بخش `parameters` اضافه کنید  
3. در صورت نیاز خروجی‌های مربوطه را اضافه کنید  
4. فایل پارامترها را با مقادیر پیش‌فرض به‌روزرسانی کنید  

### مثال: افزودن حساب ذخیره‌سازی

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 رفع اشکال

### مشکلات رایج

#### ۱. خطاهای اعتبارسنجی قالب
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### ۲. تداخل در نام منابع
- اطمینان حاصل کنید که `uniqueSuffix` واقعاً منحصربه‌فرد است  
- از تابع `uniqueString()` برای تولید خودکار استفاده کنید  
- منابع موجود در منطقه هدف را بررسی کنید  

#### ۳. محدودیت‌های سهمیه
- در دسترس بودن مدل OpenAI در منطقه هدف را بررسی کنید  
- سهمیه‌های اشتراک برای خدمات AI را بررسی کنید  
- در صورت رسیدن به محدودیت‌ها، استفاده از مناطق دیگر را در نظر بگیرید  

#### ۴. مشکلات مجوز
- اطمینان حاصل کنید که حساب دارای نقش Contributor در اشتراک است  
- بررسی کنید که اشتراک برای خدمات AI فعال است  
- ثبت‌نام ارائه‌دهنده منابع را تأیید کنید  

### دستورات اشکال‌زدایی

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 ملاحظات امنیتی

### کنترل دسترسی
- سرویس AI از هویت مدیریت‌شده برای دسترسی امن استفاده می‌کند  
- گروه منابع مرز RBAC را فراهم می‌کند  
- Application Insights کنترل‌های دسترسی جداگانه دارد  

### امنیت شبکه
- دسترسی شبکه عمومی به‌طور پیش‌فرض فعال است  
- برای محیط تولید، نقاط پایانی خصوصی را در نظر بگیرید  
- ACLهای شبکه را برای امنیت بیشتر پیکربندی کنید  

### مدیریت کلید
- کلیدهای سرویس AI به‌صورت خودکار تولید می‌شوند  
- از Azure Key Vault برای اسرار تولید استفاده کنید  
- کلیدها را به‌طور منظم برای امنیت بچرخانید  

## 📚 مراحل بعدی

پس از استقرار موفقیت‌آمیز:

1. **پیکربندی متغیرهای محیطی**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **راه‌اندازی سرور MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **تست یکپارچگی**:
   - پروژه را در VS Code باز کنید  
   - سرورهای MCP را در فایل `.vscode/mcp.json` پیکربندی کنید  
   - چت AI را با پرسش‌های داده‌های خرده‌فروشی تست کنید  

4. **نظارت بر عملکرد**:
   - معیارها را در Application Insights مشاهده کنید  
   - لاگ‌ها را در فضای کاری Log Analytics بررسی کنید  
   - هشدارهایی برای رویدادهای مهم تنظیم کنید  

---

برای اطلاعات بیشتر، به [README اصلی](../README.md) یا [راهنمای QUICKSTART](../QUICKSTART.md) مراجعه کنید.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.