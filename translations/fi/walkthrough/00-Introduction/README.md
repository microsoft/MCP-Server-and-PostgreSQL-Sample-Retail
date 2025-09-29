<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-29T22:00:49+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "fi"
}
-->
# Johdanto MCP-tietokantaintegraatioon

## 🎯 Mitä tämä moduuli kattaa

Tämä johdantomoduuli tarjoaa kattavan yleiskatsauksen Model Context Protocol (MCP) -palvelimien rakentamisesta tietokantaintegraation avulla. Opit liiketoimintatapauksen, teknisen arkkitehtuurin ja käytännön sovellukset Zava Retail -analytiikkatapausesimerkin kautta.

## Yleiskatsaus

**Model Context Protocol (MCP)** mahdollistaa tekoälyavustajien turvallisen pääsyn ulkoisiin tietolähteisiin ja vuorovaikutuksen niiden kanssa reaaliajassa. Kun MCP yhdistetään tietokantaintegraatioon, se avaa tehokkaita mahdollisuuksia datalähtöisille tekoälysovelluksille.

Tämä oppimispolku opettaa sinua rakentamaan tuotantovalmiita MCP-palvelimia, jotka yhdistävät tekoälyavustajat vähittäismyyntidataan PostgreSQL:n kautta, toteuttaen yrityskäytäntöjä kuten rivitason turvallisuus (Row Level Security), semanttinen haku ja monivuokraajapohjainen datan käyttö.

## Oppimistavoitteet

Moduulin lopussa osaat:

- **Määritellä** Model Context Protocolin ja sen keskeiset hyödyt tietokantaintegraatiossa
- **Tunnistaa** MCP-palvelimen arkkitehtuurin keskeiset komponentit tietokantojen kanssa
- **Ymmärtää** Zava Retail -tapausesimerkin ja sen liiketoimintavaatimukset
- **Tunnistaa** yrityskäytännöt turvalliseen ja skaalautuvaan tietokantapääsyyn
- **Listata** oppimispolun aikana käytetyt työkalut ja teknologiat

## 🧭 Haaste: Tekoäly kohtaa todellisen maailman datan

### Perinteisen tekoälyn rajoitukset

Modernit tekoälyavustajat ovat erittäin tehokkaita, mutta kohtaavat merkittäviä rajoituksia työskennellessään todellisen maailman liiketoimintadatan kanssa:

| **Haaste** | **Kuvaus** | **Liiketoimintavaikutus** |
|------------|------------|--------------------------|
| **Staattinen tieto** | Tekoälymallit, jotka on koulutettu kiinteillä tietoaineistoilla, eivät pääse käsiksi ajankohtaiseen liiketoimintadataan | Vanhentuneet näkemykset, menetetyt mahdollisuudet |
| **Tietosiilot** | Tieto lukittuna tietokantoihin, API-rajapintoihin ja järjestelmiin, joihin tekoäly ei pääse | Epätäydellinen analyysi, hajanaiset työnkulut |
| **Turvallisuusrajoitukset** | Suora tietokantapääsy aiheuttaa turvallisuus- ja vaatimustenmukaisuusongelmia | Rajoitettu käyttöönotto, manuaalinen datan valmistelu |
| **Monimutkaiset kyselyt** | Liiketoimintakäyttäjät tarvitsevat teknistä osaamista datan analysointiin | Vähentynyt käyttö, tehottomat prosessit |

### MCP:n ratkaisu

Model Context Protocol ratkaisee nämä haasteet tarjoamalla:

- **Reaaliaikainen datan käyttö**: Tekoälyavustajat voivat tehdä kyselyitä suoraan tietokantoihin ja API-rajapintoihin
- **Turvallinen integraatio**: Hallittu pääsy autentikoinnin ja käyttöoikeuksien avulla
- **Luonnollisen kielen käyttöliittymä**: Liiketoimintakäyttäjät voivat esittää kysymyksiä tavallisella englannilla
- **Standardoitu protokolla**: Toimii eri tekoälyalustoilla ja työkaluilla

## 🏪 Tutustu Zava Retailiin: Oppimistapausesimerkki

Tämän oppimispolun aikana rakennamme MCP-palvelimen **Zava Retailille**, kuvitteelliselle DIY-vähittäismyyntiketjulle, jolla on useita myymälöitä. Tämä realistinen skenaario havainnollistaa yritystason MCP-toteutusta.

### Liiketoimintayhteys

**Zava Retail** toimii:
- **8 fyysistä myymälää** Washingtonin osavaltiossa (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 verkkokauppa** e-commerce-myyntiä varten
- **Monipuolinen tuotekatalogi**, joka sisältää työkaluja, rakennustarvikkeita, puutarhatarvikkeita ja rakennusmateriaaleja
- **Monitasoinen johtaminen**, jossa on myymäläpäälliköitä, aluepäälliköitä ja johtajia

### Liiketoimintavaatimukset

Myymäläpäälliköt ja johtajat tarvitsevat tekoälypohjaista analytiikkaa:

1. **Analysoimaan myyntisuorituskykyä** myymälöiden ja aikajaksojen välillä
2. **Seuraamaan varastotasoja** ja tunnistamaan täydennystarpeet
3. **Ymmärtämään asiakaskäyttäytymistä** ja ostotottumuksia
4. **Löytämään tuotehavaintoja** semanttisen haun avulla
5. **Luomaan raportteja** luonnollisen kielen kyselyillä
6. **Säilyttämään dataturvallisuuden** roolipohjaisella käyttöoikeuksien hallinnalla

### Teknisiä vaatimuksia

MCP-palvelimen tulee tarjota:

- **Monivuokraajapohjainen datan käyttö**, jossa myymäläpäälliköt näkevät vain oman myymälänsä datan
- **Joustavat kyselyt**, jotka tukevat monimutkaisia SQL-toimintoja
- **Semanttinen haku** tuotteiden löytämiseen ja suosituksiin
- **Reaaliaikainen data**, joka heijastaa ajankohtaista liiketoimintatilannetta
- **Turvallinen autentikointi** rivitason turvallisuuden avulla
- **Skaalautuva arkkitehtuuri**, joka tukee useita samanaikaisia käyttäjiä

## 🏗️ MCP-palvelimen arkkitehtuurin yleiskatsaus

MCP-palvelimemme toteuttaa kerrostetun arkkitehtuurin, joka on optimoitu tietokantaintegraatiota varten:

```
┌─────────────────────────────────────────────────────────────┐
│                    VS Code AI Client                       │
│                  (Natural Language Queries)                │
└─────────────────────┬───────────────────────────────────────┘
                      │ HTTP/SSE
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                     MCP Server                             │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │   Tool Layer    │ │  Security Layer │ │  Config Layer │ │
│  │                 │ │                 │ │               │ │
│  │ • Query Tools   │ │ • RLS Context   │ │ • Environment │ │
│  │ • Schema Tools  │ │ • User Identity │ │ • Connections │ │
│  │ • Search Tools  │ │ • Access Control│ │ • Validation  │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ asyncpg
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                PostgreSQL Database                         │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │  Retail Schema  │ │   RLS Policies  │ │   pgvector    │ │
│  │                 │ │                 │ │               │ │
│  │ • Stores        │ │ • Store-based   │ │ • Embeddings  │ │
│  │ • Customers     │ │   Isolation     │ │ • Similarity  │ │
│  │ • Products      │ │ • Role Control  │ │   Search      │ │
│  │ • Orders        │ │ • Audit Logs    │ │               │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ REST API
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                  Azure OpenAI                              │
│               (Text Embeddings)                            │
└─────────────────────────────────────────────────────────────┘
```

### Keskeiset komponentit

#### **1. MCP-palvelinkerros**
- **FastMCP Framework**: Moderni Python-pohjainen MCP-palvelimen toteutus
- **Työkalujen rekisteröinti**: Deklaratiiviset työkalumääritelmät tyyppiturvalla
- **Pyynnön konteksti**: Käyttäjän identiteetti ja istunnon hallinta
- **Virheenkäsittely**: Vahva virheiden hallinta ja lokitus

#### **2. Tietokantaintegraatiokerros**
- **Yhteyspoolaus**: Tehokas asyncpg-yhteyden hallinta
- **Skeematoimittaja**: Dynaaminen taulujen skeeman tunnistus
- **Kyselyn suorittaja**: Turvallinen SQL-suoritus RLS-kontekstissa
- **Transaktioiden hallinta**: ACID-vaatimustenmukaisuus ja palautuskäsittely

#### **3. Turvallisuuskerros**
- **Rivitason turvallisuus**: PostgreSQL RLS monivuokraajapohjaiseen datan eristämiseen
- **Käyttäjän identiteetti**: Myymäläpäällikön autentikointi ja valtuutus
- **Käyttöoikeuksien hallinta**: Hienojakoiset käyttöoikeudet ja auditointipolut
- **Syötteen validointi**: SQL-injektion estäminen ja kyselyiden validointi

#### **4. Tekoälyparannuskerros**
- **Semanttinen haku**: Vektoripohjaiset upotukset tuotteiden löytämiseen
- **Azure OpenAI -integraatio**: Tekstiupotusten generointi
- **Samankaltaisuusalgoritmit**: pgvector-kosinus-samankaltaisuushaku
- **Haun optimointi**: Indeksointi ja suorituskyvyn parantaminen

## 🔧 Teknologiapino

### Keskeiset teknologiat

| **Komponentti** | **Teknologia** | **Tarkoitus** |
|-----------------|----------------|---------------|
| **MCP Framework** | FastMCP (Python) | Moderni MCP-palvelimen toteutus |
| **Tietokanta** | PostgreSQL 17 + pgvector | Relaatiodata ja vektorihaku |
| **Tekoälypalvelut** | Azure OpenAI | Tekstiupotukset ja kielimallit |
| **Konttiteknologia** | Docker + Docker Compose | Kehitysympäristö |
| **Pilvialusta** | Microsoft Azure | Tuotantokäyttöönotto |
| **IDE-integraatio** | VS Code | Tekoälychat ja kehitystyönkulku |

### Kehitystyökalut

| **Työkalu** | **Tarkoitus** |
|-------------|--------------|
| **asyncpg** | Suorituskykyinen PostgreSQL-ajuri |
| **Pydantic** | Datavalidointi ja serialisointi |
| **Azure SDK** | Pilvipalveluiden integraatio |
| **pytest** | Testauskehys |
| **Docker** | Konttiteknologia ja käyttöönotto |

### Tuotantopino

| **Palvelu** | **Azure-resurssi** | **Tarkoitus** |
|-------------|--------------------|---------------|
| **Tietokanta** | Azure Database for PostgreSQL | Hallittu tietokantapalvelu |
| **Kontti** | Azure Container Apps | Palvelimettomien konttien isännöinti |
| **Tekoälypalvelut** | Azure AI Foundry | OpenAI-mallit ja päätepisteet |
| **Seuranta** | Application Insights | Havainnointi ja diagnostiikka |
| **Turvallisuus** | Azure Key Vault | Salaisuuksien ja konfiguraation hallinta |

## 🎬 Käytännön käyttötilanteet

Tutustutaan, miten eri käyttäjät vuorovaikuttavat MCP-palvelimen kanssa:

### Tilanne 1: Myymäläpäällikön suorituskyvyn tarkastelu

**Käyttäjä**: Sarah, Seattlen myymäläpäällikkö  
**Tavoite**: Analysoida viimeisen neljänneksen myyntisuorituskykyä

**Luonnollisen kielen kysely**:
> "Näytä 10 parasta tuotetta liikevaihdon perusteella myymälässäni Q4 2024"

**Mitä tapahtuu**:
1. VS Code AI Chat lähettää kyselyn MCP-palvelimelle
2. MCP-palvelin tunnistaa Sarahin myymäläkontekstin (Seattle)
3. RLS-politiikat suodattavat datan vain Seattlen myymälään
4. SQL-kysely luodaan ja suoritetaan
5. Tulokset muotoillaan ja palautetaan AI Chatiin
6. Tekoäly tarjoaa analyysin ja näkemyksiä

### Tilanne 2: Tuotteiden löytäminen semanttisella haulla

**Käyttäjä**: Mike, varastopäällikkö  
**Tavoite**: Löytää tuotteita, jotka vastaavat asiakkaan pyyntöä

**Luonnollisen kielen kysely**:
> "Mitä tuotteita myymme, jotka ovat samanlaisia kuin 'vedenpitävät sähköliittimet ulkokäyttöön'?"

**Mitä tapahtuu**:
1. Kysely käsitellään semanttisen hakutyökalun avulla
2. Azure OpenAI generoi upotusvektorin
3. pgvector suorittaa samankaltaisuushaun
4. Liittyvät tuotteet järjestetään relevanssin mukaan
5. Tulokset sisältävät tuotetiedot ja saatavuuden
6. Tekoäly ehdottaa vaihtoehtoja ja yhdistelymahdollisuuksia

### Tilanne 3: Myymälöiden välinen analytiikka

**Käyttäjä**: Jennifer, aluepäällikkö  
**Tavoite**: Verrata suorituskykyä kaikissa myymälöissä

**Luonnollisen kielen kysely**:
> "Vertaa myyntiä kategorioittain kaikissa myymälöissä viimeisen 6 kuukauden aikana"

**Mitä tapahtuu**:
1. RLS-konteksti asetetaan aluepäällikön käyttöoikeuksille
2. Monimutkainen monimyymäläkysely luodaan
3. Data yhdistetään myymäläpaikkojen välillä
4. Tulokset sisältävät trendit ja vertailut
5. Tekoäly tunnistaa näkemyksiä ja suosituksia

## 🔒 Turvallisuus ja monivuokraajapohjainen syväluotaus

Toteutuksemme painottaa yritystason turvallisuutta:

### Rivitason turvallisuus (RLS)

PostgreSQL RLS varmistaa datan eristämisen:

```sql
-- Store managers see only their store's data
CREATE POLICY store_manager_policy ON retail.orders
  FOR ALL TO store_managers
  USING (store_id = get_current_user_store());

-- Regional managers see multiple stores
CREATE POLICY regional_manager_policy ON retail.orders
  FOR ALL TO regional_managers
  USING (store_id = ANY(get_user_store_list()));
```

### Käyttäjän identiteetin hallinta

Jokainen MCP-yhteys sisältää:
- **Myymäläpäällikön ID**: Uniikki tunniste RLS-kontekstille
- **Roolin määrittely**: Käyttöoikeudet ja pääsytasot
- **Istunnon hallinta**: Turvalliset autentikointitunnukset
- **Auditointilokitus**: Täydellinen käyttöhistoria

### Datansuojelu

Useita turvallisuuskerroksia:
- **Yhteyden salaus**: TLS kaikille tietokantayhteyksille
- **SQL-injektion estäminen**: Parametrisoidut kyselyt
- **Syötteen validointi**: Kattava pyyntöjen validointi
- **Virheenkäsittely**: Ei arkaluontoista dataa virheilmoituksissa

## 🎯 Keskeiset opit

Tämän johdannon jälkeen ymmärrät:

✅ **MCP:n arvon**: Kuinka MCP yhdistää tekoälyavustajat ja todellisen maailman datan  
✅ **Liiketoimintayhteyden**: Zava Retailin vaatimukset ja haasteet  
✅ **Arkkitehtuurin yleiskatsauksen**: Keskeiset komponentit ja niiden vuorovaikutus  
✅ **Teknologiapinon**: Käytetyt työkalut ja kehykset  
✅ **Turvallisuusmallin**: Monivuokraajapohjainen datan käyttö ja suojaus  
✅ **Käyttömallit**: Käytännön kyselyskenaariot ja työnkulut  

## 🚀 Mitä seuraavaksi

Valmis sukeltamaan syvemmälle? Jatka:

**[Moduuli 01: Keskeiset arkkitehtuurikonseptit](../01-Architecture/README.md)**

Tutustu MCP-palvelimen arkkitehtuurimalleihin, tietokantasuunnitteluperiaatteisiin ja yksityiskohtaiseen tekniseen toteutukseen, joka tukee vähittäismyyntianalytiikkaratkaisuamme.

## 📚 Lisäresurssit

### MCP-dokumentaatio
- [MCP-määrittely](https://modelcontextprotocol.io/docs/) - Virallinen protokolladokumentaatio
- [MCP aloittelijoille](https://aka.ms/mcp-for-beginners) - Kattava MCP-oppimisopas
- [FastMCP-dokumentaatio](https://github.com/modelcontextprotocol/python-sdk) - Python SDK -dokumentaatio

### Tietokantaintegraatio
- [PostgreSQL-dokumentaatio](https://www.postgresql.org/docs/) - Täydellinen PostgreSQL-viite
- [pgvector-opas](https://github.com/pgvector/pgvector) - Vektorilaajennuksen dokumentaatio
- [Rivitason turvallisuus](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - PostgreSQL RLS -opas

### Azure-palvelut
- [Azure OpenAI -dokumentaatio](https://docs.microsoft.com/azure/cognitive-services/openai/) - Tekoälypalveluiden integraatio
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Hallittu tietokantapalvelu
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Palvelimettomat kontit

---

**Vastuuvapauslauseke**: Tämä on oppimisharjoitus, jossa käytetään kuvitteellista vähittäismyyntidataa. Noudata aina organisaatiosi datanhallinta- ja turvallisuuskäytäntöjä toteuttaessasi vastaavia ratkaisuja tuotantoympäristössä.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.