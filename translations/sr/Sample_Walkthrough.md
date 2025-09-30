<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:03:27+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "sr"
}
-->
# MCP сервер и PostgreSQL пример - комплетан водич

## Садржај
1. [Преглед](../..)
2. [Детаљна архитектура](../..)
3. [Изградња решења](../..)
4. [Разрада компоненти](../..)
5. [Водич за имплементацију](../..)
6. [Коришћење решења](../..)
7. [Напредне функције](../..)
8. [Решавање проблема](../..)
9. [Најбоље праксе](../..)

## Преглед

Овај водич објашњава како изградити и користити продукционо спреман **Model Context Protocol (MCP) сервер** који се интегрише са PostgreSQL и Azure AI услугама. Пример демонстрира шаблоне на нивоу предузећа, укључујући безбедност на нивоу реда, семантичко претраживање и приступ подацима за више клијената.

### Шта ћете научити
- Како архитектурно осмислити MCP сервер са интеграцијом базе података
- Имплементацију безбедности на нивоу реда за сценарије са више клијената
- Изградњу семантичког претраживања помоћу Azure OpenAI ембединга
- Креирање развојних окружења заснованих на Docker-у
- Имплементацију Azure инфраструктуре помоћу Bicep шаблона
- Интеграцију са VS Code за аналитике засноване на AI

### Коришћене технологије
- **MCP Protocol**: Протокол за интеграцију AI алата
- **FastMCP**: Модеран Python MCP серверски оквир
- **PostgreSQL**: База података са pgvector екстензијом за семантичко претраживање
- **Azure OpenAI**: Текстуални ембединг и опциони GPT модели
- **Docker**: Контенеризација за конзистентна окружења
- **Bicep**: Инфраструктура као код за Azure ресурсе
- **VS Code**: Развојно окружење са MCP интеграцијом

## 📚 Структурисани водич за учење: /walkthrough

Поред овог техничког водича, овај репозиторијум укључује свеобухватан **водич за учење у 12 модула** који се налази у директоријуму `/walkthrough`. Овај структурисани приступ разлаже сложену имплементацију у лако разумљиве модуле, идеалан за програмере који желе да разумеју сваку компоненту корак по корак.

### Преглед модула за учење

| Модул | Тема | Фокус | Трајање |
|-------|------|-------|---------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Основе MCP | Основни концепти, студија случаја Zava Retail, преглед архитектуре | 30 мин |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Дизајн система | Техничка архитектура, шаблони дизајна, односи компоненти | 45 мин |
| **[02-Security](walkthrough/02-Security/README.md)** | Безбедност на нивоу предузећа | Azure аутентификација, безбедност на нивоу реда, изолација за више клијената | 60 мин |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Постављање окружења | Docker конфигурација, Azure CLI, иницијализација пројекта | 45 мин |
| **[04-Database](walkthrough/04-Database/README.md)** | Слој података | PostgreSQL шема, подешавање pgvector-а, RLS политике, пример података | 60 мин |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Основна имплементација | FastMCP оквир, интеграција базе података, развој алата | 90 мин |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Развој алата | Креирање MCP алата, валидација упита, пословна интелигенција | 75 мин |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI интеграција | Azure OpenAI ембединг, претраживање вектора, хибридни упити | 60 мин |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Осигурање квалитета | Стратегије тестирања, технике дебаговања, тестирање перформанси | 75 мин |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Развојно искуство | VS Code конфигурација, AI Chat интеграција, дебаговање | 45 мин |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Имплементација у продукцију | Контенеризација, Azure Container Apps, CI/CD процеси | 90 мин |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Опсервабилност | Application Insights, структурисано логовање, метрике перформанси | 60 мин |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Изврсност у продукцији | Јачање безбедности, оптимизација, шаблони за предузећа | 45 мин |

### Како користити водич за учење

**📖 За учење**: Модули `/walkthrough` пружају корак по корак упутства са објашњењима зашто је свака компонента дизајнирана на одређени начин. Почните са Модулом 00 и напредујте редом.

**🔧 За имплементацију**: Овај Sample_Walkthrough.md пружа технички детаљан преглед и разраду кода за програмере који желе брзо да разумеју комплетну имплементацију.

**🚀 За продукцију**: Модули 02, 10, 11 и 12 се посебно фокусирају на имплементацију у продукцију, безбедност и разматрања мониторинга.

**📚 Комплетан пут учења**: Посетите **[/walkthrough/README.md](walkthrough/README.md)** за комплетан преглед водича за учење са детаљним циљевима и предусловима.

---

## Детаљна архитектура

### Висок ниво архитектуре

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

### Основне компоненте

#### 1. **MCP сервер (`sales_analysis.py`)**
- **FastMCP оквир**: Обрађује HTTP/SSE комуникацију протокола
- **Регистрација алата**: Омогућава алате за упите и шеме базе података
- **Контекст захтева**: Управља идентификацијом корисника за RLS
- **Обрада грешака**: Робусно управљање грешкама и логовање

#### 2. **Слој базе података (`sales_analysis_postgres.py`)**
- **Пул конекција**: Ефикасно управљање асинхроним конекцијама
- **Провајдер шеме**: Динамичко откривање шеме табела
- **Извршење упита**: Сигурно извршење SQL упита са RLS
- **Семантичко претраживање**: Претраживање сличности вектора са pgvector

#### 3. **Управљање конфигурацијом (`config.py`)**
- **Енвиронмент променљиве**: Централизовано управљање конфигурацијом
- **Параметри конекције**: Конфигурација базе података и Azure услуга
- **Валидација**: Валидација обавезних енвиронмент променљивих

#### 4. **Инфраструктура (`infra/`)**
- **Bicep шаблони**: Декларативно обезбеђивање Azure ресурса
- **Имплементација модела**: Аутоматизована имплементација AI модела
- **Додела улога**: Конфигурација безбедносних улога

### Проток података

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Изградња решења

### Корак 1: Постављање структуре пројекта

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

### Корак 2: Основне зависности

**Python захтеви:**
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

**Системски захтеви:**
- Docker Desktop за контенеризацију
- Azure CLI за имплементацију
- PostgreSQL са pgvector екстензијом
- VS Code са AI екстензијама

### Корак 3: Дизајн шеме базе података

Пример користи базу података за малопродају са овим кључним табелама:

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

**Имплементација безбедности на нивоу реда (RLS):**
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

## Разрада компоненти

### MCP сервер језгро (`sales_analysis.py`)

#### Шаблон регистрације алата
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

**Кључне функције:**
- **Анотације типова**: Pydantic опис поља за AI разумевање
- **Екстракција контекста**: Идентификација корисника из HTTP заглавља
- **Обрада грешака**: Грациозно руковање са информативним порукама
- **Логовање**: Свеобухватно логовање операција

#### Управљање контекстом захтева
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Слој базе података (`sales_analysis_postgres.py`)

#### Управљање пулом конекција
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

**Шаблони дизајна:**
- **Управљање ресурсима**: Правилно управљање животним циклусом пула
- **Подешавање перформанси**: Оптимизоване PostgreSQL поставке
- **Опоравак од грешака**: Поновно успостављање конекције и резервна логика
- **Безбедност**: Постављање RLS контекста за сваку конекцију

#### Инспекција шеме
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

### Интеграција семантичког претраживања

#### Генерација ембединга
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

#### Претраживање сличности вектора
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

## Водич за имплементацију

### Имплементација Azure инфраструктуре

#### 1. **Структура Bicep шаблона**

**Главни шаблон (`main.bicep`):**
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

#### 2. **Аутоматизација имплементације**

**PowerShell имплементација (`deploy.ps1`):**
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

### Локално развојно окружење

#### 1. **Docker Compose конфигурација**
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

#### 2. **Иницијализација базе података**
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

## Коришћење решења

### Интеграција са VS Code

#### 1. **MCP конфигурација (`.vscode/mcp.json`)**
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

#### 2. **Примери упита**

**Откривање шеме:**
```
AI: #zava What tables are available in the database?
```
*MCP сервер користи `get_multiple_table_schemas` за враћање структура табела*

**Анализа продаје:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Генерише SQL са исправним спајањима и филтрирањем датума*

**Семантичко претраживање:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Користи ембединг за проналажење семантички сличних производа*

**Анализа више продавница:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS осигурава приступ само подацима продавнице у Сијетлу*

### Напредни шаблони упита

#### 1. **Анализа временских серија**
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

#### 2. **Перформансе производа са категоријама**
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

## Напредне функције

### Имплементација безбедности на нивоу реда

#### 1. **Креирање политике**
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

#### 2. **Постављање контекста у MCP серверу**
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

### Детаљна анализа семантичког претраживања

#### 1. **Ембединг процес**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Оптимизација претраживања сличности**
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

### Мониторинг и опсервабилност

#### 1. **Интеграција Azure Application Insights**
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

#### 2. **Прилагођене метрике и логовање**
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

## Решавање проблема

### Уобичајени проблеми и решења

#### 1. **Проблеми са конекцијом базе података**
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

**Уобичајена решења:**
- Проверите да ли PostgreSQL ради: `docker ps`
- Проверите параметре конекције у `.env`
- Потврдите да база података постоји: `docker exec -it pg17 psql -U postgres -l`
- Тестирајте мрежну конекцију: `telnet localhost 5432`

#### 2. **Проблеми са RLS политиком**
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

#### 3. **Проблеми са ембединг услугом**
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

### Оптимизација перформанси

#### 1. **Подешавање пула конекција**
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

#### 2. **Оптимизација упита**
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

## Најбоље праксе

### Најбоље праксе за безбедност

#### 1. **Управљање енвиронмент променљивама**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Смернице за имплементацију RLS**
- **Подразумевано одбијање**: Почните са рестриктивним политикама
- **Редовно проверавање**: Пратите ефикасност политика
- **Темељно тестирање**: Валидација шаблона приступа
- **Документација политика**: Одржавајте јасну документацију

#### 3. **Мрежна безбедност**
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

### Најбоље праксе за развој

#### 1. **Шаблони за обраду грешака**
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

#### 2. **Стратегије тестирања**
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

#### 3. **Мониторинг и упозорења**
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

### Најбоље праксе за имплементацију

#### 1. **Инфраструктура као код**
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

#### 2. **Интеграција CI/CD процеса**
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

Овај свеобухватан водич пружа основу за изградњу, имплементацију и управљање продукционо спремним MCP сервером са PostgreSQL интеграцијом. Шаблони и праксе приказане овде могу се проширити на друге домене и случајеве употребе уз одржавање безбедности, перформанси и одрживости.

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.