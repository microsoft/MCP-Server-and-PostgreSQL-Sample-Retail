<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:58:59+00:00",
  "source_file": "README.md",
  "language_code": "nl"
}
-->
# MCP Server en PostgreSQL Voorbeeld - Analyse van Retailverkopen

## Leer MCP met Database-integratie via Praktische Voorbeelden

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Volg deze stappen om aan de slag te gaan met deze bronnen:

1. **Fork de Repository**: Klik [hier om te forken](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone de Repository**: `git clone https://github.com/JOUW-GEBRUIKERSNAAM/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Word lid van de Azure AI Foundry Discord**: [Ontmoet experts en medeontwikkelaars](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Meertalige Ondersteuning

#### Ondersteund via GitHub Action (Automatisch & Altijd Actueel)

[Frans](../fr/README.md) | [Spaans](../es/README.md) | [Duits](../de/README.md) | [Russisch](../ru/README.md) | [Arabisch](../ar/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinees (Vereenvoudigd)](../zh/README.md) | [Chinees (Traditioneel, Macau)](../mo/README.md) | [Chinees (Traditioneel, Hong Kong)](../hk/README.md) | [Chinees (Traditioneel, Taiwan)](../tw/README.md) | [Japans](../ja/README.md) | [Koreaans](../ko/README.md) | [Hindi](../hi/README.md) | [Bengaals](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugees (Portugal)](../pt/README.md) | [Portugees (Brazilië)](../br/README.md) | [Italiaans](../it/README.md) | [Pools](../pl/README.md) | [Turks](../tr/README.md) | [Grieks](../el/README.md) | [Thais](../th/README.md) | [Zweeds](../sv/README.md) | [Deens](../da/README.md) | [Noors](../no/README.md) | [Fins](../fi/README.md) | [Nederlands](./README.md) | [Hebreeuws](../he/README.md) | [Vietnamees](../vi/README.md) | [Indonesisch](../id/README.md) | [Maleis](../ms/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Swahili](../sw/README.md) | [Hongaars](../hu/README.md) | [Tsjechisch](../cs/README.md) | [Slowaaks](../sk/README.md) | [Roemeens](../ro/README.md) | [Bulgaars](../bg/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Kroatisch](../hr/README.md) | [Sloveens](../sl/README.md) | [Oekraïens](../uk/README.md) | [Birmaans (Myanmar)](../my/README.md)

**Als je extra vertalingen wilt, kun je de ondersteunde talen vinden [hier](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introductie

Dit voorbeeld laat zien hoe je een uitgebreide **Model Context Protocol (MCP) server** kunt bouwen en implementeren die AI-assistenten veilige, intelligente toegang biedt tot retailverkoopdata via PostgreSQL. Het project toont functies van ondernemingsniveau, zoals **Row Level Security (RLS)**, **semantische zoekmogelijkheden**, en **Azure AI-integratie** voor real-world retailanalyses.

**Belangrijke Gebruiksscenario's:**
- **AI-gestuurde Verkoopanalyse**: AI-assistenten in staat stellen om retailverkoopdata te analyseren via natuurlijke taal
- **Veilige Multi-Tenant Toegang**: Implementatie van Row Level Security waarbij verschillende winkelmanagers alleen toegang hebben tot hun eigen winkeldata
- **Semantische Productzoekfunctie**: AI-gestuurde productontdekking met behulp van tekstembeddings
- **Integratie op Ondernemingsniveau**: Illustratie van hoe MCP-servers kunnen worden geïntegreerd met Azure-services en PostgreSQL-databases

**Perfect voor:**
- Ontwikkelaars die MCP-servers willen bouwen met database-integratie
- Data engineers die veilige multi-tenant analysemogelijkheden implementeren
- AI-applicatieontwikkelaars die werken met retail- of e-commercedata
- Iedereen die geïnteresseerd is in het combineren van AI-assistenten met ondernemingsdatabases

## Word lid van de Azure AI Foundry Discord Community
Deel je ervaringen met MCP en ontmoet experts en productgroepen 

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Verkoopanalyse MCP Server

Een Model Context Protocol (MCP) server die uitgebreide toegang biedt tot klantverkoopdatabases voor Zava Retail DIY Business. Deze server stelt AI-assistenten in staat om retailverkoopdata te analyseren via een veilige, schema-bewuste interface.

## 📚 Complete Implementatiehandleiding

Voor een gedetailleerde uitleg over hoe deze oplossing is gebouwd en hoe je soortgelijke MCP-servers kunt implementeren, zie onze uitgebreide **[Voorbeeld Walkthrough](Sample_Walkthrough.md)**. Deze handleiding biedt:

- **Architectuur Uitleg**: Analyse van componenten en ontwerpprincipes
- **Stap-voor-Stap Bouwproces**: Van projectopzet tot implementatie
- **Code Uitleg**: Gedetailleerde uitleg van MCP-serverimplementatie
- **Geavanceerde Functies**: Row Level Security, semantische zoekfunctie en monitoring
- **Best Practices**: Richtlijnen voor beveiliging, prestaties en ontwikkeling
- **Probleemoplossing**: Veelvoorkomende problemen en oplossingen

Perfect voor ontwikkelaars die de implementatiedetails willen begrijpen en soortgelijke oplossingen willen bouwen.

## 🤖 Wat is MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** is een open standaard die AI-assistenten in staat stelt om veilig toegang te krijgen tot externe databronnen en tools in real-time. Zie het als een brug die AI-modellen verbindt met databases, API's, bestandssystemen en andere bronnen, terwijl beveiliging en controle behouden blijven.

### Belangrijke Voordelen:
- **Real-time Data Toegang**: AI-assistenten kunnen live databases en API's raadplegen
- **Veilige Integratie**: Gecontroleerde toegang met authenticatie en machtigingen  
- **Tool Uitbreidbaarheid**: Voeg aangepaste mogelijkheden toe aan AI-assistenten
- **Gestandaardiseerd Protocol**: Werkt met verschillende AI-platforms en tools

### Nieuw bij MCP?

Als je nieuw bent met Model Context Protocol, raden we aan om te beginnen met Microsoft's uitgebreide beginnersbronnen:

**📖 [MCP voor Beginners Handleiding](https://aka.ms/mcp-for-beginners)**

Deze bron biedt:
- Introductie tot MCP-concepten en architectuur
- Stap-voor-stap tutorials voor het bouwen van je eerste MCP-server
- Best practices voor MCP-ontwikkeling
- Integratievoorbeelden met populaire AI-platforms
- Communitybronnen en ondersteuning

Zodra je de basis begrijpt, kom dan hier terug om deze geavanceerde retailanalyse-implementatie te verkennen!

## 📚 Uitgebreide Leerhandleiding: /walkthrough

Deze repository bevat een complete **12-module leerwalkthrough** die dit MCP-retailservervoorbeeld opsplitst in behapbare, stap-voor-stap lessen. De walkthrough transformeert dit werkende voorbeeld in een uitgebreide educatieve bron, perfect voor ontwikkelaars die willen begrijpen hoe ze productieklare MCP-servers met database-integratie kunnen bouwen.

### Wat Je Leert

De walkthrough behandelt alles, van basis MCP-concepten tot geavanceerde productie-implementatie, inclusief:

- **MCP Basisprincipes**: Begrip van het Model Context Protocol en de toepassingen in de praktijk
- **Database-integratie**: Implementatie van veilige PostgreSQL-connectiviteit met Row Level Security
- **AI-Verbeterde Functies**: Toevoegen van semantische zoekmogelijkheden met Azure OpenAI embeddings
- **Beveiligingsimplementatie**: Authenticatie, autorisatie en data-isolatie op ondernemingsniveau
- **Toolontwikkeling**: Het bouwen van geavanceerde MCP-tools voor data-analyse en bedrijfsinformatie
- **Testen & Debuggen**: Uitgebreide teststrategieën en debuggingtechnieken
- **VS Code Integratie**: Configuratie van AI Chat voor natuurlijke taal database queries
- **Productie-implementatie**: Containerisatie, schaalbaarheid en cloud-implementatiestrategieën
- **Monitoring & Observatie**: Application Insights, logging en prestatiemonitoring

### Overzicht Leerpad

De walkthrough volgt een progressieve leerstructuur, ontworpen voor ontwikkelaars van alle niveaus:

| Module | Focusgebied | Beschrijving | Tijdschatting |
|--------|-------------|--------------|---------------|
| **[00-Introductie](walkthrough/00-Introduction/README.md)** | Basis | MCP-concepten, Zava Retail casestudy, architectuuroverzicht | 30 minuten |
| **[01-Architectuur](walkthrough/01-Architecture/README.md)** | Ontwerpprincipes | Technische architectuur, gelaagd ontwerp, systeemcomponenten | 45 minuten |
| **[02-Beveiliging](walkthrough/02-Security/README.md)** | Ondernemingsbeveiliging | Azure-authenticatie, Row Level Security, multi-tenant isolatie | 60 minuten |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Omgeving | Docker setup, Azure CLI, projectconfiguratie, validatie | 45 minuten |
| **[04-Database](walkthrough/04-Database/README.md)** | Datalaag | PostgreSQL-schema, pgvector, RLS-beleid, voorbeelddata | 60 minuten |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kernimplementatie | FastMCP-framework, database-integratie, connectiebeheer | 90 minuten |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Toolontwikkeling | MCP-toolcreatie, queryvalidatie, bedrijfsinformatie functies | 75 minuten |
| **[07-Semantische Zoekfunctie](walkthrough/07-Semantic-Search/README.md)** | AI-integratie | Azure OpenAI embeddings, vectorzoekfunctie, hybride zoekstrategieën | 60 minuten |
| **[08-Testen](walkthrough/08-Testing/README.md)** | Kwaliteitsborging | Unit testing, integratietesten, prestatietesten, debugging | 75 minuten |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Ontwikkelaarservaring | VS Code configuratie, AI Chat integratie, debugging workflows | 45 minuten |
| **[10-Implementatie](walkthrough/10-Deployment/README.md)** | Productieklaar | Containerisatie, Azure Container Apps, CI/CD-pipelines, schaalbaarheid | 90 minuten |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observatie | Application Insights, gestructureerde logging, prestatiemetrics | 60 minuten |
| **[12-Best Practices](walkthrough/12-Best-Practices/README.md)** | Productie-excellentie | Beveiligingsversterking, prestatieoptimalisatie, ondernemingspatronen | 45 minuten |

**Totale Leertijd**: ~12-15 uur aan uitgebreide praktische leerervaring

### 🎯 Hoe de Walkthrough te Gebruiken

**Voor Beginners**:
1. Begin met [Module 00: Introductie](walkthrough/00-Introduction/README.md) om MCP-basisprincipes te begrijpen
2. Volg de modules in volgorde voor een complete leerervaring
3. Elke module bouwt voort op eerdere concepten en bevat praktische oefeningen

**Voor Ervaren Ontwikkelaars**:
1. Bekijk de [Hoofdoverzicht Walkthrough](walkthrough/README.md) voor een samenvatting van alle modules
2. Spring naar specifieke modules die je interesseren (bijv. Module 07 voor AI-integratie)
3. Gebruik individuele modules als referentiemateriaal voor je eigen projecten

**Voor Productie-implementatie**:
1. Focus op Modules 02 (Beveiliging), 10 (Implementatie), en 11 (Monitoring)
2. Bekijk Module 12 (Best Practices) voor richtlijnen op ondernemingsniveau
3. Gebruik de codevoorbeelden als productieklare templates

### 🚀 Snelle Startopties

**Optie 1: Compleet Leerpad** (Aanbevolen voor nieuwkomers)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Optie 2: Praktische Implementatie** (Direct beginnen met bouwen)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Optie 3: Productiefocus** (Ondernemingsimplementatie)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Leervereisten

**Aanbevolen achtergrond**:
- Basiservaring met Python-programmering
- Bekendheid met REST API's en databases
- Algemeen begrip van AI/ML-concepten
- Basiskennis van de command-line en Docker

**Niet vereist (maar handig)**:
- Eerdere MCP-ervaring (we behandelen dit vanaf het begin)
- Ervaring met Azure-cloud (we bieden stapsgewijze begeleiding)
- Geavanceerde kennis van PostgreSQL (we leggen concepten uit indien nodig)

### 💡 Leertips

1. **Praktische aanpak**: Elk module bevat werkende codevoorbeelden die je kunt uitvoeren en aanpassen
2. **Geleidelijke complexiteit**: Concepten bouwen geleidelijk op van eenvoudig naar geavanceerd
3. **Reële context**: Alle voorbeelden gebruiken realistische scenario's uit de retailsector
4. **Productieklaar**: Codevoorbeelden zijn ontworpen voor daadwerkelijk gebruik in productie
5. **Communityondersteuning**: Word lid van onze [Discord-community](https://discord.com/invite/ByRwuEEgH4) voor hulp en discussies

### 🔗 Gerelateerde bronnen

- **[MCP voor beginners](https://aka.ms/mcp-for-beginners)**: Essentiële achtergrondinformatie
- **[Voorbeeld walkthrough](Sample_Walkthrough.md)**: Technisch overzicht op hoog niveau
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloudplatform gebruikt in de voorbeelden
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP-implementatiekader

**Klaar om te beginnen?** Start met **[Module 00: Introductie](walkthrough/00-Introduction/README.md)** of bekijk het **[volledige walkthrough-overzicht](walkthrough/README.md)**.

## Vereisten

1. Docker Desktop geïnstalleerd
2. Git geïnstalleerd
3. **Azure CLI**: Installeer en log in met Azure CLI
4. Toegang tot het OpenAI-model `text-embedding-3-small` en optioneel het model `gpt-4o-mini`.

## Aan de slag

Open een terminalvenster en voer de volgende opdrachten uit:

1. Log in met Azure CLI

    ```bash
    az login
    ```

2. Clone de repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigeer naar de projectmap

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure-resources implementeren

Voer de volgende scripts uit om de implementatie van Azure-resources die nodig zijn voor de MCP-server te automatiseren.

De implementatiescripts zullen automatisch het model `text-embedding-3-small` implementeren. Tijdens de implementatie heb je de optie om ook het model `gpt-4o-mini` op te nemen. Let op: `gpt-4o-mini` is **niet vereist** voor dit project en is alleen opgenomen voor mogelijke toekomstige uitbreidingen.

**Kies het script voor jouw platform:**

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

## De MCP-server uitvoeren

De eenvoudigste manier om de volledige stack (PostgreSQL + MCP-server) uit te voeren is met Docker Compose:

### Start de stack

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

## Gebruik

De volgende stappen gaan ervan uit dat je de ingebouwde ondersteuning voor MCP-servers in VS Code gebruikt.

1. Open het project in VS Code. Voer vanuit de terminal uit:

    ```bash
    code .
    ```

2. Start een of meer MCP-servers met behulp van de configuraties in `.vscode/mcp.json`. Het bestand bevat vier verschillende serverconfiguraties, die elk een andere rol van een winkelmanager vertegenwoordigen:

   - Elke configuratie gebruikt een unieke RLS (Row Level Security) gebruikers-ID
   - Deze gebruikers-ID's simuleren verschillende identiteiten van winkelmanagers die toegang hebben tot de database
   - Het RLS-systeem beperkt de toegang tot gegevens op basis van de toegewezen winkel van de manager
   - Dit bootst realistische scenario's na waarin winkelmanagers inloggen met verschillende Entra ID-accounts

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

### Open VS Code AI Chat

1. Open de AI Chat-modus in VS Code
2. Typ **#zava** en selecteer een van de MCP-servers die je hebt gestart
3. Stel vragen over de verkoopgegevens - Zie voorbeeldvragen hieronder

### Voorbeeldvragen

1. Toon de top 20 producten op basis van omzet
1. Toon verkoop per winkel
1. Wat waren de verkoopcijfers per categorie van het afgelopen kwartaal?
1. Welke producten verkopen we die vergelijkbaar zijn met "containers voor verf"?

## Functies

- **Toegang tot meerdere tabellen**: Haal schema's op voor meerdere databasetabellen in één verzoek
- **Veilige query-uitvoering**: Voer PostgreSQL-query's uit met ondersteuning voor Row Level Security (RLS)
- **Realtime gegevens**: Toegang tot actuele verkoop-, voorraad- en klantgegevens
- **Datum/tijd-hulpmiddelen**: Verkrijg huidige UTC-tijdstempels voor tijdgevoelige analyses
- **Flexibele implementatie**: Ondersteunt HTTP-servermodus

## Ondersteunde tabellen

De server biedt toegang tot de volgende retail-databasetabellen:

- `retail.customers` - Klantinformatie en profielen
- `retail.stores` - Winkellocaties en details
- `retail.categories` - Productcategorieën en hiërarchieën
- `retail.product_types` - Classificaties van producttypen
- `retail.products` - Productcatalogus en specificaties
- `retail.orders` - Klantbestellingen en transacties
- `retail.order_items` - Individuele items binnen bestellingen
- `retail.inventory` - Huidige voorraadniveaus en voorraadgegevens

## Beschikbare tools

### `get_multiple_table_schemas`

Haal databasetabellen op voor meerdere tabellen in één verzoek.

**Parameters:**

- `table_names` (list[str]): Lijst met geldige tabelnamen van de bovenstaande ondersteunde tabellen

**Retourneert:** Gecombineerde schema-strings voor de gevraagde tabellen

### `execute_sales_query`

Voer PostgreSQL-query's uit op de verkoopdatabase met Row Level Security.

**Parameters:**

- `postgresql_query` (str): Een goed gevormde PostgreSQL-query

**Retourneert:** Queryresultaten geformatteerd als een string (beperkt tot 20 rijen voor leesbaarheid)

**Best practices:**

- Haal altijd eerst tabelschema's op
- Gebruik exacte kolomnamen uit schema's
- Combineer gerelateerde tabellen voor uitgebreide analyses
- Aggregeer resultaten waar nodig
- Beperk de uitvoer voor leesbaarheid

### `get_current_utc_date`

Verkrijg de huidige UTC-datum en -tijd in ISO-formaat.

**Retourneert:** Huidige UTC-datum/tijd in ISO-formaat (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Voer een semantische zoekopdracht uit naar producten op basis van gebruikersvragen.

**Retourneert:** Een lijst met producten die overeenkomen met de zoekcriteria

**Parameters:**

- `query` (str): De zoekopdrachtstring

**Retourneert:** Een lijst met producten die overeenkomen met de zoekcriteria

## Beveiligingsfuncties

### Row Level Security (RLS)

De server implementeert Row Level Security om ervoor te zorgen dat gebruikers alleen toegang hebben tot gegevens waarvoor ze geautoriseerd zijn:

- **HTTP-modus**: Gebruikt de `x-rls-user-id`-header om de verzoekende gebruiker te identificeren

- **Standaard fallback**: Gebruikt een placeholder UUID wanneer geen gebruikers-ID wordt verstrekt

#### Winkel-specifieke RLS-gebruikers-ID's

Elke Zava Retail-winkellocatie heeft een unieke RLS-gebruikers-ID die bepaalt welke gegevens de gebruiker kan bekijken:

| Winkellocatie | RLS-gebruikers-ID | Beschrijving |
|---------------|-------------------|--------------|
| **Globale toegang** | `00000000-0000-0000-0000-000000000000` | Standaard fallback - toegang tot alle winkels |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle winkelgegevens |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue winkelgegevens |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma winkelgegevens |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane winkelgegevens |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett winkelgegevens |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond winkelgegevens |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland winkelgegevens |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online winkelgegevens |

#### RLS-implementatie

Wanneer een gebruiker verbinding maakt met een specifieke winkel-RLS-gebruikers-ID, ziet hij alleen:

- Klanten die aan die winkel zijn gekoppeld
- Bestellingen geplaatst bij die winkellocatie
- Voorraadgegevens voor die specifieke winkel
- Winkel-specifieke verkoop- en prestatiestatistieken

Dit zorgt voor gegevensisolatie tussen verschillende winkellocaties terwijl een uniforme databasestructuur behouden blijft.

## Architectuur

### Applicatiecontext

De server gebruikt een beheerde applicatiecontext met:

- **Databaseverbindingpool**: Efficiënt beheer van verbindingen voor HTTP-modus
- **Levenscyclusbeheer**: Correcte opruiming van resources bij afsluiten
- **Typeveiligheid**: Sterk getypeerde context met `AppContext` dataclass

### Verzoekcontext

- **Headerextractie**: Veilige header parsing voor gebruikersidentificatie
- **RLS-integratie**: Automatische gebruikers-ID-resolutie vanuit de verzoekcontext
- **Foutafhandeling**: Uitgebreide foutafhandeling met gebruiksvriendelijke berichten

## Database-integratie

De server integreert met een PostgreSQL-database via de klasse `PostgreSQLSchemaProvider`:

- **Verbindingspooling**: Gebruikt asynchrone verbindingspools voor schaalbaarheid
- **Schema-metadata**: Biedt gedetailleerde informatie over tabelschema's
- **Query-uitvoering**: Veilige query-uitvoering met RLS-ondersteuning
- **Resourcebeheer**: Automatische opruiming van databasebronnen

## Foutafhandeling

De server implementeert robuuste foutafhandeling:

- **Tabelvalidatie**: Zorgt ervoor dat alleen geldige tabelnamen worden benaderd
- **Queryvalidatie**: Valideert PostgreSQL-query's voordat ze worden uitgevoerd
- **Resourcebeheer**: Correcte opruiming, zelfs tijdens fouten
- **Gebruiksvriendelijke berichten**: Duidelijke foutmeldingen voor probleemoplossing

## Beveiligingsoverwegingen

1. **Row Level Security**: Alle query's respecteren RLS-beleid op basis van gebruikersidentiteit
2. **Gegevensisolatie per winkel**: Elke winkel-RLS-gebruikers-ID zorgt ervoor dat alleen gegevens van die winkel toegankelijk zijn
3. **Invoervalidatie**: Tabelnamen en query's worden gevalideerd voordat ze worden uitgevoerd
4. **Resourcebeperkingen**: Queryresultaten zijn beperkt om overmatig gebruik van resources te voorkomen
5. **Veilige verbindingen**: Gebruikt veilige databaseverbindingen
6. **Verificatie van gebruikersidentiteit**: Zorg altijd dat de juiste RLS-gebruikers-ID wordt gebruikt voor de beoogde winkellocatie

### Belangrijke beveiligingsnotities

- **Gebruik nooit productie-RLS-gebruikers-ID's in ontwikkelomgevingen**
- **Controleer altijd of de RLS-gebruikers-ID overeenkomt met de beoogde winkel voordat je query's uitvoert**
- **De standaard UUID (`00000000-0000-0000-0000-000000000000`) biedt beperkte toegang**
- **Elke winkelmanager mag alleen toegang hebben tot de RLS-gebruikers-ID van zijn winkel**

## Ontwikkeling

### Projectstructuur

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Belangrijke componenten

- **FastMCP-server**: Moderne MCP-serverimplementatie met ondersteuning voor async
- **PostgreSQL-provider**: Database-abstractielaag met RLS-ondersteuning
- **Contextbeheer**: Typeveilig applicatie- en verzoekcontextbeheer
- **Toolregistratie**: Declaratieve toolregistratie met Pydantic-validatie

## Bijdragen

Bij het bijdragen aan deze server:

1. Zorg ervoor dat alle databasequery's Row Level Security respecteren
2. Voeg correcte foutafhandeling toe voor nieuwe tools
3. Werk deze README bij met nieuwe functies of wijzigingen
4. Test de HTTP-servermodus
5. Valideer invoerparameters en geef duidelijke foutmeldingen

## [Licentie](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Deze MCP-server biedt veilige, efficiënte toegang tot Zava Retail-verkoopgegevens voor AI-gestuurde analyses en inzichten.*

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.