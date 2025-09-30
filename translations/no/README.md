<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:55:59+00:00",
  "source_file": "README.md",
  "language_code": "no"
}
-->
# MCP Server og PostgreSQL Eksempel - Analyse av Butikksalg

## Lær MCP med Databaseintegrasjon gjennom Praktiske Eksempler

[![GitHub bidragsytere](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub problemer](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Velkommen](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Bli med på Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Følg disse stegene for å komme i gang med ressursene:

1. **Fork Repository**: Klikk [her for å fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klon Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Bli med på Azure AI Foundry Discord**: [Møt eksperter og andre utviklere](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Støtte for Flere Språk

#### Støttet via GitHub Action (Automatisk og Alltid Oppdatert)

[Fransk](../fr/README.md) | [Spansk](../es/README.md) | [Tysk](../de/README.md) | [Russisk](../ru/README.md) | [Arabisk](../ar/README.md) | [Persisk (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinesisk (Forenklet)](../zh/README.md) | [Kinesisk (Tradisjonell, Macau)](../mo/README.md) | [Kinesisk (Tradisjonell, Hong Kong)](../hk/README.md) | [Kinesisk (Tradisjonell, Taiwan)](../tw/README.md) | [Japansk](../ja/README.md) | [Koreansk](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugisisk (Portugal)](../pt/README.md) | [Portugisisk (Brasil)](../br/README.md) | [Italiensk](../it/README.md) | [Polsk](../pl/README.md) | [Tyrkisk](../tr/README.md) | [Gresk](../el/README.md) | [Thai](../th/README.md) | [Svensk](../sv/README.md) | [Dansk](../da/README.md) | [Norsk](./README.md) | [Finsk](../fi/README.md) | [Nederlandsk](../nl/README.md) | [Hebraisk](../he/README.md) | [Vietnamesisk](../vi/README.md) | [Indonesisk](../id/README.md) | [Malayisk](../ms/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungarsk](../hu/README.md) | [Tsjekkisk](../cs/README.md) | [Slovakisk](../sk/README.md) | [Rumensk](../ro/README.md) | [Bulgarsk](../bg/README.md) | [Serbisk (Kyrillisk)](../sr/README.md) | [Kroatisk](../hr/README.md) | [Slovensk](../sl/README.md) | [Ukrainsk](../uk/README.md) | [Burmesisk (Myanmar)](../my/README.md)

**Hvis du ønsker støtte for flere språk, finner du en liste [her](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduksjon

Dette eksempelet viser hvordan man bygger og distribuerer en omfattende **Model Context Protocol (MCP) server** som gir AI-assistenter sikker og intelligent tilgang til butikksalgsdata via PostgreSQL. Prosjektet demonstrerer funksjoner på bedriftsnivå, inkludert **Row Level Security (RLS)**, **semantisk søkefunksjonalitet**, og **Azure AI-integrasjon** for virkelige scenarier innen butikkanalyse.

**Viktige Bruksområder:**
- **AI-drevet Salgsanalyse**: Gjør det mulig for AI-assistenter å spørre og analysere butikksalgsdata med naturlig språk
- **Sikker Multi-Tenant Tilgang**: Demonstrer implementering av Row Level Security der ulike butikksjefer kun kan få tilgang til data fra sin egen butikk
- **Semantisk Produktsøk**: Vis frem AI-forbedret produktoppdagelse ved hjelp av tekstembeddings
- **Bedriftsintegrasjon**: Illustrer hvordan MCP-servere kan integreres med Azure-tjenester og PostgreSQL-databaser

**Perfekt for:**
- Utviklere som ønsker å lære å bygge MCP-servere med databaseintegrasjon
- Dataingeniører som implementerer sikre multi-tenant analysetjenester
- AI-applikasjonsutviklere som jobber med butikk- eller e-handelsdata
- Alle som er interessert i å kombinere AI-assistenter med bedriftsdatabaser

## Bli med i Azure AI Foundry Discord Community
Del dine erfaringer med MCP og møt eksperter og produktgrupper 

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server for Salgsanalyse

En Model Context Protocol (MCP) server som gir omfattende tilgang til kundesalgsdatabasen for Zava Retail DIY Business. Denne serveren gjør det mulig for AI-assistenter å spørre og analysere butikksalgsdata gjennom et sikkert, schema-bevisst grensesnitt.

## 📚 Komplett Implementeringsguide

For en detaljert gjennomgang av hvordan denne løsningen er bygget og hvordan man implementerer lignende MCP-servere, se vår omfattende **[Eksempelgjennomgang](Sample_Walkthrough.md)**. Denne guiden gir:

- **Arkitekturdybde**: Komponentanalyse og designmønstre
- **Trinnvis Bygging**: Fra prosjektoppsett til distribusjon
- **Kodegjennomgang**: Detaljert forklaring av MCP-serverimplementering
- **Avanserte Funksjoner**: Row Level Security, semantisk søk, og overvåking
- **Beste Praksis**: Sikkerhet, ytelse, og utviklingsretningslinjer
- **Feilsøking**: Vanlige problemer og løsninger

Perfekt for utviklere som ønsker å forstå implementeringsdetaljer og bygge lignende løsninger.

## 🤖 Hva er MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** er en åpen standard som gjør det mulig for AI-assistenter å få sikker tilgang til eksterne datakilder og verktøy i sanntid. Tenk på det som en bro som lar AI-modeller koble seg til databaser, API-er, filsystemer og andre ressurser samtidig som sikkerhet og kontroll opprettholdes.

### Viktige Fordeler:
- **Sanntids Data Tilgang**: AI-assistenter kan spørre live databaser og API-er
- **Sikker Integrasjon**: Kontrollert tilgang med autentisering og tillatelser  
- **Verktøyutvidelse**: Legg til egendefinerte funksjoner for AI-assistenter
- **Standardisert Protokoll**: Fungerer på tvers av ulike AI-plattformer og verktøy

### Ny til MCP?

Hvis du er ny til Model Context Protocol, anbefaler vi å starte med Microsofts omfattende nybegynnerressurser:

**📖 [MCP for Nybegynnere Guide](https://aka.ms/mcp-for-beginners)**

Denne ressursen gir:
- Introduksjon til MCP-konsepter og arkitektur
- Trinnvise opplæringer for å bygge din første MCP-server
- Beste praksis for MCP-utvikling
- Integrasjonseksempler med populære AI-plattformer
- Fellesskapsressurser og støtte

Når du har forstått det grunnleggende, kan du komme tilbake hit for å utforske denne avanserte butikkanalyseløsningen!

## 📚 Omfattende Læringsguide: /walkthrough

Dette repositoriet inkluderer en komplett **12-modulers læringsgjennomgang** som bryter ned denne MCP butikkserveren til fordøyelige, trinnvise leksjoner. Gjennomgangen forvandler dette fungerende eksempelet til en omfattende pedagogisk ressurs perfekt for utviklere som ønsker å forstå hvordan man bygger produksjonsklare MCP-servere med databaseintegrasjon.

### Hva Du Vil Lære

Gjennomgangen dekker alt fra grunnleggende MCP-konsepter til avansert produksjonsdistribusjon, inkludert:

- **MCP Grunnleggende**: Forstå Model Context Protocol og dens virkelige applikasjoner
- **Databaseintegrasjon**: Implementere sikker PostgreSQL-tilkobling med Row Level Security
- **AI-forbedrede Funksjoner**: Legge til semantisk søkefunksjonalitet med Azure OpenAI embeddings
- **Sikkerhetsimplementering**: Autentisering, autorisasjon og dataisolasjon på bedriftsnivå
- **Verktøyutvikling**: Bygge sofistikerte MCP-verktøy for dataanalyse og forretningsintelligens
- **Testing og Feilsøking**: Omfattende teststrategier og feilsøkingsmetoder
- **VS Code Integrasjon**: Konfigurere AI Chat for naturlige språkspørringer mot databasen
- **Produksjonsdistribusjon**: Containerisering, skalering og distribusjonsstrategier i skyen
- **Overvåking og Observasjon**: Application Insights, logging og ytelsesovervåking

### Læringssti Oversikt

Gjennomgangen følger en progressiv læringsstruktur designet for utviklere på alle ferdighetsnivåer:

| Modul | Fokusområde | Beskrivelse | Tidsestimat |
|-------|-------------|-------------|-------------|
| **[00-Introduksjon](walkthrough/00-Introduction/README.md)** | Grunnlag | MCP-konsepter, Zava Retail case study, arkitekturoversikt | 30 minutter |
| **[01-Arkitektur](walkthrough/01-Architecture/README.md)** | Designmønstre | Teknisk arkitektur, lagdelt design, systemkomponenter | 45 minutter |
| **[02-Sikkerhet](walkthrough/02-Security/README.md)** | Bedriftssikkerhet | Azure-autentisering, Row Level Security, multi-tenant isolasjon | 60 minutter |
| **[03-Oppsett](walkthrough/03-Setup/README.md)** | Miljø | Docker-oppsett, Azure CLI, prosjektkonfigurasjon, validering | 45 minutter |
| **[04-Database](walkthrough/04-Database/README.md)** | Databaselag | PostgreSQL-skjema, pgvector, RLS-policyer, eksempeldata | 60 minutter |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kjerneimplementering | FastMCP-rammeverk, databaseintegrasjon, tilkoblingshåndtering | 90 minutter |
| **[06-Verktøy](walkthrough/06-Tools/README.md)** | Verktøyutvikling | MCP-verktøyoppretting, spørringsvalidering, forretningsintelligensfunksjoner | 75 minutter |
| **[07-Semantisk-Søk](walkthrough/07-Semantic-Search/README.md)** | AI-integrasjon | Azure OpenAI embeddings, vektorsøk, hybride søkestrategier | 60 minutter |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Kvalitetssikring | Enhetstesting, integrasjonstesting, ytelsestesting, feilsøking | 75 minutter |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Utviklingsopplevelse | VS Code-konfigurasjon, AI Chat-integrasjon, feilsøkingsarbeidsflyter | 45 minutter |
| **[10-Distribusjon](walkthrough/10-Deployment/README.md)** | Produksjonsklar | Containerisering, Azure Container Apps, CI/CD-pipelines, skalering | 90 minutter |
| **[11-Overvåking](walkthrough/11-Monitoring/README.md)** | Observasjon | Application Insights, strukturert logging, ytelsesmetrikker | 60 minutter |
| **[12-Beste-Praksis](walkthrough/12-Best-Practices/README.md)** | Produksjonsekspertise | Sikkerhetsforsterkning, ytelsesoptimalisering, bedriftsmønstre | 45 minutter |

**Total Læringstid**: ~12-15 timer med omfattende praktisk læring

### 🎯 Hvordan Bruke Gjennomgangen

**For Nybegynnere**:
1. Start med [Modul 00: Introduksjon](walkthrough/00-Introduction/README.md) for å forstå MCP-grunnleggende
2. Følg modulene sekvensielt for en komplett læringsopplevelse
3. Hver modul bygger på tidligere konsepter og inkluderer praktiske øvelser

**For Erfarne Utviklere**:
1. Gå gjennom [Hovedoversikten for Gjennomgangen](walkthrough/README.md) for en komplett moduloversikt
2. Hopp til spesifikke moduler som interesserer deg (f.eks. Modul 07 for AI-integrasjon)
3. Bruk individuelle moduler som referansemateriale for egne prosjekter

**For Produksjonsimplementering**:
1. Fokuser på Modulene 02 (Sikkerhet), 10 (Distribusjon), og 11 (Overvåking)
2. Gå gjennom Modul 12 (Beste Praksis) for retningslinjer på bedriftsnivå
3. Bruk kodeeksemplene som produksjonsklare maler

### 🚀 Hurtigstart Alternativer

**Alternativ 1: Komplett Læringssti** (Anbefalt for nybegynnere)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Alternativ 2: Praktisk Implementering** (Hopp rett inn i byggingen)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Alternativ 3: Produksjonsfokus** (Bedriftsdistribusjon)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Læringsforutsetninger

**Anbefalt bakgrunn**:
- Grunnleggende erfaring med Python-programmering
- Kjennskap til REST API-er og databaser
- Generell forståelse av AI/ML-konsepter
- Grunnleggende kunnskap om kommandolinje og Docker

**Ikke nødvendig (men nyttig)**:
- Tidligere MCP-erfaring (vi dekker dette fra grunnen av)
- Erfaring med Azure Cloud (vi gir trinnvis veiledning)
- Avansert PostgreSQL-kunnskap (vi forklarer konsepter etter behov)

### 💡 Læringstips

1. **Praktisk tilnærming**: Hvert modul inneholder fungerende kodeeksempler du kan kjøre og endre
2. **Gradvis kompleksitet**: Konsepter bygges opp gradvis fra enkle til avanserte
3. **Reelle eksempler**: Alle eksempler bruker realistiske forretningsscenarier fra detaljhandel
4. **Produksjonsklar kode**: Kodeeksemplene er designet for faktisk produksjonsbruk
5. **Fellesskapsstøtte**: Bli med i vår [Discord-fellesskap](https://discord.com/invite/ByRwuEEgH4) for hjelp og diskusjoner

### 🔗 Relaterte ressurser

- **[MCP for nybegynnere](https://aka.ms/mcp-for-beginners)**: Essensiell bakgrunnslesing
- **[Eksempelgjennomgang](Sample_Walkthrough.md)**: Teknisk oversikt på høyt nivå
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Skyplattform brukt i eksemplene
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP-implementeringsrammeverk

**Klar til å starte læringen?** Begynn med **[Modul 00: Introduksjon](walkthrough/00-Introduction/README.md)** eller utforsk **[komplett gjennomgangsoversikt](walkthrough/README.md)**.

## Forutsetninger

1. Docker Desktop installert
2. Git installert
3. **Azure CLI**: Installer og autentiser med Azure CLI
4. Tilgang til OpenAI-modellen `text-embedding-3-small` og eventuelt `gpt-4o-mini`.

## Komme i gang

Åpne et terminalvindu og kjør følgende kommandoer:

1. Autentiser med Azure CLI

    ```bash
    az login
    ```

2. Klon repositoryet

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Naviger til prosjektmappen

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Distribuer Azure-ressurser

Kjør følgende skript for å automatisere distribusjonen av Azure-ressurser som trengs for MCP-serveren.

Distribusjonsskriptene vil automatisk distribuere modellen `text-embedding-3-small`. Under distribusjonen vil du ha muligheten til også å inkludere modellen `gpt-4o-mini`. Merk at `gpt-4o-mini` **ikke er nødvendig** for dette prosjektet og kun er inkludert for potensielle fremtidige forbedringer.

**Velg skriptet for din plattform:**

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

## Kjøre MCP-serveren

Den enkleste måten å kjøre hele stacken (PostgreSQL + MCP-server) er ved å bruke Docker Compose:

### Start stacken

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

## Bruk

Følgende forutsetter at du bruker den innebygde MCP-serverstøtten i VS Code.

1. Åpne prosjektet i VS Code. Fra terminalen, kjør:

    ```bash
    code .
    ```

2. Start én eller flere MCP-servere ved å bruke konfigurasjonene i `.vscode/mcp.json`. Filen inneholder fire forskjellige serverkonfigurasjoner, som hver representerer en annen butikklederrolle:

   - Hver konfigurasjon bruker en unik RLS (Row Level Security) bruker-ID
   - Disse bruker-ID-ene simulerer ulike butikklederidentiteter som får tilgang til databasen
   - RLS-systemet begrenser dataadgang basert på lederens tildelte butikk
   - Dette etterligner virkelige scenarier der butikkledere logger inn med forskjellige Entra ID-kontoer

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

### Åpne AI Chat i VS Code

1. Åpne AI Chat-modus i VS Code
2. Skriv **#zava** og velg en av MCP-serverne du startet
3. Still spørsmål om salgsdata - Se eksempler på spørringer nedenfor

### Eksempler på spørringer

1. Vis topp 20 produkter etter salgsinntekter
1. Vis salg per butikk
1. Hva var salget forrige kvartal etter kategori?
1. Hvilke produkter selger vi som ligner på "beholdere for maling"?

## Funksjoner

- **Multi-tabellskjematilgang**: Hent skjemaer for flere databasetabeller i én forespørsel
- **Sikker spørringsutførelse**: Utfør PostgreSQL-spørringer med støtte for Row Level Security (RLS)
- **Sanntidsdata**: Få tilgang til aktuelle salgs-, lager- og kundedata
- **Dato/tid-verktøy**: Hent nåværende UTC-tidsstempler for tidsfølsom analyse
- **Fleksibel distribusjon**: Støtter HTTP-servermodus

## Støttede tabeller

Serveren gir tilgang til følgende detaljhandelsdatabasetabeller:

- `retail.customers` - Kundeinformasjon og profiler
- `retail.stores` - Butikksteder og detaljer
- `retail.categories` - Produktkategorier og hierarkier
- `retail.product_types` - Klassifisering av produkttyper
- `retail.products` - Produktkatalog og spesifikasjoner
- `retail.orders` - Kundeordrer og transaksjoner
- `retail.order_items` - Individuelle varer i ordrene
- `retail.inventory` - Nåværende lagerbeholdning og lagerdata

## Tilgjengelige verktøy

### `get_multiple_table_schemas`

Hent databasetabellskjemaer for flere tabeller i én forespørsel.

**Parametere:**

- `table_names` (list[str]): Liste over gyldige tabellnavn fra de støttede tabellene ovenfor

**Returnerer:** Sammenkoblede skjema-strenger for de forespurte tabellene

### `execute_sales_query`

Utfør PostgreSQL-spørringer mot salgsdatabasen med Row Level Security.

**Parametere:**

- `postgresql_query` (str): En korrekt utformet PostgreSQL-spørring

**Returnerer:** Spørringsresultater formatert som en streng (begrenset til 20 rader for lesbarhet)

**Beste praksis:**

- Hent alltid tabellskjemaer først
- Bruk eksakte kolonnenavn fra skjemaene
- Koble relaterte tabeller for omfattende analyser
- Aggreger resultater når det er hensiktsmessig
- Begrens utdata for lesbarhet

### `get_current_utc_date`

Hent nåværende UTC-dato og tid i ISO-format.

**Returnerer:** Nåværende UTC-dato/tid i ISO-format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Utfør et semantisk søk etter produkter basert på brukerforespørsler.

**Returnerer:** En liste over produkter som samsvarer med søkekriteriene

**Parametere:**

- `query` (str): Søkeforespørsel som streng

**Returnerer:** En liste over produkter som samsvarer med søkekriteriene

## Sikkerhetsfunksjoner

### Row Level Security (RLS)

Serveren implementerer Row Level Security for å sikre at brukere kun får tilgang til data de er autorisert til å se:

- **HTTP-modus**: Bruker `x-rls-user-id`-header for å identifisere den forespørrende brukeren

- **Standard fallback**: Bruker en plassholder-UUID når ingen bruker-ID er oppgitt

#### Butikkspesifikke RLS-bruker-ID-er

Hver Zava Retail-butikk har en unik RLS-bruker-ID som avgjør hvilke data brukeren kan få tilgang til:

| Butikksted | RLS-bruker-ID | Beskrivelse |
|------------|---------------|-------------|
| **Global tilgang** | `00000000-0000-0000-0000-000000000000` | Standard fallback - tilgang til alle butikker |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle butikkdata |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue butikkdata |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma butikkdata |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane butikkdata |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett butikkdata |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond butikkdata |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland butikkdata |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online butikkdata |

#### RLS-implementering

Når en bruker kobler seg til med en spesifikk butiks RLS-bruker-ID, vil de kun se:

- Kunder tilknyttet den butikken
- Ordre plassert på det butikkstedet
- Lagerdata for den spesifikke butikken
- Butikkspesifikke salgs- og ytelsesdata

Dette sikrer dataisolasjon mellom ulike butikksteder samtidig som det opprettholder et enhetlig databaseskjema.

## Arkitektur

### Applikasjonskontekst

Serveren bruker en administrert applikasjonskontekst med:

- **Database-tilkoblingspool**: Effektiv tilkoblingshåndtering for HTTP-modus
- **Livssyklusadministrasjon**: Riktig ressursopprydding ved avslutning
- **Type-sikkerhet**: Sterkt typet kontekst med `AppContext` dataklasse

### Forespørselskontekst

- **Header-uttrekk**: Sikker header-parsing for brukeridentifikasjon
- **RLS-integrasjon**: Automatisk bruker-ID-oppløsning fra forespørselskontekst
- **Feilhåndtering**: Omfattende feilhåndtering med brukervennlige meldinger

## Databaseintegrasjon

Serveren integreres med en PostgreSQL-database gjennom klassen `PostgreSQLSchemaProvider`:

- **Tilkoblingspooling**: Bruker asynkrone tilkoblingspooler for skalerbarhet
- **Skjemametadata**: Gir detaljerte tabellskjemainformasjon
- **Spørringsutførelse**: Sikker spørringsutførelse med RLS-støtte
- **Ressursadministrasjon**: Automatisk opprydding av databaseressurser

## Feilhåndtering

Serveren implementerer robust feilhåndtering:

- **Tabellvalidering**: Sikrer at kun gyldige tabellnavn blir brukt
- **Spørringsvalidering**: Validerer PostgreSQL-spørringer før utførelse
- **Ressursadministrasjon**: Riktig opprydding selv under feil
- **Brukervennlige meldinger**: Klare feilmeldinger for feilsøking

## Sikkerhetsbetraktninger

1. **Row Level Security**: Alle spørringer respekterer RLS-policyer basert på brukeridentitet
2. **Butikkdataisolasjon**: Hver butiks RLS-bruker-ID sikrer tilgang kun til den butikkens data
3. **Inputvalidering**: Tabellnavn og spørringer valideres før utførelse
4. **Ressursbegrensninger**: Spørringsresultater er begrenset for å forhindre overdreven ressursbruk
5. **Tilkoblingssikkerhet**: Bruker sikre praksiser for databasetilkobling
6. **Brukeridentitetsverifisering**: Sørg alltid for at riktig RLS-bruker-ID brukes for den tiltenkte butikken

### Viktige sikkerhetsnotater

- **Bruk aldri produksjons-RLS-bruker-ID-er i utviklingsmiljøer**
- **Verifiser alltid at RLS-bruker-ID samsvarer med den tiltenkte butikken før du kjører spørringer**
- **Standard UUID (`00000000-0000-0000-0000-000000000000`) gir begrenset tilgang**
- **Hver butikkleder bør kun ha tilgang til sin butiks RLS-bruker-ID**

## Utvikling

### Prosjektstruktur

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Nøkkelkomponenter

- **FastMCP Server**: Moderne MCP-serverimplementering med asynkron støtte
- **PostgreSQL Provider**: Databaseabstraksjonslag med RLS-støtte
- **Konteksthåndtering**: Type-sikker applikasjons- og forespørselkonteksthåndtering
- **Verktøyregistrering**: Deklarativ verktøyregistrering med Pydantic-validering

## Bidra

Når du bidrar til denne serveren:

1. Sørg for at alle databasespørringer respekterer Row Level Security
2. Legg til riktig feilhåndtering for nye verktøy
3. Oppdater denne README med eventuelle nye funksjoner eller endringer
4. Test HTTP-servermodus
5. Valider inputparametere og gi klare feilmeldinger

## [Lisens](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Denne MCP-serveren muliggjør sikker, effektiv tilgang til Zava Retail salgsdata for AI-drevet analyse og innsikt.*

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.