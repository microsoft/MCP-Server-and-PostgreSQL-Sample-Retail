<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T05:53:07+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "hu"
}
-->
# MCP Server és PostgreSQL példa - Teljes útmutató

## Tartalomjegyzék
1. [Áttekintés](../..)
2. [Architektúra részletes bemutatása](../..)
3. [A megoldás felépítése](../..)
4. [Komponensek bontása](../..)
5. [Telepítési útmutató](../..)
6. [A megoldás használata](../..)
7. [Haladó funkciók](../..)
8. [Hibaelhárítás](../..)
9. [Legjobb gyakorlatok](../..)

## Áttekintés

Ez az útmutató bemutatja, hogyan lehet egy **Model Context Protocol (MCP) szervert** építeni és használni, amely integrálódik a PostgreSQL és Azure AI szolgáltatásokkal. A példa vállalati szintű mintákat mutat be, mint például sor szintű biztonság (Row Level Security), szemantikus keresés és több bérlős adat-hozzáférés.

### Amit megtanulhatsz
- MCP szerver architektúrájának kialakítása adatbázis integrációval
- Sor szintű biztonság megvalósítása több bérlős forgatókönyvekhez
- Szemantikus keresés építése Azure OpenAI beágyazásokkal
- Docker-alapú fejlesztési környezetek létrehozása
- Azure infrastruktúra telepítése Bicep sablonokkal
- Integráció VS Code-dal AI-alapú elemzésekhez

### Használt technológiák
- **MCP Protocol**: Model Context Protocol AI eszközök integrációjához
- **FastMCP**: Modern Python MCP szerver keretrendszer
- **PostgreSQL**: Adatbázis pgvector kiterjesztéssel szemantikus kereséshez
- **Azure OpenAI**: Szövegbeágyazások és opcionális GPT modellek
- **Docker**: Konténerizáció a konzisztens környezetekhez
- **Bicep**: Infrastruktúra mint kód Azure erőforrásokhoz
- **VS Code**: Fejlesztési környezet MCP integrációval

## 📚 Strukturált tanulási útmutató: /walkthrough

A technikai útmutató mellett ez a repozitórium tartalmaz egy átfogó **12 modulból álló tanulási útmutatót**, amely a `/walkthrough` könyvtárban található. Ez a strukturált megközelítés segít a komplex megvalósítás lebontásában könnyen érthető modulokra, ideális fejlesztők számára, akik lépésről lépésre szeretnék megérteni az egyes komponenseket.

### Tanulási modulok áttekintése

| Modul | Téma | Fókusz | Időtartam |
|-------|------|--------|-----------|
| **[00-Bevezetés](walkthrough/00-Introduction/README.md)** | MCP alapok | Alapfogalmak, Zava Retail esettanulmány, architektúra áttekintés | 30 perc |
| **[01-Architektúra](walkthrough/01-Architecture/README.md)** | Rendszertervezés | Technikai architektúra, tervezési minták, komponens kapcsolatok | 45 perc |
| **[02-Biztonság](walkthrough/02-Security/README.md)** | Vállalati biztonság | Azure hitelesítés, sor szintű biztonság, több bérlős izoláció | 60 perc |
| **[03-Beállítás](walkthrough/03-Setup/README.md)** | Környezet beállítása | Docker konfiguráció, Azure CLI, projekt inicializálás | 45 perc |
| **[04-Adatbázis](walkthrough/04-Database/README.md)** | Adatréteg | PostgreSQL séma, pgvector beállítás, RLS szabályok, mintaadatok | 60 perc |
| **[05-MCP-Szerver](walkthrough/05-MCP-Server/README.md)** | Alapvető megvalósítás | FastMCP keretrendszer, adatbázis integráció, eszközfejlesztés | 90 perc |
| **[06-Eszközök](walkthrough/06-Tools/README.md)** | Eszközfejlesztés | MCP eszköz létrehozása, lekérdezés validálás, üzleti intelligencia | 75 perc |
| **[07-Szemantikus-Keresés](walkthrough/07-Semantic-Search/README.md)** | AI integráció | Azure OpenAI beágyazások, vektorkeresés, hibrid lekérdezések | 60 perc |
| **[08-Tesztelés](walkthrough/08-Testing/README.md)** | Minőségbiztosítás | Tesztelési stratégiák, hibakeresési technikák, teljesítménytesztelés | 75 perc |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Fejlesztési élmény | VS Code konfiguráció, AI Chat integráció, hibakeresési munkafolyamatok | 45 perc |
| **[10-Telepítés](walkthrough/10-Deployment/README.md)** | Éles telepítés | Konténerizáció, Azure Container Apps, CI/CD folyamatok | 90 perc |
| **[11-Monitorozás](walkthrough/11-Monitoring/README.md)** | Megfigyelhetőség | Application Insights, strukturált naplózás, teljesítménymutatók | 60 perc |
| **[12-Legjobb-Gyakorlatok](walkthrough/12-Best-Practices/README.md)** | Éles környezet kiválósága | Biztonsági megerősítés, optimalizálás, vállalati minták | 45 perc |

### Hogyan használd a tanulási útmutatót

**📖 Tanuláshoz**: A `/walkthrough` modulok lépésről lépésre nyújtanak útmutatást, magyarázva, hogy miért van minden komponens úgy tervezve, ahogy van. Kezdd a 00. modullal, és haladj sorrendben.

**🔧 Megvalósításhoz**: Ez a Sample_Walkthrough.md technikai mélymerülést és kód bontást biztosít azoknak a fejlesztőknek, akik gyorsan szeretnék megérteni a teljes megvalósítást.

**🚀 Éles környezethez**: A 02., 10., 11. és 12. modulok kifejezetten az éles telepítésre, biztonságra és monitorozási szempontokra összpontosítanak.

**📚 Teljes tanulási útvonal**: Látogasd meg **[/walkthrough/README.md](walkthrough/README.md)** a teljes tanulási útmutató áttekintéséhez, részletes tanulási célokkal és előfeltételekkel.

---

## Architektúra részletes bemutatása

### Magas szintű architektúra

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

### Fő komponensek

#### 1. **MCP Szerver (`sales_analysis.py`)**
- **FastMCP keretrendszer**: HTTP/SSE protokoll kommunikáció kezelése
- **Eszköz regisztráció**: Adatbázis lekérdezés és séma eszközök kitettsége
- **Lekérdezési kontextus**: RLS felhasználói azonosítás kezelése
- **Hibakezelés**: Robusztus hibakezelés és naplózás

#### 2. **Adatbázis réteg (`sales_analysis_postgres.py`)**
- **Kapcsolat pooling**: Hatékony asyncpg kapcsolatkezelés
- **Séma szolgáltató**: Dinamikus táblaséma felfedezés
- **Lekérdezés végrehajtás**: Biztonságos SQL végrehajtás RLS-sel
- **Szemantikus keresés**: Vektor hasonlósági keresés pgvector segítségével

#### 3. **Konfigurációkezelés (`config.py`)**
- **Környezeti változók**: Központosított konfigurációkezelés
- **Kapcsolati paraméterek**: Adatbázis és Azure szolgáltatás konfiguráció
- **Validáció**: Szükséges környezeti változók ellenőrzése

#### 4. **Infrastruktúra (`infra/`)**
- **Bicep sablonok**: Deklaratív Azure erőforrások létrehozása
- **Model telepítés**: Automatizált AI model telepítés
- **Szerepkör hozzárendelések**: Biztonsági szerepkör konfiguráció

### Adatáramlás

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## A megoldás felépítése

### 1. lépés: Projektstruktúra létrehozása

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

### 2. lépés: Alapvető függőségek

**Python követelmények:**
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

**Rendszerkövetelmények:**
- Docker Desktop konténerizációhoz
- Azure CLI telepítéshez
- PostgreSQL pgvector kiterjesztéssel
- VS Code AI bővítményekkel

### 3. lépés: Adatbázis séma tervezése

A példa egy kiskereskedelmi adatbázist használ az alábbi kulcstáblákkal:

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

**Sor szintű biztonság (RLS) megvalósítása:**
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

## Komponensek bontása

### MCP Szerver magja (`sales_analysis.py`)

#### Eszköz regisztrációs minta
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

**Főbb jellemzők:**
- **Típus annotációk**: Pydantic mezőleírások AI megértéshez
- **Kontextus kinyerés**: Felhasználói identitás HTTP fejlécből
- **Hibakezelés**: Kegyes hiba kezelés informatív üzenetekkel
- **Naplózás**: Átfogó műveleti naplózás

#### Lekérdezési kontextus kezelése
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Adatbázis réteg (`sales_analysis_postgres.py`)

#### Kapcsolat pool kezelése
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

**Tervezési minták:**
- **Erőforrás kezelés**: Pool életciklus megfelelő kezelése
- **Teljesítmény hangolás**: Optimalizált PostgreSQL beállítások
- **Hiba helyreállítás**: Kapcsolat újrapróbálás és tartalék logika
- **Biztonság**: RLS kontextus beállítása kapcsolatonként

#### Séma introspekció
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

### Szemantikus keresés integráció

#### Beágyazás generálás
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

#### Vektor hasonlósági keresés
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

## Telepítési útmutató

### Azure infrastruktúra telepítése

#### 1. **Bicep sablon struktúra**

**Fő sablon (`main.bicep`):**
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

#### 2. **Telepítési automatizálás**

**PowerShell telepítés (`deploy.ps1`):**
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

### Helyi fejlesztési beállítás

#### 1. **Docker Compose konfiguráció**
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

#### 2. **Adatbázis inicializálás**
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

## A megoldás használata

### VS Code integráció

#### 1. **MCP konfiguráció (`.vscode/mcp.json`)**
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

#### 2. **Lekérdezési példák**

**Séma felfedezés:**
```
AI: #zava What tables are available in the database?
```
*Az MCP szerver `get_multiple_table_schemas`-t használ a táblaszerkezetek visszaadására*

**Értékesítési elemzés:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*SQL generálása megfelelő csatlakozásokkal és dátumszűréssel*

**Szemantikus keresés:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Beágyazásokat használ szemantikailag hasonló termékek keresésére*

**Több üzlet elemzése:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS biztosítja, hogy csak a Seattle-i üzlet adatai legyenek elérhetők*

### Haladó lekérdezési minták

#### 1. **Idősoros elemzés**
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

#### 2. **Termék teljesítmény kategóriákkal**
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

## Haladó funkciók

### Sor szintű biztonság megvalósítása

#### 1. **Szabály létrehozása**
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

#### 2. **Kontextus beállítása MCP szerverben**
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

### Szemantikus keresés részletes bemutatása

#### 1. **Beágyazási folyamat**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Hasonlósági keresés optimalizálása**
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

### Monitorozás és megfigyelhetőség

#### 1. **Azure Application Insights integráció**
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

#### 2. **Egyedi metrikák és naplózás**
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

## Hibaelhárítás

### Gyakori problémák és megoldások

#### 1. **Adatbázis kapcsolat problémák**
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

**Gyakori javítások:**
- Ellenőrizd, hogy a PostgreSQL fut-e: `docker ps`
- Ellenőrizd a kapcsolati paramétereket `.env` fájlban
- Ellenőrizd, hogy létezik-e az adatbázis: `docker exec -it pg17 psql -U postgres -l`
- Teszteld a hálózati kapcsolatot: `telnet localhost 5432`

#### 2. **RLS szabály problémák**
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

#### 3. **Beágyazási szolgáltatás problémák**
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

### Teljesítmény optimalizálás

#### 1. **Kapcsolat pool hangolás**
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

#### 2. **Lekérdezés optimalizálás**
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

## Legjobb gyakorlatok

### Biztonsági legjobb gyakorlatok

#### 1. **Környezeti változók kezelése**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS megvalósítási irányelvek**
- **Alapértelmezett tiltás**: Kezdd szigorú szabályokkal
- **Rendszeres audit**: Figyeld a szabályok hatékonyságát
- **Alapos tesztelés**: Validáld a hozzáférési mintákat
- **Dokumentáció**: Tartsd karban a szabályok dokumentációját

#### 3. **Hálózati biztonság**
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

### Fejlesztési legjobb gyakorlatok

#### 1. **Hibakezelési minták**
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

#### 2. **Tesztelési stratégiák**
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

#### 3. **Monitorozás és riasztások**
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

### Telepítési legjobb gyakorlatok

#### 1. **Infrastruktúra mint kód**
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

#### 2. **CI/CD folyamat integráció**
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

Ez az átfogó útmutató alapot nyújt egy éles környezetre kész MCP szerver építéséhez, telepítéséhez és működtetéséhez PostgreSQL integrációval. Az itt bemutatott minták és gyakorlatok más területekre és felhasználási esetekre is kiterjeszthetők, miközben megőrzik a biztonságot, teljesítményt és karbantarthatóságot.

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.