<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:27:25+00:00",
  "source_file": "azd/README.md",
  "language_code": "my"
}
-->
# Azure Developer CLI (azd) အမြန်စတင်လမ်းညွှန်

## 🚀 Azure Developer CLI ဖြင့် Deploy လုပ်ခြင်း

ဒီပရောဂျက်ကို Azure Developer CLI (azd) နှင့်အတူ အခြေခံအဆောက်အအုံနှင့် MCP server အက်ပလီကေးရှင်းကို အလိုအလျောက် Deploy လုပ်နိုင်ရန်အတွက် အပြည့်အဝလိုက်လျောညီထွေဖြစ်အောင် ပြင်ဆင်ပြီးဖြစ်ပါသည်။

### လိုအပ်ချက်များ

1. **Azure Developer CLI ကို Install လုပ်ပါ**:
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

2. **Azure သို့ Login ဝင်ပါ**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 တစ်ကြိမ်တည်း Command ဖြင့် Deploy လုပ်ခြင်း

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

### 🔧 ဖွံ့ဖြိုးတိုးတက်မှု လုပ်ငန်းစဉ်

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

### 📦 Deploy လုပ်မည့်အရာများ

#### **အခြေခံအဆောက်အအုံ**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (OpenAI မော်ဒယ်များနှင့်အတူ)
- Container App Environment

#### **အက်ပလီကေးရှင်း**
- MCP Server (Container App)
- Health monitoring ပေါင်းစပ်ထားသည်
- Environment variables များကို ပြင်ဆင်ထားသည်
- Application Insights ပေါင်းစပ်ထားသည်

### 🌍 Environment Variables

Deploy လုပ်ပြီးနောက်၊ အောက်ပါ variables များကို အလိုအလျောက်ရရှိနိုင်ပါသည်-

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 စောင့်ကြည့်မှုနှင့် စီမံခန့်ခွဲမှု

- **Azure Portal**: သင့် resource group အတွင်းရှိ အားလုံးသော resources များကို ကြည့်ရှုပါ
- **Application Insights**: အက်ပလီကေးရှင်း၏ စွမ်းဆောင်ရည်နှင့် log များကို စောင့်ကြည့်ပါ
- **Container Apps**: အက်ပလီကေးရှင်း log များနှင့် metrics များကို ကြည့်ရှုပါ
- **AI Studio**: OpenAI မော်ဒယ် deployment များကို စီမံပါ

### 📋 ပြဿနာရှင်းလင်းခြင်း

#### **အထွေထွေပြဿနာများ**

1. **တည်နေရာမပံ့ပိုးပါ**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Resource quotas ကျော်လွန်မှု**:
   - Azure Portal တွင် သင့် subscription အကန့်အသတ်များကို စစ်ဆေးပါ
   - အခြားတည်နေရာကို စမ်းကြည့်ပါ

3. **Authentication ပြဿနာများ**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Deployment logs ကြည့်ရန်**:
   ```bash
   azd show --output json
   ```

### 🔄 အခြားရွေးချယ်မှု: Manual Deployment

သင် Manual Deployment ကို စိတ်ဝင်စားပါက၊ `/infra` ဖိုလ်ဒါအတွင်းရှိ အခြေခံအဆောက်အအုံကို အသုံးပြုနိုင်ပါသည်-

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 ပိုမိုလေ့လာရန်

- [Azure Developer CLI Documentation](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Documentation](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Documentation](https://docs.microsoft.com/azure/ai-services/)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။