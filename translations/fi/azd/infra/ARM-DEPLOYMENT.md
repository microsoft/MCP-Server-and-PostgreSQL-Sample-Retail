<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:12:15+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "fi"
}
-->
# ARM-mallin käyttöönotto-ohjeet

Tässä dokumentissa annetaan ohjeet MCP Retail Analytics -infrastruktuurin käyttöönottoon ARM-mallin avulla.

## 📋 Yleiskatsaus

`azuredeploy.json` ARM-malli mahdollistaa seuraavien resurssien täydellisen käyttöönoton:
- Azure Resource Group
- Log Analytics -työtila  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI-mallien käyttöönotto (GPT-4o-mini, text-embedding-3-small)

## 🚀 Käyttöönoton vaihtoehdot

### Vaihtoehto 1: Azure CLI -käyttöönotto

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

### Vaihtoehto 2: PowerShell-käyttöönotto

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

### Vaihtoehto 3: Azure-portaali

1. Siirry [Azure-portaaliin](https://portal.azure.com)
2. Etsi "Deploy a custom template"
3. Klikkaa "Build your own template in the editor"
4. Kopioi ja liitä `azuredeploy.json`-tiedoston sisältö
5. Klikkaa "Save" ja sitten "Review + create"
6. Täytä tarvittavat parametrit ja ota käyttöön

## 🔧 Mallin parametrit

| Parametri | Tyyppi | Oletus | Kuvaus |
|-----------|--------|--------|---------|
| `resourcePrefix` | merkkijono | `mcpretail` | Resurssien nimien etuliite |
| `location` | merkkijono | `westus2` | Azure-alue käyttöönotolle |
| `uniqueSuffix` | merkkijono | Automaattisesti luotu | 4-merkkinen yksilöllinen tunniste |
| `aiProjectFriendlyName` | merkkijono | `MCP Retail Analytics Project` | AI-projektin näyttönimi |
| `aiProjectDescription` | merkkijono | Projektin kuvaus | Kuvaus, joka näkyy Azure AI Foundryssa |
| `gptModelCapacity` | kokonaisluku | `120` | GPT-mallin token-kapasiteetti |
| `embeddingModelCapacity` | kokonaisluku | `50` | Upotusmallin token-kapasiteetti |
| `tags` | objekti | Oletustagit | Resurssitagit hallintaa varten |

## 📤 Mallin tulosteet

Malli tuottaa seuraavat tulosteet:

| Tuloste | Kuvaus |
|---------|---------|
| `subscriptionId` | Azure-tilauksen tunnus |
| `resourceGroupName` | Luodun resurssiryhmän nimi |
| `aiFoundryName` | Azure AI Foundry -palvelun nimi |
| `foundryEndpoint` | AI-palvelun päätepisteen URL |
| `foundryAccountKey` | AI-palvelun käyttöavain |
| `deployedModels` | Lista käyttöönotetuista OpenAI-malleista |
| `applicationInsightsConnectionString` | Application Insights -yhteysmerkkijono |
| `logAnalyticsWorkspaceName` | Log Analytics -työtilan nimi |

## 🔍 Varmistuskomennot

Käyttöönoton jälkeen varmista resurssit:

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

Tämä projekti tarjoaa sekä ARM- että Bicep-mallit:

### ARM-malli (`azuredeploy.json`)
- ✅ Alkuperäinen Azure Resource Manager -formaatti
- ✅ Toimii kaikkialla, missä ARM on tuettu
- ✅ Ei vaadi lisätyökaluja
- ❌ Verbaalisempi JSON-syntaksi
- ❌ Vaikeampi lukea ja ylläpitää

### Bicep-malli (`main.bicep`)
- ✅ Moderni, selkeä syntaksi
- ✅ Paremmat työkalut ja IntelliSense-tuki
- ✅ Helpompi lukea ja ylläpitää
- ✅ Käännösaikainen validointi
- ❌ Vaatii Bicep CLI:n
- ❌ Lisärakennusvaihe

**Suositus**: Käytä Bicep-malleja (`main.bicep`) kehitykseen ja ARM-mallia (`azuredeploy.json`) tilanteissa, joissa tarvitaan puhdasta ARM JSON:ia.

## 🔧 Mukauttaminen

### Mukautettujen resurssien lisääminen

Lisätäksesi uusia resursseja ARM-malliin:

1. Lisää resurssin määritelmä sisäkkäisen mallin `resources`-taulukkoon
2. Lisää uudet parametrit `parameters`-osioon
3. Lisää tarvittaessa vastaavat tulosteet
4. Päivitä parametrien tiedosto oletusarvoilla

### Esimerkki: Tallennustilin lisääminen

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

## 🐛 Vianmääritys

### Yleiset ongelmat

#### 1. Mallin validointivirheet
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Resurssinimien ristiriidat
- Varmista, että `uniqueSuffix` on todella yksilöllinen
- Käytä `uniqueString()`-funktiota automaattiseen luontiin
- Tarkista olemassa olevat resurssit kohdealueella

#### 3. Kiintiörajoitukset
- Varmista OpenAI-mallien saatavuus kohdealueella
- Tarkista tilauksen kiintiöt AI-palveluille
- Harkitse eri alueiden käyttöä, jos rajoitukset ylittyvät

#### 4. Käyttöoikeusongelmat
- Varmista, että tilillä on Contributor-rooli tilauksessa
- Tarkista, että tilaus on aktivoitu AI-palveluille
- Varmista resurssipalveluntarjoajien rekisteröinnit

### Vianmäärityskomennot

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

## 🔐 Tietoturvanäkökohdat

### Käyttöoikeuksien hallinta
- AI-palvelu käyttää hallittua identiteettiä turvalliseen käyttöön
- Resurssiryhmä tarjoaa rajan RBAC:lle
- Application Insightsilla on erilliset käyttöoikeudet

### Verkkoturvallisuus
- Julkinen verkkoyhteys on oletuksena käytössä
- Harkitse yksityisiä päätepisteitä tuotantoon
- Verkon ACL:t voidaan määrittää lisäturvallisuutta varten

### Avainten hallinta
- AI-palvelun avaimet luodaan automaattisesti
- Käytä Azure Key Vaultia tuotantosalaisuuksille
- Kierrätä avaimet säännöllisesti turvallisuuden takaamiseksi

## 📚 Seuraavat vaiheet

Onnistuneen käyttöönoton jälkeen:

1. **Määritä ympäristömuuttujat**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Käynnistä MCP-palvelin**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testaa integraatio**:
   - Avaa VS Code projektin kanssa
   - Määritä MCP-palvelimet tiedostossa `.vscode/mcp.json`
   - Testaa AI Chat vähittäiskaupan tietokyselyillä

4. **Seuraa suorituskykyä**:
   - Tarkastele mittareita Application Insightsissa
   - Tarkista lokit Log Analytics -työtilassa
   - Aseta hälytyksiä tärkeille tapahtumille

---

Lisätietoja löydät [pääasiallisesta README-tiedostosta](../README.md) tai [QUICKSTART-oppaasta](../QUICKSTART.md).

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.