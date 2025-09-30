<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:33:24+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "hr"
}
-->
# Predlošci infrastrukture

Ova mapa sadrži predloške za implementaciju infrastrukture za MCP Retail Analytics projekt.

## 📁 Pregled datoteka

| Datoteka | Opis | Primjena |
|----------|-------|----------|
| `azuredeploy.json` | **ARM predložak** - Implementacija na razini pretplate | Preporučeno za sve implementacije |
| `azuredeploy.parameters.json` | **ARM parametri** - Statičke konfiguracijske vrijednosti | Koristi se s `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Vodič za ARM implementaciju** - Detaljne upute | Kompletna dokumentacija za implementaciju |
| `README.md` | **Ova datoteka** - Pregled infrastrukture | Brza referenca |

## 🚀 Opcije implementacije

### Opcija 1: Azure CLI (Preporučeno)
Kompletna implementacija s kreiranjem grupe resursa:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opcija 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opcija 3: Azure Portal
1. Otvorite [Azure Portal](https://portal.azure.com)
2. Pretražite "Deploy a custom template"
3. Učitajte `azuredeploy.json`
4. Konfigurirajte parametre i implementirajte

## 🏗️ Komponente infrastrukture

ARM predložak implementira sljedeću infrastrukturu:

- **Grupa resursa**: Kontejner za sve resurse s konzistentnim imenovanjem
- **Log Analytics Workspace**: Centralizirano praćenje i zapisivanje (zadržavanje 30 dana)
- **Application Insights**: Praćenje performansi aplikacija integrirano s Log Analytics
- **Azure AI Services**: Višeservisni AI centar (S0 razina) s upravljanim identitetom
- **OpenAI modeli**:
  - `gpt-4o-mini` (kapacitet 120) - Model za razgovore i dovršavanje teksta
  - `text-embedding-3-small` (kapacitet 50) - Tekstualna ugradnja za semantičko pretraživanje

## 🔧 Konfiguracija predloška

### Parametri
ARM predložak prihvaća sljedeće prilagodljive parametre:

| Parametar | Zadano | Opis |
|-----------|--------|------|
| `resourcePrefix` | `mcpretail` | Prefiks za sva imena resursa |
| `location` | `westus2` | Azure regija za implementaciju |
| `uniqueSuffix` | Automatski generirano | Jedinstveni identifikator od 4 znaka |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Prikazno ime |
| `gptModelCapacity` | `120` | Kapacitet GPT modela u tokenima |
| `embeddingModelCapacity` | `50` | Kapacitet modela za ugradnju teksta |

### Konvencija imenovanja resursa
Svi resursi slijede obrazac: `{type}-{resourcePrefix}-{uniqueSuffix}`

Primjeri:
- Grupa resursa: `rg-mcpretail-demo`
- AI usluga: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validacija predloška

### Validacija prije implementacije
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Provjera statusa implementacije
```bash
az deployment sub list --output table
```

## 💰 Procjena troškova

Procijenjeni mjesečni troškovi za razvojno opterećenje:

| Usluga | Konfiguracija | Procj. trošak/mjesečno |
|--------|---------------|-----------------------|
| Azure AI Services | S0 razina | $15-50 |
| OpenAI GPT-4o-mini | 120K tokena | $15-30 |
| OpenAI Embeddings | 50K tokena | $5-15 |
| Application Insights | Osnovno praćenje | $5-15 |
| Log Analytics | 1GB/mjesečno | $2-5 |
| **Ukupno** | | **$42-115** |

## 📚 Dodatni resursi

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detaljan vodič za implementaciju s rješavanjem problema
- [Dokumentacija za ARM predloške](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentacija za Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Rezultati validacije datoteka

## 🆘 Brzo rješavanje problema

### Uobičajeni problemi
- **Autentifikacija**: Pokrenite `az login` za autentifikaciju
- **Ograničenja kvota**: Provjerite dostupnost OpenAI modela u ciljanoj regiji
- **Sukobi u imenovanju**: Koristite drugačiji parametar `uniqueSuffix`
- **Dozvole**: Provjerite ima li račun ulogu Contributor na pretplati

### Potražite pomoć
- Pogledajte [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) za detaljno rješavanje problema
- Provjerite zapisnike implementacije u Azure Portalu
- Posjetite [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Za kompletno postavljanje projekta, pogledajte [glavni README](../../README.md) ili [vodič kroz projekt](../../walkthrough/README.md).

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.