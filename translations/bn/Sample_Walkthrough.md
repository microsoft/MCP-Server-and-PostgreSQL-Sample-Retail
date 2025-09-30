<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T19:43:03+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "bn"
}
-->
# MCP সার্ভার এবং PostgreSQL নমুনা - সম্পূর্ণ নির্দেশিকা

## সূচিপত্র
1. [পর্যালোচনা](../..)
2. [স্থাপত্য বিশ্লেষণ](../..)
3. [সমাধান তৈরি](../..)
4. [উপাদান বিশ্লেষণ](../..)
5. [মোতায়েন নির্দেশিকা](../..)
6. [সমাধান ব্যবহার](../..)
7. [উন্নত বৈশিষ্ট্য](../..)
8. [সমস্যা সমাধান](../..)
9. [সেরা অনুশীলন](../..)

## পর্যালোচনা

এই নির্দেশিকা দেখায় কীভাবে একটি প্রোডাকশন-রেডি **Model Context Protocol (MCP) সার্ভার** তৈরি এবং ব্যবহার করতে হয়, যা PostgreSQL এবং Azure AI পরিষেবার সাথে সংযুক্ত। এই নমুনা এন্টারপ্রাইজ-গ্রেড প্যাটার্ন যেমন Row Level Security, সেমান্টিক সার্চ এবং মাল্টি-টেন্যান্ট ডেটা অ্যাক্সেস প্রদর্শন করে।

### আপনি যা শিখবেন
- MCP সার্ভার স্থাপত্য এবং ডেটাবেস ইন্টিগ্রেশন
- মাল্টি-টেন্যান্ট পরিস্থিতির জন্য Row Level Security বাস্তবায়ন
- Azure OpenAI embeddings ব্যবহার করে সেমান্টিক সার্চ তৈরি করা
- Docker-ভিত্তিক ডেভেলপমেন্ট পরিবেশ তৈরি করা
- Bicep টেমপ্লেট ব্যবহার করে Azure অবকাঠামো মোতায়েন
- AI-চালিত বিশ্লেষণের জন্য VS Code এর সাথে ইন্টিগ্রেশন

### ব্যবহৃত প্রযুক্তি
- **MCP Protocol**: AI টুল ইন্টিগ্রেশনের জন্য Model Context Protocol
- **FastMCP**: আধুনিক Python MCP সার্ভার ফ্রেমওয়ার্ক
- **PostgreSQL**: pgvector এক্সটেনশন সহ ডেটাবেস সেমান্টিক সার্চের জন্য
- **Azure OpenAI**: টেক্সট embeddings এবং ঐচ্ছিক GPT মডেল
- **Docker**: ধারাবাহিক পরিবেশের জন্য কন্টেইনারাইজেশন
- **Bicep**: Azure রিসোর্সের জন্য Infrastructure as Code
- **VS Code**: MCP ইন্টিগ্রেশনের সাথে ডেভেলপমেন্ট পরিবেশ

## 📚 কাঠামোগত শিক্ষার নির্দেশিকা: /walkthrough

এই প্রযুক্তিগত নির্দেশিকার পাশাপাশি, এই রিপোজিটরিতে একটি বিস্তৃত **১২-মডিউল শিক্ষার নির্দেশিকা** অন্তর্ভুক্ত রয়েছে যা `/walkthrough` ডিরেক্টরিতে অবস্থিত। এই কাঠামোগত পদ্ধতি জটিল বাস্তবায়নকে সহজে বোঝার জন্য পর্যায়ক্রমে ভেঙে দেয়, যা ডেভেলপারদের প্রতিটি উপাদান ধাপে ধাপে বুঝতে সাহায্য করে।

### শিক্ষার মডিউল পর্যালোচনা

| মডিউল | বিষয় | ফোকাস | সময়কাল |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP মৌলিক বিষয় | মূল ধারণা, Zava Retail কেস স্টাডি, স্থাপত্য পর্যালোচনা | ৩০ মিনিট |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | সিস্টেম ডিজাইন | প্রযুক্তিগত স্থাপত্য, ডিজাইন প্যাটার্ন, উপাদান সম্পর্ক | ৪৫ মিনিট |
| **[02-Security](walkthrough/02-Security/README.md)** | এন্টারপ্রাইজ নিরাপত্তা | Azure প্রমাণীকরণ, Row Level Security, মাল্টি-টেন্যান্ট বিচ্ছিন্নতা | ৬০ মিনিট |
| **[03-Setup](walkthrough/03-Setup/README.md)** | পরিবেশ সেটআপ | Docker কনফিগারেশন, Azure CLI, প্রকল্প প্রারম্ভ | ৪৫ মিনিট |
| **[04-Database](walkthrough/04-Database/README.md)** | ডেটা স্তর | PostgreSQL স্কিমা, pgvector সেটআপ, RLS নীতিমালা, নমুনা ডেটা | ৬০ মিনিট |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | মূল বাস্তবায়ন | FastMCP ফ্রেমওয়ার্ক, ডেটাবেস ইন্টিগ্রেশন, টুল ডেভেলপমেন্ট | ৯০ মিনিট |
| **[06-Tools](walkthrough/06-Tools/README.md)** | টুল ডেভেলপমেন্ট | MCP টুল তৈরি, কোয়েরি যাচাইকরণ, ব্যবসায়িক বুদ্ধিমত্তা | ৭৫ মিনিট |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI ইন্টিগ্রেশন | Azure OpenAI embeddings, ভেক্টর সার্চ, হাইব্রিড কোয়েরি | ৬০ মিনিট |
| **[08-Testing](walkthrough/08-Testing/README.md)** | গুণমান নিশ্চিতকরণ | টেস্টিং কৌশল, ডিবাগিং কৌশল, পারফরম্যান্স টেস্টিং | ৭৫ মিনিট |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ডেভেলপমেন্ট অভিজ্ঞতা | VS Code কনফিগারেশন, AI চ্যাট ইন্টিগ্রেশন, ডিবাগিং ওয়ার্কফ্লো | ৪৫ মিনিট |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | প্রোডাকশন মোতায়েন | কন্টেইনারাইজেশন, Azure Container Apps, CI/CD পাইপলাইন | ৯০ মিনিট |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | পর্যবেক্ষণযোগ্যতা | Application Insights, কাঠামোগত লগিং, পারফরম্যান্স মেট্রিক | ৬০ মিনিট |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | প্রোডাকশন উৎকর্ষতা | নিরাপত্তা শক্তিশালীকরণ, অপ্টিমাইজেশন, এন্টারপ্রাইজ প্যাটার্ন | ৪৫ মিনিট |

### শিক্ষার নির্দেশিকা ব্যবহার করার পদ্ধতি

**📖 শেখার জন্য**: `/walkthrough` মডিউলগুলি ধাপে ধাপে নির্দেশনা প্রদান করে এবং প্রতিটি উপাদান কেন এইভাবে ডিজাইন করা হয়েছে তার ব্যাখ্যা দেয়। মডিউল ০০ দিয়ে শুরু করুন এবং ক্রমান্বয়ে এগিয়ে যান।

**🔧 বাস্তবায়নের জন্য**: এই Sample_Walkthrough.md দ্রুত সম্পূর্ণ বাস্তবায়ন বুঝতে চাওয়া ডেভেলপারদের জন্য প্রযুক্তিগত বিশ্লেষণ এবং কোড ব্রেকডাউন প্রদান করে।

**🚀 প্রোডাকশনের জন্য**: মডিউল ০২, ১০, ১১, এবং ১২ বিশেষভাবে প্রোডাকশন-রেডি মোতায়েন, নিরাপত্তা এবং পর্যবেক্ষণ বিবেচনার উপর ফোকাস করে।

**📚 সম্পূর্ণ শিক্ষার পথ**: বিস্তারিত শিক্ষার উদ্দেশ্য এবং পূর্বশর্ত সহ সম্পূর্ণ শিক্ষার নির্দেশিকা পর্যালোচনার জন্য **[/walkthrough/README.md](walkthrough/README.md)** দেখুন।

---

## স্থাপত্য বিশ্লেষণ

### উচ্চ-স্তরের স্থাপত্য

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

### মূল উপাদানসমূহ

#### ১. **MCP সার্ভার (`sales_analysis.py`)**
- **FastMCP Framework**: HTTP/SSE প্রোটোকল যোগাযোগ পরিচালনা করে
- **টুল নিবন্ধন**: ডেটাবেস কোয়েরি এবং স্কিমা টুল প্রকাশ করে
- **অনুরোধ প্রসঙ্গ**: RLS ব্যবহারকারী শনাক্তকরণ পরিচালনা করে
- **ত্রুটি পরিচালনা**: শক্তিশালী ত্রুটি ব্যবস্থাপনা এবং লগিং

#### ২. **ডেটাবেস স্তর (`sales_analysis_postgres.py`)**
- **সংযোগ পুলিং**: দক্ষ asyncpg সংযোগ ব্যবস্থাপনা
- **স্কিমা প্রদানকারী**: গতিশীল টেবিল স্কিমা আবিষ্কার
- **কোয়েরি কার্যকরকরণ**: RLS সহ নিরাপদ SQL কার্যকরকরণ
- **সেমান্টিক সার্চ**: pgvector সহ ভেক্টর সাদৃশ্য অনুসন্ধান

#### ৩. **কনফিগারেশন ব্যবস্থাপনা (`config.py`)**
- **পরিবেশ ভেরিয়েবল**: কেন্দ্রীয় কনফিগারেশন পরিচালনা
- **সংযোগ প্যারামিটার**: ডেটাবেস এবং Azure পরিষেবা কনফিগারেশন
- **যাচাইকরণ**: প্রয়োজনীয় পরিবেশ ভেরিয়েবল যাচাইকরণ

#### ৪. **অবকাঠামো (`infra/`)**
- **Bicep টেমপ্লেট**: ঘোষণামূলক Azure রিসোর্স প্রভিশনিং
- **মডেল মোতায়েন**: স্বয়ংক্রিয় AI মডেল মোতায়েন
- **রোল অ্যাসাইনমেন্ট**: নিরাপত্তা রোল কনফিগারেশন

### ডেটা প্রবাহ

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## সমাধান তৈরি

### ধাপ ১: প্রকল্প কাঠামো সেটআপ

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

### ধাপ ২: মূল নির্ভরতা

**Python Requirements:**
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

**সিস্টেমের প্রয়োজনীয়তা:**
- কন্টেইনারাইজেশনের জন্য Docker Desktop
- মোতায়েনের জন্য Azure CLI
- pgvector এক্সটেনশন সহ PostgreSQL
- AI এক্সটেনশন সহ VS Code

### ধাপ ৩: ডেটাবেস স্কিমা ডিজাইন

নমুনাটি একটি রিটেইল ডেটাবেস ব্যবহার করে যার মূল টেবিলগুলি নিম্নরূপ:

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

**Row Level Security (RLS) বাস্তবায়ন:**
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

## উপাদান বিশ্লেষণ

### MCP সার্ভার কোর (`sales_analysis.py`)

#### টুল নিবন্ধন প্যাটার্ন
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

**মূল বৈশিষ্ট্য:**
- **টাইপ অ্যানোটেশন**: AI বোঝার জন্য Pydantic ক্ষেত্রের বিবরণ
- **প্রসঙ্গ নিষ্কাশন**: HTTP হেডার থেকে ব্যবহারকারী পরিচয়
- **ত্রুটি পরিচালনা**: তথ্যপূর্ণ বার্তাসহ গ্রেসফুল ব্যর্থতা
- **লগিং**: ব্যাপক অপারেশন লগিং

#### অনুরোধ প্রসঙ্গ ব্যবস্থাপনা
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### ডেটাবেস স্তর (`sales_analysis_postgres.py`)

#### সংযোগ পুল ব্যবস্থাপনা
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

**ডিজাইন প্যাটার্ন:**
- **রিসোর্স ব্যবস্থাপনা**: সঠিক পুল লাইফসাইকেল ব্যবস্থাপনা
- **পারফরম্যান্স টিউনিং**: অপ্টিমাইজড PostgreSQL সেটিংস
- **ত্রুটি পুনরুদ্ধার**: সংযোগ পুনরায় চেষ্টা এবং ব্যাকআপ লজিক
- **নিরাপত্তা**: প্রতি সংযোগে RLS প্রসঙ্গ সেটিং

#### স্কিমা অন্তর্দৃষ্টি
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

### সেমান্টিক সার্চ ইন্টিগ্রেশন

#### এমবেডিং জেনারেশন
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

#### ভেক্টর সাদৃশ্য অনুসন্ধান
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

## মোতায়েন নির্দেশিকা

### Azure অবকাঠামো মোতায়েন

#### ১. **Bicep টেমপ্লেট কাঠামো**

**মূল টেমপ্লেট (`main.bicep`):**
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

#### ২. **মোতায়েন স্বয়ংক্রিয়তা**

**PowerShell মোতায়েন (`deploy.ps1`):**
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

### স্থানীয় ডেভেলপমেন্ট সেটআপ

#### ১. **Docker Compose কনফিগারেশন**
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

#### ২. **ডেটাবেস প্রারম্ভিককরণ**
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

## সমাধান ব্যবহার

### VS Code ইন্টিগ্রেশন

#### ১. **MCP কনফিগারেশন (`.vscode/mcp.json`)**
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

#### ২. **কোয়েরি উদাহরণ**

**স্কিমা আবিষ্কার:**
```
AI: #zava What tables are available in the database?
```
*MCP সার্ভার `get_multiple_table_schemas` ব্যবহার করে টেবিল কাঠামো প্রদান করে*

**বিক্রয় বিশ্লেষণ:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*যথাযথ জয়েন এবং তারিখ ফিল্টারিং সহ SQL তৈরি করে*

**সেমান্টিক সার্চ:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*এমবেডিং ব্যবহার করে সেমান্টিকভাবে অনুরূপ পণ্য খুঁজে পায়*

**মাল্টি-স্টোর বিশ্লেষণ:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS নিশ্চিত করে শুধুমাত্র সিয়াটল স্টোরের ডেটা অ্যাক্সেস করা হয়*

### উন্নত কোয়েরি প্যাটার্ন

#### ১. **টাইম-সিরিজ বিশ্লেষণ**
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

#### ২. **পণ্য কর্মক্ষমতা বিভাগ সহ**
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

## উন্নত বৈশিষ্ট্য

### Row Level Security বাস্তবায়ন

#### ১. **নীতিমালা তৈরি**
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

#### ২. **MCP সার্ভারে প্রসঙ্গ সেটিং**
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

### সেমান্টিক সার্চ বিশ্লেষণ

#### ১. **এমবেডিং পাইপলাইন**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### ২. **সাদৃশ্য অনুসন্ধান অপ্টিমাইজেশন**
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

### পর্যবেক্ষণ এবং পর্যবেক্ষণযোগ্যতা

#### ১. **Azure Application Insights ইন্টিগ্রেশন**
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

#### ২. **কাস্টম মেট্রিক এবং লগিং**
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

## সমস্যার সমাধান

### সাধারণ সমস্যা এবং সমাধান

#### ১. **ডেটাবেস সংযোগ সমস্যা**
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

**সাধারণ সমাধান:**
- নিশ্চিত করুন PostgreSQL চলছে: `docker ps`
- `.env`-এ সংযোগ প্যারামিটার চেক করুন
- নিশ্চিত করুন ডেটাবেস বিদ্যমান: `docker exec -it pg17 psql -U postgres -l`
- নেটওয়ার্ক সংযোগ পরীক্ষা করুন: `telnet localhost 5432`

#### ২. **RLS নীতিমালা সমস্যা**
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

#### ৩. **এমবেডিং পরিষেবা সমস্যা**
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

### পারফরম্যান্স অপ্টিমাইজেশন

#### ১. **সংযোগ পুল টিউনিং**
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

#### ২. **কোয়েরি অপ্টিমাইজেশন**
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

## সেরা অনুশীলন

### নিরাপত্তা সেরা অনুশীলন

#### ১. **পরিবেশ ভেরিয়েবল ব্যবস্থাপনা**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### ২. **RLS বাস্তবায়ন নির্দেশিকা**
- **ডিফল্ট ডিনাই**: সীমাবদ্ধ নীতিমালা দিয়ে শুরু করুন
- **নিয়মিত অডিট**: নীতিমালার কার্যকারিতা পর্যবেক্ষণ করুন
- **পরীক্ষা করুন**: অ্যাক্সেস প্যাটার্ন যাচাই করুন
- **নীতিমালা ডকুমেন্ট করুন**: পরিষ্কার ডকুমেন্টেশন বজায় রাখুন

#### ৩. **নেটওয়ার্ক নিরাপত্তা**
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

### ডেভেলপমেন্ট সেরা অনুশীলন

#### ১. **ত্রুটি পরিচালনা প্যাটার্ন**
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

#### ২. **পরীক্ষার কৌশল**
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

#### ৩. **পর্যবেক্ষণ এবং সতর্কতা**
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

### মোতায়েন সেরা অনুশীলন

#### ১. **Infrastructure as Code**
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

#### ২. **CI/CD পাইপলাইন ইন্টিগ্রেশন**
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

এই বিস্তৃত নির্দেশিকা একটি প্রোডাকশন-রেডি MCP সার্ভার PostgreSQL ইন্টিগ্রেশনের সাথে তৈরি, মোতায়েন এবং পরিচালনার জন্য ভিত্তি প্রদান করে। এখানে প্রদর্শিত প্যাটার্ন এবং অনুশীলনগুলি নিরাপত্তা, পারফরম্যান্স এবং রক্ষণাবেক্ষণ বজায় রেখে অন্যান্য ডোমেইন এবং ব্যবহার ক্ষেত্রে প্রসারিত করা যেতে পারে।

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।