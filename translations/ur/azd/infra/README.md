<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:21:12+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ur"
}
-->
# انفراسٹرکچر ٹیمپلیٹس

یہ فولڈر MCP ریٹیل اینالیٹکس پروجیکٹ کے لیے انفراسٹرکچر ڈپلائمنٹ ٹیمپلیٹس پر مشتمل ہے۔

## 📁 فائلز کا جائزہ

| فائل | وضاحت | استعمال کا مقصد |
|------|-------------|----------|
| `azuredeploy.json` | **ARM ٹیمپلیٹ** - مکمل سبسکرپشن-اسکوپڈ ڈپلائمنٹ | تمام ڈپلائمنٹس کے لیے تجویز کردہ |
| `azuredeploy.parameters.json` | **ARM پیرامیٹرز** - جامد کنفیگریشن ویلیوز | `azuredeploy.json` کے ساتھ استعمال کی جاتی ہے |
| `ARM-DEPLOYMENT.md` | **ARM ڈپلائمنٹ گائیڈ** - تفصیلی ہدایات | مکمل ڈپلائمنٹ دستاویزات |
| `README.md` | **یہ فائل** - انفراسٹرکچر کا جائزہ | فوری حوالہ |

## 🚀 ڈپلائمنٹ کے اختیارات

### آپشن 1: Azure CLI (تجویز کردہ)
ریسورس گروپ کی تخلیق کے ساتھ مکمل ڈپلائمنٹ:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### آپشن 2: پاور شیل
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### آپشن 3: Azure پورٹل
1. [Azure پورٹل](https://portal.azure.com) پر جائیں
2. "Deploy a custom template" تلاش کریں
3. `azuredeploy.json` اپلوڈ کریں
4. پیرامیٹرز کنفیگر کریں اور ڈپلائمنٹ کریں

## 🏗️ انفراسٹرکچر کے اجزاء

ARM ٹیمپلیٹ درج ذیل انفراسٹرکچر کو ڈپلائے کرتا ہے:

- **ریسورس گروپ**: تمام ریسورسز کے لیے ایک کنٹینر، مستقل نام کے ساتھ
- **لاگ اینالیٹکس ورک اسپیس**: مرکزی لاگنگ اور مانیٹرنگ (30 دن کی ریٹینشن)
- **ایپلیکیشن انسائٹس**: ایپلیکیشن کی کارکردگی کی مانیٹرنگ، لاگ اینالیٹکس کے ساتھ مربوط
- **Azure AI سروسز**: ملٹی-سروس AI حب (S0 ٹائر) مینیجڈ آئیڈینٹی کے ساتھ
- **OpenAI ماڈلز**:
  - `gpt-4o-mini` (120 کیپیسٹی) - چیٹ اور کمپلیشن ماڈل
  - `text-embedding-3-small` (50 کیپیسٹی) - سیمینٹک سرچ کے لیے ٹیکسٹ ایمبیڈنگ

## 🔧 ٹیمپلیٹ کنفیگریشن

### پیرامیٹرز
ARM ٹیمپلیٹ درج ذیل قابل تخصیص پیرامیٹرز قبول کرتا ہے:

| پیرامیٹر | ڈیفالٹ | وضاحت |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | تمام ریسورسز کے ناموں کے لیے پری فکس |
| `location` | `westus2` | ڈپلائمنٹ کے لیے Azure ریجن |
| `uniqueSuffix` | خودکار طور پر تخلیق شدہ | 4-کریکٹر منفرد شناخت |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | ڈسپلے نام |
| `gptModelCapacity` | `120` | GPT ماڈل ٹوکن کیپیسٹی |
| `embeddingModelCapacity` | `50` | ایمبیڈنگ ماڈل کیپیسٹی |

### ریسورس نام دینے کا کنونشن
تمام ریسورسز درج ذیل پیٹرن کی پیروی کرتے ہیں: `{type}-{resourcePrefix}-{uniqueSuffix}`

مثالیں:
- ریسورس گروپ: `rg-mcpretail-demo`
- AI سروس: `fdy-mcpretail-demo`
- ایپلیکیشن انسائٹس: `appi-mcpretail-demo`

## 🔍 ٹیمپلیٹ کی توثیق

### ڈپلائمنٹ سے پہلے توثیق کریں
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### ڈپلائمنٹ اسٹیٹس چیک کریں
```bash
az deployment sub list --output table
```


## 💰 لاگت کا تخمینہ

ترقیاتی ورک لوڈ کے لیے ماہانہ تخمینہ شدہ لاگت:

| سروس | کنفیگریشن | تخمینہ لاگت/ماہ |
|---------|---------------|-----------------|
| Azure AI سروسز | S0 ٹائر | $15-50 |
| OpenAI GPT-4o-mini | 120K ٹوکنز | $15-30 |
| OpenAI ایمبیڈنگز | 50K ٹوکنز | $5-15 |
| ایپلیکیشن انسائٹس | بنیادی مانیٹرنگ | $5-15 |
| لاگ اینالیٹکس | 1GB/ماہ | $2-5 |
| **کل** | | **$42-115** |

## 📚 اضافی وسائل

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - تفصیلی ڈپلائمنٹ گائیڈ اور ٹربل شوٹنگ
- [ARM ٹیمپلیٹ دستاویزات](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI سروسز دستاویزات](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - فائل کی توثیق کے نتائج

## 🆘 فوری ٹربل شوٹنگ

### عام مسائل
- **تصدیق**: `az login` چلائیں تاکہ تصدیق ہو سکے
- **کوٹہ حدود**: ہدف ریجن میں OpenAI ماڈل کی دستیابی چیک کریں
- **نام کے تنازعات**: مختلف `uniqueSuffix` پیرامیٹر استعمال کریں
- **اجازتیں**: یقینی بنائیں کہ اکاؤنٹ کے پاس سبسکرپشن پر Contributor رول ہے

### مدد حاصل کریں
- تفصیلی ٹربل شوٹنگ کے لیے [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) دیکھیں
- Azure پورٹل میں ڈپلائمنٹ لاگز چیک کریں
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) پر جائیں

---

مکمل پروجیکٹ سیٹ اپ کے لیے [مرکزی README](../../README.md) یا [پروجیکٹ واک تھرو](../../walkthrough/README.md) دیکھیں۔

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔