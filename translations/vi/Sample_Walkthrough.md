<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T22:15:07+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "vi"
}
-->
# MCP Server và PostgreSQL Mẫu - Hướng dẫn Hoàn chỉnh

## Mục lục
1. [Tổng quan](../..)
2. [Phân tích Kiến trúc](../..)
3. [Xây dựng Giải pháp](../..)
4. [Phân tích Thành phần](../..)
5. [Hướng dẫn Triển khai](../..)
6. [Sử dụng Giải pháp](../..)
7. [Tính năng Nâng cao](../..)
8. [Khắc phục sự cố](../..)
9. [Thực hành Tốt nhất](../..)

## Tổng quan

Hướng dẫn này phân tích cách xây dựng và sử dụng một **máy chủ Model Context Protocol (MCP)** sẵn sàng cho sản xuất, tích hợp với PostgreSQL và các dịch vụ Azure AI. Mẫu này trình bày các mô hình cấp doanh nghiệp bao gồm Bảo mật Cấp Dòng (Row Level Security), tìm kiếm ngữ nghĩa, và truy cập dữ liệu đa người thuê.

### Những gì bạn sẽ học
- Cách thiết kế một máy chủ MCP với tích hợp cơ sở dữ liệu
- Triển khai Bảo mật Cấp Dòng cho các kịch bản đa người thuê
- Xây dựng tìm kiếm ngữ nghĩa với embeddings của Azure OpenAI
- Tạo môi trường phát triển dựa trên Docker
- Triển khai hạ tầng Azure với các mẫu Bicep
- Tích hợp với VS Code để phân tích dữ liệu hỗ trợ AI

### Công nghệ sử dụng
- **MCP Protocol**: Giao thức Model Context Protocol cho tích hợp công cụ AI
- **FastMCP**: Framework MCP hiện đại bằng Python
- **PostgreSQL**: Cơ sở dữ liệu với tiện ích mở rộng pgvector cho tìm kiếm ngữ nghĩa
- **Azure OpenAI**: Embeddings văn bản và các mô hình GPT tùy chọn
- **Docker**: Container hóa để đảm bảo môi trường nhất quán
- **Bicep**: Infrastructure as Code cho tài nguyên Azure
- **VS Code**: Môi trường phát triển với tích hợp MCP

## 📚 Hướng dẫn Học tập Có cấu trúc: /walkthrough

Ngoài hướng dẫn kỹ thuật này, kho lưu trữ này bao gồm một **hướng dẫn học tập 12 module toàn diện** nằm trong thư mục `/walkthrough`. Cách tiếp cận có cấu trúc này chia nhỏ việc triển khai phức tạp thành các module học tập dễ hiểu, hoàn hảo cho các nhà phát triển muốn hiểu từng thành phần từng bước.

### Tổng quan về các Module Học tập

| Module | Chủ đề | Trọng tâm | Thời lượng |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP Cơ bản | Các khái niệm cốt lõi, nghiên cứu trường hợp Zava Retail, tổng quan kiến trúc | 30 phút |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Thiết kế Hệ thống | Kiến trúc kỹ thuật, mô hình thiết kế, mối quan hệ thành phần | 45 phút |
| **[02-Security](walkthrough/02-Security/README.md)** | Bảo mật Doanh nghiệp | Xác thực Azure, Bảo mật Cấp Dòng, cách ly đa người thuê | 60 phút |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Thiết lập Môi trường | Cấu hình Docker, Azure CLI, khởi tạo dự án | 45 phút |
| **[04-Database](walkthrough/04-Database/README.md)** | Lớp Dữ liệu | Schema PostgreSQL, thiết lập pgvector, chính sách RLS, dữ liệu mẫu | 60 phút |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Triển khai Cốt lõi | Framework FastMCP, tích hợp cơ sở dữ liệu, phát triển công cụ | 90 phút |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Phát triển Công cụ | Tạo công cụ MCP, xác thực truy vấn, trí tuệ kinh doanh | 75 phút |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Tích hợp AI | Embeddings Azure OpenAI, tìm kiếm vector, truy vấn kết hợp | 60 phút |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Đảm bảo Chất lượng | Chiến lược kiểm thử, kỹ thuật gỡ lỗi, kiểm thử hiệu năng | 75 phút |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Trải nghiệm Phát triển | Cấu hình VS Code, tích hợp AI Chat, quy trình gỡ lỗi | 45 phút |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Triển khai Sản xuất | Container hóa, Azure Container Apps, pipeline CI/CD | 90 phút |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Khả năng Quan sát | Application Insights, logging có cấu trúc, các chỉ số hiệu năng | 60 phút |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Xuất sắc trong Sản xuất | Tăng cường bảo mật, tối ưu hóa, mô hình doanh nghiệp | 45 phút |

### Cách sử dụng Hướng dẫn Học tập

**📖 Để Học tập**: Các module `/walkthrough` cung cấp hướng dẫn từng bước với giải thích lý do tại sao mỗi thành phần được thiết kế theo cách đó. Bắt đầu với Module 00 và tiến hành tuần tự.

**🔧 Để Triển khai**: Tệp Sample_Walkthrough.md cung cấp phân tích kỹ thuật và mã cho các nhà phát triển muốn hiểu nhanh toàn bộ triển khai.

**🚀 Để Sản xuất**: Các module 02, 10, 11, và 12 tập trung cụ thể vào triển khai sẵn sàng sản xuất, bảo mật, và các cân nhắc giám sát.

**📚 Lộ trình Học tập Hoàn chỉnh**: Truy cập **[/walkthrough/README.md](walkthrough/README.md)** để xem tổng quan hướng dẫn học tập đầy đủ với các mục tiêu học tập chi tiết và yêu cầu trước.

---

## Phân tích Kiến trúc

### Kiến trúc Tổng quan

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

### Thành phần Cốt lõi

#### 1. **Máy chủ MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Xử lý giao tiếp HTTP/SSE protocol
- **Đăng ký Công cụ**: Cung cấp công cụ truy vấn cơ sở dữ liệu và schema
- **Ngữ cảnh Yêu cầu**: Quản lý nhận dạng người dùng RLS
- **Xử lý Lỗi**: Quản lý lỗi mạnh mẽ và logging

#### 2. **Lớp Cơ sở dữ liệu (`sales_analysis_postgres.py`)**
- **Quản lý Kết nối**: Quản lý kết nối asyncpg hiệu quả
- **Cung cấp Schema**: Khám phá schema bảng động
- **Thực thi Truy vấn**: Thực thi SQL an toàn với RLS
- **Tìm kiếm Ngữ nghĩa**: Tìm kiếm tương đồng vector với pgvector

#### 3. **Quản lý Cấu hình (`config.py`)**
- **Biến Môi trường**: Quản lý cấu hình tập trung
- **Tham số Kết nối**: Cấu hình cơ sở dữ liệu và dịch vụ Azure
- **Xác thực**: Xác thực biến môi trường bắt buộc

#### 4. **Hạ tầng (`infra/`)**
- **Mẫu Bicep**: Cung cấp tài nguyên Azure theo cách khai báo
- **Triển khai Mô hình**: Triển khai mô hình AI tự động
- **Phân quyền Vai trò**: Cấu hình vai trò bảo mật

### Luồng Dữ liệu

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Xây dựng Giải pháp

### Bước 1: Thiết lập Cấu trúc Dự án

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

### Bước 2: Các Phụ thuộc Cốt lõi

**Yêu cầu Python:**
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

**Yêu cầu Hệ thống:**
- Docker Desktop để container hóa
- Azure CLI để triển khai
- PostgreSQL với tiện ích mở rộng pgvector
- VS Code với các tiện ích mở rộng AI

### Bước 3: Thiết kế Schema Cơ sở dữ liệu

Mẫu sử dụng cơ sở dữ liệu bán lẻ với các bảng chính sau:

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

**Triển khai Bảo mật Cấp Dòng (RLS):**
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

## Phân tích Thành phần

### Lõi Máy chủ MCP (`sales_analysis.py`)

#### Mô hình Đăng ký Công cụ
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

**Các Tính năng Chính:**
- **Chú thích Kiểu**: Mô tả trường Pydantic để AI hiểu
- **Trích xuất Ngữ cảnh**: Nhận dạng người dùng từ HTTP headers
- **Xử lý Lỗi**: Xử lý lỗi nhẹ nhàng với thông báo thông tin
- **Logging**: Logging hoạt động toàn diện

#### Quản lý Ngữ cảnh Yêu cầu
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Lớp Cơ sở dữ liệu (`sales_analysis_postgres.py`)

#### Quản lý Kết nối Pool
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

**Mô hình Thiết kế:**
- **Quản lý Tài nguyên**: Quản lý vòng đời pool đúng cách
- **Tối ưu Hiệu năng**: Cài đặt PostgreSQL tối ưu
- **Khôi phục Lỗi**: Kết nối lại và logic dự phòng
- **Bảo mật**: Thiết lập ngữ cảnh RLS cho mỗi kết nối

#### Khám phá Schema
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

### Tích hợp Tìm kiếm Ngữ nghĩa

#### Tạo Embedding
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

#### Tìm kiếm Tương đồng Vector
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

## Hướng dẫn Triển khai

### Triển khai Hạ tầng Azure

#### 1. **Cấu trúc Mẫu Bicep**

**Mẫu Chính (`main.bicep`):**
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

#### 2. **Tự động hóa Triển khai**

**Triển khai PowerShell (`deploy.ps1`):**
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

### Thiết lập Phát triển Cục bộ

#### 1. **Cấu hình Docker Compose**
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

#### 2. **Khởi tạo Cơ sở dữ liệu**
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

## Sử dụng Giải pháp

### Tích hợp VS Code

#### 1. **Cấu hình MCP (`.vscode/mcp.json`)**
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

#### 2. **Ví dụ về Truy vấn**

**Khám phá Schema:**
```
AI: #zava What tables are available in the database?
```
*Máy chủ MCP sử dụng `get_multiple_table_schemas` để trả về cấu trúc bảng*

**Phân tích Bán hàng:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Tạo SQL với các phép nối và lọc ngày chính xác*

**Tìm kiếm Ngữ nghĩa:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Sử dụng embeddings để tìm các sản phẩm tương đồng ngữ nghĩa*

**Phân tích Đa Cửa hàng:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS đảm bảo chỉ truy cập dữ liệu cửa hàng Seattle*

### Mô hình Truy vấn Nâng cao

#### 1. **Phân tích Chuỗi Thời gian**
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

#### 2. **Hiệu suất Sản phẩm với Danh mục**
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

## Tính năng Nâng cao

### Triển khai Bảo mật Cấp Dòng

#### 1. **Tạo Chính sách**
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

#### 2. **Thiết lập Ngữ cảnh trong Máy chủ MCP**
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

### Phân tích Sâu Tìm kiếm Ngữ nghĩa

#### 1. **Pipeline Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Tối ưu hóa Tìm kiếm Tương đồng**
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

### Giám sát và Khả năng Quan sát

#### 1. **Tích hợp Azure Application Insights**
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

#### 2. **Logging và Chỉ số Tùy chỉnh**
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

## Khắc phục sự cố

### Các Vấn đề Thường gặp và Giải pháp

#### 1. **Vấn đề Kết nối Cơ sở dữ liệu**
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

**Các Cách Khắc phục Thường gặp:**
- Xác minh PostgreSQL đang chạy: `docker ps`
- Kiểm tra tham số kết nối trong `.env`
- Xác thực cơ sở dữ liệu tồn tại: `docker exec -it pg17 psql -U postgres -l`
- Kiểm tra kết nối mạng: `telnet localhost 5432`

#### 2. **Vấn đề Chính sách RLS**
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

#### 3. **Vấn đề Dịch vụ Embedding**
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

### Tối ưu hóa Hiệu năng

#### 1. **Điều chỉnh Pool Kết nối**
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

#### 2. **Tối ưu hóa Truy vấn**
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

## Thực hành Tốt nhất

### Thực hành Tốt nhất về Bảo mật

#### 1. **Quản lý Biến Môi trường**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Hướng dẫn Triển khai RLS**
- **Mặc định Từ chối**: Bắt đầu với các chính sách hạn chế
- **Kiểm tra Thường xuyên**: Giám sát hiệu quả chính sách
- **Kiểm tra Kỹ lưỡng**: Xác thực các mô hình truy cập
- **Tài liệu Chính sách**: Duy trì tài liệu rõ ràng

#### 3. **Bảo mật Mạng**
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

### Thực hành Tốt nhất về Phát triển

#### 1. **Mô hình Xử lý Lỗi**
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

#### 2. **Chiến lược Kiểm thử**
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

#### 3. **Giám sát và Cảnh báo**
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

### Thực hành Tốt nhất về Triển khai

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

#### 2. **Tích hợp Pipeline CI/CD**
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

Hướng dẫn toàn diện này cung cấp nền tảng để xây dựng, triển khai, và vận hành một máy chủ MCP sẵn sàng sản xuất với tích hợp PostgreSQL. Các mô hình và thực hành được trình bày ở đây có thể được mở rộng sang các lĩnh vực và trường hợp sử dụng khác trong khi vẫn duy trì bảo mật, hiệu năng, và khả năng bảo trì.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.