<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T19:43:54+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "mr"
}
-->
# MCP सर्व्हर आणि PostgreSQL नमुना - संपूर्ण मार्गदर्शन

## विषय सूची
1. [आढावा](../..)
2. [आर्किटेक्चर सखोल विश्लेषण](../..)
3. [समाधान तयार करणे](../..)
4. [घटकांचे विघटन](../..)
5. [तैनाती मार्गदर्शक](../..)
6. [समाधानाचा वापर](../..)
7. [प्रगत वैशिष्ट्ये](../..)
8. [समस्या निवारण](../..)
9. [सर्वोत्तम पद्धती](../..)

## आढावा

हे मार्गदर्शन उत्पादन-तयार **मॉडेल कॉन्टेक्स्ट प्रोटोकॉल (MCP) सर्व्हर** कसे तयार करावे आणि वापरावे याचे विघटन करते, जे PostgreSQL आणि Azure AI सेवांसह समाकलित होते. नमुना एंटरप्राइझ-ग्रेड पॅटर्न्स प्रदर्शित करतो ज्यामध्ये रो लेव्हल सिक्युरिटी, सिमॅंटिक सर्च आणि मल्टी-टेनंट डेटा ऍक्सेस समाविष्ट आहे.

### तुम्ही काय शिकाल
- डेटाबेस समाकलनासह MCP सर्व्हर कसे आर्किटेक्ट करावे
- मल्टी-टेनंट परिस्थितीसाठी रो लेव्हल सिक्युरिटी लागू करणे
- Azure OpenAI एम्बेडिंगसह सिमॅंटिक सर्च तयार करणे
- Docker-आधारित विकास वातावरण तयार करणे
- Bicep टेम्पलेट्ससह Azure पायाभूत सुविधा तैनात करणे
- AI-सक्षम विश्लेषणासाठी VS Code सह समाकलित करणे

### वापरलेली तंत्रज्ञान
- **MCP प्रोटोकॉल**: AI टूल समाकलनासाठी मॉडेल कॉन्टेक्स्ट प्रोटोकॉल
- **FastMCP**: आधुनिक Python MCP सर्व्हर फ्रेमवर्क
- **PostgreSQL**: सिमॅंटिक सर्चसाठी pgvector विस्तारासह डेटाबेस
- **Azure OpenAI**: टेक्स्ट एम्बेडिंग आणि पर्यायी GPT मॉडेल्स
- **Docker**: सुसंगत वातावरणासाठी कंटेनरायझेशन
- **Bicep**: Azure संसाधनांसाठी कोड म्हणून पायाभूत सुविधा
- **VS Code**: MCP समाकलनासह विकास वातावरण

## 📚 संरचित शिक्षण मार्गदर्शक: /walkthrough

या तांत्रिक मार्गदर्शनाशिवाय, या रिपॉझिटरीमध्ये **12-मॉड्यूल शिक्षण मार्गदर्शक** समाविष्ट आहे जो `/walkthrough` निर्देशिकेत स्थित आहे. ही संरचित पद्धत जटिल अंमलबजावणीचे पचण्यायोग्य शिक्षण मॉड्यूल्समध्ये विघटन करते, जे विकसकांसाठी प्रत्येक घटक चरण-दर-चरण समजून घेण्यासाठी योग्य आहे.

### शिक्षण मॉड्यूल्सचा आढावा

| मॉड्यूल | विषय | लक्ष केंद्रित | कालावधी |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP मूलभूत गोष्टी | मुख्य संकल्पना, Zava Retail केस स्टडी, आर्किटेक्चर आढावा | 30 मिनिटे |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | प्रणाली डिझाइन | तांत्रिक आर्किटेक्चर, डिझाइन पॅटर्न्स, घटक संबंध | 45 मिनिटे |
| **[02-Security](walkthrough/02-Security/README.md)** | एंटरप्राइझ सुरक्षा | Azure प्रमाणीकरण, रो लेव्हल सिक्युरिटी, मल्टी-टेनंट वेगळेपणा | 60 मिनिटे |
| **[03-Setup](walkthrough/03-Setup/README.md)** | वातावरण सेटअप | Docker कॉन्फिगरेशन, Azure CLI, प्रकल्प प्रारंभ | 45 मिनिटे |
| **[04-Database](walkthrough/04-Database/README.md)** | डेटा स्तर | PostgreSQL स्कीमा, pgvector सेटअप, RLS धोरणे, नमुना डेटा | 60 मिनिटे |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | मुख्य अंमलबजावणी | FastMCP फ्रेमवर्क, डेटाबेस समाकलन, टूल विकास | 90 मिनिटे |
| **[06-Tools](walkthrough/06-Tools/README.md)** | टूल विकास | MCP टूल तयार करणे, क्वेरी पडताळणी, व्यवसाय बुद्धिमत्ता | 75 मिनिटे |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI समाकलन | Azure OpenAI एम्बेडिंग, व्हेक्टर सर्च, हायब्रिड क्वेरी | 60 मिनिटे |
| **[08-Testing](walkthrough/08-Testing/README.md)** | गुणवत्ता आश्वासन | चाचणी धोरणे, डीबगिंग तंत्र, कार्यक्षमता चाचणी | 75 मिनिटे |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | विकास अनुभव | VS Code कॉन्फिगरेशन, AI चॅट समाकलन, डीबगिंग वर्कफ्लो | 45 मिनिटे |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | उत्पादन तैनाती | कंटेनरायझेशन, Azure Container Apps, CI/CD पाइपलाइन | 90 मिनिटे |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | निरीक्षणक्षमता | ऍप्लिकेशन इनसाइट्स, संरचित लॉगिंग, कार्यक्षमता मेट्रिक्स | 60 मिनिटे |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | उत्पादन उत्कृष्टता | सुरक्षा कडक करणे, ऑप्टिमायझेशन, एंटरप्राइझ पॅटर्न्स | 45 मिनिटे |

### शिक्षण मार्गदर्शक कसा वापरायचा

**📖 शिक्षणासाठी**: `/walkthrough` मॉड्यूल्स चरण-दर-चरण सूचना प्रदान करतात ज्यामध्ये प्रत्येक घटक का डिझाइन केला गेला आहे याचे स्पष्टीकरण आहे. मॉड्यूल 00 पासून सुरू करा आणि क्रमाने प्रगती करा.

**🔧 अंमलबजावणीसाठी**: हे Sample_Walkthrough.md तांत्रिक सखोल विश्लेषण आणि कोड विघटन प्रदान करते जे विकसकांना संपूर्ण अंमलबजावणी पटकन समजून घेण्यास मदत करते.

**🚀 उत्पादनासाठी**: मॉड्यूल्स 02, 10, 11, आणि 12 विशेषतः उत्पादन-तयार तैनाती, सुरक्षा आणि निरीक्षण विचारांवर लक्ष केंद्रित करतात.

**📚 संपूर्ण शिक्षण मार्ग**: **[/walkthrough/README.md](walkthrough/README.md)** ला भेट द्या संपूर्ण शिक्षण मार्गदर्शक आढाव्यासाठी ज्यामध्ये तपशीलवार शिक्षण उद्दिष्टे आणि पूर्वापेक्षा आहेत.

---

## आर्किटेक्चर सखोल विश्लेषण

### उच्च-स्तरीय आर्किटेक्चर

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

### मुख्य घटक

#### 1. **MCP सर्व्हर (`sales_analysis.py`)**
- **FastMCP फ्रेमवर्क**: HTTP/SSE प्रोटोकॉल संप्रेषण हाताळते
- **टूल नोंदणी**: डेटाबेस क्वेरी आणि स्कीमा टूल्स उघड करते
- **रिक्वेस्ट कॉन्टेक्स्ट**: RLS वापरकर्ता ओळख व्यवस्थापित करते
- **त्रुटी हाताळणी**: मजबूत त्रुटी व्यवस्थापन आणि लॉगिंग

#### 2. **डेटाबेस स्तर (`sales_analysis_postgres.py`)**
- **कनेक्शन पूलिंग**: कार्यक्षम asyncpg कनेक्शन व्यवस्थापन
- **स्कीमा प्रदाता**: डायनॅमिक टेबल स्कीमा शोध
- **क्वेरी अंमलबजावणी**: RLS सह सुरक्षित SQL अंमलबजावणी
- **सिमॅंटिक सर्च**: pgvector सह व्हेक्टर समानता शोध

#### 3. **कॉन्फिगरेशन व्यवस्थापन (`config.py`)**
- **पर्यावरणीय व्हेरिएबल्स**: केंद्रीकृत कॉन्फिगरेशन हाताळणी
- **कनेक्शन पॅरामीटर्स**: डेटाबेस आणि Azure सेवा कॉन्फिगरेशन
- **पडताळणी**: आवश्यक पर्यावरणीय व्हेरिएबल्सची पडताळणी

#### 4. **पायाभूत सुविधा (`infra/`)**
- **Bicep टेम्पलेट्स**: Azure संसाधनांची घोषणात्मक तरतूद
- **मॉडेल तैनाती**: स्वयंचलित AI मॉडेल तैनाती
- **भूमिका नियुक्त्या**: सुरक्षा भूमिका कॉन्फिगरेशन

### डेटा प्रवाह

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## समाधान तयार करणे

### चरण 1: प्रकल्प संरचना सेटअप

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

### चरण 2: मुख्य अवलंबित्वे

**Python आवश्यकता:**
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

**सिस्टम आवश्यकता:**
- कंटेनरायझेशनसाठी Docker Desktop
- तैनातीसाठी Azure CLI
- pgvector विस्तारासह PostgreSQL
- AI विस्तारांसह VS Code

### चरण 3: डेटाबेस स्कीमा डिझाइन

नमुना रिटेल डेटाबेस वापरतो ज्यामध्ये हे मुख्य टेबल्स आहेत:

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

**रो लेव्हल सिक्युरिटी (RLS) अंमलबजावणी:**
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

## घटकांचे विघटन

### MCP सर्व्हर कोर (`sales_analysis.py`)

#### टूल नोंदणी पॅटर्न
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

**मुख्य वैशिष्ट्ये:**
- **टाइप अ‍ॅनोटेशन्स**: AI समजून घेण्यासाठी Pydantic फील्ड वर्णन
- **संदर्भ काढणे**: HTTP हेडर्समधून वापरकर्ता ओळख
- **त्रुटी हाताळणी**: माहितीपूर्ण संदेशांसह सौम्य अपयश
- **लॉगिंग**: सर्वसमावेशक ऑपरेशन लॉगिंग

#### रिक्वेस्ट कॉन्टेक्स्ट व्यवस्थापन
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### डेटाबेस स्तर (`sales_analysis_postgres.py`)

#### कनेक्शन पूल व्यवस्थापन
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

**डिझाइन पॅटर्न्स:**
- **संसाधन व्यवस्थापन**: योग्य पूल जीवनचक्र व्यवस्थापन
- **कार्यक्षमता ट्यूनिंग**: ऑप्टिमाइझ केलेली PostgreSQL सेटिंग्ज
- **त्रुटी पुनर्प्राप्ती**: कनेक्शन रीट्राय आणि फॉलबॅक लॉजिक
- **सुरक्षा**: प्रत्येक कनेक्शनसाठी RLS संदर्भ सेटिंग

#### स्कीमा अंतर्दृष्टी
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

### सिमॅंटिक सर्च समाकलन

#### एम्बेडिंग निर्मिती
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

#### व्हेक्टर समानता शोध
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

## तैनाती मार्गदर्शक

### Azure पायाभूत सुविधा तैनाती

#### 1. **Bicep टेम्पलेट संरचना**

**मुख्य टेम्पलेट (`main.bicep`):**
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

#### 2. **तैनाती स्वयंचलन**

**PowerShell तैनाती (`deploy.ps1`):**
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

### स्थानिक विकास सेटअप

#### 1. **Docker Compose कॉन्फिगरेशन**
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

#### 2. **डेटाबेस प्रारंभिककरण**
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

## समाधानाचा वापर

### VS Code समाकलन

#### 1. **MCP कॉन्फिगरेशन (`.vscode/mcp.json`)**
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

#### 2. **क्वेरी उदाहरणे**

**स्कीमा शोध:**
```
AI: #zava What tables are available in the database?
```
*MCP सर्व्हर `get_multiple_table_schemas` वापरतो टेबल संरचना परत करण्यासाठी*

**विक्री विश्लेषण:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*योग्य जॉइन्स आणि तारीख फिल्टरिंगसह SQL तयार करते*

**सिमॅंटिक सर्च:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*समानार्थी उत्पादने शोधण्यासाठी एम्बेडिंग वापरते*

**मल्टी-स्टोअर विश्लेषण:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS फक्त सिएटल स्टोअर डेटा ऍक्सेस सुनिश्चित करते*

### प्रगत क्वेरी पॅटर्न्स

#### 1. **टाइम-सीरीज विश्लेषण**
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

#### 2. **श्रेणींसह उत्पादन कार्यक्षमता**
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

## प्रगत वैशिष्ट्ये

### रो लेव्हल सिक्युरिटी अंमलबजावणी

#### 1. **धोरण निर्मिती**
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

#### 2. **MCP सर्व्हरमध्ये संदर्भ सेटिंग**
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

### सिमॅंटिक सर्च सखोल विश्लेषण

#### 1. **एम्बेडिंग पाइपलाइन**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **समानता शोध ऑप्टिमायझेशन**
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

### निरीक्षण आणि निरीक्षणक्षमता

#### 1. **Azure ऍप्लिकेशन इनसाइट्स समाकलन**
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

#### 2. **सानुकूल मेट्रिक्स आणि लॉगिंग**
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

## समस्या निवारण

### सामान्य समस्या आणि उपाय

#### 1. **डेटाबेस कनेक्शन समस्या**
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

**सामान्य निराकरणे:**
- PostgreSQL चालू आहे याची खात्री करा: `docker ps`
- `.env` मधील कनेक्शन पॅरामीटर्स तपासा
- डेटाबेस अस्तित्वात आहे याची पडताळणी करा: `docker exec -it pg17 psql -U postgres -l`
- नेटवर्क कनेक्टिव्हिटी चाचणी करा: `telnet localhost 5432`

#### 2. **RLS धोरण समस्या**
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

#### 3. **एम्बेडिंग सेवा समस्या**
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

### कार्यक्षमता ऑप्टिमायझेशन

#### 1. **कनेक्शन पूल ट्यूनिंग**
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

#### 2. **क्वेरी ऑप्टिमायझेशन**
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

## सर्वोत्तम पद्धती

### सुरक्षा सर्वोत्तम पद्धती

#### 1. **पर्यावरणीय व्हेरिएबल व्यवस्थापन**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS अंमलबजावणी मार्गदर्शक**
- **डिफॉल्ट नकार**: प्रतिबंधात्मक धोरणांसह प्रारंभ करा
- **नियमित ऑडिट**: धोरण प्रभावीपणा निरीक्षण करा
- **संपूर्ण चाचणी**: ऍक्सेस पॅटर्न पडताळा
- **धोरणे दस्तऐवजीकरण करा**: स्पष्ट दस्तऐवज राखा

#### 3. **नेटवर्क सुरक्षा**
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

### विकास सर्वोत्तम पद्धती

#### 1. **त्रुटी हाताळणी पॅटर्न्स**
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

#### 2. **चाचणी धोरणे**
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

#### 3. **निरीक्षण आणि अलर्ट्स**
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

### तैनाती सर्वोत्तम पद्धती

#### 1. **कोड म्हणून पायाभूत सुविधा**
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

#### 2. **CI/CD पाइपलाइन समाकलन**
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

हे सर्वसमावेशक मार्गदर्शन उत्पादन-तयार MCP सर्व्हर PostgreSQL समाकलनासह तयार करणे, तैनात करणे आणि ऑपरेट करणे यासाठी पाया प्रदान करते. येथे प्रदर्शित पॅटर्न्स आणि पद्धती इतर डोमेन आणि वापर प्रकरणांमध्ये विस्तारित केल्या जाऊ शकतात, सुरक्षा, कार्यक्षमता आणि देखभालक्षमतेसह.

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपयास लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.