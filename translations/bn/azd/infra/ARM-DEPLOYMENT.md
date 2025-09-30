<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:06:55+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "bn"
}
-->
# ARM টেমপ্লেট ডিপ্লয়মেন্ট নির্দেশিকা

এই ডকুমেন্টটি MCP রিটেইল অ্যানালিটিক্স অবকাঠামো ARM টেমপ্লেট ব্যবহার করে ডিপ্লয় করার নির্দেশনা প্রদান করে।

## 📋 সংক্ষিপ্ত বিবরণ

`azuredeploy.json` ARM টেমপ্লেটটি সম্পূর্ণ ডিপ্লয়মেন্ট প্রদান করে:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI মডেল ডিপ্লয়মেন্ট (GPT-4o-mini, text-embedding-3-small)

## 🚀 ডিপ্লয়মেন্ট অপশন

### অপশন ১: Azure CLI ডিপ্লয়মেন্ট

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

### অপশন ২: PowerShell ডিপ্লয়মেন্ট

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

### অপশন ৩: Azure পোর্টাল

1. [Azure পোর্টাল](https://portal.azure.com) এ যান
2. "Deploy a custom template" অনুসন্ধান করুন
3. "Build your own template in the editor" ক্লিক করুন
4. `azuredeploy.json` এর কন্টেন্ট কপি এবং পেস্ট করুন
5. "Save" তারপর "Review + create" ক্লিক করুন
6. প্রয়োজনীয় প্যারামিটার পূরণ করুন এবং ডিপ্লয় করুন

## 🔧 টেমপ্লেট প্যারামিটার

| প্যারামিটার | টাইপ | ডিফল্ট | বিবরণ |
|------------|------|--------|-------|
| `resourcePrefix` | string | `mcpretail` | রিসোর্স নামের প্রিফিক্স |
| `location` | string | `westus2` | ডিপ্লয়মেন্টের জন্য Azure অঞ্চল |
| `uniqueSuffix` | string | স্বয়ংক্রিয়ভাবে তৈরি | ৪-অক্ষরের ইউনিক আইডেন্টিফায়ার |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI প্রকল্পের প্রদর্শন নাম |
| `aiProjectDescription` | string | প্রকল্পের বিবরণ | Azure AI Foundry-তে প্রদর্শিত বিবরণ |
| `gptModelCapacity` | int | `120` | GPT মডেলের টোকেন ক্ষমতা |
| `embeddingModelCapacity` | int | `50` | এমবেডিং মডেলের টোকেন ক্ষমতা |
| `tags` | object | ডিফল্ট ট্যাগ | গভর্নেন্সের জন্য রিসোর্স ট্যাগ |

## 📤 টেমপ্লেট আউটপুট

টেমপ্লেটটি নিম্নলিখিত আউটপুট প্রদান করে:

| আউটপুট | বিবরণ |
|--------|-------|
| `subscriptionId` | Azure সাবস্ক্রিপশন আইডি |
| `resourceGroupName` | তৈরি করা রিসোর্স গ্রুপের নাম |
| `aiFoundryName` | Azure AI Foundry সার্ভিসের নাম |
| `foundryEndpoint` | AI সার্ভিসের এন্ডপয়েন্ট URL |
| `foundryAccountKey` | AI সার্ভিসের অ্যাক্সেস কী |
| `deployedModels` | ডিপ্লয় করা OpenAI মডেলের অ্যারে |
| `applicationInsightsConnectionString` | Application Insights কানেকশন স্ট্রিং |
| `logAnalyticsWorkspaceName` | Log Analytics ওয়ার্কস্পেসের নাম |

## 🔍 যাচাই করার কমান্ড

ডিপ্লয়মেন্টের পরে, রিসোর্স যাচাই করুন:

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

## 🆚 ARM বনাম Bicep

এই প্রকল্পটি ARM এবং Bicep টেমপ্লেট উভয়ই প্রদান করে:

### ARM টেমপ্লেট (`azuredeploy.json`)
- ✅ নেটিভ Azure Resource Manager ফরম্যাট
- ✅ যেখানে ARM সমর্থিত, সেখানে কাজ করে
- ✅ অতিরিক্ত টুলিং প্রয়োজন নেই
- ❌ বেশি বিস্তারিত JSON সিনট্যাক্স
- ❌ পড়া এবং রক্ষণাবেক্ষণ করা কঠিন

### Bicep টেমপ্লেট (`main.bicep`)
- ✅ আধুনিক, পরিষ্কার সিনট্যাক্স
- ✅ উন্নত টুলিং এবং IntelliSense
- ✅ পড়া এবং রক্ষণাবেক্ষণ সহজ
- ✅ কম্পাইল-টাইম যাচাই
- ❌ Bicep CLI প্রয়োজন
- ❌ অতিরিক্ত বিল্ড ধাপ

**প্রস্তাবনা**: ডেভেলপমেন্টের জন্য Bicep টেমপ্লেট (`main.bicep`) ব্যবহার করুন এবং শুধুমাত্র ARM JSON প্রয়োজন হলে ARM টেমপ্লেট (`azuredeploy.json`) ব্যবহার করুন।

## 🔧 কাস্টমাইজেশন

### কাস্টম রিসোর্স যোগ করা

ARM টেমপ্লেটে অতিরিক্ত রিসোর্স যোগ করতে:

1. নেস্টেড টেমপ্লেটের `resources` অ্যারেতে রিসোর্স ডেফিনিশন যোগ করুন
2. `parameters` সেকশনে নতুন প্যারামিটার যোগ করুন
3. প্রয়োজন হলে সংশ্লিষ্ট আউটপুট যোগ করুন
4. প্যারামিটার ফাইলটি ডিফল্ট মান দিয়ে আপডেট করুন

### উদাহরণ: স্টোরেজ অ্যাকাউন্ট যোগ করা

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

## 🐛 সমস্যা সমাধান

### সাধারণ সমস্যা

#### ১. টেমপ্লেট যাচাইয়ের ত্রুটি
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### ২. রিসোর্স নামের দ্বন্দ্ব
- নিশ্চিত করুন `uniqueSuffix` সত্যিই ইউনিক
- স্বয়ংক্রিয় জেনারেশনের জন্য `uniqueString()` ফাংশন ব্যবহার করুন
- টার্গেট অঞ্চলে বিদ্যমান রিসোর্স পরীক্ষা করুন

#### ৩. কোটার সীমা
- টার্গেট অঞ্চলে OpenAI মডেলের প্রাপ্যতা যাচাই করুন
- AI সার্ভিসের জন্য সাবস্ক্রিপশন কোটাগুলি পরীক্ষা করুন
- সীমা পৌঁছালে অন্য অঞ্চল ব্যবহার করার কথা বিবেচনা করুন

#### ৪. অনুমতির সমস্যা
- নিশ্চিত করুন অ্যাকাউন্টে সাবস্ক্রিপশনে Contributor ভূমিকা রয়েছে
- যাচাই করুন যে সাবস্ক্রিপশন AI সার্ভিসের জন্য সক্রিয়
- রিসোর্স প্রোভাইডার রেজিস্ট্রেশন যাচাই করুন

### ডিবাগিং কমান্ড

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

## 🔐 নিরাপত্তা বিবেচনা

### অ্যাক্সেস নিয়ন্ত্রণ
- AI সার্ভিস ম্যানেজড আইডেন্টিটি ব্যবহার করে নিরাপদ অ্যাক্সেস প্রদান করে
- রিসোর্স গ্রুপ RBAC-এর জন্য সীমা প্রদান করে
- Application Insights-এ আলাদা অ্যাক্সেস নিয়ন্ত্রণ রয়েছে

### নেটওয়ার্ক নিরাপত্তা
- ডিফল্টভাবে পাবলিক নেটওয়ার্ক অ্যাক্সেস সক্রিয়
- প্রোডাকশনের জন্য প্রাইভেট এন্ডপয়েন্ট বিবেচনা করুন
- অতিরিক্ত নিরাপত্তার জন্য নেটওয়ার্ক ACL কনফিগার করা যেতে পারে

### কী ব্যবস্থাপনা
- AI সার্ভিসের কী স্বয়ংক্রিয়ভাবে তৈরি হয়
- প্রোডাকশন সিক্রেটের জন্য Azure Key Vault ব্যবহার করুন
- নিরাপত্তার জন্য নিয়মিত কী রোটেট করুন

## 📚 পরবর্তী পদক্ষেপ

সফল ডিপ্লয়মেন্টের পরে:

1. **পরিবেশ ভেরিয়েবল কনফিগার করুন**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP সার্ভার শুরু করুন**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **ইন্টিগ্রেশন পরীক্ষা করুন**:
   - প্রজেক্ট সহ VS Code খুলুন
   - `.vscode/mcp.json`-এ MCP সার্ভার কনফিগার করুন
   - রিটেইল ডেটা কোয়েরি সহ AI চ্যাট পরীক্ষা করুন

4. **পারফরম্যান্স মনিটর করুন**:
   - Application Insights-এ মেট্রিক দেখুন
   - Log Analytics ওয়ার্কস্পেসে লগ পরীক্ষা করুন
   - গুরুত্বপূর্ণ ইভেন্টের জন্য অ্যালার্ট সেট আপ করুন

---

আরও তথ্যের জন্য, [মেইন README](../README.md) বা [QUICKSTART গাইড](../QUICKSTART.md) দেখুন।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।