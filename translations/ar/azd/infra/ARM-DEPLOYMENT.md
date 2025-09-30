<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:03:31+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ar"
}
-->
# تعليمات نشر قالب ARM

يوفر هذا المستند تعليمات لنشر بنية MCP Retail Analytics باستخدام قالب ARM.

## 📋 نظرة عامة

يوفر قالب `azuredeploy.json` نشرًا كاملاً لـ:
- مجموعة موارد Azure
- مساحة عمل Log Analytics  
- Application Insights
- خدمات Azure AI (Foundry)
- نشر نماذج OpenAI (GPT-4o-mini، text-embedding-3-small)

## 🚀 خيارات النشر

### الخيار 1: النشر باستخدام Azure CLI

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

### الخيار 2: النشر باستخدام PowerShell

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

### الخيار 3: بوابة Azure

1. انتقل إلى [بوابة Azure](https://portal.azure.com)
2. ابحث عن "نشر قالب مخصص"
3. انقر على "إنشاء قالب خاص بك في المحرر"
4. انسخ والصق محتويات `azuredeploy.json`
5. انقر على "حفظ" ثم "مراجعة + إنشاء"
6. قم بملء المعلمات المطلوبة وقم بالنشر

## 🔧 معلمات القالب

| المعلمة | النوع | الافتراضي | الوصف |
|---------|-------|----------|-------|
| `resourcePrefix` | نص | `mcpretail` | بادئة أسماء الموارد |
| `location` | نص | `westus2` | منطقة Azure للنشر |
| `uniqueSuffix` | نص | يتم إنشاؤه تلقائيًا | معرف فريد مكون من 4 أحرف |
| `aiProjectFriendlyName` | نص | `MCP Retail Analytics Project` | اسم العرض لمشروع الذكاء الاصطناعي |
| `aiProjectDescription` | نص | وصف المشروع | الوصف المعروض في Azure AI Foundry |
| `gptModelCapacity` | عدد صحيح | `120` | سعة الرموز لنموذج GPT |
| `embeddingModelCapacity` | عدد صحيح | `50` | سعة الرموز لنموذج التضمين |
| `tags` | كائن | العلامات الافتراضية | علامات الموارد للحوكمة |

## 📤 مخرجات القالب

يوفر القالب المخرجات التالية:

| المخرج | الوصف |
|--------|-------|
| `subscriptionId` | معرف اشتراك Azure |
| `resourceGroupName` | اسم مجموعة الموارد التي تم إنشاؤها |
| `aiFoundryName` | اسم خدمة Azure AI Foundry |
| `foundryEndpoint` | عنوان URL لنقطة نهاية خدمة الذكاء الاصطناعي |
| `foundryAccountKey` | مفتاح الوصول لخدمة الذكاء الاصطناعي |
| `deployedModels` | قائمة نماذج OpenAI المنشورة |
| `applicationInsightsConnectionString` | سلسلة الاتصال لـ Application Insights |
| `logAnalyticsWorkspaceName` | اسم مساحة عمل Log Analytics |

## 🔍 أوامر التحقق

بعد النشر، تحقق من الموارد:

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

## 🆚 ARM مقابل Bicep

يوفر هذا المشروع قوالب ARM وBicep:

### قالب ARM (`azuredeploy.json`)
- ✅ تنسيق أصلي لـ Azure Resource Manager
- ✅ يعمل في أي مكان يتم دعم ARM فيه
- ✅ لا يتطلب أدوات إضافية
- ❌ صيغة JSON أكثر تفصيلًا
- ❌ أصعب في القراءة والصيانة

### قالب Bicep (`main.bicep`)
- ✅ صيغة حديثة ونظيفة
- ✅ أدوات أفضل وIntelliSense
- ✅ أسهل في القراءة والصيانة
- ✅ تحقق أثناء وقت التجميع
- ❌ يتطلب Bicep CLI
- ❌ خطوة بناء إضافية

**التوصية**: استخدم قوالب Bicep (`main.bicep`) للتطوير وقالب ARM (`azuredeploy.json`) للسيناريوهات التي تتطلب JSON ARM النقي.

## 🔧 التخصيص

### إضافة موارد مخصصة

لإضافة موارد إضافية إلى قالب ARM:

1. أضف تعريف المورد إلى مصفوفة `resources` في القالب المتداخل
2. أضف أي معلمات جديدة إلى قسم `parameters`
3. أضف المخرجات المقابلة إذا لزم الأمر
4. قم بتحديث ملف المعلمات بالقيم الافتراضية

### مثال: إضافة حساب تخزين

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

## 🐛 استكشاف الأخطاء وإصلاحها

### المشكلات الشائعة

#### 1. أخطاء التحقق من القالب
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. تعارض أسماء الموارد
- تأكد من أن `uniqueSuffix` فريد بالفعل
- استخدم وظيفة `uniqueString()` للتوليد التلقائي
- تحقق من الموارد الموجودة في المنطقة المستهدفة

#### 3. حدود الحصص
- تحقق من توفر نموذج OpenAI في المنطقة المستهدفة
- تحقق من حصص الاشتراك لخدمات الذكاء الاصطناعي
- فكر في استخدام مناطق مختلفة إذا تم الوصول إلى الحدود

#### 4. مشكلات الأذونات
- تأكد من أن الحساب لديه دور المساهم في الاشتراك
- تحقق من أن الاشتراك مفعل لخدمات الذكاء الاصطناعي
- تحقق من تسجيل موفري الموارد

### أوامر التصحيح

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

## 🔐 اعتبارات الأمان

### التحكم في الوصول
- تستخدم خدمة الذكاء الاصطناعي الهوية المُدارة للوصول الآمن
- توفر مجموعة الموارد حدودًا لـ RBAC
- يحتوي Application Insights على ضوابط وصول منفصلة

### أمان الشبكة
- يتم تمكين الوصول إلى الشبكة العامة افتراضيًا
- فكر في استخدام نقاط النهاية الخاصة للإنتاج
- يمكن تكوين قوائم التحكم في الشبكة لمزيد من الأمان

### إدارة المفاتيح
- يتم إنشاء مفاتيح خدمة الذكاء الاصطناعي تلقائيًا
- استخدم Azure Key Vault للأسرار في الإنتاج
- قم بتدوير المفاتيح بانتظام لضمان الأمان

## 📚 الخطوات التالية

بعد النشر الناجح:

1. **تكوين متغيرات البيئة**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **بدء تشغيل خادم MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **اختبار التكامل**:
   - افتح VS Code مع المشروع
   - قم بتكوين خوادم MCP في `.vscode/mcp.json`
   - اختبر الدردشة الذكية باستخدام استفسارات بيانات البيع بالتجزئة

4. **مراقبة الأداء**:
   - عرض المقاييس في Application Insights
   - تحقق من السجلات في مساحة عمل Log Analytics
   - قم بإعداد التنبيهات للأحداث المهمة

---

لمزيد من المعلومات، راجع [الملف الرئيسي README](../README.md) أو [دليل QUICKSTART](../QUICKSTART.md).

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.