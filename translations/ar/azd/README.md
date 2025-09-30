<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:19:47+00:00",
  "source_file": "azd/README.md",
  "language_code": "ar"
}
-->
# البدء السريع مع Azure Developer CLI (azd)

## 🚀 النشر باستخدام Azure Developer CLI

هذا المشروع متوافق الآن بالكامل مع Azure Developer CLI (azd) للنشر التلقائي للبنية التحتية وتطبيق خادم MCP.

### المتطلبات الأساسية

1. **تثبيت Azure Developer CLI**:
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

2. **تسجيل الدخول إلى Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 النشر بأمر واحد

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

### 🔧 سير العمل التطويري

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

### 📦 ما يتم نشره

#### **البنية التحتية**
- مجموعة الموارد
- مساحة عمل Log Analytics  
- Application Insights
- خدمات Azure AI (مع نماذج OpenAI)
- بيئة تطبيقات الحاويات

#### **التطبيق**
- خادم MCP (تطبيق الحاويات)
- تمكين مراقبة الصحة
- تكوين متغيرات البيئة
- تكامل مع Application Insights

### 🌍 متغيرات البيئة

بعد النشر، تصبح هذه المتغيرات متاحة تلقائيًا:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 المراقبة والإدارة

- **Azure Portal**: عرض جميع الموارد في مجموعة الموارد الخاصة بك
- **Application Insights**: مراقبة أداء التطبيق والسجلات
- **Container Apps**: عرض سجلات التطبيق والقياسات
- **AI Studio**: إدارة نشر نماذج OpenAI

### 📋 استكشاف الأخطاء وإصلاحها

#### **المشاكل الشائعة**

1. **الموقع غير مدعوم**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **تجاوز حصص الموارد**:
   - تحقق من حدود الاشتراك الخاص بك في Azure Portal
   - جرب منطقة مختلفة

3. **مشاكل المصادقة**:
   ```bash
   azd auth login --use-device-code
   ```

4. **عرض سجلات النشر**:
   ```bash
   azd show --output json
   ```

### 🔄 البديل: النشر اليدوي

إذا كنت تفضل النشر اليدوي، يمكنك استخدام البنية التحتية الموجودة في مجلد `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 تعلم المزيد

- [وثائق Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [وثائق تطبيقات الحاويات](https://docs.microsoft.com/azure/container-apps/)
- [وثائق خدمات Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.