<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-30T07:40:02+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "uk"
}
-->
# MCP Server і PostgreSQL Приклад - Повний Посібник

## Зміст
1. [Огляд](../..)
2. [Детальний аналіз архітектури](../..)
3. [Створення рішення](../..)
4. [Розбір компонентів](../..)
5. [Посібник з розгортання](../..)
6. [Використання рішення](../..)
7. [Розширені функції](../..)
8. [Вирішення проблем](../..)
9. [Найкращі практики](../..)

## Огляд

Цей посібник розкриває, як створити та використовувати готовий до виробництва **сервер Model Context Protocol (MCP)**, який інтегрується з PostgreSQL та сервісами Azure AI. Приклад демонструє шаблони корпоративного рівня, включаючи безпеку на рівні рядків, семантичний пошук і доступ до даних для багатьох орендарів.

### Чого ви навчитеся
- Як спроєктувати сервер MCP з інтеграцією бази даних
- Реалізація безпеки на рівні рядків для сценаріїв з багатьма орендарями
- Побудова семантичного пошуку за допомогою вбудовувань Azure OpenAI
- Створення середовищ розробки на основі Docker
- Розгортання інфраструктури Azure за допомогою шаблонів Bicep
- Інтеграція з VS Code для аналітики на основі AI

### Використані технології
- **MCP Protocol**: Протокол Model Context для інтеграції AI інструментів
- **FastMCP**: Сучасний Python-фреймворк для серверів MCP
- **PostgreSQL**: База даних з розширенням pgvector для семантичного пошуку
- **Azure OpenAI**: Вбудовування тексту та опціональні моделі GPT
- **Docker**: Контейнеризація для забезпечення стабільного середовища
- **Bicep**: Інфраструктура як код для ресурсів Azure
- **VS Code**: Середовище розробки з інтеграцією MCP

## 📚 Структурований навчальний посібник: /walkthrough

Окрім цього технічного посібника, цей репозиторій містить комплексний **12-модульний навчальний посібник**, розташований у каталозі `/walkthrough`. Цей структурований підхід розбиває складну реалізацію на зрозумілі навчальні модулі, ідеально підходить для розробників, які хочуть зрозуміти кожен компонент покроково.

### Огляд навчальних модулів

| Модуль | Тема | Фокус | Тривалість |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Основи MCP | Основні концепції, кейс Zava Retail, огляд архітектури | 30 хв |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Дизайн системи | Технічна архітектура, шаблони дизайну, взаємозв’язки компонентів | 45 хв |
| **[02-Security](walkthrough/02-Security/README.md)** | Корпоративна безпека | Аутентифікація Azure, безпека на рівні рядків, ізоляція орендарів | 60 хв |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Налаштування середовища | Конфігурація Docker, Azure CLI, ініціалізація проєкту | 45 хв |
| **[04-Database](walkthrough/04-Database/README.md)** | Шар даних | Схема PostgreSQL, налаштування pgvector, політики RLS, тестові дані | 60 хв |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Основна реалізація | Фреймворк FastMCP, інтеграція бази даних, розробка інструментів | 90 хв |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Розробка інструментів | Створення MCP інструментів, перевірка запитів, бізнес-аналітика | 75 хв |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Інтеграція AI | Вбудовування Azure OpenAI, пошук за векторами, гібридні запити | 60 хв |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Забезпечення якості | Стратегії тестування, техніки налагодження, тестування продуктивності | 75 хв |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Досвід розробки | Конфігурація VS Code, інтеграція AI Chat, робочі процеси налагодження | 45 хв |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Розгортання у виробництві | Контейнеризація, Azure Container Apps, CI/CD конвеєри | 90 хв |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Спостережуваність | Application Insights, структуроване логування, метрики продуктивності | 60 хв |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Досконалість у виробництві | Посилення безпеки, оптимізація, корпоративні шаблони | 45 хв |

### Як використовувати навчальний посібник

**📖 Для навчання**: Модулі `/walkthrough` надають покрокові інструкції з поясненням, чому кожен компонент спроєктований саме так. Почніть з Модуля 00 і рухайтеся послідовно.

**🔧 Для реалізації**: Цей Sample_Walkthrough.md надає технічний аналіз і розбір коду для розробників, які хочуть швидко зрозуміти повну реалізацію.

**🚀 Для виробництва**: Модулі 02, 10, 11 і 12 зосереджені спеціально на розгортанні у виробництві, безпеці та моніторингу.

**📚 Повний навчальний шлях**: Відвідайте **[/walkthrough/README.md](walkthrough/README.md)** для повного огляду навчального посібника з детальними навчальними цілями та передумовами.

---

## Детальний аналіз архітектури

### Високорівнева архітектура

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

### Основні компоненти

#### 1. **Сервер MCP (`sales_analysis.py`)**
- **Фреймворк FastMCP**: Обробляє HTTP/SSE протокольну комунікацію
- **Реєстрація інструментів**: Відкриває інструменти запитів до бази даних і схеми
- **Контекст запиту**: Управляє ідентифікацією користувача для RLS
- **Обробка помилок**: Надійне управління помилками та логування

#### 2. **Шар бази даних (`sales_analysis_postgres.py`)**
- **Пул з'єднань**: Ефективне управління асинхронними з'єднаннями
- **Постачальник схеми**: Динамічне виявлення схеми таблиць
- **Виконання запитів**: Безпечне виконання SQL із RLS
- **Семантичний пошук**: Пошук за схожістю векторів із pgvector

#### 3. **Управління конфігурацією (`config.py`)**
- **Змінні середовища**: Централізоване управління конфігурацією
- **Параметри з'єднання**: Конфігурація бази даних і сервісів Azure
- **Валідація**: Перевірка необхідних змінних середовища

#### 4. **Інфраструктура (`infra/`)**
- **Шаблони Bicep**: Декларативне забезпечення ресурсів Azure
- **Розгортання моделей**: Автоматизоване розгортання AI моделей
- **Призначення ролей**: Конфігурація ролей безпеки

### Потік даних

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Створення рішення

### Крок 1: Налаштування структури проєкту

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

### Крок 2: Основні залежності

**Вимоги до Python:**
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

**Системні вимоги:**
- Docker Desktop для контейнеризації
- Azure CLI для розгортання
- PostgreSQL із розширенням pgvector
- VS Code із розширеннями AI

### Крок 3: Дизайн схеми бази даних

Приклад використовує роздрібну базу даних із такими ключовими таблицями:

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

**Реалізація безпеки на рівні рядків (RLS):**
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

## Розбір компонентів

### Основний сервер MCP (`sales_analysis.py`)

#### Шаблон реєстрації інструментів
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

**Основні функції:**
- **Анотації типів**: Опис полів Pydantic для розуміння AI
- **Витяг контексту**: Ідентифікація користувача з HTTP заголовків
- **Обробка помилок**: Акуратне завершення з інформативними повідомленнями
- **Логування**: Повне логування операцій

#### Управління контекстом запиту
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Шар бази даних (`sales_analysis_postgres.py`)

#### Управління пулом з'єднань
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

**Шаблони дизайну:**
- **Управління ресурсами**: Правильне управління життєвим циклом пулу
- **Налаштування продуктивності**: Оптимізовані параметри PostgreSQL
- **Відновлення після помилок**: Повторне з'єднання та резервна логіка
- **Безпека**: Налаштування контексту RLS для кожного з'єднання

#### Інтроспекція схеми
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

### Інтеграція семантичного пошуку

#### Генерація вбудовувань
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

#### Пошук за схожістю векторів
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

## Посібник з розгортання

### Розгортання інфраструктури Azure

#### 1. **Структура шаблону Bicep**

**Основний шаблон (`main.bicep`):**
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

#### 2. **Автоматизація розгортання**

**Розгортання PowerShell (`deploy.ps1`):**
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

### Налаштування локального середовища розробки

#### 1. **Конфігурація Docker Compose**
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

#### 2. **Ініціалізація бази даних**
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

## Використання рішення

### Інтеграція з VS Code

#### 1. **Конфігурація MCP (`.vscode/mcp.json`)**
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

#### 2. **Приклади запитів**

**Виявлення схеми:**
```
AI: #zava What tables are available in the database?
```
*Сервер MCP використовує `get_multiple_table_schemas` для повернення структур таблиць*

**Аналіз продажів:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Генерує SQL із правильними об'єднаннями та фільтрацією за датою*

**Семантичний пошук:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Використовує вбудовування для пошуку семантично схожих продуктів*

**Аналіз багатьох магазинів:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS забезпечує доступ лише до даних магазину в Сіетлі*

### Розширені шаблони запитів

#### 1. **Аналіз часових рядів**
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

#### 2. **Продуктивність продуктів за категоріями**
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

## Розширені функції

### Реалізація безпеки на рівні рядків

#### 1. **Створення політики**
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

#### 2. **Налаштування контексту в сервері MCP**
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

### Детальний аналіз семантичного пошуку

#### 1. **Пайплайн вбудовувань**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Оптимізація пошуку за схожістю**
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

### Моніторинг і спостережуваність

#### 1. **Інтеграція Azure Application Insights**
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

#### 2. **Користувацькі метрики та логування**
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

## Вирішення проблем

### Поширені проблеми та рішення

#### 1. **Проблеми з'єднання з базою даних**
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

**Поширені виправлення:**
- Перевірте, чи працює PostgreSQL: `docker ps`
- Перевірте параметри з'єднання в `.env`
- Переконайтеся, що база даних існує: `docker exec -it pg17 psql -U postgres -l`
- Перевірте мережеву доступність: `telnet localhost 5432`

#### 2. **Проблеми з політикою RLS**
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

#### 3. **Проблеми з сервісом вбудовувань**
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

### Оптимізація продуктивності

#### 1. **Налаштування пулу з'єднань**
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

#### 2. **Оптимізація запитів**
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

## Найкращі практики

### Найкращі практики безпеки

#### 1. **Управління змінними середовища**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Рекомендації щодо реалізації RLS**
- **За замовчуванням заборонити**: Починайте з обмежувальних політик
- **Регулярний аудит**: Моніторинг ефективності політик
- **Ретельне тестування**: Перевірка шаблонів доступу
- **Документування політик**: Підтримка чіткої документації

#### 3. **Мережева безпека**
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

### Найкращі практики розробки

#### 1. **Шаблони обробки помилок**
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

#### 2. **Стратегії тестування**
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

#### 3. **Моніторинг і сповіщення**
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

### Найкращі практики розгортання

#### 1. **Інфраструктура як код**
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

#### 2. **Інтеграція CI/CD конвеєра**
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

Цей комплексний посібник забезпечує основу для створення, розгортання та експлуатації готового до виробництва сервера MCP з інтеграцією PostgreSQL. Шаблони та практики, продемонстровані тут, можуть бути розширені для інших доменів і сценаріїв використання, зберігаючи безпеку, продуктивність і підтримуваність.

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, звертаємо вашу увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.