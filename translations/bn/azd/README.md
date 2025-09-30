<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:21:46+00:00",
  "source_file": "azd/README.md",
  "language_code": "bn"
}
-->
# Azure Developer CLI (azd) দ্রুত শুরু

## 🚀 Azure Developer CLI দিয়ে ডিপ্লয় করুন

এই প্রকল্পটি এখন সম্পূর্ণভাবে Azure Developer CLI (azd)-এর সাথে সামঞ্জস্যপূর্ণ, যা অবকাঠামো এবং MCP সার্ভার অ্যাপ্লিকেশন উভয়ের স্বয়ংক্রিয় ডিপ্লয়মেন্টের জন্য প্রস্তুত।

### প্রয়োজনীয়তা

1. **Azure Developer CLI ইনস্টল করুন**:
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

2. **Azure-এ লগইন করুন**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 এক-কমান্ডে ডিপ্লয়মেন্ট

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

### 🔧 ডেভেলপমেন্ট ওয়ার্কফ্লো

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

### 📦 কী কী ডিপ্লয় হয়

#### **অবকাঠামো**
- রিসোর্স গ্রুপ
- লগ অ্যানালিটিক্স ওয়ার্কস্পেস  
- অ্যাপ্লিকেশন ইনসাইটস
- Azure AI সার্ভিস (OpenAI মডেল সহ)
- কন্টেইনার অ্যাপ পরিবেশ

#### **অ্যাপ্লিকেশন**
- MCP সার্ভার (কন্টেইনার অ্যাপ)
- স্বাস্থ্য পর্যবেক্ষণ সক্রিয়
- পরিবেশ ভেরিয়েবল কনফিগার করা
- অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

### 🌍 পরিবেশ ভেরিয়েবল

ডিপ্লয়মেন্টের পরে, এই ভেরিয়েবলগুলো স্বয়ংক্রিয়ভাবে উপলব্ধ থাকবে:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 পর্যবেক্ষণ ও ব্যবস্থাপনা

- **Azure Portal**: আপনার রিসোর্স গ্রুপে সমস্ত রিসোর্স দেখুন
- **Application Insights**: অ্যাপ্লিকেশনের পারফরম্যান্স এবং লগ পর্যবেক্ষণ করুন
- **Container Apps**: অ্যাপ্লিকেশনের লগ এবং মেট্রিক্স দেখুন
- **AI Studio**: OpenAI মডেল ডিপ্লয়মেন্ট পরিচালনা করুন

### 📋 সমস্যা সমাধান

#### **সাধারণ সমস্যা**

1. **লোকেশন সমর্থিত নয়**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **রিসোর্স কোটা অতিক্রম করেছে**:
   - Azure Portal-এ আপনার সাবস্ক্রিপশন সীমা পরীক্ষা করুন
   - অন্য কোনো অঞ্চল চেষ্টা করুন

3. **প্রমাণীকরণ সমস্যা**:
   ```bash
   azd auth login --use-device-code
   ```

4. **ডিপ্লয়মেন্ট লগ দেখুন**:
   ```bash
   azd show --output json
   ```

### 🔄 বিকল্প: ম্যানুয়াল ডিপ্লয়মেন্ট

যদি আপনি ম্যানুয়াল ডিপ্লয়মেন্ট পছন্দ করেন, তবে আপনি `/infra` ফোল্ডারের অবকাঠামো ব্যবহার করতে পারেন:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 আরও জানুন

- [Azure Developer CLI ডকুমেন্টেশন](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps ডকুমেন্টেশন](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services ডকুমেন্টেশন](https://docs.microsoft.com/azure/ai-services/)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। নথিটির মূল ভাষায় থাকা আসল সংস্করণকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।