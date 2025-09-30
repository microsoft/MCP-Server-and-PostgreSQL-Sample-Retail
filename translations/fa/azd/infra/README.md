<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:20:53+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "fa"
}
-->
# قالب‌های زیرساخت

این پوشه شامل قالب‌های استقرار زیرساخت برای پروژه تحلیل خرده‌فروشی MCP است.

## 📁 نمای کلی فایل‌ها

| فایل | توضیحات | مورد استفاده |
|------|-------------|----------|
| `azuredeploy.json` | **قالب ARM** - استقرار کامل در سطح اشتراک | توصیه‌شده برای همه استقرارها |
| `azuredeploy.parameters.json` | **پارامترهای ARM** - مقادیر پیکربندی ثابت | استفاده‌شده با `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **راهنمای استقرار ARM** - دستورالعمل‌های دقیق | مستندات کامل استقرار |
| `README.md` | **این فایل** - نمای کلی زیرساخت | مرجع سریع |

## 🚀 گزینه‌های استقرار

### گزینه ۱: Azure CLI (توصیه‌شده)
استقرار کامل با ایجاد گروه منابع:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### گزینه ۲: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### گزینه ۳: پورتال Azure
1. به [پورتال Azure](https://portal.azure.com) بروید
2. جستجو کنید "Deploy a custom template"
3. فایل `azuredeploy.json` را بارگذاری کنید
4. پارامترها را پیکربندی کرده و استقرار دهید

## 🏗️ اجزای زیرساخت

قالب ARM زیرساخت‌های زیر را مستقر می‌کند:

- **گروه منابع**: ظرفی برای همه منابع با نام‌گذاری یکسان
- **فضای کاری Log Analytics**: ثبت و نظارت مرکزی (نگهداری ۳۰ روزه)
- **Application Insights**: نظارت بر عملکرد برنامه، یکپارچه با Log Analytics
- **خدمات هوش مصنوعی Azure**: مرکز چندخدمتی هوش مصنوعی (سطح S0) با هویت مدیریت‌شده
- **مدل‌های OpenAI**:
  - `gpt-4o-mini` (ظرفیت ۱۲۰) - مدل چت و تکمیل
  - `text-embedding-3-small` (ظرفیت ۵۰) - جاسازی متن برای جستجوی معنایی

## 🔧 پیکربندی قالب

### پارامترها
قالب ARM پارامترهای قابل تنظیم زیر را می‌پذیرد:

| پارامتر | مقدار پیش‌فرض | توضیحات |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | پیشوند برای همه نام‌های منابع |
| `location` | `westus2` | منطقه Azure برای استقرار |
| `uniqueSuffix` | به‌صورت خودکار تولید می‌شود | شناسه منحصربه‌فرد ۴ کاراکتری |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | نام نمایشی |
| `gptModelCapacity` | `120` | ظرفیت توکن مدل GPT |
| `embeddingModelCapacity` | `50` | ظرفیت مدل جاسازی |

### قرارداد نام‌گذاری منابع
همه منابع از الگوی زیر پیروی می‌کنند: `{type}-{resourcePrefix}-{uniqueSuffix}`

نمونه‌ها:
- گروه منابع: `rg-mcpretail-demo`
- خدمات هوش مصنوعی: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 اعتبارسنجی قالب

### اعتبارسنجی قبل از استقرار
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### بررسی وضعیت استقرار
```bash
az deployment sub list --output table
```

## 💰 برآورد هزینه

هزینه‌های ماهانه تخمینی برای بار کاری توسعه:

| سرویس | پیکربندی | هزینه تخمینی/ماه |
|---------|---------------|-----------------|
| خدمات هوش مصنوعی Azure | سطح S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K توکن | $15-30 |
| جاسازی‌های OpenAI | 50K توکن | $5-15 |
| Application Insights | نظارت پایه | $5-15 |
| Log Analytics | 1GB/ماه | $2-5 |
| **مجموع** | | **$42-115** |

## 📚 منابع اضافی

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - راهنمای استقرار دقیق با رفع اشکال
- [مستندات قالب ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [مستندات خدمات هوش مصنوعی Azure](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - نتایج اعتبارسنجی فایل

## 🆘 رفع اشکال سریع

### مشکلات رایج
- **احراز هویت**: دستور `az login` را اجرا کنید تا احراز هویت انجام شود
- **محدودیت‌های سهمیه**: در دسترس بودن مدل OpenAI در منطقه هدف را بررسی کنید
- **تعارض نام‌گذاری**: از پارامتر `uniqueSuffix` متفاوت استفاده کنید
- **مجوزها**: اطمینان حاصل کنید که حساب دارای نقش Contributor در اشتراک است

### دریافت کمک
- به [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) برای رفع اشکال دقیق مراجعه کنید
- گزارش‌های استقرار را در پورتال Azure بررسی کنید
- به [مشکلات GitHub](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) مراجعه کنید

---

برای تنظیم کامل پروژه، به [README اصلی](../../README.md) یا [راهنمای پروژه](../../walkthrough/README.md) مراجعه کنید.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.