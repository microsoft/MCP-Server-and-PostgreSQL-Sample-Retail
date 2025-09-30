<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T05:53:56+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "cs"
}
-->
# MCP Server a PostgreSQL Ukázka - Kompletní průvodce

## Obsah
1. [Přehled](../..)
2. [Detailní architektura](../..)
3. [Vytvoření řešení](../..)
4. [Rozbor komponent](../..)
5. [Průvodce nasazením](../..)
6. [Použití řešení](../..)
7. [Pokročilé funkce](../..)
8. [Řešení problémů](../..)
9. [Osvědčené postupy](../..)

## Přehled

Tento průvodce rozebírá, jak vytvořit a používat produkčně připravený **Model Context Protocol (MCP) server**, který se integruje s PostgreSQL a službami Azure AI. Ukázka demonstruje vzory na podnikové úrovni, včetně bezpečnosti na úrovni řádků, sémantického vyhledávání a přístupu k datům pro více nájemců.

### Co se naučíte
- Jak navrhnout MCP server s integrací databáze
- Implementace bezpečnosti na úrovni řádků pro scénáře s více nájemci
- Vytvoření sémantického vyhledávání pomocí Azure OpenAI embeddings
- Vytvoření vývojového prostředí založeného na Dockeru
- Nasazení infrastruktury Azure pomocí šablon Bicep
- Integrace s VS Code pro analýzu poháněnou AI

### Použité technologie
- **MCP Protocol**: Protokol Model Context pro integraci AI nástrojů
- **FastMCP**: Moderní Python framework pro MCP server
- **PostgreSQL**: Databáze s rozšířením pgvector pro sémantické vyhledávání
- **Azure OpenAI**: Textové embeddings a volitelné GPT modely
- **Docker**: Kontejnerizace pro konzistentní prostředí
- **Bicep**: Infrastructure as Code pro zdroje Azure
- **VS Code**: Vývojové prostředí s integrací MCP

## 📚 Strukturovaný průvodce učením: /walkthrough

Kromě tohoto technického průvodce obsahuje tento repozitář komplexní **12-modulový průvodce učením**, který najdete ve složce `/walkthrough`. Tento strukturovaný přístup rozděluje složitou implementaci na stravitelné moduly, ideální pro vývojáře, kteří chtějí pochopit jednotlivé komponenty krok za krokem.

### Přehled modulů učení

| Modul | Téma | Zaměření | Délka |
|-------|------|----------|-------|
| **[00-Úvod](walkthrough/00-Introduction/README.md)** | Základy MCP | Základní koncepty, případová studie Zava Retail, přehled architektury | 30 min |
| **[01-Architektura](walkthrough/01-Architecture/README.md)** | Návrh systému | Technická architektura, návrhové vzory, vztahy komponent | 45 min |
| **[02-Bezpečnost](walkthrough/02-Security/README.md)** | Podniková bezpečnost | Autentizace Azure, bezpečnost na úrovni řádků, izolace více nájemců | 60 min |
| **[03-Nastavení](walkthrough/03-Setup/README.md)** | Nastavení prostředí | Konfigurace Dockeru, Azure CLI, inicializace projektu | 45 min |
| **[04-Databáze](walkthrough/04-Database/README.md)** | Datová vrstva | Schéma PostgreSQL, nastavení pgvector, RLS politiky, ukázková data | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Základní implementace | Framework FastMCP, integrace databáze, vývoj nástrojů | 90 min |
| **[06-Nástroje](walkthrough/06-Tools/README.md)** | Vývoj nástrojů | Vytvoření MCP nástrojů, validace dotazů, business intelligence | 75 min |
| **[07-Sémantické vyhledávání](walkthrough/07-Semantic-Search/README.md)** | Integrace AI | Azure OpenAI embeddings, vyhledávání vektoru, hybridní dotazy | 60 min |
| **[08-Testování](walkthrough/08-Testing/README.md)** | Zajištění kvality | Strategie testování, techniky ladění, testování výkonu | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Vývojové prostředí | Konfigurace VS Code, integrace AI Chat, pracovní postupy ladění | 45 min |
| **[10-Nasazení](walkthrough/10-Deployment/README.md)** | Produkční nasazení | Kontejnerizace, Azure Container Apps, CI/CD pipelines | 90 min |
| **[11-Monitorování](walkthrough/11-Monitoring/README.md)** | Pozorovatelnost | Application Insights, strukturované logování, metriky výkonu | 60 min |
| **[12-Osvědčené postupy](walkthrough/12-Best-Practices/README.md)** | Produkční dokonalost | Zpevnění bezpečnosti, optimalizace, podnikové vzory | 45 min |

### Jak používat průvodce učením

**📖 Pro učení**: Moduly `/walkthrough` poskytují krok za krokem instrukce s vysvětlením, proč je každá komponenta navržena tak, jak je. Začněte modulem 00 a postupujte postupně.

**🔧 Pro implementaci**: Tento Sample_Walkthrough.md poskytuje technický rozbor a přehled kódu pro vývojáře, kteří chtějí rychle pochopit kompletní implementaci.

**🚀 Pro produkci**: Moduly 02, 10, 11 a 12 se zaměřují konkrétně na produkční nasazení, bezpečnost a monitorovací úvahy.

**📚 Kompletní učební cesta**: Navštivte **[/walkthrough/README.md](walkthrough/README.md)** pro kompletní přehled průvodce učením s podrobnými cíli a předpoklady.

---

## Detailní architektura

### Architektura na vysoké úrovni

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

### Klíčové komponenty

#### 1. **MCP Server (`sales_analysis.py`)**
- **Framework FastMCP**: Zpracovává komunikaci HTTP/SSE protokolu
- **Registrace nástrojů**: Zpřístupňuje nástroje pro dotazy a schémata databáze
- **Kontext požadavku**: Spravuje identifikaci uživatele pro RLS
- **Zpracování chyb**: Robustní správa chyb a logování

#### 2. **Databázová vrstva (`sales_analysis_postgres.py`)**
- **Správa připojení**: Efektivní asynchronní správa připojení pomocí asyncpg
- **Poskytovatel schématu**: Dynamické zjišťování schémat tabulek
- **Provádění dotazů**: Bezpečné provádění SQL s RLS
- **Sémantické vyhledávání**: Vyhledávání podobnosti vektorů pomocí pgvector

#### 3. **Správa konfigurace (`config.py`)**
- **Proměnné prostředí**: Centralizovaná správa konfigurace
- **Parametry připojení**: Konfigurace databáze a služeb Azure
- **Validace**: Validace požadovaných proměnných prostředí

#### 4. **Infrastruktura (`infra/`)**
- **Šablony Bicep**: Deklarativní zajištění zdrojů Azure
- **Nasazení modelu**: Automatizované nasazení AI modelu
- **Přiřazení rolí**: Konfigurace bezpečnostních rolí

### Tok dat

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Vytvoření řešení

### Krok 1: Nastavení struktury projektu

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

### Krok 2: Základní závislosti

**Požadavky na Python:**
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

**Požadavky na systém:**
- Docker Desktop pro kontejnerizaci
- Azure CLI pro nasazení
- PostgreSQL s rozšířením pgvector
- VS Code s AI rozšířeními

### Krok 3: Návrh schématu databáze

Ukázka používá maloobchodní databázi s těmito klíčovými tabulkami:

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

**Implementace bezpečnosti na úrovni řádků (RLS):**
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

## Rozbor komponent

### Jádro MCP Serveru (`sales_analysis.py`)

#### Vzor registrace nástrojů
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

**Klíčové funkce:**
- **Typové anotace**: Popisy polí Pydantic pro pochopení AI
- **Extrahování kontextu**: Identita uživatele z HTTP hlaviček
- **Zpracování chyb**: Elegantní selhání s informativními zprávami
- **Logování**: Komplexní logování operací

#### Správa kontextu požadavku
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Databázová vrstva (`sales_analysis_postgres.py`)

#### Správa připojení
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

**Návrhové vzory:**
- **Správa zdrojů**: Správná správa životního cyklu poolu
- **Ladění výkonu**: Optimalizovaná nastavení PostgreSQL
- **Obnova chyb**: Opakování připojení a logika záložního řešení
- **Bezpečnost**: Nastavení kontextu RLS pro každé připojení

#### Introspekce schématu
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

### Integrace sémantického vyhledávání

#### Generování embeddings
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

#### Vyhledávání podobnosti vektorů
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

## Průvodce nasazením

### Nasazení infrastruktury Azure

#### 1. **Struktura šablony Bicep**

**Hlavní šablona (`main.bicep`):**
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

#### 2. **Automatizace nasazení**

**Nasazení pomocí PowerShell (`deploy.ps1`):**
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

### Nastavení lokálního vývoje

#### 1. **Konfigurace Docker Compose**
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

#### 2. **Inicializace databáze**
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

## Použití řešení

### Integrace VS Code

#### 1. **Konfigurace MCP (`.vscode/mcp.json`)**
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

#### 2. **Ukázky dotazů**

**Zjišťování schématu:**
```
AI: #zava What tables are available in the database?
```
*MCP server používá `get_multiple_table_schemas` k vrácení struktur tabulek*

**Analýza prodeje:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Generuje SQL s odpovídajícími spojeními a filtrováním podle data*

**Sémantické vyhledávání:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Používá embeddings k nalezení sémanticky podobných produktů*

**Analýza více obchodů:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS zajišťuje přístup pouze k datům obchodu v Seattlu*

### Pokročilé vzory dotazů

#### 1. **Analýza časových řad**
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

#### 2. **Výkon produktů podle kategorií**
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

## Pokročilé funkce

### Implementace bezpečnosti na úrovni řádků

#### 1. **Vytvoření politiky**
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

#### 2. **Nastavení kontextu v MCP serveru**
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

### Detailní pohled na sémantické vyhledávání

#### 1. **Pipeline embeddings**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optimalizace vyhledávání podobnosti**
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

### Monitorování a pozorovatelnost

#### 1. **Integrace Azure Application Insights**
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

#### 2. **Vlastní metriky a logování**
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

## Řešení problémů

### Běžné problémy a jejich řešení

#### 1. **Problémy s připojením k databázi**
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

**Běžné opravy:**
- Ověřte, že PostgreSQL běží: `docker ps`
- Zkontrolujte parametry připojení v `.env`
- Ověřte existenci databáze: `docker exec -it pg17 psql -U postgres -l`
- Otestujte síťovou konektivitu: `telnet localhost 5432`

#### 2. **Problémy s politikou RLS**
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

#### 3. **Problémy se službou embeddings**
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

### Optimalizace výkonu

#### 1. **Ladění poolu připojení**
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

#### 2. **Optimalizace dotazů**
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

## Osvědčené postupy

### Osvědčené postupy bezpečnosti

#### 1. **Správa proměnných prostředí**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Pokyny pro implementaci RLS**
- **Výchozí odmítnutí**: Začněte s restriktivními politikami
- **Pravidelný audit**: Monitorujte efektivitu politik
- **Důkladné testování**: Validujte přístupové vzory
- **Dokumentace politik**: Udržujte jasnou dokumentaci

#### 3. **Síťová bezpečnost**
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

### Osvědčené postupy vývoje

#### 1. **Vzory zpracování chyb**
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

#### 2. **Strategie testování**
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

#### 3. **Monitorování a upozornění**
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

### Osvědčené postupy nasazení

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

#### 2. **Integrace CI/CD pipeline**
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

Tento komplexní průvodce poskytuje základ pro vytvoření, nasazení a provoz produkčně připraveného MCP serveru s integrací PostgreSQL. Vzory a postupy zde demonstrované lze rozšířit na jiné domény a případy použití při zachování bezpečnosti, výkonu a udržovatelnosti.

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.