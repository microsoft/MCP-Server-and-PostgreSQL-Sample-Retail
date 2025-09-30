<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:33:45+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "sl"
}
-->
# Predloge za infrastrukturo

Ta mapa vsebuje predloge za uvajanje infrastrukture za projekt MCP Retail Analytics.

## 📁 Pregled datotek

| Datoteka | Opis | Primer uporabe |
|----------|------|----------------|
| `azuredeploy.json` | **ARM predloga** - Uvajanje na ravni naročnine | Priporočeno za vsa uvajanja |
| `azuredeploy.parameters.json` | **ARM parametri** - Statične konfiguracijske vrednosti | Uporablja se z `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Vodnik za uvajanje ARM** - Podrobna navodila | Celotna dokumentacija za uvajanje |
| `README.md` | **Ta datoteka** - Pregled infrastrukture | Hitri referenčni vodnik |

## 🚀 Možnosti uvajanja

### Možnost 1: Azure CLI (priporočeno)
Celotno uvajanje z ustvarjanjem skupine virov:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Možnost 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Možnost 3: Azure Portal
1. Pojdite na [Azure Portal](https://portal.azure.com)
2. Poiščite "Deploy a custom template"
3. Naložite `azuredeploy.json`
4. Konfigurirajte parametre in uvedite

## 🏗️ Komponente infrastrukture

ARM predloga uvaja naslednjo infrastrukturo:

- **Skupina virov**: Posoda za vse vire z doslednim poimenovanjem
- **Delovni prostor Log Analytics**: Centralizirano beleženje in spremljanje (30-dnevno hranjenje)
- **Application Insights**: Spremljanje zmogljivosti aplikacij, integrirano z Log Analytics
- **Azure AI Services**: Večnamensko središče za umetno inteligenco (S0 nivo) z upravljano identiteto
- **OpenAI modeli**:
  - `gpt-4o-mini` (zmogljivost 120) - Model za klepet in dopolnjevanje
  - `text-embedding-3-small` (zmogljivost 50) - Vdelave besedila za semantično iskanje

## 🔧 Konfiguracija predloge

### Parametri
ARM predloga sprejema naslednje prilagodljive parametre:

| Parameter | Privzeto | Opis |
|-----------|----------|------|
| `resourcePrefix` | `mcpretail` | Predpona za vsa imena virov |
| `location` | `westus2` | Azure regija za uvajanje |
| `uniqueSuffix` | Samodejno ustvarjeno | 4-znakovni edinstveni identifikator |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Prikazno ime |
| `gptModelCapacity` | `120` | Zmogljivost GPT modela (število tokenov) |
| `embeddingModelCapacity` | `50` | Zmogljivost modela za vdelave |

### Konvencija poimenovanja virov
Vsi viri sledijo vzorcu: `{type}-{resourcePrefix}-{uniqueSuffix}`

Primeri:
- Skupina virov: `rg-mcpretail-demo`
- AI storitev: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Preverjanje predloge

### Preverjanje pred uvajanjem
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Preverjanje stanja uvajanja
```bash
az deployment sub list --output table
```

## 💰 Ocena stroškov

Ocenjeni mesečni stroški za razvojno obremenitev:

| Storitev | Konfiguracija | Ocenjeni strošek/mesec |
|----------|---------------|------------------------|
| Azure AI Services | S0 nivo | $15-50 |
| OpenAI GPT-4o-mini | 120K tokenov | $15-30 |
| OpenAI Embeddings | 50K tokenov | $5-15 |
| Application Insights | Osnovno spremljanje | $5-15 |
| Log Analytics | 1GB/mesec | $2-5 |
| **Skupaj** | | **$42-115** |

## 📚 Dodatni viri

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Podroben vodnik za uvajanje s postopki za odpravljanje težav
- [Dokumentacija ARM predlog](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentacija Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Rezultati preverjanja datotek

## 🆘 Hitro odpravljanje težav

### Pogoste težave
- **Avtentikacija**: Zaženite `az login` za avtentikacijo
- **Omejitve kvot**: Preverite razpoložljivost OpenAI modelov v ciljni regiji
- **Konflikti pri poimenovanju**: Uporabite drugačen parameter `uniqueSuffix`
- **Dovoljenja**: Prepričajte se, da ima račun vlogo Contributor na naročnini

### Poiščite pomoč
- Oglejte si [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) za podrobno odpravljanje težav
- Preverite dnevnike uvajanja v Azure Portalu
- Obiščite [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Za celotno nastavitev projekta si oglejte [glavni README](../../README.md) ali [vodnik po projektu](../../walkthrough/README.md).

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.