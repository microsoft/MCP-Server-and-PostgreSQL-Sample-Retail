<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:39:20+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "sl"
}
-->
# MCP strežnik in PostgreSQL primer - celoten vodič

## Kazalo
1. [Pregled](../..)
2. [Podroben pregled arhitekture](../..)
3. [Izgradnja rešitve](../..)
4. [Razčlenitev komponent](../..)
5. [Vodič za namestitev](../..)
6. [Uporaba rešitve](../..)
7. [Napredne funkcije](../..)
8. [Odpravljanje težav](../..)
9. [Najboljše prakse](../..)

## Pregled

Ta vodič razčlenjuje, kako zgraditi in uporabljati produkcijsko pripravljen **Model Context Protocol (MCP) strežnik**, ki se integrira s PostgreSQL in Azure AI storitvami. Primer prikazuje vzorce na ravni podjetja, vključno z varnostjo na ravni vrstic, semantičnim iskanjem in dostopom do podatkov za več najemnikov.

### Kaj boste izvedeli
- Kako zasnovati MCP strežnik z integracijo podatkovne baze
- Uvedba varnosti na ravni vrstic za scenarije z več najemniki
- Izgradnja semantičnega iskanja z Azure OpenAI vdelavami
- Ustvarjanje razvojnih okolij na osnovi Dockerja
- Namestitev Azure infrastrukture z Bicep predlogami
- Integracija z VS Code za analitiko, podprto z umetno inteligenco

### Uporabljene tehnologije
- **MCP Protocol**: Protokol za integracijo AI orodij
- **FastMCP**: Sodobni Python okvir za MCP strežnike
- **PostgreSQL**: Podatkovna baza z razširitvijo pgvector za semantično iskanje
- **Azure OpenAI**: Vdelave besedila in opcijski GPT modeli
- **Docker**: Kontejnerizacija za dosledna okolja
- **Bicep**: Infrastruktura kot koda za Azure vire
- **VS Code**: Razvojno okolje z integracijo MCP

## 📚 Strukturiran učni vodič: /walkthrough

Poleg tega tehničnega vodiča ta repozitorij vključuje obsežen **12-modulni učni vodič**, ki se nahaja v imeniku `/walkthrough`. Ta strukturiran pristop razčleni kompleksno implementacijo v obvladljive učne module, idealne za razvijalce, ki želijo razumeti vsako komponento korak za korakom.

### Pregled učnih modulov

| Modul | Tema | Poudarek | Trajanje |
|-------|------|----------|----------|
| **[00-Uvod](walkthrough/00-Introduction/README.md)** | Osnove MCP | Temeljni koncepti, študija primera Zava Retail, pregled arhitekture | 30 min |
| **[01-Arhitektura](walkthrough/01-Architecture/README.md)** | Sistemska zasnova | Tehnična arhitektura, vzorci zasnove, odnosi med komponentami | 45 min |
| **[02-Varnost](walkthrough/02-Security/README.md)** | Varnost na ravni podjetja | Azure avtentikacija, varnost na ravni vrstic, izolacija več najemnikov | 60 min |
| **[03-Namestitev](walkthrough/03-Setup/README.md)** | Nastavitev okolja | Konfiguracija Dockerja, Azure CLI, inicializacija projekta | 45 min |
| **[04-Podatkovna baza](walkthrough/04-Database/README.md)** | Podatkovna plast | PostgreSQL shema, nastavitev pgvector, RLS politike, vzorčni podatki | 60 min |
| **[05-MCP-strežnik](walkthrough/05-MCP-Server/README.md)** | Osnovna implementacija | Okvir FastMCP, integracija podatkovne baze, razvoj orodij | 90 min |
| **[06-Orodja](walkthrough/06-Tools/README.md)** | Razvoj orodij | Ustvarjanje MCP orodij, validacija poizvedb, poslovna inteligenca | 75 min |
| **[07-Semantično-iskanje](walkthrough/07-Semantic-Search/README.md)** | Integracija AI | Azure OpenAI vdelave, iskanje po vektorjih, hibridne poizvedbe | 60 min |
| **[08-Testiranje](walkthrough/08-Testing/README.md)** | Zagotavljanje kakovosti | Strategije testiranja, tehnike odpravljanja napak, testiranje zmogljivosti | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Razvojna izkušnja | Konfiguracija VS Code, integracija AI klepeta, delovni tokovi odpravljanja napak | 45 min |
| **[10-Namestitev](walkthrough/10-Deployment/README.md)** | Namestitev v produkcijo | Kontejnerizacija, Azure Container Apps, CI/CD procesi | 90 min |
| **[11-Nadzor](walkthrough/11-Monitoring/README.md)** | Opazovanje | Application Insights, strukturirano beleženje, metrične zmogljivosti | 60 min |
| **[12-Najboljše-prakse](walkthrough/12-Best-Practices/README.md)** | Odličnost v produkciji | Krepitev varnosti, optimizacija, vzorci na ravni podjetja | 45 min |

### Kako uporabljati učni vodič

**📖 Za učenje**: Moduli `/walkthrough` ponujajo korak za korakom navodila z razlagami, zakaj je vsaka komponenta zasnovana na določen način. Začnite z modulom 00 in nadaljujte zaporedno.

**🔧 Za implementacijo**: Ta Sample_Walkthrough.md ponuja tehnično razčlenitev in pregled kode za razvijalce, ki želijo hitro razumeti celotno implementacijo.

**🚀 Za produkcijo**: Moduli 02, 10, 11 in 12 se osredotočajo posebej na namestitev v produkcijo, varnost in nadzor.

**📚 Celotna učna pot**: Obiščite **[/walkthrough/README.md](walkthrough/README.md)** za celoten pregled učnega vodiča z natančnimi učnimi cilji in predpogoji.

---

## Podroben pregled arhitekture

### Arhitektura na visoki ravni

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

### Osnovne komponente

#### 1. **MCP strežnik (`sales_analysis.py`)**
- **Okvir FastMCP**: Upravljanje komunikacije prek HTTP/SSE protokola
- **Registracija orodij**: Izpostavljanje orodij za poizvedbe in sheme podatkovne baze
- **Kontekst zahteve**: Upravljanje identifikacije uporabnika za RLS
- **Upravljanje napak**: Zanesljivo upravljanje napak in beleženje

#### 2. **Podatkovna plast (`sales_analysis_postgres.py`)**
- **Upravljanje povezovalnih bazenov**: Učinkovito upravljanje povezav asyncpg
- **Ponudnik sheme**: Dinamično odkrivanje sheme tabel
- **Izvajanje poizvedb**: Varno izvajanje SQL poizvedb z RLS
- **Semantično iskanje**: Iskanje po podobnosti vektorjev z pgvector

#### 3. **Upravljanje konfiguracije (`config.py`)**
- **Spremenljivke okolja**: Centralizirano upravljanje konfiguracije
- **Parametri povezave**: Konfiguracija podatkovne baze in Azure storitev
- **Validacija**: Validacija zahtevanih spremenljivk okolja

#### 4. **Infrastruktura (`infra/`)**
- **Bicep predloge**: Deklarativno zagotavljanje Azure virov
- **Namestitev modela**: Avtomatizirana namestitev AI modelov
- **Dodelitve vlog**: Konfiguracija varnostnih vlog

### Tok podatkov

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Izgradnja rešitve

### Korak 1: Nastavitev strukture projekta

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

### Korak 2: Osnovne odvisnosti

**Python zahteve:**
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

**Sistemske zahteve:**
- Docker Desktop za kontejnerizacijo
- Azure CLI za namestitev
- PostgreSQL z razširitvijo pgvector
- VS Code z AI razširitvami

### Korak 3: Zasnova sheme podatkovne baze

Primer uporablja podatkovno bazo za maloprodajo s ključnimi tabelami:

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

**Implementacija varnosti na ravni vrstic (RLS):**
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

## Razčlenitev komponent

### Osnova MCP strežnika (`sales_analysis.py`)

#### Vzorec registracije orodij
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

**Ključne funkcije:**
- **Tipne anotacije**: Pydantic opisi polj za razumevanje AI
- **Ekstrakcija konteksta**: Identiteta uporabnika iz HTTP glave
- **Upravljanje napak**: Eleganten odziv z informativnimi sporočili
- **Beleženje**: Celovito beleženje operacij

#### Upravljanje konteksta zahteve
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Podatkovna plast (`sales_analysis_postgres.py`)

#### Upravljanje povezovalnih bazenov
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

**Vzorce zasnove:**
- **Upravljanje virov**: Pravilno upravljanje življenjskega cikla bazenov
- **Optimizacija zmogljivosti**: Nastavitve PostgreSQL za boljšo zmogljivost
- **Obnovitev napak**: Ponovno vzpostavljanje povezave in rezervna logika
- **Varnost**: Nastavitev konteksta RLS za vsako povezavo

#### Introspekcija sheme
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

### Integracija semantičnega iskanja

#### Generiranje vdelav
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

#### Iskanje po podobnosti vektorjev
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

## Vodič za namestitev

### Namestitev Azure infrastrukture

#### 1. **Struktura Bicep predloge**

**Glavna predloga (`main.bicep`):**
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

#### 2. **Avtomatizacija namestitve**

**PowerShell namestitev (`deploy.ps1`):**
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

### Nastavitev lokalnega razvoja

#### 1. **Konfiguracija Docker Compose**
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

#### 2. **Inicializacija podatkovne baze**
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

## Uporaba rešitve

### Integracija z VS Code

#### 1. **Konfiguracija MCP (`.vscode/mcp.json`)**
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

#### 2. **Primeri poizvedb**

**Odkrivanje sheme:**
```
AI: #zava What tables are available in the database?
```
*MCP strežnik uporablja `get_multiple_table_schemas` za vračanje struktur tabel*

**Analiza prodaje:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Generira SQL z ustreznimi združitvami in filtriranjem datumov*

**Semantično iskanje:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Uporablja vdelave za iskanje semantično podobnih izdelkov*

**Analiza več trgovin:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS zagotavlja dostop samo do podatkov trgovine v Seattlu*

### Vzorci naprednih poizvedb

#### 1. **Analiza časovnih serij**
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

#### 2. **Uspešnost izdelkov po kategorijah**
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

## Napredne funkcije

### Implementacija varnosti na ravni vrstic

#### 1. **Ustvarjanje politik**
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

#### 2. **Nastavitev konteksta v MCP strežniku**
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

### Podroben pregled semantičnega iskanja

#### 1. **Cevovod vdelav**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optimizacija iskanja po podobnosti**
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

### Nadzor in opazovanje

#### 1. **Integracija Azure Application Insights**
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

#### 2. **Prilagojene metrike in beleženje**
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

## Odpravljanje težav

### Pogoste težave in rešitve

#### 1. **Težave s povezavo podatkovne baze**
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

**Pogoste rešitve:**
- Preverite, ali PostgreSQL deluje: `docker ps`
- Preverite parametre povezave v `.env`
- Validirajte obstoj podatkovne baze: `docker exec -it pg17 psql -U postgres -l`
- Testirajte omrežno povezljivost: `telnet localhost 5432`

#### 2. **Težave s politiko RLS**
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

#### 3. **Težave s storitvijo vdelav**
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

### Optimizacija zmogljivosti

#### 1. **Uglasitev bazena povezav**
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

#### 2. **Optimizacija poizvedb**
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

## Najboljše prakse

### Najboljše prakse za varnost

#### 1. **Upravljanje spremenljivk okolja**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Smernice za implementacijo RLS**
- **Privzeto zavrni**: Začnite z restriktivnimi politikami
- **Redno preverjanje**: Spremljajte učinkovitost politik
- **Temeljito testiranje**: Validirajte vzorce dostopa
- **Dokumentiranje politik**: Vzdržujte jasno dokumentacijo

#### 3. **Omrežna varnost**
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

### Najboljše prakse za razvoj

#### 1. **Vzorce upravljanja napak**
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

#### 2. **Strategije testiranja**
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

#### 3. **Nadzor in opozorila**
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

### Najboljše prakse za namestitev

#### 1. **Infrastruktura kot koda**
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

#### 2. **Integracija CI/CD procesov**
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

Ta celovit vodič ponuja temelje za izgradnjo, namestitev in upravljanje produkcijsko pripravljenega MCP strežnika z integracijo PostgreSQL. Vzorci in prakse, prikazani tukaj, se lahko razširijo na druge domene in primere uporabe, pri čemer se ohranjajo varnost, zmogljivost in vzdržljivost.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.