<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:30:44+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "tl"
}
-->
# Mga Template ng Imprastruktura

Ang folder na ito ay naglalaman ng mga template para sa deployment ng imprastruktura ng proyekto ng MCP Retail Analytics.

## 📁 Pangkalahatang-ideya ng mga File

| File | Deskripsyon | Gamit |
|------|-------------|-------|
| `azuredeploy.json` | **ARM template** - Deployment sa buong subscription | Inirerekomenda para sa lahat ng deployment |
| `azuredeploy.parameters.json` | **ARM parameters** - Mga static na halaga ng configuration | Ginagamit kasama ng `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Gabay sa ARM deployment** - Detalyadong mga tagubilin | Kumpletong dokumentasyon ng deployment |
| `README.md` | **Ang file na ito** - Pangkalahatang-ideya ng imprastruktura | Mabilisang sanggunian |

## 🚀 Mga Opsyon sa Deployment

### Opsyon 1: Azure CLI (Inirerekomenda)
Kumpletong deployment na may paglikha ng resource group:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opsyon 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opsyon 3: Azure Portal
1. Pumunta sa [Azure Portal](https://portal.azure.com)
2. Hanapin ang "Deploy a custom template"
3. I-upload ang `azuredeploy.json`
4. I-configure ang mga parameter at i-deploy

## 🏗️ Mga Komponent ng Imprastruktura

Ang ARM template ay nagde-deploy ng mga sumusunod na imprastruktura:

- **Resource Group**: Lalagyan para sa lahat ng resources na may pare-parehong pangalan
- **Log Analytics Workspace**: Sentralisadong pag-log at pag-monitor (30-araw na retention)
- **Application Insights**: Pag-monitor ng performance ng application na naka-integrate sa Log Analytics
- **Azure AI Services**: Multi-service AI hub (S0 tier) na may managed identity
- **OpenAI Models**:
  - `gpt-4o-mini` (120 capacity) - Model para sa chat at completion
  - `text-embedding-3-small` (50 capacity) - Text embeddings para sa semantic search

## 🔧 Konpigurasyon ng Template

### Mga Parameter
Ang ARM template ay tumatanggap ng mga sumusunod na parameter na maaaring i-customize:

| Parameter | Default | Deskripsyon |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Prefix para sa lahat ng pangalan ng resources |
| `location` | `westus2` | Azure region para sa deployment |
| `uniqueSuffix` | Auto-generated | 4-character na natatanging identifier |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Pangalan para sa display |
| `gptModelCapacity` | `120` | Token capacity ng GPT model |
| `embeddingModelCapacity` | `50` | Token capacity ng embedding model |

### Convention sa Pangalan ng Resource
Ang lahat ng resources ay sumusunod sa pattern: `{type}-{resourcePrefix}-{uniqueSuffix}`

Mga Halimbawa:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Pag-validate ng Template

### I-validate Bago ang Deployment
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Suriin ang Status ng Deployment
```bash
az deployment sub list --output table
```

## 💰 Pagtatantiya ng Gastos

Tinatayang buwanang gastos para sa development workload:

| Serbisyo | Konpigurasyon | Tinatayang Gastos/Buwan |
|----------|---------------|-------------------------|
| Azure AI Services | S0 tier | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Basic monitoring | $5-15 |
| Log Analytics | 1GB/buwan | $2-5 |
| **Kabuuan** | | **$42-115** |

## 📚 Karagdagang Mga Mapagkukunan

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detalyadong gabay sa deployment na may troubleshooting
- [Dokumentasyon ng ARM Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentasyon ng Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Mga resulta ng pag-validate ng file

## 🆘 Mabilisang Pag-troubleshoot

### Karaniwang Mga Isyu
- **Authentication**: Patakbuhin ang `az login` para mag-authenticate
- **Quota Limits**: Suriin ang availability ng OpenAI model sa target na region
- **Naming Conflicts**: Gumamit ng ibang `uniqueSuffix` parameter
- **Permissions**: Siguraduhing may Contributor role ang account sa subscription

### Humingi ng Tulong
- Tingnan ang [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) para sa detalyadong troubleshooting
- Suriin ang mga log ng deployment sa Azure Portal
- Bisitahin ang [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Para sa kumpletong setup ng proyekto, tingnan ang [pangunahing README](../../README.md) o [walkthrough ng proyekto](../../walkthrough/README.md).

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.