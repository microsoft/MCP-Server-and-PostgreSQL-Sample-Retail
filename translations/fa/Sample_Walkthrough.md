<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T18:08:43+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "fa"
}
-->
# نمونه سرور MCP و PostgreSQL - راهنمای کامل

## فهرست مطالب
1. [بررسی کلی](../..)
2. [جزئیات معماری](../..)
3. [ساخت راه‌حل](../..)
4. [جزئیات اجزا](../..)
5. [راهنمای استقرار](../..)
6. [استفاده از راه‌حل](../..)
7. [ویژگی‌های پیشرفته](../..)
8. [رفع اشکال](../..)
9. [بهترین روش‌ها](../..)

## بررسی کلی

این راهنمای کامل نحوه ساخت و استفاده از یک **سرور Model Context Protocol (MCP)** آماده تولید را که با PostgreSQL و خدمات Azure AI یکپارچه شده است، توضیح می‌دهد. نمونه ارائه شده الگوهای سطح سازمانی مانند امنیت سطح ردیف، جستجوی معنایی و دسترسی به داده‌های چند مستاجر را نشان می‌دهد.

### آنچه خواهید آموخت
- نحوه طراحی یک سرور MCP با یکپارچگی پایگاه داده
- پیاده‌سازی امنیت سطح ردیف برای سناریوهای چند مستاجر
- ساخت جستجوی معنایی با استفاده از تعبیه‌های Azure OpenAI
- ایجاد محیط‌های توسعه مبتنی بر Docker
- استقرار زیرساخت Azure با قالب‌های Bicep
- یکپارچگی با VS Code برای تحلیل‌های مبتنی بر هوش مصنوعی

### فناوری‌های استفاده شده
- **پروتکل MCP**: پروتکل Model Context برای یکپارچگی ابزارهای هوش مصنوعی
- **FastMCP**: چارچوب مدرن Python برای سرور MCP
- **PostgreSQL**: پایگاه داده با افزونه pgvector برای جستجوی معنایی
- **Azure OpenAI**: تعبیه‌های متنی و مدل‌های GPT اختیاری
- **Docker**: کانتینرسازی برای محیط‌های سازگار
- **Bicep**: زیرساخت به عنوان کد برای منابع Azure
- **VS Code**: محیط توسعه با یکپارچگی MCP

## 📚 راهنمای یادگیری ساختاریافته: /walkthrough

علاوه بر این راهنمای فنی، این مخزن شامل یک **راهنمای یادگیری ۱۲ ماژوله جامع** در دایرکتوری `/walkthrough` است. این رویکرد ساختاریافته پیاده‌سازی پیچیده را به ماژول‌های قابل فهم تقسیم می‌کند، مناسب برای توسعه‌دهندگانی که می‌خواهند هر جزء را مرحله به مرحله درک کنند.

### نمای کلی ماژول‌های یادگیری

| ماژول | موضوع | تمرکز | مدت زمان |
|-------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | اصول MCP | مفاهیم اصلی، مطالعه موردی Zava Retail، نمای کلی معماری | ۳۰ دقیقه |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | طراحی سیستم | معماری فنی، الگوهای طراحی، روابط اجزا | ۴۵ دقیقه |
| **[02-Security](walkthrough/02-Security/README.md)** | امنیت سازمانی | احراز هویت Azure، امنیت سطح ردیف، جداسازی چند مستاجر | ۶۰ دقیقه |
| **[03-Setup](walkthrough/03-Setup/README.md)** | تنظیم محیط | پیکربندی Docker، Azure CLI، راه‌اندازی پروژه | ۴۵ دقیقه |
| **[04-Database](walkthrough/04-Database/README.md)** | لایه داده | طرح پایگاه داده PostgreSQL، تنظیم pgvector، سیاست‌های RLS، داده نمونه | ۶۰ دقیقه |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | پیاده‌سازی اصلی | چارچوب FastMCP، یکپارچگی پایگاه داده، توسعه ابزار | ۹۰ دقیقه |
| **[06-Tools](walkthrough/06-Tools/README.md)** | توسعه ابزار | ایجاد ابزار MCP، اعتبارسنجی پرس‌وجو، هوش تجاری | ۷۵ دقیقه |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | یکپارچگی هوش مصنوعی | تعبیه‌های Azure OpenAI، جستجوی برداری، پرس‌وجوهای ترکیبی | ۶۰ دقیقه |
| **[08-Testing](walkthrough/08-Testing/README.md)** | تضمین کیفیت | استراتژی‌های تست، تکنیک‌های اشکال‌زدایی، تست عملکرد | ۷۵ دقیقه |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | تجربه توسعه | پیکربندی VS Code، یکپارچگی چت هوش مصنوعی، جریان‌های اشکال‌زدایی | ۴۵ دقیقه |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | استقرار تولید | کانتینرسازی، برنامه‌های کانتینر Azure، خطوط لوله CI/CD | ۹۰ دقیقه |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | مشاهده‌پذیری | Application Insights، ثبت ساختاریافته، معیارهای عملکرد | ۶۰ دقیقه |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | برتری تولید | تقویت امنیت، بهینه‌سازی، الگوهای سازمانی | ۴۵ دقیقه |

### نحوه استفاده از راهنمای یادگیری

**📖 برای یادگیری**: ماژول‌های `/walkthrough` دستورالعمل‌های مرحله به مرحله با توضیحات درباره دلیل طراحی هر جزء را ارائه می‌دهند. با ماژول ۰۰ شروع کنید و به ترتیب پیش بروید.

**🔧 برای پیاده‌سازی**: این Sample_Walkthrough.md تجزیه و تحلیل فنی و کد را برای توسعه‌دهندگانی که می‌خواهند پیاده‌سازی کامل را سریعاً درک کنند، ارائه می‌دهد.

**🚀 برای تولید**: ماژول‌های ۰۲، ۱۰، ۱۱ و ۱۲ به طور خاص بر استقرار آماده تولید، امنیت و ملاحظات نظارتی تمرکز دارند.

**📚 مسیر یادگیری کامل**: به **[/walkthrough/README.md](walkthrough/README.md)** مراجعه کنید تا نمای کلی راهنمای یادگیری کامل با اهداف یادگیری و پیش‌نیازهای دقیق را مشاهده کنید.

---

## جزئیات معماری

### معماری سطح بالا

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

### اجزای اصلی

#### 1. **سرور MCP (`sales_analysis.py`)**
- **چارچوب FastMCP**: مدیریت ارتباطات HTTP/SSE
- **ثبت ابزار**: ارائه ابزارهای پرس‌وجو و طرح پایگاه داده
- **زمینه درخواست**: مدیریت شناسایی کاربر RLS
- **مدیریت خطا**: مدیریت خطاهای قوی و ثبت وقایع

#### 2. **لایه پایگاه داده (`sales_analysis_postgres.py`)**
- **مدیریت اتصال**: مدیریت کارآمد اتصال asyncpg
- **ارائه طرح**: کشف پویا طرح جدول
- **اجرای پرس‌وجو**: اجرای امن SQL با RLS
- **جستجوی معنایی**: جستجوی شباهت برداری با pgvector

#### 3. **مدیریت پیکربندی (`config.py`)**
- **متغیرهای محیطی**: مدیریت متمرکز پیکربندی
- **پارامترهای اتصال**: پیکربندی پایگاه داده و خدمات Azure
- **اعتبارسنجی**: اعتبارسنجی متغیرهای محیطی مورد نیاز

#### 4. **زیرساخت (`infra/`)**
- **قالب‌های Bicep**: تهیه منابع Azure به صورت اعلامی
- **استقرار مدل**: استقرار خودکار مدل‌های هوش مصنوعی
- **تخصیص نقش‌ها**: پیکربندی نقش‌های امنیتی

### جریان داده

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## ساخت راه‌حل

### مرحله ۱: تنظیم ساختار پروژه

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

### مرحله ۲: وابستگی‌های اصلی

**نیازمندی‌های Python:**
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

**نیازمندی‌های سیستم:**
- Docker Desktop برای کانتینرسازی
- Azure CLI برای استقرار
- PostgreSQL با افزونه pgvector
- VS Code با افزونه‌های هوش مصنوعی

### مرحله ۳: طراحی طرح پایگاه داده

نمونه از یک پایگاه داده خرده‌فروشی با این جداول کلیدی استفاده می‌کند:

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

**پیاده‌سازی امنیت سطح ردیف (RLS):**
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

## جزئیات اجزا

### هسته سرور MCP (`sales_analysis.py`)

#### الگوی ثبت ابزار
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

**ویژگی‌های کلیدی:**
- **توضیحات نوع**: توضیحات فیلد Pydantic برای درک هوش مصنوعی
- **استخراج زمینه**: شناسایی کاربر از هدرهای HTTP
- **مدیریت خطا**: شکست‌های قابل مدیریت با پیام‌های اطلاع‌رسان
- **ثبت وقایع**: ثبت جامع عملیات

#### مدیریت زمینه درخواست
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### لایه پایگاه داده (`sales_analysis_postgres.py`)

#### مدیریت اتصال به پایگاه داده
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

**الگوهای طراحی:**
- **مدیریت منابع**: مدیریت صحیح چرخه عمر اتصال
- **تنظیم عملکرد**: تنظیمات بهینه PostgreSQL
- **بازیابی خطا**: تلاش مجدد اتصال و منطق جایگزین
- **امنیت**: تنظیم زمینه RLS برای هر اتصال

#### بررسی طرح پایگاه داده
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

### یکپارچگی جستجوی معنایی

#### تولید تعبیه‌ها
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

#### جستجوی شباهت برداری
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

## راهنمای استقرار

### استقرار زیرساخت Azure

#### 1. **ساختار قالب Bicep**

**قالب اصلی (`main.bicep`):**
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

#### 2. **خودکارسازی استقرار**

**استقرار PowerShell (`deploy.ps1`):**
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

### تنظیم توسعه محلی

#### 1. **پیکربندی Docker Compose**
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

#### 2. **راه‌اندازی پایگاه داده**
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

## استفاده از راه‌حل

### یکپارچگی VS Code

#### 1. **پیکربندی MCP (`.vscode/mcp.json`)**
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

#### 2. **نمونه‌های پرس‌وجو**

**کشف طرح:**
```
AI: #zava What tables are available in the database?
```
*سرور MCP از `get_multiple_table_schemas` برای بازگرداندن ساختار جدول‌ها استفاده می‌کند*

**تحلیل فروش:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*SQL با پیوندهای مناسب و فیلتر تاریخ تولید می‌کند*

**جستجوی معنایی:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*از تعبیه‌ها برای یافتن محصولات معنایی مشابه استفاده می‌کند*

**تحلیل چند فروشگاه:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS تضمین می‌کند که فقط داده‌های فروشگاه سیاتل دسترسی پیدا می‌کند*

### الگوهای پرس‌وجوی پیشرفته

#### 1. **تحلیل سری زمانی**
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

#### 2. **عملکرد محصول با دسته‌بندی‌ها**
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

## ویژگی‌های پیشرفته

### پیاده‌سازی امنیت سطح ردیف

#### 1. **ایجاد سیاست**
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

#### 2. **تنظیم زمینه در سرور MCP**
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

### بررسی عمیق جستجوی معنایی

#### 1. **خط تولید تعبیه‌ها**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **بهینه‌سازی جستجوی شباهت**
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

### نظارت و مشاهده‌پذیری

#### 1. **یکپارچگی Azure Application Insights**
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

#### 2. **ثبت وقایع و معیارهای سفارشی**
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

## رفع اشکال

### مشکلات رایج و راه‌حل‌ها

#### 1. **مشکلات اتصال به پایگاه داده**
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

**راه‌حل‌های رایج:**
- بررسی کنید که PostgreSQL در حال اجرا است: `docker ps`
- پارامترهای اتصال را در `.env` بررسی کنید
- اعتبارسنجی وجود پایگاه داده: `docker exec -it pg17 psql -U postgres -l`
- تست اتصال شبکه: `telnet localhost 5432`

#### 2. **مشکلات سیاست RLS**
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

#### 3. **مشکلات سرویس تعبیه‌ها**
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

### بهینه‌سازی عملکرد

#### 1. **تنظیم اتصال به پایگاه داده**
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

#### 2. **بهینه‌سازی پرس‌وجو**
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

## بهترین روش‌ها

### بهترین روش‌های امنیتی

#### 1. **مدیریت متغیرهای محیطی**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **راهنمای پیاده‌سازی RLS**
- **پیش‌فرض عدم دسترسی**: با سیاست‌های محدود شروع کنید
- **ممیزی منظم**: اثربخشی سیاست‌ها را نظارت کنید
- **تست کامل**: الگوهای دسترسی را اعتبارسنجی کنید
- **مستندسازی سیاست‌ها**: مستندات واضح نگه دارید

#### 3. **امنیت شبکه**
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

### بهترین روش‌های توسعه

#### 1. **الگوهای مدیریت خطا**
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

#### 2. **استراتژی‌های تست**
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

#### 3. **نظارت و هشدارها**
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

### بهترین روش‌های استقرار

#### 1. **زیرساخت به عنوان کد**
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

#### 2. **یکپارچگی خطوط لوله CI/CD**
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

این راهنمای جامع پایه‌ای برای ساخت، استقرار و بهره‌برداری از یک سرور MCP آماده تولید با یکپارچگی PostgreSQL فراهم می‌کند. الگوها و روش‌های ارائه شده در اینجا می‌توانند به سایر حوزه‌ها و موارد استفاده گسترش یابند، در حالی که امنیت، عملکرد و قابلیت نگهداری حفظ می‌شود.

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.