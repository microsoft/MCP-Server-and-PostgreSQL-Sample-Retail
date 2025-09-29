<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T21:43:27+00:00",
  "source_file": "README.md",
  "language_code": "da"
}
-->
# MCP Server og PostgreSQL Eksempel - Analyse af Detailhandelssalg

## Lær MCP med databaseintegration gennem praktiske eksempler

[![GitHub bidragydere](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub problemer](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Velkommen](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Følg disse trin for at komme i gang med at bruge disse ressourcer:

1. **Fork Repository**: Klik [her for at fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Join Azure AI Foundry Discord**: [Mød eksperter og andre udviklere](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Flersproget Support

#### Understøttet via GitHub Action (Automatisk & Altid Opdateret)

[Fransk](../fr/README.md) | [Spansk](../es/README.md) | [Tysk](../de/README.md) | [Russisk](../ru/README.md) | [Arabisk](../ar/README.md) | [Persisk (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinesisk (Forenklet)](../zh/README.md) | [Kinesisk (Traditionelt, Macau)](../mo/README.md) | [Kinesisk (Traditionelt, Hong Kong)](../hk/README.md) | [Kinesisk (Traditionelt, Taiwan)](../tw/README.md) | [Japansk](../ja/README.md) | [Koreansk](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugisisk (Portugal)](../pt/README.md) | [Portugisisk (Brasilien)](../br/README.md) | [Italiensk](../it/README.md) | [Polsk](../pl/README.md) | [Tyrkisk](../tr/README.md) | [Græsk](../el/README.md) | [Thai](../th/README.md) | [Svensk](../sv/README.md) | [Dansk](./README.md) | [Norsk](../no/README.md) | [Finsk](../fi/README.md) | [Hollandsk](../nl/README.md) | [Hebraisk](../he/README.md) | [Vietnamesisk](../vi/README.md) | [Indonesisk](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungarsk](../hu/README.md) | [Tjekkisk](../cs/README.md) | [Slovakisk](../sk/README.md) | [Rumænsk](../ro/README.md) | [Bulgarsk](../bg/README.md) | [Serbisk (Kyrillisk)](../sr/README.md) | [Kroatisk](../hr/README.md) | [Slovensk](../sl/README.md) | [Ukrainsk](../uk/README.md) | [Burmesisk (Myanmar)](../my/README.md)

**Hvis du ønsker yderligere oversættelser, er understøttede sprog listet [her](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduktion

Dette eksempel viser, hvordan man bygger og implementerer en omfattende **Model Context Protocol (MCP) server**, der giver AI-assistenter sikker og intelligent adgang til detailhandelsdata via PostgreSQL. Projektet fremhæver funktioner i virksomhedsklasse, herunder **Row Level Security (RLS)**, **semantisk søgning** og **Azure AI-integration** til virkelige scenarier inden for detailanalyse.

**Vigtige anvendelsesområder:**
- **AI-drevet salgsanalyse**: Gør det muligt for AI-assistenter at forespørge og analysere detailhandelsdata via naturligt sprog
- **Sikker multi-lejer adgang**: Demonstrer implementering af Row Level Security, hvor forskellige butikschefer kun kan få adgang til deres egen butiks data
- **Semantisk produktsøgning**: Fremvis AI-forbedret produktopdagelse ved hjælp af tekstindlejring
- **Integration i virksomheder**: Illustrer, hvordan MCP-servere integreres med Azure-tjenester og PostgreSQL-databaser

**Perfekt til:**
- Udviklere, der lærer at bygge MCP-servere med databaseintegration
- Dataingeniører, der implementerer sikre multi-lejer analysetjenester
- AI-applikationsudviklere, der arbejder med detail- eller e-handelsdata
- Alle, der er interesseret i at kombinere AI-assistenter med virksomhedsdatabaser

## Bliv en del af Azure AI Foundry Discord-fællesskabet
Del dine erfaringer med MCP og mød eksperter og produktgrupper

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Salgsanalyse MCP Server

En Model Context Protocol (MCP) server, der giver omfattende adgang til kundesalgsdatabasen for Zava Retail DIY Business. Denne server gør det muligt for AI-assistenter at forespørge og analysere detailhandelsdata via en sikker, skema-bevidst grænseflade.

## 📚 Komplet Implementeringsguide

For en detaljeret gennemgang af, hvordan denne løsning er bygget, og hvordan man implementerer lignende MCP-servere, se vores omfattende **[Eksempel Walkthrough](Sample_Walkthrough.md)**. Guiden indeholder:

- **Arkitekturdybdegående**: Komponentanalyse og designmønstre
- **Trin-for-trin opbygning**: Fra projektopsætning til implementering
- **Kodegennemgang**: Detaljeret forklaring af MCP-serverimplementering
- **Avancerede funktioner**: Row Level Security, semantisk søgning og overvågning
- **Bedste praksis**: Sikkerhed, ydeevne og udviklingsretningslinjer
- **Fejlfinding**: Almindelige problemer og løsninger

Perfekt til udviklere, der ønsker at forstå implementeringsdetaljer og bygge lignende løsninger.

## 🤖 Hvad er MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** er en åben standard, der gør det muligt for AI-assistenter at få sikker adgang til eksterne datakilder og værktøjer i realtid. Tænk på det som en bro, der gør det muligt for AI-modeller at forbinde med databaser, API'er, filsystemer og andre ressourcer, mens sikkerhed og kontrol opretholdes.

### Vigtige fordele:
- **Adgang til data i realtid**: AI-assistenter kan forespørge live databaser og API'er
- **Sikker integration**: Kontrolleret adgang med autentificering og tilladelser  
- **Udvidelse af værktøjer**: Tilføj brugerdefinerede funktioner til AI-assistenter
- **Standardiseret protokol**: Fungerer på tværs af forskellige AI-platforme og værktøjer

### Ny til MCP?

Hvis du er ny til Model Context Protocol, anbefaler vi at starte med Microsofts omfattende begynderressourcer:

**📖 [MCP for Begyndere Guide](https://aka.ms/mcp-for-beginners)**

Denne ressource tilbyder:
- Introduktion til MCP-koncept og arkitektur
- Trin-for-trin vejledninger til at bygge din første MCP-server
- Bedste praksis for MCP-udvikling
- Integrations-eksempler med populære AI-platforme
- Fællesskabsressourcer og support

Når du har forstået det grundlæggende, kan du vende tilbage hertil for at udforske denne avancerede detailhandelsanalyse-implementering!

## 📚 Omfattende Læringsguide: /walkthrough

Dette repository inkluderer en komplet **12-modulers læringswalkthrough**, der nedbryder dette MCP-detailservereksempel i fordøjelige, trin-for-trin lektioner. Walkthrough'en forvandler dette fungerende eksempel til en omfattende uddannelsesressource, perfekt til udviklere, der ønsker at forstå, hvordan man bygger produktionsklare MCP-servere med databaseintegration.

### Hvad du vil lære

Walkthrough'en dækker alt fra grundlæggende MCP-koncept til avanceret produktionsimplementering, herunder:

- **MCP Grundlæggende**: Forstå Model Context Protocol og dens anvendelser i virkeligheden
- **Databaseintegration**: Implementering af sikker PostgreSQL-forbindelse med Row Level Security
- **AI-forbedrede funktioner**: Tilføjelse af semantisk søgefunktion med Azure OpenAI-indlejring
- **Sikkerhedsimplementering**: Autentificering, autorisation og dataisolering på virksomhedsniveau
- **Udvikling af værktøjer**: Bygning af avancerede MCP-værktøjer til dataanalyse og forretningsintelligens
- **Test & Fejlfinding**: Omfattende teststrategier og fejlfindingsteknikker
- **VS Code Integration**: Konfiguration af AI Chat til naturlige sprog databaseforespørgsler
- **Produktionsimplementering**: Containerisering, skalering og cloud-implementeringsstrategier
- **Overvågning & Observabilitet**: Application Insights, logning og ydeevneovervågning

### Læringssti Oversigt

Walkthrough'en følger en progressiv læringsstruktur designet til udviklere på alle niveauer:

| Modul | Fokusområde | Beskrivelse | Tidsestimat |
|-------|-------------|-------------|-------------|
| **[00-Introduktion](walkthrough/00-Introduction/README.md)** | Fundament | MCP-koncept, Zava Retail case study, arkitekturoversigt | 30 minutter |
| **[01-Arkitektur](walkthrough/01-Architecture/README.md)** | Designmønstre | Teknisk arkitektur, lagdelt design, systemkomponenter | 45 minutter |
| **[02-Sikkerhed](walkthrough/02-Security/README.md)** | Virksomhedssikkerhed | Azure-autentificering, Row Level Security, multi-lejer isolation | 60 minutter |
| **[03-Opsætning](walkthrough/03-Setup/README.md)** | Miljø | Docker-opsætning, Azure CLI, projektkonfiguration, validering | 45 minutter |
| **[04-Database](walkthrough/04-Database/README.md)** | Databaselag | PostgreSQL-skema, pgvector, RLS-politikker, eksempeldata | 60 minutter |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kerneimplementering | FastMCP-framework, databaseintegration, forbindelsesstyring | 90 minutter |
| **[06-Værktøjer](walkthrough/06-Tools/README.md)** | Udvikling af værktøjer | MCP-værktøjsoprettelse, forespørgselsvalidering, forretningsintelligensfunktioner | 75 minutter |
| **[07-Semantisk-Søgning](walkthrough/07-Semantic-Search/README.md)** | AI-integration | Azure OpenAI-indlejring, vektorsøgning, hybride søgestrategier | 60 minutter |
| **[08-Testning](walkthrough/08-Testing/README.md)** | Kvalitetssikring | Enhedstest, integrationstest, ydeevnetest, fejlfinding | 75 minutter |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Udviklingsoplevelse | VS Code-konfiguration, AI Chat-integration, fejlsøgningsarbejdsgange | 45 minutter |
| **[10-Implementering](walkthrough/10-Deployment/README.md)** | Produktionsklar | Containerisering, Azure Container Apps, CI/CD-pipelines, skalering | 90 minutter |
| **[11-Overvågning](walkthrough/11-Monitoring/README.md)** | Observabilitet | Application Insights, struktureret logning, ydeevnemålinger | 60 minutter |
| **[12-Bedste-Praksis](walkthrough/12-Best-Practices/README.md)** | Produktionskvalitet | Sikkerhedshærdning, ydeevneoptimering, virksomhedsmønstre | 45 minutter |

**Samlet Læringstid**: ~12-15 timers omfattende praktisk læring

### 🎯 Sådan bruger du walkthrough'en

**For begyndere**:
1. Start med [Modul 00: Introduktion](walkthrough/00-Introduction/README.md) for at forstå MCP-grundlæggende
2. Følg modulerne sekventielt for en komplet læringsoplevelse
3. Hvert modul bygger på tidligere koncepter og inkluderer praktiske øvelser

**For erfarne udviklere**:
1. Gennemgå [Hovedoversigt for Walkthrough](walkthrough/README.md) for en komplet moduloversigt
2. Spring til specifikke moduler, der interesserer dig (f.eks. Modul 07 for AI-integration)
3. Brug individuelle moduler som referencemateriale til dine egne projekter

**For produktionsimplementering**:
1. Fokusér på Modulerne 02 (Sikkerhed), 10 (Implementering) og 11 (Overvågning)
2. Gennemgå Modul 12 (Bedste Praksis) for retningslinjer til virksomheder
3. Brug kodeeksemplerne som produktionsklare skabeloner

### 🚀 Hurtige Startmuligheder

**Option 1: Komplet Læringssti** (Anbefalet for nybegyndere)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Option 2: Praktisk Implementering** (Spring direkte ind i opbygning)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Option 3: Produktionsfokus** (Implementering i virksomheder)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Læringsforudsætninger

**Anbefalet baggrund**:
- Grundlæggende erfaring med Python-programmering
- Kendskab til REST API'er og databaser
- Generel forståelse af AI/ML-koncepter
- Grundlæggende viden om kommandolinjen og Docker

**Ikke påkrævet (men nyttigt)**:
- Tidligere MCP-erfaring (vi starter fra bunden)
- Erfaring med Azure cloud (vi giver trin-for-trin vejledning)
- Avanceret PostgreSQL-viden (vi forklarer begreber efter behov)

### 💡 Læringstips

1. **Praktisk tilgang**: Hvert modul indeholder fungerende kodeeksempler, du kan køre og ændre
2. **Progressiv kompleksitet**: Begreber bygger gradvist fra simple til avancerede
3. **Virkelighedsnære eksempler**: Alle eksempler bruger realistiske scenarier fra detailbranchen
4. **Klar til produktion**: Kodeeksempler er designet til faktisk produktionsbrug
5. **Fællesskabsstøtte**: Deltag i vores [Discord-fællesskab](https://discord.com/invite/ByRwuEEgH4) for hjælp og diskussioner

### 🔗 Relaterede ressourcer

- **[MCP for begyndere](https://aka.ms/mcp-for-beginners)**: Grundlæggende læsning
- **[Eksempelgennemgang](Sample_Walkthrough.md)**: Teknisk overblik på højt niveau
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloud-platformen brugt i eksemplerne
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP-implementeringsframework

**Klar til at starte?** Begynd med **[Modul 00: Introduktion](walkthrough/00-Introduction/README.md)** eller udforsk **[den komplette gennemgangsoversigt](walkthrough/README.md)**.

## Forudsætninger

1. Docker Desktop installeret
2. Git installeret
3. **Azure CLI**: Installer og autentificer med Azure CLI
4. Adgang til OpenAI `text-embedding-3-small`-modellen og eventuelt `gpt-4o-mini`-modellen.

## Kom godt i gang

Åbn et terminalvindue og kør følgende kommandoer:

1. Autentificer med Azure CLI

    ```bash
    az login
    ```

2. Klon repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Naviger til projektmappen

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Udrul Azure-ressourcer

Kør følgende scripts for at automatisere udrulningen af de Azure-ressourcer, der er nødvendige for MCP-serveren.

Udrulningsscriptsene vil automatisk udrulle `text-embedding-3-small`-modellen. Under udrulningen har du mulighed for også at inkludere `gpt-4o-mini`-modellen. Bemærk, at `gpt-4o-mini` **ikke er påkrævet** for dette projekt og kun er inkluderet for potentielle fremtidige forbedringer.

**Vælg scriptet til din platform:**

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

## Kør MCP-serveren

Den nemmeste måde at køre hele stakken (PostgreSQL + MCP-server) er ved hjælp af Docker Compose:

### Start stakken

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

## Brug

Følgende antager, at du vil bruge den indbyggede VS Code MCP-serverunderstøttelse.

1. Åbn projektet i VS Code. Fra terminalen, kør:

    ```bash
    code .
    ```

2. Start en eller flere MCP-servere ved hjælp af konfigurationerne i `.vscode/mcp.json`. Filen indeholder fire forskellige serverkonfigurationer, der hver repræsenterer en anden butikschefrolle:

   - Hver konfiguration bruger en unik RLS (Row Level Security) bruger-ID
   - Disse bruger-ID'er simulerer forskellige butikschefidentiteter, der får adgang til databasen
   - RLS-systemet begrænser dataadgang baseret på chefens tildelte butik
   - Dette efterligner virkelighedsnære scenarier, hvor butikschefer logger ind med forskellige Entra ID-konti

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

### Åbn VS Code AI Chat

1. Åbn AI Chat-tilstand i VS Code
2. Skriv **#zava** og vælg en af de MCP-servere, du startede
3. Stil spørgsmål om salgsdata - Se eksempler på forespørgsler nedenfor

### Eksempler på forespørgsler

1. Vis de 20 mest solgte produkter efter omsætning
1. Vis salg pr. butik
1. Hvad var sidste kvartals salg opdelt efter kategori?
1. Hvilke produkter sælger vi, der ligner "beholdere til maling"?

## Funktioner

- **Adgang til flere tabeller**: Hent skemaer for flere databastabeller i én forespørgsel
- **Sikker forespørgselsudførelse**: Udfør PostgreSQL-forespørgsler med Row Level Security (RLS)-understøttelse
- **Realtidsdata**: Få adgang til aktuelle salgs-, lager- og kundedata
- **Dato/tid-værktøjer**: Få aktuelle UTC-tidsstempler til tidsfølsom analyse
- **Fleksibel udrulning**: Understøtter HTTP-servertilstand

## Understøttede tabeller

Serveren giver adgang til følgende detaildatabastabeller:

- `retail.customers` - Kundeinformation og profiler
- `retail.stores` - Butiksplaceringer og detaljer
- `retail.categories` - Produktkategorier og hierarkier
- `retail.product_types` - Klassifikationer af produkttyper
- `retail.products` - Produktkatalog og specifikationer
- `retail.orders` - Kundeordrer og transaktioner
- `retail.order_items` - Individuelle varer i ordrer
- `retail.inventory` - Aktuelle lagerbeholdninger og lagerdata

## Tilgængelige værktøjer

### `get_multiple_table_schemas`

Hent databasskemaer for flere tabeller i én forespørgsel.

**Parametre:**

- `table_names` (list[str]): Liste over gyldige tabelnavne fra de understøttede tabeller ovenfor

**Returnerer:** Sammenkædede skemastrenge for de ønskede tabeller

### `execute_sales_query`

Udfør PostgreSQL-forespørgsler mod salgsdatabasen med Row Level Security.

**Parametre:**

- `postgresql_query` (str): En korrekt formuleret PostgreSQL-forespørgsel

**Returnerer:** Forespørgselsresultater formateret som en streng (begrænset til 20 rækker for læsbarhed)

**Bedste praksis:**

- Hent altid tabelskemaer først
- Brug præcise kolonnenavne fra skemaerne
- Slå relaterede tabeller sammen for omfattende analyse
- Aggreger resultater, når det er passende
- Begræns output for læsbarhed

### `get_current_utc_date`

Få den aktuelle UTC-dato og -tid i ISO-format.

**Returnerer:** Aktuel UTC-dato/tid i ISO-format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Udfør en semantisk søgning efter produkter baseret på brugerforespørgsler.

**Returnerer:** En liste over produkter, der matcher søgekriterierne

**Parametre:**

- `query` (str): Søgeforespørgselsstrengen

**Returnerer:** En liste over produkter, der matcher søgekriterierne

## Sikkerhedsfunktioner

### Row Level Security (RLS)

Serveren implementerer Row Level Security for at sikre, at brugere kun får adgang til data, de er autoriseret til at se:

- **HTTP-tilstand**: Bruger `x-rls-user-id`-headeren til at identificere den anmodende bruger

- **Standardtilfælde**: Bruger en pladsholder-UUID, når ingen bruger-ID er angivet

#### Butiksspecifikke RLS-bruger-ID'er

Hver Zava Retail-butikslokation har en unik RLS-bruger-ID, der bestemmer, hvilke data brugeren kan få adgang til:

| Butikslokation | RLS-bruger-ID | Beskrivelse |
|----------------|---------------|-------------|
| **Global adgang** | `00000000-0000-0000-0000-000000000000` | Standardtilfælde - adgang til alle butikker |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle-butik data |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue-butik data |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma-butik data |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane-butik data |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett-butik data |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond-butik data |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland-butik data |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online-butik data |

#### RLS-implementering

Når en bruger opretter forbindelse med en specifik butiks RLS-bruger-ID, vil de kun se:

- Kunder tilknyttet den butik
- Ordrer placeret i den butik
- Lagerdata for den specifikke butik
- Butiksspecifikke salgs- og præstationsmålinger

Dette sikrer dataisolering mellem forskellige butikslokationer, samtidig med at der opretholdes et samlet databaseskema.

## Arkitektur

### Applikationskontekst

Serveren bruger en administreret applikationskontekst med:

- **Databaseforbindelsespulje**: Effektiv forbindelseshåndtering for HTTP-tilstand
- **Livscyklushåndtering**: Korrekt oprydning af ressourcer ved nedlukning
- **Type-sikkerhed**: Stærkt typet kontekst med `AppContext` dataclass

### Forespørgselskontekst

- **Headerudtrækning**: Sikker header-parsing for brugeridentifikation
- **RLS-integration**: Automatisk bruger-ID-opløsning fra forespørgselskontekst
- **Fejlhåndtering**: Omfattende fejlhåndtering med brugervenlige beskeder

## Databaseintegration

Serveren integreres med en PostgreSQL-database via klassen `PostgreSQLSchemaProvider`:

- **Forbindelsespuljer**: Bruger asynkrone forbindelsespuljer for skalerbarhed
- **Skemametadata**: Giver detaljeret tabelskemainformation
- **Forespørgselsudførelse**: Sikker forespørgselsudførelse med RLS-understøttelse
- **Ressourcehåndtering**: Automatisk oprydning af databaseressourcer

## Fejlhåndtering

Serveren implementerer robust fejlhåndtering:

- **Tabelvalidering**: Sikrer, at kun gyldige tabelnavne tilgås
- **Forespørgselsvalidering**: Validerer PostgreSQL-forespørgsler før udførelse
- **Ressourcehåndtering**: Korrekt oprydning, selv under fejl
- **Brugervenlige beskeder**: Klare fejlmeddelelser til fejlfinding

## Sikkerhedsovervejelser

1. **Row Level Security**: Alle forespørgsler respekterer RLS-politikker baseret på brugeridentitet
2. **Butiksdataisolering**: Hver butiks RLS-bruger-ID sikrer adgang kun til den butiks data
3. **Inputvalidering**: Tabelnavne og forespørgsler valideres før udførelse
4. **Ressourcebegrænsninger**: Forespørgselsresultater begrænses for at forhindre overdreven ressourcebrug
5. **Forbindelsessikkerhed**: Bruger sikre databaseforbindelsespraksisser
6. **Brugeridentitetsverifikation**: Sørg altid for, at den korrekte RLS-bruger-ID bruges til den tilsigtede butikslokation

### Vigtige sikkerhedsnoter

- **Brug aldrig produktions-RLS-bruger-ID'er i udviklingsmiljøer**
- **Bekræft altid, at RLS-bruger-ID'et matcher den tilsigtede butik, før du kører forespørgsler**
- **Standard-UUID (`00000000-0000-0000-0000-000000000000`) giver begrænset adgang**
- **Hver butikschef bør kun have adgang til deres butiks RLS-bruger-ID**

## Udvikling

### Projektstruktur

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Nøglekomponenter

- **FastMCP-server**: Moderne MCP-serverimplementering med asynkron understøttelse
- **PostgreSQL-leverandør**: Databaseabstraktionslag med RLS-understøttelse
- **Konteksthåndtering**: Type-sikker applikations- og forespørgselskonteksthåndtering
- **Værktøjsregistrering**: Deklarativ værktøjsregistrering med Pydantic-validering

## Bidrag

Når du bidrager til denne server:

1. Sørg for, at alle databaseforespørgsler respekterer Row Level Security
2. Tilføj korrekt fejlhåndtering for nye værktøjer
3. Opdater denne README med eventuelle nye funktioner eller ændringer
4. Test HTTP-servertilstand
5. Valider inputparametre og giv klare fejlmeddelelser

## [Licens](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Denne MCP-server muliggør sikker, effektiv adgang til Zava Retail-salgsdata for AI-drevet analyse og indsigt.*

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.