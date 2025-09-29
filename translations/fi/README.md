<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T21:45:53+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# MCP Server ja PostgreSQL Esimerkki - Vähittäismyynnin Analyysi

## Opi MCP ja tietokantaintegraatio käytännön esimerkkien avulla

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Liity Azure AI Foundry Discordiin](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Seuraa näitä ohjeita päästäksesi alkuun näiden resurssien käytössä:

1. **Haarauta Repository**: Klikkaa [tästä haarauttaaksesi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Kloonaa Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Liity Azure AI Foundry Discordiin**: [Tapaa asiantuntijoita ja muita kehittäjiä](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Monikielinen Tuki

#### Tuettu GitHub Actionin kautta (Automaattinen ja aina ajan tasalla)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](./README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Jos haluat lisätä uusia kieliä, tuetut kielet löytyvät [täältä](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Johdanto

Tämä esimerkki näyttää, kuinka rakentaa ja ottaa käyttöön kattava **Model Context Protocol (MCP) -palvelin**, joka tarjoaa tekoälyavustajille turvallisen ja älykkään pääsyn vähittäismyynnin dataan PostgreSQL:n kautta. Projekti esittelee yritystason ominaisuuksia, kuten **rivitasoinen turvallisuus (Row Level Security, RLS)**, **semanttinen haku** ja **Azure AI -integraatio** todellisiin vähittäismyynnin analytiikkaskenaarioihin.

**Keskeiset käyttötapaukset:**
- **Tekoälypohjainen myynnin analytiikka**: Mahdollistaa tekoälyavustajien kyselyt ja analyysit vähittäismyynnin datasta luonnollisella kielellä
- **Turvallinen monikäyttäjäpääsy**: Näyttää rivitasoisen turvallisuuden toteutuksen, jossa eri myymäläpäälliköt voivat käyttää vain oman myymälänsä dataa
- **Semanttinen tuotehaku**: Esittelee tekoälyllä parannettua tuotehakua tekstipohjaisten upotusten avulla
- **Yritysintegraatio**: Näyttää, kuinka MCP-palvelimet integroidaan Azure-palveluihin ja PostgreSQL-tietokantoihin

**Täydellinen seuraaville:**
- Kehittäjät, jotka haluavat oppia rakentamaan MCP-palvelimia tietokantaintegraatiolla
- Data-insinöörit, jotka toteuttavat turvallisia monikäyttäjäanalytiikkaratkaisuja
- Tekoälysovelluskehittäjät, jotka työskentelevät vähittäismyynnin tai verkkokaupan datan parissa
- Kaikki, jotka ovat kiinnostuneita yhdistämään tekoälyavustajat yritystietokantoihin

## Liity Azure AI Foundry Discord-yhteisöön
Jaa kokemuksesi MCP:stä ja tapaa asiantuntijoita sekä tuote-ryhmiä

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Myynnin Analytiikka MCP-palvelin

Model Context Protocol (MCP) -palvelin, joka tarjoaa kattavan asiakasmyyntitietokannan pääsyn Zava Retail DIY -liiketoiminnalle. Tämä palvelin mahdollistaa tekoälyavustajien kyselyt ja analyysit vähittäismyynnin datasta turvallisen, skeemaan perustuvan käyttöliittymän kautta.

## 📚 Täydellinen Toteutusopas

Katso yksityiskohtainen opas tämän ratkaisun rakentamisesta ja vastaavien MCP-palvelimien toteuttamisesta **[Esimerkin Läpi Käynti](Sample_Walkthrough.md)** -dokumentista. Tämä opas sisältää:

- **Arkkitehtuurin Syväluotaus**: Komponenttianalyysi ja suunnittelumallit
- **Vaiheittainen Rakentaminen**: Projektin aloituksesta käyttöönottoon
- **Koodin Erittely**: Yksityiskohtainen selitys MCP-palvelimen toteutuksesta
- **Edistyneet Ominaisuudet**: Rivitasoinen turvallisuus, semanttinen haku ja seuranta
- **Parhaat Käytännöt**: Turvallisuus, suorituskyky ja kehitysohjeet
- **Vianetsintä**: Yleiset ongelmat ja ratkaisut

Täydellinen kehittäjille, jotka haluavat ymmärtää toteutuksen yksityiskohdat ja rakentaa vastaavia ratkaisuja.

## 🤖 Mikä on MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** on avoin standardi, joka mahdollistaa tekoälyavustajien turvallisen pääsyn ulkoisiin tietolähteisiin ja työkaluihin reaaliajassa. Ajattele sitä sillaksi, joka yhdistää tekoälymallit tietokantoihin, API:hin, tiedostojärjestelmiin ja muihin resursseihin samalla säilyttäen turvallisuuden ja hallinnan.

### Keskeiset Hyödyt:
- **Reaaliaikainen Datapääsy**: Tekoälyavustajat voivat tehdä kyselyitä live-tietokantoihin ja API:hin
- **Turvallinen Integraatio**: Hallittu pääsy autentikoinnin ja käyttöoikeuksien avulla  
- **Työkalujen Laajennettavuus**: Lisää mukautettuja ominaisuuksia tekoälyavustajille
- **Standardoitu Protokolla**: Toimii eri tekoälyalustoilla ja työkaluilla

### Uusi MCP:ssä?

Jos olet uusi Model Context Protocolin parissa, suosittelemme aloittamaan Microsoftin kattavista aloitusresursseista:

**📖 [MCP Aloittelijoille Opas](https://aka.ms/mcp-for-beginners)**

Tämä resurssi tarjoaa:
- Johdannon MCP-konsepteihin ja arkkitehtuuriin
- Vaiheittaiset opetusohjelmat ensimmäisen MCP-palvelimen rakentamiseen
- Parhaat käytännöt MCP-kehitykseen
- Integraatioesimerkkejä suosittujen tekoälyalustojen kanssa
- Yhteisöresurssit ja tuki

Kun ymmärrät perusteet, palaa tänne tutustumaan tähän edistyneeseen vähittäismyynnin analytiikkatoteutukseen!

## 📚 Kattava Oppimisopas: /walkthrough

Tämä repository sisältää täydellisen **12-moduulin oppimispolun**, joka purkaa tämän MCP-vähittäismyyntipalvelimen esimerkin helposti ymmärrettäviksi, vaiheittaisiksi oppitunneiksi. Oppimispolku muuttaa tämän toimivan esimerkin kattavaksi opetusresurssiksi, joka sopii täydellisesti kehittäjille, jotka haluavat oppia rakentamaan tuotantovalmiita MCP-palvelimia tietokantaintegraatiolla.

### Mitä Opit

Oppimispolku kattaa kaiken MCP:n peruskäsitteistä edistyneeseen tuotantokäyttöön, mukaan lukien:

- **MCP:n Perusteet**: Model Context Protocolin ymmärtäminen ja sen käytännön sovellukset
- **Tietokantaintegraatio**: Turvallisen PostgreSQL-yhteyden toteuttaminen rivitasoisella turvallisuudella
- **Tekoälyllä Parannetut Ominaisuudet**: Semanttisen haun lisääminen Azure OpenAI -upotuksilla
- **Turvallisuuden Toteutus**: Yritystason autentikointi, valtuutus ja datan eristäminen
- **Työkalujen Kehitys**: Kehittyneiden MCP-työkalujen rakentaminen data-analytiikkaan ja liiketoimintatiedon hyödyntämiseen
- **Testaus ja Vianetsintä**: Kattavat testausstrategiat ja vianetsintätekniikat
- **VS Code -integraatio**: AI Chatin konfigurointi luonnollisen kielen tietokantakyselyihin
- **Tuotantokäyttö**: Konttien käyttö, skaalaus ja pilvikäyttöönotto
- **Seuranta ja Havainnointi**: Application Insights, lokitus ja suorituskyvyn seuranta

### Oppimispolun Yleiskatsaus

Oppimispolku seuraa progressiivista oppimisrakennetta, joka on suunniteltu kaikentasoisille kehittäjille:

| Moduuli | Painopistealue | Kuvaus | Aika-arvio |
|--------|------------|-------------|---------------|
| **[00-Johdanto](walkthrough/00-Introduction/README.md)** | Perusta | MCP-konseptit, Zava Retail -case study, arkkitehtuurin yleiskatsaus | 30 minuuttia |
| **[01-Arkkitehtuuri](walkthrough/01-Architecture/README.md)** | Suunnittelumallit | Tekninen arkkitehtuuri, kerrostettu suunnittelu, järjestelmän komponentit | 45 minuuttia |
| **[02-Turvallisuus](walkthrough/02-Security/README.md)** | Yritysturvallisuus | Azure-autentikointi, rivitasoinen turvallisuus, monikäyttäjäeristys | 60 minuuttia |
| **[03-Asennus](walkthrough/03-Setup/README.md)** | Ympäristö | Docker-asennus, Azure CLI, projektin konfigurointi, validointi | 45 minuuttia |
| **[04-Tietokanta](walkthrough/04-Database/README.md)** | Datalayer | PostgreSQL-skeema, pgvector, RLS-politiikat, esimerkkidata | 60 minuuttia |
| **[05-MCP-palvelin](walkthrough/05-MCP-Server/README.md)** | Ydin Toteutus | FastMCP-kehys, tietokantaintegraatio, yhteydenhallinta | 90 minuuttia |
| **[06-Työkalut](walkthrough/06-Tools/README.md)** | Työkalujen Kehitys | MCP-työkalujen luominen, kyselyvalidointi, liiketoimintatiedon ominaisuudet | 75 minuuttia |
| **[07-Semanttinen Haku](walkthrough/07-Semantic-Search/README.md)** | Tekoälyintegraatio | Azure OpenAI -upotukset, vektorihaku, hybridihakustrategiat | 60 minuuttia |
| **[08-Testaus](walkthrough/08-Testing/README.md)** | Laadunvarmistus | Yksikkötestaus, integraatiotestaus, suorituskykytestaus, vianetsintä | 75 minuuttia |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Kehityskokemus | VS Code -konfigurointi, AI Chat -integraatio, vianetsintätyönkulut | 45 minuuttia |
| **[10-Käyttöönotto](walkthrough/10-Deployment/README.md)** | Tuotantovalmius | Konttien käyttö, Azure Container Apps, CI/CD-putket, skaalaus | 90 minuuttia |
| **[11-Seuranta](walkthrough/11-Monitoring/README.md)** | Havainnointi | Application Insights, rakenteellinen lokitus, suorituskykymittarit | 60 minuuttia |
| **[12-Parhaat Käytännöt](walkthrough/12-Best-Practices/README.md)** | Tuotantokäytön Huippuosaaminen | Turvallisuuden vahvistaminen, suorituskyvyn optimointi, yritysmallit | 45 minuuttia |

**Kokonaisoppimisaika**: ~12-15 tuntia kattavaa käytännön oppimista

### 🎯 Kuinka Käyttää Oppimispolkua

**Aloittelijoille**:
1. Aloita [Moduuli 00: Johdanto](walkthrough/00-Introduction/README.md) MCP:n perusteiden ymmärtämiseksi
2. Seuraa moduuleja järjestyksessä saadaksesi täydellisen oppimiskokemuksen
3. Jokainen moduuli rakentuu edellisten konseptien päälle ja sisältää käytännön harjoituksia

**Kokeneille Kehittäjille**:
1. Tarkista [Pääkävelyn Yleiskatsaus](walkthrough/README.md) saadaksesi moduulien yhteenvedon
2. Siirry suoraan kiinnostaviin moduuleihin (esim. Moduuli 07 tekoälyintegraatiota varten)
3. Käytä yksittäisiä moduuleja viitemateriaalina omiin projekteihisi

**Tuotantototeutusta Varten**:
1. Keskity moduuleihin 02 (Turvallisuus), 10 (Käyttöönotto) ja 11 (Seuranta)
2. Tarkista Moduuli 12 (Parhaat Käytännöt) yritysohjeita varten
3. Käytä koodiesimerkkejä tuotantovalmiina malleina

### 🚀 Nopeat Aloitusvaihtoehdot

**Vaihtoehto 1: Täydellinen Oppimispolku** (Suositeltu aloittelijoille)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Vaihtoehto 2: Käytännön Toteutus** (Aloita suoraan rakentaminen)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Vaihtoehto 3: Tuotantokeskeisyys** (Yrityskäyttöönotto)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Oppimisen edellytykset

**Suositeltu tausta**:
- Perustason Python-ohjelmointikokemus
- REST API:en ja tietokantojen tuntemus
- Yleinen käsitys AI/ML-konsepteista
- Perustason komentorivin ja Dockerin tuntemus

**Ei vaadita (mutta hyödyllistä)**:
- Aiempi MCP-kokemus (käsittelemme tämän alusta alkaen)
- Azure-pilvipalveluiden kokemus (tarjoamme vaiheittaiset ohjeet)
- Edistynyt PostgreSQL-osaaminen (selitämme käsitteet tarpeen mukaan)

### 💡 Oppimisvinkit

1. **Käytännönläheinen lähestymistapa**: Jokainen moduuli sisältää toimivia koodiesimerkkejä, joita voit ajaa ja muokata
2. **Progressiivinen monimutkaisuus**: Konseptit rakentuvat asteittain yksinkertaisista edistyneisiin
3. **Reaaliaikainen konteksti**: Kaikki esimerkit perustuvat realistisiin vähittäiskaupan liiketoimintaskenaarioihin
4. **Tuotantovalmius**: Koodiesimerkit on suunniteltu todelliseen tuotantokäyttöön
5. **Yhteisön tuki**: Liity [Discord-yhteisöömme](https://discord.com/invite/ByRwuEEgH4) saadaksesi apua ja osallistuaksesi keskusteluihin

### 🔗 Liittyvät resurssit

- **[MCP aloittelijoille](https://aka.ms/mcp-for-beginners)**: Keskeistä taustalukemista
- **[Esimerkkikävely](Sample_Walkthrough.md)**: Korkean tason tekninen yleiskatsaus
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Pilvialusta, jota käytetään esimerkeissä
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python-pohjainen MCP-toteutuskehys

**Valmis aloittamaan oppimisen?** Aloita **[Moduuli 00: Johdanto](walkthrough/00-Introduction/README.md)** tai tutustu **[koko kävelyn yleiskatsaukseen](walkthrough/README.md)**.

## Edellytykset

1. Docker Desktop asennettuna
2. Git asennettuna
3. **Azure CLI**: Asenna ja todista Azure CLI:llä
4. Pääsy OpenAI:n `text-embedding-3-small` -malliin ja tarvittaessa `gpt-4o-mini` -malliin.

## Aloittaminen

Avaa komentorivi ja suorita seuraavat komennot:

1. Todista Azure CLI:llä

    ```bash
    az login
    ```

2. Kloonaa arkisto

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Siirry projektihakemistoon

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure-resurssien käyttöönotto

Suorita seuraavat skriptit automatisoidaksesi MCP-palvelimen tarvitsemien Azure-resurssien käyttöönoton.

Käyttöönoton skriptit asentavat automaattisesti `text-embedding-3-small` -mallin. Käyttöönoton aikana sinulla on mahdollisuus sisällyttää myös `gpt-4o-mini` -malli. Huomaa, että `gpt-4o-mini` ei ole **pakollinen** tälle projektille ja se on mukana vain mahdollisia tulevia laajennuksia varten.

**Valitse skripti käyttöjärjestelmäsi mukaan:**

#### Windows (PowerShell)

```powershell
# Run from the project root directory
cd infra && ./deploy.ps1
```

#### macOS/Linux (Bash)

```bash
# Run from the project root directory
cd infra && ./deploy.sh
```

## MCP-palvelimen käynnistäminen

Helpoin tapa käynnistää koko pino (PostgreSQL + MCP-palvelin) on käyttää Docker Composea:

### Käynnistä pino

```bash
# Start PostgreSQL and MCP Server
docker compose up -d

# View logs
docker compose logs -f

# View MCP Server Logs
docker compose logs -f mcp_server

# View the PostgreSQL Logs
docker compose logs -f pg17

# Stop the stack
docker compose down -v
```

## Käyttö

Seuraavat ohjeet olettavat, että käytät sisäänrakennettua VS Code MCP-palvelintukea.

1. Avaa projekti VS Codessa. Suorita terminaalista:

    ```bash
    code .
    ```

2. Käynnistä yksi tai useampi MCP-palvelin käyttämällä `.vscode/mcp.json` -tiedoston kokoonpanoja. Tiedosto sisältää neljä erilaista palvelinkokoonpanoa, jotka edustavat eri myymäläpäällikön rooleja:

   - Jokainen kokoonpano käyttää ainutlaatuista RLS (Row Level Security) -käyttäjätunnusta
   - Nämä käyttäjätunnukset simuloivat eri myymäläpäälliköiden identiteettejä, jotka käyttävät tietokantaa
   - RLS-järjestelmä rajoittaa tietojen käyttöä päällikön määritetyn myymälän perusteella
   - Tämä jäljittelee todellisia tilanteita, joissa myymäläpäälliköt kirjautuvat sisään eri Entra ID -tileillä

    ```json
    {
        "servers": {
            "zava-sales-analysis-headoffice": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "00000000-0000-0000-0000-000000000000"}
            },
            "zava-sales-analysis-seattle": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "f47ac10b-58cc-4372-a567-0e02b2c3d479"}
            },
            "zava-sales-analysis-redmond": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "e7f8a9b0-c1d2-3e4f-5678-90abcdef1234"}
            },
            "zava-sales-analysis-online": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2"}
            }
        },
        "inputs": []
    }
    ```

### Avaa VS Code AI Chat

1. Avaa AI Chat -tila VS Codessa
2. Kirjoita **#zava** ja valitse yksi käynnistämistäsi MCP-palvelimista
3. Kysy kysymyksiä myyntidatasta - Katso esimerkkikyselyt alla

### Esimerkkikyselyt

1. Näytä 20 parasta tuotetta myyntitulojen mukaan
1. Näytä myynnit myymälöittäin
1. Mitkä olivat viimeisen neljänneksen myynnit kategorioittain?
1. Mitä tuotteita myymme, jotka ovat samanlaisia kuin "maalipurkkien säilytysastiat"?

## Ominaisuudet

- **Monitaulukannan käyttö**: Hae skeemoja useille tietokantatauluille yhdellä pyynnöllä
- **Turvallinen kyselysuoritus**: Suorita PostgreSQL-kyselyitä Row Level Security (RLS) -tuella
- **Reaaliaikainen data**: Pääsy ajankohtaiseen myynti-, varasto- ja asiakasdataan
- **Päivämäärä/aikatyökalut**: Hae nykyiset UTC-aikaleimat ajankohtaista analyysiä varten
- **Joustava käyttöönotto**: Tukee HTTP-palvelinmoodia

## Tuetut taulut

Palvelin tarjoaa pääsyn seuraaviin vähittäiskaupan tietokantatauluihin:

- `retail.customers` - Asiakastiedot ja profiilit
- `retail.stores` - Myymälöiden sijainnit ja tiedot
- `retail.categories` - Tuotekategoriat ja hierarkiat
- `retail.product_types` - Tuotetyyppiluokitukset
- `retail.products` - Tuotekatalogi ja spesifikaatiot
- `retail.orders` - Asiakastilaukset ja tapahtumat
- `retail.order_items` - Yksittäiset tuotteet tilauksissa
- `retail.inventory` - Nykyiset varastotasot ja varastotiedot

## Käytettävissä olevat työkalut

### `get_multiple_table_schemas`

Hae tietokantaskeemoja useille tauluille yhdellä pyynnöllä.

**Parametrit:**

- `table_names` (list[str]): Lista tuettujen taulujen kelvollisista nimistä

**Palauttaa:** Pyydettyjen taulujen yhdistetyt skeemamerkkijonot

### `execute_sales_query`

Suorita PostgreSQL-kyselyitä myyntitietokantaa vastaan Row Level Security -tuella.

**Parametrit:**

- `postgresql_query` (str): Hyvin muodostettu PostgreSQL-kysely

**Palauttaa:** Kyselyn tulokset merkkijonona (rajoitettu 20 riviin luettavuuden vuoksi)

**Parhaat käytännöt:**

- Hae aina ensin taulujen skeemat
- Käytä skeemojen tarkkoja sarakenimiä
- Liitä liittyvät taulut kattavaa analyysiä varten
- Yhdistä tulokset tarvittaessa
- Rajoita tulostus luettavuuden vuoksi

### `get_current_utc_date`

Hae nykyinen UTC-päivämäärä ja -aika ISO-muodossa.

**Palauttaa:** Nykyinen UTC-päivämäärä/aika ISO-muodossa (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Suorita semanttinen haku tuotteille käyttäjän kyselyiden perusteella.

**Palauttaa:** Lista tuotteista, jotka vastaavat hakukriteerejä

**Parametrit:**

- `query` (str): Hakukyselyn merkkijono

**Palauttaa:** Lista tuotteista, jotka vastaavat hakukriteerejä

## Turvaominaisuudet

### Row Level Security (RLS)

Palvelin toteuttaa Row Level Security -käytännöt varmistaakseen, että käyttäjät pääsevät käsiksi vain niihin tietoihin, joihin heillä on oikeus:

- **HTTP-moodi**: Käyttää `x-rls-user-id` -otsikkoa tunnistaakseen pyynnön lähettävän käyttäjän

- **Oletusvarmistus**: Käyttää paikkamerkki-UUID:ta, kun käyttäjätunnusta ei ole annettu

#### Myymäläkohtaiset RLS-käyttäjätunnukset

Jokaisella Zava Retail -myymälällä on ainutlaatuinen RLS-käyttäjätunnus, joka määrittää, mihin tietoihin käyttäjä pääsee:

| Myymälän sijainti | RLS-käyttäjätunnus | Kuvaus |
|-------------------|--------------------|--------|
| **Globaali pääsy** | `00000000-0000-0000-0000-000000000000` | Oletusvarmistus - pääsy kaikkiin myymälöihin |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle -myymälän tiedot |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue -myymälän tiedot |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma -myymälän tiedot |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane -myymälän tiedot |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett -myymälän tiedot |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond -myymälän tiedot |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland -myymälän tiedot |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online -myymälän tiedot |

#### RLS-toteutus

Kun käyttäjä yhdistää tiettyyn myymälään RLS-käyttäjätunnuksella, hän näkee vain:

- Asiakkaat, jotka liittyvät kyseiseen myymälään
- Tilaukset, jotka on tehty kyseisessä myymälässä
- Varastotiedot kyseisestä myymälästä
- Myymäläkohtaiset myynti- ja suorituskykymittarit

Tämä varmistaa tietojen eristämisen eri myymälöiden välillä samalla kun säilytetään yhtenäinen tietokantaskeema.

## Arkkitehtuuri

### Sovelluskonteksti

Palvelin käyttää hallittua sovelluskontekstia, jossa on:

- **Tietokantayhteyspooli**: Tehokas yhteydenhallinta HTTP-moodissa
- **Elinkaaren hallinta**: Resurssien asianmukainen siivous sammutuksen yhteydessä
- **Tyyppiturvallisuus**: Vahvasti tyypitetty konteksti `AppContext`-dataluokalla

### Pyyntökonteksti

- **Otsikoiden purku**: Turvallinen otsikoiden käsittely käyttäjän tunnistamiseksi
- **RLS-integraatio**: Käyttäjätunnuksen automaattinen ratkaisu pyyntökontekstista
- **Virheenkäsittely**: Kattava virheenkäsittely käyttäjäystävällisillä viesteillä

## Tietokantaintegraatio

Palvelin integroituu PostgreSQL-tietokantaan `PostgreSQLSchemaProvider`-luokan kautta:

- **Yhteyspoolaus**: Käyttää asynkronisia yhteyspoolauksia skaalautuvuuden vuoksi
- **Skeemametadata**: Tarjoaa yksityiskohtaisia taulujen skeematietoja
- **Kyselyiden suoritus**: Turvallinen kyselyiden suoritus RLS-tuella
- **Resurssien hallinta**: Tietokantaresurssien automaattinen siivous

## Virheenkäsittely

Palvelin toteuttaa vahvan virheenkäsittelyn:

- **Taulujen validointi**: Varmistaa, että vain kelvollisia taulujen nimiä käytetään
- **Kyselyiden validointi**: Tarkistaa PostgreSQL-kyselyiden oikeellisuuden ennen suorittamista
- **Resurssien hallinta**: Asianmukainen siivous myös virhetilanteissa
- **Käyttäjäystävälliset viestit**: Selkeät virheilmoitukset vianetsintään

## Turvallisuushuomiot

1. **Row Level Security**: Kaikki kyselyt noudattavat RLS-käytäntöjä käyttäjän identiteetin perusteella
2. **Myymälätietojen eristys**: Jokaisen myymälän RLS-käyttäjätunnus varmistaa pääsyn vain kyseisen myymälän tietoihin
3. **Syötteen validointi**: Taulujen nimet ja kyselyt validoidaan ennen suorittamista
4. **Resurssirajoitukset**: Kyselytulokset rajoitetaan liiallisen resurssikäytön estämiseksi
5. **Yhteyden turvallisuus**: Käyttää turvallisia tietokantayhteyskäytäntöjä
6. **Käyttäjän identiteetin varmistus**: Varmista aina, että oikea RLS-käyttäjätunnus käytetään tarkoitetulle myymälälle

### Tärkeät turvallisuusmuistiot

- **Älä koskaan käytä tuotannon RLS-käyttäjätunnuksia kehitysympäristöissä**
- **Varmista aina, että RLS-käyttäjätunnus vastaa tarkoitettua myymälää ennen kyselyiden suorittamista**
- **Oletus-UUID (`00000000-0000-0000-0000-000000000000`) tarjoaa rajoitetun pääsyn**
- **Jokaisella myymäläpäälliköllä tulisi olla pääsy vain oman myymälänsä RLS-käyttäjätunnukseen**

## Kehitys

### Projektin rakenne

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Keskeiset komponentit

- **FastMCP-palvelin**: Moderni MCP-palvelintoteutus asynkronisella tuella
- **PostgreSQL-tarjoaja**: Tietokanta-abstraktiokerros RLS-tuella
- **Kontekstinhallinta**: Tyyppiturvallinen sovellus- ja pyyntökontekstin käsittely
- **Työkalujen rekisteröinti**: Deklaratiivinen työkalujen rekisteröinti Pydantic-validoinnilla

## Osallistuminen

Kun osallistut tämän palvelimen kehittämiseen:

1. Varmista, että kaikki tietokantakyselyt noudattavat Row Level Security -käytäntöjä
2. Lisää asianmukainen virheenkäsittely uusille työkaluille
3. Päivitä tämä README uusilla ominaisuuksilla tai muutoksilla
4. Testaa HTTP-palvelinmoodi
5. Validoi syöteparametrit ja tarjoa selkeät virheilmoitukset

## [Lisenssi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Tämä MCP-palvelin mahdollistaa turvallisen ja tehokkaan pääsyn Zava Retailin myyntidataan AI-pohjaista analyysiä ja oivalluksia varten.*

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.