<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T18:43:21+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ur"
}
-->
# MCP سرور اور PostgreSQL نمونہ - مکمل رہنمائی

## فہرست
1. [جائزہ](../..)
2. [معماری کی تفصیل](../..)
3. [حل کی تعمیر](../..)
4. [اجزاء کی تفصیل](../..)
5. [تعیناتی گائیڈ](../..)
6. [حل کا استعمال](../..)
7. [جدید خصوصیات](../..)
8. [مسائل کا حل](../..)
9. [بہترین طریقے](../..)

## جائزہ

یہ رہنمائی وضاحت کرتی ہے کہ کس طرح ایک پروڈکشن کے لیے تیار **Model Context Protocol (MCP) سرور** بنایا جائے جو PostgreSQL اور Azure AI خدمات کے ساتھ مربوط ہو۔ یہ نمونہ انٹرپرائز گریڈ پیٹرنز جیسے Row Level Security، سیمینٹک سرچ، اور ملٹی ٹیننٹ ڈیٹا ایکسیس کو ظاہر کرتا ہے۔

### آپ کیا سیکھیں گے
- MCP سرور کو ڈیٹا بیس انٹیگریشن کے ساتھ کیسے ڈیزائن کریں
- ملٹی ٹیننٹ منظرناموں کے لیے Row Level Security نافذ کرنا
- Azure OpenAI ایمبیڈنگز کے ساتھ سیمینٹک سرچ بنانا
- Docker پر مبنی ترقیاتی ماحول بنانا
- Bicep ٹیمپلیٹس کے ساتھ Azure انفراسٹرکچر تعینات کرنا
- VS Code کے ساتھ AI پاورڈ تجزیات کو مربوط کرنا

### استعمال شدہ ٹیکنالوجیز
- **MCP Protocol**: AI ٹول انٹیگریشن کے لیے Model Context Protocol
- **FastMCP**: جدید Python MCP سرور فریم ورک
- **PostgreSQL**: pgvector ایکسٹینشن کے ساتھ ڈیٹا بیس سیمینٹک سرچ کے لیے
- **Azure OpenAI**: ٹیکسٹ ایمبیڈنگز اور اختیاری GPT ماڈلز
- **Docker**: مستقل ماحول کے لیے کنٹینرائزیشن
- **Bicep**: Azure وسائل کے لیے Infrastructure as Code
- **VS Code**: ترقیاتی ماحول MCP انٹیگریشن کے ساتھ

## 📚 منظم سیکھنے کی گائیڈ: /walkthrough

اس تکنیکی رہنمائی کے علاوہ، اس ریپوزٹری میں ایک جامع **12-ماڈیول سیکھنے کی گائیڈ** شامل ہے جو `/walkthrough` ڈائریکٹری میں واقع ہے۔ یہ منظم طریقہ کار پیچیدہ عمل درآمد کو قابل ہضم سیکھنے کے ماڈیولز میں تقسیم کرتا ہے، جو ان ڈویلپرز کے لیے بہترین ہے جو ہر جزو کو مرحلہ وار سمجھنا چاہتے ہیں۔

### سیکھنے کے ماڈیولز کا جائزہ

| ماڈیول | موضوع | فوکس | دورانیہ |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP بنیادی اصول | بنیادی تصورات، Zava Retail کیس اسٹڈی، معماری جائزہ | 30 منٹ |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | نظام ڈیزائن | تکنیکی معماری، ڈیزائن پیٹرنز، اجزاء کے تعلقات | 45 منٹ |
| **[02-Security](walkthrough/02-Security/README.md)** | انٹرپرائز سیکیورٹی | Azure تصدیق، Row Level Security، ملٹی ٹیننٹ آئسولیشن | 60 منٹ |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ماحول کی ترتیب | Docker کنفیگریشن، Azure CLI، پروجیکٹ کی شروعات | 45 منٹ |
| **[04-Database](walkthrough/04-Database/README.md)** | ڈیٹا لیئر | PostgreSQL اسکیمہ، pgvector سیٹ اپ، RLS پالیسیاں، نمونہ ڈیٹا | 60 منٹ |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | بنیادی عمل درآمد | FastMCP فریم ورک، ڈیٹا بیس انٹیگریشن، ٹول ڈیولپمنٹ | 90 منٹ |
| **[06-Tools](walkthrough/06-Tools/README.md)** | ٹول ڈیولپمنٹ | MCP ٹول تخلیق، کوئری کی توثیق، بزنس انٹیلیجنس | 75 منٹ |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI انٹیگریشن | Azure OpenAI ایمبیڈنگز، ویکٹر سرچ، ہائبرڈ کوئریز | 60 منٹ |
| **[08-Testing](walkthrough/08-Testing/README.md)** | کوالٹی اشورنس | ٹیسٹنگ حکمت عملی، ڈیبگنگ تکنیک، کارکردگی ٹیسٹنگ | 75 منٹ |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ترقیاتی تجربہ | VS Code کنفیگریشن، AI چیٹ انٹیگریشن، ڈیبگنگ ورک فلو | 45 منٹ |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | پروڈکشن تعیناتی | کنٹینرائزیشن، Azure Container Apps، CI/CD پائپ لائنز | 90 منٹ |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | مشاہدہ | Application Insights، منظم لاگنگ، کارکردگی میٹرکس | 60 منٹ |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | پروڈکشن ایکسیلنس | سیکیورٹی سختی، اصلاح، انٹرپرائز پیٹرنز | 45 منٹ |

### سیکھنے کی گائیڈ کا استعمال کیسے کریں

**📖 سیکھنے کے لیے**: `/walkthrough` ماڈیولز مرحلہ وار ہدایات فراہم کرتے ہیں اور ہر جزو کو اس طرح ڈیزائن کرنے کی وجوہات کی وضاحت کرتے ہیں۔ ماڈیول 00 سے شروع کریں اور ترتیب وار آگے بڑھیں۔

**🔧 عمل درآمد کے لیے**: یہ Sample_Walkthrough.md تکنیکی تفصیل اور کوڈ کی وضاحت فراہم کرتا ہے تاکہ ڈویلپرز مکمل عمل درآمد کو جلدی سمجھ سکیں۔

**🚀 پروڈکشن کے لیے**: ماڈیولز 02، 10، 11، اور 12 خاص طور پر پروڈکشن کے لیے تیار تعیناتی، سیکیورٹی، اور مشاہدہ کے پہلوؤں پر توجہ دیتے ہیں۔

**📚 مکمل سیکھنے کا راستہ**: مکمل سیکھنے کی گائیڈ کے جائزے کے لیے **[/walkthrough/README.md](walkthrough/README.md)** دیکھیں، جس میں تفصیلی سیکھنے کے مقاصد اور ضروریات شامل ہیں۔

---

## معماری کی تفصیل

### اعلیٰ سطحی معماری

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

### بنیادی اجزاء

#### 1. **MCP سرور (`sales_analysis.py`)**
- **FastMCP فریم ورک**: HTTP/SSE پروٹوکول کمیونیکیشن کو ہینڈل کرتا ہے
- **ٹول رجسٹریشن**: ڈیٹا بیس کوئری اور اسکیمہ ٹولز کو ظاہر کرتا ہے
- **ریکویسٹ کانٹیکسٹ**: RLS صارف کی شناخت کو منظم کرتا ہے
- **ایرر ہینڈلنگ**: مضبوط ایرر مینجمنٹ اور لاگنگ

#### 2. **ڈیٹا بیس لیئر (`sales_analysis_postgres.py`)**
- **کنکشن پولنگ**: موثر asyncpg کنکشن مینجمنٹ
- **اسکیمہ پرووائیڈر**: متحرک ٹیبل اسکیمہ دریافت
- **کوئری ایگزیکیوشن**: RLS کے ساتھ محفوظ SQL عمل درآمد
- **سیمینٹک سرچ**: pgvector کے ساتھ ویکٹر مماثلت سرچ

#### 3. **کنفیگریشن مینجمنٹ (`config.py`)**
- **ماحولیاتی متغیرات**: مرکزی کنفیگریشن ہینڈلنگ
- **کنکشن پیرامیٹرز**: ڈیٹا بیس اور Azure سروس کنفیگریشن
- **توثیق**: مطلوبہ ماحولیاتی متغیرات کی توثیق

#### 4. **انفراسٹرکچر (`infra/`)**
- **Bicep ٹیمپلیٹس**: Azure وسائل کی وضاحتی فراہمی
- **ماڈل تعیناتی**: خودکار AI ماڈل تعیناتی
- **رول اسائنمنٹس**: سیکیورٹی رول کنفیگریشن

### ڈیٹا فلو

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## حل کی تعمیر

### مرحلہ 1: پروجیکٹ اسٹرکچر سیٹ اپ

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

### مرحلہ 2: بنیادی ضروریات

**Python ضروریات:**
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

**سسٹم ضروریات:**
- کنٹینرائزیشن کے لیے Docker Desktop
- تعیناتی کے لیے Azure CLI
- PostgreSQL pgvector ایکسٹینشن کے ساتھ
- VS Code AI ایکسٹینشنز کے ساتھ

### مرحلہ 3: ڈیٹا بیس اسکیمہ ڈیزائن

نمونہ ایک ریٹیل ڈیٹا بیس استعمال کرتا ہے جس میں یہ کلیدی ٹیبلز شامل ہیں:

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

**Row Level Security (RLS) عمل درآمد:**
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

## اجزاء کی تفصیل

### MCP سرور کور (`sales_analysis.py`)

#### ٹول رجسٹریشن پیٹرن
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

**اہم خصوصیات:**
- **ٹائپ اینوٹیشنز**: AI کو سمجھنے کے لیے Pydantic فیلڈ وضاحتیں
- **کانٹیکسٹ ایکسٹریکشن**: HTTP ہیڈرز سے صارف کی شناخت
- **ایرر ہینڈلنگ**: معلوماتی پیغامات کے ساتھ شائستہ ناکامی
- **لاگنگ**: جامع آپریشن لاگنگ

#### ریکویسٹ کانٹیکسٹ مینجمنٹ
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### ڈیٹا بیس لیئر (`sales_analysis_postgres.py`)

#### کنکشن پول مینجمنٹ
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

**ڈیزائن پیٹرنز:**
- **وسائل کا انتظام**: پول لائف سائیکل کا مناسب انتظام
- **کارکردگی کی اصلاح**: بہتر PostgreSQL سیٹنگز
- **ایرر ریکوری**: کنکشن ریٹری اور فال بیک لاجک
- **سیکیورٹی**: ہر کنکشن پر RLS کانٹیکسٹ سیٹنگ

#### اسکیمہ انٹروسپیکشن
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

### سیمینٹک سرچ انٹیگریشن

#### ایمبیڈنگ جنریشن
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

#### ویکٹر مماثلت سرچ
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

## تعیناتی گائیڈ

### Azure انفراسٹرکچر تعیناتی

#### 1. **Bicep ٹیمپلیٹ اسٹرکچر**

**مین ٹیمپلیٹ (`main.bicep`):**
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

#### 2. **تعیناتی خودکار بنانا**

**PowerShell تعیناتی (`deploy.ps1`):**
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

### مقامی ترقیاتی سیٹ اپ

#### 1. **Docker Compose کنفیگریشن**
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

#### 2. **ڈیٹا بیس انیشیالائزیشن**
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

## حل کا استعمال

### VS Code انٹیگریشن

#### 1. **MCP کنفیگریشن (`.vscode/mcp.json`)**
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

#### 2. **کوئری مثالیں**

**اسکیمہ دریافت:**
```
AI: #zava What tables are available in the database?
```
*MCP سرور `get_multiple_table_schemas` استعمال کرتا ہے تاکہ ٹیبل اسٹرکچرز واپس کرے*

**سیلز تجزیہ:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*مناسب جوائنز اور تاریخ فلٹرنگ کے ساتھ SQL تیار کرتا ہے*

**سیمینٹک سرچ:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*ایمبیڈنگز استعمال کرتا ہے تاکہ سیمینٹک طور پر مماثل پروڈکٹس تلاش کرے*

**ملٹی اسٹور تجزیہ:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS صرف سیئٹل اسٹور ڈیٹا تک رسائی کو یقینی بناتا ہے*

### جدید کوئری پیٹرنز

#### 1. **ٹائم سیریز تجزیہ**
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

#### 2. **پروڈکٹ کارکردگی زمرہ جات کے ساتھ**
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

## جدید خصوصیات

### Row Level Security عمل درآمد

#### 1. **پالیسی تخلیق**
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

#### 2. **MCP سرور میں کانٹیکسٹ سیٹنگ**
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

### سیمینٹک سرچ کی تفصیل

#### 1. **ایمبیڈنگ پائپ لائن**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **مماثلت سرچ کی اصلاح**
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

### مشاہدہ اور نگرانی

#### 1. **Azure Application Insights انٹیگریشن**
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

#### 2. **کسٹم میٹرکس اور لاگنگ**
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

## مسائل کا حل

### عام مسائل اور حل

#### 1. **ڈیٹا بیس کنکشن مسائل**
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

**عام حل:**
- تصدیق کریں کہ PostgreSQL چل رہا ہے: `docker ps`
- `.env` میں کنکشن پیرامیٹرز چیک کریں
- تصدیق کریں کہ ڈیٹا بیس موجود ہے: `docker exec -it pg17 psql -U postgres -l`
- نیٹ ورک کنیکٹیویٹی ٹیسٹ کریں: `telnet localhost 5432`

#### 2. **RLS پالیسی مسائل**
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

#### 3. **ایمبیڈنگ سروس مسائل**
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

### کارکردگی کی اصلاح

#### 1. **کنکشن پول ٹیوننگ**
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

#### 2. **کوئری کی اصلاح**
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

## بہترین طریقے

### سیکیورٹی بہترین طریقے

#### 1. **ماحولیاتی متغیرات کا انتظام**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS عمل درآمد کے رہنما اصول**
- **ڈیفالٹ ڈینائی**: سخت پالیسیوں کے ساتھ شروع کریں
- **باقاعدہ آڈٹ**: پالیسی کی تاثیر کی نگرانی کریں
- **مکمل ٹیسٹ**: ایکسیس پیٹرنز کی توثیق کریں
- **پالیسیوں کی دستاویزات**: واضح دستاویزات برقرار رکھیں

#### 3. **نیٹ ورک سیکیورٹی**
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

### ترقیاتی بہترین طریقے

#### 1. **ایرر ہینڈلنگ پیٹرنز**
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

#### 2. **ٹیسٹنگ حکمت عملی**
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

#### 3. **نگرانی اور الرٹس**
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

### تعیناتی بہترین طریقے

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

#### 2. **CI/CD پائپ لائن انٹیگریشن**
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

یہ جامع رہنمائی MCP سرور کو PostgreSQL انٹیگریشن کے ساتھ بنانے، تعینات کرنے، اور چلانے کے لیے بنیاد فراہم کرتی ہے۔ یہاں دکھائے گئے پیٹرنز اور طریقے دیگر ڈومینز اور استعمال کے معاملات میں توسیع پذیر ہیں، جبکہ سیکیورٹی، کارکردگی، اور برقرار رکھنے کی صلاحیت کو برقرار رکھتے ہیں۔

---

**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔