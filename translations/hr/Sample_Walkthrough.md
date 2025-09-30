<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:04:15+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "hr"
}
-->
# MCP Server i PostgreSQL Primjer - Kompletan Vodič

## Sadržaj
1. [Pregled](../..)
2. [Detaljna Arhitektura](../..)
3. [Izrada Rješenja](../..)
4. [Razrada Komponenti](../..)
5. [Vodič za Implementaciju](../..)
6. [Korištenje Rješenja](../..)
7. [Napredne Značajke](../..)
8. [Rješavanje Problema](../..)
9. [Najbolje Prakse](../..)

## Pregled

Ovaj vodič razlaže kako izgraditi i koristiti produkcijski **Model Context Protocol (MCP) server** koji se integrira s PostgreSQL-om i Azure AI uslugama. Primjer demonstrira obrasce na razini poduzeća, uključujući sigurnost na razini redaka, semantičko pretraživanje i pristup podacima za više korisnika.

### Što ćete naučiti
- Kako arhitektirati MCP server s integracijom baze podataka
- Implementacija sigurnosti na razini redaka za scenarije s više korisnika
- Izrada semantičkog pretraživanja pomoću Azure OpenAI ugrađivanja
- Kreiranje razvojnih okruženja temeljenih na Dockeru
- Implementacija Azure infrastrukture pomoću Bicep predložaka
- Integracija s VS Code za analitiku temeljenu na AI-u

### Korištene Tehnologije
- **MCP Protocol**: Protokol za integraciju AI alata
- **FastMCP**: Moderni Python MCP okvir za servere
- **PostgreSQL**: Baza podataka s pgvector ekstenzijom za semantičko pretraživanje
- **Azure OpenAI**: Tekstualna ugrađivanja i opcionalni GPT modeli
- **Docker**: Kontejnerizacija za dosljedna okruženja
- **Bicep**: Infrastruktura kao kod za Azure resurse
- **VS Code**: Razvojno okruženje s MCP integracijom

## 📚 Strukturirani Vodič za Učenje: /walkthrough

Uz ovaj tehnički vodič, repozitorij uključuje sveobuhvatan **vodič za učenje u 12 modula** koji se nalazi u direktoriju `/walkthrough`. Ovaj strukturirani pristup razlaže složenu implementaciju u lako razumljive module, savršene za programere koji žele razumjeti svaku komponentu korak po korak.

### Pregled Modula za Učenje

| Modul | Tema | Fokus | Trajanje |
|-------|------|-------|----------|
| **[00-Uvod](walkthrough/00-Introduction/README.md)** | Osnove MCP-a | Ključni koncepti, studija slučaja Zava Retail, pregled arhitekture | 30 min |
| **[01-Arhitektura](walkthrough/01-Architecture/README.md)** | Dizajn Sustava | Tehnička arhitektura, obrasci dizajna, odnosi komponenti | 45 min |
| **[02-Sigurnost](walkthrough/02-Security/README.md)** | Sigurnost na razini poduzeća | Azure autentifikacija, sigurnost na razini redaka, izolacija za više korisnika | 60 min |
| **[03-Postavljanje](walkthrough/03-Setup/README.md)** | Postavljanje Okruženja | Konfiguracija Dockera, Azure CLI, inicijalizacija projekta | 45 min |
| **[04-Baza Podataka](walkthrough/04-Database/README.md)** | Podatkovni Sloj | PostgreSQL shema, postavljanje pgvectora, RLS politike, uzorci podataka | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Osnovna Implementacija | FastMCP okvir, integracija baze podataka, razvoj alata | 90 min |
| **[06-Alati](walkthrough/06-Tools/README.md)** | Razvoj Alata | Kreiranje MCP alata, validacija upita, poslovna inteligencija | 75 min |
| **[07-Semantičko Pretraživanje](walkthrough/07-Semantic-Search/README.md)** | AI Integracija | Azure OpenAI ugrađivanja, pretraživanje vektora, hibridni upiti | 60 min |
| **[08-Testiranje](walkthrough/08-Testing/README.md)** | Osiguranje Kvalitete | Strategije testiranja, tehnike otklanjanja grešaka, testiranje performansi | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Razvojno Iskustvo | Konfiguracija VS Code-a, AI Chat integracija, tijekovi otklanjanja grešaka | 45 min |
| **[10-Implementacija](walkthrough/10-Deployment/README.md)** | Produkcijska Implementacija | Kontejnerizacija, Azure Container Apps, CI/CD cjevovodi | 90 min |
| **[11-Nadzor](walkthrough/11-Monitoring/README.md)** | Promatranje Sustava | Application Insights, strukturirano logiranje, metričke performanse | 60 min |
| **[12-Najbolje Prakse](walkthrough/12-Best-Practices/README.md)** | Izvrsnost u Produkciji | Pojačanje sigurnosti, optimizacija, obrasci za poduzeća | 45 min |

### Kako Koristiti Vodič za Učenje

**📖 Za Učenje**: Moduli `/walkthrough` pružaju korak-po-korak upute s objašnjenjima zašto je svaka komponenta dizajnirana na određeni način. Započnite s Modulom 00 i napredujte redoslijedom.

**🔧 Za Implementaciju**: Ovaj Sample_Walkthrough.md pruža tehnički detaljan pregled i razradu koda za programere koji žele brzo razumjeti kompletnu implementaciju.

**🚀 Za Produkciju**: Moduli 02, 10, 11 i 12 posebno se fokusiraju na produkcijsku implementaciju, sigurnost i razmatranja nadzora.

**📚 Kompletan Put Učenja**: Posjetite **[/walkthrough/README.md](walkthrough/README.md)** za potpuni pregled vodiča za učenje s detaljnim ciljevima i preduvjetima.

---

## Detaljna Arhitektura

### Arhitektura na Visokoj Razini

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

### Ključne Komponente

#### 1. **MCP Server (`sales_analysis.py`)**
- **FastMCP Okvir**: Upravljanje HTTP/SSE komunikacijom
- **Registracija Alata**: Izlaganje alata za upite i sheme baze podataka
- **Kontekst Zahtjeva**: Upravljanje identifikacijom korisnika za RLS
- **Upravljanje Pogreškama**: Robusno upravljanje greškama i logiranje

#### 2. **Podatkovni Sloj (`sales_analysis_postgres.py`)**
- **Upravljanje Povezivanjem**: Učinkovito upravljanje asyncpg vezama
- **Pružatelj Sheme**: Dinamičko otkrivanje sheme tablica
- **Izvršavanje Upita**: Sigurno izvršavanje SQL-a s RLS-om
- **Semantičko Pretraživanje**: Pretraživanje sličnosti vektora pomoću pgvectora

#### 3. **Upravljanje Konfiguracijom (`config.py`)**
- **Varijable Okruženja**: Centralizirano upravljanje konfiguracijom
- **Parametri Povezivanja**: Konfiguracija baze podataka i Azure usluga
- **Validacija**: Validacija potrebnih varijabli okruženja

#### 4. **Infrastruktura (`infra/`)**
- **Bicep Predlošci**: Deklarativno postavljanje Azure resursa
- **Implementacija Modela**: Automatizirana implementacija AI modela
- **Dodjela Uloga**: Konfiguracija sigurnosnih uloga

### Tijek Podataka

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Izrada Rješenja

### Korak 1: Postavljanje Strukture Projekta

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

### Korak 2: Osnovne Ovisnosti

**Python Zahtjevi:**
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

**Sistemski Zahtjevi:**
- Docker Desktop za kontejnerizaciju
- Azure CLI za implementaciju
- PostgreSQL s pgvector ekstenzijom
- VS Code s AI ekstenzijama

### Korak 3: Dizajn Sheme Baze Podataka

Primjer koristi maloprodajnu bazu podataka s ovim ključnim tablicama:

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

**Implementacija Sigurnosti na Razini Redaka (RLS):**
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

## Razrada Komponenti

### MCP Server Jezgra (`sales_analysis.py`)

#### Obrazac Registracije Alata
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

**Ključne Značajke:**
- **Tipne Anotacije**: Pydantic opisi polja za AI razumijevanje
- **Ekstrakcija Konteksta**: Identitet korisnika iz HTTP zaglavlja
- **Upravljanje Pogreškama**: Graciozno rukovanje greškama s informativnim porukama
- **Logiranje**: Sveobuhvatno logiranje operacija

#### Upravljanje Kontekstom Zahtjeva
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Podatkovni Sloj (`sales_analysis_postgres.py`)

#### Upravljanje Bazenom Povezivanja
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

**Obrasci Dizajna:**
- **Upravljanje Resursima**: Pravilno upravljanje životnim ciklusom bazena
- **Podešavanje Performansi**: Optimizirane postavke PostgreSQL-a
- **Oporavak od Grešaka**: Ponovno povezivanje i logika povratka
- **Sigurnost**: Postavljanje RLS konteksta po vezi

#### Introspekcija Sheme
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

### Integracija Semantičkog Pretraživanja

#### Generiranje Ugrađivanja
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

#### Pretraživanje Sličnosti Vektora
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

## Vodič za Implementaciju

### Implementacija Azure Infrastrukture

#### 1. **Struktura Bicep Predloška**

**Glavni Predložak (`main.bicep`):**
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

#### 2. **Automatizacija Implementacije**

**PowerShell Implementacija (`deploy.ps1`):**
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

### Postavljanje Lokalnog Razvojnog Okruženja

#### 1. **Konfiguracija Docker Compose-a**
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

#### 2. **Inicijalizacija Baze Podataka**
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

## Korištenje Rješenja

### Integracija s VS Code-om

#### 1. **MCP Konfiguracija (`.vscode/mcp.json`)**
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

#### 2. **Primjeri Upita**

**Otkrivanje Sheme:**
```
AI: #zava What tables are available in the database?
```
*MCP server koristi `get_multiple_table_schemas` za vraćanje struktura tablica*

**Analiza Prodaje:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Generira SQL s pravilnim spajanjima i filtriranjem datuma*

**Semantičko Pretraživanje:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Koristi ugrađivanja za pronalaženje semantički sličnih proizvoda*

**Analiza Više Prodavaonica:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS osigurava pristup samo podacima prodavaonice u Seattleu*

### Obrasci Naprednih Upita

#### 1. **Analiza Vremenskih Serija**
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

#### 2. **Performanse Proizvoda po Kategorijama**
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

## Napredne Značajke

### Implementacija Sigurnosti na Razini Redaka

#### 1. **Kreiranje Politike**
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

#### 2. **Postavljanje Konteksta u MCP Serveru**
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

### Detaljna Analiza Semantičkog Pretraživanja

#### 1. **Cjevovod Ugrađivanja**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optimizacija Pretraživanja Sličnosti**
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

### Nadzor i Promatranje

#### 1. **Integracija Azure Application Insights-a**
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

#### 2. **Prilagođene Metričke i Logiranje**
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

## Rješavanje Problema

### Uobičajeni Problemi i Rješenja

#### 1. **Problemi s Povezivanjem Baze Podataka**
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

**Uobičajena Rješenja:**
- Provjerite radi li PostgreSQL: `docker ps`
- Provjerite parametre povezivanja u `.env`
- Validirajte postojanje baze podataka: `docker exec -it pg17 psql -U postgres -l`
- Testirajte mrežnu povezanost: `telnet localhost 5432`

#### 2. **Problemi s RLS Politikom**
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

#### 3. **Problemi s Uslugom Ugrađivanja**
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

### Optimizacija Performansi

#### 1. **Podešavanje Bazena Povezivanja**
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

#### 2. **Optimizacija Upita**
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

## Najbolje Prakse

### Najbolje Prakse Sigurnosti

#### 1. **Upravljanje Varijablama Okruženja**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Smjernice za Implementaciju RLS-a**
- **Zadano Odbijanje**: Započnite s restriktivnim politikama
- **Redoviti Audit**: Pratite učinkovitost politika
- **Temeljito Testiranje**: Validirajte obrasce pristupa
- **Dokumentirajte Politike**: Održavajte jasnu dokumentaciju

#### 3. **Mrežna Sigurnost**
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

### Najbolje Prakse Razvoja

#### 1. **Obrasci Upravljanja Pogreškama**
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

#### 2. **Strategije Testiranja**
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

#### 3. **Nadzor i Upozorenja**
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

### Najbolje Prakse Implementacije

#### 1. **Infrastruktura kao Kod**
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

#### 2. **Integracija CI/CD Cjevovoda**
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

Ovaj sveobuhvatan vodič pruža temelj za izgradnju, implementaciju i upravljanje produkcijskim MCP serverom s integracijom PostgreSQL-a. Obrasci i prakse prikazani ovdje mogu se proširiti na druge domene i slučajeve korištenja uz održavanje sigurnosti, performansi i održivosti.

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.