<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T18:10:06+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "hi"
}
-->
# MCP सर्वर और PostgreSQL सैंपल - पूरा वॉकथ्रू

## सामग्री सूची
1. [परिचय](../..)
2. [आर्किटेक्चर गहराई से समझना](../..)
3. [समाधान बनाना](../..)
4. [घटक विवरण](../..)
5. [डिप्लॉयमेंट गाइड](../..)
6. [समाधान का उपयोग करना](../..)
7. [उन्नत सुविधाएँ](../..)
8. [समस्या निवारण](../..)
9. [सर्वोत्तम प्रथाएँ](../..)

## परिचय

यह वॉकथ्रू दिखाता है कि कैसे एक प्रोडक्शन-रेडी **मॉडल कॉन्टेक्स्ट प्रोटोकॉल (MCP) सर्वर** बनाया और उपयोग किया जाए, जो PostgreSQL और Azure AI सेवाओं के साथ एकीकृत हो। यह सैंपल एंटरप्राइज़-ग्रेड पैटर्न जैसे कि रो लेवल सिक्योरिटी, सेमांटिक सर्च, और मल्टी-टेनेंट डेटा एक्सेस को प्रदर्शित करता है।

### आप क्या सीखेंगे
- MCP सर्वर को डेटाबेस इंटीग्रेशन के साथ आर्किटेक्ट करना
- मल्टी-टेनेंट परिदृश्यों के लिए रो लेवल सिक्योरिटी लागू करना
- Azure OpenAI एम्बेडिंग्स के साथ सेमांटिक सर्च बनाना
- Docker-आधारित विकास वातावरण बनाना
- Bicep टेम्पलेट्स के साथ Azure इंफ्रास्ट्रक्चर को डिप्लॉय करना
- AI-पावर्ड एनालिटिक्स के लिए VS Code के साथ एकीकरण

### उपयोग की गई तकनीकें
- **MCP प्रोटोकॉल**: AI टूल इंटीग्रेशन के लिए मॉडल कॉन्टेक्स्ट प्रोटोकॉल
- **FastMCP**: आधुनिक Python MCP सर्वर फ्रेमवर्क
- **PostgreSQL**: pgvector एक्सटेंशन के साथ डेटाबेस सेमांटिक सर्च के लिए
- **Azure OpenAI**: टेक्स्ट एम्बेडिंग्स और वैकल्पिक GPT मॉडल
- **Docker**: सुसंगत वातावरण के लिए कंटेनरीकरण
- **Bicep**: Azure संसाधनों के लिए इंफ्रास्ट्रक्चर कोड
- **VS Code**: MCP इंटीग्रेशन के साथ विकास वातावरण

## 📚 संरचित शिक्षण गाइड: /walkthrough

इस तकनीकी वॉकथ्रू के अलावा, इस रिपॉजिटरी में एक व्यापक **12-मॉड्यूल शिक्षण गाइड** शामिल है, जो `/walkthrough` डायरेक्टरी में स्थित है। यह संरचित दृष्टिकोण जटिल कार्यान्वयन को छोटे-छोटे मॉड्यूल में विभाजित करता है, जो उन डेवलपर्स के लिए आदर्श है जो प्रत्येक घटक को चरण-दर-चरण समझना चाहते हैं।

### शिक्षण मॉड्यूल का अवलोकन

| मॉड्यूल | विषय | फोकस | अवधि |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP मूल बातें | मुख्य अवधारणाएँ, Zava Retail केस स्टडी, आर्किटेक्चर अवलोकन | 30 मिनट |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | सिस्टम डिज़ाइन | तकनीकी आर्किटेक्चर, डिज़ाइन पैटर्न, घटक संबंध | 45 मिनट |
| **[02-Security](walkthrough/02-Security/README.md)** | एंटरप्राइज़ सुरक्षा | Azure प्रमाणीकरण, रो लेवल सिक्योरिटी, मल्टी-टेनेंट आइसोलेशन | 60 मिनट |
| **[03-Setup](walkthrough/03-Setup/README.md)** | वातावरण सेटअप | Docker कॉन्फ़िगरेशन, Azure CLI, प्रोजेक्ट प्रारंभ | 45 मिनट |
| **[04-Database](walkthrough/04-Database/README.md)** | डेटा लेयर | PostgreSQL स्कीमा, pgvector सेटअप, RLS नीतियाँ, सैंपल डेटा | 60 मिनट |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | मुख्य कार्यान्वयन | FastMCP फ्रेमवर्क, डेटाबेस इंटीग्रेशन, टूल डेवलपमेंट | 90 मिनट |
| **[06-Tools](walkthrough/06-Tools/README.md)** | टूल डेवलपमेंट | MCP टूल निर्माण, क्वेरी वैलिडेशन, बिजनेस इंटेलिजेंस | 75 मिनट |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI इंटीग्रेशन | Azure OpenAI एम्बेडिंग्स, वेक्टर सर्च, हाइब्रिड क्वेरीज़ | 60 मिनट |
| **[08-Testing](walkthrough/08-Testing/README.md)** | गुणवत्ता आश्वासन | परीक्षण रणनीतियाँ, डिबगिंग तकनीकें, प्रदर्शन परीक्षण | 75 मिनट |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | विकास अनुभव | VS Code कॉन्फ़िगरेशन, AI चैट इंटीग्रेशन, डिबगिंग वर्कफ़्लो | 45 मिनट |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | प्रोडक्शन डिप्लॉयमेंट | कंटेनरीकरण, Azure Container Apps, CI/CD पाइपलाइंस | 90 मिनट |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | अवलोकनशीलता | एप्लिकेशन इनसाइट्स, संरचित लॉगिंग, प्रदर्शन मेट्रिक्स | 60 मिनट |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | प्रोडक्शन उत्कृष्टता | सुरक्षा सख्ती, अनुकूलन, एंटरप्राइज़ पैटर्न | 45 मिनट |

### शिक्षण गाइड का उपयोग कैसे करें

**📖 सीखने के लिए**: `/walkthrough` मॉड्यूल चरण-दर-चरण निर्देश प्रदान करते हैं, साथ ही प्रत्येक घटक को इस तरह डिज़ाइन करने के कारणों की व्याख्या करते हैं। मॉड्यूल 00 से शुरू करें और क्रमिक रूप से आगे बढ़ें।

**🔧 कार्यान्वयन के लिए**: यह Sample_Walkthrough.md डेवलपर्स के लिए तकनीकी गहराई और कोड विवरण प्रदान करता है, जो पूरी कार्यान्वयन को जल्दी समझना चाहते हैं।

**🚀 प्रोडक्शन के लिए**: मॉड्यूल 02, 10, 11, और 12 विशेष रूप से प्रोडक्शन-रेडी डिप्लॉयमेंट, सुरक्षा, और मॉनिटरिंग विचारों पर केंद्रित हैं।

**📚 पूर्ण शिक्षण पथ**: विस्तृत शिक्षण उद्देश्यों और आवश्यकताओं के साथ पूर्ण शिक्षण गाइड अवलोकन के लिए **[/walkthrough/README.md](walkthrough/README.md)** पर जाएं।

---

## आर्किटेक्चर गहराई से समझना

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

#### 1. **MCP सर्वर (`sales_analysis.py`)**
- **FastMCP फ्रेमवर्क**: HTTP/SSE प्रोटोकॉल संचार को संभालता है
- **टूल रजिस्ट्रेशन**: डेटाबेस क्वेरी और स्कीमा टूल्स को एक्सपोज़ करता है
- **रिक्वेस्ट कॉन्टेक्स्ट**: RLS उपयोगकर्ता पहचान को प्रबंधित करता है
- **एरर हैंडलिंग**: मजबूत एरर प्रबंधन और लॉगिंग

#### 2. **डेटाबेस लेयर (`sales_analysis_postgres.py`)**
- **कनेक्शन पूलिंग**: प्रभावी asyncpg कनेक्शन प्रबंधन
- **स्कीमा प्रोवाइडर**: डायनामिक टेबल स्कीमा डिस्कवरी
- **क्वेरी निष्पादन**: RLS के साथ सुरक्षित SQL निष्पादन
- **सेमांटिक सर्च**: pgvector के साथ वेक्टर समानता खोज

#### 3. **कॉन्फ़िगरेशन प्रबंधन (`config.py`)**
- **पर्यावरण चर**: केंद्रीकृत कॉन्फ़िगरेशन हैंडलिंग
- **कनेक्शन पैरामीटर**: डेटाबेस और Azure सेवा कॉन्फ़िगरेशन
- **वैलिडेशन**: आवश्यक पर्यावरण चर का सत्यापन

#### 4. **इंफ्रास्ट्रक्चर (`infra/`)**
- **Bicep टेम्पलेट्स**: Azure संसाधन प्रावधान के लिए घोषणात्मक
- **मॉडल डिप्लॉयमेंट**: स्वचालित AI मॉडल डिप्लॉयमेंट
- **रोल असाइनमेंट्स**: सुरक्षा भूमिका कॉन्फ़िगरेशन

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

## समाधान बनाना

### चरण 1: प्रोजेक्ट संरचना सेटअप

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

### चरण 2: मुख्य निर्भरताएँ

**Python आवश्यकताएँ:**
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

**सिस्टम आवश्यकताएँ:**
- कंटेनरीकरण के लिए Docker Desktop
- डिप्लॉयमेंट के लिए Azure CLI
- pgvector एक्सटेंशन के साथ PostgreSQL
- AI एक्सटेंशन के साथ VS Code

### चरण 3: डेटाबेस स्कीमा डिज़ाइन

सैंपल एक रिटेल डेटाबेस का उपयोग करता है जिसमें ये प्रमुख टेबल शामिल हैं:

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

**रो लेवल सिक्योरिटी (RLS) कार्यान्वयन:**
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

## घटक विवरण

### MCP सर्वर कोर (`sales_analysis.py`)

#### टूल रजिस्ट्रेशन पैटर्न
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

**मुख्य विशेषताएँ:**
- **टाइप एनोटेशन**: AI समझ के लिए Pydantic फ़ील्ड विवरण
- **कॉन्टेक्स्ट एक्सट्रैक्शन**: HTTP हेडर से उपयोगकर्ता पहचान
- **एरर हैंडलिंग**: सूचनात्मक संदेशों के साथ ग्रेसफुल फेल्योर
- **लॉगिंग**: व्यापक ऑपरेशन लॉगिंग

#### रिक्वेस्ट कॉन्टेक्स्ट प्रबंधन
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### डेटाबेस लेयर (`sales_analysis_postgres.py`)

#### कनेक्शन पूल प्रबंधन
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

**डिज़ाइन पैटर्न:**
- **संसाधन प्रबंधन**: उचित पूल जीवनचक्र प्रबंधन
- **प्रदर्शन ट्यूनिंग**: अनुकूलित PostgreSQL सेटिंग्स
- **एरर रिकवरी**: कनेक्शन पुनः प्रयास और फॉलबैक लॉजिक
- **सुरक्षा**: प्रत्येक कनेक्शन पर RLS कॉन्टेक्स्ट सेटिंग

#### स्कीमा इंट्रोस्पेक्शन
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

### सेमांटिक सर्च इंटीग्रेशन

#### एम्बेडिंग जनरेशन
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

#### वेक्टर समानता खोज
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

## डिप्लॉयमेंट गाइड

### Azure इंफ्रास्ट्रक्चर डिप्लॉयमेंट

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

#### 2. **डिप्लॉयमेंट ऑटोमेशन**

**PowerShell डिप्लॉयमेंट (`deploy.ps1`):**
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

### स्थानीय विकास सेटअप

#### 1. **Docker Compose कॉन्फ़िगरेशन**
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

## समाधान का उपयोग करना

### VS Code इंटीग्रेशन

#### 1. **MCP कॉन्फ़िगरेशन (`.vscode/mcp.json`)**
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

#### 2. **क्वेरी उदाहरण**

**स्कीमा डिस्कवरी:**
```
AI: #zava What tables are available in the database?
```
*MCP सर्वर `get_multiple_table_schemas` का उपयोग करता है टेबल संरचनाएँ लौटाने के लिए*

**सेल्स एनालिसिस:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*उचित जॉइन और डेट फ़िल्टरिंग के साथ SQL उत्पन्न करता है*

**सेमांटिक सर्च:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*एम्बेडिंग्स का उपयोग करके समानार्थक उत्पाद ढूंढता है*

**मल्टी-स्टोर एनालिसिस:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS सुनिश्चित करता है कि केवल सिएटल स्टोर डेटा एक्सेस किया जाए*

### उन्नत क्वेरी पैटर्न

#### 1. **टाइम-सीरीज़ एनालिसिस**
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

#### 2. **श्रेणियों के साथ उत्पाद प्रदर्शन**
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

## उन्नत सुविधाएँ

### रो लेवल सिक्योरिटी कार्यान्वयन

#### 1. **नीति निर्माण**
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

#### 2. **MCP सर्वर में कॉन्टेक्स्ट सेटिंग**
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

### सेमांटिक सर्च गहराई से

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

#### 2. **समानता खोज अनुकूलन**
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

### मॉनिटरिंग और अवलोकनशीलता

#### 1. **Azure एप्लिकेशन इनसाइट्स इंटीग्रेशन**
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

#### 2. **कस्टम मेट्रिक्स और लॉगिंग**
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

### सामान्य समस्याएँ और समाधान

#### 1. **डेटाबेस कनेक्शन समस्याएँ**
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

**सामान्य सुधार:**
- PostgreSQL चल रहा है यह सत्यापित करें: `docker ps`
- `.env` में कनेक्शन पैरामीटर जांचें
- डेटाबेस मौजूद है यह सत्यापित करें: `docker exec -it pg17 psql -U postgres -l`
- नेटवर्क कनेक्टिविटी का परीक्षण करें: `telnet localhost 5432`

#### 2. **RLS नीति समस्याएँ**
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

#### 3. **एम्बेडिंग सेवा समस्याएँ**
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

### प्रदर्शन अनुकूलन

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

#### 2. **क्वेरी अनुकूलन**
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

## सर्वोत्तम प्रथाएँ

### सुरक्षा सर्वोत्तम प्रथाएँ

#### 1. **पर्यावरण चर प्रबंधन**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS कार्यान्वयन दिशानिर्देश**
- **डिफ़ॉल्ट डिनाई**: प्रतिबंधात्मक नीतियों से शुरू करें
- **नियमित ऑडिट**: नीति प्रभावशीलता की निगरानी करें
- **पूरी तरह से परीक्षण करें**: एक्सेस पैटर्न को मान्य करें
- **नीतियों का दस्तावेज़ीकरण करें**: स्पष्ट दस्तावेज़ बनाए रखें

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

### विकास सर्वोत्तम प्रथाएँ

#### 1. **एरर हैंडलिंग पैटर्न**
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

#### 2. **परीक्षण रणनीतियाँ**
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

#### 3. **मॉनिटरिंग और अलर्ट्स**
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

### डिप्लॉयमेंट सर्वोत्तम प्रथाएँ

#### 1. **इंफ्रास्ट्रक्चर कोड के रूप में**
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

#### 2. **CI/CD पाइपलाइन इंटीग्रेशन**
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

यह व्यापक वॉकथ्रू MCP सर्वर को PostgreSQL इंटीग्रेशन के साथ बनाने, डिप्लॉय करने और संचालित करने की नींव प्रदान करता है। यहां प्रदर्शित पैटर्न और प्रथाएँ अन्य डोमेन और उपयोग मामलों में विस्तारित की जा सकती हैं, जबकि सुरक्षा, प्रदर्शन और रखरखाव बनाए रखा जा सकता है।

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।