<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T21:16:39+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "th"
}
-->
# MCP Server และ PostgreSQL ตัวอย่าง - คู่มือฉบับสมบูรณ์

## สารบัญ
1. [ภาพรวม](../..)
2. [เจาะลึกสถาปัตยกรรม](../..)
3. [การสร้างโซลูชัน](../..)
4. [การแยกส่วนประกอบ](../..)
5. [คู่มือการปรับใช้](../..)
6. [การใช้งานโซลูชัน](../..)
7. [ฟีเจอร์ขั้นสูง](../..)
8. [การแก้ไขปัญหา](../..)
9. [แนวทางปฏิบัติที่ดีที่สุด](../..)

## ภาพรวม

คู่มือนี้อธิบายวิธีการสร้างและใช้งาน **Model Context Protocol (MCP) server** ที่พร้อมใช้งานในระดับการผลิต ซึ่งผสานรวมกับ PostgreSQL และบริการ Azure AI ตัวอย่างนี้แสดงรูปแบบระดับองค์กร เช่น การรักษาความปลอดภัยระดับแถว (Row Level Security), การค้นหาเชิงความหมาย และการเข้าถึงข้อมูลแบบหลายผู้เช่า

### สิ่งที่คุณจะได้เรียนรู้
- วิธีการออกแบบ MCP server พร้อมการผสานรวมฐานข้อมูล
- การใช้ Row Level Security สำหรับสถานการณ์แบบหลายผู้เช่า
- การสร้างการค้นหาเชิงความหมายด้วย Azure OpenAI embeddings
- การสร้างสภาพแวดล้อมการพัฒนาบน Docker
- การปรับใช้โครงสร้างพื้นฐาน Azure ด้วย Bicep templates
- การผสานรวมกับ VS Code สำหรับการวิเคราะห์ที่ขับเคลื่อนด้วย AI

### เทคโนโลยีที่ใช้
- **MCP Protocol**: โปรโตคอล Model Context สำหรับการผสานรวมเครื่องมือ AI
- **FastMCP**: เฟรมเวิร์ก MCP server บน Python ที่ทันสมัย
- **PostgreSQL**: ฐานข้อมูลพร้อมส่วนขยาย pgvector สำหรับการค้นหาเชิงความหมาย
- **Azure OpenAI**: การสร้าง embeddings ข้อความและโมเดล GPT (ตัวเลือกเสริม)
- **Docker**: การสร้างคอนเทนเนอร์เพื่อความสม่ำเสมอของสภาพแวดล้อม
- **Bicep**: โครงสร้างพื้นฐานเป็นโค้ดสำหรับทรัพยากร Azure
- **VS Code**: สภาพแวดล้อมการพัฒนาพร้อมการผสานรวม MCP

## 📚 คู่มือการเรียนรู้แบบมีโครงสร้าง: /walkthrough

นอกเหนือจากคู่มือทางเทคนิคนี้แล้ว โครงการนี้ยังมี **คู่มือการเรียนรู้แบบ 12 โมดูล** ที่ครอบคลุม ซึ่งอยู่ในไดเรกทอรี `/walkthrough` วิธีการแบบมีโครงสร้างนี้ช่วยแบ่งการดำเนินการที่ซับซ้อนออกเป็นโมดูลการเรียนรู้ที่เข้าใจง่าย เหมาะสำหรับนักพัฒนาที่ต้องการเข้าใจแต่ละส่วนประกอบทีละขั้นตอน

### ภาพรวมของโมดูลการเรียนรู้

| โมดูล | หัวข้อ | เนื้อหา | ระยะเวลา |
|-------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | พื้นฐาน MCP | แนวคิดหลัก, กรณีศึกษา Zava Retail, ภาพรวมสถาปัตยกรรม | 30 นาที |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | การออกแบบระบบ | สถาปัตยกรรมทางเทคนิค, รูปแบบการออกแบบ, ความสัมพันธ์ของส่วนประกอบ | 45 นาที |
| **[02-Security](walkthrough/02-Security/README.md)** | ความปลอดภัยระดับองค์กร | การรับรองความถูกต้องของ Azure, Row Level Security, การแยกผู้เช่า | 60 นาที |
| **[03-Setup](walkthrough/03-Setup/README.md)** | การตั้งค่าสภาพแวดล้อม | การกำหนดค่า Docker, Azure CLI, การเริ่มต้นโครงการ | 45 นาที |
| **[04-Database](walkthrough/04-Database/README.md)** | ชั้นข้อมูล | โครงสร้าง PostgreSQL, การตั้งค่า pgvector, นโยบาย RLS, ข้อมูลตัวอย่าง | 60 นาที |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | การดำเนินการหลัก | เฟรมเวิร์ก FastMCP, การผสานรวมฐานข้อมูล, การพัฒนาเครื่องมือ | 90 นาที |
| **[06-Tools](walkthrough/06-Tools/README.md)** | การพัฒนาเครื่องมือ | การสร้างเครื่องมือ MCP, การตรวจสอบคำสั่ง, การวิเคราะห์ธุรกิจ | 75 นาที |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | การผสานรวม AI | Azure OpenAI embeddings, การค้นหาเวกเตอร์, คำสั่งแบบไฮบริด | 60 นาที |
| **[08-Testing](walkthrough/08-Testing/README.md)** | การประกันคุณภาพ | กลยุทธ์การทดสอบ, เทคนิคการดีบัก, การทดสอบประสิทธิภาพ | 75 นาที |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ประสบการณ์การพัฒนา | การกำหนดค่า VS Code, การผสานรวม AI Chat, เวิร์กโฟลว์การดีบัก | 45 นาที |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | การปรับใช้ในระดับการผลิต | การสร้างคอนเทนเนอร์, Azure Container Apps, CI/CD pipelines | 90 นาที |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | การสังเกตการณ์ | Application Insights, การบันทึกแบบมีโครงสร้าง, เมตริกประสิทธิภาพ | 60 นาที |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | ความเป็นเลิศในระดับการผลิต | การเพิ่มความปลอดภัย, การปรับแต่ง, รูปแบบระดับองค์กร | 45 นาที |

### วิธีการใช้คู่มือการเรียนรู้

**📖 สำหรับการเรียนรู้**: โมดูล `/walkthrough` ให้คำแนะนำทีละขั้นตอนพร้อมคำอธิบายว่าทำไมแต่ละส่วนประกอบจึงถูกออกแบบในลักษณะนั้น เริ่มต้นที่โมดูล 00 และดำเนินการตามลำดับ

**🔧 สำหรับการดำเนินการ**: ไฟล์ Sample_Walkthrough.md นี้ให้การเจาะลึกทางเทคนิคและการแยกโค้ดสำหรับนักพัฒนาที่ต้องการเข้าใจการดำเนินการทั้งหมดอย่างรวดเร็ว

**🚀 สำหรับการผลิต**: โมดูล 02, 10, 11 และ 12 มุ่งเน้นเฉพาะการปรับใช้ในระดับการผลิต ความปลอดภัย และการพิจารณาการสังเกตการณ์

**📚 เส้นทางการเรียนรู้ครบถ้วน**: เยี่ยมชม **[/walkthrough/README.md](walkthrough/README.md)** เพื่อดูภาพรวมของคู่มือการเรียนรู้ทั้งหมดพร้อมวัตถุประสงค์การเรียนรู้และข้อกำหนดเบื้องต้น

---

## เจาะลึกสถาปัตยกรรม

### สถาปัตยกรรมระดับสูง

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

### ส่วนประกอบหลัก

#### 1. **MCP Server (`sales_analysis.py`)**
- **FastMCP Framework**: จัดการการสื่อสาร HTTP/SSE protocol
- **Tool Registration**: เปิดเผยเครื่องมือคำสั่งฐานข้อมูลและโครงสร้าง
- **Request Context**: จัดการการระบุผู้ใช้ RLS
- **Error Handling**: การจัดการข้อผิดพลาดที่แข็งแกร่งและการบันทึก

#### 2. **Database Layer (`sales_analysis_postgres.py`)**
- **Connection Pooling**: การจัดการการเชื่อมต่อ asyncpg อย่างมีประสิทธิภาพ
- **Schema Provider**: การค้นพบโครงสร้างตารางแบบไดนามิก
- **Query Execution**: การดำเนินการ SQL อย่างปลอดภัยด้วย RLS
- **Semantic Search**: การค้นหาความคล้ายคลึงของเวกเตอร์ด้วย pgvector

#### 3. **Configuration Management (`config.py`)**
- **Environment Variables**: การจัดการการกำหนดค่ากลาง
- **Connection Parameters**: การกำหนดค่าฐานข้อมูลและบริการ Azure
- **Validation**: การตรวจสอบตัวแปรสภาพแวดล้อมที่จำเป็น

#### 4. **Infrastructure (`infra/`)**
- **Bicep Templates**: การจัดเตรียมทรัพยากร Azure แบบประกาศ
- **Model Deployment**: การปรับใช้โมเดล AI อัตโนมัติ
- **Role Assignments**: การกำหนดบทบาทความปลอดภัย

### การไหลของข้อมูล

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## การสร้างโซลูชัน

### ขั้นตอนที่ 1: การตั้งค่าโครงสร้างโครงการ

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

### ขั้นตอนที่ 2: การพึ่งพาหลัก

**ข้อกำหนด Python:**
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

**ข้อกำหนดระบบ:**
- Docker Desktop สำหรับการสร้างคอนเทนเนอร์
- Azure CLI สำหรับการปรับใช้
- PostgreSQL พร้อมส่วนขยาย pgvector
- VS Code พร้อมส่วนขยาย AI

### ขั้นตอนที่ 3: การออกแบบโครงสร้างฐานข้อมูล

ตัวอย่างนี้ใช้ฐานข้อมูลค้าปลีกที่มีตารางสำคัญดังนี้:

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

**การดำเนินการ Row Level Security (RLS):**
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

## การแยกส่วนประกอบ

### MCP Server Core (`sales_analysis.py`)

#### รูปแบบการลงทะเบียนเครื่องมือ
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

**คุณสมบัติสำคัญ:**
- **Type Annotations**: คำอธิบายฟิลด์ Pydantic สำหรับการทำความเข้าใจ AI
- **Context Extraction**: การระบุผู้ใช้จาก HTTP headers
- **Error Handling**: การจัดการข้อผิดพลาดอย่างสง่างามพร้อมข้อความที่ให้ข้อมูล
- **Logging**: การบันทึกการดำเนินการอย่างครอบคลุม

#### การจัดการบริบทคำขอ
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### ชั้นฐานข้อมูล (`sales_analysis_postgres.py`)

#### การจัดการ Connection Pool
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

**รูปแบบการออกแบบ:**
- **การจัดการทรัพยากร**: การจัดการวงจรชีวิตของพูลอย่างเหมาะสม
- **การปรับแต่งประสิทธิภาพ**: การตั้งค่า PostgreSQL ที่ปรับแต่ง
- **การกู้คืนข้อผิดพลาด**: การลองเชื่อมต่อใหม่และตรรกะสำรอง
- **ความปลอดภัย**: การตั้งค่าบริบท RLS ต่อการเชื่อมต่อ

#### การตรวจสอบโครงสร้าง
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

### การผสานรวมการค้นหาเชิงความหมาย

#### การสร้าง Embedding
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

#### การค้นหาความคล้ายคลึงของเวกเตอร์
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

## คู่มือการปรับใช้

### การปรับใช้โครงสร้างพื้นฐาน Azure

#### 1. **โครงสร้าง Bicep Template**

**Main Template (`main.bicep`):**
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

#### 2. **การปรับใช้อัตโนมัติ**

**PowerShell Deployment (`deploy.ps1`):**
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

### การตั้งค่าการพัฒนาในเครื่อง

#### 1. **การกำหนดค่า Docker Compose**
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

#### 2. **การเริ่มต้นฐานข้อมูล**
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

## การใช้งานโซลูชัน

### การผสานรวม VS Code

#### 1. **การกำหนดค่า MCP (`.vscode/mcp.json`)**
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

#### 2. **ตัวอย่างคำสั่ง**

**การค้นพบโครงสร้าง:**
```
AI: #zava What tables are available in the database?
```
*MCP server ใช้ `get_multiple_table_schemas` เพื่อส่งคืนโครงสร้างตาราง*

**การวิเคราะห์ยอดขาย:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*สร้าง SQL พร้อมการเชื่อมโยงและการกรองวันที่ที่เหมาะสม*

**การค้นหาเชิงความหมาย:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*ใช้ embeddings เพื่อค้นหาผลิตภัณฑ์ที่คล้ายคลึงกันในเชิงความหมาย*

**การวิเคราะห์หลายร้านค้า:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS รับรองว่ามีการเข้าถึงข้อมูลเฉพาะร้านค้า Seattle*

### รูปแบบคำสั่งขั้นสูง

#### 1. **การวิเคราะห์แบบ Time-Series**
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

#### 2. **ประสิทธิภาพผลิตภัณฑ์พร้อมหมวดหมู่**
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

## ฟีเจอร์ขั้นสูง

### การดำเนินการ Row Level Security

#### 1. **การสร้างนโยบาย**
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

#### 2. **การตั้งค่าบริบทใน MCP Server**
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

### การค้นหาเชิงความหมายเชิงลึก

#### 1. **กระบวนการสร้าง Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **การปรับแต่งการค้นหาความคล้ายคลึง**
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

### การสังเกตการณ์และการตรวจสอบ

#### 1. **การผสานรวม Azure Application Insights**
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

#### 2. **เมตริกและการบันทึกแบบกำหนดเอง**
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

## การแก้ไขปัญหา

### ปัญหาทั่วไปและวิธีแก้ไข

#### 1. **ปัญหาการเชื่อมต่อฐานข้อมูล**
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

**วิธีแก้ไขทั่วไป:**
- ตรวจสอบว่า PostgreSQL กำลังทำงาน: `docker ps`
- ตรวจสอบพารามิเตอร์การเชื่อมต่อใน `.env`
- ตรวจสอบว่าฐานข้อมูลมีอยู่: `docker exec -it pg17 psql -U postgres -l`
- ทดสอบการเชื่อมต่อเครือข่าย: `telnet localhost 5432`

#### 2. **ปัญหานโยบาย RLS**
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

#### 3. **ปัญหาบริการ Embedding**
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

### การปรับแต่งประสิทธิภาพ

#### 1. **การปรับแต่ง Connection Pool**
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

#### 2. **การปรับแต่งคำสั่ง**
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

## แนวทางปฏิบัติที่ดีที่สุด

### แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย

#### 1. **การจัดการตัวแปรสภาพแวดล้อม**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **แนวทางการดำเนินการ RLS**
- **Default Deny**: เริ่มต้นด้วยนโยบายที่จำกัด
- **Audit Regularly**: ตรวจสอบประสิทธิภาพของนโยบาย
- **Test Thoroughly**: ตรวจสอบรูปแบบการเข้าถึง
- **Document Policies**: รักษาเอกสารนโยบายให้ชัดเจน

#### 3. **ความปลอดภัยเครือข่าย**
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

### แนวทางปฏิบัติที่ดีที่สุดด้านการพัฒนา

#### 1. **รูปแบบการจัดการข้อผิดพลาด**
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

#### 2. **กลยุทธ์การทดสอบ**
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

#### 3. **การตรวจสอบและการแจ้งเตือน**
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

### แนวทางปฏิบัติที่ดีที่สุดด้านการปรับใช้

#### 1. **โครงสร้างพื้นฐานเป็นโค้ด**
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

#### 2. **การผสานรวม CI/CD Pipeline**
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

คู่มือฉบับสมบูรณ์นี้ให้พื้นฐานสำหรับการสร้าง การปรับใช้ และการดำเนินการ MCP server ที่พร้อมใช้งานในระดับการผลิตพร้อมการผสานรวม PostgreSQL รูปแบบและแนวทางปฏิบัติที่แสดงในที่นี้สามารถขยายไปยังโดเมนและกรณีการใช้งานอื่น ๆ ได้ ในขณะที่ยังคงรักษาความปลอดภัย ประสิทธิภาพ และความสามารถในการดูแลรักษา

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้