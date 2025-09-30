<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:04:13+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ur"
}
-->
# اے آر ایم ٹیمپلیٹ ڈپلائمنٹ ہدایات

یہ دستاویز اے آر ایم ٹیمپلیٹ کے ذریعے ایم سی پی ریٹیل اینالیٹکس انفراسٹرکچر کو ڈپلائے کرنے کی ہدایات فراہم کرتی ہے۔

## 📋 جائزہ

`azuredeploy.json` اے آر ایم ٹیمپلیٹ مکمل ڈپلائمنٹ فراہم کرتا ہے:
- ایزور ریسورس گروپ
- لاگ اینالیٹکس ورک اسپیس  
- ایپلیکیشن انسائٹس
- ایزور اے آئی سروسز (فاؤنڈری)
- اوپن اے آئی ماڈل ڈپلائمنٹس (GPT-4o-mini، text-embedding-3-small)

## 🚀 ڈپلائمنٹ کے اختیارات

### آپشن 1: ایزور سی ایل آئی ڈپلائمنٹ

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

### آپشن 2: پاور شیل ڈپلائمنٹ

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

### آپشن 3: ایزور پورٹل

1. [ایزور پورٹل](https://portal.azure.com) پر جائیں  
2. "Deploy a custom template" تلاش کریں  
3. "Build your own template in the editor" پر کلک کریں  
4. `azuredeploy.json` کے مواد کو کاپی اور پیسٹ کریں  
5. "Save" پر کلک کریں، پھر "Review + create"  
6. مطلوبہ پیرامیٹرز کو پُر کریں اور ڈپلائے کریں  

## 🔧 ٹیمپلیٹ پیرامیٹرز

| پیرامیٹر | قسم | ڈیفالٹ | وضاحت |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | ریسورس ناموں کے لیے پری فکس |
| `location` | string | `westus2` | ڈپلائمنٹ کے لیے ایزور ریجن |
| `uniqueSuffix` | string | خودکار طور پر تیار شدہ | 4-کریکٹر منفرد شناخت کنندہ |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | اے آئی پروجیکٹ کا ڈسپلے نام |
| `aiProjectDescription` | string | پروجیکٹ کی وضاحت | ایزور اے آئی فاؤنڈری میں دکھائی جانے والی وضاحت |
| `gptModelCapacity` | int | `120` | جی پی ٹی ماڈل کے لیے ٹوکن کیپیسٹی |
| `embeddingModelCapacity` | int | `50` | ایمبیڈنگ ماڈل کے لیے ٹوکن کیپیسٹی |
| `tags` | object | ڈیفالٹ ٹیگز | گورننس کے لیے ریسورس ٹیگز |

## 📤 ٹیمپلیٹ آؤٹ پٹس

ٹیمپلیٹ درج ذیل آؤٹ پٹس فراہم کرتا ہے:

| آؤٹ پٹ | وضاحت |
|--------|-------------|
| `subscriptionId` | ایزور سبسکرپشن آئی ڈی |
| `resourceGroupName` | تخلیق شدہ ریسورس گروپ کا نام |
| `aiFoundryName` | ایزور اے آئی فاؤنڈری سروس کا نام |
| `foundryEndpoint` | اے آئی سروس کا اینڈ پوائنٹ یو آر ایل |
| `foundryAccountKey` | اے آئی سروس کا ایکسیس کی |
| `deployedModels` | ڈپلائمنٹ کیے گئے اوپن اے آئی ماڈلز کی فہرست |
| `applicationInsightsConnectionString` | ایپلیکیشن انسائٹس کنکشن اسٹرنگ |
| `logAnalyticsWorkspaceName` | لاگ اینالیٹکس ورک اسپیس کا نام |

## 🔍 تصدیقی کمانڈز

ڈپلائمنٹ کے بعد، ریسورسز کی تصدیق کریں:

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

## 🆚 اے آر ایم بمقابلہ بائیسپ

یہ پروجیکٹ اے آر ایم اور بائیسپ دونوں ٹیمپلیٹس فراہم کرتا ہے:

### اے آر ایم ٹیمپلیٹ (`azuredeploy.json`)
- ✅ نیٹو ایزور ریسورس مینیجر فارمیٹ
- ✅ جہاں بھی اے آر ایم سپورٹڈ ہے کام کرتا ہے
- ✅ اضافی ٹولنگ کی ضرورت نہیں
- ❌ زیادہ تفصیلی JSON سینٹیکس
- ❌ پڑھنے اور مینٹین کرنے میں مشکل

### بائیسپ ٹیمپلیٹ (`main.bicep`)
- ✅ جدید، صاف سینٹیکس
- ✅ بہتر ٹولنگ اور انٹیلی سینس
- ✅ پڑھنے اور مینٹین کرنے میں آسان
- ✅ کمپائل ٹائم ویلیڈیشن
- ❌ بائیسپ سی ایل آئی کی ضرورت
- ❌ اضافی بلڈ اسٹیپ

**تجویز**: ترقی کے لیے بائیسپ ٹیمپلیٹس (`main.bicep`) استعمال کریں اور خالص اے آر ایم JSON کے لیے اے آر ایم ٹیمپلیٹ (`azuredeploy.json`) استعمال کریں۔

## 🔧 حسب ضرورت

### کسٹم ریسورسز شامل کرنا

اے آر ایم ٹیمپلیٹ میں اضافی ریسورسز شامل کرنے کے لیے:

1. نیسٹڈ ٹیمپلیٹ کے `resources` ارے میں ریسورس ڈیفینیشن شامل کریں  
2. `parameters` سیکشن میں نئے پیرامیٹرز شامل کریں  
3. اگر ضرورت ہو تو متعلقہ آؤٹ پٹس شامل کریں  
4. پیرامیٹرز فائل کو ڈیفالٹ ویلیوز کے ساتھ اپ ڈیٹ کریں  

### مثال: اسٹوریج اکاؤنٹ شامل کرنا

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

## 🐛 خرابیوں کا ازالہ

### عام مسائل

#### 1. ٹیمپلیٹ ویلیڈیشن کی غلطیاں
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. ریسورس نام کے تنازعات
- یقینی بنائیں کہ `uniqueSuffix` واقعی منفرد ہے  
- خودکار جنریشن کے لیے `uniqueString()` فنکشن استعمال کریں  
- ہدف ریجن میں موجودہ ریسورسز چیک کریں  

#### 3. کوٹہ حدود
- ہدف ریجن میں اوپن اے آئی ماڈل کی دستیابی کی تصدیق کریں  
- اے آئی سروسز کے لیے سبسکرپشن کوٹہ چیک کریں  
- اگر حدود تک پہنچ جائیں تو مختلف ریجنز استعمال کرنے پر غور کریں  

#### 4. اجازت کے مسائل
- یقینی بنائیں کہ اکاؤنٹ کے پاس سبسکرپشن پر Contributor رول ہے  
- چیک کریں کہ سبسکرپشن اے آئی سروسز کے لیے فعال ہے  
- ریسورس پرووائیڈر رجسٹریشنز کی تصدیق کریں  

### ڈیبگنگ کمانڈز

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

## 🔐 سیکیورٹی کے تحفظات

### ایکسیس کنٹرول
- اے آئی سروس محفوظ ایکسیس کے لیے مینیجڈ آئیڈینٹی استعمال کرتی ہے  
- ریسورس گروپ آر بی اے سی کے لیے حد فراہم کرتا ہے  
- ایپلیکیشن انسائٹس کے علیحدہ ایکسیس کنٹرولز ہیں  

### نیٹ ورک سیکیورٹی
- عوامی نیٹ ورک ایکسیس ڈیفالٹ کے طور پر فعال ہے  
- پروڈکشن کے لیے پرائیویٹ اینڈ پوائنٹس پر غور کریں  
- اضافی سیکیورٹی کے لیے نیٹ ورک اے سی ایلز کو کنفیگر کریں  

### کی مینجمنٹ
- اے آئی سروس کیز خودکار طور پر تیار کی جاتی ہیں  
- پروڈکشن سیکریٹس کے لیے ایزور کی والٹ استعمال کریں  
- سیکیورٹی کے لیے کیز کو باقاعدگی سے تبدیل کریں  

## 📚 اگلے اقدامات

کامیاب ڈپلائمنٹ کے بعد:

1. **ماحولیاتی متغیرات کو کنفیگر کریں**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **ایم سی پی سرور شروع کریں**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **انٹیگریشن ٹیسٹ کریں**:
   - پروجیکٹ کے ساتھ وی ایس کوڈ کھولیں  
   - `.vscode/mcp.json` میں ایم سی پی سرورز کو کنفیگر کریں  
   - ریٹیل ڈیٹا کوئریز کے ساتھ اے آئی چیٹ ٹیسٹ کریں  

4. **کارکردگی کی نگرانی کریں**:
   - ایپلیکیشن انسائٹس میں میٹرکس دیکھیں  
   - لاگ اینالیٹکس ورک اسپیس میں لاگز چیک کریں  
   - اہم ایونٹس کے لیے الرٹس سیٹ کریں  

---

مزید معلومات کے لیے، [مرکزی README](../README.md) یا [QUICKSTART گائیڈ](../QUICKSTART.md) دیکھیں۔

---

**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستگی ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔