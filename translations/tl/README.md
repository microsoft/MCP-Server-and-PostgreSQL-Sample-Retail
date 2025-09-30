<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T22:41:56+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# MCP Server at PostgreSQL Sample - Pagsusuri ng Benta sa Retail

## Matutunan ang MCP na may Integrasyon sa Database sa pamamagitan ng Praktikal na Halimbawa

[![Mga Contributor sa GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Mga Isyu sa GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Mga Pull Request sa GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Sumali sa Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Sundin ang mga hakbang na ito upang magsimula sa paggamit ng mga resources na ito:

1. **I-fork ang Repository**: I-click [dito para mag-fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **I-clone ang Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Sumali sa Azure AI Foundry Discord**: [Makipag-ugnayan sa mga eksperto at kapwa developer](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Suporta sa Multi-Language

#### Sinusuportahan sa pamamagitan ng GitHub Action (Automated at Laging Napapanahon)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](./README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Kung nais mong magkaroon ng karagdagang mga wika para sa pagsasalin, ang mga sinusuportahang wika ay nakalista [dito](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Panimula

Ang sample na ito ay nagpapakita kung paano bumuo at mag-deploy ng isang komprehensibong **Model Context Protocol (MCP) server** na nagbibigay sa mga AI assistant ng secure at matalinong access sa retail sales data sa pamamagitan ng PostgreSQL. Ang proyekto ay nagtatampok ng mga enterprise-grade na katangian tulad ng **Row Level Security (RLS)**, **semantic search capabilities**, at **Azure AI integration** para sa mga tunay na retail analytics na senaryo.

**Mga Pangunahing Gamit:**
- **AI-Powered Sales Analytics**: Pahintulutan ang mga AI assistant na mag-query at mag-analisa ng retail sales data gamit ang natural na wika
- **Secure Multi-Tenant Access**: Ipakita ang implementasyon ng Row Level Security kung saan ang iba't ibang store managers ay may access lamang sa data ng kanilang tindahan
- **Semantic Product Search**: Ipakita ang AI-enhanced na paghanap ng produkto gamit ang text embeddings
- **Enterprise Integration**: Ilustrasyon kung paano i-integrate ang MCP servers sa Azure services at PostgreSQL databases

**Perpekto para sa:**
- Mga developer na gustong matutunan ang pagbuo ng MCP servers na may integrasyon sa database
- Mga data engineer na nag-iimplement ng secure multi-tenant analytics solutions
- Mga AI application developer na nagtatrabaho sa retail o e-commerce data
- Sinuman na interesado sa pagsasama ng AI assistants sa enterprise databases

## Sumali sa Azure AI Foundry Discord Community
Ibahagi ang iyong karanasan sa MCP at makipag-ugnayan sa mga eksperto at product groups

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Sales Analysis MCP Server

Isang Model Context Protocol (MCP) server na nagbibigay ng komprehensibong access sa customer sales database para sa Zava Retail DIY Business. Ang server na ito ay nagbibigay-daan sa mga AI assistant na mag-query at mag-analisa ng retail sales data sa pamamagitan ng isang secure, schema-aware na interface.

## 📚 Kumpletong Gabay sa Implementasyon

Para sa detalyadong breakdown kung paano binuo ang solusyong ito at kung paano mag-implement ng katulad na MCP servers, tingnan ang aming komprehensibong **[Sample Walkthrough](Sample_Walkthrough.md)**. Ang gabay na ito ay nagbibigay ng:

- **Architecture Deep Dive**: Pagsusuri ng mga component at design patterns
- **Step-by-Step Building**: Mula sa project setup hanggang sa deployment
- **Code Breakdown**: Detalyadong paliwanag ng implementasyon ng MCP server
- **Advanced Features**: Row Level Security, semantic search, at monitoring
- **Best Practices**: Mga alituntunin sa seguridad, performance, at development
- **Troubleshooting**: Mga karaniwang isyu at solusyon

Perpekto para sa mga developer na gustong maunawaan ang mga detalye ng implementasyon at bumuo ng katulad na solusyon.

## 🤖 Ano ang MCP (Model Context Protocol)?

Ang **Model Context Protocol (MCP)** ay isang open standard na nagbibigay-daan sa mga AI assistant na magkaroon ng secure na access sa mga external na data sources at tools sa real-time. Isipin ito bilang isang tulay na nagpapahintulot sa mga AI models na kumonekta sa mga databases, APIs, file systems, at iba pang resources habang pinapanatili ang seguridad at kontrol.

### Mga Pangunahing Benepisyo:
- **Real-time Data Access**: Ang mga AI assistant ay maaaring mag-query ng live databases at APIs
- **Secure Integration**: Kinokontrol na access gamit ang authentication at permissions  
- **Tool Extensibility**: Magdagdag ng custom na kakayahan sa mga AI assistant
- **Standardized Protocol**: Gumagana sa iba't ibang AI platforms at tools

### Bago sa MCP?

Kung bago ka sa Model Context Protocol, inirerekomenda naming magsimula sa mga komprehensibong beginner resources ng Microsoft:

**📖 [MCP for Beginners Guide](https://aka.ms/mcp-for-beginners)**

Ang resource na ito ay nagbibigay ng:
- Panimula sa mga konsepto at arkitektura ng MCP
- Step-by-step na tutorials para sa pagbuo ng iyong unang MCP server
- Mga best practices para sa MCP development
- Mga halimbawa ng integrasyon sa mga sikat na AI platforms
- Mga community resources at suporta

Kapag naunawaan mo na ang mga pangunahing kaalaman, bumalik dito upang tuklasin ang advanced na retail analytics implementation!

## 📚 Komprehensibong Gabay sa Pag-aaral: /walkthrough

Ang repository na ito ay naglalaman ng kumpletong **12-module learning walkthrough** na nagde-deconstruct sa MCP retail server sample na ito sa mga digestible, step-by-step na aralin. Ang walkthrough ay ginagawang isang komprehensibong educational resource ang working example na ito, perpekto para sa mga developer na gustong matutunan kung paano bumuo ng production-ready MCP servers na may integrasyon sa database.

### Ano ang Matututunan Mo

Ang walkthrough ay sumasaklaw sa lahat mula sa mga pangunahing konsepto ng MCP hanggang sa advanced production deployment, kabilang ang:

- **MCP Fundamentals**: Pag-unawa sa Model Context Protocol at ang mga real-world applications nito
- **Database Integration**: Pag-implement ng secure na PostgreSQL connectivity gamit ang Row Level Security
- **AI-Enhanced Features**: Pagdaragdag ng semantic search capabilities gamit ang Azure OpenAI embeddings
- **Security Implementation**: Enterprise-grade na authentication, authorization, at data isolation
- **Tool Development**: Pagbuo ng mga sophisticated MCP tools para sa data analysis at business intelligence
- **Testing & Debugging**: Komprehensibong testing strategies at debugging techniques
- **VS Code Integration**: Pag-configure ng AI Chat para sa natural language database queries
- **Production Deployment**: Containerization, scaling, at cloud deployment strategies
- **Monitoring & Observability**: Application Insights, logging, at performance monitoring

### Overview ng Learning Path

Ang walkthrough ay sumusunod sa isang progresibong learning structure na idinisenyo para sa mga developer ng lahat ng antas ng kasanayan:

| Module | Focus Area | Deskripsyon | Tinatayang Oras |
|--------|------------|-------------|-----------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Foundation | Mga konsepto ng MCP, Zava Retail case study, overview ng arkitektura | 30 minuto |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Design Patterns | Teknikal na arkitektura, layered design, mga component ng sistema | 45 minuto |
| **[02-Security](walkthrough/02-Security/README.md)** | Enterprise Security | Azure authentication, Row Level Security, multi-tenant isolation | 60 minuto |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Environment | Docker setup, Azure CLI, project configuration, validation | 45 minuto |
| **[04-Database](walkthrough/04-Database/README.md)** | Data Layer | PostgreSQL schema, pgvector, RLS policies, sample data | 60 minuto |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Core Implementation | FastMCP framework, database integration, connection management | 90 minuto |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Tool Development | Paglikha ng MCP tools, query validation, business intelligence features | 75 minuto |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI Integration | Azure OpenAI embeddings, vector search, hybrid search strategies | 60 minuto |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Quality Assurance | Unit testing, integration testing, performance testing, debugging | 75 minuto |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Development Experience | VS Code configuration, AI Chat integration, debugging workflows | 45 minuto |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Production Ready | Containerization, Azure Container Apps, CI/CD pipelines, scaling | 90 minuto |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observability | Application Insights, structured logging, performance metrics | 60 minuto |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Production Excellence | Security hardening, performance optimization, enterprise patterns | 45 minuto |

**Kabuuang Oras ng Pag-aaral**: ~12-15 oras ng komprehensibong hands-on learning

### 🎯 Paano Gamitin ang Walkthrough

**Para sa mga Baguhan**:
1. Magsimula sa [Module 00: Introduction](walkthrough/00-Introduction/README.md) upang maunawaan ang mga pangunahing kaalaman ng MCP
2. Sundin ang mga module nang sunod-sunod para sa kumpletong karanasan sa pag-aaral
3. Ang bawat module ay nagtatayo sa mga naunang konsepto at may kasamang mga praktikal na ehersisyo

**Para sa Mga May Karanasan na Developer**:
1. Suriin ang [Main Walkthrough Overview](walkthrough/README.md) para sa kumpletong buod ng module
2. Tumalon sa mga partikular na module na interesado ka (hal., Module 07 para sa AI integration)
3. Gamitin ang mga indibidwal na module bilang reference material para sa iyong sariling mga proyekto

**Para sa Production Implementation**:
1. Mag-focus sa Modules 02 (Security), 10 (Deployment), at 11 (Monitoring)
2. Suriin ang Module 12 (Best Practices) para sa mga enterprise guidelines
3. Gamitin ang mga code examples bilang production-ready templates

### 🚀 Mga Quick Start Options

**Option 1: Kumpletong Learning Path** (Inirerekomenda para sa mga baguhan)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Option 2: Hands-On Implementation** (Diretso sa paggawa)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Option 3: Production Focus** (Enterprise deployment)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Mga Kinakailangan sa Pag-aaral

**Inirerekomendang Background**:
- Pangunahing karanasan sa Python programming
- Pamilyar sa REST APIs at mga database
- Pangkalahatang kaalaman sa mga konsepto ng AI/ML
- Pangunahing kaalaman sa command-line at Docker

**Hindi Kinakailangan (ngunit kapaki-pakinabang)**:
- Naunang karanasan sa MCP (sasaklawin namin ito mula sa simula)
- Karanasan sa Azure cloud (magbibigay kami ng sunud-sunod na gabay)
- Advanced na kaalaman sa PostgreSQL (ipapaliwanag namin ang mga konsepto kung kinakailangan)

### 💡 Mga Tip sa Pag-aaral

1. **Praktikal na Diskarte**: Ang bawat module ay may kasamang mga halimbawa ng code na maaaring patakbuhin at baguhin
2. **Progressive Complexity**: Ang mga konsepto ay unti-unting bumubuo mula sa simple hanggang sa mas kumplikado
3. **Real-World Context**: Ang lahat ng mga halimbawa ay gumagamit ng makatotohanang mga senaryo sa negosyo ng retail
4. **Handa para sa Produksyon**: Ang mga halimbawa ng code ay idinisenyo para sa aktwal na paggamit sa produksyon
5. **Suporta ng Komunidad**: Sumali sa aming [Discord community](https://discord.com/invite/ByRwuEEgH4) para sa tulong at talakayan

### 🔗 Mga Kaugnay na Resources

- **[MCP para sa mga Baguhan](https://aka.ms/mcp-for-beginners)**: Mahalagang babasahin para sa background
- **[Sample Walkthrough](Sample_Walkthrough.md)**: Pangkalahatang teknikal na overview
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloud platform na ginagamit sa mga halimbawa
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP implementation framework

**Handa nang magsimula?** Simulan sa **[Module 00: Panimula](walkthrough/00-Introduction/README.md)** o tuklasin ang **[kumpletong walkthrough overview](walkthrough/README.md)**.

## Mga Kinakailangan

1. Nakainstall ang Docker Desktop
2. Nakainstall ang Git
3. **Azure CLI**: I-install at mag-authenticate gamit ang Azure CLI
4. Access sa OpenAI `text-embedding-3-small` model at opsyonal na `gpt-4o-mini` model.

## Pagsisimula

Buksan ang terminal window at patakbuhin ang mga sumusunod na command:

1. Mag-authenticate gamit ang Azure CLI

    ```bash
    az login
    ```

2. I-clone ang repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Pumunta sa project directory

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### I-deploy ang Azure Resources

Patakbuhin ang mga sumusunod na script upang awtomatikong i-deploy ang mga Azure resources na kinakailangan para sa MCP server.

Ang deployment scripts ay awtomatikong magde-deploy ng `text-embedding-3-small` model. Sa panahon ng deployment, magkakaroon ka ng opsyon na isama ang `gpt-4o-mini` model. Tandaan na ang `gpt-4o-mini` ay **hindi kinakailangan** para sa proyektong ito at kasama lamang para sa posibleng mga hinaharap na pagpapahusay.

**Piliin ang script para sa iyong platform:**

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

## Pagpapatakbo ng MCP Server

Ang pinakamadaling paraan upang patakbuhin ang kumpletong stack (PostgreSQL + MCP Server) ay gamit ang Docker Compose:

### Simulan ang Stack

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

## Paggamit

Ang sumusunod ay inaasahan na gagamitin mo ang built-in na suporta ng VS Code MCP server.

1. Buksan ang proyekto sa VS Code. Mula sa terminal, patakbuhin:

    ```bash
    code .
    ```

2. Simulan ang isa o higit pang MCP servers gamit ang mga configuration sa `.vscode/mcp.json`. Ang file ay naglalaman ng apat na iba't ibang server configurations, bawat isa ay kumakatawan sa iba't ibang tungkulin ng store manager:

   - Ang bawat configuration ay gumagamit ng natatanging RLS (Row Level Security) user ID
   - Ang mga user ID na ito ay nagsasagawa ng simulation ng iba't ibang pagkakakilanlan ng store manager na nag-a-access sa database
   - Ang RLS system ay naglilimita sa access ng data batay sa nakatalagang store ng manager
   - Ginagaya nito ang mga totoong senaryo kung saan ang mga store manager ay nag-sign in gamit ang iba't ibang Entra ID accounts

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

### Buksan ang VS Code AI Chat

1. Buksan ang AI Chat mode sa VS Code
2. I-type ang **#zava** at piliin ang isa sa mga MCP servers na sinimulan mo
3. Magtanong tungkol sa sales data - Tingnan ang mga sample query sa ibaba

### Mga Sample Query

1. Ipakita ang nangungunang 20 produkto batay sa sales revenue
1. Ipakita ang sales ayon sa store
1. Ano ang sales ng nakaraang quarter ayon sa kategorya?
1. Anong mga produkto ang ibinebenta namin na katulad ng "containers for paint"

## Mga Tampok

- **Multi-table Schema Access**: Kunin ang mga schema para sa maraming database tables sa isang request
- **Secure Query Execution**: Magpatakbo ng PostgreSQL queries na may suporta sa Row Level Security (RLS)
- **Real-time Data**: Mag-access ng kasalukuyang sales, inventory, at customer data
- **Date/Time Utilities**: Kunin ang kasalukuyang UTC timestamps para sa time-sensitive analysis
- **Flexible Deployment**: Sinusuportahan ang HTTP server mode

## Mga Sinusuportahang Tables

Ang server ay nagbibigay ng access sa mga sumusunod na retail database tables:

- `retail.customers` - Impormasyon at profile ng customer
- `retail.stores` - Lokasyon at detalye ng store
- `retail.categories` - Mga kategorya ng produkto at hierarchy
- `retail.product_types` - Mga klasipikasyon ng uri ng produkto
- `retail.products` - Catalog ng produkto at mga detalye
- `retail.orders` - Mga order ng customer at transaksyon
- `retail.order_items` - Mga indibidwal na item sa loob ng mga order
- `retail.inventory` - Kasalukuyang antas ng imbentaryo at data ng stock

## Mga Available na Tools

### `get_multiple_table_schemas`

Kunin ang mga database schema para sa maraming tables sa isang request.

**Mga Parameter:**

- `table_names` (list[str]): Listahan ng mga valid na pangalan ng table mula sa mga sinusuportahang tables sa itaas

**Returns:** Mga pinagsamang schema strings para sa mga hiniling na tables

### `execute_sales_query`

Magpatakbo ng PostgreSQL queries laban sa sales database na may Row Level Security.

**Mga Parameter:**

- `postgresql_query` (str): Isang maayos na PostgreSQL query

**Returns:** Mga resulta ng query na naka-format bilang string (limitado sa 20 rows para sa readability)

**Mga Best Practices:**

- Laging kunin muna ang mga table schema
- Gumamit ng eksaktong pangalan ng column mula sa mga schema
- I-join ang mga kaugnay na tables para sa mas malawak na pagsusuri
- I-aggregate ang mga resulta kung kinakailangan
- Limitahan ang output para sa readability

### `get_current_utc_date`

Kunin ang kasalukuyang UTC date at oras sa ISO format.

**Returns:** Kasalukuyang UTC date/time sa ISO format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Magpatakbo ng semantic search para sa mga produkto batay sa mga query ng user.

**Returns:** Isang listahan ng mga produktong tumutugma sa mga pamantayan ng paghahanap

**Mga Parameter:**

- `query` (str): Ang string ng query sa paghahanap

**Returns:** Isang listahan ng mga produktong tumutugma sa mga pamantayan ng paghahanap

## Mga Tampok sa Seguridad

### Row Level Security (RLS)

Ang server ay nagpapatupad ng Row Level Security upang matiyak na ang mga user ay makakakuha lamang ng data na awtorisado silang makita:

- **HTTP Mode**: Gumagamit ng `x-rls-user-id` header upang kilalanin ang humihiling na user

- **Default Fallback**: Gumagamit ng placeholder UUID kapag walang user ID na ibinigay

#### Mga Store-Specific RLS User IDs

Ang bawat lokasyon ng Zava Retail store ay may natatanging RLS user ID na tumutukoy kung aling data ang maaaring ma-access ng user:

| Lokasyon ng Store | RLS User ID | Deskripsyon |
|-------------------|-------------|-------------|
| **Global Access** | `00000000-0000-0000-0000-000000000000` | Default fallback - access sa lahat ng store |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Data ng Zava Retail Seattle store |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Data ng Zava Retail Bellevue store |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Data ng Zava Retail Tacoma store |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Data ng Zava Retail Spokane store |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Data ng Zava Retail Everett store |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Data ng Zava Retail Redmond store |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Data ng Zava Retail Kirkland store |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Data ng Zava Retail Online store |

#### Implementasyon ng RLS

Kapag ang isang user ay kumonekta gamit ang partikular na RLS User ID ng store, makikita lamang nila ang:

- Mga customer na nauugnay sa store na iyon
- Mga order na inilagay sa lokasyon ng store na iyon
- Data ng imbentaryo para sa partikular na store
- Mga sukatan ng sales at performance na partikular sa store

Tinitiyak nito ang paghiwalay ng data sa pagitan ng iba't ibang lokasyon ng store habang pinapanatili ang isang unified database schema.

## Arkitektura

### Application Context

Ang server ay gumagamit ng managed application context na may:

- **Database Connection Pool**: Mahusay na pamamahala ng koneksyon para sa HTTP mode
- **Lifecycle Management**: Tamang pag-cleanup ng resources sa shutdown
- **Type Safety**: Malakas na type context gamit ang `AppContext` dataclass

### Request Context

- **Header Extraction**: Secure na pag-parse ng header para sa pagkakakilanlan ng user
- **RLS Integration**: Awtomatikong pag-resolve ng user ID mula sa request context
- **Error Handling**: Komprehensibong error handling na may user-friendly na mensahe

## Integrasyon ng Database

Ang server ay nag-iintegrate sa PostgreSQL database sa pamamagitan ng `PostgreSQLSchemaProvider` class:

- **Connection Pooling**: Gumagamit ng async connection pools para sa scalability
- **Schema Metadata**: Nagbibigay ng detalyadong impormasyon ng table schema
- **Query Execution**: Secure na pagpapatakbo ng query na may suporta sa RLS
- **Resource Management**: Awtomatikong pag-cleanup ng mga database resources

## Error Handling

Ang server ay nagpapatupad ng matibay na error handling:

- **Table Validation**: Tinitiyak na ang mga valid na pangalan ng table lamang ang ma-access
- **Query Validation**: Sini-sigurado ang mga PostgreSQL queries bago patakbuhin
- **Resource Management**: Tamang pag-cleanup kahit sa panahon ng error
- **User-Friendly Messages**: Malinaw na mensahe ng error para sa troubleshooting

## Mga Pagsasaalang-alang sa Seguridad

1. **Row Level Security**: Ang lahat ng queries ay sumusunod sa RLS policies batay sa pagkakakilanlan ng user
2. **Paghiwalay ng Data ng Store**: Ang bawat RLS User ID ng store ay tinitiyak ang access lamang sa data ng store na iyon
3. **Input Validation**: Ang mga pangalan ng table at queries ay validated bago patakbuhin
4. **Resource Limits**: Ang mga resulta ng query ay limitado upang maiwasan ang labis na paggamit ng resources
5. **Connection Security**: Gumagamit ng secure na database connection practices
6. **Pag-verify ng Pagkakakilanlan ng User**: Laging tiyakin na ang tamang RLS User ID ay ginagamit para sa intended na store location

### Mahalagang Tala sa Seguridad

- **Huwag kailanman gamitin ang production RLS User IDs sa development environments**
- **Laging tiyakin na ang RLS User ID ay tumutugma sa intended na store bago patakbuhin ang queries**
- **Ang default UUID (`00000000-0000-0000-0000-000000000000`) ay nagbibigay ng limitadong access**
- **Ang bawat store manager ay dapat lamang magkaroon ng access sa RLS User ID ng kanilang store**

## Pag-develop

### Estruktura ng Proyekto

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Mga Pangunahing Komponent

- **FastMCP Server**: Modern MCP server implementation na may async support
- **PostgreSQL Provider**: Database abstraction layer na may suporta sa RLS
- **Context Management**: Type-safe na application at request context handling
- **Tool Registration**: Declarative tool registration na may Pydantic validation

## Pag-aambag

Kapag nag-aambag sa server na ito:

1. Tiyakin na ang lahat ng database queries ay sumusunod sa Row Level Security
2. Magdagdag ng tamang error handling para sa mga bagong tools
3. I-update ang README na ito para sa anumang bagong tampok o pagbabago
4. Subukan ang HTTP server mode
5. I-validate ang input parameters at magbigay ng malinaw na mensahe ng error

## [Lisensya](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ang MCP server na ito ay nagbibigay-daan sa secure at mahusay na access sa Zava Retail sales data para sa AI-powered analysis at insights.*

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.