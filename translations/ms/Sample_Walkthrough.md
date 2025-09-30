<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T22:43:43+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ms"
}
-->
# Contoh Pelayan MCP dan PostgreSQL - Panduan Lengkap

## Kandungan
1. [Pengenalan](../..)
2. [Penerangan Mendalam Seni Bina](../..)
3. [Membina Penyelesaian](../..)
4. [Pecahan Komponen](../..)
5. [Panduan Penggunaan](../..)
6. [Menggunakan Penyelesaian](../..)
7. [Ciri Lanjutan](../..)
8. [Penyelesaian Masalah](../..)
9. [Amalan Terbaik](../..)

## Pengenalan

Panduan ini menerangkan cara membina dan menggunakan **pelayan Model Context Protocol (MCP)** yang bersedia untuk pengeluaran, yang berintegrasi dengan PostgreSQL dan perkhidmatan Azure AI. Contoh ini menunjukkan corak peringkat perusahaan termasuk Keselamatan Tahap Baris, carian semantik, dan akses data berbilang penyewa.

### Apa yang Anda Akan Pelajari
- Cara mereka bentuk pelayan MCP dengan integrasi pangkalan data
- Melaksanakan Keselamatan Tahap Baris untuk senario berbilang penyewa
- Membina carian semantik dengan embedding Azure OpenAI
- Mewujudkan persekitaran pembangunan berasaskan Docker
- Melaksanakan infrastruktur Azure dengan templat Bicep
- Mengintegrasikan dengan VS Code untuk analitik berkuasa AI

### Teknologi Yang Digunakan
- **Protokol MCP**: Protokol Model Context untuk integrasi alat AI
- **FastMCP**: Rangka kerja pelayan MCP moden berasaskan Python
- **PostgreSQL**: Pangkalan data dengan sambungan pgvector untuk carian semantik
- **Azure OpenAI**: Embedding teks dan model GPT pilihan
- **Docker**: Pengkontenaan untuk persekitaran yang konsisten
- **Bicep**: Infrastruktur sebagai Kod untuk sumber Azure
- **VS Code**: Persekitaran pembangunan dengan integrasi MCP

## 📚 Panduan Pembelajaran Berstruktur: /walkthrough

Selain daripada panduan teknikal ini, repositori ini termasuk **panduan pembelajaran 12 modul** yang terletak dalam direktori `/walkthrough`. Pendekatan berstruktur ini memecahkan pelaksanaan kompleks kepada modul pembelajaran yang mudah difahami, sesuai untuk pembangun yang ingin memahami setiap komponen secara berperingkat.

### Gambaran Keseluruhan Modul Pembelajaran

| Modul | Topik | Fokus | Tempoh |
|-------|-------|-------|--------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Asas MCP | Konsep utama, kajian kes Zava Retail, gambaran seni bina | 30 min |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Reka Bentuk Sistem | Seni bina teknikal, corak reka bentuk, hubungan komponen | 45 min |
| **[02-Security](walkthrough/02-Security/README.md)** | Keselamatan Perusahaan | Pengesahan Azure, Keselamatan Tahap Baris, pengasingan berbilang penyewa | 60 min |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Persediaan Persekitaran | Konfigurasi Docker, Azure CLI, inisialisasi projek | 45 min |
| **[04-Database](walkthrough/04-Database/README.md)** | Lapisan Data | Skema PostgreSQL, persediaan pgvector, polisi RLS, data contoh | 60 min |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Pelaksanaan Teras | Rangka kerja FastMCP, integrasi pangkalan data, pembangunan alat | 90 min |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Pembangunan Alat | Penciptaan alat MCP, pengesahan pertanyaan, kecerdasan perniagaan | 75 min |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Integrasi AI | Embedding Azure OpenAI, carian vektor, pertanyaan hibrid | 60 min |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Jaminan Kualiti | Strategi ujian, teknik debugging, ujian prestasi | 75 min |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Pengalaman Pembangunan | Konfigurasi VS Code, integrasi AI Chat, aliran kerja debugging | 45 min |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Pelaksanaan Pengeluaran | Pengkontenaan, Azure Container Apps, saluran CI/CD | 90 min |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Pemerhatian | Application Insights, logging berstruktur, metrik prestasi | 60 min |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Kecemerlangan Pengeluaran | Pengukuhan keselamatan, pengoptimuman, corak perusahaan | 45 min |

### Cara Menggunakan Panduan Pembelajaran

**📖 Untuk Pembelajaran**: Modul `/walkthrough` menyediakan arahan langkah demi langkah dengan penjelasan mengapa setiap komponen direka seperti itu. Mulakan dengan Modul 00 dan teruskan secara berurutan.

**🔧 Untuk Pelaksanaan**: Sample_Walkthrough.md ini menyediakan penerangan teknikal mendalam dan pecahan kod untuk pembangun yang ingin memahami pelaksanaan lengkap dengan cepat.

**🚀 Untuk Pengeluaran**: Modul 02, 10, 11, dan 12 memberi tumpuan khusus kepada pelaksanaan pengeluaran, keselamatan, dan pertimbangan pemantauan.

**📚 Laluan Pembelajaran Lengkap**: Lawati **[/walkthrough/README.md](walkthrough/README.md)** untuk gambaran keseluruhan panduan pembelajaran penuh dengan objektif pembelajaran dan prasyarat yang terperinci.

---

## Penerangan Mendalam Seni Bina

### Seni Bina Peringkat Tinggi

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

### Komponen Teras

#### 1. **Pelayan MCP (`sales_analysis.py`)**
- **Rangka Kerja FastMCP**: Mengendalikan komunikasi HTTP/SSE
- **Pendaftaran Alat**: Mendedahkan pertanyaan pangkalan data dan alat skema
- **Konteks Permintaan**: Menguruskan pengenalan pengguna RLS
- **Pengendalian Ralat**: Pengurusan ralat yang kukuh dan logging

#### 2. **Lapisan Pangkalan Data (`sales_analysis_postgres.py`)**
- **Pengurusan Sambungan**: Pengurusan sambungan asyncpg yang cekap
- **Penyedia Skema**: Penemuan skema jadual dinamik
- **Pelaksanaan Pertanyaan**: Pelaksanaan SQL yang selamat dengan RLS
- **Carian Semantik**: Carian kesamaan vektor dengan pgvector

#### 3. **Pengurusan Konfigurasi (`config.py`)**
- **Pembolehubah Persekitaran**: Pengendalian konfigurasi berpusat
- **Parameter Sambungan**: Konfigurasi pangkalan data dan perkhidmatan Azure
- **Pengesahan**: Pengesahan pembolehubah persekitaran yang diperlukan

#### 4. **Infrastruktur (`infra/`)**
- **Templat Bicep**: Penyediaan sumber Azure secara deklaratif
- **Pelaksanaan Model**: Pelaksanaan model AI secara automatik
- **Penugasan Peranan**: Konfigurasi peranan keselamatan

### Aliran Data

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Membina Penyelesaian

### Langkah 1: Persediaan Struktur Projek

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

### Langkah 2: Kebergantungan Teras

**Keperluan Python:**
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

**Keperluan Sistem:**
- Docker Desktop untuk pengkontenaan
- Azure CLI untuk pelaksanaan
- PostgreSQL dengan sambungan pgvector
- VS Code dengan sambungan AI

### Langkah 3: Reka Bentuk Skema Pangkalan Data

Contoh ini menggunakan pangkalan data runcit dengan jadual utama berikut:

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

**Pelaksanaan Keselamatan Tahap Baris (RLS):**
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

## Pecahan Komponen

### Teras Pelayan MCP (`sales_analysis.py`)

#### Corak Pendaftaran Alat
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

**Ciri Utama:**
- **Anotasi Jenis**: Penerangan medan Pydantic untuk pemahaman AI
- **Ekstraksi Konteks**: Identiti pengguna daripada header HTTP
- **Pengendalian Ralat**: Kegagalan yang terurus dengan mesej yang informatif
- **Logging**: Logging operasi yang komprehensif

#### Pengurusan Konteks Permintaan
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Lapisan Pangkalan Data (`sales_analysis_postgres.py`)

#### Pengurusan Pool Sambungan
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

**Corak Reka Bentuk:**
- **Pengurusan Sumber**: Pengurusan kitaran hayat pool yang betul
- **Penalaan Prestasi**: Tetapan PostgreSQL yang dioptimumkan
- **Pemulihan Ralat**: Sambungan semula dan logik fallback
- **Keselamatan**: Penetapan konteks RLS bagi setiap sambungan

#### Introspeksi Skema
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

### Integrasi Carian Semantik

#### Penjanaan Embedding
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

#### Carian Kesamaan Vektor
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

## Panduan Penggunaan

### Pelaksanaan Infrastruktur Azure

#### 1. **Struktur Templat Bicep**

**Templat Utama (`main.bicep`):**
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

#### 2. **Automasi Pelaksanaan**

**Pelaksanaan PowerShell (`deploy.ps1`):**
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

### Persediaan Pembangunan Tempatan

#### 1. **Konfigurasi Docker Compose**
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

#### 2. **Inisialisasi Pangkalan Data**
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

## Menggunakan Penyelesaian

### Integrasi VS Code

#### 1. **Konfigurasi MCP (`.vscode/mcp.json`)**
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

#### 2. **Contoh Pertanyaan**

**Penemuan Skema:**
```
AI: #zava What tables are available in the database?
```
*Pelayan MCP menggunakan `get_multiple_table_schemas` untuk mengembalikan struktur jadual*

**Analisis Jualan:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Menjana SQL dengan gabungan yang betul dan penapisan tarikh*

**Carian Semantik:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Menggunakan embedding untuk mencari produk yang serupa secara semantik*

**Analisis Berbilang Kedai:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS memastikan hanya data kedai Seattle diakses*

### Corak Pertanyaan Lanjutan

#### 1. **Analisis Siri Masa**
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

#### 2. **Prestasi Produk dengan Kategori**
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

## Ciri Lanjutan

### Pelaksanaan Keselamatan Tahap Baris

#### 1. **Penciptaan Polisi**
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

#### 2. **Penetapan Konteks dalam Pelayan MCP**
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

### Penerangan Mendalam Carian Semantik

#### 1. **Aliran Embedding**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Pengoptimuman Carian Kesamaan**
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

### Pemantauan dan Pemerhatian

#### 1. **Integrasi Azure Application Insights**
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

#### 2. **Metrik dan Logging Tersuai**
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

## Penyelesaian Masalah

### Isu dan Penyelesaian Biasa

#### 1. **Isu Sambungan Pangkalan Data**
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

**Penyelesaian Biasa:**
- Sahkan PostgreSQL sedang berjalan: `docker ps`
- Periksa parameter sambungan dalam `.env`
- Sahkan pangkalan data wujud: `docker exec -it pg17 psql -U postgres -l`
- Uji sambungan rangkaian: `telnet localhost 5432`

#### 2. **Isu Polisi RLS**
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

#### 3. **Isu Perkhidmatan Embedding**
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

### Pengoptimuman Prestasi

#### 1. **Penalaan Pool Sambungan**
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

#### 2. **Pengoptimuman Pertanyaan**
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

## Amalan Terbaik

### Amalan Terbaik Keselamatan

#### 1. **Pengurusan Pembolehubah Persekitaran**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Panduan Pelaksanaan RLS**
- **Default Deny**: Mulakan dengan polisi yang ketat
- **Audit Secara Berkala**: Pantau keberkesanan polisi
- **Uji Secara Menyeluruh**: Sahkan corak akses
- **Dokumentasikan Polisi**: Kekalkan dokumentasi yang jelas

#### 3. **Keselamatan Rangkaian**
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

### Amalan Terbaik Pembangunan

#### 1. **Corak Pengendalian Ralat**
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

#### 2. **Strategi Ujian**
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

#### 3. **Pemantauan dan Amaran**
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

### Amalan Terbaik Pelaksanaan

#### 1. **Infrastruktur sebagai Kod**
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

#### 2. **Integrasi Saluran CI/CD**
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

Panduan lengkap ini menyediakan asas untuk membina, melaksanakan, dan mengoperasikan pelayan MCP yang bersedia untuk pengeluaran dengan integrasi PostgreSQL. Corak dan amalan yang ditunjukkan di sini boleh diperluaskan kepada domain dan kes penggunaan lain sambil mengekalkan keselamatan, prestasi, dan kebolehselenggaraan.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.