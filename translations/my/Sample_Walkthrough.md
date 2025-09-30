<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:40:58+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "my"
}
-->
# MCP Server နှင့် PostgreSQL နမူနာ - အပြည့်အစုံလမ်းညွှန်

## အကြောင်းအရာများ
1. [အကျဉ်းချုပ်](../..)
2. [Architecture အနက်ရှိုင်းလေ့လာမှု](../..)
3. [ဖြေရှင်းချက်တည်ဆောက်ခြင်း](../..)
4. [အစိတ်အပိုင်းခွဲခြမ်း](../..)
5. [Deployment လမ်းညွှန်](../..)
6. [ဖြေရှင်းချက်အသုံးပြုခြင်း](../..)
7. [အဆင့်မြင့် Features](../..)
8. [ပြဿနာဖြေရှင်းခြင်း](../..)
9. [အကောင်းဆုံးအလေ့အကျင့်များ](../..)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ **Model Context Protocol (MCP) server** ကို PostgreSQL နှင့် Azure AI services တွေကို ပေါင်းစပ်အသုံးပြုပြီး production-ready ဖြစ်အောင် တည်ဆောက်နည်းနဲ့ အသုံးပြုနည်းကို ဖော်ပြထားပါတယ်။ ဒီနမူနာမှာ Enterprise-grade patterns တွေဖြစ်တဲ့ Row Level Security, semantic search, နဲ့ multi-tenant data access ကို ပြသထားပါတယ်။

### သင်လေ့လာနိုင်မည့်အရာများ
- MCP server ကို database integration နဲ့ architect လုပ်နည်း
- Multi-tenant scenarios အတွက် Row Level Security ကို အကောင်အထည်ဖော်နည်း
- Azure OpenAI embeddings နဲ့ semantic search တည်ဆောက်နည်း
- Docker-based development environments ဖန်တီးနည်း
- Bicep templates အသုံးပြုပြီး Azure infrastructure ကို deploy လုပ်နည်း
- VS Code နဲ့ AI-powered analytics ကို ပေါင်းစပ်အသုံးပြုနည်း

### အသုံးပြုထားသောနည်းပညာများ
- **MCP Protocol**: AI tool integration အတွက် Model Context Protocol
- **FastMCP**: အခေတ်မီ Python MCP server framework
- **PostgreSQL**: pgvector extension ပါဝင်တဲ့ database
- **Azure OpenAI**: Text embeddings နဲ့ optional GPT models
- **Docker**: Containerization အတွက်
- **Bicep**: Azure resources အတွက် Infrastructure as Code
- **VS Code**: MCP integration ပါဝင်တဲ့ development environment

## 📚 Structured Learning Guide: /walkthrough

ဒီ technical walkthrough အပြင်၊ ဒီ repository မှာ **12-module learning guide** တစ်ခုကို `/walkthrough` directory မှာ ထည့်သွင်းထားပါတယ်။ ဒီ structured approach က developer တွေကို component တစ်ခုချင်းစီကို အဆင့်လိုက်နားလည်စေဖို့ အကောင်းဆုံးဖြေရှင်းချက်ပေးပါတယ်။

### Learning Modules အကျဉ်းချုပ်

| Module | ခေါင်းစဉ် | အဓိကအချက် | ကြာမြင့်ချိန် |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP အခြေခံ | Core concepts, Zava Retail case study, architecture overview | 30 မိနစ် |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | စနစ်ဒီဇိုင်း | Technical architecture, design patterns, component relationships | 45 မိနစ် |
| **[02-Security](walkthrough/02-Security/README.md)** | လုံခြုံရေး | Azure authentication, Row Level Security, multi-tenant isolation | 60 မိနစ် |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ပတ်ဝန်းကျင်တည်ဆောက်ခြင်း | Docker configuration, Azure CLI, project initialization | 45 မိနစ် |
| **[04-Database](walkthrough/04-Database/README.md)** | ဒေတာအလွှာ | PostgreSQL schema, pgvector setup, RLS policies, sample data | 60 မိနစ် |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | အဓိကအကောင်အထည်ဖော်မှု | FastMCP framework, database integration, tool development | 90 မိနစ် |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Tool တည်ဆောက်ခြင်း | MCP tool creation, query validation, business intelligence | 75 မိနစ် |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI ပေါင်းစပ်မှု | Azure OpenAI embeddings, vector search, hybrid queries | 60 မိနစ် |
| **[08-Testing](walkthrough/08-Testing/README.md)** | အရည်အသွေးအာမခံမှု | Testing strategies, debugging techniques, performance testing | 75 မိနစ် |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Development Experience | VS Code configuration, AI Chat integration, debugging workflows | 45 မိနစ် |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Production Deployment | Containerization, Azure Container Apps, CI/CD pipelines | 90 မိနစ် |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observability | Application Insights, structured logging, performance metrics | 60 မိနစ် |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Production Excellence | Security hardening, optimization, enterprise patterns | 45 မိနစ် |

### Learning Guide ကို အသုံးပြုနည်း

**📖 လေ့လာရန်**: `/walkthrough` modules တွေမှာ component တစ်ခုချင်းစီကို အဆင့်လိုက်နားလည်စေဖို့ အကြောင်းအရာများကို ဖော်ပြထားပါတယ်။ Module 00 မှ စတင်ပြီး အဆင့်လိုက် လေ့လာပါ။

**🔧 အကောင်အထည်ဖော်ရန်**: ဒီ Sample_Walkthrough.md မှာ developer တွေ အတွက် အပြည့်အစုံ implementation ကို မြန်ဆန်စွာနားလည်စေဖို့ technical deep-dive နဲ့ code breakdown ပါဝင်ပါတယ်။

**🚀 Production အတွက်**: Modules 02, 10, 11, နဲ့ 12 တွေမှာ production-ready deployment, security, နဲ့ monitoring အချက်အလက်တွေကို အထူးအာရုံစိုက်ထားပါတယ်။

**📚 အပြည့်အစုံ Learning Path**: **[/walkthrough/README.md](walkthrough/README.md)** ကို သွားရောက်ပြီး အပြည့်အစုံ learning guide overview ကို လေ့လာပါ။

---

## Architecture အနက်ရှိုင်းလေ့လာမှု

### အဆင့်မြင့် Architecture

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

### အဓိက Components

#### 1. **MCP Server (`sales_analysis.py`)**
- **FastMCP Framework**: HTTP/SSE protocol communication ကို စီမံခန့်ခွဲခြင်း
- **Tool Registration**: Database query နဲ့ schema tools တွေကို expose လုပ်ခြင်း
- **Request Context**: RLS user identification ကို စီမံခြင်း
- **Error Handling**: Error management နဲ့ logging ကို ခိုင်မာစွာ စီမံခြင်း

#### 2. **Database Layer (`sales_analysis_postgres.py`)**
- **Connection Pooling**: asyncpg connection ကို ထိရောက်စွာ စီမံခြင်း
- **Schema Provider**: Dynamic table schema discovery
- **Query Execution**: RLS ပါဝင်တဲ့ SQL execution
- **Semantic Search**: pgvector နဲ့ vector similarity search

#### 3. **Configuration Management (`config.py`)**
- **Environment Variables**: Configuration ကို စုစည်းစီမံခြင်း
- **Connection Parameters**: Database နဲ့ Azure service configuration
- **Validation**: လိုအပ်သော environment variable တွေကို စစ်ဆေးခြင်း

#### 4. **Infrastructure (`infra/`)**
- **Bicep Templates**: Azure resource provisioning ကို declarative အနည်းအကျဉ်းဖော်ပြခြင်း
- **Model Deployment**: AI model deployment ကို အလိုအလျောက်လုပ်ဆောင်ခြင်း
- **Role Assignments**: Security role configuration

### Data Flow

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## ဖြေရှင်းချက်တည်ဆောက်ခြင်း

### အဆင့် 1: Project Structure Setup

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

### အဆင့် 2: Core Dependencies

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

**System Requirements:**
- Containerization အတွက် Docker Desktop
- Deployment အတွက် Azure CLI
- pgvector extension ပါဝင်တဲ့ PostgreSQL
- AI extensions ပါဝင်တဲ့ VS Code

### အဆင့် 3: Database Schema Design

ဒီနမူနာမှာ retail database ကို အောက်ပါ key tables တွေနဲ့ အသုံးပြုထားပါတယ်-

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

**Row Level Security (RLS) အကောင်အထည်ဖော်မှု:**
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

## အစိတ်အပိုင်းခွဲခြမ်း

### MCP Server Core (`sales_analysis.py`)

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

**အဓိက Features:**
- **Type Annotations**: AI နားလည်မှုအတွက် Pydantic field descriptions
- **Context Extraction**: HTTP headers မှ user identity ကို ရယူခြင်း
- **Error Handling**: Error များကို သက်သာစွာ handle လုပ်ခြင်း
- **Logging**: လုပ်ဆောင်မှုများကို စုံလင်စွာ log လုပ်ခြင်း

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

### Database Layer (`sales_analysis_postgres.py`)

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

**Design Patterns:**
- **Resource Management**: Pool lifecycle ကို သေချာစီမံခြင်း
- **Performance Tuning**: PostgreSQL settings ကို optimize လုပ်ခြင်း
- **Error Recovery**: Connection retry နဲ့ fallback logic
- **Security**: RLS context ကို connection တစ်ခုချင်းစီမှာ သတ်မှတ်ခြင်း

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

## Deployment လမ်းညွှန်

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

### Local Development Setup

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

#### 2. **Database Initialization**
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

## ဖြေရှင်းချက်အသုံးပြုခြင်း

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

#### 2. **Query Examples**

**Schema Discovery:**
```
AI: #zava What tables are available in the database?
```
*MCP server က `get_multiple_table_schemas` ကို အသုံးပြုပြီး table structures ကို ပြန်ပေးပါသည်*

**Sales Analysis:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Proper joins နဲ့ date filtering ပါဝင်တဲ့ SQL ကို generate လုပ်ပါသည်*

**Semantic Search:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Embeddings ကို အသုံးပြုပြီး semantically similar products တွေကို ရှာဖွေပါသည်*

**Multi-Store Analysis:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS က Seattle store data ကိုသာ access လုပ်နိုင်အောင် သေချာစေပါသည်*

### အဆင့်မြင့် Query Patterns

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

## အဆင့်မြင့် Features

### Row Level Security အကောင်အထည်ဖော်မှု

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

### Semantic Search အနက်ရှိုင်းလေ့လာမှု

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

### Monitoring နဲ့ Observability

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

#### 2. **Custom Metrics နဲ့ Logging**
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

## ပြဿနာဖြေရှင်းခြင်း

### အများဆုံးတွေ့ရတဲ့ပြဿနာများနဲ့ ဖြေရှင်းနည်းများ

#### 1. **Database Connection Issues**
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

**အများဆုံးဖြေရှင်းနည်းများ:**
- PostgreSQL ရှိ/မရှိစစ်ဆေးရန်: `docker ps`
- `.env` မှ connection parameters ကို စစ်ဆေးပါ
- Database ရှိ/မရှိစစ်ဆေးရန်: `docker exec -it pg17 psql -U postgres -l`
- Network connectivity စစ်ဆေးရန်: `telnet localhost 5432`

#### 2. **RLS Policy Issues**
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

#### 3. **Embedding Service Issues**
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

### Performance Optimization

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

## အကောင်းဆုံးအလေ့အကျင့်များ

### လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များ

#### 1. **Environment Variable Management**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS Implementation Guidelines**
- **Default Deny**: Policies တွေကို restrictive ဖြစ်အောင် စတင်ပါ
- **Audit Regularly**: Policy effectiveness ကို စစ်ဆေးပါ
- **Test Thoroughly**: Access patterns ကို validate လုပ်ပါ
- **Document Policies**: Policies တွေကို ရှင်းလင်းစွာ documentation လုပ်ပါ

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

### Development အကောင်းဆုံးအလေ့အကျင့်များ

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

#### 3. **Monitoring နဲ့ Alerts**
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

### Deployment အကောင်းဆုံးအလေ့အကျင့်များ

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

ဒီလမ်းညွှန်မှာ MCP server ကို PostgreSQL integration နဲ့ production-ready ဖြစ်အောင် တည်ဆောက်၊ deploy လုပ်၊ နဲ့ operate လုပ်နည်းအတွက် အခြေခံကို ဖော်ပြထားပါတယ်။ ဒီနည်းလမ်းနဲ့ အလေ့အကျင့်တွေကို အခြား domain နဲ့ use case တွေမှာလည်း security, performance, နဲ့ maintainability ကို ထိန်းသိမ်းထားပြီး တိုးချဲ့အသုံးပြုနိုင်ပါတယ်။

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုမှားများ သို့မဟုတ် အဓိပ္ပာယ်မှားများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။