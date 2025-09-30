<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-29T22:28:33+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "nl"
}
-->
# Introductie tot MCP Database-integratie

## 🎯 Wat Deze Module Behandelt

Deze introductiemodule biedt een uitgebreide uitleg over het bouwen van Model Context Protocol (MCP)-servers met database-integratie. Je krijgt inzicht in de zakelijke toepassing, technische architectuur en praktijkvoorbeelden via de Zava Retail-analysecase.

## Overzicht

**Model Context Protocol (MCP)** stelt AI-assistenten in staat om veilig toegang te krijgen tot en te communiceren met externe databronnen in real-time. In combinatie met database-integratie ontgrendelt MCP krachtige mogelijkheden voor datagedreven AI-toepassingen.

Dit leertraject leert je productieklare MCP-servers te bouwen die AI-assistenten verbinden met verkoopdata van retail via PostgreSQL, waarbij ondernemingspatronen zoals Row Level Security, semantisch zoeken en multi-tenant data-toegang worden geïmplementeerd.

## Leerdoelen

Aan het einde van deze module kun je:

- **Definiëren** wat Model Context Protocol is en de belangrijkste voordelen voor database-integratie
- **Identificeren** van de belangrijkste componenten van een MCP-serverarchitectuur met databases
- **Begrijpen** van de Zava Retail-case en de zakelijke vereisten
- **Herkennen** van ondernemingspatronen voor veilige, schaalbare database-toegang
- **Opsommen** van de tools en technologieën die in dit leertraject worden gebruikt

## 🧭 De Uitdaging: AI Ontmoet Real-World Data

### Beperkingen van Traditionele AI

Moderne AI-assistenten zijn enorm krachtig, maar hebben aanzienlijke beperkingen bij het werken met echte zakelijke data:

| **Uitdaging**         | **Beschrijving**                                   | **Zakelijke Impact**                  |
|------------------------|---------------------------------------------------|---------------------------------------|
| **Statische Kennis**  | AI-modellen getraind op vaste datasets kunnen geen actuele bedrijfsdata gebruiken | Verouderde inzichten, gemiste kansen |
| **Data Silos**        | Informatie opgesloten in databases, API's en systemen die AI niet kan bereiken | Onvolledige analyses, gefragmenteerde workflows |
| **Beveiligingsbeperkingen** | Directe database-toegang brengt beveiligings- en compliance-risico's met zich mee | Beperkte implementatie, handmatige datavoorbereiding |
| **Complexe Queries**  | Zakelijke gebruikers hebben technische kennis nodig om data-inzichten te verkrijgen | Verminderde adoptie, inefficiënte processen |

### De MCP-oplossing

Model Context Protocol biedt oplossingen voor deze uitdagingen door:

- **Real-time Data-toegang**: AI-assistenten kunnen live databases en API's raadplegen
- **Veilige Integratie**: Gecontroleerde toegang met authenticatie en machtigingen
- **Natuurlijke Taalinterface**: Zakelijke gebruikers stellen vragen in gewone taal
- **Gestandaardiseerd Protocol**: Werkt met verschillende AI-platforms en tools

## 🏪 Maak Kennis met Zava Retail: Onze Leer Case Study

In dit leertraject bouwen we een MCP-server voor **Zava Retail**, een fictieve doe-het-zelf winkelketen met meerdere vestigingen. Dit realistische scenario demonstreert een implementatie van MCP op ondernemingsniveau.

### Zakelijke Context

**Zava Retail** exploiteert:
- **8 fysieke winkels** in de staat Washington (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online winkel** voor e-commerceverkoop
- **Divers productassortiment** waaronder gereedschap, hardware, tuinartikelen en bouwmaterialen
- **Meerdere managementniveaus** met winkelmanagers, regionale managers en leidinggevenden

### Zakelijke Vereisten

Winkelmanagers en leidinggevenden hebben AI-gestuurde analyses nodig om:

1. **Verkoopprestaties te analyseren** over winkels en tijdsperioden
2. **Voorraadniveaus bij te houden** en aanvulbehoeften te identificeren
3. **Klanten gedrag te begrijpen** en koopgedrag te analyseren
4. **Productinzichten te ontdekken** via semantisch zoeken
5. **Rapporten te genereren** met natuurlijke taalqueries
6. **Data beveiliging te handhaven** met rolgebaseerde toegangscontrole

### Technische Vereisten

De MCP-server moet bieden:

- **Multi-tenant data-toegang** waarbij winkelmanagers alleen hun eigen winkeldata zien
- **Flexibele querymogelijkheden** die complexe SQL-operaties ondersteunen
- **Semantisch zoeken** voor productontdekking en aanbevelingen
- **Real-time data** die de actuele bedrijfsstatus weerspiegelt
- **Veilige authenticatie** met Row Level Security
- **Schaalbare architectuur** die meerdere gelijktijdige gebruikers ondersteunt

## 🏗️ Overzicht MCP Server Architectuur

Onze MCP-server implementeert een gelaagde architectuur die geoptimaliseerd is voor database-integratie:

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

### Belangrijke Componenten

#### **1. MCP Server Laag**
- **FastMCP Framework**: Moderne Python MCP-serverimplementatie
- **Toolregistratie**: Declaratieve tooldefinities met typeveiligheid
- **Request Context**: Gebruikersidentiteit en sessiebeheer
- **Foutafhandeling**: Robuust foutbeheer en logging

#### **2. Database-integratielaag**
- **Connection Pooling**: Efficiënt asyncpg-verbindingbeheer
- **Schema Provider**: Dynamische tabelschema-ontdekking
- **Query Executor**: Veilige SQL-uitvoering met RLS-context
- **Transactiebeheer**: ACID-compliance en rollback-afhandeling

#### **3. Beveiligingslaag**
- **Row Level Security**: PostgreSQL RLS voor multi-tenant data-isolatie
- **Gebruikersidentiteit**: Authenticatie en autorisatie van winkelmanagers
- **Toegangscontrole**: Fijngranulaire machtigingen en audit trails
- **Inputvalidatie**: Preventie van SQL-injecties en queryvalidatie

#### **4. AI-verrijkingslaag**
- **Semantisch Zoeken**: Vector embeddings voor productontdekking
- **Azure OpenAI-integratie**: Generatie van tekstembeddings
- **Similariteitsalgoritmen**: pgvector cosine similarity search
- **Zoekoptimalisatie**: Indexering en prestatieverbetering

## 🔧 Technologie Stack

### Kerntechnologieën

| **Component**         | **Technologie**          | **Doel**                          |
|------------------------|--------------------------|------------------------------------|
| **MCP Framework**      | FastMCP (Python)         | Moderne MCP-serverimplementatie   |
| **Database**           | PostgreSQL 17 + pgvector | Relationele data met vectorzoekfunctie |
| **AI-diensten**        | Azure OpenAI             | Tekstembeddings en taalmodellen   |
| **Containerisatie**    | Docker + Docker Compose  | Ontwikkelomgeving                 |
| **Cloud Platform**     | Microsoft Azure          | Productie-implementatie           |
| **IDE-integratie**     | VS Code                  | AI Chat en ontwikkelworkflow      |

### Ontwikkeltools

| **Tool**               | **Doel**                |
|------------------------|--------------------------|
| **asyncpg**            | High-performance PostgreSQL-driver |
| **Pydantic**           | Datavalidatie en serialisatie |
| **Azure SDK**          | Cloudservice-integratie |
| **pytest**             | Testframework           |
| **Docker**             | Containerisatie en implementatie |

### Productiestack

| **Service**            | **Azure Resource**      | **Doel**                          |
|------------------------|--------------------------|------------------------------------|
| **Database**           | Azure Database for PostgreSQL | Beheerde databaseservice         |
| **Container**          | Azure Container Apps    | Serverloze containerhosting       |
| **AI-diensten**        | Azure AI Foundry        | OpenAI-modellen en endpoints      |
| **Monitoring**         | Application Insights    | Observatie en diagnostiek         |
| **Beveiliging**        | Azure Key Vault         | Geheimen en configuratiebeheer    |

## 🎬 Praktijkvoorbeelden

Laten we verkennen hoe verschillende gebruikers onze MCP-server gebruiken:

### Scenario 1: Prestatieanalyse Winkelmanager

**Gebruiker**: Sarah, Winkelmanager Seattle  
**Doel**: Analyseer de verkoopprestaties van het afgelopen kwartaal

**Natuurlijke Taalquery**:
> "Laat me de top 10 producten zien op basis van omzet voor mijn winkel in Q4 2024"

**Wat Gebeurt Er**:
1. VS Code AI Chat stuurt de query naar de MCP-server
2. MCP-server identificeert Sarah's winkelcontext (Seattle)
3. RLS-beleid filtert data naar alleen de Seattle-winkel
4. SQL-query wordt gegenereerd en uitgevoerd
5. Resultaten worden geformatteerd en teruggestuurd naar AI Chat
6. AI biedt analyse en inzichten

### Scenario 2: Productontdekking met Semantisch Zoeken

**Gebruiker**: Mike, Voorraadmanager  
**Doel**: Vind producten die vergelijkbaar zijn met een klantverzoek

**Natuurlijke Taalquery**:
> "Welke producten verkopen we die vergelijkbaar zijn met 'waterdichte elektrische connectoren voor buitengebruik'?"

**Wat Gebeurt Er**:
1. Query wordt verwerkt door semantische zoektool
2. Azure OpenAI genereert embedding vector
3. pgvector voert similariteitszoekfunctie uit
4. Gerelateerde producten worden gerangschikt op relevantie
5. Resultaten bevatten productdetails en beschikbaarheid
6. AI suggereert alternatieven en bundelmogelijkheden

### Scenario 3: Cross-Store Analytics

**Gebruiker**: Jennifer, Regionaal Manager  
**Doel**: Vergelijk prestaties tussen alle winkels

**Natuurlijke Taalquery**:
> "Vergelijk verkoop per categorie voor alle winkels in de afgelopen 6 maanden"

**Wat Gebeurt Er**:
1. RLS-context ingesteld voor toegang van regionale manager
2. Complexe multi-store query gegenereerd
3. Data geaggregeerd over winkelvestigingen
4. Resultaten bevatten trends en vergelijkingen
5. AI identificeert inzichten en aanbevelingen

## 🔒 Beveiliging en Multi-Tenant Diepgaande Analyse

Onze implementatie geeft prioriteit aan beveiliging op ondernemingsniveau:

### Row Level Security (RLS)

PostgreSQL RLS zorgt voor data-isolatie:

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

### Gebruikersidentiteitsbeheer

Elke MCP-verbinding bevat:
- **Winkelmanager-ID**: Unieke identificator voor RLS-context
- **Roltoewijzing**: Machtigingen en toegangsrechten
- **Sessiebeheer**: Veilige authenticatietokens
- **Auditlogging**: Volledige toegangsgeschiedenis

### Databescherming

Meerdere beveiligingslagen:
- **Verbindingencryptie**: TLS voor alle databaseverbindingen
- **Preventie van SQL-injecties**: Alleen geparameteriseerde queries
- **Inputvalidatie**: Uitgebreide verzoekvalidatie
- **Foutafhandeling**: Geen gevoelige data in foutmeldingen

## 🎯 Belangrijkste Inzichten

Na het voltooien van deze introductie begrijp je:

✅ **MCP Waardepropositie**: Hoe MCP AI-assistenten en echte data verbindt  
✅ **Zakelijke Context**: Zava Retail's vereisten en uitdagingen  
✅ **Architectuuroverzicht**: Belangrijke componenten en hun interacties  
✅ **Technologie Stack**: Tools en frameworks die worden gebruikt  
✅ **Beveiligingsmodel**: Multi-tenant data-toegang en bescherming  
✅ **Gebruikspatronen**: Praktijkvoorbeelden van queryscenario's en workflows  

## 🚀 Wat Nu?

Klaar om dieper te duiken? Ga verder met:

**[Module 01: Kernarchitectuurconcepten](../01-Architecture/README.md)**

Leer over MCP-serverarchitectuurpatronen, principes van databaseontwerp en de gedetailleerde technische implementatie die onze retailanalyseoplossing aandrijft.

## 📚 Aanvullende Bronnen

### MCP Documentatie
- [MCP Specificatie](https://modelcontextprotocol.io/docs/) - Officiële protocoldocumentatie
- [MCP voor Beginners](https://aka.ms/mcp-for-beginners) - Uitgebreide MCP-leidraad
- [FastMCP Documentatie](https://github.com/modelcontextprotocol/python-sdk) - Python SDK-documentatie

### Database-integratie
- [PostgreSQL Documentatie](https://www.postgresql.org/docs/) - Complete PostgreSQL-referentie
- [pgvector Handleiding](https://github.com/pgvector/pgvector) - Documentatie van vectoruitbreiding
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - PostgreSQL RLS-gids

### Azure-diensten
- [Azure OpenAI Documentatie](https://docs.microsoft.com/azure/cognitive-services/openai/) - AI-service-integratie
- [Azure Database voor PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Beheerde databaseservice
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Serverloze containers

---

**Disclaimer**: Dit is een leertraject met fictieve retaildata. Volg altijd de data governance- en beveiligingsrichtlijnen van jouw organisatie bij het implementeren van vergelijkbare oplossingen in productieomgevingen.

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.