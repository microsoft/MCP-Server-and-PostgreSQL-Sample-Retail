<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T21:47:59+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "no"
}
-->
# MCP Server og PostgreSQL Eksempel - Komplett Gjennomgang

## Innholdsfortegnelse
1. [Oversikt](../..)
2. [Arkitektur Detaljer](../..)
3. [Bygge Løsningen](../..)
4. [Komponentoversikt](../..)
5. [Veiledning for Utrulling](../..)
6. [Bruke Løsningen](../..)
7. [Avanserte Funksjoner](../..)
8. [Feilsøking](../..)
9. [Beste Praksis](../..)

## Oversikt

Denne gjennomgangen viser hvordan man bygger og bruker en produksjonsklar **Model Context Protocol (MCP) server** som integreres med PostgreSQL og Azure AI-tjenester. Eksempelet demonstrerer mønstre for bedrifter, inkludert Row Level Security, semantisk søk og tilgang til data for flere leietakere.

### Hva Du Vil Lære
- Hvordan designe en MCP-server med databaseintegrasjon
- Implementere Row Level Security for scenarier med flere leietakere
- Bygge semantisk søk med Azure OpenAI-embeddings
- Opprette Docker-baserte utviklingsmiljøer
- Utrulling av Azure-infrastruktur med Bicep-maler
- Integrere med VS Code for AI-drevet analyse

### Brukte Teknologier
- **MCP-protokoll**: Model Context Protocol for AI-verktøyintegrasjon
- **FastMCP**: Moderne Python MCP-serverrammeverk
- **PostgreSQL**: Database med pgvector-utvidelse for semantisk søk
- **Azure OpenAI**: Tekstembeddings og valgfrie GPT-modeller
- **Docker**: Containerisering for konsistente miljøer
- **Bicep**: Infrastruktur som kode for Azure-ressurser
- **VS Code**: Utviklingsmiljø med MCP-integrasjon

## 📚 Strukturert Læringsveiledning: /walkthrough

I tillegg til denne tekniske gjennomgangen inkluderer dette repositoriet en omfattende **12-modulers læringsveiledning** som finnes i `/walkthrough`-mappen. Denne strukturerte tilnærmingen bryter ned den komplekse implementeringen i fordøyelige læringsmoduler, perfekt for utviklere som ønsker å forstå hver komponent steg for steg.

### Oversikt over Læringsmoduler

| Modul | Emne | Fokus | Varighet |
|-------|------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP Grunnleggende | Kjernebegreper, Zava Retail case study, arkitekturoversikt | 30 min |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Systemdesign | Teknisk arkitektur, designmønstre, komponentforhold | 45 min |
| **[02-Security](walkthrough/02-Security/README.md)** | Sikkerhet for Bedrifter | Azure-autentisering, Row Level Security, isolasjon for flere leietakere | 60 min |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Miljøoppsett | Docker-konfigurasjon, Azure CLI, prosjektinitialisering | 45 min |
| **[04-Database](walkthrough/04-Database/README.md)** | Databaselag | PostgreSQL-skjema, pgvector-oppsett, RLS-policyer, eksempeldata | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kjerneimplementering | FastMCP-rammeverk, databaseintegrasjon, verktøyutvikling | 90 min |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Verktøyutvikling | Opprettelse av MCP-verktøy, validering av spørringer, forretningsanalyse | 75 min |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI-integrasjon | Azure OpenAI-embeddings, vektorsøk, hybride spørringer | 60 min |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Kvalitetssikring | Teststrategier, feilsøkingsteknikker, ytelsestesting | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Utviklingsopplevelse | VS Code-konfigurasjon, AI Chat-integrasjon, feilsøkingsarbeidsflyter | 45 min |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Utrulling i Produksjon | Containerisering, Azure Container Apps, CI/CD-pipelines | 90 min |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observabilitet | Application Insights, strukturert logging, ytelsesmålinger | 60 min |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Produksjonskvalitet | Sikkerhetsforbedringer, optimalisering, mønstre for bedrifter | 45 min |

### Hvordan Bruke Læringsveiledningen

**📖 For Læring**: `/walkthrough`-modulene gir steg-for-steg-instruksjoner med forklaringer på hvorfor hver komponent er designet slik den er. Start med Modul 00 og gå videre sekvensielt.

**🔧 For Implementering**: Denne Sample_Walkthrough.md gir en teknisk detaljert gjennomgang og kodeforklaring for utviklere som ønsker å forstå hele implementeringen raskt.

**🚀 For Produksjon**: Modulene 02, 10, 11 og 12 fokuserer spesifikt på utrulling, sikkerhet og overvåking i produksjon.

**📚 Komplett Læringssti**: Besøk **[/walkthrough/README.md](walkthrough/README.md)** for en fullstendig oversikt over læringsveiledningen med detaljerte læringsmål og forutsetninger.

---

## Arkitektur Detaljer

### Overordnet Arkitektur

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

### Kjernekomponenter

#### 1. **MCP Server (`sales_analysis.py`)**
- **FastMCP Rammeverk**: Håndterer HTTP/SSE-protokollkommunikasjon
- **Verktøyregistrering**: Eksponerer databaseverktøy og skjemaer
- **Forespørselssammenheng**: Administrerer RLS-brukeridentifikasjon
- **Feilhåndtering**: Robust feilhåndtering og logging

#### 2. **Databaselag (`sales_analysis_postgres.py`)**
- **Tilkoblingspooling**: Effektiv asyncpg-tilkoblingsadministrasjon
- **Skjemaleverandør**: Dynamisk oppdagelse av tabellskjemaer
- **Spørringsutførelse**: Sikker SQL-utførelse med RLS
- **Semantisk Søk**: Vektorsøk med pgvector

#### 3. **Konfigurasjonsadministrasjon (`config.py`)**
- **Miljøvariabler**: Sentralisert konfigurasjonshåndtering
- **Tilkoblingsparametere**: Database- og Azure-tjenestekonfigurasjon
- **Validering**: Validering av nødvendige miljøvariabler

#### 4. **Infrastruktur (`infra/`)**
- **Bicep-maler**: Deklarativ opprettelse av Azure-ressurser
- **Modellutrulling**: Automatisert AI-modellutrulling
- **Rollefordelinger**: Konfigurasjon av sikkerhetsroller

### Dataflyt

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Bygge Løsningen

### Steg 1: Oppsett av Prosjektstruktur

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

### Steg 2: Kjerneavhengigheter

**Python Krav:**
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

**Systemkrav:**
- Docker Desktop for containerisering
- Azure CLI for utrulling
- PostgreSQL med pgvector-utvidelse
- VS Code med AI-utvidelser

### Steg 3: Design av Databaseskjema

Eksempelet bruker en detaljhandelsdatabase med disse nøkkeltabellene:

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

**Implementering av Row Level Security (RLS):**
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

## Komponentoversikt

### MCP Server Kjerne (`sales_analysis.py`)

#### Mønster for Verktøyregistrering
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

**Nøkkelfunksjoner:**
- **Typeannotasjoner**: Pydantic-feltbeskrivelser for AI-forståelse
- **Sammenhengsekstraksjon**: Brukeridentitet fra HTTP-headere
- **Feilhåndtering**: Grasiøs feilhåndtering med informative meldinger
- **Logging**: Omfattende operasjonslogging

#### Administrasjon av Forespørselssammenheng
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Databaselag (`sales_analysis_postgres.py`)

#### Administrasjon av Tilkoblingspool
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

**Designmønstre:**
- **Ressursadministrasjon**: Riktig livssyklusadministrasjon for pool
- **Ytelsesjustering**: Optimaliserte PostgreSQL-innstillinger
- **Feilgjenoppretting**: Tilkoblingsforsøk og fallback-logikk
- **Sikkerhet**: RLS-sammenhengsinnstilling per tilkobling

#### Skjemainnspeksjon
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

### Integrasjon av Semantisk Søk

#### Generering av Embeddings
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

#### Vektorsøk
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

## Veiledning for Utrulling

### Utrulling av Azure Infrastruktur

#### 1. **Struktur for Bicep-maler**

**Hovedmal (`main.bicep`):**
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

#### 2. **Automatisering av Utrulling**

**PowerShell Utrulling (`deploy.ps1`):**
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

### Oppsett for Lokal Utvikling

#### 1. **Docker Compose-konfigurasjon**
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

#### 2. **Initialisering av Database**
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

## Bruke Løsningen

### Integrasjon med VS Code

#### 1. **MCP-konfigurasjon (`.vscode/mcp.json`)**
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

#### 2. **Eksempler på Spørringer**

**Skjemainnspeksjon:**
```
AI: #zava What tables are available in the database?
```
*MCP-serveren bruker `get_multiple_table_schemas` for å returnere tabellstrukturer*

**Salgsanalyse:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Genererer SQL med riktige joins og datofiltrering*

**Semantisk Søk:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Bruker embeddings for å finne semantisk like produkter*

**Analyse for Flere Butikker:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS sikrer at kun data fra Seattle-butikken blir brukt*

### Avanserte Spørringsmønstre

#### 1. **Tidsserieanalyse**
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

#### 2. **Produktytelse med Kategorier**
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

## Avanserte Funksjoner

### Implementering av Row Level Security

#### 1. **Opprettelse av Policyer**
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

#### 2. **Sammenhengsinnstilling i MCP Server**
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

### Dypdykk i Semantisk Søk

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

#### 2. **Optimalisering av Likhetssøk**
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

### Overvåking og Observabilitet

#### 1. **Integrasjon med Azure Application Insights**
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

#### 2. **Egendefinerte Metrikker og Logging**
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

## Feilsøking

### Vanlige Problemer og Løsninger

#### 1. **Problemer med Databasetilkobling**
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

**Vanlige Løsninger:**
- Bekreft at PostgreSQL kjører: `docker ps`
- Sjekk tilkoblingsparametere i `.env`
- Valider at databasen eksisterer: `docker exec -it pg17 psql -U postgres -l`
- Test nettverkstilkobling: `telnet localhost 5432`

#### 2. **Problemer med RLS-policyer**
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

#### 3. **Problemer med Embedding-tjenesten**
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

### Ytelsesoptimalisering

#### 1. **Justering av Tilkoblingspool**
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

#### 2. **Optimalisering av Spørringer**
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

## Beste Praksis

### Sikkerhetspraksis

#### 1. **Administrasjon av Miljøvariabler**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Retningslinjer for RLS-implementering**
- **Standard Avslag**: Start med restriktive policyer
- **Revider Regelmessig**: Overvåk policyens effektivitet
- **Test Grundig**: Valider tilgangsmønstre
- **Dokumenter Policyer**: Oppretthold klar dokumentasjon

#### 3. **Nettverkssikkerhet**
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

### Utviklingspraksis

#### 1. **Mønstre for Feilhåndtering**
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

#### 2. **Teststrategier**
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

#### 3. **Overvåking og Varsler**
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

### Utrullingspraksis

#### 1. **Infrastruktur som Kode**
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

#### 2. **Integrasjon av CI/CD Pipeline**
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

Denne omfattende gjennomgangen gir grunnlaget for å bygge, utrulle og drifte en produksjonsklar MCP-server med PostgreSQL-integrasjon. Mønstrene og praksisene som demonstreres her kan utvides til andre domener og bruksområder, samtidig som sikkerhet, ytelse og vedlikeholdbarhet opprettholdes.

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.