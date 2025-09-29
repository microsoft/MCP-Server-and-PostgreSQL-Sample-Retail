<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-29T21:59:32+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "da"
}
-->
# Introduktion til MCP-databaseintegration

## 🎯 Hvad Dette Modul Dækker

Dette introduktionsmodul giver en omfattende oversigt over, hvordan man bygger Model Context Protocol (MCP)-servere med databaseintegration. Du vil forstå forretningscasen, den tekniske arkitektur og anvendelser i den virkelige verden gennem Zava Retails analyseeksempel.

## Oversigt

**Model Context Protocol (MCP)** gør det muligt for AI-assistenter at få sikker adgang til og interagere med eksterne datakilder i realtid. Når MCP kombineres med databaseintegration, åbnes der op for kraftfulde muligheder inden for datadrevne AI-applikationer.

Denne læringssti lærer dig at bygge produktionsklare MCP-servere, der forbinder AI-assistenter med detailsalgsdata via PostgreSQL, og implementerer virksomhedsmønstre som Row Level Security, semantisk søgning og multi-tenant dataadgang.

## Læringsmål

Ved afslutningen af dette modul vil du kunne:

- **Definere** Model Context Protocol og dens kernefordele ved databaseintegration
- **Identificere** nøglekomponenter i en MCP-serverarkitektur med databaser
- **Forstå** Zava Retails brugsscenarie og dets forretningskrav
- **Genkende** virksomhedsmønstre for sikker og skalerbar databaseadgang
- **Liste** værktøjer og teknologier, der bruges gennem hele læringsstien

## 🧭 Udfordringen: AI Møder Virkelighedens Data

### Traditionelle AI-begrænsninger

Moderne AI-assistenter er utroligt kraftfulde, men står over for betydelige begrænsninger, når de arbejder med virkelighedens forretningsdata:

| **Udfordring** | **Beskrivelse** | **Forretningspåvirkning** |
|----------------|-----------------|---------------------------|
| **Statisk Viden** | AI-modeller trænet på faste datasæt kan ikke tilgå aktuelle forretningsdata | Forældede indsigter, mistede muligheder |
| **Datasiloer** | Information låst i databaser, API'er og systemer, som AI ikke kan nå | Ufuldstændig analyse, fragmenterede arbejdsgange |
| **Sikkerhedsbegrænsninger** | Direkte databaseadgang skaber sikkerheds- og overholdelsesproblemer | Begrænset implementering, manuel dataklargøring |
| **Komplekse Forespørgsler** | Forretningsbrugere har brug for teknisk viden for at udtrække dataindsigter | Reduceret adoption, ineffektive processer |

### MCP-løsningen

Model Context Protocol adresserer disse udfordringer ved at tilbyde:

- **Adgang til data i realtid**: AI-assistenter kan forespørge live databaser og API'er
- **Sikker integration**: Kontrolleret adgang med autentifikation og tilladelser
- **Naturligt sproginterface**: Forretningsbrugere kan stille spørgsmål på almindeligt engelsk
- **Standardiseret protokol**: Fungerer på tværs af forskellige AI-platforme og værktøjer

## 🏪 Mød Zava Retail: Vores Læringscase

Gennem denne læringssti vil vi bygge en MCP-server for **Zava Retail**, en fiktiv gør-det-selv detailkæde med flere butikslokationer. Dette realistiske scenarie demonstrerer MCP-implementering på virksomhedsniveau.

### Forretningskontekst

**Zava Retail** driver:
- **8 fysiske butikker** i Washington State (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online butik** til e-handel
- **Diversificeret produktkatalog** med værktøj, hardware, havetilbehør og byggematerialer
- **Flerlagsledelse** med butikschefer, regionschefer og ledere

### Forretningskrav

Butikschefer og ledere har brug for AI-drevne analyser til at:

1. **Analysere salgspræstationer** på tværs af butikker og tidsperioder
2. **Sporing af lagerbeholdning** og identificering af genopfyldningsbehov
3. **Forstå kundeadfærd** og købemønstre
4. **Opdage produktindsigter** gennem semantisk søgning
5. **Generere rapporter** med naturlige sprogforespørgsler
6. **Opretholde datasikkerhed** med rollebaseret adgangskontrol

### Tekniske krav

MCP-serveren skal levere:

- **Multi-tenant dataadgang**, hvor butikschefer kun ser deres egen butiks data
- **Fleksible forespørgsler**, der understøtter komplekse SQL-operationer
- **Semantisk søgning** til produktopdagelse og anbefalinger
- **Data i realtid**, der afspejler den aktuelle forretningsstatus
- **Sikker autentifikation** med Row Level Security
- **Skalerbar arkitektur**, der understøtter flere samtidige brugere

## 🏗️ MCP-serverarkitektur Oversigt

Vores MCP-server implementerer en lagdelt arkitektur optimeret til databaseintegration:

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

### Nøglekomponenter

#### **1. MCP-serverlag**
- **FastMCP Framework**: Moderne Python MCP-serverimplementering
- **Værktøjsregistrering**: Deklarative værktøjsdefinitioner med type-sikkerhed
- **Forespørgselskontekst**: Brugeridentitet og sessionstyring
- **Fejlhåndtering**: Robust fejlhåndtering og logning

#### **2. Databaseintegrationslag**
- **Forbindelsespooling**: Effektiv asyncpg-forbindelsesstyring
- **Skemaleverandør**: Dynamisk tabelskemaopdagelse
- **Forespørgselsudfører**: Sikker SQL-udførelse med RLS-kontekst
- **Transaktionsstyring**: ACID-overholdelse og rollback-håndtering

#### **3. Sikkerhedslag**
- **Row Level Security**: PostgreSQL RLS til multi-tenant dataisolering
- **Brugeridentitet**: Autentifikation og autorisation af butikschefer
- **Adgangskontrol**: Finkornede tilladelser og revisionsspor
- **Inputvalidering**: Forebyggelse af SQL-injektion og forespørgselsvalidering

#### **4. AI-forbedringslag**
- **Semantisk søgning**: Vektorindlejring til produktopdagelse
- **Azure OpenAI Integration**: Tekstindlejring generering
- **Lighedsalgoritmer**: pgvector cosinus-lighedssøgning
- **Søgeoptimering**: Indeksering og ydeevnejustering

## 🔧 Teknologistak

### Kerne Teknologier

| **Komponent** | **Teknologi** | **Formål** |
|---------------|---------------|------------|
| **MCP Framework** | FastMCP (Python) | Moderne MCP-serverimplementering |
| **Database** | PostgreSQL 17 + pgvector | Relationelle data med vektorsøgning |
| **AI-tjenester** | Azure OpenAI | Tekstindlejring og sprogmodeller |
| **Containerisering** | Docker + Docker Compose | Udviklingsmiljø |
| **Cloud Platform** | Microsoft Azure | Produktionsimplementering |
| **IDE Integration** | VS Code | AI Chat og udviklingsarbejdsgang |

### Udviklingsværktøjer

| **Værktøj** | **Formål** |
|-------------|------------|
| **asyncpg** | Højtydende PostgreSQL-driver |
| **Pydantic** | Datavalidering og serialisering |
| **Azure SDK** | Integration af cloud-tjenester |
| **pytest** | Testframework |
| **Docker** | Containerisering og implementering |

### Produktionsstak

| **Tjeneste** | **Azure Resource** | **Formål** |
|--------------|--------------------|------------|
| **Database** | Azure Database for PostgreSQL | Administreret databaseservice |
| **Container** | Azure Container Apps | Serverløs containerhosting |
| **AI-tjenester** | Azure AI Foundry | OpenAI-modeller og endpoints |
| **Overvågning** | Application Insights | Observabilitet og diagnostik |
| **Sikkerhed** | Azure Key Vault | Hemmeligholdelse og konfigurationsstyring |

## 🎬 Anvendelsesscenarier i Virkeligheden

Lad os udforske, hvordan forskellige brugere interagerer med vores MCP-server:

### Scenario 1: Butikschefens Præstationsgennemgang

**Bruger**: Sarah, butikschef i Seattle  
**Mål**: Analysere sidste kvartals salgspræstationer

**Naturlig Sprogforespørgsel**:
> "Vis mig de 10 mest indbringende produkter for min butik i Q4 2024"

**Hvad Der Sker**:
1. VS Code AI Chat sender forespørgslen til MCP-serveren
2. MCP-serveren identificerer Sarahs butikskontekst (Seattle)
3. RLS-politikker filtrerer data til kun Seattle-butikken
4. SQL-forespørgsel genereres og udføres
5. Resultater formateres og returneres til AI Chat
6. AI leverer analyse og indsigter

### Scenario 2: Produktopdagelse med Semantisk Søgning

**Bruger**: Mike, lagerchef  
**Mål**: Finde produkter, der ligner en kundes forespørgsel

**Naturlig Sprogforespørgsel**:
> "Hvilke produkter sælger vi, der ligner 'vandtætte elektriske stik til udendørs brug'?"

**Hvad Der Sker**:
1. Forespørgsel behandles af semantisk søgeværktøj
2. Azure OpenAI genererer indlejringsvektor
3. pgvector udfører lighedssøgning
4. Relaterede produkter rangeres efter relevans
5. Resultater inkluderer produktdetaljer og tilgængelighed
6. AI foreslår alternativer og pakkemuligheder

### Scenario 3: Tværbutiksanalyse

**Bruger**: Jennifer, regionschef  
**Mål**: Sammenligne præstationer på tværs af alle butikker

**Naturlig Sprogforespørgsel**:
> "Sammenlign salg efter kategori for alle butikker i de sidste 6 måneder"

**Hvad Der Sker**:
1. RLS-kontekst indstilles til regionschefens adgang
2. Kompleks tværbutiksforespørgsel genereres
3. Data aggregeres på tværs af butikslokationer
4. Resultater inkluderer tendenser og sammenligninger
5. AI identificerer indsigter og anbefalinger

## 🔒 Sikkerhed og Multi-Tenancy Dybdegående

Vores implementering prioriterer sikkerhed på virksomhedsniveau:

### Row Level Security (RLS)

PostgreSQL RLS sikrer dataisolering:

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

### Brugeridentitetsstyring

Hver MCP-forbindelse inkluderer:
- **Butikschef-ID**: Unik identifikator for RLS-kontekst
- **Rollefordeling**: Tilladelser og adgangsniveauer
- **Sessionsstyring**: Sikker autentifikationstokens
- **Revisionslogning**: Komplet adgangshistorik

### Databeskyttelse

Flere lag af sikkerhed:
- **Forbindelseskryptering**: TLS for alle databaseforbindelser
- **Forebyggelse af SQL-injektion**: Kun parameteriserede forespørgsler
- **Inputvalidering**: Omfattende forespørgselsvalidering
- **Fejlhåndtering**: Ingen følsomme data i fejlmeddelelser

## 🎯 Vigtige Pointer

Efter at have gennemført denne introduktion, bør du forstå:

✅ **MCP Værdiforslag**: Hvordan MCP forbinder AI-assistenter med virkelighedens data  
✅ **Forretningskontekst**: Zava Retails krav og udfordringer  
✅ **Arkitektur Oversigt**: Nøglekomponenter og deres interaktioner  
✅ **Teknologisk Stak**: Værktøjer og frameworks, der bruges gennem hele processen  
✅ **Sikkerhedsmodel**: Multi-tenant dataadgang og beskyttelse  
✅ **Anvendelsesmønstre**: Virkelighedens forespørgselsscenarier og arbejdsgange  

## 🚀 Hvad Er Næste Skridt

Klar til at dykke dybere? Fortsæt med:

**[Module 01: Core Architecture Concepts](../01-Architecture/README.md)**

Lær om MCP-serverarkitekturens mønstre, principper for databasedesign og den detaljerede tekniske implementering, der driver vores detailanalyse-løsning.

## 📚 Yderligere Ressourcer

### MCP Dokumentation
- [MCP Specification](https://modelcontextprotocol.io/docs/) - Officiel protokoldokumentation
- [MCP for Beginners](https://aka.ms/mcp-for-beginners) - Omfattende MCP-læringsguide
- [FastMCP Documentation](https://github.com/modelcontextprotocol/python-sdk) - Python SDK-dokumentation

### Databaseintegration
- [PostgreSQL Documentation](https://www.postgresql.org/docs/) - Komplet PostgreSQL-reference
- [pgvector Guide](https://github.com/pgvector/pgvector) - Dokumentation for vektorextension
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - PostgreSQL RLS-guide

### Azure-tjenester
- [Azure OpenAI Documentation](https://docs.microsoft.com/azure/cognitive-services/openai/) - AI-tjenesteintegration
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Administreret databaseservice
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Serverløse containere

---

**Ansvarsfraskrivelse**: Dette er en læringsøvelse med fiktive detaildata. Følg altid din organisations datastyrings- og sikkerhedspolitikker, når du implementerer lignende løsninger i produktionsmiljøer.

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.