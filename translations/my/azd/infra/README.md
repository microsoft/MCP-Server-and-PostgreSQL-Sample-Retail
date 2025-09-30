<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:34:03+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "my"
}
-->
# အခြေခံအဆောက်အအုံ Template များ

ဤဖိုလ်တွင် MCP Retail Analytics project အတွက် အခြေခံအဆောက်အအုံ deployment template များပါဝင်သည်။

## 📁 ဖိုင်အကျဉ်းချုပ်

| ဖိုင် | ဖော်ပြချက် | အသုံးပြုမှု |
|------|-------------|----------|
| `azuredeploy.json` | **ARM template** - Subscription-scoped deployment အပြည့်အစုံ | အားလုံးအတွက် အကြံပြုထားသော deployment |
| `azuredeploy.parameters.json` | **ARM parameters** - Static configuration values | `azuredeploy.json` နှင့်အတူ အသုံးပြုသည် |
| `ARM-DEPLOYMENT.md` | **ARM deployment guide** - အသေးစိတ်လမ်းညွှန်ချက်များ | Deployment အတွက် documentation အပြည့်အစုံ |
| `README.md` | **ဤဖိုင်** - အခြေခံအဆောက်အအုံအကျဉ်းချုပ် | အမြန်ရယူရန်အညွှန်း |

## 🚀 Deployment ရွေးချယ်မှုများ

### ရွေးချယ်မှု ၁: Azure CLI (အကြံပြုထားသည်)
Resource group ဖန်တီးခြင်းနှင့်အတူ deployment အပြည့်အစုံ:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### ရွေးချယ်မှု ၂: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### ရွေးချယ်မှု ၃: Azure Portal
1. [Azure Portal](https://portal.azure.com) သို့ သွားပါ
2. "Deploy a custom template" ကို ရှာပါ
3. `azuredeploy.json` ကို upload လုပ်ပါ
4. Parameters ကို configure လုပ်ပြီး deploy လုပ်ပါ

## 🏗️ အခြေခံအဆောက်အအုံ Components

ARM template သည် အောက်ပါအဆောက်အအုံများကို deploy လုပ်ပါသည်-

- **Resource Group**: အားလုံးကို တစ်စည်းတည်းသော နာမည်ဖြင့် စုပေါင်းထားသော container
- **Log Analytics Workspace**: အလယ်ဗဟို log နှင့် monitoring (30 ရက်အထိ retention)
- **Application Insights**: Log Analytics နှင့်ပေါင်းစပ်ထားသော application performance monitoring
- **Azure AI Services**: Multi-service AI hub (S0 tier) နှင့် managed identity
- **OpenAI Models**:
  - `gpt-4o-mini` (120 capacity) - Chat နှင့် completion model
  - `text-embedding-3-small` (50 capacity) - Semantic search အတွက် text embeddings

## 🔧 Template Configuration

### Parameters
ARM template သည် အောက်ပါ parameters များကို customize လုပ်နိုင်သည်-

| Parameter | Default | ဖော်ပြချက် |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Resource name များအတွက် prefix |
| `location` | `westus2` | Deployment အတွက် Azure region |
| `uniqueSuffix` | Auto-generated | 4-character အထူး identifier |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Display name |
| `gptModelCapacity` | `120` | GPT model token capacity |
| `embeddingModelCapacity` | `50` | Embedding model capacity |

### Resource Naming Convention
Resource များအားလုံးသည် `{type}-{resourcePrefix}-{uniqueSuffix}` ပုံစံကို လိုက်နာသည်။

ဥပမာများ:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Template Validation

### Deployment မပြုမီ Validate လုပ်ပါ
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Deployment Status ကို စစ်ဆေးပါ
```bash
az deployment sub list --output table
```

## 💰 ကုန်ကျစရိတ် ခန့်မှန်းခြင်း

ဖွံ့ဖြိုးရေး workload အတွက် လစဉ်ကုန်ကျစရိတ် ခန့်မှန်းချက်:

| Service | Configuration | ခန့်မှန်းကုန်ကျစရိတ်/လ |
|---------|---------------|-----------------|
| Azure AI Services | S0 tier | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | အခြေခံ monitoring | $5-15 |
| Log Analytics | 1GB/month | $2-5 |
| **စုစုပေါင်း** | | **$42-115** |

## 📚 အပိုဆောင်းအရင်းအမြစ်များ

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Troubleshooting ပါဝင်သော deployment guide အသေးစိတ်
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - ဖိုင် validation ရလဒ်များ

## 🆘 အမြန် Troubleshooting

### အများဆုံးတွေ့ရသော ပြဿနာများ
- **Authentication**: `az login` ကို run လုပ်ပြီး authenticate လုပ်ပါ
- **Quota Limits**: Target region တွင် OpenAI model ရရှိနိုင်မှုကို စစ်ဆေးပါ
- **Naming Conflicts**: `uniqueSuffix` parameter ကို အခြားနံပါတ်ဖြင့် အသုံးပြုပါ
- **Permissions**: Subscription တွင် Contributor role ရှိသည်ကို သေချာပါ

### အကူအညီရယူရန်
- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) တွင် troubleshooting အသေးစိတ်ကို ကြည့်ပါ
- Azure Portal တွင် deployment logs ကို စစ်ဆေးပါ
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) သို့ သွားပါ

---

Project setup အပြည့်အစုံအတွက် [main README](../../README.md) သို့မဟုတ် [project walkthrough](../../walkthrough/README.md) ကို ကြည့်ပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။