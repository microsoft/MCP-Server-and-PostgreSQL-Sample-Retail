<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T06:39:24+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ro"
}
-->
# MCP Server și PostgreSQL Sample - Ghid Complet

## Cuprins
1. [Prezentare Generală](../..)
2. [Detalii Arhitecturale](../..)
3. [Construirea Soluției](../..)
4. [Analiza Componentelor](../..)
5. [Ghid de Implementare](../..)
6. [Utilizarea Soluției](../..)
7. [Funcționalități Avansate](../..)
8. [Depanare](../..)
9. [Cele Mai Bune Practici](../..)

## Prezentare Generală

Acest ghid detaliază procesul de construire și utilizare a unui **server Model Context Protocol (MCP)** pregătit pentru producție, care se integrează cu PostgreSQL și serviciile Azure AI. Exemplul demonstrează modele de nivel enterprise, inclusiv securitate la nivel de rând, căutare semantică și acces la date multi-chiriaș.

### Ce Vei Învăța
- Cum să arhitectezi un server MCP cu integrare în baza de date
- Implementarea securității la nivel de rând pentru scenarii multi-chiriaș
- Construirea unei căutări semantice cu embeddings Azure OpenAI
- Crearea mediilor de dezvoltare bazate pe Docker
- Implementarea infrastructurii Azure cu șabloane Bicep
- Integrarea cu VS Code pentru analize bazate pe AI

### Tehnologii Utilizate
- **Protocol MCP**: Protocol Model Context pentru integrarea instrumentelor AI
- **FastMCP**: Framework modern Python pentru server MCP
- **PostgreSQL**: Bază de date cu extensia pgvector pentru căutare semantică
- **Azure OpenAI**: Embeddings text și modele GPT opționale
- **Docker**: Containerizare pentru medii consistente
- **Bicep**: Infrastructure as Code pentru resursele Azure
- **VS Code**: Mediu de dezvoltare cu integrare MCP

## 📚 Ghid Structurat de Învățare: /walkthrough

Pe lângă acest ghid tehnic, acest depozit include un **ghid de învățare structurat în 12 module**, localizat în directorul `/walkthrough`. Această abordare structurată descompune implementarea complexă în module ușor de înțeles, perfect pentru dezvoltatorii care doresc să înțeleagă fiecare componentă pas cu pas.

### Prezentare Generală a Modulelor de Învățare

| Modul | Subiect | Focus | Durată |
|-------|---------|-------|--------|
| **[00-Introducere](walkthrough/00-Introduction/README.md)** | Fundamente MCP | Concepte de bază, studiu de caz Zava Retail, prezentare arhitecturală | 30 min |
| **[01-Arhitectură](walkthrough/01-Architecture/README.md)** | Design Sistem | Arhitectură tehnică, modele de design, relații între componente | 45 min |
| **[02-Securitate](walkthrough/02-Security/README.md)** | Securitate Enterprise | Autentificare Azure, securitate la nivel de rând, izolare multi-chiriaș | 60 min |
| **[03-Configurare](walkthrough/03-Setup/README.md)** | Configurare Mediu | Configurare Docker, CLI Azure, inițializare proiect | 45 min |
| **[04-Bază de Date](walkthrough/04-Database/README.md)** | Strat de Date | Schema PostgreSQL, configurare pgvector, politici RLS, date de exemplu | 60 min |
| **[05-Server MCP](walkthrough/05-MCP-Server/README.md)** | Implementare de Bază | Framework FastMCP, integrare bază de date, dezvoltare instrumente | 90 min |
| **[06-Instrumente](walkthrough/06-Tools/README.md)** | Dezvoltare Instrumente | Crearea instrumentelor MCP, validarea interogărilor, inteligență de afaceri | 75 min |
| **[07-Căutare Semantică](walkthrough/07-Semantic-Search/README.md)** | Integrare AI | Embeddings Azure OpenAI, căutare vectorială, interogări hibride | 60 min |
| **[08-Testare](walkthrough/08-Testing/README.md)** | Asigurarea Calității | Strategii de testare, tehnici de depanare, testare performanță | 75 min |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiență de Dezvoltare | Configurare VS Code, integrare AI Chat, fluxuri de depanare | 45 min |
| **[10-Implementare](walkthrough/10-Deployment/README.md)** | Implementare în Producție | Containerizare, Azure Container Apps, pipeline-uri CI/CD | 90 min |
| **[11-Monitorizare](walkthrough/11-Monitoring/README.md)** | Observabilitate | Application Insights, logare structurată, metrici de performanță | 60 min |
| **[12-Cele Mai Bune Practici](walkthrough/12-Best-Practices/README.md)** | Excelență în Producție | Întărirea securității, optimizare, modele enterprise | 45 min |

### Cum să Utilizezi Ghidul de Învățare

**📖 Pentru Învățare**: Modulele `/walkthrough` oferă instrucțiuni pas cu pas cu explicații despre motivul pentru care fiecare componentă este proiectată astfel. Începe cu Modulul 00 și progresează secvențial.

**🔧 Pentru Implementare**: Acest Sample_Walkthrough.md oferă detalii tehnice și analize de cod pentru dezvoltatorii care doresc să înțeleagă rapid implementarea completă.

**🚀 Pentru Producție**: Modulele 02, 10, 11 și 12 se concentrează în mod specific pe implementarea pregătită pentru producție, securitate și monitorizare.

**📚 Cale de Învățare Completă**: Vizitează **[/walkthrough/README.md](walkthrough/README.md)** pentru o prezentare completă a ghidului de învățare cu obiective detaliate și cerințe preliminare.

---

## Detalii Arhitecturale

### Arhitectură la Nivel Înalt

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

### Componente de Bază

#### 1. **Server MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Gestionează comunicarea HTTP/SSE
- **Înregistrare Instrumente**: Expune interogări și instrumente de schemă ale bazei de date
- **Contextul Cererii**: Gestionează identificarea utilizatorului pentru RLS
- **Gestionarea Erorilor**: Management robust al erorilor și logare

#### 2. **Stratul Bazei de Date (`sales_analysis_postgres.py`)**
- **Pooling Conexiuni**: Management eficient al conexiunilor asyncpg
- **Furnizor de Schematizare**: Descoperire dinamică a schemelor tabelului
- **Executarea Interogărilor**: Execuție SQL sigură cu RLS
- **Căutare Semantică**: Căutare de similaritate vectorială cu pgvector

#### 3. **Management Configurație (`config.py`)**
- **Variabile de Mediu**: Gestionarea centralizată a configurației
- **Parametri de Conexiune**: Configurare pentru baza de date și serviciile Azure
- **Validare**: Validarea variabilelor de mediu necesare

#### 4. **Infrastructură (`infra/`)**
- **Șabloane Bicep**: Provizionare declarativă a resurselor Azure
- **Implementare Model**: Implementare automată a modelului AI
- **Atribuiri de Roluri**: Configurare roluri de securitate

### Flux de Date

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Construirea Soluției

### Pasul 1: Configurarea Structurii Proiectului

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

### Pasul 2: Dependențe de Bază

**Cerințe Python:**
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

**Cerințe Sistem:**
- Docker Desktop pentru containerizare
- CLI Azure pentru implementare
- PostgreSQL cu extensia pgvector
- VS Code cu extensii AI

### Pasul 3: Design Schema Bazei de Date

Exemplul utilizează o bază de date retail cu aceste tabele cheie:

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

**Implementarea Securității la Nivel de Rând (RLS):**
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

## Analiza Componentelor

### Nucleul Serverului MCP (`sales_analysis.py`)

#### Model de Înregistrare Instrumente
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

**Funcționalități Cheie:**
- **Adnotări de Tip**: Descrieri ale câmpurilor Pydantic pentru înțelegerea AI
- **Extracția Contextului**: Identitatea utilizatorului din anteturile HTTP
- **Gestionarea Erorilor**: Eșecuri grațioase cu mesaje informative
- **Logare**: Logare operațională cuprinzătoare

#### Managementul Contextului Cererii
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Stratul Bazei de Date (`sales_analysis_postgres.py`)

#### Managementul Pool-ului de Conexiuni
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

**Modele de Design:**
- **Management Resurse**: Gestionarea corectă a ciclului de viață al pool-ului
- **Optimizare Performanță**: Setări PostgreSQL optimizate
- **Recuperare Erori**: Retry conexiuni și logică fallback
- **Securitate**: Setarea contextului RLS pentru fiecare conexiune

#### Introspecția Schemei
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

### Integrarea Căutării Semantice

#### Generarea Embedding-urilor
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

#### Căutare de Similaritate Vectorială
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

## Ghid de Implementare

### Implementarea Infrastructurii Azure

#### 1. **Structura Șablonului Bicep**

**Șablon Principal (`main.bicep`):**
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

#### 2. **Automatizarea Implementării**

**Implementare PowerShell (`deploy.ps1`):**
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

### Configurare Dezvoltare Locală

#### 1. **Configurație Docker Compose**
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

#### 2. **Inițializare Bază de Date**
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

## Utilizarea Soluției

### Integrare VS Code

#### 1. **Configurație MCP (`.vscode/mcp.json`)**
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

#### 2. **Exemple de Interogări**

**Descoperire Schema:**
```
AI: #zava What tables are available in the database?
```
*Serverul MCP utilizează `get_multiple_table_schemas` pentru a returna structurile tabelului*

**Analiză Vânzări:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Generează SQL cu join-uri și filtrare pe date*

**Căutare Semantică:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Utilizează embeddings pentru a găsi produse semantic similare*

**Analiză Multi-Magazin:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS asigură accesul doar la datele magazinului din Seattle*

### Modele Avansate de Interogare

#### 1. **Analiză Serii Temporale**
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

#### 2. **Performanța Produselor cu Categorii**
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

## Funcționalități Avansate

### Implementarea Securității la Nivel de Rând

#### 1. **Crearea Politicilor**
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

#### 2. **Setarea Contextului în Serverul MCP**
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

### Detalii Căutare Semantică

#### 1. **Pipeline Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optimizarea Căutării de Similaritate**
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

### Monitorizare și Observabilitate

#### 1. **Integrare Azure Application Insights**
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

#### 2. **Metrici și Logare Personalizată**
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

## Depanare

### Probleme Comune și Soluții

#### 1. **Probleme de Conexiune la Bază de Date**
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

**Soluții Comune:**
- Verifică dacă PostgreSQL rulează: `docker ps`
- Verifică parametrii de conexiune în `.env`
- Validează existența bazei de date: `docker exec -it pg17 psql -U postgres -l`
- Testează conectivitatea rețelei: `telnet localhost 5432`

#### 2. **Probleme Politici RLS**
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

#### 3. **Probleme Serviciu Embedding**
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

### Optimizare Performanță

#### 1. **Ajustarea Pool-ului de Conexiuni**
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

#### 2. **Optimizarea Interogărilor**
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

## Cele Mai Bune Practici

### Cele Mai Bune Practici de Securitate

#### 1. **Managementul Variabilelor de Mediu**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Ghiduri Implementare RLS**
- **Restricție Implicită**: Începe cu politici restrictive
- **Audit Periodic**: Monitorizează eficiența politicilor
- **Testare Riguroasă**: Validează modelele de acces
- **Documentare Politici**: Menține documentație clară

#### 3. **Securitate Rețea**
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

### Cele Mai Bune Practici de Dezvoltare

#### 1. **Modele de Gestionare a Erorilor**
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

#### 2. **Strategii de Testare**
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

#### 3. **Monitorizare și Alerte**
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

### Cele Mai Bune Practici de Implementare

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

#### 2. **Integrare Pipeline CI/CD**
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

Acest ghid cuprinzător oferă fundația pentru construirea, implementarea și operarea unui server MCP pregătit pentru producție, cu integrare PostgreSQL. Modelele și practicile demonstrate aici pot fi extinse la alte domenii și cazuri de utilizare, menținând securitatea, performanța și ușurința de întreținere.

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.