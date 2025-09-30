<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:02:34+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "bg"
}
-->
# MCP сървър и пример с PostgreSQL - Пълно ръководство

## Съдържание
1. [Общ преглед](../..)
2. [Детайлен преглед на архитектурата](../..)
3. [Създаване на решението](../..)
4. [Разбивка на компонентите](../..)
5. [Ръководство за внедряване](../..)
6. [Използване на решението](../..)
7. [Разширени функции](../..)
8. [Отстраняване на проблеми](../..)
9. [Най-добри практики](../..)

## Общ преглед

Това ръководство разглежда как да изградите и използвате готов за производство **Model Context Protocol (MCP) сървър**, който се интегрира с PostgreSQL и Azure AI услуги. Примерът демонстрира корпоративни модели, включително защита на ниво редове, семантично търсене и достъп до данни за множество наематели.

### Какво ще научите
- Как да проектирате MCP сървър с интеграция на база данни
- Прилагане на защита на ниво редове за сценарии с множество наематели
- Създаване на семантично търсене с Azure OpenAI embeddings
- Създаване на разработваща среда с Docker
- Внедряване на инфраструктура в Azure с Bicep шаблони
- Интеграция с VS Code за анализи, базирани на AI

### Използвани технологии
- **MCP Protocol**: Протокол за интеграция на AI инструменти
- **FastMCP**: Модерен Python MCP сървър фреймуърк
- **PostgreSQL**: База данни с pgvector разширение за семантично търсене
- **Azure OpenAI**: Текстови embeddings и опционални GPT модели
- **Docker**: Контейнеризация за консистентни среди
- **Bicep**: Infrastructure as Code за ресурси в Azure
- **VS Code**: Среда за разработка с MCP интеграция

## 📚 Структурирано ръководство за обучение: /walkthrough

Освен това техническо ръководство, това хранилище включва цялостно **12-модулно ръководство за обучение**, разположено в директорията `/walkthrough`. Този структуриран подход разбива сложната имплементация на лесно усвоими модули, идеални за разработчици, които искат да разберат всеки компонент стъпка по стъпка.

### Преглед на модулите за обучение

| Модул | Тема | Фокус | Продължителност |
|-------|------|-------|-----------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Основи на MCP | Основни концепции, казус Zava Retail, преглед на архитектурата | 30 мин |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Дизайн на системата | Техническа архитектура, модели на дизайн, връзки между компонентите | 45 мин |
| **[02-Security](walkthrough/02-Security/README.md)** | Корпоративна сигурност | Azure автентикация, защита на ниво редове, изолация за множество наематели | 60 мин |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Настройка на средата | Конфигурация на Docker, Azure CLI, инициализация на проекта | 45 мин |
| **[04-Database](walkthrough/04-Database/README.md)** | Данни | PostgreSQL схема, настройка на pgvector, RLS политики, примерни данни | 60 мин |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Основна имплементация | FastMCP фреймуърк, интеграция на база данни, разработка на инструменти | 90 мин |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Разработка на инструменти | Създаване на MCP инструменти, валидиране на заявки, бизнес анализи | 75 мин |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI интеграция | Azure OpenAI embeddings, търсене по вектори, хибридни заявки | 60 мин |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Осигуряване на качество | Стратегии за тестване, техники за дебъгване, тестване на производителност | 75 мин |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Опит в разработката | Конфигурация на VS Code, AI Chat интеграция, дебъгване | 45 мин |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Внедряване в производство | Контейнеризация, Azure Container Apps, CI/CD pipelines | 90 мин |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Наблюдение | Application Insights, структурирано логване, метрики за производителност | 60 мин |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Отлични практики | Усъвършенстване на сигурността, оптимизация, корпоративни модели | 45 мин |

### Как да използвате ръководството за обучение

**📖 За обучение**: Модулите `/walkthrough` предоставят стъпка по стъпка инструкции с обяснения защо всеки компонент е проектиран по определен начин. Започнете с Модул 00 и продължете последователно.

**🔧 За имплементация**: Този Sample_Walkthrough.md предоставя технически детайли и разбивка на кода за разработчици, които искат бързо да разберат цялостната имплементация.

**🚀 За производство**: Модулите 02, 10, 11 и 12 се фокусират специално върху внедряване в производство, сигурност и наблюдение.

**📚 Пълен път за обучение**: Посетете **[/walkthrough/README.md](walkthrough/README.md)** за пълния преглед на ръководството за обучение с подробни цели и предварителни изисквания.

---

## Детайлен преглед на архитектурата

### Високо ниво на архитектурата

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

### Основни компоненти

#### 1. **MCP сървър (`sales_analysis.py`)**
- **FastMCP Framework**: Управлява HTTP/SSE комуникация
- **Регистрация на инструменти**: Осигурява инструменти за заявки към база данни и схеми
- **Контекст на заявката**: Управлява идентификацията на потребителя за RLS
- **Управление на грешки**: Надеждно управление на грешки и логване

#### 2. **Слой на база данни (`sales_analysis_postgres.py`)**
- **Управление на връзки**: Ефективно управление на asyncpg връзки
- **Доставчик на схеми**: Динамично откриване на таблици и схеми
- **Изпълнение на заявки**: Сигурно изпълнение на SQL с RLS
- **Семантично търсене**: Търсене по векторна близост с pgvector

#### 3. **Управление на конфигурация (`config.py`)**
- **Променливи на средата**: Централизирано управление на конфигурацията
- **Параметри за връзка**: Конфигурация на база данни и Azure услуги
- **Валидиране**: Проверка на задължителни променливи на средата

#### 4. **Инфраструктура (`infra/`)**
- **Bicep шаблони**: Декларативно предоставяне на ресурси в Azure
- **Внедряване на модели**: Автоматизирано внедряване на AI модели
- **Ролева конфигурация**: Настройка на роли за сигурност

### Поток на данни

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Създаване на решението

### Стъпка 1: Настройка на структурата на проекта

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

### Стъпка 2: Основни зависимости

**Python изисквания:**
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

**Системни изисквания:**
- Docker Desktop за контейнеризация
- Azure CLI за внедряване
- PostgreSQL с pgvector разширение
- VS Code с AI разширения

### Стъпка 3: Дизайн на схема на база данни

Примерът използва ритейл база данни с тези ключови таблици:

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

**Имплементация на защита на ниво редове (RLS):**
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

## Разбивка на компонентите

### Основен MCP сървър (`sales_analysis.py`)

#### Модел за регистрация на инструменти
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

**Основни функции:**
- **Анотации на типове**: Pydantic описания на полета за AI разбиране
- **Извличане на контекст**: Идентичност на потребителя от HTTP заглавия
- **Управление на грешки**: Грациозно справяне с грешки с информативни съобщения
- **Логване**: Изчерпателно логване на операции

#### Управление на контекст на заявката
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Слой на база данни (`sales_analysis_postgres.py`)

#### Управление на връзки
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

**Модели на дизайн:**
- **Управление на ресурси**: Правилно управление на жизнения цикъл на пула
- **Оптимизация на производителност**: Настройки за PostgreSQL
- **Възстановяване от грешки**: Повторно свързване и резервна логика
- **Сигурност**: Настройка на RLS контекст за всяка връзка

#### Инспекция на схеми
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

### Интеграция на семантично търсене

#### Генериране на embeddings
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

#### Търсене по векторна близост
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

## Ръководство за внедряване

### Внедряване на инфраструктура в Azure

#### 1. **Структура на Bicep шаблон**

**Основен шаблон (`main.bicep`):**
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

#### 2. **Автоматизация на внедряването**

**PowerShell внедряване (`deploy.ps1`):**
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

### Настройка за локална разработка

#### 1. **Конфигурация на Docker Compose**
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

#### 2. **Инициализация на база данни**
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

## Използване на решението

### Интеграция с VS Code

#### 1. **MCP конфигурация (`.vscode/mcp.json`)**
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

#### 2. **Примери за заявки**

**Откриване на схеми:**
```
AI: #zava What tables are available in the database?
```
*MCP сървърът използва `get_multiple_table_schemas`, за да върне структури на таблици*

**Анализ на продажби:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Генерира SQL с правилни join-ове и филтриране по дати*

**Семантично търсене:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Използва embeddings за намиране на семантично подобни продукти*

**Анализ на множество магазини:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS гарантира достъп само до данни за магазина в Сиатъл*

### Разширени модели на заявки

#### 1. **Анализ на времеви серии**
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

#### 2. **Производителност на продукти с категории**
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

## Разширени функции

### Имплементация на защита на ниво редове

#### 1. **Създаване на политики**
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

#### 2. **Настройка на контекст в MCP сървър**
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

### Детайли за семантично търсене

#### 1. **Поток на embeddings**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Оптимизация на търсене по близост**
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

### Наблюдение и видимост

#### 1. **Интеграция с Azure Application Insights**
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

#### 2. **Персонализирани метрики и логване**
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

## Отстраняване на проблеми

### Чести проблеми и решения

#### 1. **Проблеми с връзка към база данни**
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

**Чести решения:**
- Проверете дали PostgreSQL работи: `docker ps`
- Проверете параметрите за връзка в `.env`
- Уверете се, че базата данни съществува: `docker exec -it pg17 psql -U postgres -l`
- Тествайте мрежовата свързаност: `telnet localhost 5432`

#### 2. **Проблеми с RLS политики**
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

#### 3. **Проблеми с embedding услуги**
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

### Оптимизация на производителност

#### 1. **Настройка на пула за връзки**
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

#### 2. **Оптимизация на заявки**
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

## Най-добри практики

### Най-добри практики за сигурност

#### 1. **Управление на променливи на средата**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Насоки за имплементация на RLS**
- **Default Deny**: Започнете с рестриктивни политики
- **Редовен одит**: Наблюдавайте ефективността на политиките
- **Тестове**: Валидирайте моделите за достъп
- **Документация**: Поддържайте ясна документация

#### 3. **Мрежова сигурност**
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

### Най-добри практики за разработка

#### 1. **Модели за управление на грешки**
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

#### 2. **Стратегии за тестване**
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

#### 3. **Наблюдение и известия**
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

### Най-добри практики за внедряване

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

#### 2. **Интеграция на CI/CD pipeline**
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

Това цялостно ръководство предоставя основата за изграждане, внедряване и управление на готов за производство MCP сървър с интеграция на PostgreSQL. Моделите и практиките, демонстрирани тук, могат да бъдат разширени за други домейни и случаи на употреба, като същевременно се поддържат сигурност, производителност и поддръжка.

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да било недоразумения или погрешни интерпретации, произтичащи от използването на този превод.