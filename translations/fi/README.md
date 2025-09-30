<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:57:25+00:00",
  "source_file": "README.md",
  "language_code": "fi"
}
-->
# MCP-palvelin ja PostgreSQL-esimerkki - Vähittäismyynnin analyysi

## Opi MCP ja tietokantaintegraatio käytännön esimerkkien avulla

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Liity Azure AI Foundry Discordiin](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Seuraa näitä vaiheita aloittaaksesi näiden resurssien käytön:

1. **Haarauta arkisto**: Klikkaa [tästä haarauttaaksesi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Kloonaa arkisto**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Liity Azure AI Foundry Discordiin**: [Tapaa asiantuntijoita ja muita kehittäjiä](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Monikielinen tuki

#### Tuettu GitHub Actionin kautta (automaattinen ja aina ajan tasalla)

[Ranska](../fr/README.md) | [Espanja](../es/README.md) | [Saksa](../de/README.md) | [Venäjä](../ru/README.md) | [Arabia](../ar/README.md) | [Persia (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kiina (yksinkertaistettu)](../zh/README.md) | [Kiina (perinteinen, Macao)](../mo/README.md) | [Kiina (perinteinen, Hongkong)](../hk/README.md) | [Kiina (perinteinen, Taiwan)](../tw/README.md) | [Japani](../ja/README.md) | [Korea](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugali (Portugali)](../pt/README.md) | [Portugali (Brasilia)](../br/README.md) | [Italia](../it/README.md) | [Puola](../pl/README.md) | [Turkki](../tr/README.md) | [Kreikka](../el/README.md) | [Thai](../th/README.md) | [Ruotsi](../sv/README.md) | [Tanska](../da/README.md) | [Norja](../no/README.md) | [Suomi](./README.md) | [Hollanti](../nl/README.md) | [Heprea](../he/README.md) | [Vietnam](../vi/README.md) | [Indonesia](../id/README.md) | [Malaiji](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Unkari](../hu/README.md) | [Tšekki](../cs/README.md) | [Slovakki](../sk/README.md) | [Romania](../ro/README.md) | [Bulgaria](../bg/README.md) | [Serbia (kyrillinen)](../sr/README.md) | [Kroatia](../hr/README.md) | [Sloveeni](../sl/README.md) | [Ukraina](../uk/README.md) | [Burma (Myanmar)](../my/README.md)

**Jos haluat lisätä uusia käännöksiä, tuetut kielet löytyvät [täältä](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Johdanto

Tämä esimerkki näyttää, kuinka rakentaa ja ottaa käyttöön kattava **Model Context Protocol (MCP) -palvelin**, joka tarjoaa tekoälyavustajille turvallisen ja älykkään pääsyn vähittäismyynnin myyntitietoihin PostgreSQL:n kautta. Projekti esittelee yritystason ominaisuuksia, kuten **rivikohtaisen tietoturvan (Row Level Security, RLS)**, **semanttisen haun ominaisuudet** ja **Azure AI -integraation** todellisiin vähittäismyynnin analytiikkaskenaarioihin.

**Keskeiset käyttötapaukset:**
- **Tekoälypohjainen myyntianalytiikka**: Mahdollista tekoälyavustajien kysyä ja analysoida vähittäismyynnin tietoja luonnollisella kielellä
- **Turvallinen monivuokraajapääsy**: Näytä rivikohtaisen tietoturvan toteutus, jossa eri myymäläpäälliköt voivat käyttää vain oman myymälänsä tietoja
- **Semanttinen tuotehaku**: Esittele tekoälyllä parannettu tuotehaku tekstin upotusten avulla
- **Yritysintegraatio**: Näytä, kuinka MCP-palvelimet integroidaan Azure-palveluihin ja PostgreSQL-tietokantoihin

**Täydellinen seuraaville:**
- Kehittäjät, jotka haluavat oppia rakentamaan MCP-palvelimia tietokantaintegraatiolla
- Data-insinöörit, jotka toteuttavat turvallisia monivuokraaja-analytiikkaratkaisuja
- Tekoälysovelluskehittäjät, jotka työskentelevät vähittäismyynnin tai verkkokaupan tietojen parissa
- Kaikki, jotka ovat kiinnostuneita yhdistämään tekoälyavustajat yritystietokantoihin

## Liity Azure AI Foundry Discord -yhteisöön
Jaa kokemuksiasi MCP:stä ja tapaa asiantuntijoita ja tuoteasiantuntijoita

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Myyntianalyysin MCP-palvelin

Model Context Protocol (MCP) -palvelin, joka tarjoaa kattavan asiakastietokannan pääsyn Zava Retail DIY -liiketoiminnalle. Tämä palvelin mahdollistaa tekoälyavustajien kysyä ja analysoida vähittäismyynnin tietoja turvallisen, skeemaa ymmärtävän käyttöliittymän kautta.

## 📚 Täydellinen toteutusopas

Katso yksityiskohtainen opas tämän ratkaisun rakentamisesta ja vastaavien MCP-palvelimien toteuttamisesta **[Sample Walkthrough](Sample_Walkthrough.md)** -dokumentista. Tämä opas sisältää:

- **Arkkitehtuurin syväluotaus**: Komponenttianalyysi ja suunnittelumallit
- **Vaiheittainen rakentaminen**: Projektin perustamisesta käyttöönottoon
- **Koodin erittely**: Yksityiskohtainen selitys MCP-palvelimen toteutuksesta
- **Edistyneet ominaisuudet**: Rivikohtainen tietoturva, semanttinen haku ja valvonta
- **Parhaat käytännöt**: Tietoturva, suorituskyky ja kehitysohjeet
- **Vianetsintä**: Yleiset ongelmat ja ratkaisut

Täydellinen kehittäjille, jotka haluavat ymmärtää toteutuksen yksityiskohdat ja rakentaa vastaavia ratkaisuja.

## 🤖 Mikä on MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** on avoin standardi, joka mahdollistaa tekoälyavustajien turvallisen pääsyn ulkoisiin tietolähteisiin ja työkaluihin reaaliajassa. Ajattele sitä siltana, joka yhdistää tekoälymallit tietokantoihin, API-rajapintoihin, tiedostojärjestelmiin ja muihin resursseihin samalla säilyttäen tietoturvan ja hallinnan.

### Keskeiset hyödyt:
- **Reaaliaikainen tiedonhaku**: Tekoälyavustajat voivat kysyä suoraan tietokantoja ja API-rajapintoja
- **Turvallinen integraatio**: Hallittu pääsy todennuksella ja käyttöoikeuksilla  
- **Työkalujen laajennettavuus**: Lisää mukautettuja ominaisuuksia tekoälyavustajille
- **Standardoitu protokolla**: Toimii eri tekoälyalustoilla ja työkaluilla

### Uusi MCP:ssä?

Jos olet uusi Model Context Protocolin parissa, suosittelemme aloittamaan Microsoftin kattavista aloitusresursseista:

**📖 [MCP for Beginners Guide](https://aka.ms/mcp-for-beginners)**

Tämä resurssi sisältää:
- Johdannon MCP-konsepteihin ja arkkitehtuuriin
- Vaiheittaiset opetusohjelmat ensimmäisen MCP-palvelimen rakentamiseen
- Parhaat käytännöt MCP-kehitykseen
- Integraatioesimerkkejä suosittujen tekoälyalustojen kanssa
- Yhteisöresurssit ja tuki

Kun ymmärrät perusteet, palaa tänne tutustumaan tähän edistyneeseen vähittäismyynnin analytiikkatoteutukseen!

## 📚 Kattava oppimisopas: /walkthrough

Tämä arkisto sisältää täydellisen **12 moduulin oppimispolun**, joka purkaa tämän MCP-vähittäispalvelimen esimerkin helposti omaksuttaviksi, vaiheittaisiksi oppitunneiksi. Walkthrough muuttaa tämän toimivan esimerkin kattavaksi oppimisresurssiksi, joka sopii täydellisesti kehittäjille, jotka haluavat oppia rakentamaan tuotantovalmiita MCP-palvelimia tietokantaintegraatiolla.

### Mitä opit

Walkthrough kattaa kaiken MCP:n perusteista edistyneeseen tuotantokäyttöön, mukaan lukien:

- **MCP:n perusteet**: Model Context Protocolin ymmärtäminen ja sen todelliset sovellukset
- **Tietokantaintegraatio**: Turvallisen PostgreSQL-yhteyden toteuttaminen rivikohtaisella tietoturvalla
- **Tekoälyllä parannetut ominaisuudet**: Semanttisen haun lisääminen Azure OpenAI -upotuksilla
- **Tietoturvan toteutus**: Yritystason todennus, valtuutus ja tietojen eristys
- **Työkalujen kehitys**: Kehittyneiden MCP-työkalujen rakentaminen data-analytiikkaan ja liiketoimintatiedon hallintaan
- **Testaus ja vianetsintä**: Kattavat testausstrategiat ja vianetsintätekniikat
- **VS Code -integraatio**: AI Chatin konfigurointi luonnollisen kielen tietokantakyselyihin
- **Tuotantokäyttöönottaminen**: Konttien käyttö, skaalaus ja pilvikäyttöönotto
- **Valvonta ja havainnointi**: Application Insights, lokitus ja suorituskyvyn seuranta

### Oppimispolun yleiskatsaus

Walkthrough noudattaa progressiivista oppimisrakennetta, joka on suunniteltu kaikentasoisille kehittäjille:

| Moduuli | Painopistealue | Kuvaus | Aika-arvio |
|--------|------------|-------------|---------------|
| **[00-Johdanto](walkthrough/00-Introduction/README.md)** | Perusta | MCP-konseptit, Zava Retail -tapaustutkimus, arkkitehtuurin yleiskatsaus | 30 minuuttia |
| **[01-Arkkitehtuuri](walkthrough/01-Architecture/README.md)** | Suunnittelumallit | Tekninen arkkitehtuuri, kerroksellinen suunnittelu, järjestelmäkomponentit | 45 minuuttia |
| **[02-Tietoturva](walkthrough/02-Security/README.md)** | Yritystason tietoturva | Azure-todennus, rivikohtainen tietoturva, monivuokraajaeristys | 60 minuuttia |
| **[03-Asennus](walkthrough/03-Setup/README.md)** | Ympäristö | Docker-asennus, Azure CLI, projektin konfigurointi, validointi | 45 minuuttia |
| **[04-Tietokanta](walkthrough/04-Database/README.md)** | Tietokerros | PostgreSQL-skeema, pgvector, RLS-käytännöt, esimerkkidata | 60 minuuttia |
| **[05-MCP-palvelin](walkthrough/05-MCP-Server/README.md)** | Ydintoteutus | FastMCP-kehys, tietokantaintegraatio, yhteydenhallinta | 90 minuuttia |
| **[06-Työkalut](walkthrough/06-Tools/README.md)** | Työkalujen kehitys | MCP-työkalujen luominen, kyselyvalidointi, liiketoimintatiedon ominaisuudet | 75 minuuttia |
| **[07-Semanttinen haku](walkthrough/07-Semantic-Search/README.md)** | Tekoälyintegraatio | Azure OpenAI -upotukset, vektorihaku, hybridihakustrategiat | 60 minuuttia |
| **[08-Testaus](walkthrough/08-Testing/README.md)** | Laadunvarmistus | Yksikkötestaus, integraatiotestaus, suorituskykytestaus, vianetsintä | 75 minuuttia |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Kehityskokemus | VS Code -konfigurointi, AI Chat -integraatio, vianetsintätyönkulut | 45 minuuttia |
| **[10-Käyttöönotto](walkthrough/10-Deployment/README.md)** | Tuotantovalmius | Konttien käyttö, Azure Container Apps, CI/CD-putket, skaalaus | 90 minuuttia |
| **[11-Valvonta](walkthrough/11-Monitoring/README.md)** | Havainnointi | Application Insights, rakenteellinen lokitus, suorituskykymittarit | 60 minuuttia |
| **[12-Parhaat käytännöt](walkthrough/12-Best-Practices/README.md)** | Tuotantokäytön huippuosaaminen | Tietoturvan vahvistaminen, suorituskyvyn optimointi, yrityskuvioiden käyttö | 45 minuuttia |

**Kokonaisoppimisaika**: ~12-15 tuntia kattavaa käytännön oppimista

### 🎯 Kuinka käyttää walkthrough-opasta

**Aloittelijoille**:
1. Aloita [Moduulista 00: Johdanto](walkthrough/00-Introduction/README.md) ymmärtääksesi MCP:n perusteet
2. Seuraa moduuleja järjestyksessä saadaksesi täydellisen oppimiskokemuksen
3. Jokainen moduuli rakentuu edellisten konseptien päälle ja sisältää käytännön harjoituksia

**Kokeneille kehittäjille**:
1. Tarkista [Pääopas](walkthrough/README.md) saadaksesi yleiskatsauksen moduuleista
2. Siirry suoraan kiinnostaviin moduuleihin (esim. Moduuli 07 tekoälyintegraatiota varten)
3. Käytä yksittäisiä moduuleja viitemateriaalina omiin projekteihisi

**Tuotantototeutukseen**:
1. Keskity moduuleihin 02 (Tietoturva), 10 (Käyttöönotto) ja 11 (Valvonta)
2. Tarkista Moduuli 12 (Parhaat käytännöt) yritysohjeita varten
3. Käytä koodiesimerkkejä tuotantovalmiina malleina

### 🚀 Nopeat aloitusvaihtoehdot

**Vaihtoehto 1: Täydellinen oppimispolku** (suositeltu aloittelijoille)  
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```
  
**Vaihtoehto 2: Käytännön toteutus** (aloita suoraan rakentamisesta)  
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```
  
**Vaihtoehto 3: Tuotantokeskeisyys** (yrityskäyttöönotto)  
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```
  
### 📋 Oppimisen edellytykset

**Suositeltu tausta**:
- Perustason Python-ohjelmointikokemus
- REST API:en ja tietokantojen tuntemus
- Yleinen käsitys AI/ML-konsepteista
- Perustiedot komentorivistä ja Dockerista

**Ei vaadita (mutta hyödyllistä)**:
- Aiempi MCP-kokemus (käsittelemme tämän alusta alkaen)
- Azure-pilvipalveluiden kokemus (tarjoamme vaiheittaiset ohjeet)
- Edistynyt PostgreSQL-osaaminen (selitämme käsitteet tarpeen mukaan)

### 💡 Oppimisvinkit

1. **Käytännönläheinen lähestymistapa**: Jokainen moduuli sisältää toimivia koodiesimerkkejä, joita voit ajaa ja muokata
2. **Progressiivinen monimutkaisuus**: Konseptit rakentuvat asteittain yksinkertaisista edistyneisiin
3. **Reaaliaikainen konteksti**: Kaikki esimerkit perustuvat realistisiin vähittäiskaupan liiketoimintaskenaarioihin
4. **Tuotantovalmius**: Koodiesimerkit on suunniteltu todelliseen tuotantokäyttöön
5. **Yhteisön tuki**: Liity [Discord-yhteisöömme](https://discord.com/invite/ByRwuEEgH4) saadaksesi apua ja keskusteluja

### 🔗 Liittyvät resurssit

- **[MCP aloittelijoille](https://aka.ms/mcp-for-beginners)**: Keskeinen taustalukemisto
- **[Esimerkkikävely](Sample_Walkthrough.md)**: Korkean tason tekninen yleiskatsaus
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Pilvialusta, jota käytetään esimerkeissä
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP -toteutuskehys

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

Käyttöönoton skriptit asentavat automaattisesti `text-embedding-3-small` -mallin. Käyttöönoton aikana sinulla on mahdollisuus sisällyttää myös `gpt-4o-mini` -malli. Huomaa, että `gpt-4o-mini` ei ole **välttämätön** tälle projektille ja se on mukana vain mahdollisia tulevia laajennuksia varten.

**Valitse skripti alustasi mukaan:**

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
- **Joustava käyttöönotto**: Tukee HTTP-palvelintilaa

## Tuetut taulut

Palvelin tarjoaa pääsyn seuraaviin vähittäiskaupan tietokantatauluihin:

- `retail.customers` - Asiakastiedot ja profiilit
- `retail.stores` - Myymälöiden sijainnit ja tiedot
- `retail.categories` - Tuotekategoriat ja hierarkiat
- `retail.product_types` - Tuotetyyppiluokitukset
- `retail.products` - Tuoteluettelo ja spesifikaatiot
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
- Käytä tarkkoja sarakenimiä skeemoista
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

Palvelin toteuttaa Row Level Security -ominaisuuden varmistaakseen, että käyttäjät pääsevät käsiksi vain niihin tietoihin, joihin heillä on oikeus:

- **HTTP-tila**: Käyttää `x-rls-user-id` -otsikkoa tunnistaakseen pyynnön lähettävän käyttäjän

- **Oletusvarmistus**: Käyttää paikkamerkki UUID:ta, kun käyttäjätunnusta ei ole annettu

#### Myymäläkohtaiset RLS-käyttäjätunnukset

Jokaisella Zava Retail -myymälän sijainnilla on ainutlaatuinen RLS-käyttäjätunnus, joka määrittää, mihin tietoihin käyttäjä pääsee:

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

Kun käyttäjä yhdistää tiettyyn myymälän RLS-käyttäjätunnukseen, hän näkee vain:

- Asiakkaat, jotka liittyvät kyseiseen myymälään
- Tilaukset, jotka on tehty kyseisessä myymälässä
- Varastotiedot kyseisestä myymälästä
- Myymäläkohtaiset myynti- ja suorituskykymittarit

Tämä varmistaa tietojen eristämisen eri myymäläsijaintien välillä samalla, kun säilytetään yhtenäinen tietokantaskeema.

## Arkkitehtuuri

### Sovelluskonteksti

Palvelin käyttää hallittua sovelluskontekstia, jossa on:

- **Tietokantayhteyspooli**: Tehokas yhteydenhallinta HTTP-tilassa
- **Elinkaaren hallinta**: Resurssien asianmukainen siivous sammutuksen yhteydessä
- **Tyyppiturvallisuus**: Vahvasti tyypitetty konteksti `AppContext`-dataluokan avulla

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

Palvelin toteuttaa vankan virheenkäsittelyn:

- **Taulujen validointi**: Varmistaa, että vain kelvollisia taulujen nimiä käytetään
- **Kyselyiden validointi**: Validoi PostgreSQL-kyselyt ennen suorittamista
- **Resurssien hallinta**: Asianmukainen siivous myös virhetilanteissa
- **Käyttäjäystävälliset viestit**: Selkeät virheilmoitukset vianmääritystä varten

## Turvallisuushuomiot

1. **Row Level Security**: Kaikki kyselyt noudattavat RLS-käytäntöjä käyttäjän identiteetin perusteella
2. **Myymälätietojen eristys**: Jokaisen myymälän RLS-käyttäjätunnus varmistaa pääsyn vain kyseisen myymälän tietoihin
3. **Syötteen validointi**: Taulujen nimet ja kyselyt validoidaan ennen suorittamista
4. **Resurssirajoitukset**: Kyselytulokset rajoitetaan liiallisen resurssikäytön estämiseksi
5. **Yhteyden turvallisuus**: Käyttää turvallisia tietokantayhteyskäytäntöjä
6. **Käyttäjän identiteetin varmistus**: Varmista aina, että oikea RLS-käyttäjätunnus käytetään tarkoitetulle myymälälle

### Tärkeät turvallisuusmuistiinpanot

- **Älä koskaan käytä tuotannon RLS-käyttäjätunnuksia kehitysympäristöissä**
- **Varmista aina, että RLS-käyttäjätunnus vastaa tarkoitettua myymälää ennen kyselyiden suorittamista**
- **Oletus UUID (`00000000-0000-0000-0000-000000000000`) tarjoaa rajoitetun pääsyn**
- **Jokaisella myymäläpäälliköllä tulisi olla pääsy vain oman myymälänsä RLS-käyttäjätunnukseen**

## Kehitys

### Projektirakenne

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
4. Testaa HTTP-palvelintila
5. Validoi syöteparametrit ja tarjoa selkeät virheilmoitukset

## [Lisenssi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Tämä MCP-palvelin mahdollistaa turvallisen ja tehokkaan pääsyn Zava Retailin myyntidataan AI-pohjaista analyysiä ja oivalluksia varten.*

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.