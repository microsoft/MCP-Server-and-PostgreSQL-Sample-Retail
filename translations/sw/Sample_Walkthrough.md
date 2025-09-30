<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T05:52:01+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "sw"
}
-->
# MCP Server na Mfano wa PostgreSQL - Mwongozo Kamili

## Jedwali la Maudhui
1. [Muhtasari](../..)
2. [Uchambuzi wa Kina wa Usanifu](../..)
3. [Kujenga Suluhisho](../..)
4. [Uchambuzi wa Vipengele](../..)
5. [Mwongozo wa Utekelezaji](../..)
6. [Kutumia Suluhisho](../..)
7. [Vipengele vya Juu](../..)
8. [Utatuzi wa Matatizo](../..)
9. [Mbinu Bora](../..)

## Muhtasari

Mwongozo huu unafafanua jinsi ya kujenga na kutumia **Model Context Protocol (MCP) server** inayounganishwa na PostgreSQL na huduma za Azure AI. Mfano huu unaonyesha mifumo ya kiwango cha biashara ikiwa ni pamoja na Usalama wa Kiwango cha Safu (Row Level Security), utafutaji wa semantiki, na ufikiaji wa data wa wateja wengi.

### Unachojifunza
- Jinsi ya kuunda MCP server yenye muunganisho wa hifadhidata
- Kutekeleza Usalama wa Kiwango cha Safu kwa hali za wateja wengi
- Kujenga utafutaji wa semantiki kwa kutumia embeddings za Azure OpenAI
- Kuunda mazingira ya maendeleo yanayotegemea Docker
- Kuweka miundombinu ya Azure kwa kutumia templates za Bicep
- Kuunganisha na VS Code kwa uchanganuzi unaotumia AI

### Teknolojia Zinazotumika
- **MCP Protocol**: Itifaki ya Model Context kwa ujumuishaji wa zana za AI
- **FastMCP**: Mfumo wa kisasa wa MCP server kwa Python
- **PostgreSQL**: Hifadhidata yenye kiendelezi cha pgvector kwa utafutaji wa semantiki
- **Azure OpenAI**: Embeddings za maandishi na mifano ya hiari ya GPT
- **Docker**: Uwekaji wa kontena kwa mazingira thabiti
- **Bicep**: Miundombinu kama Kanuni kwa rasilimali za Azure
- **VS Code**: Mazingira ya maendeleo yenye ujumuishaji wa MCP

## 📚 Mwongozo wa Kujifunza Uliopangiliwa: /walkthrough

Mbali na mwongozo huu wa kiufundi, hifadhi hii inajumuisha **mwongozo wa kujifunza wa moduli 12** ulioko kwenye saraka ya `/walkthrough`. Njia hii iliyopangiliwa inavunja utekelezaji mgumu kuwa moduli za kujifunza zinazoweza kueleweka, bora kwa watengenezaji wanaotaka kuelewa kila kipengele hatua kwa hatua.

### Muhtasari wa Moduli za Kujifunza

| Moduli | Mada | Lengo | Muda |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Misingi ya MCP | Dhana kuu, utafiti wa kesi ya Zava Retail, muhtasari wa usanifu | Dakika 30 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Usanifu wa Mfumo | Usanifu wa kiufundi, mifumo ya muundo, uhusiano wa vipengele | Dakika 45 |
| **[02-Security](walkthrough/02-Security/README.md)** | Usalama wa Biashara | Uthibitishaji wa Azure, Usalama wa Kiwango cha Safu, kutenganisha wateja wengi | Dakika 60 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Usanidi wa Mazingira | Usanidi wa Docker, Azure CLI, uanzishaji wa mradi | Dakika 45 |
| **[04-Database](walkthrough/04-Database/README.md)** | Safu ya Data | Mpangilio wa PostgreSQL, usanidi wa pgvector, sera za RLS, data ya mfano | Dakika 60 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Utekelezaji wa Msingi | Mfumo wa FastMCP, ujumuishaji wa hifadhidata, maendeleo ya zana | Dakika 90 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Maendeleo ya Zana | Uundaji wa zana za MCP, uthibitishaji wa maswali, akili ya biashara | Dakika 75 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Ujumuishaji wa AI | Embeddings za Azure OpenAI, utafutaji wa vector, maswali mseto | Dakika 60 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Uhakikisho wa Ubora | Mikakati ya majaribio, mbinu za kutatua matatizo, majaribio ya utendaji | Dakika 75 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Uzoefu wa Maendeleo | Usanidi wa VS Code, ujumuishaji wa AI Chat, mtiririko wa kutatua matatizo | Dakika 45 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Utekelezaji wa Uzalishaji | Uwekaji wa kontena, Azure Container Apps, mikondo ya CI/CD | Dakika 90 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Ufuatiliaji | Uchanganuzi wa Maombi, uandishi wa kumbukumbu uliopangiliwa, vipimo vya utendaji | Dakika 60 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Ubora wa Uzalishaji | Kuimarisha usalama, uboreshaji, mifumo ya biashara | Dakika 45 |

### Jinsi ya Kutumia Mwongozo wa Kujifunza

**📖 Kwa Kujifunza**: Moduli za `/walkthrough` zinatoa maelekezo ya hatua kwa hatua na maelezo ya kwa nini kila kipengele kimeundwa jinsi kilivyo. Anza na Moduli 00 na endelea kwa mpangilio.

**🔧 Kwa Utekelezaji**: Hati hii ya Sample_Walkthrough.md inatoa uchambuzi wa kina wa kiufundi na maelezo ya kanuni kwa watengenezaji wanaotaka kuelewa utekelezaji kamili haraka.

**🚀 Kwa Uzalishaji**: Moduli 02, 10, 11, na 12 zinazingatia hasa utekelezaji wa uzalishaji, usalama, na masuala ya ufuatiliaji.

**📚 Njia Kamili ya Kujifunza**: Tembelea **[/walkthrough/README.md](walkthrough/README.md)** kwa muhtasari kamili wa mwongozo wa kujifunza wenye malengo ya kujifunza na mahitaji ya awali.

---

## Uchambuzi wa Kina wa Usanifu

### Usanifu wa Juu

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

### Vipengele Muhimu

#### 1. **MCP Server (`sales_analysis.py`)**
- **Mfumo wa FastMCP**: Hushughulikia mawasiliano ya HTTP/SSE
- **Usajili wa Zana**: Hutoa zana za maswali ya hifadhidata na muundo
- **Muktadha wa Ombi**: Husimamia utambulisho wa mtumiaji wa RLS
- **Utunzaji wa Makosa**: Usimamizi thabiti wa makosa na uandishi wa kumbukumbu

#### 2. **Safu ya Hifadhidata (`sales_analysis_postgres.py`)**
- **Usimamizi wa Muunganisho**: Usimamizi bora wa muunganisho wa asyncpg
- **Mtoaji wa Muundo**: Ugunduzi wa muundo wa jedwali kwa njia ya nguvu
- **Utekelezaji wa Maswali**: Utekelezaji salama wa SQL na RLS
- **Utafutaji wa Semantiki**: Utafutaji wa usawa wa vector kwa kutumia pgvector

#### 3. **Usimamizi wa Usanidi (`config.py`)**
- **Vigezo vya Mazingira**: Usimamizi wa usanidi ulio kati
- **Vigezo vya Muunganisho**: Usanidi wa hifadhidata na huduma za Azure
- **Uthibitishaji**: Uthibitishaji wa vigezo vya mazingira vinavyohitajika

#### 4. **Miundombinu (`infra/`)**
- **Templates za Bicep**: Utoaji wa rasilimali za Azure kwa njia ya tamko
- **Utekelezaji wa Mfano**: Utekelezaji wa mifano ya AI kwa njia ya kiotomatiki
- **Ugawaji wa Majukumu**: Usanidi wa majukumu ya usalama

### Mtiririko wa Data

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Kujenga Suluhisho

### Hatua ya 1: Usanidi wa Muundo wa Mradi

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

### Hatua ya 2: Mahitaji Muhimu

**Mahitaji ya Python:**
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

**Mahitaji ya Mfumo:**
- Docker Desktop kwa uwekaji wa kontena
- Azure CLI kwa utekelezaji
- PostgreSQL yenye kiendelezi cha pgvector
- VS Code yenye viendelezi vya AI

### Hatua ya 3: Muundo wa Schema ya Hifadhidata

Mfano unatumia hifadhidata ya rejareja yenye majedwali haya muhimu:

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

**Utekelezaji wa Usalama wa Kiwango cha Safu (RLS):**
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

## Uchambuzi wa Vipengele

### MCP Server Msingi (`sales_analysis.py`)

#### Muundo wa Usajili wa Zana
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

**Vipengele Muhimu:**
- **Maelezo ya Aina**: Maelezo ya uwanja wa Pydantic kwa uelewa wa AI
- **Uchimbaji wa Muktadha**: Utambulisho wa mtumiaji kutoka kwa vichwa vya HTTP
- **Utunzaji wa Makosa**: Kushindwa kwa neema na ujumbe wa taarifa
- **Uandishi wa Kumbukumbu**: Uandishi wa kina wa operesheni

#### Usimamizi wa Muktadha wa Ombi
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Safu ya Hifadhidata (`sales_analysis_postgres.py`)

#### Usimamizi wa Muunganisho wa Pool
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

**Mifumo ya Muundo:**
- **Usimamizi wa Rasilimali**: Usimamizi sahihi wa mzunguko wa maisha ya pool
- **Uboreshaji wa Utendaji**: Usanidi ulioboreshwa wa PostgreSQL
- **Urejeshaji wa Makosa**: Jaribio la muunganisho na mantiki ya kurudi nyuma
- **Usalama**: Usanidi wa muktadha wa RLS kwa kila muunganisho

#### Ugunduzi wa Muundo
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

### Ujumuishaji wa Utafutaji wa Semantiki

#### Uzalishaji wa Embedding
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

#### Utafutaji wa Usawa wa Vector
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

## Mwongozo wa Utekelezaji

### Utekelezaji wa Miundombinu ya Azure

#### 1. **Muundo wa Template za Bicep**

**Template Kuu (`main.bicep`):**
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

#### 2. **Utekelezaji wa Kiotomatiki**

**Utekelezaji wa PowerShell (`deploy.ps1`):**
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

### Usanidi wa Maendeleo ya Kawaida

#### 1. **Usanidi wa Docker Compose**
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

#### 2. **Uanzishaji wa Hifadhidata**
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

## Kutumia Suluhisho

### Ujumuishaji wa VS Code

#### 1. **Usanidi wa MCP (`.vscode/mcp.json`)**
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

#### 2. **Mifano ya Maswali**

**Ugunduzi wa Muundo:**
```
AI: #zava What tables are available in the database?
```
*MCP server hutumia `get_multiple_table_schemas` kurudisha miundo ya majedwali*

**Uchambuzi wa Mauzo:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Huzalisha SQL yenye viunganishi sahihi na uchujaji wa tarehe*

**Utafutaji wa Semantiki:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Hutumia embeddings kutafuta bidhaa zinazofanana semantiki*

**Uchambuzi wa Maduka Mengi:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS huhakikisha data ya duka la Seattle pekee inafikiwa*

### Mifumo ya Maswali ya Juu

#### 1. **Uchambuzi wa Mfululizo wa Wakati**
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

#### 2. **Utendaji wa Bidhaa na Makundi**
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

## Vipengele vya Juu

### Utekelezaji wa Usalama wa Kiwango cha Safu

#### 1. **Uundaji wa Sera**
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

#### 2. **Usanidi wa Muktadha katika MCP Server**
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

### Uchambuzi wa Kina wa Utafutaji wa Semantiki

#### 1. **Mchakato wa Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Uboreshaji wa Utafutaji wa Usawa**
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

### Ufuatiliaji na Ufuatiliaji

#### 1. **Ujumuishaji wa Azure Application Insights**
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

#### 2. **Vipimo na Uandishi wa Kumbukumbu Maalum**
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

## Utatuzi wa Matatizo

### Masuala ya Kawaida na Suluhisho

#### 1. **Masuala ya Muunganisho wa Hifadhidata**
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

**Suluhisho za Kawaida:**
- Hakikisha PostgreSQL inaendesha: `docker ps`
- Angalia vigezo vya muunganisho katika `.env`
- Thibitisha hifadhidata ipo: `docker exec -it pg17 psql -U postgres -l`
- Jaribu muunganisho wa mtandao: `telnet localhost 5432`

#### 2. **Masuala ya Sera za RLS**
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

#### 3. **Masuala ya Huduma ya Embedding**
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

### Uboreshaji wa Utendaji

#### 1. **Usanidi wa Pool ya Muunganisho**
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

#### 2. **Uboreshaji wa Maswali**
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

## Mbinu Bora

### Mbinu Bora za Usalama

#### 1. **Usimamizi wa Vigezo vya Mazingira**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Miongozo ya Utekelezaji wa RLS**
- **Kataa kwa Chaguo-msingi**: Anza na sera za vizuizi
- **Kagua Mara kwa Mara**: Fuatilia ufanisi wa sera
- **Jaribu kwa Kina**: Thibitisha mifumo ya ufikiaji
- **Andika Sera**: Dumisha nyaraka wazi

#### 3. **Usalama wa Mtandao**
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

### Mbinu Bora za Maendeleo

#### 1. **Mifumo ya Utunzaji wa Makosa**
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

#### 2. **Mikakati ya Majaribio**
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

#### 3. **Ufuatiliaji na Arifa**
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

### Mbinu Bora za Utekelezaji

#### 1. **Miundombinu kama Kanuni**
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

#### 2. **Ujumuishaji wa Mikondo ya CI/CD**
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

Mwongozo huu wa kina unatoa msingi wa kujenga, kutekeleza, na kuendesha MCP server inayofaa kwa uzalishaji yenye ujumuishaji wa PostgreSQL. Mifumo na mbinu zilizoonyeshwa hapa zinaweza kupanuliwa kwa nyanja nyingine na hali za matumizi huku zikidumisha usalama, utendaji, na usimamizi.

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.