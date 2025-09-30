<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:53:27+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "bn"
}
-->
# Azure Developer CLI (azd) ইনফ্রাস্ট্রাকচার যাচাই

## ✅ **বর্তমান অবস্থা: azd এর জন্য প্রস্তুত**

`azd\infra` ফোল্ডারটি এখন **Azure Developer CLI ডিপ্লয়মেন্টের সাথে সম্পূর্ণ সামঞ্জস্যপূর্ণ**। প্রয়োজনীয় সব ফাইল তৈরি এবং কনফিগার করা হয়েছে।

### 📁 **সম্পূর্ণ azd কাঠামো**
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

### ✅ **Azure Developer CLI উপাদানসমূহ**

#### 1. `azure.yaml` ✅ **প্রস্তুত**
- **অবস্থান**: `azd/azure.yaml`
- **উদ্দেশ্য**: প্রধান azd কনফিগারেশন ফাইল
- **অবস্থা**: ✅ তৈরি এবং কনফিগার করা হয়েছে
- **বৈশিষ্ট্যসমূহ**:
  - MCP সার্ভারের জন্য সার্ভিস ডেফিনিশন
  - কন্টেইনার অ্যাপ হোস্টিং কনফিগারেশন
  - পরিবেশ ভেরিয়েবল ম্যাপিং
  - লাইফসাইকেল ম্যানেজমেন্টের জন্য ডিপ্লয়মেন্ট হুক

#### 2. **Bicep ইনফ্রাস্ট্রাকচার** ✅ **প্রস্তুত**
- **প্রধান টেমপ্লেট**: `main.bicep` (সাবস্ক্রিপশন-স্কোপড)
- **প্যারামিটার**: `main.parameters.json` azd ভেরিয়েবল সহ
- **মডিউল**: মডুলার Bicep আর্কিটেকচার
- **অবস্থা**: ✅ সম্পূর্ণ ইনফ্রাস্ট্রাকচার ডিপ্লয়মেন্ট

#### 3. **সার্ভিস কনফিগারেশন** ✅ **প্রস্তুত**
- **MCP সার্ভার**: কন্টেইনার অ্যাপ ডিপ্লয়মেন্ট প্রস্তুত
- **Docker**: বিদ্যমান Dockerfile কনফিগার করা হয়েছে
- **পরিবেশ ভেরিয়েবল**: Azure AI সার্ভিসের ইন্টিগ্রেশন
- **মনিটরিং**: Application Insights সংযুক্ত

### 🚀 **azd ডিপ্লয়মেন্ট প্রস্তুত**

আপনি এখন Azure Developer CLI ব্যবহার করে ডিপ্লয় করতে পারেন:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **ডিপ্লয় করা রিসোর্সসমূহ**

azd ডিপ্লয়মেন্ট নিম্নলিখিত তৈরি করবে:

#### **ইনফ্রাস্ট্রাকচার** 
- ✅ রিসোর্স গ্রুপ (`rg-<env-name>`)
- ✅ লগ অ্যানালিটিক্স ওয়ার্কস্পেস
- ✅ অ্যাপ্লিকেশন ইনসাইটস
- ✅ Azure AI সার্ভিস (Foundry)
- ✅ OpenAI মডেল ডিপ্লয়মেন্ট:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ কন্টেইনার অ্যাপ পরিবেশ

#### **অ্যাপ্লিকেশন**
- ✅ MCP সার্ভার (কন্টেইনার অ্যাপ)
- ✅ হেলথ চেক সক্রিয়
- ✅ মনিটরিং সংযুক্ত
- ✅ পরিবেশ ভেরিয়েবল কনফিগার করা হয়েছে

### 📊 **azd বনাম ম্যানুয়াল ডিপ্লয়মেন্ট**

| বৈশিষ্ট্য | azd `/azd` | ম্যানুয়াল `/infra` |
|-----------|------------|---------------------|
| **অবস্থা** | ✅ প্রস্তুত এবং সম্পূর্ণ | ✅ কার্যকর |
| **টেমপ্লেট** | Bicep মডিউল | Bicep মডিউল |
| **ডিপ্লয়মেন্ট** | `azd up` অটোমেশন | ম্যানুয়াল স্ক্রিপ্ট |
| **পরিবেশ** | স্বয়ংক্রিয় পরিবেশ ভেরিয়েবল | ম্যানুয়াল সেটআপ |
| **সার্ভিস** | কন্টেইনার অ্যাপ | শুধুমাত্র ইনফ্রাস্ট্রাকচার |
| **কনফিগারেশন** | সার্ভিস সহ সম্পূর্ণ | ইনফ্রাস্ট্রাকচার কেন্দ্রীকৃত |

### 🛠️ **পরিবেশ ভেরিয়েবল**

azd স্বয়ংক্রিয়ভাবে এই আউটপুট ভেরিয়েবল সেট করবে:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **যাচাইয়ের সারাংশ**

- **azure.yaml**: ✅ তৈরি এবং কনফিগার করা হয়েছে
- **Bicep টেমপ্লেট**: ✅ সম্পূর্ণ মডুলার আর্কিটেকচার
- **প্যারামিটার ফাইল**: ✅ azd-সামঞ্জস্যপূর্ণ ভেরিয়েবল
- **সার্ভিস ডেফিনিশন**: ✅ কন্টেইনার অ্যাপ প্রস্তুত
- **Docker কনফিগারেশন**: ✅ বিদ্যমান Dockerfile ব্যবহার করা হয়েছে
- **পরিবেশ ভেরিয়েবল**: ✅ Azure AI সার্ভিস ইন্টিগ্রেটেড
- **azd এর জন্য প্রস্তুত**: ✅ **হ্যাঁ - সম্পূর্ণ সামঞ্জস্যপূর্ণ**

**প্রস্তাবনা**: সম্পূর্ণ অটোমেটেড ডিপ্লয়মেন্টের জন্য `azd up` ব্যবহার করুন, যা ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন সার্ভিস উভয়ই অন্তর্ভুক্ত করে।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।