<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:08:04+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "pa"
}
-->
# ARM ਟੈਂਪਲੇਟ ਡਿਪਲੌਇਮੈਂਟ ਹਦਾਇਤਾਂ

ਇਹ ਦਸਤਾਵੇਜ਼ MCP ਰਿਟੇਲ ਐਨਾਲਿਟਿਕਸ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਨੂੰ ARM ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਹਦਾਇਤਾਂ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ।

## 📋 ਝਲਕ

`azuredeploy.json` ARM ਟੈਂਪਲੇਟ ਪੂਰੀ ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ (GPT-4o-mini, text-embedding-3-small)

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਵਿਕਲਪ

### ਵਿਕਲਪ 1: Azure CLI ਡਿਪਲੌਇਮੈਂਟ

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

### ਵਿਕਲਪ 2: PowerShell ਡਿਪਲੌਇਮੈਂਟ

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

### ਵਿਕਲਪ 3: Azure ਪੋਰਟਲ

1. [Azure ਪੋਰਟਲ](https://portal.azure.com) 'ਤੇ ਜਾਓ
2. "Deploy a custom template" ਦੀ ਖੋਜ ਕਰੋ
3. "Build your own template in the editor" 'ਤੇ ਕਲਿਕ ਕਰੋ
4. `azuredeploy.json` ਦੀ ਸਮੱਗਰੀ ਕਾਪੀ ਅਤੇ ਪੇਸਟ ਕਰੋ
5. "Save" ਅਤੇ ਫਿਰ "Review + create" 'ਤੇ ਕਲਿਕ ਕਰੋ
6. ਲੋੜੀਂਦੇ ਪੈਰਾਮੀਟਰ ਭਰੋ ਅਤੇ ਡਿਪਲੌਇ ਕਰੋ

## 🔧 ਟੈਂਪਲੇਟ ਪੈਰਾਮੀਟਰ

| ਪੈਰਾਮੀਟਰ | ਕਿਸਮ | ਡਿਫਾਲਟ | ਵੇਰਵਾ |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | ਰਿਸੋਰਸ ਨਾਮਾਂ ਲਈ ਪ੍ਰੀਫਿਕਸ |
| `location` | string | `westus2` | ਡਿਪਲੌਇਮੈਂਟ ਲਈ Azure ਖੇਤਰ |
| `uniqueSuffix` | string | Auto-generated | 4-ਅੱਖਰਾਂ ਦਾ ਵਿਲੱਖਣ ਪਛਾਣਕਰਤਾ |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI ਪ੍ਰੋਜੈਕਟ ਲਈ ਡਿਸਪਲੇ ਨਾਮ |
| `aiProjectDescription` | string | ਪ੍ਰੋਜੈਕਟ ਵੇਰਵਾ | Azure AI Foundry ਵਿੱਚ ਦਿਖਾਈ ਜਾਣ ਵਾਲਾ ਵੇਰਵਾ |
| `gptModelCapacity` | int | `120` | GPT ਮਾਡਲ ਲਈ ਟੋਕਨ ਸਮਰੱਥਾ |
| `embeddingModelCapacity` | int | `50` | ਐਮਬੈਡਿੰਗ ਮਾਡਲ ਲਈ ਟੋਕਨ ਸਮਰੱਥਾ |
| `tags` | object | ਡਿਫਾਲਟ ਟੈਗ | ਗਵਰਨੈਂਸ ਲਈ ਰਿਸੋਰਸ ਟੈਗ |

## 📤 ਟੈਂਪਲੇਟ ਆਉਟਪੁੱਟ

ਟੈਂਪਲੇਟ ਹੇਠ ਲਿਖੀਆਂ ਆਉਟਪੁੱਟ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

| ਆਉਟਪੁੱਟ | ਵੇਰਵਾ |
|--------|-------------|
| `subscriptionId` | Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ ID |
| `resourceGroupName` | ਬਣਾਈ ਗਈ ਰਿਸੋਰਸ ਗਰੁੱਪ ਦਾ ਨਾਮ |
| `aiFoundryName` | Azure AI Foundry ਸੇਵਾ ਦਾ ਨਾਮ |
| `foundryEndpoint` | AI ਸੇਵਾ ਐਂਡਪੌਇੰਟ URL |
| `foundryAccountKey` | AI ਸੇਵਾ ਐਕਸੈਸ ਕੁੰਜੀ |
| `deployedModels` | ਡਿਪਲੌਇ ਕੀਤੇ OpenAI ਮਾਡਲਾਂ ਦੀ ਐਰੇ |
| `applicationInsightsConnectionString` | Application Insights ਕਨੈਕਸ਼ਨ ਸਟ੍ਰਿੰਗ |
| `logAnalyticsWorkspaceName` | Log Analytics ਵਰਕਸਪੇਸ ਦਾ ਨਾਮ |

## 🔍 ਵੈਰੀਫਿਕੇਸ਼ਨ ਕਮਾਂਡ

ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ, ਰਿਸੋਰਸਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:

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

## 🆚 ARM ਵਿਰੁੱਧ Bicep

ਇਸ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ARM ਅਤੇ Bicep ਟੈਂਪਲੇਟ ਦੋਵੇਂ ਪ੍ਰਦਾਨ ਕੀਤੇ ਗਏ ਹਨ:

### ARM ਟੈਂਪਲੇਟ (`azuredeploy.json`)
- ✅ ਮੂਲ Azure Resource Manager ਫਾਰਮੈਟ
- ✅ ਜਿੱਥੇ ਵੀ ARM ਸਹਾਇਕ ਹੈ, ਉੱਥੇ ਕੰਮ ਕਰਦਾ ਹੈ
- ✅ ਕੋਈ ਵਾਧੂ ਟੂਲਿੰਗ ਦੀ ਲੋੜ ਨਹੀਂ
- ❌ ਵਧੇਰੇ ਵਿਸਤ੍ਰਿਤ JSON ਸਿੰਟੈਕਸ
- ❌ ਪੜ੍ਹਨ ਅਤੇ ਸੰਭਾਲਣ ਵਿੱਚ ਮੁਸ਼ਕਲ

### Bicep ਟੈਂਪਲੇਟ (`main.bicep`)
- ✅ ਆਧੁਨਿਕ, ਸਾਫ ਸਿੰਟੈਕਸ
- ✅ ਬਿਹਤਰ ਟੂਲਿੰਗ ਅਤੇ IntelliSense
- ✅ ਪੜ੍ਹਨ ਅਤੇ ਸੰਭਾਲਣ ਵਿੱਚ ਆਸਾਨ
- ✅ ਕੰਪਾਇਲ-ਟਾਈਮ ਵੈਰੀਫਿਕੇਸ਼ਨ
- ❌ Bicep CLI ਦੀ ਲੋੜ ਹੈ
- ❌ ਵਾਧੂ ਬਿਲਡ ਸਟੈਪ

**ਸਿਫਾਰਸ਼**: ਵਿਕਾਸ ਲਈ Bicep ਟੈਂਪਲੇਟ (`main.bicep`) ਦੀ ਵਰਤੋਂ ਕਰੋ ਅਤੇ ਸ਼ੁੱਧ ARM JSON ਦੀ ਲੋੜ ਵਾਲੇ ਸਥਿਤੀਆਂ ਲਈ ARM ਟੈਂਪਲੇਟ (`azuredeploy.json`) ਦੀ ਵਰਤੋਂ ਕਰੋ।

## 🔧 ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ

### ਕਸਟਮ ਰਿਸੋਰਸ ਸ਼ਾਮਲ ਕਰਨਾ

ARM ਟੈਂਪਲੇਟ ਵਿੱਚ ਵਾਧੂ ਰਿਸੋਰਸ ਸ਼ਾਮਲ ਕਰਨ ਲਈ:

1. Nested ਟੈਂਪਲੇਟ ਦੇ `resources` ਐਰੇ ਵਿੱਚ ਰਿਸੋਰਸ ਡਿਫਿਨੀਸ਼ਨ ਸ਼ਾਮਲ ਕਰੋ
2. `parameters` ਸੈਕਸ਼ਨ ਵਿੱਚ ਕੋਈ ਨਵੇਂ ਪੈਰਾਮੀਟਰ ਸ਼ਾਮਲ ਕਰੋ
3. ਜੇ ਲੋੜ ਹੋਵੇ ਤਾਂ ਸੰਬੰਧਿਤ ਆਉਟਪੁੱਟ ਸ਼ਾਮਲ ਕਰੋ
4. ਡਿਫਾਲਟ ਮੁੱਲਾਂ ਨਾਲ ਪੈਰਾਮੀਟਰ ਫਾਈਲ ਅਪਡੇਟ ਕਰੋ

### ਉਦਾਹਰਨ: ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਸ਼ਾਮਲ ਕਰਨਾ

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

## 🐛 ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਸਮੱਸਿਆਵਾਂ

#### 1. ਟੈਂਪਲੇਟ ਵੈਰੀਡੇਸ਼ਨ ਐਰਰ
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. ਰਿਸੋਰਸ ਨਾਮ ਸੰਘਰਸ਼
- ਯਕੀਨੀ ਬਣਾਓ ਕਿ `uniqueSuffix` ਸੱਚਮੁੱਚ ਵਿਲੱਖਣ ਹੈ
- ਆਟੋਮੈਟਿਕ ਜਨਰੇਸ਼ਨ ਲਈ `uniqueString()` ਫੰਕਸ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਟਾਰਗਟ ਖੇਤਰ ਵਿੱਚ ਮੌਜੂਦਾ ਰਿਸੋਰਸਾਂ ਦੀ ਜਾਂਚ ਕਰੋ

#### 3. ਕੋਟਾ ਸੀਮਾਵਾਂ
- ਟਾਰਗਟ ਖੇਤਰ ਵਿੱਚ OpenAI ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
- AI ਸੇਵਾਵਾਂ ਲਈ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਕੋਟਾ ਦੀ ਜਾਂਚ ਕਰੋ
- ਜੇ ਸੀਮਾਵਾਂ ਪਹੁੰਚ ਗਈਆਂ ਹਨ ਤਾਂ ਵੱਖਰੇ ਖੇਤਰਾਂ ਦੀ ਵਰਤੋਂ ਕਰਨ ਬਾਰੇ ਸੋਚੋ

#### 4. ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ
- ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਖਾਤੇ ਨੂੰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ 'ਤੇ Contributor ਰੋਲ ਹੈ
- ਜਾਂਚ ਕਰੋ ਕਿ ਸਬਸਕ੍ਰਿਪਸ਼ਨ AI ਸੇਵਾਵਾਂ ਲਈ ਸਹਾਇਕ ਹੈ
- ਰਿਸੋਰਸ ਪ੍ਰੋਵਾਈਡਰ ਰਜਿਸਟ੍ਰੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

### ਡਿਬੱਗਿੰਗ ਕਮਾਂਡ

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

## 🔐 ਸੁਰੱਖਿਆ ਵਿਚਾਰ

### ਐਕਸੈਸ ਕੰਟਰੋਲ
- AI ਸੇਵਾ ਸੁਰੱਖਿਅਤ ਪਹੁੰਚ ਲਈ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ
- ਰਿਸੋਰਸ ਗਰੁੱਪ RBAC ਲਈ ਸੀਮਾ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ
- Application Insights ਵਿੱਚ ਵੱਖਰੇ ਐਕਸੈਸ ਕੰਟਰੋਲ ਹਨ

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ
- ਡਿਫਾਲਟ ਰੂਪ ਵਿੱਚ ਪਬਲਿਕ ਨੈਟਵਰਕ ਐਕਸੈਸ ਸਹਾਇਕ ਹੈ
- ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਬਾਰੇ ਸੋਚੋ
- ਵਾਧੂ ਸੁਰੱਖਿਆ ਲਈ ਨੈਟਵਰਕ ACLs ਕਨਫਿਗਰ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ

### ਕੁੰਜੀ ਪ੍ਰਬੰਧਨ
- AI ਸੇਵਾ ਕੁੰਜੀਆਂ ਆਟੋ-ਜਨਰੇਟ ਕੀਤੀਆਂ ਜਾਂਦੀਆਂ ਹਨ
- ਪ੍ਰੋਡਕਸ਼ਨ ਰਾਜ਼ਾਂ ਲਈ Azure Key Vault ਦੀ ਵਰਤੋਂ ਕਰੋ
- ਸੁਰੱਖਿਆ ਲਈ ਕੁੰਜੀਆਂ ਨੂੰ ਨਿਯਮਿਤ ਤੌਰ 'ਤੇ ਰੋਟੇਟ ਕਰੋ

## 📚 ਅਗਲੇ ਕਦਮ

ਸਫਲ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ:

1. **ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਕਨਫਿਗਰ ਕਰੋ**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਟੈਸਟ ਕਰੋ**:
   - ਪ੍ਰੋਜੈਕਟ ਨਾਲ VS Code ਖੋਲ੍ਹੋ
   - `.vscode/mcp.json` ਵਿੱਚ MCP ਸਰਵਰ ਕਨਫਿਗਰ ਕਰੋ
   - ਰਿਟੇਲ ਡੇਟਾ ਕੁਇਰੀਆਂ ਨਾਲ AI ਚੈਟ ਟੈਸਟ ਕਰੋ

4. **ਪਰਫਾਰਮੈਂਸ ਮਾਨਟਰ ਕਰੋ**:
   - Application Insights ਵਿੱਚ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
   - Log Analytics ਵਰਕਸਪੇਸ ਵਿੱਚ ਲੌਗ ਚੈੱਕ ਕਰੋ
   - ਮਹੱਤਵਪੂਰਨ ਘਟਨਾਵਾਂ ਲਈ ਅਲਰਟ ਸੈਟ ਕਰੋ

---

ਵਧੇਰੇ ਜਾਣਕਾਰੀ ਲਈ, [ਮੁੱਖ README](../README.md) ਜਾਂ [QUICKSTART ਗਾਈਡ](../QUICKSTART.md) ਵੇਖੋ।

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੱਜੇਪਣ ਹੋ ਸਕਦੇ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।