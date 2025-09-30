<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T13:01:00+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "my"
}
-->
# Azure Developer CLI (azd) အခြေခံအဆောက်အအုံ စစ်ဆေးခြင်း

## ✅ **လက်ရှိအခြေအနေ: azd အတွက် အသင့်**

`azd\infra` ဖိုလ်ဒါသည် Azure Developer CLI ဖြင့် deploy လုပ်ရန်အတွက် **အပြည့်အဝ လိုက်ဖက်ညီပြီး** ဖြစ်ပါသည်။ လိုအပ်သော ဖိုင်များအားလုံးကို ဖန်တီးပြီး အဆင်သင့်ဖြစ်စေထားပါသည်။

### 📁 **azd အဆောက်အအုံ ပြည့်စုံမှု**
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

### ✅ **Azure Developer CLI အစိတ်အပိုင်းများ**

#### 1. `azure.yaml` ✅ **အသင့်**
- **တည်နေရာ**: `azd/azure.yaml`
- **ရည်ရွယ်ချက်**: azd အဓိက configuration ဖိုင်
- **အခြေအနေ**: ✅ ဖန်တီးပြီး အဆင်သင့်
- **အင်္ဂါရပ်များ**:
  - MCP server အတွက် service သတ်မှတ်ချက်
  - Container App hosting configuration
  - Environment variable mapping
  - Deployment hooks for lifecycle management

#### 2. **Bicep အခြေခံအဆောက်အအုံ** ✅ **အသင့်**
- **Main Template**: `main.bicep` (subscription-scoped)
- **Parameters**: `main.parameters.json` (azd variables ဖြင့်)
- **Modules**: Modular Bicep architecture
- **အခြေအနေ**: ✅ အဆောက်အအုံ deploy ပြီးစီးမှု

#### 3. **Service Configuration** ✅ **အသင့်**
- **MCP Server**: Container App deploy လုပ်ရန်အဆင်သင့်
- **Docker**: ရှိပြီးသား Dockerfile ကို configure ပြုလုပ်ထား
- **Environment Variables**: Azure AI Services နှင့် ပေါင်းစပ်ထား
- **Monitoring**: Application Insights ချိတ်ဆက်ထား

### 🚀 **azd Deployment အဆင်သင့်**

Azure Developer CLI ကို အသုံးပြု၍ deploy လုပ်နိုင်ပါပြီ:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **Deploy လုပ်ပြီးသော Resources**

azd deployment မှ ဖန်တီးမည့်အရာများ:

#### **အခြေခံအဆောက်အအုံ** 
- ✅ Resource Group (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ OpenAI Model Deployments:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ Container App Environment

#### **Application**
- ✅ MCP Server (Container App)
- ✅ Health checks enabled
- ✅ Monitoring connected
- ✅ Environment variables configured

### 📊 **azd နှင့် Manual Deployment နှိုင်းယှဉ်မှု**

| အင်္ဂါရပ် | azd `/azd` | Manual `/infra` |
|-----------|------------|-----------------|
| **အခြေအနေ** | ✅ အသင့် & ပြည့်စုံ | ✅ အလုပ်လုပ်နေ |
| **Template** | Bicep modules | Bicep modules |
| **Deployment** | `azd up` automation | Manual scripts |
| **Environment** | Auto env vars | Manual setup |
| **Services** | Container Apps | Infrastructure only |
| **Configuration** | Services ဖြင့် ပြည့်စုံ | Infrastructure အပေါ် အခြေခံ |

### 🛠️ **Environment Variables**

azd သည် အောက်ပါ output variables များကို အလိုအလျောက် သတ်မှတ်ပေးမည်:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **စစ်ဆေးမှု အကျဉ်းချုပ်**

- **azure.yaml**: ✅ ဖန်တီးပြီး configure ပြုလုပ်ထား
- **Bicep Templates**: ✅ Modular architecture ပြည့်စုံ
- **Parameters File**: ✅ azd-compatible variables
- **Service Definition**: ✅ Container App အဆင်သင့်
- **Docker Configuration**: ✅ ရှိပြီးသား Dockerfile အသုံးပြုထား
- **Environment Variables**: ✅ Azure AI Services ပေါင်းစပ်ထား
- **azd အတွက် အသင့်**: ✅ **YES - အပြည့်အဝ လိုက်ဖက်ညီ**

**အကြံပြုချက်**: `azd up` ကို အသုံးပြု၍ infrastructure နှင့် application services နှစ်ခုစလုံးကို အလိုအလျောက် deploy လုပ်ပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။