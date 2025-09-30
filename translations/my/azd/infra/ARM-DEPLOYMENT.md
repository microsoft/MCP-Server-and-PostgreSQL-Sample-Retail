<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:17:58+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "my"
}
-->
# ARM Template Deployment Instructions

ဤစာရွက်စာတမ်းသည် MCP Retail Analytics အခြေခံအဆောက်အအုံကို ARM template အသုံးပြု၍ deploy လုပ်ရန်အတွက် လမ်းညွှန်ချက်များကို ပေးသည်။

## 📋 အကျဉ်းချုပ်

`azuredeploy.json` ARM template သည် အောက်ပါအရာများကို ပြည့်စုံစွာ deploy လုပ်ပေးသည်။
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Deployment Options

### Option 1: Azure CLI Deployment

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

### Option 2: PowerShell Deployment

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

### Option 3: Azure Portal

1. [Azure Portal](https://portal.azure.com) သို့ သွားပါ။
2. "Deploy a custom template" ကို ရှာပါ။
3. "Build your own template in the editor" ကို နှိပ်ပါ။
4. `azuredeploy.json` ရဲ့ အကြောင်းအရာကို ကူးယူပြီး paste လုပ်ပါ။
5. "Save" နှင့် "Review + create" ကို နှိပ်ပါ။
6. လိုအပ်သော parameters များကို ဖြည့်ပြီး deploy လုပ်ပါ။

## 🔧 Template Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Resource အမည်များအတွက် prefix |
| `location` | string | `westus2` | Deployment အတွက် Azure region |
| `uniqueSuffix` | string | Auto-generated | 4-character အထူး identifier |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI project အတွက် ပြသမည့်အမည် |
| `aiProjectDescription` | string | Project description | Azure AI Foundry တွင် ပြသမည့် ဖော်ပြချက် |
| `gptModelCapacity` | int | `120` | GPT model အတွက် token capacity |
| `embeddingModelCapacity` | int | `50` | Embedding model အတွက် token capacity |
| `tags` | object | Default tags | Governance အတွက် resource tags |

## 📤 Template Outputs

Template သည် အောက်ပါ outputs များကို ပေးသည်။

| Output | Description |
|--------|-------------|
| `subscriptionId` | Azure subscription ID |
| `resourceGroupName` | ဖန်တီးထားသော resource group အမည် |
| `aiFoundryName` | Azure AI Foundry service အမည် |
| `foundryEndpoint` | AI service endpoint URL |
| `foundryAccountKey` | AI service access key |
| `deployedModels` | Deploy လုပ်ထားသော OpenAI models များ array |
| `applicationInsightsConnectionString` | Application Insights connection string |
| `logAnalyticsWorkspaceName` | Log Analytics workspace အမည် |

## 🔍 Verification Commands

Deploy လုပ်ပြီးနောက် resources များကို အတည်ပြုပါ။

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

## 🆚 ARM vs Bicep

ဤ project သည် ARM နှင့် Bicep templates နှစ်မျိုးကို ပေးသည်။

### ARM Template (`azuredeploy.json`)
- ✅ Azure Resource Manager format ကို native အနေဖြင့် အသုံးပြုနိုင်သည်။
- ✅ ARM support ရှိသောနေရာများတွင် အလုပ်လုပ်သည်။
- ✅ အပို tooling မလိုအပ်ပါ။
- ❌ JSON syntax ပိုရှည်လျားသည်။
- ❌ ဖတ်ရန်နှင့် maintain လုပ်ရန် ပိုခက်သည်။

### Bicep Template (`main.bicep`)
- ✅ Syntax သန့်ရှင်းပြီး ခေတ်မီသည်။
- ✅ Tooling နှင့် IntelliSense ပိုကောင်းသည်။
- ✅ ဖတ်ရန်နှင့် maintain လုပ်ရန် ပိုလွယ်သည်။
- ✅ Compile-time validation ရှိသည်။
- ❌ Bicep CLI လိုအပ်သည်။
- ❌ အပို build အဆင့်လိုအပ်သည်။

**Recommendation**: Development အတွက် Bicep templates (`main.bicep`) ကို အသုံးပြုပါ။ Pure ARM JSON လိုအပ်သောအခြေအနေများတွင် ARM template (`azuredeploy.json`) ကို အသုံးပြုပါ။

## 🔧 Customization

### Adding Custom Resources

ARM template တွင် အပို resources ထည့်ရန်:

1. Nested template ရဲ့ `resources` array တွင် resource definition ကို ထည့်ပါ။
2. `parameters` အပိုင်းတွင် အသစ်သော parameters များကို ထည့်ပါ။
3. လိုအပ်ပါက အဆင့်ဆင့် outputs များကို ထည့်ပါ။
4. Parameters file ကို default values ဖြင့် update လုပ်ပါ။

### Example: Adding Storage Account

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

## 🐛 Troubleshooting

### Common Issues

#### 1. Template Validation Errors
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Resource Name Conflicts
- `uniqueSuffix` သည် အမှန်တကယ် unique ဖြစ်ကြောင်း သေချာပါ။
- Automatic generation အတွက် `uniqueString()` function ကို အသုံးပြုပါ။
- Target region တွင် ရှိပြီးသား resources များကို စစ်ဆေးပါ။

#### 3. Quota Limits
- Target region တွင် OpenAI model ရရှိနိုင်မှုကို စစ်ဆေးပါ။
- AI services အတွက် subscription quotas ကို စစ်ဆေးပါ။
- Limit များရောက်ရှိပါက အခြား region များကို အသုံးပြုရန် စဉ်းစားပါ။

#### 4. Permission Issues
- Subscription တွင် Contributor role ရှိကြောင်း သေချာပါ။
- Subscription သည် AI services အတွက် enabled ဖြစ်ကြောင်း စစ်ဆေးပါ။
- Resource provider registrations ကို စစ်ဆေးပါ။

### Debugging Commands

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

## 🔐 Security Considerations

### Access Control
- AI service သည် managed identity ကို အသုံးပြု၍ secure access ပေးသည်။
- Resource group သည် RBAC အတွက် boundary ပေးသည်။
- Application Insights တွင် သီးခြား access controls ရှိသည်။

### Network Security
- Public network access သည် default အနေဖြင့် enabled ဖြစ်သည်။
- Production အတွက် private endpoints ကို စဉ်းစားပါ။
- Network ACLs များကို အပို security အတွက် configure လုပ်နိုင်သည်။

### Key Management
- AI service keys များကို auto-generate လုပ်သည်။
- Production secrets အတွက် Azure Key Vault ကို အသုံးပြုပါ။
- Security အတွက် keys များကို regular အနေဖြင့် rotate လုပ်ပါ။

## 📚 Next Steps

Deploy လုပ်ပြီးနောက်:

1. **Environment Variables ကို Configure လုပ်ပါ**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP Server ကို Start လုပ်ပါ**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Integration ကို Test လုပ်ပါ**:
   - Project ကို VS Code ဖြင့် ဖွင့်ပါ။
   - `.vscode/mcp.json` တွင် MCP servers ကို configure လုပ်ပါ။
   - Retail data queries ဖြင့် AI Chat ကို စမ်းသပ်ပါ။

4. **Performance ကို Monitor လုပ်ပါ**:
   - Application Insights တွင် metrics များကို ကြည့်ပါ။
   - Log Analytics workspace တွင် logs များကို စစ်ဆေးပါ။
   - အရေးကြီးသော အဖြစ်အပျက်များအတွက် alerts များကို set လုပ်ပါ။

---

ပိုမိုသိရှိလိုပါက [main README](../README.md) သို့မဟုတ် [QUICKSTART guide](../QUICKSTART.md) ကို ကြည့်ပါ။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။