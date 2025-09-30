<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T19:44:41+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ne"
}
-->
# MCP सर्भर र PostgreSQL नमूना - पूर्ण मार्गदर्शन

## सामग्री तालिका
1. [परिचय](../..)
2. [आर्किटेक्चर गहिरो अध्ययन](../..)
3. [समाधान निर्माण](../..)
4. [घटक विवरण](../..)
5. [परिनियोजन मार्गदर्शन](../..)
6. [समाधान प्रयोग](../..)
7. [उन्नत सुविधाहरू](../..)
8. [समस्या समाधान](../..)
9. [सर्वोत्तम अभ्यासहरू](../..)

## परिचय

यो मार्गदर्शनले उत्पादन-तयार **मोडेल कन्टेक्स्ट प्रोटोकल (MCP) सर्भर** निर्माण र प्रयोग गर्ने तरिका व्याख्या गर्दछ, जसले PostgreSQL र Azure AI सेवाहरूलाई एकीकृत गर्दछ। नमूनाले उद्यम-स्तरीय ढाँचाहरू प्रदर्शन गर्दछ, जस्तै रो लेभल सुरक्षा, सेम्यान्टिक खोज, र बहु-भाडावाल डाटा पहुँच।

### तपाईंले के सिक्नुहुनेछ
- डेटाबेस एकीकरणसहित MCP सर्भरको आर्किटेक्चर कसरी बनाउने
- बहु-भाडावाल परिदृश्यहरूको लागि रो लेभल सुरक्षा कार्यान्वयन
- Azure OpenAI इम्बेडिङ्सको साथ सेम्यान्टिक खोज निर्माण
- Docker-आधारित विकास वातावरण सिर्जना
- Bicep टेम्प्लेटहरूको साथ Azure पूर्वाधार परिनियोजन
- AI-संचालित एनालिटिक्सको लागि VS Code एकीकरण

### प्रयोग गरिएका प्रविधिहरू
- **MCP प्रोटोकल**: AI उपकरण एकीकरणको लागि मोडेल कन्टेक्स्ट प्रोटोकल
- **FastMCP**: आधुनिक Python MCP सर्भर फ्रेमवर्क
- **PostgreSQL**: pgvector विस्तारसहितको डेटाबेस सेम्यान्टिक खोजको लागि
- **Azure OpenAI**: पाठ इम्बेडिङ्स र वैकल्पिक GPT मोडेलहरू
- **Docker**: सुसंगत वातावरणको लागि कन्टेनराइजेशन
- **Bicep**: Azure स्रोतहरूको लागि कोडको पूर्वाधार
- **VS Code**: MCP एकीकरणसहितको विकास वातावरण

## 📚 संरचित सिकाइ मार्गदर्शन: /walkthrough

यस प्राविधिक मार्गदर्शनको अतिरिक्त, यो रिपोजिटरीमा **१२-मोड्युल सिकाइ मार्गदर्शन** समावेश छ, जुन `/walkthrough` डाइरेक्टरीमा अवस्थित छ। यो संरचित दृष्टिकोणले जटिल कार्यान्वयनलाई पचाउन सकिने सिकाइ मोड्युलहरूमा विभाजन गर्दछ, विकासकर्ताहरूका लागि प्रत्येक घटकलाई चरण-दर-चरण बुझ्न उपयुक्त।

### सिकाइ मोड्युलहरूको अवलोकन

| मोड्युल | विषय | केन्द्रबिन्दु | अवधि |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP आधारभूत | मुख्य अवधारणाहरू, Zava Retail केस अध्ययन, आर्किटेक्चर अवलोकन | ३० मिनेट |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | प्रणाली डिजाइन | प्राविधिक आर्किटेक्चर, डिजाइन ढाँचाहरू, घटक सम्बन्धहरू | ४५ मिनेट |
| **[02-Security](walkthrough/02-Security/README.md)** | उद्यम सुरक्षा | Azure प्रमाणीकरण, रो लेभल सुरक्षा, बहु-भाडावाल अलगाव | ६० मिनेट |
| **[03-Setup](walkthrough/03-Setup/README.md)** | वातावरण सेटअप | Docker कन्फिगरेसन, Azure CLI, परियोजना आरम्भ | ४५ मिनेट |
| **[04-Database](walkthrough/04-Database/README.md)** | डाटा तह | PostgreSQL स्कीमा, pgvector सेटअप, RLS नीतिहरू, नमूना डाटा | ६० मिनेट |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | मुख्य कार्यान्वयन | FastMCP फ्रेमवर्क, डेटाबेस एकीकरण, उपकरण विकास | ९० मिनेट |
| **[06-Tools](walkthrough/06-Tools/README.md)** | उपकरण विकास | MCP उपकरण सिर्जना, क्वेरी मान्यता, व्यवसायिक बुद्धिमत्ता | ७५ मिनेट |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI एकीकरण | Azure OpenAI इम्बेडिङ्स, भेक्टर खोज, हाइब्रिड क्वेरीहरू | ६० मिनेट |
| **[08-Testing](walkthrough/08-Testing/README.md)** | गुणस्तर आश्वासन | परीक्षण रणनीतिहरू, डिबगिङ प्रविधिहरू, प्रदर्शन परीक्षण | ७५ मिनेट |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | विकास अनुभव | VS Code कन्फिगरेसन, AI च्याट एकीकरण, डिबगिङ कार्यप्रवाहहरू | ४५ मिनेट |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | उत्पादन परिनियोजन | कन्टेनराइजेशन, Azure Container Apps, CI/CD पाइपलाइनहरू | ९० मिनेट |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | अवलोकनशीलता | एप्लिकेसन इनसाइट्स, संरचित लगिङ, प्रदर्शन मेट्रिक्स | ६० मिनेट |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | उत्पादन उत्कृष्टता | सुरक्षा कडा बनाउने, अनुकूलन, उद्यम ढाँचाहरू | ४५ मिनेट |

### सिकाइ मार्गदर्शन प्रयोग गर्ने तरिका

**📖 सिकाइको लागि**: `/walkthrough` मोड्युलहरूले चरण-दर-चरण निर्देशनहरू प्रदान गर्दछ, प्रत्येक घटक किन यसरी डिजाइन गरिएको हो भन्ने व्याख्यासहित। मोड्युल ०० बाट सुरु गर्नुहोस् र क्रमिक रूपमा अगाडि बढ्नुहोस्।

**🔧 कार्यान्वयनको लागि**: यो Sample_Walkthrough.md प्राविधिक गहिरो अध्ययन र कोड विवरण प्रदान गर्दछ, जसले विकासकर्ताहरूलाई पूर्ण कार्यान्वयन छिटो बुझ्न मद्दत गर्दछ।

**🚀 उत्पादनको लागि**: मोड्युलहरू ०२, १०, ११, र १२ विशेष रूपमा उत्पादन-तयार परिनियोजन, सुरक्षा, र निगरानी विचारहरूमा केन्द्रित छन्।

**📚 पूर्ण सिकाइ मार्ग**: विस्तृत सिकाइ उद्देश्यहरू र पूर्वापेक्षाहरूको साथ पूर्ण मार्गदर्शन अवलोकनको लागि **[/walkthrough/README.md](walkthrough/README.md)** भ्रमण गर्नुहोस्।

---

## आर्किटेक्चर गहिरो अध्ययन

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

### मुख्य घटकहरू

#### १. **MCP सर्भर (`sales_analysis.py`)**
- **FastMCP फ्रेमवर्क**: HTTP/SSE प्रोटोकल सञ्चार व्यवस्थापन
- **उपकरण दर्ता**: डेटाबेस क्वेरी र स्कीमा उपकरणहरू उजागर गर्दछ
- **अनुरोध सन्दर्भ**: RLS प्रयोगकर्ता पहिचान व्यवस्थापन
- **त्रुटि व्यवस्थापन**: बलियो त्रुटि व्यवस्थापन र लगिङ

#### २. **डेटाबेस तह (`sales_analysis_postgres.py`)**
- **कनेक्शन पूलिङ**: प्रभावकारी asyncpg कनेक्शन व्यवस्थापन
- **स्कीमा प्रदायक**: गतिशील तालिका स्कीमा पत्ता लगाउने
- **क्वेरी कार्यान्वयन**: RLS सहित सुरक्षित SQL कार्यान्वयन
- **सेम्यान्टिक खोज**: pgvectorको साथ भेक्टर समानता खोज

#### ३. **कन्फिगरेसन व्यवस्थापन (`config.py`)**
- **पर्यावरण चरहरू**: केन्द्रीयकृत कन्फिगरेसन व्यवस्थापन
- **कनेक्शन प्यारामिटरहरू**: डेटाबेस र Azure सेवा कन्फिगरेसन
- **मान्यता**: आवश्यक पर्यावरण चर मान्यता

#### ४. **पूर्वाधार (`infra/`)**
- **Bicep टेम्प्लेटहरू**: Azure स्रोतहरूको घोषणात्मक प्रावधान
- **मोडेल परिनियोजन**: स्वचालित AI मोडेल परिनियोजन
- **भूमिका असाइनमेन्टहरू**: सुरक्षा भूमिका कन्फिगरेसन

### डाटा प्रवाह

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## समाधान निर्माण

### चरण १: परियोजना संरचना सेटअप

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

### चरण २: मुख्य निर्भरताहरू

**Python आवश्यकताहरू:**
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

**प्रणाली आवश्यकताहरू:**
- कन्टेनराइजेशनको लागि Docker Desktop
- परिनियोजनको लागि Azure CLI
- pgvector विस्तारसहितको PostgreSQL
- AI विस्तारसहितको VS Code

### चरण ३: डेटाबेस स्कीमा डिजाइन

नमूनाले यी मुख्य तालिकाहरू भएको खुद्रा डेटाबेस प्रयोग गर्दछ:

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

**रो लेभल सुरक्षा (RLS) कार्यान्वयन:**
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

### MCP सर्भर कोर (`sales_analysis.py`)

#### उपकरण दर्ता ढाँचा
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

**मुख्य सुविधाहरू:**
- **प्रकार एनोटेसनहरू**: AI बुझाइको लागि Pydantic क्षेत्र विवरणहरू
- **सन्दर्भ निकासी**: HTTP हेडरबाट प्रयोगकर्ता पहिचान
- **त्रुटि व्यवस्थापन**: जानकारीमूलक सन्देशहरूसहितको सहज असफलता
- **लगिङ**: व्यापक अपरेशन लगिङ

#### अनुरोध सन्दर्भ व्यवस्थापन
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### डेटाबेस तह (`sales_analysis_postgres.py`)

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

**डिजाइन ढाँचाहरू:**
- **स्रोत व्यवस्थापन**: उचित पूल जीवनचक्र व्यवस्थापन
- **प्रदर्शन ट्युनिङ**: अनुकूलित PostgreSQL सेटिङहरू
- **त्रुटि पुनःप्राप्ति**: कनेक्शन पुनः प्रयास र फलब्याक तर्क
- **सुरक्षा**: प्रत्येक कनेक्शनमा RLS सन्दर्भ सेटिङ

#### स्कीमा अन्वेषण
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

### सेम्यान्टिक खोज एकीकरण

#### इम्बेडिङ उत्पादन
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

#### भेक्टर समानता खोज
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

## परिनियोजन मार्गदर्शन

### Azure पूर्वाधार परिनियोजन

#### १. **Bicep टेम्प्लेट संरचना**

**मुख्य टेम्प्लेट (`main.bicep`):**
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

#### २. **परिनियोजन स्वचालन**

**PowerShell परिनियोजन (`deploy.ps1`):**
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

#### १. **Docker Compose कन्फिगरेसन**
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

#### २. **डेटाबेस आरम्भ**
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

## समाधान प्रयोग

### VS Code एकीकरण

#### १. **MCP कन्फिगरेसन (`.vscode/mcp.json`)**
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

#### २. **क्वेरी उदाहरणहरू**

**स्कीमा अन्वेषण:**
```
AI: #zava What tables are available in the database?
```
*MCP सर्भरले `get_multiple_table_schemas` प्रयोग गरेर तालिका संरचनाहरू फिर्ता गर्दछ*

**बिक्री विश्लेषण:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*उपयुक्त जोइन र मिति फिल्टरिङसहित SQL सिर्जना गर्दछ*

**सेम्यान्टिक खोज:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*इम्बेडिङ्स प्रयोग गरेर सेम्यान्टिक रूपमा समान उत्पादनहरू फेला पार्छ*

**बहु-स्टोर विश्लेषण:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLSले मात्र सिएटल स्टोर डाटामा पहुँच सुनिश्चित गर्दछ*

### उन्नत क्वेरी ढाँचाहरू

#### १. **समय-श्रृंखला विश्लेषण**
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

#### २. **श्रेणीहरूसहित उत्पादन प्रदर्शन**
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

## उन्नत सुविधाहरू

### रो लेभल सुरक्षा कार्यान्वयन

#### १. **नीति सिर्जना**
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

#### २. **MCP सर्भरमा सन्दर्भ सेटिङ**
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

### सेम्यान्टिक खोज गहिरो अध्ययन

#### १. **इम्बेडिङ पाइपलाइन**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### २. **समानता खोज अनुकूलन**
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

### निगरानी र अवलोकनशीलता

#### १. **Azure एप्लिकेसन इनसाइट्स एकीकरण**
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

#### २. **अनुकूलित मेट्रिक्स र लगिङ**
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

## समस्या समाधान

### सामान्य समस्याहरू र समाधानहरू

#### १. **डेटाबेस कनेक्शन समस्याहरू**
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

**सामान्य समाधानहरू:**
- PostgreSQL चलिरहेको छ भनी सुनिश्चित गर्नुहोस्: `docker ps`
- `.env` मा कनेक्शन प्यारामिटरहरू जाँच गर्नुहोस्
- डेटाबेस अवस्थित छ भनी प्रमाणित गर्नुहोस्: `docker exec -it pg17 psql -U postgres -l`
- नेटवर्क कनेक्टिभिटी परीक्षण गर्नुहोस्: `telnet localhost 5432`

#### २. **RLS नीति समस्याहरू**
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

#### ३. **इम्बेडिङ सेवा समस्याहरू**
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

#### १. **कनेक्शन पूल ट्युनिङ**
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

#### २. **क्वेरी अनुकूलन**
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

## सर्वोत्तम अभ्यासहरू

### सुरक्षा सर्वोत्तम अभ्यासहरू

#### १. **पर्यावरण चर व्यवस्थापन**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### २. **RLS कार्यान्वयन दिशानिर्देशहरू**
- **डिफल्ट अस्वीकृति**: प्रतिबन्धात्मक नीतिहरूसँग सुरु गर्नुहोस्
- **नियमित अडिट**: नीति प्रभावकारिता निगरानी गर्नुहोस्
- **थोरै परीक्षण गर्नुहोस्**: पहुँच ढाँचाहरू मान्य गर्नुहोस्
- **नीतिहरू दस्तावेज गर्नुहोस्**: स्पष्ट दस्तावेजीकरण कायम गर्नुहोस्

#### ३. **नेटवर्क सुरक्षा**
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

### विकास सर्वोत्तम अभ्यासहरू

#### १. **त्रुटि व्यवस्थापन ढाँचाहरू**
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

#### २. **परीक्षण रणनीतिहरू**
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

#### ३. **निगरानी र अलर्टहरू**
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

### परिनियोजन सर्वोत्तम अभ्यासहरू

#### १. **कोडको पूर्वाधार**
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

#### २. **CI/CD पाइपलाइन एकीकरण**
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

यो व्यापक मार्गदर्शनले उत्पादन-तयार MCP सर्भर निर्माण, परिनियोजन, र सञ्चालनको आधार प्रदान गर्दछ, जसले PostgreSQL एकीकरणलाई समावेश गर्दछ। यहाँ प्रदर्शन गरिएका ढाँचाहरू र अभ्यासहरू अन्य डोमेन र प्रयोग केसहरूमा विस्तार गर्न सकिन्छ, सुरक्षा, प्रदर्शन, र मर्मतयोग्यता कायम राख्दै।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी यथासम्भव शुद्धता सुनिश्चित गर्न प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। मूल दस्तावेज़ यसको मातृभाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।