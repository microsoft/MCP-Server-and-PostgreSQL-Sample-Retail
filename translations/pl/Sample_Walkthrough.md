<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T18:09:19+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "pl"
}
-->
# Przykładowy serwer MCP i PostgreSQL - Kompletny przewodnik

## Spis treści
1. [Przegląd](../..)
2. [Szczegółowa analiza architektury](../..)
3. [Budowanie rozwiązania](../..)
4. [Rozbiór komponentów](../..)
5. [Przewodnik wdrożeniowy](../..)
6. [Korzystanie z rozwiązania](../..)
7. [Zaawansowane funkcje](../..)
8. [Rozwiązywanie problemów](../..)
9. [Najlepsze praktyki](../..)

## Przegląd

Ten przewodnik pokazuje, jak zbudować i wykorzystać gotowy do produkcji **serwer Model Context Protocol (MCP)**, który integruje się z PostgreSQL i usługami Azure AI. Przykład demonstruje wzorce na poziomie przedsiębiorstwa, takie jak bezpieczeństwo na poziomie wiersza (Row Level Security), wyszukiwanie semantyczne i dostęp do danych dla wielu najemców.

### Czego się nauczysz
- Jak zaprojektować serwer MCP z integracją bazy danych
- Implementacja bezpieczeństwa na poziomie wiersza dla scenariuszy wielonajemcowych
- Budowanie wyszukiwania semantycznego z wykorzystaniem osadzeń Azure OpenAI
- Tworzenie środowisk deweloperskich opartych na Dockerze
- Wdrażanie infrastruktury Azure za pomocą szablonów Bicep
- Integracja z VS Code dla analityki wspomaganej AI

### Wykorzystane technologie
- **Protokół MCP**: Model Context Protocol do integracji narzędzi AI
- **FastMCP**: Nowoczesny framework MCP dla Pythona
- **PostgreSQL**: Baza danych z rozszerzeniem pgvector do wyszukiwania semantycznego
- **Azure OpenAI**: Osadzenia tekstowe i opcjonalne modele GPT
- **Docker**: Konteneryzacja dla spójnych środowisk
- **Bicep**: Infrastruktura jako kod dla zasobów Azure
- **VS Code**: Środowisko deweloperskie z integracją MCP

## 📚 Strukturalny przewodnik nauki: /walkthrough

Oprócz tego technicznego przewodnika, repozytorium zawiera kompleksowy **12-modułowy przewodnik nauki** znajdujący się w katalogu `/walkthrough`. To strukturalne podejście rozkłada złożoną implementację na przystępne moduły edukacyjne, idealne dla deweloperów, którzy chcą zrozumieć każdy komponent krok po kroku.

### Przegląd modułów nauki

| Moduł | Temat | Zakres | Czas trwania |
|-------|-------|-------|--------------|
| **[00-Wprowadzenie](walkthrough/00-Introduction/README.md)** | Podstawy MCP | Kluczowe koncepcje, studium przypadku Zava Retail, przegląd architektury | 30 min |
| **[01-Architektura](walkthrough/01-Architecture/README.md)** | Projekt systemu | Architektura techniczna, wzorce projektowe, relacje komponentów | 45 min |
| **[02-Bezpieczeństwo](walkthrough/02-Security/README.md)** | Bezpieczeństwo przedsiębiorstwa | Uwierzytelnianie Azure, bezpieczeństwo na poziomie wiersza, izolacja wielonajemcowa | 60 min |
| **[03-Konfiguracja](walkthrough/03-Setup/README.md)** | Konfiguracja środowiska | Konfiguracja Dockera, Azure CLI, inicjalizacja projektu | 45 min |
| **[04-Baza danych](walkthrough/04-Database/README.md)** | Warstwa danych | Schemat PostgreSQL, konfiguracja pgvector, polityki RLS, dane przykładowe | 60 min |
| **[05-Serwer MCP](walkthrough/05-MCP-Server/README.md)** | Implementacja rdzenia | Framework FastMCP, integracja bazy danych, rozwój narzędzi | 90 min |
| **[06-Narzędzia](walkthrough/06-Tools/README.md)** | Tworzenie narzędzi | Tworzenie narzędzi MCP, walidacja zapytań, inteligencja biznesowa | 75 min |
| **[07-Wyszukiwanie semantyczne](walkthrough/07-Semantic-Search/README.md)** | Integracja AI | Osadzenia Azure OpenAI, wyszukiwanie wektorowe, zapytania hybrydowe | 60 min |
| **[08-Testowanie](walkthrough/08-Testing/README.md)** | Zapewnienie jakości | Strategie testowania, techniki debugowania, testy wydajnościowe | 75 min |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Doświadczenie deweloperskie | Konfiguracja VS Code, integracja AI Chat, przepływy debugowania | 45 min |
| **[10-Wdrożenie](walkthrough/10-Deployment/README.md)** | Wdrożenie produkcyjne | Konteneryzacja, Azure Container Apps, pipeline'y CI/CD | 90 min |
| **[11-Monitorowanie](walkthrough/11-Monitoring/README.md)** | Obserwowalność | Application Insights, strukturalne logowanie, metryki wydajności | 60 min |
| **[12-Najlepsze praktyki](walkthrough/12-Best-Practices/README.md)** | Doskonałość produkcyjna | Wzmacnianie bezpieczeństwa, optymalizacja, wzorce przedsiębiorstwa | 45 min |

### Jak korzystać z przewodnika nauki

**📖 Dla nauki**: Moduły `/walkthrough` oferują instrukcje krok po kroku z wyjaśnieniami, dlaczego każdy komponent został zaprojektowany w określony sposób. Zacznij od modułu 00 i przechodź kolejno.

**🔧 Dla implementacji**: Ten plik Sample_Walkthrough.md dostarcza szczegółową analizę techniczną i rozbiór kodu dla deweloperów, którzy chcą szybko zrozumieć pełną implementację.

**🚀 Dla produkcji**: Moduły 02, 10, 11 i 12 koncentrują się szczególnie na wdrożeniu produkcyjnym, bezpieczeństwie i monitorowaniu.

**📚 Kompletny ścieżka nauki**: Odwiedź **[/walkthrough/README.md](walkthrough/README.md)**, aby uzyskać pełny przegląd przewodnika nauki z szczegółowymi celami edukacyjnymi i wymaganiami wstępnymi.

---

## Szczegółowa analiza architektury

### Architektura na wysokim poziomie

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

### Kluczowe komponenty

#### 1. **Serwer MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Obsługuje komunikację HTTP/SSE
- **Rejestracja narzędzi**: Udostępnia narzędzia zapytań i schematów bazy danych
- **Kontekst żądań**: Zarządza identyfikacją użytkownika dla RLS
- **Obsługa błędów**: Solidne zarządzanie błędami i logowanie

#### 2. **Warstwa bazy danych (`sales_analysis_postgres.py`)**
- **Pula połączeń**: Efektywne zarządzanie połączeniami asyncpg
- **Dostawca schematów**: Dynamiczne odkrywanie schematów tabel
- **Wykonywanie zapytań**: Bezpieczne wykonywanie SQL z RLS
- **Wyszukiwanie semantyczne**: Wyszukiwanie podobieństwa wektorowego z pgvector

#### 3. **Zarządzanie konfiguracją (`config.py`)**
- **Zmienne środowiskowe**: Centralne zarządzanie konfiguracją
- **Parametry połączenia**: Konfiguracja bazy danych i usług Azure
- **Walidacja**: Walidacja wymaganych zmiennych środowiskowych

#### 4. **Infrastruktura (`infra/`)**
- **Szablony Bicep**: Deklaratywne wdrażanie zasobów Azure
- **Wdrożenie modelu**: Automatyczne wdrażanie modeli AI
- **Przypisania ról**: Konfiguracja ról bezpieczeństwa

### Przepływ danych

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Budowanie rozwiązania

### Krok 1: Konfiguracja struktury projektu

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

### Krok 2: Kluczowe zależności

**Wymagania dla Pythona:**
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

**Wymagania systemowe:**
- Docker Desktop do konteneryzacji
- Azure CLI do wdrożenia
- PostgreSQL z rozszerzeniem pgvector
- VS Code z rozszerzeniami AI

### Krok 3: Projektowanie schematu bazy danych

Przykład wykorzystuje bazę danych detaliczną z następującymi kluczowymi tabelami:

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

**Implementacja bezpieczeństwa na poziomie wiersza (RLS):**
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

## Rozbiór komponentów

### Rdzeń serwera MCP (`sales_analysis.py`)

#### Wzorzec rejestracji narzędzi
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

**Kluczowe funkcje:**
- **Adnotacje typów**: Opisy pól Pydantic dla zrozumienia przez AI
- **Ekstrakcja kontekstu**: Tożsamość użytkownika z nagłówków HTTP
- **Obsługa błędów**: Łagodne awarie z informacyjnymi komunikatami
- **Logowanie**: Kompleksowe logowanie operacji

#### Zarządzanie kontekstem żądań
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Warstwa bazy danych (`sales_analysis_postgres.py`)

#### Zarządzanie pulą połączeń
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

**Wzorce projektowe:**
- **Zarządzanie zasobami**: Prawidłowe zarządzanie cyklem życia puli
- **Optymalizacja wydajności**: Ustawienia PostgreSQL zoptymalizowane
- **Odzyskiwanie błędów**: Ponowne próby połączenia i logika awaryjna
- **Bezpieczeństwo**: Ustawianie kontekstu RLS dla każdego połączenia

#### Introspekcja schematu
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

### Integracja wyszukiwania semantycznego

#### Generowanie osadzeń
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

#### Wyszukiwanie podobieństwa wektorowego
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

## Przewodnik wdrożeniowy

### Wdrażanie infrastruktury Azure

#### 1. **Struktura szablonu Bicep**

**Główny szablon (`main.bicep`):**
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

#### 2. **Automatyzacja wdrożenia**

**Wdrożenie PowerShell (`deploy.ps1`):**
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

### Konfiguracja lokalnego środowiska deweloperskiego

#### 1. **Konfiguracja Docker Compose**
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

#### 2. **Inicjalizacja bazy danych**
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

## Korzystanie z rozwiązania

### Integracja z VS Code

#### 1. **Konfiguracja MCP (`.vscode/mcp.json`)**
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

#### 2. **Przykłady zapytań**

**Odkrywanie schematu:**
```
AI: #zava What tables are available in the database?
```
*Serwer MCP używa `get_multiple_table_schemas`, aby zwrócić struktury tabel*

**Analiza sprzedaży:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Generuje SQL z odpowiednimi połączeniami i filtrowaniem dat*

**Wyszukiwanie semantyczne:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Używa osadzeń do znajdowania semantycznie podobnych produktów*

**Analiza wielu sklepów:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS zapewnia dostęp tylko do danych sklepu w Seattle*

### Zaawansowane wzorce zapytań

#### 1. **Analiza szeregów czasowych**
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

#### 2. **Wydajność produktów z kategoriami**
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

## Zaawansowane funkcje

### Implementacja bezpieczeństwa na poziomie wiersza

#### 1. **Tworzenie polityki**
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

#### 2. **Ustawianie kontekstu w serwerze MCP**
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

### Szczegółowe wyszukiwanie semantyczne

#### 1. **Pipeline osadzeń**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optymalizacja wyszukiwania podobieństwa**
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

### Monitorowanie i obserwowalność

#### 1. **Integracja Azure Application Insights**
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

#### 2. **Niestandardowe metryki i logowanie**
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

## Rozwiązywanie problemów

### Typowe problemy i rozwiązania

#### 1. **Problemy z połączeniem z bazą danych**
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

**Typowe rozwiązania:**
- Sprawdź, czy PostgreSQL działa: `docker ps`
- Zweryfikuj parametry połączenia w `.env`
- Upewnij się, że baza danych istnieje: `docker exec -it pg17 psql -U postgres -l`
- Przetestuj łączność sieciową: `telnet localhost 5432`

#### 2. **Problemy z polityką RLS**
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

#### 3. **Problemy z usługą osadzeń**
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

### Optymalizacja wydajności

#### 1. **Dostrajanie puli połączeń**
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

#### 2. **Optymalizacja zapytań**
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

## Najlepsze praktyki

### Najlepsze praktyki bezpieczeństwa

#### 1. **Zarządzanie zmiennymi środowiskowymi**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Wytyczne dotyczące implementacji RLS**
- **Domyślne odrzucenie**: Zacznij od restrykcyjnych polityk
- **Regularny audyt**: Monitoruj skuteczność polityk
- **Dokładne testowanie**: Waliduj wzorce dostępu
- **Dokumentacja polityk**: Utrzymuj jasną dokumentację

#### 3. **Bezpieczeństwo sieci**
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

### Najlepsze praktyki deweloperskie

#### 1. **Wzorce obsługi błędów**
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

#### 2. **Strategie testowania**
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

#### 3. **Monitorowanie i alerty**
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

### Najlepsze praktyki wdrożeniowe

#### 1. **Infrastruktura jako kod**
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

#### 2. **Integracja pipeline'ów CI/CD**
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

Ten kompleksowy przewodnik dostarcza podstaw do budowy, wdrożenia i obsługi gotowego do produkcji serwera MCP z integracją PostgreSQL. Wzorce i praktyki przedstawione tutaj mogą być rozszerzone na inne domeny i przypadki użycia, zachowując bezpieczeństwo, wydajność i łatwość utrzymania.

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.