<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:53:10+00:00",
  "source_file": "README.md",
  "language_code": "sv"
}
-->
# MCP Server och PostgreSQL-exempel - Analys av detaljhandelsförsäljning

## Lär dig MCP med databasintegration genom praktiska exempel

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Gå med i Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Följ dessa steg för att komma igång med dessa resurser:

1. **Forka repot**: Klicka [här för att forka](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klona repot**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Gå med i Azure AI Foundry Discord**: [Träffa experter och andra utvecklare](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Stöd för flera språk

#### Stöds via GitHub Action (Automatiserat och alltid uppdaterat)

[Franska](../fr/README.md) | [Spanska](../es/README.md) | [Tyska](../de/README.md) | [Ryska](../ru/README.md) | [Arabiska](../ar/README.md) | [Persiska (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinesiska (Förenklad)](../zh/README.md) | [Kinesiska (Traditionell, Macau)](../mo/README.md) | [Kinesiska (Traditionell, Hongkong)](../hk/README.md) | [Kinesiska (Traditionell, Taiwan)](../tw/README.md) | [Japanska](../ja/README.md) | [Koreanska](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugisiska (Portugal)](../pt/README.md) | [Portugisiska (Brasilien)](../br/README.md) | [Italienska](../it/README.md) | [Polska](../pl/README.md) | [Turkiska](../tr/README.md) | [Grekiska](../el/README.md) | [Thailändska](../th/README.md) | [Svenska](./README.md) | [Danska](../da/README.md) | [Norska](../no/README.md) | [Finska](../fi/README.md) | [Holländska](../nl/README.md) | [Hebreiska](../he/README.md) | [Vietnamesiska](../vi/README.md) | [Indonesiska](../id/README.md) | [Malajiska](../ms/README.md) | [Tagalog (Filippinska)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungerska](../hu/README.md) | [Tjeckiska](../cs/README.md) | [Slovakiska](../sk/README.md) | [Rumänska](../ro/README.md) | [Bulgariska](../bg/README.md) | [Serbiska (Kyrilliska)](../sr/README.md) | [Kroatiska](../hr/README.md) | [Slovenska](../sl/README.md) | [Ukrainska](../uk/README.md) | [Burmesiska (Myanmar)](../my/README.md)

**Om du vill ha ytterligare översättningar finns stödda språk listade [här](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduktion

Det här exemplet visar hur man bygger och distribuerar en omfattande **Model Context Protocol (MCP)-server** som ger AI-assistenter säker och intelligent åtkomst till detaljhandelsförsäljningsdata via PostgreSQL. Projektet demonstrerar funktioner i företagsklass, inklusive **Row Level Security (RLS)**, **semantiska sökfunktioner** och **Azure AI-integration** för verkliga analysfall inom detaljhandeln.

**Viktiga användningsområden:**
- **AI-drivna försäljningsanalyser**: Möjliggör för AI-assistenter att fråga och analysera detaljhandelsförsäljningsdata med naturligt språk
- **Säker multi-tenant-åtkomst**: Demonstrera implementering av Row Level Security där olika butikschefer endast kan komma åt sin egen butiks data
- **Semantisk produktsökning**: Visa AI-förbättrad produktupptäckt med textinbäddningar
- **Företagsintegration**: Illustrera hur MCP-servrar integreras med Azure-tjänster och PostgreSQL-databaser

**Perfekt för:**
- Utvecklare som lär sig bygga MCP-servrar med databasintegration
- Dataingenjörer som implementerar säkra multi-tenant-analyslösningar
- AI-applikationsutvecklare som arbetar med detaljhandels- eller e-handelsdata
- Alla som är intresserade av att kombinera AI-assistenter med företagsdatabaser

## Gå med i Azure AI Foundry Discord-communityn
Dela dina erfarenheter av MCP och träffa experter och produktgrupper

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Försäljningsanalys MCP-server

En Model Context Protocol (MCP)-server som ger omfattande åtkomst till kundförsäljningsdatabasen för Zava Retail DIY Business. Denna server gör det möjligt för AI-assistenter att fråga och analysera detaljhandelsförsäljningsdata via ett säkert, schema-medvetet gränssnitt.

## 📚 Komplett implementeringsguide

För en detaljerad genomgång av hur denna lösning byggs och hur man implementerar liknande MCP-servrar, se vår omfattande **[Exempelgenomgång](Sample_Walkthrough.md)**. Denna guide erbjuder:

- **Arkitekturgenomgång**: Komponentanalys och designmönster
- **Steg-för-steg-byggande**: Från projektuppsättning till distribution
- **Kodgenomgång**: Detaljerad förklaring av MCP-serverimplementering
- **Avancerade funktioner**: Row Level Security, semantisk sökning och övervakning
- **Bästa praxis**: Säkerhet, prestanda och utvecklingsriktlinjer
- **Felsökning**: Vanliga problem och lösningar

Perfekt för utvecklare som vill förstå implementeringsdetaljer och bygga liknande lösningar.

## 🤖 Vad är MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** är en öppen standard som gör det möjligt för AI-assistenter att säkert få åtkomst till externa datakällor och verktyg i realtid. Tänk på det som en bro som låter AI-modeller ansluta till databaser, API:er, filsystem och andra resurser samtidigt som säkerhet och kontroll bibehålls.

### Viktiga fördelar:
- **Åtkomst till data i realtid**: AI-assistenter kan fråga live-databaser och API:er
- **Säker integration**: Kontrollerad åtkomst med autentisering och behörigheter  
- **Verktygsutbyggnad**: Lägg till anpassade funktioner till AI-assistenter
- **Standardiserat protokoll**: Fungerar över olika AI-plattformar och verktyg

### Ny på MCP?

Om du är ny på Model Context Protocol rekommenderar vi att du börjar med Microsofts omfattande nybörjarresurser:

**📖 [MCP för nybörjare-guide](https://aka.ms/mcp-for-beginners)**

Denna resurs erbjuder:
- Introduktion till MCP-koncept och arkitektur
- Steg-för-steg-handledning för att bygga din första MCP-server
- Bästa praxis för MCP-utveckling
- Integreringsexempel med populära AI-plattformar
- Community-resurser och support

När du har förstått grunderna, återvänd hit för att utforska denna avancerade implementering för detaljhandelsanalys!

## 📚 Omfattande lärandeguide: /walkthrough

Detta repo innehåller en komplett **12-modulers lärande genomgång** som bryter ner detta MCP-detaljhandelsserverexempel i hanterbara, steg-för-steg-lektioner. Genomgången förvandlar detta fungerande exempel till en omfattande utbildningsresurs perfekt för utvecklare som vill förstå hur man bygger produktionsklara MCP-servrar med databasintegration.

### Vad du kommer att lära dig

Genomgången täcker allt från grundläggande MCP-koncept till avancerad produktionsdistribution, inklusive:

- **MCP-grunder**: Förstå Model Context Protocol och dess verkliga tillämpningar
- **Databasintegration**: Implementera säker PostgreSQL-anslutning med Row Level Security
- **AI-förbättrade funktioner**: Lägga till semantiska sökfunktioner med Azure OpenAI-inbäddningar
- **Säkerhetsimplementering**: Autentisering, auktorisering och dataisolering i företagsklass
- **Verktygsutveckling**: Bygga sofistikerade MCP-verktyg för dataanalys och affärsintelligens
- **Testning och felsökning**: Omfattande teststrategier och felsökningstekniker
- **VS Code-integration**: Konfigurera AI Chat för naturliga språkfrågor mot databaser
- **Produktionsdistribution**: Containerisering, skalning och molndistributionsstrategier
- **Övervakning och observabilitet**: Application Insights, loggning och prestandaövervakning

### Översikt över lärandebanan

Genomgången följer en progressiv lärandestruktur designad för utvecklare på alla nivåer:

| Modul | Fokusområde | Beskrivning | Tidsuppskattning |
|-------|-------------|-------------|------------------|
| **[00-Introduktion](walkthrough/00-Introduction/README.md)** | Grundläggande | MCP-koncept, Zava Retail-fallstudie, arkitekturöversikt | 30 minuter |
| **[01-Arkitektur](walkthrough/01-Architecture/README.md)** | Designmönster | Teknisk arkitektur, lagerdesign, systemkomponenter | 45 minuter |
| **[02-Säkerhet](walkthrough/02-Security/README.md)** | Företagssäkerhet | Azure-autentisering, Row Level Security, multi-tenant-isolering | 60 minuter |
| **[03-Uppsättning](walkthrough/03-Setup/README.md)** | Miljö | Docker-uppsättning, Azure CLI, projektkonfiguration, validering | 45 minuter |
| **[04-Databas](walkthrough/04-Database/README.md)** | Dataskikt | PostgreSQL-schema, pgvector, RLS-policyer, exempeldata | 60 minuter |
| **[05-MCP-server](walkthrough/05-MCP-Server/README.md)** | Kärnimplementering | FastMCP-ramverk, databasintegration, anslutningshantering | 90 minuter |
| **[06-Verktyg](walkthrough/06-Tools/README.md)** | Verktygsutveckling | Skapande av MCP-verktyg, frågevalidering, affärsintelligensfunktioner | 75 minuter |
| **[07-Semantisk sökning](walkthrough/07-Semantic-Search/README.md)** | AI-integration | Azure OpenAI-inbäddningar, vektorsökning, hybrid sökstrategier | 60 minuter |
| **[08-Testning](walkthrough/08-Testing/README.md)** | Kvalitetssäkring | Enhetstestning, integrationstestning, prestandatestning, felsökning | 75 minuter |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Utvecklingsupplevelse | VS Code-konfiguration, AI Chat-integration, felsökningsarbetsflöden | 45 minuter |
| **[10-Distribution](walkthrough/10-Deployment/README.md)** | Produktionsklar | Containerisering, Azure Container Apps, CI/CD-pipelines, skalning | 90 minuter |
| **[11-Övervakning](walkthrough/11-Monitoring/README.md)** | Observabilitet | Application Insights, strukturerad loggning, prestandamätning | 60 minuter |
| **[12-Bästa praxis](walkthrough/12-Best-Practices/README.md)** | Produktionskvalitet | Säkerhetshärdning, prestandaoptimering, företagsmönster | 45 minuter |

**Total lärandetid**: ~12-15 timmar av omfattande praktiskt lärande

### 🎯 Hur du använder genomgången

**För nybörjare**:
1. Börja med [Modul 00: Introduktion](walkthrough/00-Introduction/README.md) för att förstå MCP-grunderna
2. Följ modulerna i ordning för en komplett lärandeupplevelse
3. Varje modul bygger på tidigare koncept och inkluderar praktiska övningar

**För erfarna utvecklare**:
1. Granska [Huvudöversikten för genomgången](walkthrough/README.md) för en komplett modulsammanfattning
2. Hoppa till specifika moduler som intresserar dig (t.ex. Modul 07 för AI-integration)
3. Använd enskilda moduler som referensmaterial för dina egna projekt

**För produktionsimplementering**:
1. Fokusera på Modulerna 02 (Säkerhet), 10 (Distribution) och 11 (Övervakning)
2. Granska Modul 12 (Bästa praxis) för företagsriktlinjer
3. Använd kodexemplen som produktionsklara mallar

### 🚀 Snabbstartsalternativ

**Alternativ 1: Komplett lärandebana** (Rekommenderas för nybörjare)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Alternativ 2: Praktisk implementering** (Hoppa direkt in i byggandet)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Alternativ 3: Produktionsfokus** (Företagsdistribution)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Förkunskapskrav

**Rekommenderad bakgrund**:
- Grundläggande erfarenhet av Python-programmering
- Kännedom om REST API:er och databaser
- Allmän förståelse för AI/ML-koncept
- Grundläggande kunskaper om kommandoraden och Docker

**Inte nödvändigt (men användbart)**:
- Tidigare erfarenhet av MCP (vi går igenom detta från grunden)
- Erfarenhet av Azure-molnet (vi ger steg-för-steg-instruktioner)
- Avancerade kunskaper i PostgreSQL (vi förklarar koncept vid behov)

### 💡 Lärandestrategier

1. **Praktisk metod**: Varje modul innehåller fungerande kodexempel som du kan köra och modifiera
2. **Gradvis komplexitet**: Koncept byggs upp successivt från enkla till avancerade
3. **Verklighetsnära sammanhang**: Alla exempel använder realistiska scenarier från detaljhandeln
4. **Redo för produktion**: Kodexempel är utformade för faktisk användning i produktion
5. **Gemenskapsstöd**: Gå med i vår [Discord-gemenskap](https://discord.com/invite/ByRwuEEgH4) för hjälp och diskussioner

### 🔗 Relaterade resurser

- **[MCP för nybörjare](https://aka.ms/mcp-for-beginners)**: Grundläggande läsning
- **[Exempelgenomgång](Sample_Walkthrough.md)**: Teknisk översikt på hög nivå
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Molnplattform som används i exemplen
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python-ramverk för MCP-implementering

**Redo att börja lära dig?** Börja med **[Modul 00: Introduktion](walkthrough/00-Introduction/README.md)** eller utforska **[den kompletta genomgången](walkthrough/README.md)**.

## Förutsättningar

1. Docker Desktop installerat
2. Git installerat
3. **Azure CLI**: Installera och autentisera med Azure CLI
4. Tillgång till OpenAI-modellen `text-embedding-3-small` och eventuellt modellen `gpt-4o-mini`.

## Kom igång

Öppna ett terminalfönster och kör följande kommandon:

1. Autentisera med Azure CLI

    ```bash
    az login
    ```

2. Klona repositoryt

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigera till projektkatalogen

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Distribuera Azure-resurser

Kör följande skript för att automatisera distributionen av de Azure-resurser som behövs för MCP-servern.

Distributionsskripten kommer automatiskt att distribuera modellen `text-embedding-3-small`. Under distributionen har du möjlighet att även inkludera modellen `gpt-4o-mini`. Observera att `gpt-4o-mini` **inte är nödvändig** för detta projekt och endast inkluderas för potentiella framtida förbättringar.

**Välj skript för din plattform:**

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

## Köra MCP-servern

Det enklaste sättet att köra hela stacken (PostgreSQL + MCP-server) är att använda Docker Compose:

### Starta stacken

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

## Användning

Följande förutsätter att du använder den inbyggda MCP-serverstödet i VS Code.

1. Öppna projektet i VS Code. Från terminalen, kör:

    ```bash
    code .
    ```

2. Starta en eller flera MCP-servrar med konfigurationerna i `.vscode/mcp.json`. Filen innehåller fyra olika serverkonfigurationer, som var och en representerar en roll för butikschefer:

   - Varje konfiguration använder en unik RLS (Row Level Security) användar-ID
   - Dessa användar-ID:n simulerar olika butikschefsidentiteter som får åtkomst till databasen
   - RLS-systemet begränsar dataåtkomst baserat på chefens tilldelade butik
   - Detta efterliknar verkliga scenarier där butikschefer loggar in med olika Entra ID-konton

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

### Öppna VS Code AI Chat

1. Öppna AI Chat-läget i VS Code
2. Skriv **#zava** och välj en av MCP-servrarna du startade
3. Ställ frågor om försäljningsdata - Se exempel på frågor nedan

### Exempel på frågor

1. Visa de 20 bästa produkterna baserat på försäljningsintäkter
1. Visa försäljning per butik
1. Vad var förra kvartalets försäljning per kategori?
1. Vilka produkter säljer vi som liknar "behållare för färg"?

## Funktioner

- **Åtkomst till flera tabeller**: Hämta scheman för flera databastabeller i en enda begäran
- **Säker frågeexekvering**: Kör PostgreSQL-frågor med stöd för Row Level Security (RLS)
- **Data i realtid**: Få åtkomst till aktuella försäljnings-, lager- och kunddata
- **Datum/tid-verktyg**: Hämta aktuella UTC-tidsstämplar för tidskänslig analys
- **Flexibel distribution**: Stödjer HTTP-serverläge

## Stödda tabeller

Servern ger åtkomst till följande databastabeller för detaljhandeln:

- `retail.customers` - Kundinformation och profiler
- `retail.stores` - Butiksplatser och detaljer
- `retail.categories` - Produktkategorier och hierarkier
- `retail.product_types` - Klassificering av produkttyper
- `retail.products` - Produktkatalog och specifikationer
- `retail.orders` - Kundbeställningar och transaktioner
- `retail.order_items` - Enskilda artiklar inom beställningar
- `retail.inventory` - Aktuella lagernivåer och lagerdata

## Tillgängliga verktyg

### `get_multiple_table_schemas`

Hämta databasscheman för flera tabeller i en enda begäran.

**Parametrar:**

- `table_names` (list[str]): Lista över giltiga tabellnamn från de stödda tabellerna ovan

**Returnerar:** Sammanfogade schema-strängar för de begärda tabellerna

### `execute_sales_query`

Kör PostgreSQL-frågor mot försäljningsdatabasen med stöd för Row Level Security.

**Parametrar:**

- `postgresql_query` (str): En korrekt formulerad PostgreSQL-fråga

**Returnerar:** Frågeresultat formaterade som en sträng (begränsat till 20 rader för läsbarhet)

**Bästa praxis:**

- Hämta alltid tabellscheman först
- Använd exakta kolumnnamn från scheman
- Koppla relaterade tabeller för omfattande analys
- Aggregera resultat när det är lämpligt
- Begränsa utdata för läsbarhet

### `get_current_utc_date`

Hämta aktuellt UTC-datum och tid i ISO-format.

**Returnerar:** Aktuellt UTC-datum/tid i ISO-format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Utför en semantisk sökning efter produkter baserat på användarfrågor.

**Returnerar:** En lista över produkter som matchar sökkriterierna

**Parametrar:**

- `query` (str): Sökningsfråga som sträng

**Returnerar:** En lista över produkter som matchar sökkriterierna

## Säkerhetsfunktioner

### Row Level Security (RLS)

Servern implementerar Row Level Security för att säkerställa att användare endast får åtkomst till data de är auktoriserade att se:

- **HTTP-läge**: Använder `x-rls-user-id`-header för att identifiera den begärande användaren

- **Standardfall**: Använder en platshållar-UUID när inget användar-ID anges

#### Butiksspecifika RLS-användar-ID:n

Varje Zava Retail-butik har ett unikt RLS-användar-ID som avgör vilken data användaren kan komma åt:

| Butiksplats | RLS-användar-ID | Beskrivning |
|-------------|-----------------|-------------|
| **Global åtkomst** | `00000000-0000-0000-0000-000000000000` | Standardfall - åtkomst till alla butiker |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle-butikens data |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue-butikens data |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma-butikens data |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane-butikens data |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett-butikens data |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond-butikens data |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland-butikens data |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online-butikens data |

#### RLS-implementering

När en användare ansluter med ett specifikt butiks RLS-användar-ID kommer de endast att se:

- Kunder associerade med den butiken
- Beställningar gjorda på den butikens plats
- Lagerdata för den specifika butiken
- Butiksspecifika försäljnings- och prestationsmått

Detta säkerställer dataisolering mellan olika butiksplatser samtidigt som en enhetlig databasschema bibehålls.

## Arkitektur

### Applikationskontext

Servern använder en hanterad applikationskontext med:

- **Databasanslutningspool**: Effektiv anslutningshantering för HTTP-läge
- **Livscykelhantering**: Korrekt resursrensning vid avstängning
- **Typ-säkerhet**: Starkt typad kontext med `AppContext` dataklass

### Begärandekontext

- **Header-extraktion**: Säker header-parsing för användaridentifiering
- **RLS-integrering**: Automatisk användar-ID-upplösning från begärandekontext
- **Felkorrigering**: Omfattande felhantering med användarvänliga meddelanden

## Databasintegrering

Servern integreras med en PostgreSQL-databas via klassen `PostgreSQLSchemaProvider`:

- **Anslutningspoolning**: Använder asynkrona anslutningspooler för skalbarhet
- **Schema-metadata**: Ger detaljerad information om tabellscheman
- **Frågeexekvering**: Säker frågeexekvering med RLS-stöd
- **Resurshantering**: Automatisk rensning av databasresurser

## Felhantering

Servern implementerar robust felhantering:

- **Tabellvalidering**: Säkerställer att endast giltiga tabellnamn används
- **Frågevalidering**: Validerar PostgreSQL-frågor innan exekvering
- **Resurshantering**: Korrekt rensning även vid fel
- **Användarvänliga meddelanden**: Tydliga felmeddelanden för felsökning

## Säkerhetsöverväganden

1. **Row Level Security**: Alla frågor respekterar RLS-policyer baserat på användaridentitet
2. **Dataisolering för butiker**: Varje butiks RLS-användar-ID säkerställer åtkomst endast till den butikens data
3. **Inmatningsvalidering**: Tabellnamn och frågor valideras innan exekvering
4. **Resursbegränsningar**: Frågeresultat begränsas för att förhindra överdriven resursanvändning
5. **Anslutningssäkerhet**: Använder säkra anslutningsmetoder för databasen
6. **Verifiering av användaridentitet**: Säkerställ alltid att rätt RLS-användar-ID används för den avsedda butiken

### Viktiga säkerhetsnoteringar

- **Använd aldrig produktions-RLS-användar-ID:n i utvecklingsmiljöer**
- **Verifiera alltid att RLS-användar-ID matchar den avsedda butiken innan du kör frågor**
- **Standard-UUID (`00000000-0000-0000-0000-000000000000`) ger begränsad åtkomst**
- **Varje butikschef bör endast ha åtkomst till sitt butiks RLS-användar-ID**

## Utveckling

### Projektstruktur

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Viktiga komponenter

- **FastMCP Server**: Modern MCP-serverimplementering med asynkron support
- **PostgreSQL Provider**: Databasabstraktionslager med RLS-stöd
- **Kontexthantering**: Typ-säker applikations- och begärandekontexthantering
- **Verktygsregistrering**: Deklarativ verktygsregistrering med Pydantic-validering

## Bidra

När du bidrar till denna server:

1. Säkerställ att alla databasfrågor respekterar Row Level Security
2. Lägg till korrekt felhantering för nya verktyg
3. Uppdatera denna README med nya funktioner eller ändringar
4. Testa HTTP-serverläget
5. Validera inmatningsparametrar och ge tydliga felmeddelanden

## [Licens](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Denna MCP-server möjliggör säker och effektiv åtkomst till Zava Retails försäljningsdata för AI-drivna analyser och insikter.*

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen notera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.