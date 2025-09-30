<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T16:27:36+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "tw"
}
-->
# MCP 伺服器與 PostgreSQL 範例 - 完整指南

## 目錄
1. [概述](../..)
2. [架構深入解析](../..)
3. [建置解決方案](../..)
4. [元件拆解](../..)
5. [部署指南](../..)
6. [使用解決方案](../..)
7. [進階功能](../..)
8. [故障排除](../..)
9. [最佳實踐](../..)

## 概述

本指南詳細說明如何建置並使用一個可投入生產的 **Model Context Protocol (MCP) 伺服器**，該伺服器整合了 PostgreSQL 和 Azure AI 服務。此範例展示了企業級模式，包括行級安全性、語義搜尋以及多租戶資料存取。

### 您將學到的內容
- 如何設計具有資料庫整合的 MCP 伺服器
- 在多租戶場景中實現行級安全性
- 使用 Azure OpenAI 嵌入建置語義搜尋
- 建立基於 Docker 的開發環境
- 使用 Bicep 模板部署 Azure 基礎架構
- 整合 VS Code 以進行 AI 驅動的分析

### 使用的技術
- **MCP Protocol**: 用於 AI 工具整合的模型上下文協議
- **FastMCP**: 現代化的 Python MCP 伺服器框架
- **PostgreSQL**: 支援語義搜尋的 pgvector 擴展資料庫
- **Azure OpenAI**: 文本嵌入及可選的 GPT 模型
- **Docker**: 用於一致性環境的容器化技術
- **Bicep**: 用於 Azure 資源的基礎架構即代碼工具
- **VS Code**: 與 MCP 整合的開發環境

## 📚 結構化學習指南: /walkthrough

除了本技術指南外，此存儲庫還包含一份完整的 **12 模塊學習指南**，位於 `/walkthrough` 目錄中。此結構化方法將複雜的實現分解為易於理解的學習模塊，非常適合希望逐步了解每個元件的開發者。

### 學習模塊概述

| 模塊 | 主題 | 重點 | 時長 |
|------|------|------|------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP 基礎 | 核心概念、Zava Retail 案例研究、架構概述 | 30 分鐘 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | 系統設計 | 技術架構、設計模式、元件關係 | 45 分鐘 |
| **[02-Security](walkthrough/02-Security/README.md)** | 企業安全性 | Azure 身份驗證、行級安全性、多租戶隔離 | 60 分鐘 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | 環境設置 | Docker 配置、Azure CLI、專案初始化 | 45 分鐘 |
| **[04-Database](walkthrough/04-Database/README.md)** | 資料層 | PostgreSQL 架構、pgvector 設置、RLS 策略、範例資料 | 60 分鐘 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | 核心實現 | FastMCP 框架、資料庫整合、工具開發 | 90 分鐘 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | 工具開發 | MCP 工具創建、查詢驗證、商業智能 | 75 分鐘 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI 整合 | Azure OpenAI 嵌入、向量搜尋、混合查詢 | 60 分鐘 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | 品質保證 | 測試策略、調試技術、性能測試 | 75 分鐘 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | 開發體驗 | VS Code 配置、AI 聊天整合、調試工作流 | 45 分鐘 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | 生產部署 | 容器化、Azure 容器應用、CI/CD 管道 | 90 分鐘 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | 可觀測性 | 應用洞察、結構化日誌、性能指標 | 60 分鐘 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | 生產卓越 | 安全加固、優化、企業模式 | 45 分鐘 |

### 如何使用學習指南

**📖 用於學習**: `/walkthrough` 模塊提供逐步指導，並解釋每個元件的設計原因。從模塊 00 開始，按順序進行。

**🔧 用於實現**: 此 Sample_Walkthrough.md 提供技術深入解析和代碼拆解，適合希望快速了解完整實現的開發者。

**🚀 用於生產**: 模塊 02、10、11 和 12 專注於生產部署、安全性和監控考量。

**📚 完整學習路徑**: 訪問 **[/walkthrough/README.md](walkthrough/README.md)** 獲取完整學習指南概述，包含詳細的學習目標和前置條件。

---

## 架構深入解析

### 高層架構

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

### 核心元件

#### 1. **MCP 伺服器 (`sales_analysis.py`)**
- **FastMCP 框架**: 處理 HTTP/SSE 協議通信
- **工具註冊**: 提供資料庫查詢和架構工具
- **請求上下文**: 管理 RLS 用戶身份識別
- **錯誤處理**: 強大的錯誤管理和日誌記錄

#### 2. **資料庫層 (`sales_analysis_postgres.py`)**
- **連接池管理**: 高效的 asyncpg 連接管理
- **架構提供者**: 動態表架構發現
- **查詢執行**: 使用 RLS 的安全 SQL 執行
- **語義搜尋**: 使用 pgvector 進行向量相似性搜尋

#### 3. **配置管理 (`config.py`)**
- **環境變數**: 集中化配置管理
- **連接參數**: 資料庫和 Azure 服務配置
- **驗證**: 必需環境變數的驗證

#### 4. **基礎架構 (`infra/`)**
- **Bicep 模板**: 宣告式 Azure 資源配置
- **模型部署**: 自動化 AI 模型部署
- **角色分配**: 安全角色配置

### 資料流

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## 建置解決方案

### 第一步：專案結構設置

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

### 第二步：核心依賴項

**Python 需求:**
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

**系統需求:**
- 用於容器化的 Docker Desktop
- 用於部署的 Azure CLI
- 支援 pgvector 擴展的 PostgreSQL
- 配備 AI 擴展的 VS Code

### 第三步：資料庫架構設計

此範例使用零售資料庫，包含以下關鍵表：

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

**行級安全性 (RLS) 實現:**
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

## 元件拆解

### MCP 伺服器核心 (`sales_analysis.py`)

#### 工具註冊模式
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

**主要功能:**
- **類型註解**: 使用 Pydantic 字段描述以便 AI 理解
- **上下文提取**: 從 HTTP 標頭中提取用戶身份
- **錯誤處理**: 提供有用信息的優雅失敗
- **日誌記錄**: 全面的操作日誌記錄

#### 請求上下文管理
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### 資料庫層 (`sales_analysis_postgres.py`)

#### 連接池管理
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

**設計模式:**
- **資源管理**: 正確的池生命周期管理
- **性能調整**: 優化 PostgreSQL 設置
- **錯誤恢復**: 連接重試和回退邏輯
- **安全性**: 每個連接設置 RLS 上下文

#### 架構內省
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

### 語義搜尋整合

#### 嵌入生成
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

#### 向量相似性搜尋
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

## 部署指南

### Azure 基礎架構部署

#### 1. **Bicep 模板結構**

**主模板 (`main.bicep`):**
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

#### 2. **部署自動化**

**PowerShell 部署 (`deploy.ps1`):**
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

### 本地開發設置

#### 1. **Docker Compose 配置**
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

#### 2. **資料庫初始化**
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

## 使用解決方案

### VS Code 整合

#### 1. **MCP 配置 (`.vscode/mcp.json`)**
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

#### 2. **查詢範例**

**架構發現:**
```
AI: #zava What tables are available in the database?
```
*MCP 伺服器使用 `get_multiple_table_schemas` 返回表結構*

**銷售分析:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*生成具有正確連接和日期篩選的 SQL*

**語義搜尋:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*使用嵌入查找語義相似的產品*

**多商店分析:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS 確保僅訪問西雅圖商店的數據*

### 進階查詢模式

#### 1. **時間序列分析**
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

#### 2. **產品表現與分類**
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

## 進階功能

### 行級安全性實現

#### 1. **策略創建**
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

#### 2. **MCP 伺服器中的上下文設置**
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

### 語義搜尋深入解析

#### 1. **嵌入管道**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **相似性搜尋優化**
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

### 監控與可觀測性

#### 1. **Azure 應用洞察整合**
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

#### 2. **自定義指標與日誌**
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

## 故障排除

### 常見問題與解決方案

#### 1. **資料庫連接問題**
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

**常見修復:**
- 驗證 PostgreSQL 是否正在運行: `docker ps`
- 檢查 `.env` 中的連接參數
- 驗證資料庫是否存在: `docker exec -it pg17 psql -U postgres -l`
- 測試網絡連接: `telnet localhost 5432`

#### 2. **RLS 策略問題**
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

#### 3. **嵌入服務問題**
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

### 性能優化

#### 1. **連接池調整**
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

#### 2. **查詢優化**
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

## 最佳實踐

### 安全性最佳實踐

#### 1. **環境變數管理**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS 實施指南**
- **默認拒絕**: 從限制性策略開始
- **定期審核**: 監控策略有效性
- **徹底測試**: 驗證訪問模式
- **文檔化策略**: 維護清晰的文檔

#### 3. **網絡安全**
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

### 開發最佳實踐

#### 1. **錯誤處理模式**
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

#### 2. **測試策略**
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

#### 3. **監控與警報**
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

### 部署最佳實踐

#### 1. **基礎架構即代碼**
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

#### 2. **CI/CD 管道整合**
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

此完整指南提供了建置、部署和運行具有 PostgreSQL 整合的生產級 MCP 伺服器的基礎。此處展示的模式和實踐可擴展至其他領域和使用案例，同時保持安全性、性能和可維護性。

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。