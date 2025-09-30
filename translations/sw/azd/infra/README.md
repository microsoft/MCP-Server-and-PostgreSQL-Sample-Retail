<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:31:04+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "sw"
}
-->
# Violezo vya Miundombinu

Folda hii ina violezo vya kupeleka miundombinu kwa mradi wa MCP Retail Analytics.

## 📁 Muhtasari wa Faili

| Faili | Maelezo | Matumizi |
|-------|---------|----------|
| `azuredeploy.json` | **ARM template** - Upelekwaji kamili wa usajili | Inapendekezwa kwa upelekwaji wote |
| `azuredeploy.parameters.json` | **ARM parameters** - Thamani za usanidi wa kudumu | Inatumika na `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Mwongozo wa upelekwaji wa ARM** - Maelezo ya kina | Nyaraka kamili za upelekwaji |
| `README.md` | **Faili hii** - Muhtasari wa miundombinu | Marejeleo ya haraka |

## 🚀 Chaguo za Upelekwaji

### Chaguo 1: Azure CLI (Inapendekezwa)
Upelekwaji kamili na uundaji wa kikundi cha rasilimali:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Chaguo 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Chaguo 3: Azure Portal
1. Tembelea [Azure Portal](https://portal.azure.com)
2. Tafuta "Deploy a custom template"
3. Pakia `azuredeploy.json`
4. Sanidi vigezo na peleka

## 🏗️ Vipengele vya Miundombinu

ARM template inapeleka miundombinu ifuatayo:

- **Resource Group**: Kontena la rasilimali zote na majina yanayofanana
- **Log Analytics Workspace**: Kituo cha ufuatiliaji na ukaguzi (uhifadhi wa siku 30)
- **Application Insights**: Ufuatiliaji wa utendaji wa programu unaounganishwa na Log Analytics
- **Azure AI Services**: Kituo cha huduma nyingi za AI (daraja la S0) na utambulisho unaosimamiwa
- **OpenAI Models**:
  - `gpt-4o-mini` (uwezo wa 120) - Modeli ya mazungumzo na kukamilisha maandishi
  - `text-embedding-3-small` (uwezo wa 50) - Uwekaji maandishi kwa utafutaji wa kimaana

## 🔧 Usanidi wa Template

### Vigezo
ARM template inakubali vigezo vifuatavyo vinavyoweza kubadilishwa:

| Kigezo | Chaguo la Kawaida | Maelezo |
|--------|-------------------|---------|
| `resourcePrefix` | `mcpretail` | Kiambishi awali cha majina ya rasilimali |
| `location` | `westus2` | Eneo la Azure kwa upelekwaji |
| `uniqueSuffix` | Inazalishwa kiotomatiki | Kitambulisho cha kipekee cha herufi 4 |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Jina la kuonyesha |
| `gptModelCapacity` | `120` | Uwezo wa tokeni wa modeli ya GPT |
| `embeddingModelCapacity` | `50` | Uwezo wa tokeni wa modeli ya uwekaji maandishi |

### Mkataba wa Uwekaji Majina ya Rasilimali
Rasilimali zote zinafuata muundo: `{type}-{resourcePrefix}-{uniqueSuffix}`

Mifano:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Uthibitishaji wa Template

### Thibitisha Kabla ya Upelekwaji
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Angalia Hali ya Upelekwaji
```bash
az deployment sub list --output table
```


## 💰 Makadirio ya Gharama

Makadirio ya gharama za kila mwezi kwa mzigo wa kazi wa maendeleo:

| Huduma | Usanidi | Makadirio ya Gharama/Mwezi |
|--------|---------|---------------------------|
| Azure AI Services | Daraja la S0 | $15-50 |
| OpenAI GPT-4o-mini | Tokeni 120K | $15-30 |
| OpenAI Embeddings | Tokeni 50K | $5-15 |
| Application Insights | Ufuatiliaji wa msingi | $5-15 |
| Log Analytics | 1GB/mwezi | $2-5 |
| **Jumla** | | **$42-115** |

## 📚 Rasilimali za Ziada

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Mwongozo wa kina wa upelekwaji na utatuzi wa matatizo
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Matokeo ya uthibitishaji wa faili

## 🆘 Utatuzi wa Haraka

### Masuala ya Kawaida
- **Uthibitishaji**: Endesha `az login` ili kuthibitisha
- **Mipaka ya Quota**: Angalia upatikanaji wa modeli za OpenAI katika eneo lengwa
- **Migongano ya Majina**: Tumia kigezo tofauti cha `uniqueSuffix`
- **Ruhusa**: Hakikisha akaunti ina jukumu la Contributor kwenye usajili

### Pata Msaada
- Tazama [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) kwa utatuzi wa kina wa matatizo
- Angalia kumbukumbu za upelekwaji katika Azure Portal
- Tembelea [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Kwa usanidi kamili wa mradi, tazama [README kuu](../../README.md) au [mwongozo wa mradi](../../walkthrough/README.md).

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya kiasili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.