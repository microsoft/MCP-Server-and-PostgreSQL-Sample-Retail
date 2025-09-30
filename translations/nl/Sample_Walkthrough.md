<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T22:13:59+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "nl"
}
-->
# MCP Server en PostgreSQL Voorbeeld - Complete Handleiding

## Inhoudsopgave
1. [Overzicht](../..)
2. [Architectuur Uitgebreid](../..)
3. [De Oplossing Bouwen](../..)
4. [Componenten Uiteengezet](../..)
5. [Implementatiehandleiding](../..)
6. [De Oplossing Gebruiken](../..)
7. [Geavanceerde Functies](../..)
8. [Probleemoplossing](../..)
9. [Best Practices](../..)

## Overzicht

Deze handleiding laat zien hoe je een productieklare **Model Context Protocol (MCP) server** bouwt en gebruikt, die integreert met PostgreSQL en Azure AI-diensten. Het voorbeeld demonstreert bedrijfsniveau patronen zoals Row Level Security, semantisch zoeken en multi-tenant data toegang.

### Wat Je Leert
- Hoe je een MCP-server met database-integratie ontwerpt
- Row Level Security implementeren voor multi-tenant scenario's
- Semantisch zoeken bouwen met Azure OpenAI embeddings
- Docker-gebaseerde ontwikkelomgevingen creëren
- Azure infrastructuur implementeren met Bicep templates
- Integreren met VS Code voor AI-gestuurde analyses

### Gebruikte Technologieën
- **MCP Protocol**: Model Context Protocol voor AI-tool integratie
- **FastMCP**: Modern Python MCP server framework
- **PostgreSQL**: Database met pgvector extensie voor semantisch zoeken
- **Azure OpenAI**: Tekst embeddings en optionele GPT-modellen
- **Docker**: Containerisatie voor consistente omgevingen
- **Bicep**: Infrastructure as Code voor Azure resources
- **VS Code**: Ontwikkelomgeving met MCP-integratie

## 📚 Gestructureerde Leerhandleiding: /walkthrough

Naast deze technische handleiding bevat deze repository een uitgebreide **12-module leerhandleiding** in de map `/walkthrough`. Deze gestructureerde aanpak breekt de complexe implementatie op in behapbare leermodules, ideaal voor ontwikkelaars die elk onderdeel stap voor stap willen begrijpen.

### Overzicht Leermodules

| Module | Onderwerp | Focus | Duur |
|--------|-----------|-------|------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP Basisprincipes | Kernconcepten, Zava Retail casestudy, architectuuroverzicht | 30 min |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Systeemontwerp | Technische architectuur, ontwerp patronen, componentrelaties | 45 min |
| **[02-Security](walkthrough/02-Security/README.md)** | Bedrijfsbeveiliging | Azure authenticatie, Row Level Security, multi-tenant isolatie | 60 min |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Omgevingsinstelling | Docker configuratie, Azure CLI, projectinitialisatie | 45 min |
| **[04-Database](walkthrough/04-Database/README.md)** | Datalaag | PostgreSQL schema, pgvector setup, RLS policies, voorbeelddata | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kernimplementatie | FastMCP framework, database-integratie, toolontwikkeling | 90 min |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Toolontwikkeling | MCP tool creatie, query validatie, bedrijfsintelligentie | 75 min |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI-integratie | Azure OpenAI embeddings, vector zoeken, hybride queries | 60 min |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Kwaliteitsborging | Teststrategieën, debugging technieken, prestatietesten | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Ontwikkelervaring | VS Code configuratie, AI Chat integratie, debugging workflows | 45 min |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Productie-implementatie | Containerisatie, Azure Container Apps, CI/CD pipelines | 90 min |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observatie | Application Insights, gestructureerde logging, prestatiemetrics | 60 min |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Productie-excellentie | Beveiligingsversterking, optimalisatie, bedrijfsniveau patronen | 45 min |

### Hoe de Leerhandleiding te Gebruiken

**📖 Voor Leren**: De `/walkthrough` modules bieden stap-voor-stap instructies met uitleg over waarom elk onderdeel is ontworpen zoals het is. Begin met Module 00 en werk sequentieel verder.

**🔧 Voor Implementatie**: Deze Sample_Walkthrough.md biedt de technische diepgaande uitleg en code-uiteenzetting voor ontwikkelaars die snel de volledige implementatie willen begrijpen.

**🚀 Voor Productie**: Modules 02, 10, 11 en 12 richten zich specifiek op productieklare implementatie, beveiliging en monitoring.

**📚 Volledige Leerpad**: Bezoek **[/walkthrough/README.md](walkthrough/README.md)** voor het volledige overzicht van de leerhandleiding met gedetailleerde leerdoelen en vereisten.

---

## Architectuur Uitgebreid

### Hoog-Niveau Architectuur

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

### Kerncomponenten

#### 1. **MCP Server (`sales_analysis.py`)**
- **FastMCP Framework**: Behandelt HTTP/SSE protocol communicatie
- **Toolregistratie**: Stelt databasequery en schema tools beschikbaar
- **Request Context**: Beheert RLS gebruikersidentificatie
- **Foutafhandeling**: Robuust foutbeheer en logging

#### 2. **Database Laag (`sales_analysis_postgres.py`)**
- **Connection Pooling**: Efficiënt asyncpg connectiebeheer
- **Schema Provider**: Dynamische tabelschema ontdekking
- **Query Uitvoering**: Veilige SQL-uitvoering met RLS
- **Semantisch Zoeken**: Vector gelijkenis zoeken met pgvector

#### 3. **Configuratiebeheer (`config.py`)**
- **Omgevingsvariabelen**: Gecentraliseerd configuratiebeheer
- **Connectieparameters**: Database en Azure service configuratie
- **Validatie**: Vereiste omgevingsvariabelen validatie

#### 4. **Infrastructuur (`infra/`)**
- **Bicep Templates**: Declaratieve Azure resource provisioning
- **Model Implementatie**: Geautomatiseerde AI model implementatie
- **Roltoewijzingen**: Beveiligingsrol configuratie

### Datastroom

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## De Oplossing Bouwen

### Stap 1: Projectstructuur Instellen

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

### Stap 2: Kernvereisten

**Python Vereisten:**
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

**Systeemvereisten:**
- Docker Desktop voor containerisatie
- Azure CLI voor implementatie
- PostgreSQL met pgvector extensie
- VS Code met AI-extensies

### Stap 3: Database Schema Ontwerp

Het voorbeeld gebruikt een retail database met deze belangrijke tabellen:

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

**Row Level Security (RLS) Implementatie:**
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

## Componenten Uiteengezet

### MCP Server Kern (`sales_analysis.py`)

#### Toolregistratiepatroon
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

**Belangrijke Functies:**
- **Type Annotaties**: Pydantic veldbeschrijvingen voor AI begrip
- **Context Extractie**: Gebruikersidentiteit uit HTTP headers
- **Foutafhandeling**: Gracieus falen met informatieve berichten
- **Logging**: Uitgebreide operationele logging

#### Request Context Beheer
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Database Laag (`sales_analysis_postgres.py`)

#### Connection Pool Beheer
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

**Ontwerp Patronen:**
- **Resourcebeheer**: Correct pool levenscyclusbeheer
- **Prestatieoptimalisatie**: Geoptimaliseerde PostgreSQL instellingen
- **Foutherstel**: Connectie retry en fallback logica
- **Beveiliging**: RLS context instellen per connectie

#### Schema Introspectie
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

### Semantisch Zoeken Integratie

#### Embedding Generatie
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

#### Vector Gelijkenis Zoeken
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

## Implementatiehandleiding

### Azure Infrastructuur Implementatie

#### 1. **Bicep Template Structuur**

**Hoofdtemplate (`main.bicep`):**
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

#### 2. **Automatisering Implementatie**

**PowerShell Implementatie (`deploy.ps1`):**
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

### Lokale Ontwikkelomgeving Instellen

#### 1. **Docker Compose Configuratie**
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

#### 2. **Database Initialisatie**
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

## De Oplossing Gebruiken

### VS Code Integratie

#### 1. **MCP Configuratie (`.vscode/mcp.json`)**
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

#### 2. **Query Voorbeelden**

**Schema Ontdekking:**
```
AI: #zava What tables are available in the database?
```
*De MCP server gebruikt `get_multiple_table_schemas` om tabelstructuren terug te geven*

**Verkoopanalyse:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Genereert SQL met correcte joins en datumfiltering*

**Semantisch Zoeken:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Gebruikt embeddings om semantisch vergelijkbare producten te vinden*

**Multi-Store Analyse:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS zorgt ervoor dat alleen gegevens van de Seattle-winkel worden benaderd*

### Geavanceerde Query Patronen

#### 1. **Tijdreeksanalyse**
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

#### 2. **Productprestaties met Categorieën**
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

## Geavanceerde Functies

### Row Level Security Implementatie

#### 1. **Policy Creatie**
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

#### 2. **Context Instellen in MCP Server**
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

### Semantisch Zoeken Uitgebreid

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

#### 2. **Optimalisatie Gelijkenis Zoeken**
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

### Monitoring en Observatie

#### 1. **Azure Application Insights Integratie**
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

#### 2. **Aangepaste Metrics en Logging**
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

## Probleemoplossing

### Veelvoorkomende Problemen en Oplossingen

#### 1. **Database Connectieproblemen**
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

**Veelvoorkomende Oplossingen:**
- Controleer of PostgreSQL draait: `docker ps`
- Controleer connectieparameters in `.env`
- Valideer of database bestaat: `docker exec -it pg17 psql -U postgres -l`
- Test netwerkconnectiviteit: `telnet localhost 5432`

#### 2. **RLS Policy Problemen**
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

#### 3. **Embedding Service Problemen**
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

### Prestatieoptimalisatie

#### 1. **Connection Pool Afstemming**
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

#### 2. **Query Optimalisatie**
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

## Best Practices

### Beveiligingsrichtlijnen

#### 1. **Omgevingsvariabelen Beheer**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS Implementatie Richtlijnen**
- **Standaard Weigeren**: Begin met restrictieve policies
- **Regelmatig Auditen**: Monitor policy effectiviteit
- **Grondig Testen**: Valideer toegangsmodellen
- **Documenteer Policies**: Houd duidelijke documentatie bij

#### 3. **Netwerkbeveiliging**
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

### Ontwikkelrichtlijnen

#### 1. **Foutafhandelingspatronen**
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

#### 2. **Teststrategieën**
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

#### 3. **Monitoring en Alerts**
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

### Implementatierichtlijnen

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

#### 2. **CI/CD Pipeline Integratie**
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

Deze uitgebreide handleiding biedt de basis voor het bouwen, implementeren en beheren van een productieklare MCP-server met PostgreSQL-integratie. De getoonde patronen en praktijken kunnen worden uitgebreid naar andere domeinen en use cases, terwijl beveiliging, prestaties en onderhoudbaarheid behouden blijven.

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.