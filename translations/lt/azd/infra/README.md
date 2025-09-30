<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:34:48+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "lt"
}
-->
# Infrastruktūros Šablonai

Šiame aplanke yra MCP Retail Analytics projekto infrastruktūros diegimo šablonai.

## 📁 Failų Apžvalga

| Failas | Aprašymas | Naudojimo Atvejis |
|--------|-----------|-------------------|
| `azuredeploy.json` | **ARM šablonas** - Pilnas prenumeratos lygio diegimas | Rekomenduojama visiems diegimams |
| `azuredeploy.parameters.json` | **ARM parametrai** - Statinės konfigūracijos reikšmės | Naudojamas su `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM diegimo vadovas** - Išsamios instrukcijos | Pilna diegimo dokumentacija |
| `README.md` | **Šis failas** - Infrastruktūros apžvalga | Greita nuoroda |

## 🚀 Diegimo Parinktys

### Parinktis 1: Azure CLI (Rekomenduojama)
Pilnas diegimas su išteklių grupės sukūrimu:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Parinktis 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Parinktis 3: Azure Portalas
1. Eikite į [Azure Portalą](https://portal.azure.com)
2. Ieškokite "Deploy a custom template"
3. Įkelkite `azuredeploy.json`
4. Suveskite parametrus ir pradėkite diegimą

## 🏗️ Infrastruktūros Komponentai

ARM šablonas diegia šiuos infrastruktūros komponentus:

- **Išteklių Grupė**: Visų išteklių konteineris su nuosekliais pavadinimais
- **Log Analytics Darbo Erdvė**: Centralizuotas žurnalų ir stebėjimo centras (30 dienų saugojimas)
- **Application Insights**: Programų našumo stebėjimas, integruotas su Log Analytics
- **Azure AI Paslaugos**: Daugiafunkcinis AI centras (S0 lygis) su valdomu identitetu
- **OpenAI Modeliai**:
  - `gpt-4o-mini` (120 talpa) - Pokalbių ir užbaigimo modelis
  - `text-embedding-3-small` (50 talpa) - Teksto įterpimai semantinei paieškai

## 🔧 Šablono Konfigūracija

### Parametrai
ARM šablonas priima šiuos pritaikomus parametrus:

| Parametras | Numatytasis | Aprašymas |
|------------|-------------|-----------|
| `resourcePrefix` | `mcpretail` | Visų išteklių pavadinimų priešdėlis |
| `location` | `westus2` | Azure regionas diegimui |
| `uniqueSuffix` | Automatiškai sugeneruotas | 4 simbolių unikalus identifikatorius |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Rodymo pavadinimas |
| `gptModelCapacity` | `120` | GPT modelio žetonų talpa |
| `embeddingModelCapacity` | `50` | Įterpimo modelio talpa |

### Išteklių Pavadinimų Konvencija
Visi ištekliai laikosi šablono: `{type}-{resourcePrefix}-{uniqueSuffix}`

Pavyzdžiai:
- Išteklių Grupė: `rg-mcpretail-demo`
- AI Paslauga: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Šablono Tikrinimas

### Patikrinkite Prieš Diegimą
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Patikrinkite Diegimo Būseną
```bash
az deployment sub list --output table
```

## 💰 Kainos Įvertinimas

Numatomos mėnesinės išlaidos kūrimo darbo krūviui:

| Paslauga | Konfigūracija | Num. Kaina/Mėn. |
|----------|---------------|-----------------|
| Azure AI Paslaugos | S0 lygis | $15-50 |
| OpenAI GPT-4o-mini | 120K žetonų | $15-30 |
| OpenAI Įterpimai | 50K žetonų | $5-15 |
| Application Insights | Pagrindinis stebėjimas | $5-15 |
| Log Analytics | 1GB/mėn. | $2-5 |
| **Iš Viso** | | **$42-115** |

## 📚 Papildomi Ištekliai

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Išsamus diegimo vadovas su trikčių šalinimu
- [ARM Šablonų Dokumentacija](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Paslaugų Dokumentacija](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Failų tikrinimo rezultatai

## 🆘 Greitas Trikčių Šalinimas

### Dažnos Problemų Priežastys
- **Autentifikacija**: Paleiskite `az login`, kad autentifikuotumėtės
- **Kvietų Limitai**: Patikrinkite OpenAI modelio prieinamumą tiksliniame regione
- **Pavadinimų Konfliktai**: Naudokite kitą `uniqueSuffix` parametrą
- **Leidimai**: Įsitikinkite, kad paskyra turi Contributor vaidmenį prenumeratoje

### Gaukite Pagalbą
- Žr. [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) dėl išsamaus trikčių šalinimo
- Patikrinkite diegimo žurnalus Azure Portale
- Apsilankykite [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Dėl pilno projekto nustatymo žr. [pagrindinį README](../../README.md) arba [projekto apžvalgą](../../walkthrough/README.md).

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.