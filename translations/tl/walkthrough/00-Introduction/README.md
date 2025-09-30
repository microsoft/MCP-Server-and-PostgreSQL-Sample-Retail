<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-29T22:55:26+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "tl"
}
-->
# Panimula sa MCP Database Integration

## 🎯 Ano ang Saklaw ng Module na Ito

Ang introductory module na ito ay nagbibigay ng malawak na kaalaman tungkol sa pagbuo ng Model Context Protocol (MCP) servers na may database integration. Malalaman mo ang business case, teknikal na arkitektura, at mga aplikasyon sa totoong mundo gamit ang Zava Retail analytics use case.

## Pangkalahatang-ideya

**Model Context Protocol (MCP)** ay nagbibigay-daan sa mga AI assistants na ligtas na ma-access at makipag-ugnayan sa mga external na data sources nang real-time. Kapag isinama sa database integration, binubuksan ng MCP ang makapangyarihang kakayahan para sa mga aplikasyon ng AI na nakabatay sa datos.

Ang learning path na ito ay nagtuturo kung paano bumuo ng production-ready MCP servers na kumokonekta sa mga AI assistants sa retail sales data gamit ang PostgreSQL, na nagpatupad ng mga enterprise patterns tulad ng Row Level Security, semantic search, at multi-tenant data access.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng module na ito, magagawa mo ang sumusunod:

- **Ipaliwanag** ang Model Context Protocol at ang mga pangunahing benepisyo nito para sa database integration
- **Kilalanin** ang mga pangunahing bahagi ng arkitektura ng MCP server na may databases
- **Unawain** ang Zava Retail use case at ang mga business requirements nito
- **Tukuyin** ang mga enterprise patterns para sa ligtas at scalable na database access
- **Ilista** ang mga tools at teknolohiya na ginamit sa buong learning path

## 🧭 Ang Hamon: AI at Totoong Datos

### Mga Limitasyon ng Tradisyunal na AI

Bagamat napakalakas ng modernong AI assistants, may malalaking limitasyon ito pagdating sa paggamit ng totoong business data:

| **Hamon** | **Paglalarawan** | **Epekto sa Negosyo** |
|-----------|------------------|-----------------------|
| **Static Knowledge** | Ang mga AI models na sinanay sa fixed datasets ay hindi makaka-access sa kasalukuyang business data | Lipas na insights, nasayang na oportunidad |
| **Data Silos** | Ang impormasyon ay nakakulong sa databases, APIs, at mga sistema na hindi maabot ng AI | Hindi kumpletong pagsusuri, sirang workflows |
| **Security Constraints** | Ang direktang database access ay nagdudulot ng mga isyu sa seguridad at pagsunod sa regulasyon | Limitadong deployment, manual na paghahanda ng datos |
| **Complex Queries** | Kailangan ng teknikal na kaalaman ng mga business user para makuha ang data insights | Nabawasan ang paggamit, hindi epektibong proseso |

### Ang Solusyon ng MCP

Ang Model Context Protocol ay tumutugon sa mga hamon na ito sa pamamagitan ng:

- **Real-time Data Access**: Ang mga AI assistants ay maaaring mag-query sa live databases at APIs
- **Secure Integration**: Kinokontrol na access gamit ang authentication at permissions
- **Natural Language Interface**: Ang mga business user ay maaaring magtanong gamit ang simpleng Ingles
- **Standardized Protocol**: Gumagana sa iba't ibang AI platforms at tools

## 🏪 Kilalanin ang Zava Retail: Ang Ating Case Study

Sa buong learning path na ito, magtatayo tayo ng MCP server para sa **Zava Retail**, isang kathang-isip na DIY retail chain na may maraming lokasyon ng tindahan. Ang makatotohanang senaryong ito ay nagpapakita ng enterprise-grade MCP implementation.

### Business Context

**Zava Retail** ay may operasyon sa:
- **8 physical stores** sa Washington state (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online store** para sa e-commerce sales
- **Iba't ibang produkto** kabilang ang tools, hardware, garden supplies, at building materials
- **Multi-level management** na may store managers, regional managers, at executives

### Mga Pangangailangan sa Negosyo

Kailangan ng mga store managers at executives ng AI-powered analytics para sa:

1. **Pag-analisa ng sales performance** sa iba't ibang tindahan at panahon
2. **Pagsubaybay sa inventory levels** at pagtukoy ng mga pangangailangan sa restocking
3. **Pag-unawa sa customer behavior** at mga pattern ng pagbili
4. **Pagdiskubre ng product insights** gamit ang semantic search
5. **Pagbuo ng mga ulat** gamit ang natural language queries
6. **Pagpapanatili ng data security** gamit ang role-based access control

### Mga Pangangailangan sa Teknolohiya

Ang MCP server ay dapat magbigay ng:

- **Multi-tenant data access** kung saan makikita ng store managers ang data ng kanilang tindahan lamang
- **Flexible querying** na sumusuporta sa mga kumplikadong SQL operations
- **Semantic search** para sa product discovery at recommendations
- **Real-time data** na sumasalamin sa kasalukuyang estado ng negosyo
- **Secure authentication** gamit ang row-level security
- **Scalable architecture** na sumusuporta sa maraming sabay-sabay na user

## 🏗️ Pangkalahatang-ideya ng Arkitektura ng MCP Server

Ang MCP server natin ay nagpapatupad ng layered architecture na na-optimize para sa database integration:

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

### Mga Pangunahing Bahagi

#### **1. MCP Server Layer**
- **FastMCP Framework**: Modernong Python MCP server implementation
- **Tool Registration**: Declarative tool definitions na may type safety
- **Request Context**: User identity at session management
- **Error Handling**: Matibay na error management at logging

#### **2. Database Integration Layer**
- **Connection Pooling**: Efficient asyncpg connection management
- **Schema Provider**: Dynamic table schema discovery
- **Query Executor**: Secure SQL execution gamit ang RLS context
- **Transaction Management**: ACID compliance at rollback handling

#### **3. Security Layer**
- **Row Level Security**: PostgreSQL RLS para sa multi-tenant data isolation
- **User Identity**: Authentication at authorization ng store managers
- **Access Control**: Fine-grained permissions at audit trails
- **Input Validation**: SQL injection prevention at query validation

#### **4. AI Enhancement Layer**
- **Semantic Search**: Vector embeddings para sa product discovery
- **Azure OpenAI Integration**: Text embedding generation
- **Similarity Algorithms**: pgvector cosine similarity search
- **Search Optimization**: Indexing at performance tuning

## 🔧 Teknolohiyang Ginamit

### Core Technologies

| **Bahagi** | **Teknolohiya** | **Layunin** |
|------------|-----------------|-------------|
| **MCP Framework** | FastMCP (Python) | Modern MCP server implementation |
| **Database** | PostgreSQL 17 + pgvector | Relational data na may vector search |
| **AI Services** | Azure OpenAI | Text embeddings at language models |
| **Containerization** | Docker + Docker Compose | Development environment |
| **Cloud Platform** | Microsoft Azure | Production deployment |
| **IDE Integration** | VS Code | AI Chat at development workflow |

### Mga Development Tools

| **Tool** | **Layunin** |
|----------|-------------|
| **asyncpg** | High-performance PostgreSQL driver |
| **Pydantic** | Data validation at serialization |
| **Azure SDK** | Cloud service integration |
| **pytest** | Testing framework |
| **Docker** | Containerization at deployment |

### Production Stack

| **Serbisyo** | **Azure Resource** | **Layunin** |
|--------------|--------------------|-------------|
| **Database** | Azure Database for PostgreSQL | Managed database service |
| **Container** | Azure Container Apps | Serverless container hosting |
| **AI Services** | Azure AI Foundry | OpenAI models at endpoints |
| **Monitoring** | Application Insights | Observability at diagnostics |
| **Security** | Azure Key Vault | Secrets at configuration management |

## 🎬 Mga Senaryo ng Paggamit sa Totoong Mundo

Tingnan natin kung paano nakikipag-ugnayan ang iba't ibang user sa ating MCP server:

### Senaryo 1: Pagrepaso ng Performance ng Store Manager

**User**: Sarah, Seattle Store Manager  
**Layunin**: Analisa ng sales performance noong nakaraang quarter

**Natural Language Query**:
> "Ipakita ang top 10 products ayon sa revenue para sa aking tindahan noong Q4 2024"

**Ano ang Nangyayari**:
1. Ang VS Code AI Chat ay nagpapadala ng query sa MCP server
2. Ang MCP server ay kinikilala ang store context ni Sarah (Seattle)
3. Ang RLS policies ay nag-filter ng data para sa Seattle store lamang
4. Ang SQL query ay nabuo at naisagawa
5. Ang resulta ay na-format at ibinalik sa AI Chat
6. Ang AI ay nagbibigay ng analysis at insights

### Senaryo 2: Product Discovery gamit ang Semantic Search

**User**: Mike, Inventory Manager  
**Layunin**: Maghanap ng mga produktong katulad ng request ng customer

**Natural Language Query**:
> "Anong mga produkto ang ibinebenta natin na katulad ng 'waterproof electrical connectors para sa outdoor use'?"

**Ano ang Nangyayari**:
1. Ang query ay pinoproseso ng semantic search tool
2. Ang Azure OpenAI ay bumubuo ng embedding vector
3. Ang pgvector ay nagsasagawa ng similarity search
4. Ang mga kaugnay na produkto ay niraranggo ayon sa relevance
5. Ang resulta ay naglalaman ng detalye ng produkto at availability
6. Ang AI ay nagmumungkahi ng alternatibo at bundling opportunities

### Senaryo 3: Cross-Store Analytics

**User**: Jennifer, Regional Manager  
**Layunin**: Ihambing ang performance sa lahat ng tindahan

**Natural Language Query**:
> "Ihambing ang sales ayon sa category para sa lahat ng tindahan sa nakaraang 6 na buwan"

**Ano ang Nangyayari**:
1. Ang RLS context ay itinakda para sa regional manager access
2. Ang kumplikadong multi-store query ay nabuo
3. Ang data ay naipon mula sa iba't ibang lokasyon ng tindahan
4. Ang resulta ay naglalaman ng trends at comparisons
5. Ang AI ay nagtatukoy ng insights at recommendations

## 🔒 Malalim na Pagsusuri sa Seguridad at Multi-Tenancy

Ang ating implementasyon ay inuuna ang enterprise-grade security:

### Row Level Security (RLS)

Ang PostgreSQL RLS ay nagsisiguro ng data isolation:

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

### Pamamahala ng User Identity

Ang bawat MCP connection ay naglalaman ng:
- **Store Manager ID**: Natatanging identifier para sa RLS context
- **Role Assignment**: Permissions at access levels
- **Session Management**: Secure authentication tokens
- **Audit Logging**: Kumpletong access history

### Proteksyon ng Datos

Maraming layer ng seguridad:
- **Connection Encryption**: TLS para sa lahat ng database connections
- **SQL Injection Prevention**: Parameterized queries lamang
- **Input Validation**: Comprehensive request validation
- **Error Handling**: Walang sensitibong datos sa error messages

## 🎯 Mga Pangunahing Puntos

Pagkatapos makumpleto ang introduction na ito, dapat mong maunawaan:

✅ **MCP Value Proposition**: Paano pinagsasama ng MCP ang AI assistants at totoong datos  
✅ **Business Context**: Ang mga pangangailangan at hamon ng Zava Retail  
✅ **Architecture Overview**: Mga pangunahing bahagi at ang kanilang interaksyon  
✅ **Technology Stack**: Mga tools at frameworks na ginamit sa buong proseso  
✅ **Security Model**: Multi-tenant data access at proteksyon  
✅ **Usage Patterns**: Mga senaryo ng query sa totoong mundo at workflows  

## 🚀 Ano ang Susunod

Handa ka na bang magpatuloy? Ipagpatuloy sa:

**[Module 01: Core Architecture Concepts](../01-Architecture/README.md)**

Alamin ang mga pattern ng arkitektura ng MCP server, mga prinsipyo ng database design, at ang detalyadong teknikal na implementasyon na nagpapatakbo ng ating retail analytics solution.

## 📚 Karagdagang Resources

### MCP Documentation
- [MCP Specification](https://modelcontextprotocol.io/docs/) - Opisyal na dokumentasyon ng protocol
- [MCP for Beginners](https://aka.ms/mcp-for-beginners) - Komprehensibong gabay sa MCP
- [FastMCP Documentation](https://github.com/modelcontextprotocol/python-sdk) - Dokumentasyon ng Python SDK

### Database Integration
- [PostgreSQL Documentation](https://www.postgresql.org/docs/) - Kumpletong reference ng PostgreSQL
- [pgvector Guide](https://github.com/pgvector/pgvector) - Dokumentasyon ng vector extension
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - Gabay sa PostgreSQL RLS

### Azure Services
- [Azure OpenAI Documentation](https://docs.microsoft.com/azure/cognitive-services/openai/) - AI service integration
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Managed database service
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Serverless containers

---

**Disclaimer**: Ito ay isang learning exercise gamit ang kathang-isip na retail data. Palaging sundin ang data governance at security policies ng inyong organisasyon kapag nagpatupad ng katulad na solusyon sa production environments.

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.