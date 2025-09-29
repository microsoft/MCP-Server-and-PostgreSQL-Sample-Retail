<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T18:42:03+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ru"
}
-->
# MCP Server и PostgreSQL Пример - Полное Руководство

## Содержание
1. [Обзор](../..)
2. [Подробный разбор архитектуры](../..)
3. [Создание решения](../..)
4. [Разбор компонентов](../..)
5. [Руководство по развертыванию](../..)
6. [Использование решения](../..)
7. [Расширенные функции](../..)
8. [Устранение неполадок](../..)
9. [Лучшие практики](../..)

## Обзор

Это руководство подробно описывает процесс создания и использования готового к производству **Model Context Protocol (MCP) сервера**, интегрированного с PostgreSQL и сервисами Azure AI. Пример демонстрирует корпоративные шаблоны, включая управление доступом на уровне строк, семантический поиск и многопользовательский доступ к данным.

### Чему вы научитесь
- Как спроектировать MCP сервер с интеграцией базы данных
- Реализация управления доступом на уровне строк для многопользовательских сценариев
- Создание семантического поиска с использованием встраиваний Azure OpenAI
- Создание среды разработки на основе Docker
- Развертывание инфраструктуры Azure с помощью шаблонов Bicep
- Интеграция с VS Code для аналитики на основе ИИ

### Используемые технологии
- **MCP Protocol**: Протокол Model Context для интеграции инструментов ИИ
- **FastMCP**: Современный Python-фреймворк для MCP серверов
- **PostgreSQL**: База данных с расширением pgvector для семантического поиска
- **Azure OpenAI**: Встраивания текста и опциональные модели GPT
- **Docker**: Контейнеризация для создания стабильных сред
- **Bicep**: Инфраструктура как код для ресурсов Azure
- **VS Code**: Среда разработки с интеграцией MCP

## 📚 Структурированное руководство по обучению: /walkthrough

В дополнение к этому техническому руководству, репозиторий включает подробное **12-модульное учебное руководство**, расположенное в директории `/walkthrough`. Этот структурированный подход разбивает сложную реализацию на понятные модули, идеально подходящие для разработчиков, которые хотят изучить каждый компонент поэтапно.

### Обзор учебных модулей

| Модуль | Тема | Основной акцент | Длительность |
|--------|-------|----------------|--------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Основы MCP | Основные концепции, кейс Zava Retail, обзор архитектуры | 30 мин |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Дизайн системы | Техническая архитектура, шаблоны проектирования, взаимосвязь компонентов | 45 мин |
| **[02-Security](walkthrough/02-Security/README.md)** | Корпоративная безопасность | Аутентификация Azure, управление доступом на уровне строк, изоляция данных | 60 мин |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Настройка среды | Конфигурация Docker, Azure CLI, инициализация проекта | 45 мин |
| **[04-Database](walkthrough/04-Database/README.md)** | Уровень данных | Схема PostgreSQL, настройка pgvector, политики RLS, пример данных | 60 мин |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Основная реализация | Фреймворк FastMCP, интеграция базы данных, разработка инструментов | 90 мин |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Разработка инструментов | Создание инструментов MCP, проверка запросов, бизнес-аналитика | 75 мин |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Интеграция ИИ | Встраивания Azure OpenAI, поиск по векторам, гибридные запросы | 60 мин |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Обеспечение качества | Стратегии тестирования, методы отладки, тестирование производительности | 75 мин |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Опыт разработки | Конфигурация VS Code, интеграция AI Chat, рабочие процессы отладки | 45 мин |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Развертывание в продакшн | Контейнеризация, Azure Container Apps, CI/CD пайплайны | 90 мин |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Наблюдаемость | Application Insights, структурированное логирование, метрики производительности | 60 мин |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Совершенство в продакшне | Усиление безопасности, оптимизация, корпоративные шаблоны | 45 мин |

### Как использовать учебное руководство

**📖 Для обучения**: Модули `/walkthrough` предоставляют пошаговые инструкции с объяснением, почему каждый компонент спроектирован именно так. Начните с Модуля 00 и двигайтесь последовательно.

**🔧 Для реализации**: Этот Sample_Walkthrough.md предоставляет технический разбор и описание кода для разработчиков, которые хотят быстро понять полную реализацию.

**🚀 Для продакшна**: Модули 02, 10, 11 и 12 сосредоточены на развертывании, безопасности и мониторинге в продакшн-среде.

**📚 Полный учебный путь**: Посетите **[/walkthrough/README.md](walkthrough/README.md)** для полного обзора учебного руководства с подробными целями обучения и предварительными требованиями.

---

## Подробный разбор архитектуры

### Высокоуровневая архитектура

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

### Основные компоненты

#### 1. **MCP сервер (`sales_analysis.py`)**
- **Фреймворк FastMCP**: Обрабатывает HTTP/SSE протоколы
- **Регистрация инструментов**: Предоставляет инструменты для запросов и схем базы данных
- **Контекст запросов**: Управляет идентификацией пользователя для RLS
- **Обработка ошибок**: Надежное управление ошибками и логирование

#### 2. **Уровень базы данных (`sales_analysis_postgres.py`)**
- **Пул соединений**: Эффективное управление соединениями asyncpg
- **Поставщик схем**: Динамическое обнаружение схем таблиц
- **Выполнение запросов**: Безопасное выполнение SQL с RLS
- **Семантический поиск**: Поиск по сходству векторов с pgvector

#### 3. **Управление конфигурацией (`config.py`)**
- **Переменные окружения**: Централизованное управление конфигурацией
- **Параметры соединения**: Конфигурация базы данных и сервисов Azure
- **Валидация**: Проверка обязательных переменных окружения

#### 4. **Инфраструктура (`infra/`)**
- **Шаблоны Bicep**: Декларативное создание ресурсов Azure
- **Развертывание моделей**: Автоматизированное развертывание моделей ИИ
- **Назначение ролей**: Конфигурация ролей безопасности

### Поток данных

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Создание решения

### Шаг 1: Настройка структуры проекта

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

### Шаг 2: Основные зависимости

**Требования Python:**
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

**Системные требования:**
- Docker Desktop для контейнеризации
- Azure CLI для развертывания
- PostgreSQL с расширением pgvector
- VS Code с расширениями для ИИ

### Шаг 3: Дизайн схемы базы данных

Пример использует розничную базу данных с ключевыми таблицами:

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

**Реализация управления доступом на уровне строк (RLS):**
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

## Разбор компонентов

### Основной MCP сервер (`sales_analysis.py`)

#### Шаблон регистрации инструментов
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

**Основные функции:**
- **Аннотации типов**: Описание полей Pydantic для понимания ИИ
- **Извлечение контекста**: Идентификация пользователя из HTTP заголовков
- **Обработка ошибок**: Плавное завершение с информативными сообщениями
- **Логирование**: Полное логирование операций

#### Управление контекстом запросов
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Уровень базы данных (`sales_analysis_postgres.py`)

#### Управление пулом соединений
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

**Шаблоны проектирования:**
- **Управление ресурсами**: Правильное управление жизненным циклом пула
- **Настройка производительности**: Оптимизированные параметры PostgreSQL
- **Восстановление после ошибок**: Повторное подключение и резервная логика
- **Безопасность**: Установка контекста RLS для каждого соединения

#### Инспекция схемы
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

### Интеграция семантического поиска

#### Генерация встраиваний
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

#### Поиск по сходству векторов
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

## Руководство по развертыванию

### Развертывание инфраструктуры Azure

#### 1. **Структура шаблона Bicep**

**Основной шаблон (`main.bicep`):**
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

#### 2. **Автоматизация развертывания**

**Развертывание через PowerShell (`deploy.ps1`):**
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

### Настройка локальной среды разработки

#### 1. **Конфигурация Docker Compose**
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

#### 2. **Инициализация базы данных**
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

## Использование решения

### Интеграция с VS Code

#### 1. **Конфигурация MCP (`.vscode/mcp.json`)**
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

#### 2. **Примеры запросов**

**Обнаружение схемы:**
```
AI: #zava What tables are available in the database?
```
*MCP сервер использует `get_multiple_table_schemas` для возврата структур таблиц*

**Анализ продаж:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Генерирует SQL с правильными соединениями и фильтрацией по датам*

**Семантический поиск:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Использует встраивания для поиска семантически похожих продуктов*

**Анализ нескольких магазинов:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS гарантирует доступ только к данным магазина в Сиэтле*

### Расширенные шаблоны запросов

#### 1. **Анализ временных рядов**
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

#### 2. **Эффективность продуктов с категориями**
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

## Расширенные функции

### Реализация управления доступом на уровне строк

#### 1. **Создание политики**
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

#### 2. **Установка контекста в MCP сервере**
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

### Подробный разбор семантического поиска

#### 1. **Пайплайн встраиваний**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Оптимизация поиска по сходству**
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

### Мониторинг и наблюдаемость

#### 1. **Интеграция Azure Application Insights**
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

#### 2. **Пользовательские метрики и логирование**
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

## Устранение неполадок

### Распространенные проблемы и их решения

#### 1. **Проблемы с подключением к базе данных**
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

**Распространенные решения:**
- Убедитесь, что PostgreSQL запущен: `docker ps`
- Проверьте параметры подключения в `.env`
- Убедитесь, что база данных существует: `docker exec -it pg17 psql -U postgres -l`
- Проверьте сетевую доступность: `telnet localhost 5432`

#### 2. **Проблемы с политиками RLS**
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

#### 3. **Проблемы с сервисом встраиваний**
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

### Оптимизация производительности

#### 1. **Настройка пула соединений**
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

#### 2. **Оптимизация запросов**
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

## Лучшие практики

### Лучшие практики безопасности

#### 1. **Управление переменными окружения**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Рекомендации по реализации RLS**
- **Запрет по умолчанию**: Начинайте с ограничительных политик
- **Регулярный аудит**: Отслеживайте эффективность политик
- **Тщательное тестирование**: Проверяйте шаблоны доступа
- **Документирование политик**: Ведите четкую документацию

#### 3. **Сетевая безопасность**
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

### Лучшие практики разработки

#### 1. **Шаблоны обработки ошибок**
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

#### 2. **Стратегии тестирования**
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

#### 3. **Мониторинг и оповещения**
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

### Лучшие практики развертывания

#### 1. **Инфраструктура как код**
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

#### 2. **Интеграция CI/CD пайплайнов**
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

Это подробное руководство предоставляет основу для создания, развертывания и эксплуатации готового к производству MCP сервера с интеграцией PostgreSQL. Шаблоны и практики, продемонстрированные здесь, могут быть расширены для других доменов и сценариев использования, сохраняя безопасность, производительность и удобство сопровождения.

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.