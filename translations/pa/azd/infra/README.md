<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:24:50+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "pa"
}
-->
# ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਟੈਂਪਲੇਟਸ

ਇਹ ਫੋਲਡਰ MCP ਰਿਟੇਲ ਐਨਾਲਿਟਿਕਸ ਪ੍ਰੋਜੈਕਟ ਲਈ ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਡਿਪਲੌਇਮੈਂਟ ਟੈਂਪਲੇਟਸ ਨੂੰ ਸ਼ਾਮਲ ਕਰਦਾ ਹੈ।

## 📁 ਫਾਈਲਾਂ ਦਾ ਜਾਇਜ਼ਾ

| ਫਾਈਲ | ਵੇਰਵਾ | ਵਰਤੋਂ ਦਾ ਕੇਸ |
|------|-------------|----------|
| `azuredeploy.json` | **ARM ਟੈਂਪਲੇਟ** - ਪੂਰੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਸਕੋਪਡ ਡਿਪਲੌਇਮੈਂਟ | ਸਾਰੇ ਡਿਪਲੌਇਮੈਂਟ ਲਈ ਸਿਫਾਰਸ਼ੀ |
| `azuredeploy.parameters.json` | **ARM ਪੈਰਾਮੀਟਰਸ** - ਸਥਿਰ ਕਨਫਿਗਰੇਸ਼ਨ ਮੁੱਲ | `azuredeploy.json` ਨਾਲ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ |
| `ARM-DEPLOYMENT.md` | **ARM ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ** - ਵਿਸਥਾਰਤ ਹਦਾਇਤਾਂ | ਪੂਰੀ ਡਿਪਲੌਇਮੈਂਟ ਦਸਤਾਵੇਜ਼ |
| `README.md` | **ਇਹ ਫਾਈਲ** - ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਦਾ ਜਾਇਜ਼ਾ | ਤੇਜ਼ ਰਿਫਰੈਂਸ |

## 🚀 ਡਿਪਲੌਇਮੈਂਟ ਵਿਕਲਪ

### ਵਿਕਲਪ 1: Azure CLI (ਸਿਫਾਰਸ਼ੀ)
ਰਿਸੋਰਸ ਗਰੁੱਪ ਬਣਾਉਣ ਨਾਲ ਪੂਰੀ ਡਿਪਲੌਇਮੈਂਟ:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### ਵਿਕਲਪ 2: ਪਾਵਰਸ਼ੈਲ
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### ਵਿਕਲਪ 3: Azure ਪੋਰਟਲ
1. [Azure ਪੋਰਟਲ](https://portal.azure.com) 'ਤੇ ਜਾਓ
2. "Deploy a custom template" ਦੀ ਖੋਜ ਕਰੋ
3. `azuredeploy.json` ਅੱਪਲੋਡ ਕਰੋ
4. ਪੈਰਾਮੀਟਰਸ ਕਨਫਿਗਰ ਕਰੋ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਕਰੋ

## 🏗️ ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਕੰਪੋਨੈਂਟਸ

ARM ਟੈਂਪਲੇਟ ਹੇਠਾਂ ਦਿੱਤੇ ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਨੂੰ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ:

- **ਰਿਸੋਰਸ ਗਰੁੱਪ**: ਸਾਰੇ ਰਿਸੋਰਸਾਂ ਲਈ ਇੱਕ ਸਥਿਰ ਨਾਮਕਰਨ ਵਾਲਾ ਕੰਟੇਨਰ
- **ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਵਰਕਸਪੇਸ**: ਕੇਂਦਰੀ ਲੌਗਿੰਗ ਅਤੇ ਮਾਨੀਟਰਿੰਗ (30-ਦਿਨ ਰਿਟੈਂਸ਼ਨ)
- **ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ**: ਐਪਲੀਕੇਸ਼ਨ ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ ਜੋ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਨਾਲ ਇੰਟੀਗ੍ਰੇਟ ਹੈ
- **Azure AI ਸੇਵਾਵਾਂ**: ਮਲਟੀ-ਸੇਵਾ AI ਹੱਬ (S0 ਟੀਅਰ) ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਨਾਲ
- **OpenAI ਮਾਡਲ**:
  - `gpt-4o-mini` (120 ਸਮਰੱਥਾ) - ਚੈਟ ਅਤੇ ਕੰਪਲੀਸ਼ਨ ਮਾਡਲ
  - `text-embedding-3-small` (50 ਸਮਰੱਥਾ) - ਸੈਮੈਂਟਿਕ ਖੋਜ ਲਈ ਟੈਕਸਟ ਐਮਬੈਡਿੰਗ

## 🔧 ਟੈਂਪਲੇਟ ਕਨਫਿਗਰੇਸ਼ਨ

### ਪੈਰਾਮੀਟਰਸ
ARM ਟੈਂਪਲੇਟ ਹੇਠਾਂ ਦਿੱਤੇ ਕਸਟਮਾਈਜ਼ੇਬਲ ਪੈਰਾਮੀਟਰਸ ਨੂੰ ਸਵੀਕਾਰ ਕਰਦਾ ਹੈ:

| ਪੈਰਾਮੀਟਰ | ਡਿਫਾਲਟ | ਵੇਰਵਾ |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | ਸਾਰੇ ਰਿਸੋਰਸ ਨਾਮਾਂ ਲਈ ਪ੍ਰੀਫਿਕਸ |
| `location` | `westus2` | ਡਿਪਲੌਇਮੈਂਟ ਲਈ Azure ਖੇਤਰ |
| `uniqueSuffix` | ਆਟੋ-ਜਨਰੇਟ ਕੀਤਾ | 4-ਅੱਖਰਾਂ ਦਾ ਵਿਲੱਖਣ ਪਛਾਣਕਰਤਾ |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | ਡਿਸਪਲੇ ਨਾਮ |
| `gptModelCapacity` | `120` | GPT ਮਾਡਲ ਟੋਕਨ ਸਮਰੱਥਾ |
| `embeddingModelCapacity` | `50` | ਐਮਬੈਡਿੰਗ ਮਾਡਲ ਸਮਰੱਥਾ |

### ਰਿਸੋਰਸ ਨਾਮਕਰਨ ਕਨਵੈਨਸ਼ਨ
ਸਾਰੇ ਰਿਸੋਰਸ ਹੇਠਾਂ ਦਿੱਤੇ ਪੈਟਰਨ ਦੀ ਪਾਲਣਾ ਕਰਦੇ ਹਨ: `{type}-{resourcePrefix}-{uniqueSuffix}`

ਉਦਾਹਰਨਾਂ:
- ਰਿਸੋਰਸ ਗਰੁੱਪ: `rg-mcpretail-demo`
- AI ਸੇਵਾ: `fdy-mcpretail-demo`
- ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ: `appi-mcpretail-demo`

## 🔍 ਟੈਂਪਲੇਟ ਵੈਲਿਡੇਸ਼ਨ

### ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਵੈਲਿਡੇਟ ਕਰੋ
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
```bash
az deployment sub list --output table
```

## 💰 ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ

ਡਿਵੈਲਪਮੈਂਟ ਵਰਕਲੋਡ ਲਈ ਅੰਦਾਜ਼ੇਤ ਮਾਸਿਕ ਲਾਗਤ:

| ਸੇਵਾ | ਕਨਫਿਗਰੇਸ਼ਨ | ਅੰਦਾਜ਼ਾ ਲਾਗਤ/ਮਹੀਨਾ |
|---------|---------------|-----------------|
| Azure AI ਸੇਵਾਵਾਂ | S0 ਟੀਅਰ | $15-50 |
| OpenAI GPT-4o-mini | 120K ਟੋਕਨ | $15-30 |
| OpenAI ਐਮਬੈਡਿੰਗ | 50K ਟੋਕਨ | $5-15 |
| ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ | ਬੇਸਿਕ ਮਾਨੀਟਰਿੰਗ | $5-15 |
| ਲੌਗ ਐਨਾਲਿਟਿਕਸ | 1GB/ਮਹੀਨਾ | $2-5 |
| **ਕੁੱਲ** | | **$42-115** |

## 📚 ਵਾਧੂ ਸਰੋਤ

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - ਵਿਸਥਾਰਤ ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ ਅਤੇ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ
- [ARM ਟੈਂਪਲੇਟ ਦਸਤਾਵੇਜ਼](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI ਸੇਵਾਵਾਂ ਦਸਤਾਵੇਜ਼](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - ਫਾਈਲ ਵੈਲਿਡੇਸ਼ਨ ਨਤੀਜੇ

## 🆘 ਤੇਜ਼ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਆਮ ਸਮੱਸਿਆਵਾਂ
- **ਪ੍ਰਮਾਣਿਕਤਾ**: `az login` ਚਲਾਓ ਤਾਕਿ ਪ੍ਰਮਾਣਿਕ ਹੋ ਸਕੋ
- **ਕੋਟਾ ਸੀਮਾਵਾਂ**: ਟਾਰਗਟ ਖੇਤਰ ਵਿੱਚ OpenAI ਮਾਡਲ ਦੀ ਉਪਲਬਧਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
- **ਨਾਮਕਰਨ ਟਕਰਾਅ**: ਵੱਖਰੇ `uniqueSuffix` ਪੈਰਾਮੀਟਰ ਦੀ ਵਰਤੋਂ ਕਰੋ
- **ਅਧਿਕਾਰ**: ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਖਾਤੇ ਨੂੰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ 'ਤੇ Contributor ਰੋਲ ਹੈ

### ਮਦਦ ਪ੍ਰਾਪਤ ਕਰੋ
- ਵਿਸਥਾਰਤ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਲਈ [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) ਵੇਖੋ
- Azure ਪੋਰਟਲ ਵਿੱਚ ਡਿਪਲੌਇਮੈਂਟ ਲੌਗ ਦੀ ਜਾਂਚ ਕਰੋ
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) 'ਤੇ ਜਾਓ

---

ਪੂਰੇ ਪ੍ਰੋਜੈਕਟ ਸੈਟਅਪ ਲਈ, [ਮੁੱਖ README](../../README.md) ਜਾਂ [ਪ੍ਰੋਜੈਕਟ ਵਾਕਥਰੂ](../../walkthrough/README.md) ਵੇਖੋ।

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਣੀਕਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।