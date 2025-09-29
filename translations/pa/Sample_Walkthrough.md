<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T20:35:05+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "pa"
}
-->
# MCP ਸਰਵਰ ਅਤੇ PostgreSQL ਨਮੂਨਾ - ਪੂਰੀ ਗਾਈਡ

## ਸੂਚੀ
1. [ਜਾਣ-ਪਛਾਣ](../..)
2. [ਆਰਕੀਟੈਕਚਰ ਦੀ ਵਿਸਤਾਰ ਨਾਲ ਸਮਝ](../..)
3. [ਹੱਲ ਬਣਾਉਣਾ](../..)
4. [ਘਟਕਾਂ ਦੀ ਵਿਸਤਾਰ](../..)
5. [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](../..)
6. [ਹੱਲ ਦੀ ਵਰਤੋਂ](../..)
7. [ਉੱਚ-ਸਤ੍ਹਾ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ](../..)
8. [ਮਸਲੇ ਹੱਲ](../..)
9. [ਸਰਵੋਤਮ ਅਭਿਆਸ](../..)

## ਜਾਣ-ਪਛਾਣ

ਇਹ ਗਾਈਡ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ **Model Context Protocol (MCP) ਸਰਵਰ** ਨੂੰ PostgreSQL ਅਤੇ Azure AI ਸੇਵਾਵਾਂ ਨਾਲ ਕਿਵੇਂ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ। ਇਹ ਨਮੂਨਾ ਉਦਯੋਗ-ਪੱਧਰ ਦੇ ਪੈਟਰਨਾਂ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ ਜਿਵੇਂ ਕਿ Row Level Security, semantic search, ਅਤੇ multi-tenant ਡਾਟਾ ਐਕਸੈਸ।

### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- MCP ਸਰਵਰ ਨੂੰ ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਕਿਵੇਂ ਡਿਜ਼ਾਈਨ ਕਰਨਾ ਹੈ
- Multi-tenant ਸਥਿਤੀਆਂ ਲਈ Row Level Security ਲਾਗੂ ਕਰਨਾ
- Azure OpenAI embeddings ਨਾਲ semantic search ਬਣਾਉਣਾ
- Docker-ਅਧਾਰਿਤ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਬਣਾਉਣਾ
- Bicep ਟੈਂਪਲੇਟਾਂ ਨਾਲ Azure ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਡਿਪਲੌਇ ਕਰਨਾ
- VS Code ਨਾਲ AI-ਚਾਲਤ ਵਿਸ਼ਲੇਸ਼ਣ ਨੂੰ ਜੋੜਨਾ

### ਵਰਤੀਆਂ ਗਈਆਂ ਤਕਨਾਲੋਜੀਆਂ
- **MCP Protocol**: AI ਟੂਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਲਈ Model Context Protocol
- **FastMCP**: ਆਧੁਨਿਕ Python MCP ਸਰਵਰ ਫਰੇਮਵਰਕ
- **PostgreSQL**: pgvector ਐਕਸਟੈਂਸ਼ਨ ਨਾਲ semantic search ਲਈ ਡਾਟਾਬੇਸ
- **Azure OpenAI**: ਟੈਕਸਟ embeddings ਅਤੇ GPT ਮਾਡਲ (ਵਿਕਲਪਿਕ)
- **Docker**: ਸਥਿਰ ਵਾਤਾਵਰਣ ਲਈ ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ
- **Bicep**: Azure ਸਰੋਤਾਂ ਲਈ Infrastructure as Code
- **VS Code**: MCP ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਵਿਕਾਸ ਵਾਤਾਵਰਣ

## 📚 ਸੰਰਚਿਤ ਸਿੱਖਣ ਗਾਈਡ: /walkthrough

ਇਸ ਤਕਨੀਕੀ ਗਾਈਡ ਦੇ ਨਾਲ, ਇਸ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ `/walkthrough` ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਇੱਕ ਵਿਸਤ੍ਰਿਤ **12-ਮਾਡਿਊਲ ਸਿੱਖਣ ਗਾਈਡ** ਸ਼ਾਮਲ ਹੈ। ਇਹ ਸੰਰਚਿਤ ਪਹੁੰਚ ਜਟਿਲ ਲਾਗੂਕਰਨ ਨੂੰ ਸੌਖੇ ਸਿੱਖਣ ਮਾਡਿਊਲਾਂ ਵਿੱਚ ਵੰਡਦੀ ਹੈ, ਜੋ ਵਿਕਾਸਕਾਰਾਂ ਲਈ ਹਰ ਘਟਕ ਨੂੰ ਕਦਮ-ਦਰ-ਕਦਮ ਸਮਝਣ ਲਈ ਬਹੁਤ ਹੀ ਉਪਯੋਗ ਹੈ।

### ਸਿੱਖਣ ਮਾਡਿਊਲਾਂ ਦੀ ਝਲਕ

| ਮਾਡਿਊਲ | ਵਿਸ਼ਾ | ਫੋਕਸ | ਸਮਾਂ |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP ਮੂਲ ਭੂਤ | ਮੁੱਖ ਧਾਰਨਾਵਾਂ, Zava Retail ਕੇਸ ਸਟਡੀ, ਆਰਕੀਟੈਕਚਰ ਝਲਕ | 30 ਮਿੰਟ |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | ਸਿਸਟਮ ਡਿਜ਼ਾਈਨ | ਤਕਨੀਕੀ ਆਰਕੀਟੈਕਚਰ, ਡਿਜ਼ਾਈਨ ਪੈਟਰਨ, ਘਟਕਾਂ ਦੇ ਸੰਬੰਧ | 45 ਮਿੰਟ |
| **[02-Security](walkthrough/02-Security/README.md)** | ਉਦਯੋਗ ਸੁਰੱਖਿਆ | Azure ਪ੍ਰਮਾਣਿਕਤਾ, Row Level Security, multi-tenant isolation | 60 ਮਿੰਟ |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ਵਾਤਾਵਰਣ ਸੈਟਅੱਪ | Docker ਸੰਰਚਨਾ, Azure CLI, ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤ | 45 ਮਿੰਟ |
| **[04-Database](walkthrough/04-Database/README.md)** | ਡਾਟਾ ਲੇਅਰ | PostgreSQL schema, pgvector ਸੈਟਅੱਪ, RLS ਨੀਤੀਆਂ, ਨਮੂਨਾ ਡਾਟਾ | 60 ਮਿੰਟ |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | ਮੁੱਖ ਲਾਗੂਕਰਨ | FastMCP ਫਰੇਮਵਰਕ, ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਟੂਲ ਵਿਕਾਸ | 90 ਮਿੰਟ |
| **[06-Tools](walkthrough/06-Tools/README.md)** | ਟੂਲ ਵਿਕਾਸ | MCP ਟੂਲ ਬਣਾਉਣਾ, ਕਵੈਰੀ ਵੈਰੀਫਿਕੇਸ਼ਨ, ਬਿਜ਼ਨਸ ਇੰਟੈਲੀਜੈਂਸ | 75 ਮਿੰਟ |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI ਇੰਟੀਗ੍ਰੇਸ਼ਨ | Azure OpenAI embeddings, vector search, hybrid queries | 60 ਮਿੰਟ |
| **[08-Testing](walkthrough/08-Testing/README.md)** | ਗੁਣਵੱਤਾ ਅਸ਼ਵਾਸਨ | ਟੈਸਟਿੰਗ ਰਣਨੀਤੀਆਂ, ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ, ਪ੍ਰਦਰਸ਼ਨ ਟੈਸਟਿੰਗ | 75 ਮਿੰਟ |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ਵਿਕਾਸ ਅਨੁਭਵ | VS Code ਸੰਰਚਨਾ, AI Chat ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਡੀਬੱਗਿੰਗ ਵਰਕਫਲੋ | 45 ਮਿੰਟ |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ | ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, Azure Container Apps, CI/CD pipelines | 90 ਮਿੰਟ |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | ਨਿਗਰਾਨੀ | Application Insights, ਸੰਰਚਿਤ ਲੌਗਿੰਗ, ਪ੍ਰਦਰਸ਼ਨ ਮੈਟ੍ਰਿਕਸ | 60 ਮਿੰਟ |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | ਪ੍ਰੋਡਕਸ਼ਨ ਸ਼੍ਰੇਸ਼ਠਤਾ | ਸੁਰੱਖਿਆ ਮਜ਼ਬੂਤੀ, ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ, ਉਦਯੋਗ ਪੈਟਰਨ | 45 ਮਿੰਟ |

### ਸਿੱਖਣ ਗਾਈਡ ਦੀ ਵਰਤੋਂ ਕਿਵੇਂ ਕਰਨੀ ਹੈ

**📖 ਸਿੱਖਣ ਲਈ**: `/walkthrough` ਮਾਡਿਊਲ ਕਦਮ-ਦਰ-ਕਦਮ ਹਦਾਇਤਾਂ ਪ੍ਰਦਾਨ ਕਰਦੇ ਹਨ ਅਤੇ ਹਰ ਘਟਕ ਕਿਵੇਂ ਡਿਜ਼ਾਈਨ ਕੀਤਾ ਗਿਆ ਹੈ ਇਸ ਦੀ ਵਜ੍ਹਾ ਵੀ ਸਮਝਾਉਂਦੇ ਹਨ। ਮਾਡਿਊਲ 00 ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਲਗਾਤਾਰ ਅਗੇ ਵਧੋ।

**🔧 ਲਾਗੂਕਰਨ ਲਈ**: ਇਹ Sample_Walkthrough.md ਵਿਕਾਸਕਾਰਾਂ ਲਈ ਤਕਨੀਕੀ ਵਿਸਤਾਰ ਅਤੇ ਕੋਡ ਵਿਸ਼ਲੇਸ਼ਣ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ ਜੋ ਪੂਰੇ ਲਾਗੂਕਰਨ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਸਮਝਣਾ ਚਾਹੁੰਦੇ ਹਨ।

**🚀 ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ**: ਮਾਡਿਊਲ 02, 10, 11, ਅਤੇ 12 ਖਾਸ ਤੌਰ 'ਤੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ, ਸੁਰੱਖਿਆ, ਅਤੇ ਨਿਗਰਾਨੀ ਵਿਚਾਰਾਂ 'ਤੇ ਧਿਆਨ ਕੇਂਦਰਿਤ ਕਰਦੇ ਹਨ।

**📚 ਪੂਰੀ ਸਿੱਖਣ ਪਾਥ**: ਵਿਸ਼ੇਸ਼ ਸਿੱਖਣ ਉਦੇਸ਼ਾਂ ਅਤੇ ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੇ ਨਾਲ ਪੂਰੀ ਸਿੱਖਣ ਗਾਈਡ ਝਲਕ ਲਈ **[/walkthrough/README.md](walkthrough/README.md)** 'ਤੇ ਜਾਓ।

---

## ਆਰਕੀਟੈਕਚਰ ਦੀ ਵਿਸਤਾਰ ਨਾਲ ਸਮਝ

### ਉੱਚ-ਸਤ੍ਹਾ ਆਰਕੀਟੈਕਚਰ

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   VS Code AI    │    │   MCP Server    │    │   PostgreSQL    │
│     Client      │◄──►│  (FastMCP)      │◄──►│   + pgvector    │
│                 │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │
                                ▼
                       ┌─────────────────┐
                       │  Azure OpenAI   │
                       │   Embeddings    │
                       └─────────────────┘
```

### ਮੁੱਖ ਘਟਕ

#### 1. **MCP ਸਰਵਰ (`sales_analysis.py`)**
- **FastMCP Framework**: HTTP/SSE ਪ੍ਰੋਟੋਕੋਲ ਸੰਚਾਰ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ
- **Tool Registration**: ਡਾਟਾਬੇਸ ਕਵੈਰੀ ਅਤੇ schema ਟੂਲ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ
- **Request Context**: RLS ਯੂਜ਼ਰ ਪਛਾਣ ਨੂੰ ਸੰਭਾਲਦਾ ਹੈ
- **Error Handling**: ਮਜ਼ਬੂਤ ਗਲਤੀ ਪ੍ਰਬੰਧਨ ਅਤੇ ਲੌਗਿੰਗ

#### 2. **ਡਾਟਾਬੇਸ ਲੇਅਰ (`sales_analysis_postgres.py`)**
- **Connection Pooling**: ਕੁਸ਼ਲ asyncpg ਕਨੈਕਸ਼ਨ ਪ੍ਰਬੰਧਨ
- **Schema Provider**: ਗਤੀਸ਼ੀਲ ਟੇਬਲ schema ਖੋਜ
- **Query Execution**: RLS ਨਾਲ ਸੁਰੱਖਿਅਤ SQL ਲਾਗੂਕਰਨ
- **Semantic Search**: pgvector ਨਾਲ vector similarity search

#### 3. **Configuration Management (`config.py`)**
- **Environment Variables**: ਕੇਂਦਰੀਕ੍ਰਿਤ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ
- **Connection Parameters**: ਡਾਟਾਬੇਸ ਅਤੇ Azure ਸੇਵਾ ਸੰਰਚਨਾ
- **Validation**: ਲੋੜੀਂਦੇ environment variable ਦੀ ਜਾਂਚ

#### 4. **Infrastructure (`infra/`)**
- **Bicep Templates**: Azure ਸਰੋਤਾਂ ਦੀ ਘੋਸ਼ਣਾ
- **Model Deployment**: AI ਮਾਡਲ ਦੀ ਸਵੈਚਾਲਿਤ ਡਿਪਲੌਇਮੈਂਟ
- **Role Assignments**: ਸੁਰੱਖਿਆ ਭੂਮਿਕਾ ਸੰਰਚਨਾ

### ਡਾਟਾ ਫਲੋ

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## ਹੱਲ ਬਣਾਉਣਾ

### ਕਦਮ 1: ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ ਸੈਟਅੱਪ

```
project/
├── mcp_server/              # MCP server implementation
│   ├── __init__.py         # Package initialization
│   ├── sales_analysis.py   # Main MCP server
│   ├── sales_analysis_postgres.py  # Database layer
│   ├── sales_analysis_text_embeddings.py  # Semantic search
│   └── config.py           # Configuration management
├── infra/                  # Infrastructure as Code
│   ├── main.bicep          # Main deployment template
│   ├── foundry.bicep       # Azure AI Foundry setup
│   ├── deploy.ps1          # Windows deployment script
│   └── deploy.sh           # Unix deployment script
├── data/                   # Database backup and initialization
├── docker-init/            # Database initialization scripts
├── .vscode/                # VS Code MCP configuration
├── docker-compose.yml      # Development environment
├── Dockerfile             # MCP server container
└── requirements.lock.txt   # Python dependencies
```

### ਕਦਮ 2: ਮੁੱਖ Dependencies

**Python Requirements:**
```python
# MCP Framework
mcp[server]>=0.5.0
fastmcp>=0.4.0

# Database Integration
asyncpg>=0.29.0
asyncio-rlock>=0.3.0

# Azure Integration
azure-ai-projects>=1.0.0
azure-identity>=1.19.0
azure-monitor-opentelemetry>=1.7.0

# Data Processing
pydantic>=2.9.0
numpy>=1.24.0

# Development
python-dotenv>=1.0.0
```

**ਸਿਸਟਮ Requirements:**
- Docker Desktop ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ ਲਈ
- Azure CLI ਡਿਪਲੌਇਮੈਂਟ ਲਈ
- PostgreSQL pgvector ਐਕਸਟੈਂਸ਼ਨ ਨਾਲ
- VS Code AI ਐਕਸਟੈਂਸ਼ਨ ਨਾਲ

### ਕਦਮ 3: ਡਾਟਾਬੇਸ schema ਡਿਜ਼ਾਈਨ

ਨਮੂਨਾ ਇੱਕ ਰਿਟੇਲ ਡਾਟਾਬੇਸ ਵਰਤਦਾ ਹੈ ਜਿਸ ਵਿੱਚ ਇਹ ਮੁੱਖ ਟੇਬਲ ਹਨ:

```sql
-- Core business entities
retail.stores          -- Store locations and metadata
retail.customers       -- Customer profiles
retail.categories      -- Product categorization
retail.product_types   -- Product type definitions
retail.products        -- Product catalog
retail.orders          -- Customer orders
retail.order_items     -- Order line items
retail.inventory       -- Stock levels

-- Semantic search support
retail.product_description_embeddings  -- Vector embeddings for products
```

**Row Level Security (RLS) ਲਾਗੂਕਰਨ:**
```sql
-- Enable RLS on tables
ALTER TABLE retail.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE retail.customers ENABLE ROW LEVEL SECURITY;

-- Create policies based on store association
CREATE POLICY store_policy ON retail.orders
  FOR ALL TO PUBLIC
  USING (store_id = get_user_store_id());
```

---

## ਘਟਕਾਂ ਦੀ ਵਿਸਤਾਰ

### MCP ਸਰਵਰ ਕੋਰ (`sales_analysis.py`)

#### Tool Registration Pattern
```python
@mcp.tool()
async def execute_sales_query(
    ctx: Context,
    postgresql_query: Annotated[str, Field(description="A well-formed PostgreSQL query.")],
) -> str:
    """Execute PostgreSQL queries with Row Level Security."""
    rls_user_id = get_rls_user_id(ctx)
    
    try:
        return await db_provider.execute_query(
            postgresql_query, rls_user_id=rls_user_id
        )
    except Exception as e:
        logger.error("Error executing database query: %s", e)
        return f"Error executing database query: {e!s}"
```

**ਮੁੱਖ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ:**
- **Type Annotations**: Pydantic ਫੀਲਡ ਵਰਣਨ AI ਸਮਝਣ ਲਈ
- **Context Extraction**: HTTP headers ਤੋਂ ਯੂਜ਼ਰ ਪਛਾਣ
- **Error Handling**: ਸੂਚਨਾਤਮਕ ਸੁਨੇਹਿਆਂ ਨਾਲ ਸੁਗਮ ਫੇਲ
- **Logging**: ਵਿਸਤ੍ਰਿਤ ਕਾਰਵਾਈ ਲੌਗਿੰਗ

#### Request Context Management
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### ਡਾਟਾਬੇਸ ਲੇਅਰ (`sales_analysis_postgres.py`)

#### Connection Pool Management
```python
class PostgreSQLSchemaProvider:
    async def create_pool(self) -> None:
        """Create connection pool for better resource management."""
        if self.connection_pool is None:
            config_copy = dict(self.postgres_config)
            existing_server_settings = config_copy.pop("server_settings", {})
            
            merged_server_settings = {
                **existing_server_settings,
                "jit": "off",  # Disable JIT to reduce memory usage
                "work_mem": "4MB",  # Limit work memory per query
                "statement_timeout": "30s",  # 30 second statement timeout
            }
            
            self.connection_pool = await asyncpg.create_pool(
                **config_copy,
                min_size=1,
                max_size=3,  # Conservative pool size
                command_timeout=30,
                server_settings=merged_server_settings,
            )
```

**ਡਿਜ਼ਾਈਨ ਪੈਟਰਨ:**
- **Resource Management**: ਪੂਲ lifecycle ਦਾ ਸਹੀ ਪ੍ਰਬੰਧਨ
- **Performance Tuning**: PostgreSQL ਸੈਟਿੰਗਾਂ ਦਾ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ
- **Error Recovery**: ਕਨੈਕਸ਼ਨ retry ਅਤੇ fallback ਲੌਜਿਕ
- **Security**: RLS context ਸੈਟਿੰਗ ਪ੍ਰਤੀ ਕਨੈਕਸ਼ਨ

#### Schema Introspection
```python
async def get_table_schema(self, table_name: str, rls_user_id: str) -> Dict[str, Any]:
    """Return comprehensive schema information for a table."""
    conn = await self.get_connection()
    
    # Set RLS context
    await conn.execute(
        "SELECT set_config('app.current_rls_user_id', $1, false)", 
        rls_user_id
    )
    
    # Get column information
    columns = await conn.fetch("""
        SELECT column_name, data_type, is_nullable, column_default
        FROM information_schema.columns 
        WHERE table_schema = $1 AND table_name = $2
        ORDER BY ordinal_position
    """, schema_name, table_name)
    
    # Get foreign key relationships
    foreign_keys = await conn.fetch("""
        SELECT kcu.column_name, ccu.table_name AS foreign_table_name
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu ON ...
    """)
```

### Semantic Search Integration

#### Embedding Generation
```python
class SemanticSearchTextEmbedding:
    def generate_query_embedding(self, query: str) -> Optional[List[float]]:
        """Generate embeddings using Azure OpenAI."""
        try:
            response = self.client.embeddings.create(
                input=[query],
                model=self.deployment_name
            )
            return response.data[0].embedding
        except Exception as e:
            logger.error("Embedding generation failed: %s", e)
            return None
```

#### Vector Similarity Search
```python
async def search_products_by_similarity(
    self,
    query_embedding: List[float],
    rls_user_id: str,
    max_rows: int = 20,
    similarity_threshold: float = 30.0,
) -> str:
    """Search products using pgvector cosine similarity."""
    
    # Convert similarity percentage to distance threshold
    distance_threshold = 1.0 - (similarity_threshold / 100.0)
    
    query = f"""
        SELECT p.*, (pde.description_embedding <=> $1::vector) as distance
        FROM {SCHEMA_NAME}.product_description_embeddings pde
        JOIN {SCHEMA_NAME}.products p ON pde.product_id = p.product_id
        WHERE (pde.description_embedding <=> $1::vector) <= $3
        ORDER BY distance
        LIMIT $2
    """
    
    rows = await conn.fetch(query, embedding_str, max_rows, distance_threshold)
```

---

## ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ

### Azure Infrastructure Deployment

#### 1. **Bicep Template Structure**

**Main Template (`main.bicep`):**
```bicep
targetScope = 'subscription'

// Core parameters
param resourcePrefix string
param location string
param models array = [
  {
    name: 'text-embedding-3-small'
    format: 'OpenAI'
    version: '1'
    capacity: 50
  }
]

// Deploy foundry and project resources
module foundry 'foundry.bicep' = {
  name: 'foundry-account-deployment'
  scope: rg
  params: {
    foundryResourceName: foundryResourceName
    location: location
  }
}

module foundryProject 'foundry-project.bicep' = {
  name: 'foundry-project-deployment'
  scope: rg
  dependsOn: [foundry]
  params: {
    foundryResourceName: foundry.outputs.accountName
    aiProjectName: aiProjectName
  }
}
```

#### 2. **Deployment Automation**

**PowerShell Deployment (`deploy.ps1`):**
```powershell
# Generate unique suffix for resources
$UNIQUE_SUFFIX = -join ((97..122) + (48..57) | Get-Random -Count 4 | ForEach-Object { [char]$_ })

# Deploy Azure resources
az deployment sub create `
  --name "$DEPLOYMENT_NAME" `
  --location "$RG_LOCATION" `
  --template-file main.bicep `
  --parameters location="$RG_LOCATION" `
  --parameters resourcePrefix="$RESOURCE_PREFIX" `
  --parameters uniqueSuffix="$UNIQUE_SUFFIX" `
  --parameters models="$modelsJson"

# Create service principal for authentication
$spResult = az ad sp create-for-rbac `
    --name "zava-mcp-server-sp" `
    --role "Cognitive Services OpenAI User" `
    --scopes "/subscriptions/$SubId/resourceGroups/$RESOURCE_GROUP_NAME"

# Generate .env file with configuration
@"
PROJECT_ENDPOINT=$PROJECTS_ENDPOINT
AZURE_OPENAI_ENDPOINT=$AZURE_OPENAI_ENDPOINT
EMBEDDING_MODEL_DEPLOYMENT_NAME="text-embedding-3-small"
AZURE_CLIENT_ID=$clientId
AZURE_CLIENT_SECRET=$clientSecret
AZURE_TENANT_ID=$tenantId
"@ | Out-File -FilePath "../.env"
```

### ਸਥਾਨਕ ਵਿਕਾਸ ਸੈਟਅੱਪ

#### 1. **Docker Compose Configuration**
```yaml
# docker-compose.yml
version: '3.8'
services:
  postgres:
    image: pgvector/pgvector:pg17
    environment:
      - POSTGRES_INITDB_ARGS=--auth-host=scram-sha-256
    volumes:
      - ./data:/backup_data:ro
      - ./docker-init:/docker-entrypoint-initdb.d:ro
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d zava"]
      interval: 15s
      retries: 5

  mcp_server:
    build: .
    depends_on:
      postgres:
        condition: service_healthy
    ports:
      - "8000:8000"
    env_file:
      - .env
```

#### 2. **ਡਾਟਾਬੇਸ Initialization**
```bash
# docker-init/init-db.sh
#!/bin/bash
set -e

# Create extensions
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS vector;
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL

# Restore database backup
if [ -f /backup_data/zava_retail_2025_07_21_postgres_rls.backup ]; then
    pg_restore --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" \
               --verbose --clean --no-acl --no-owner \
               /backup_data/zava_retail_2025_07_21_postgres_rls.backup
fi
```

---

## ਹੱਲ ਦੀ ਵਰਤੋਂ

### VS Code Integration

#### 1. **MCP Configuration (`.vscode/mcp.json`)**
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
        }
    }
}
```

#### 2. **ਕਵੈਰੀ Examples**

**Schema Discovery:**
```
AI: #zava What tables are available in the database?
```
*MCP ਸਰਵਰ `get_multiple_table_schemas` ਵਰਤਦਾ ਹੈ ਟੇਬਲ ਸੰਰਚਨਾਵਾਂ ਵਾਪਸ ਕਰਨ ਲਈ*

**Sales Analysis:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*ਸਹੀ joins ਅਤੇ date filtering ਨਾਲ SQL ਬਣਾਉਂਦਾ ਹੈ*

**Semantic Search:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Embeddings ਵਰਤ ਕੇ semantically similar products ਲੱਭਦਾ ਹੈ*

**Multi-Store Analysis:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS ਸਿਰਫ Seattle store ਡਾਟਾ ਤੱਕ ਪਹੁੰਚ ਯਕੀਨੀ ਬਣਾਉਂਦਾ ਹੈ*

### ਉੱਚ-ਸਤ੍ਹਾ ਕਵੈਰੀ ਪੈਟਰਨ

#### 1. **Time-Series Analysis**
```sql
-- Generated by AI through MCP server
SELECT 
    DATE_TRUNC('month', o.order_date) as month,
    SUM(oi.total_amount) as revenue,
    COUNT(DISTINCT o.order_id) as order_count
FROM retail.orders o
JOIN retail.order_items oi ON o.order_id = oi.order_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '12 months'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;
```

#### 2. **Product Performance with Categories**
```sql
-- AI generates complex joins using schema information
SELECT 
    c.category_name,
    pt.type_name,
    COUNT(DISTINCT p.product_id) as product_count,
    SUM(oi.total_amount) as total_revenue,
    AVG(oi.unit_price) as avg_price
FROM retail.products p
JOIN retail.categories c ON p.category_id = c.category_id
JOIN retail.product_types pt ON p.product_type_id = pt.product_type_id
JOIN retail.order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name, pt.type_name
ORDER BY total_revenue DESC;
```

---

## ਉੱਚ-ਸਤ੍ਹਾ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ

### Row Level Security ਲਾਗੂਕਰਨ

#### 1. **Policy Creation**
```sql
-- Store-based access control
CREATE POLICY customer_store_policy ON retail.customers
  FOR ALL TO PUBLIC
  USING (store_id = get_current_store_id());

CREATE POLICY order_store_policy ON retail.orders  
  FOR ALL TO PUBLIC
  USING (store_id = get_current_store_id());

-- Function to get current user's store
CREATE OR REPLACE FUNCTION get_current_store_id()
RETURNS uuid AS $$
BEGIN
  RETURN current_setting('app.current_rls_user_id')::uuid;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

#### 2. **Context Setting in MCP Server**
```python
async def execute_query(self, sql_query: str, rls_user_id: str) -> str:
    """Execute query with RLS context."""
    conn = await self.get_connection()
    
    # Set RLS context for this connection
    await conn.execute(
        "SELECT set_config('app.current_rls_user_id', $1, false)", 
        rls_user_id
    )
    
    # Execute user query with RLS filtering
    rows = await conn.fetch(sql_query)
    return self.format_results(rows)
```

### Semantic Search Deep Dive

#### 1. **Embedding Pipeline**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Similarity Search Optimization**
```sql
-- Create vector index for performance
CREATE INDEX idx_product_embeddings_vector 
ON retail.product_description_embeddings 
USING ivfflat (description_embedding vector_cosine_ops);

-- Optimized similarity query
SELECT p.*, 
       (pde.description_embedding <=> $1::vector) as distance,
       (1 - (pde.description_embedding <=> $1::vector)) * 100 as similarity_percent
FROM retail.product_description_embeddings pde
JOIN retail.products p ON pde.product_id = p.product_id
WHERE (pde.description_embedding <=> $1::vector) < 0.7  -- 30% similarity threshold
ORDER BY distance
LIMIT 20;
```

### ਨਿਗਰਾਨੀ ਅਤੇ ਦ੍ਰਿਸ਼ਟਾਅਨ

#### 1. **Azure Application Insights Integration**
```python
# Configure telemetry
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry.instrumentation.starlette import StarletteInstrumentor

# Enable monitoring if configured
if config.applicationinsights_connection_string:
    configure_azure_monitor(
        connection_string=config.applicationinsights_connection_string
    )
    StarletteInstrumentor().instrument_app(mcp.sse_app())
```

#### 2. **Custom Metrics and Logging**
```python
# Query execution tracking
@contextmanager
async def track_query_execution(query_type: str):
    start_time = time.time()
    try:
        yield
        duration = time.time() - start_time
        logger.info("Query executed", extra={
            "query_type": query_type,
            "duration_ms": duration * 1000,
            "status": "success"
        })
    except Exception as e:
        duration = time.time() - start_time
        logger.error("Query failed", extra={
            "query_type": query_type,
            "duration_ms": duration * 1000,
            "status": "error",
            "error": str(e)
        })
        raise
```

---

## ਮਸਲੇ ਹੱਲ

### ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

#### 1. **ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਸਮੱਸਿਆਵਾਂ**
```python
# Connection diagnostics
async def diagnose_connection():
    try:
        pool = await asyncpg.create_pool(**connection_params, min_size=1)
        conn = await pool.acquire()
        result = await conn.fetchval("SELECT 1")
        await pool.release(conn)
        await pool.close()
        return True
    except Exception as e:
        logger.error("Connection failed: %s", e)
        return False
```

**ਆਮ ਹੱਲ:**
- PostgreSQL ਚਲ ਰਿਹਾ ਹੈ ਜਾਂ ਨਹੀਂ ਜਾਂਚੋ: `docker ps`
- `.env` ਵਿੱਚ ਕਨੈਕਸ਼ਨ ਪੈਰਾਮੀਟਰ ਚੈੱਕ ਕਰੋ
- ਡਾਟਾਬੇਸ ਮੌਜੂਦ ਹੈ ਜਾਂ ਨਹੀਂ ਜਾਂਚੋ: `docker exec -it pg17 psql -U postgres -l`
- ਨੈਟਵਰਕ ਕਨੈਕਟਿਵਿਟੀ ਟੈਸਟ ਕਰੋ: `telnet localhost 5432`

#### 2. **RLS ਨੀਤੀ ਸਮੱਸਿਆਵਾਂ**
```sql
-- Debug RLS policies
SELECT schemaname, tablename, policyname, cmd, qual 
FROM pg_policies 
WHERE schemaname = 'retail';

-- Check current RLS setting
SELECT current_setting('app.current_rls_user_id');

-- Temporarily disable RLS for debugging
ALTER TABLE retail.orders DISABLE ROW LEVEL SECURITY;
```

#### 3. **Embedding ਸੇਵਾ ਸਮੱਸਿਆਵਾਂ**
```python
# Test embedding generation
async def test_embeddings():
    try:
        test_text = "waterproof electrical connector"
        embedding = embedding_client.generate_embedding(test_text)
        logger.info("Embedding generated successfully: %d dimensions", len(embedding))
        return True
    except Exception as e:
        logger.error("Embedding test failed: %s", e)
        return False
```

### ਪ੍ਰਦਰਸ਼ਨ ਅਪਟਾਈਮਾਈਜ਼ੇਸ਼ਨ

#### 1. **Connection Pool Tuning**
```python
# Optimize for your workload
connection_pool = await asyncpg.create_pool(
    min_size=2,          # Minimum connections
    max_size=10,         # Maximum connections  
    max_inactive_connection_lifetime=300,  # 5 minutes
    command_timeout=30,   # Query timeout
    server_settings={
        "application_name": "mcp-server",
        "work_mem": "4MB",
        "shared_preload_libraries": "pg_stat_statements"
    }
)
```

#### 2. **Query Optimization**
```sql
-- Add indexes for common query patterns
CREATE INDEX idx_orders_store_date 
ON retail.orders (store_id, order_date);

CREATE INDEX idx_order_items_product 
ON retail.order_items (product_id);

-- Analyze query performance
EXPLAIN (ANALYZE, BUFFERS) 
SELECT ... FROM retail.orders o JOIN retail.order_items oi ...;
```

---

## ਸਰਵੋਤਮ ਅਭਿਆਸ

### ਸੁਰੱਖਿਆ ਸਰਵੋਤਮ ਅਭਿਆਸ

#### 1. **Environment Variable Management**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS ਲਾਗੂਕਰਨ ਦੇ ਨਿਯਮ**
- **Default Deny**: ਸ਼ੁਰੂਆਤ ਰੋਕਥਾਮ ਨੀਤੀਆਂ ਨਾਲ ਕਰੋ
- **Audit Regularly**: ਨੀਤੀ ਦੀ ਪ੍ਰਭਾਵਸ਼ੀਲਤਾ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
- **Test Thoroughly**: ਪਹੁੰਚ ਪੈਟਰਨ ਦੀ ਜਾਂਚ ਕਰੋ
- **Document Policies**: ਸਪਸ਼ਟ ਦਸਤਾਵੇਜ਼ ਰੱਖੋ

#### 3. **Network Security**
```yaml
# Production docker-compose with network isolation
networks:
  internal:
    driver: bridge
    internal: true
  external:
    driver: bridge

services:
  postgres:
    networks:
      - internal
    # No external ports in production
  
  mcp_server:
    networks:
      - internal
      - external
    ports:
      - "127.0.0.1:8000:8000"  # Bind to localhost only
```

### ਵਿਕਾਸ ਸਰਵੋਤਮ ਅਭਿਆਸ

#### 1. **Error Handling Patterns**
```python
# Structured error responses
class MCPError(Exception):
    def __init__(self, message: str, error_type: str = "general"):
        self.message = message
        self.error_type = error_type
        super().__init__(message)

async def safe_execute_query(query: str, rls_user_id: str) -> str:
    try:
        return await db_provider.execute_query(query, rls_user_id)
    except asyncpg.PostgresError as e:
        logger.error("Database error: %s", e)
        return json.dumps({"error": "Database query failed", "type": "database"})
    except Exception as e:
        logger.error("Unexpected error: %s", e)
        return json.dumps({"error": "Internal server error", "type": "server"})
```

#### 2. **Testing Strategies**
```python
# Unit test example
@pytest.mark.asyncio
async def test_rls_isolation():
    """Test that RLS properly isolates store data."""
    
    # Test Seattle store manager
    seattle_results = await db_provider.execute_query(
        "SELECT COUNT(*) FROM retail.orders",
        rls_user_id="f47ac10b-58cc-4372-a567-0e02b2c3d479"
    )
    
    # Test Redmond store manager  
    redmond_results = await db_provider.execute_query(
        "SELECT COUNT(*) FROM retail.orders", 
        rls_user_id="e7f8a9b0-c1d2-3e4f-5678-90abcdef1234"
    )
    
    # Results should be different due to RLS
    assert seattle_results != redmond_results
```

#### 3. **Monitoring and Alerts**
```python
# Custom metrics for monitoring
from prometheus_client import Counter, Histogram, start_http_server

query_counter = Counter('mcp_queries_total', 'Total queries executed', ['query_type'])
query_duration = Histogram('mcp_query_duration_seconds', 'Query execution time')

@query_duration.time()
async def execute_query_with_metrics(query: str, rls_user_id: str):
    query_counter.labels(query_type='sales_analysis').inc()
    return await db_provider.execute_query(query, rls_user_id)
```

### ਡਿਪਲੌਇਮੈਂਟ ਸਰਵੋਤਮ ਅਭਿਆਸ

#### 1. **Infrastructure as Code**
```bicep
// Use parameter files for different environments
param environment string = 'dev'
param location string = 'westus2'

// Apply consistent naming conventions
var resourcePrefix = 'zava-mcp-${environment}'
var resourceGroupName = 'rg-${resourcePrefix}-${uniqueSuffix}'

// Use tags for resource management
var commonTags = {
  Environment: environment
  Project: 'zava-mcp-server'
  ManagedBy: 'bicep'
  CreatedDate: utcNow('yyyy-MM-dd')
}
```

#### 2. **CI/CD Pipeline Integration**
```yaml
# Azure DevOps pipeline example
- task: AzureCLI@2
  displayName: 'Deploy Infrastructure'
  inputs:
    azureSubscription: $(azureServiceConnection)
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az deployment sub create \
        --name "mcp-server-$(Build.BuildId)" \
        --location $(location) \
        --template-file infra/main.bicep \
        --parameters environment=$(environment)

- task: Docker@2
  displayName: 'Build and Push MCP Server'
  inputs:
    command: 'buildAndPush'
    repository: 'zava-mcp-server'
    tags: '$(Build.BuildId)'
```

---

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ MCP ਸਰਵਰ ਨੂੰ PostgreSQL ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਬਣਾਉਣ, ਡਿਪਲੌਇ ਕਰਨ, ਅਤੇ ਚਲਾਉਣ ਲਈ ਮੂਲ ਭੂਤ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ। ਇੱਥੇ ਦਰਸਾਏ ਪੈਟਰਨ ਅਤੇ ਅਭਿਆਸ ਨੂੰ ਹੋਰ ਖੇਤਰਾਂ ਅਤੇ ਵਰਤੋਂ ਦੇ ਕੇਸਾਂ ਵਿੱਚ ਵਧਾਇਆ ਜਾ ਸਕਦਾ ਹੈ, ਜਦੋਂ ਕਿ ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ, ਅਤੇ ਰੱਖ-ਰਖਾਵ ਨੂੰ ਯਕੀਨੀ ਬਣਾਇਆ ਜਾ ਸਕਦਾ ਹੈ।

---

**ਅਸਵੀਕਰਤਾ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੱਜੇਪਣ ਹੋ ਸਕਦੇ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਅਸਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।