<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:20:34+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ar"
}
-->
# قوالب البنية التحتية

يحتوي هذا المجلد على قوالب نشر البنية التحتية لمشروع MCP Retail Analytics.

## 📁 نظرة عامة على الملفات

| الملف | الوصف | حالة الاستخدام |
|-------|-------|----------------|
| `azuredeploy.json` | **قالب ARM** - نشر كامل على مستوى الاشتراك | يُوصى به لجميع عمليات النشر |
| `azuredeploy.parameters.json` | **معلمات ARM** - قيم تكوين ثابتة | يُستخدم مع `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **دليل نشر ARM** - تعليمات مفصلة | وثائق نشر كاملة |
| `README.md` | **هذا الملف** - نظرة عامة على البنية التحتية | مرجع سريع |

## 🚀 خيارات النشر

### الخيار 1: Azure CLI (موصى به)
نشر كامل مع إنشاء مجموعة الموارد:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### الخيار 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### الخيار 3: بوابة Azure
1. انتقل إلى [بوابة Azure](https://portal.azure.com)
2. ابحث عن "نشر قالب مخصص"
3. قم بتحميل `azuredeploy.json`
4. قم بتكوين المعلمات والنشر

## 🏗️ مكونات البنية التحتية

يقوم قالب ARM بنشر البنية التحتية التالية:

- **مجموعة الموارد**: حاوية لجميع الموارد مع تسمية متسقة
- **مساحة عمل Log Analytics**: تسجيل مركزي ومراقبة (احتفاظ لمدة 30 يومًا)
- **Application Insights**: مراقبة أداء التطبيقات متكاملة مع Log Analytics
- **خدمات Azure AI**: مركز خدمات AI متعدد (المستوى S0) مع هوية مُدارة
- **نماذج OpenAI**:
  - `gpt-4o-mini` (سعة 120) - نموذج محادثة وإكمال
  - `text-embedding-3-small` (سعة 50) - تضمين النصوص للبحث الدلالي

## 🔧 تكوين القالب

### المعلمات
يقبل قالب ARM المعلمات القابلة للتخصيص التالية:

| المعلمة | الافتراضي | الوصف |
|---------|-----------|-------|
| `resourcePrefix` | `mcpretail` | بادئة لجميع أسماء الموارد |
| `location` | `westus2` | منطقة Azure للنشر |
| `uniqueSuffix` | يتم إنشاؤه تلقائيًا | معرف فريد مكون من 4 أحرف |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | اسم العرض |
| `gptModelCapacity` | `120` | سعة الرموز لنموذج GPT |
| `embeddingModelCapacity` | `50` | سعة الرموز لنموذج التضمين |

### اتفاقية تسمية الموارد
تتبع جميع الموارد النمط: `{type}-{resourcePrefix}-{uniqueSuffix}`

أمثلة:
- مجموعة الموارد: `rg-mcpretail-demo`
- خدمة AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 التحقق من القالب

### التحقق قبل النشر
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### التحقق من حالة النشر
```bash
az deployment sub list --output table
```

## 💰 تقدير التكلفة

التكاليف الشهرية المقدرة لبيئة التطوير:

| الخدمة | التكوين | التكلفة المقدرة/الشهر |
|--------|----------|-----------------------|
| خدمات Azure AI | المستوى S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K رموز | $15-30 |
| OpenAI Embeddings | 50K رموز | $5-15 |
| Application Insights | مراقبة أساسية | $5-15 |
| Log Analytics | 1GB/الشهر | $2-5 |
| **الإجمالي** | | **$42-115** |

## 📚 موارد إضافية

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - دليل نشر مفصل مع استكشاف الأخطاء
- [وثائق قالب ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [وثائق خدمات Azure AI](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - نتائج التحقق من الملفات

## 🆘 استكشاف الأخطاء الشائعة

### المشاكل الشائعة
- **المصادقة**: قم بتشغيل `az login` للمصادقة
- **حدود الحصة**: تحقق من توفر نموذج OpenAI في المنطقة المستهدفة
- **تعارضات التسمية**: استخدم معلمة `uniqueSuffix` مختلفة
- **الأذونات**: تأكد من أن الحساب لديه دور المساهم في الاشتراك

### الحصول على المساعدة
- راجع [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) لاستكشاف الأخطاء وإصلاحها بالتفصيل
- تحقق من سجلات النشر في بوابة Azure
- قم بزيارة [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

لإعداد المشروع بالكامل، راجع [الملف الرئيسي README](../../README.md) أو [دليل المشروع](../../walkthrough/README.md).

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.