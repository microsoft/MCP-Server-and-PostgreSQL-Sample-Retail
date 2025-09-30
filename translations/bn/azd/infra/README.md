<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:23:46+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "bn"
}
-->
# ইনফ্রাস্ট্রাকচার টেমপ্লেট

এই ফোল্ডারটি MCP রিটেইল অ্যানালিটিক্স প্রকল্পের জন্য ইনফ্রাস্ট্রাকচার ডিপ্লয়মেন্ট টেমপ্লেটগুলি ধারণ করে।

## 📁 ফাইলের সংক্ষিপ্ত বিবরণ

| ফাইল | বিবরণ | ব্যবহার ক্ষেত্র |
|------|-------------|----------|
| `azuredeploy.json` | **ARM টেমপ্লেট** - সম্পূর্ণ সাবস্ক্রিপশন-স্কোপড ডিপ্লয়মেন্ট | সমস্ত ডিপ্লয়মেন্টের জন্য সুপারিশকৃত |
| `azuredeploy.parameters.json` | **ARM প্যারামিটার** - স্থির কনফিগারেশন মান | `azuredeploy.json` এর সাথে ব্যবহৃত |
| `ARM-DEPLOYMENT.md` | **ARM ডিপ্লয়মেন্ট গাইড** - বিস্তারিত নির্দেশনা | সম্পূর্ণ ডিপ্লয়মেন্ট ডকুমেন্টেশন |
| `README.md` | **এই ফাইল** - ইনফ্রাস্ট্রাকচারের সংক্ষিপ্ত বিবরণ | দ্রুত রেফারেন্স |

## 🚀 ডিপ্লয়মেন্ট অপশন

### অপশন ১: Azure CLI (সুপারিশকৃত)
রিসোর্স গ্রুপ তৈরি সহ সম্পূর্ণ ডিপ্লয়মেন্ট:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### অপশন ২: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### অপশন ৩: Azure পোর্টাল
1. [Azure পোর্টাল](https://portal.azure.com) এ যান
2. "Deploy a custom template" অনুসন্ধান করুন
3. `azuredeploy.json` আপলোড করুন
4. প্যারামিটার কনফিগার করুন এবং ডিপ্লয় করুন

## 🏗️ ইনফ্রাস্ট্রাকচার উপাদান

ARM টেমপ্লেটটি নিম্নলিখিত ইনফ্রাস্ট্রাকচার ডিপ্লয় করে:

- **রিসোর্স গ্রুপ**: সমস্ত রিসোর্সের জন্য ধারক, ধারাবাহিক নামকরণ সহ
- **লগ অ্যানালিটিক্স ওয়ার্কস্পেস**: কেন্দ্রীয় লগিং এবং মনিটরিং (৩০ দিনের রিটেনশন)
- **অ্যাপ্লিকেশন ইনসাইটস**: লগ অ্যানালিটিক্সের সাথে ইন্টিগ্রেটেড অ্যাপ্লিকেশন পারফরম্যান্স মনিটরিং
- **Azure AI সার্ভিসেস**: মাল্টি-সার্ভিস AI হাব (S0 টিয়ার) ম্যানেজড আইডেন্টিটির সাথে
- **OpenAI মডেল**:
  - `gpt-4o-mini` (১২০ ক্ষমতা) - চ্যাট এবং কমপ্লিশন মডেল
  - `text-embedding-3-small` (৫০ ক্ষমতা) - সেমান্টিক সার্চের জন্য টেক্সট এম্বেডিং

## 🔧 টেমপ্লেট কনফিগারেশন

### প্যারামিটার
ARM টেমপ্লেটটি নিম্নলিখিত কাস্টমাইজযোগ্য প্যারামিটার গ্রহণ করে:

| প্যারামিটার | ডিফল্ট | বিবরণ |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | সমস্ত রিসোর্সের নামের জন্য প্রিফিক্স |
| `location` | `westus2` | ডিপ্লয়মেন্টের জন্য Azure অঞ্চল |
| `uniqueSuffix` | স্বয়ংক্রিয়ভাবে তৈরি | ৪-অক্ষরের ইউনিক আইডেন্টিফায়ার |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | প্রদর্শন নাম |
| `gptModelCapacity` | `120` | GPT মডেলের টোকেন ক্ষমতা |
| `embeddingModelCapacity` | `50` | এম্বেডিং মডেলের ক্ষমতা |

### রিসোর্স নামকরণের নিয়ম
সমস্ত রিসোর্স নিম্নলিখিত প্যাটার্ন অনুসরণ করে: `{type}-{resourcePrefix}-{uniqueSuffix}`

উদাহরণ:
- রিসোর্স গ্রুপ: `rg-mcpretail-demo`
- AI সার্ভিস: `fdy-mcpretail-demo`
- অ্যাপ্লিকেশন ইনসাইটস: `appi-mcpretail-demo`

## 🔍 টেমপ্লেট যাচাই

### ডিপ্লয়মেন্টের আগে যাচাই করুন
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### ডিপ্লয়মেন্ট স্ট্যাটাস পরীক্ষা করুন
```bash
az deployment sub list --output table
```


## 💰 খরচ অনুমান

ডেভেলপমেন্ট ওয়ার্কলোডের জন্য মাসিক আনুমানিক খরচ:

| সার্ভিস | কনফিগারেশন | আনুমানিক খরচ/মাস |
|---------|---------------|-----------------|
| Azure AI সার্ভিসেস | S0 টিয়ার | $15-50 |
| OpenAI GPT-4o-mini | ১২০K টোকেন | $15-30 |
| OpenAI এম্বেডিং | ৫০K টোকেন | $5-15 |
| অ্যাপ্লিকেশন ইনসাইটস | বেসিক মনিটরিং | $5-15 |
| লগ অ্যানালিটিক্স | ১GB/মাস | $2-5 |
| **মোট** | | **$42-115** |

## 📚 অতিরিক্ত রিসোর্স

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - বিস্তারিত ডিপ্লয়মেন্ট গাইড এবং সমস্যার সমাধান
- [ARM টেমপ্লেট ডকুমেন্টেশন](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI সার্ভিসেস ডকুমেন্টেশন](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - ফাইল যাচাইয়ের ফলাফল

## 🆘 দ্রুত সমস্যার সমাধান

### সাধারণ সমস্যা
- **অথেনটিকেশন**: `az login` চালিয়ে অথেনটিকেট করুন
- **কোটা সীমা**: লক্ষ্য অঞ্চলে OpenAI মডেলের প্রাপ্যতা পরীক্ষা করুন
- **নামকরণের দ্বন্দ্ব**: ভিন্ন `uniqueSuffix` প্যারামিটার ব্যবহার করুন
- **অনুমতি**: নিশ্চিত করুন যে অ্যাকাউন্টে সাবস্ক্রিপশনে Contributor ভূমিকা রয়েছে

### সাহায্য পান
- বিস্তারিত সমস্যার সমাধানের জন্য [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) দেখুন
- Azure পোর্টালে ডিপ্লয়মেন্ট লগ পরীক্ষা করুন
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) পরিদর্শন করুন

---

সম্পূর্ণ প্রকল্প সেটআপের জন্য, [মূল README](../../README.md) বা [প্রকল্প ওয়াকথ্রু](../../walkthrough/README.md) দেখুন।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।