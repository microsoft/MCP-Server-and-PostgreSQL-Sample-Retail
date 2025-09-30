<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T20:36:36+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "it"
}
-->
# MCP Server e PostgreSQL Sample - Guida Completa

## Indice
1. [Panoramica](../..)
2. [Approfondimento sull'Architettura](../..)
3. [Costruire la Soluzione](../..)
4. [Analisi dei Componenti](../..)
5. [Guida al Deployment](../..)
6. [Utilizzo della Soluzione](../..)
7. [Funzionalità Avanzate](../..)
8. [Risoluzione dei Problemi](../..)
9. [Best Practices](../..)

## Panoramica

Questa guida illustra come costruire e utilizzare un **server Model Context Protocol (MCP)** pronto per la produzione, integrato con PostgreSQL e i servizi Azure AI. Il progetto dimostra modelli di livello enterprise, tra cui la sicurezza a livello di riga (Row Level Security), la ricerca semantica e l'accesso ai dati multi-tenant.

### Cosa Imparerai
- Come progettare un server MCP con integrazione al database
- Implementare la sicurezza a livello di riga per scenari multi-tenant
- Costruire una ricerca semantica con gli embedding di Azure OpenAI
- Creare ambienti di sviluppo basati su Docker
- Effettuare il deployment dell'infrastruttura Azure con template Bicep
- Integrare VS Code per analisi AI avanzate

### Tecnologie Utilizzate
- **Protocollo MCP**: Protocollo Model Context per l'integrazione di strumenti AI
- **FastMCP**: Framework moderno Python per server MCP
- **PostgreSQL**: Database con estensione pgvector per la ricerca semantica
- **Azure OpenAI**: Embedding testuali e modelli GPT opzionali
- **Docker**: Containerizzazione per ambienti consistenti
- **Bicep**: Infrastructure as Code per risorse Azure
- **VS Code**: Ambiente di sviluppo con integrazione MCP

## 📚 Guida di Apprendimento Strutturata: /walkthrough

Oltre a questa guida tecnica, il repository include un **percorso di apprendimento in 12 moduli** situato nella directory `/walkthrough`. Questo approccio strutturato suddivide l'implementazione complessa in moduli di apprendimento facilmente comprensibili, ideale per sviluppatori che vogliono approfondire ogni componente passo dopo passo.

### Panoramica dei Moduli di Apprendimento

| Modulo | Argomento | Focus | Durata |
|--------|-----------|-------|--------|
| **[00-Introduzione](walkthrough/00-Introduction/README.md)** | Fondamenti MCP | Concetti principali, caso studio Zava Retail, panoramica architetturale | 30 min |
| **[01-Architettura](walkthrough/01-Architecture/README.md)** | Progettazione del Sistema | Architettura tecnica, modelli di progettazione, relazioni tra componenti | 45 min |
| **[02-Sicurezza](walkthrough/02-Security/README.md)** | Sicurezza Enterprise | Autenticazione Azure, sicurezza a livello di riga, isolamento multi-tenant | 60 min |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Configurazione Ambiente | Configurazione Docker, CLI Azure, inizializzazione progetto | 45 min |
| **[04-Database](walkthrough/04-Database/README.md)** | Livello Dati | Schema PostgreSQL, configurazione pgvector, politiche RLS, dati di esempio | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Implementazione Core | Framework FastMCP, integrazione database, sviluppo strumenti | 90 min |
| **[06-Strumenti](walkthrough/06-Tools/README.md)** | Sviluppo Strumenti | Creazione strumenti MCP, validazione query, business intelligence | 75 min |
| **[07-Ricerca-Semantica](walkthrough/07-Semantic-Search/README.md)** | Integrazione AI | Embedding Azure OpenAI, ricerca vettoriale, query ibride | 60 min |
| **[08-Test](walkthrough/08-Testing/README.md)** | Assicurazione Qualità | Strategie di test, tecniche di debug, test di performance | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Esperienza di Sviluppo | Configurazione VS Code, integrazione AI Chat, flussi di debug | 45 min |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Deployment in Produzione | Containerizzazione, Azure Container Apps, pipeline CI/CD | 90 min |
| **[11-Monitoraggio](walkthrough/11-Monitoring/README.md)** | Osservabilità | Application Insights, logging strutturato, metriche di performance | 60 min |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Eccellenza in Produzione | Rafforzamento della sicurezza, ottimizzazione, modelli enterprise | 45 min |

### Come Utilizzare la Guida di Apprendimento

**📖 Per Apprendere**: I moduli `/walkthrough` forniscono istruzioni passo dopo passo con spiegazioni sul perché ogni componente è progettato in un certo modo. Inizia con il Modulo 00 e procedi in ordine.

**🔧 Per Implementare**: Questo Sample_Walkthrough.md offre un approfondimento tecnico e una suddivisione del codice per sviluppatori che vogliono comprendere rapidamente l'implementazione completa.

**🚀 Per la Produzione**: I moduli 02, 10, 11 e 12 si concentrano specificamente su deployment pronto per la produzione, sicurezza e considerazioni di monitoraggio.

**📚 Percorso di Apprendimento Completo**: Visita **[/walkthrough/README.md](walkthrough/README.md)** per la panoramica completa della guida di apprendimento con obiettivi e prerequisiti dettagliati.

---

## Approfondimento sull'Architettura

### Architettura ad Alto Livello

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

### Componenti Principali

#### 1. **Server MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Gestisce la comunicazione HTTP/SSE
- **Registrazione Strumenti**: Espone strumenti di query e schema del database
- **Contesto Richieste**: Gestisce l'identificazione utente per RLS
- **Gestione Errori**: Gestione robusta degli errori e logging

#### 2. **Livello Database (`sales_analysis_postgres.py`)**
- **Pooling Connessioni**: Gestione efficiente delle connessioni asyncpg
- **Provider Schema**: Scoperta dinamica dello schema delle tabelle
- **Esecuzione Query**: Esecuzione SQL sicura con RLS
- **Ricerca Semantica**: Ricerca di similarità vettoriale con pgvector

#### 3. **Gestione Configurazione (`config.py`)**
- **Variabili Ambiente**: Gestione centralizzata della configurazione
- **Parametri Connessione**: Configurazione database e servizi Azure
- **Validazione**: Validazione delle variabili ambiente richieste

#### 4. **Infrastruttura (`infra/`)**
- **Template Bicep**: Provisioning dichiarativo delle risorse Azure
- **Deployment Modelli**: Deployment automatizzato dei modelli AI
- **Assegnazioni Ruoli**: Configurazione dei ruoli di sicurezza

### Flusso dei Dati

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Costruire la Soluzione

### Passo 1: Configurazione della Struttura del Progetto

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

### Passo 2: Dipendenze Core

**Requisiti Python:**
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

**Requisiti di Sistema:**
- Docker Desktop per la containerizzazione
- CLI Azure per il deployment
- PostgreSQL con estensione pgvector
- VS Code con estensioni AI

### Passo 3: Progettazione dello Schema del Database

Il progetto utilizza un database retail con queste tabelle principali:

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

**Implementazione della Sicurezza a Livello di Riga (RLS):**
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

## Analisi dei Componenti

### Core del Server MCP (`sales_analysis.py`)

#### Pattern di Registrazione Strumenti
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

**Caratteristiche Principali:**
- **Annotazioni di Tipo**: Descrizioni dei campi Pydantic per la comprensione AI
- **Estrazione Contesto**: Identità utente dagli header HTTP
- **Gestione Errori**: Fallimento gestito con messaggi informativi
- **Logging**: Logging completo delle operazioni

#### Gestione del Contesto Richieste
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Livello Database (`sales_analysis_postgres.py`)

#### Gestione del Pool di Connessioni
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

**Modelli di Progettazione:**
- **Gestione Risorse**: Gestione corretta del ciclo di vita del pool
- **Ottimizzazione Performance**: Impostazioni PostgreSQL ottimizzate
- **Recupero Errori**: Retry delle connessioni e logica di fallback
- **Sicurezza**: Impostazione del contesto RLS per connessione

#### Introspezione dello Schema
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

### Integrazione della Ricerca Semantica

#### Generazione di Embedding
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

#### Ricerca di Similarità Vettoriale
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

## Guida al Deployment

### Deployment dell'Infrastruttura Azure

#### 1. **Struttura del Template Bicep**

**Template Principale (`main.bicep`):**
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

#### 2. **Automazione del Deployment**

**Deployment PowerShell (`deploy.ps1`):**
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

### Configurazione dello Sviluppo Locale

#### 1. **Configurazione Docker Compose**
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

#### 2. **Inizializzazione del Database**
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

## Utilizzo della Soluzione

### Integrazione con VS Code

#### 1. **Configurazione MCP (`.vscode/mcp.json`)**
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

#### 2. **Esempi di Query**

**Scoperta Schema:**
```
AI: #zava What tables are available in the database?
```
*Il server MCP utilizza `get_multiple_table_schemas` per restituire le strutture delle tabelle*

**Analisi Vendite:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Genera SQL con join appropriati e filtraggio per data*

**Ricerca Semantica:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Utilizza embedding per trovare prodotti semanticamente simili*

**Analisi Multi-Negozio:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS garantisce l'accesso solo ai dati del negozio di Seattle*

### Pattern di Query Avanzate

#### 1. **Analisi Serie Temporali**
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

#### 2. **Performance Prodotti con Categorie**
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

## Funzionalità Avanzate

### Implementazione della Sicurezza a Livello di Riga

#### 1. **Creazione delle Politiche**
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

#### 2. **Impostazione del Contesto nel Server MCP**
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

### Approfondimento sulla Ricerca Semantica

#### 1. **Pipeline di Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Ottimizzazione della Ricerca di Similarità**
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

### Monitoraggio e Osservabilità

#### 1. **Integrazione con Azure Application Insights**
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

#### 2. **Metriche e Logging Personalizzati**
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

## Risoluzione dei Problemi

### Problemi Comuni e Soluzioni

#### 1. **Problemi di Connessione al Database**
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

**Soluzioni Comuni:**
- Verifica che PostgreSQL sia in esecuzione: `docker ps`
- Controlla i parametri di connessione in `.env`
- Valida che il database esista: `docker exec -it pg17 psql -U postgres -l`
- Testa la connettività di rete: `telnet localhost 5432`

#### 2. **Problemi con le Politiche RLS**
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

#### 3. **Problemi con il Servizio di Embedding**
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

### Ottimizzazione delle Performance

#### 1. **Ottimizzazione del Pool di Connessioni**
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

#### 2. **Ottimizzazione delle Query**
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

### Best Practices di Sicurezza

#### 1. **Gestione delle Variabili Ambiente**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Linee Guida per l'Implementazione RLS**
- **Default Deny**: Inizia con politiche restrittive
- **Audit Regolare**: Monitora l'efficacia delle politiche
- **Test Approfonditi**: Valida i pattern di accesso
- **Documenta le Politiche**: Mantieni una documentazione chiara

#### 3. **Sicurezza di Rete**
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

### Best Practices di Sviluppo

#### 1. **Pattern di Gestione Errori**
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

#### 2. **Strategie di Test**
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

#### 3. **Monitoraggio e Avvisi**
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

### Best Practices di Deployment

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

#### 2. **Integrazione Pipeline CI/CD**
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

Questa guida completa fornisce le basi per costruire, effettuare il deployment e gestire un server MCP pronto per la produzione con integrazione PostgreSQL. I modelli e le pratiche dimostrati qui possono essere estesi ad altri domini e casi d'uso, mantenendo sicurezza, performance e manutenibilità.

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.