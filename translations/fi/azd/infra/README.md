<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:28:39+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "fi"
}
-->
# Infrastruktuurimallit

Tämä kansio sisältää infrastruktuurin käyttöönoton mallit MCP Retail Analytics -projektille.

## 📁 Tiedostojen yleiskatsaus

| Tiedosto | Kuvaus | Käyttötapaus |
|----------|---------|--------------|
| `azuredeploy.json` | **ARM-malli** - Koko tilauksen laajuinen käyttöönotto | Suositeltu kaikkiin käyttöönottoihin |
| `azuredeploy.parameters.json` | **ARM-parametrit** - Staattiset konfiguraatioarvot | Käytetään yhdessä `azuredeploy.json` -tiedoston kanssa |
| `ARM-DEPLOYMENT.md` | **ARM-käyttöönotto-opas** - Yksityiskohtaiset ohjeet | Täydellinen käyttöönoton dokumentaatio |
| `README.md` | **Tämä tiedosto** - Infrastruktuurin yleiskatsaus | Pikaopas |

## 🚀 Käyttöönoton vaihtoehdot

### Vaihtoehto 1: Azure CLI (suositeltu)
Täydellinen käyttöönotto resurssiryhmän luonnilla:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Vaihtoehto 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Vaihtoehto 3: Azure-portaali
1. Siirry [Azure-portaaliin](https://portal.azure.com)
2. Etsi "Deploy a custom template"
3. Lataa `azuredeploy.json`
4. Määritä parametrit ja ota käyttöön

## 🏗️ Infrastruktuurikomponentit

ARM-malli ottaa käyttöön seuraavat infrastruktuurikomponentit:

- **Resurssiryhmä**: Kaikkien resurssien säiliö yhtenäisellä nimeämisellä
- **Log Analytics -työtila**: Keskitetty lokien ja valvonnan hallinta (30 päivän säilytys)
- **Application Insights**: Sovelluksen suorituskyvyn valvonta, integroitu Log Analyticsiin
- **Azure AI Services**: Monipalveluinen AI-keskus (S0-taso) hallitulla identiteetillä
- **OpenAI-mallit**:
  - `gpt-4o-mini` (120 kapasiteetti) - Keskustelu- ja täydennysmalli
  - `text-embedding-3-small` (50 kapasiteetti) - Tekstien upotukset semanttiseen hakuun

## 🔧 Mallin konfigurointi

### Parametrit
ARM-malli hyväksyy seuraavat mukautettavat parametrit:

| Parametri | Oletus | Kuvaus |
|-----------|--------|--------|
| `resourcePrefix` | `mcpretail` | Kaikkien resurssien nimien etuliite |
| `location` | `westus2` | Azure-alue käyttöönotolle |
| `uniqueSuffix` | Automaattisesti luotu | 4-merkkinen yksilöllinen tunniste |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Näyttönimi |
| `gptModelCapacity` | `120` | GPT-mallin token-kapasiteetti |
| `embeddingModelCapacity` | `50` | Upotusmallin kapasiteetti |

### Resurssien nimeämiskäytäntö
Kaikki resurssit noudattavat kaavaa: `{type}-{resourcePrefix}-{uniqueSuffix}`

Esimerkkejä:
- Resurssiryhmä: `rg-mcpretail-demo`
- AI-palvelu: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Mallin validointi

### Validointi ennen käyttöönottoa
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Käyttöönoton tilan tarkistus
```bash
az deployment sub list --output table
```

## 💰 Kustannusarvio

Arvioidut kuukausikustannukset kehitystyölle:

| Palvelu | Konfiguraatio | Arvioitu kustannus/kk |
|---------|---------------|-----------------------|
| Azure AI Services | S0-taso | $15-50 |
| OpenAI GPT-4o-mini | 120K tokenia | $15-30 |
| OpenAI Embeddings | 50K tokenia | $5-15 |
| Application Insights | Perusvalvonta | $5-15 |
| Log Analytics | 1GB/kk | $2-5 |
| **Yhteensä** | | **$42-115** |

## 📚 Lisäresurssit

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Yksityiskohtainen käyttöönotto-opas ja vianetsintä
- [ARM-mallien dokumentaatio](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services -dokumentaatio](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Tiedostojen validointitulokset

## 🆘 Pikaohje vianetsintään

### Yleiset ongelmat
- **Autentikointi**: Suorita `az login` kirjautuaksesi sisään
- **Kiintiörajoitukset**: Tarkista OpenAI-mallien saatavuus kohdealueella
- **Nimeämiskonfliktit**: Käytä eri `uniqueSuffix`-parametria
- **Oikeudet**: Varmista, että tilillä on Contributor-rooli tilauksessa

### Apua ongelmiin
- Katso [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) yksityiskohtaisia vianetsintäohjeita varten
- Tarkista käyttöönoton lokit Azure-portaalista
- Vieraile [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Täydellistä projektin asennusta varten katso [pääasiallinen README](../../README.md) tai [projektin läpikäynti](../../walkthrough/README.md).

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskääntämistä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.