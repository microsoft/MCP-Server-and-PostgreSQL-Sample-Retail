<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T21:15:49+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "el"
}
-->
# MCP Server και PostgreSQL Παράδειγμα - Ολοκληρωμένος Οδηγός

## Πίνακας Περιεχομένων
1. [Επισκόπηση](../..)
2. [Ανάλυση Αρχιτεκτονικής](../..)
3. [Δημιουργία της Λύσης](../..)
4. [Ανάλυση Συστατικών](../..)
5. [Οδηγός Ανάπτυξης](../..)
6. [Χρήση της Λύσης](../..)
7. [Προχωρημένες Λειτουργίες](../..)
8. [Αντιμετώπιση Προβλημάτων](../..)
9. [Βέλτιστες Πρακτικές](../..)

## Επισκόπηση

Αυτός ο οδηγός αναλύει πώς να δημιουργήσετε και να χρησιμοποιήσετε έναν **Model Context Protocol (MCP) server** έτοιμο για παραγωγή, ο οποίος ενσωματώνεται με PostgreSQL και υπηρεσίες Azure AI. Το παράδειγμα παρουσιάζει πρότυπα επιπέδου επιχείρησης, όπως Ασφάλεια σε Επίπεδο Γραμμής (Row Level Security), σημασιολογική αναζήτηση και πρόσβαση σε δεδομένα πολλαπλών ενοικιαστών.

### Τι θα Μάθετε
- Πώς να σχεδιάσετε έναν MCP server με ενσωμάτωση βάσης δεδομένων
- Εφαρμογή Ασφάλειας σε Επίπεδο Γραμμής για σενάρια πολλαπλών ενοικιαστών
- Δημιουργία σημασιολογικής αναζήτησης με ενσωματώσεις Azure OpenAI
- Δημιουργία περιβαλλόντων ανάπτυξης βασισμένων σε Docker
- Ανάπτυξη υποδομής Azure με πρότυπα Bicep
- Ενσωμάτωση με VS Code για αναλύσεις με τεχνητή νοημοσύνη

### Χρησιμοποιούμενες Τεχνολογίες
- **MCP Protocol**: Πρωτόκολλο Model Context για ενσωμάτωση εργαλείων AI
- **FastMCP**: Σύγχρονο Python MCP server framework
- **PostgreSQL**: Βάση δεδομένων με επέκταση pgvector για σημασιολογική αναζήτηση
- **Azure OpenAI**: Ενσωματώσεις κειμένου και προαιρετικά μοντέλα GPT
- **Docker**: Κοντεϊνεροποίηση για συνεπή περιβάλλοντα
- **Bicep**: Υποδομή ως Κώδικας για πόρους Azure
- **VS Code**: Περιβάλλον ανάπτυξης με ενσωμάτωση MCP

## 📚 Δομημένος Οδηγός Μάθησης: /walkthrough

Εκτός από αυτόν τον τεχνικό οδηγό, το αποθετήριο περιλαμβάνει έναν ολοκληρωμένο **οδηγό μάθησης 12 ενοτήτων** που βρίσκεται στον φάκελο `/walkthrough`. Αυτή η δομημένη προσέγγιση διασπά την πολύπλοκη υλοποίηση σε κατανοητές ενότητες, ιδανικές για προγραμματιστές που θέλουν να κατανοήσουν κάθε συστατικό βήμα προς βήμα.

### Επισκόπηση Ενοτήτων Μάθησης

| Ενότητα | Θέμα | Εστίαση | Διάρκεια |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Βασικά του MCP | Βασικές έννοιες, μελέτη περίπτωσης Zava Retail, επισκόπηση αρχιτεκτονικής | 30 λεπτά |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Σχεδιασμός Συστήματος | Τεχνική αρχιτεκτονική, πρότυπα σχεδιασμού, σχέσεις συστατικών | 45 λεπτά |
| **[02-Security](walkthrough/02-Security/README.md)** | Ασφάλεια Επιπέδου Επιχείρησης | Αυθεντικοποίηση Azure, Ασφάλεια σε Επίπεδο Γραμμής, απομόνωση πολλαπλών ενοικιαστών | 60 λεπτά |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Ρύθμιση Περιβάλλοντος | Ρύθμιση Docker, Azure CLI, αρχικοποίηση έργου | 45 λεπτά |
| **[04-Database](walkthrough/04-Database/README.md)** | Επίπεδο Δεδομένων | Σχήμα PostgreSQL, ρύθμιση pgvector, πολιτικές RLS, δείγματα δεδομένων | 60 λεπτά |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Κύρια Υλοποίηση | Πλαίσιο FastMCP, ενσωμάτωση βάσης δεδομένων, ανάπτυξη εργαλείων | 90 λεπτά |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Ανάπτυξη Εργαλείων | Δημιουργία εργαλείων MCP, επικύρωση ερωτημάτων, επιχειρηματική ευφυΐα | 75 λεπτά |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Ενσωμάτωση AI | Ενσωματώσεις Azure OpenAI, αναζήτηση με βάση διανύσματα, υβριδικά ερωτήματα | 60 λεπτά |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Διασφάλιση Ποιότητας | Στρατηγικές δοκιμών, τεχνικές εντοπισμού σφαλμάτων, δοκιμές απόδοσης | 75 λεπτά |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Εμπειρία Ανάπτυξης | Ρύθμιση VS Code, ενσωμάτωση AI Chat, ροές εργασίας εντοπισμού σφαλμάτων | 45 λεπτά |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Ανάπτυξη σε Παραγωγή | Κοντεϊνεροποίηση, Azure Container Apps, CI/CD pipelines | 90 λεπτά |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Παρατηρησιμότητα | Application Insights, δομημένη καταγραφή, μετρήσεις απόδοσης | 60 λεπτά |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Αριστεία στην Παραγωγή | Ενίσχυση ασφάλειας, βελτιστοποίηση, πρότυπα επιπέδου επιχείρησης | 45 λεπτά |

### Πώς να Χρησιμοποιήσετε τον Οδηγό Μάθησης

**📖 Για Μάθηση**: Οι ενότητες `/walkthrough` παρέχουν βήμα προς βήμα οδηγίες με εξηγήσεις για το γιατί κάθε συστατικό έχει σχεδιαστεί με συγκεκριμένο τρόπο. Ξεκινήστε με την Ενότητα 00 και προχωρήστε διαδοχικά.

**🔧 Για Υλοποίηση**: Το Sample_Walkthrough.md παρέχει την τεχνική ανάλυση και τον κώδικα για προγραμματιστές που θέλουν να κατανοήσουν γρήγορα την πλήρη υλοποίηση.

**🚀 Για Παραγωγή**: Οι Ενότητες 02, 10, 11 και 12 εστιάζουν ειδικά στην ανάπτυξη, ασφάλεια και παρακολούθηση σε παραγωγή.

**📚 Πλήρης Διαδρομή Μάθησης**: Επισκεφθείτε **[/walkthrough/README.md](walkthrough/README.md)** για την πλήρη επισκόπηση του οδηγού μάθησης με λεπτομερείς στόχους και προαπαιτούμενα.

---

## Ανάλυση Αρχιτεκτονικής

### Αρχιτεκτονική Υψηλού Επιπέδου

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

### Κύρια Συστατικά

#### 1. **MCP Server (`sales_analysis.py`)**
- **Πλαίσιο FastMCP**: Διαχειρίζεται την επικοινωνία HTTP/SSE
- **Εγγραφή Εργαλείων**: Παρέχει εργαλεία ερωτημάτων και σχημάτων βάσης δεδομένων
- **Πλαίσιο Αιτημάτων**: Διαχειρίζεται την ταυτοποίηση χρήστη για RLS
- **Διαχείριση Σφαλμάτων**: Ανθεκτική διαχείριση σφαλμάτων και καταγραφή

#### 2. **Επίπεδο Βάσης Δεδομένων (`sales_analysis_postgres.py`)**
- **Διαχείριση Συνδέσεων**: Αποτελεσματική διαχείριση ασύγχρονων συνδέσεων
- **Παροχή Σχήματος**: Δυναμική ανακάλυψη σχημάτων πινάκων
- **Εκτέλεση Ερωτημάτων**: Ασφαλής εκτέλεση SQL με RLS
- **Σημασιολογική Αναζήτηση**: Αναζήτηση ομοιότητας διανυσμάτων με pgvector

#### 3. **Διαχείριση Ρυθμίσεων (`config.py`)**
- **Μεταβλητές Περιβάλλοντος**: Κεντρική διαχείριση ρυθμίσεων
- **Παράμετροι Σύνδεσης**: Ρυθμίσεις βάσης δεδομένων και υπηρεσιών Azure
- **Επικύρωση**: Επικύρωση απαιτούμενων μεταβλητών περιβάλλοντος

#### 4. **Υποδομή (`infra/`)**
- **Πρότυπα Bicep**: Δηλωτική παροχή πόρων Azure
- **Ανάπτυξη Μοντέλων**: Αυτοματοποιημένη ανάπτυξη μοντέλων AI
- **Αναθέσεις Ρόλων**: Ρύθμιση ρόλων ασφαλείας

### Ροή Δεδομένων

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Δημιουργία της Λύσης

### Βήμα 1: Ρύθμιση Δομής Έργου

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

### Βήμα 2: Κύριες Εξαρτήσεις

**Απαιτήσεις Python:**
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

**Απαιτήσεις Συστήματος:**
- Docker Desktop για κοντεϊνεροποίηση
- Azure CLI για ανάπτυξη
- PostgreSQL με επέκταση pgvector
- VS Code με επεκτάσεις AI

### Βήμα 3: Σχεδιασμός Σχήματος Βάσης Δεδομένων

Το παράδειγμα χρησιμοποιεί μια βάση δεδομένων λιανικής με τους εξής βασικούς πίνακες:

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

**Υλοποίηση Ασφάλειας σε Επίπεδο Γραμμής (RLS):**
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

## Ανάλυση Συστατικών

### Κύριο MCP Server (`sales_analysis.py`)

#### Πρότυπο Εγγραφής Εργαλείων
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

**Κύρια Χαρακτηριστικά:**
- **Αναφορές Τύπων**: Περιγραφές πεδίων Pydantic για κατανόηση από AI
- **Εξαγωγή Πλαισίου**: Ταυτότητα χρήστη από HTTP headers
- **Διαχείριση Σφαλμάτων**: Ομαλή αποτυχία με ενημερωτικά μηνύματα
- **Καταγραφή**: Εκτενής καταγραφή λειτουργιών

#### Διαχείριση Πλαισίου Αιτημάτων
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Επίπεδο Βάσης Δεδομένων (`sales_analysis_postgres.py`)

#### Διαχείριση Πισίνας Συνδέσεων
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

**Πρότυπα Σχεδιασμού:**
- **Διαχείριση Πόρων**: Σωστή διαχείριση κύκλου ζωής πισίνας
- **Βελτιστοποίηση Απόδοσης**: Ρυθμίσεις PostgreSQL
- **Ανάκτηση Σφαλμάτων**: Επανασύνδεση και λογική εφεδρείας
- **Ασφάλεια**: Ρύθμιση πλαισίου RLS ανά σύνδεση

#### Ενδοσκόπηση Σχήματος
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

### Ενσωμάτωση Σημασιολογικής Αναζήτησης

#### Δημιουργία Ενσωματώσεων
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

#### Αναζήτηση Ομοιότητας Διανυσμάτων
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

## Οδηγός Ανάπτυξης

### Ανάπτυξη Υποδομής Azure

#### 1. **Δομή Προτύπου Bicep**

**Κύριο Πρότυπο (`main.bicep`):**
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

#### 2. **Αυτοματοποίηση Ανάπτυξης**

**Ανάπτυξη με PowerShell (`deploy.ps1`):**
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

### Ρύθμιση Τοπικής Ανάπτυξης

#### 1. **Ρύθμιση Docker Compose**
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

#### 2. **Αρχικοποίηση Βάσης Δεδομένων**
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

## Χρήση της Λύσης

### Ενσωμάτωση VS Code

#### 1. **Ρύθμιση MCP (`.vscode/mcp.json`)**
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

#### 2. **Παραδείγματα Ερωτημάτων**

**Ανακάλυψη Σχήματος:**
```
AI: #zava What tables are available in the database?
```
*Ο MCP server χρησιμοποιεί `get_multiple_table_schemas` για να επιστρέψει δομές πινάκων*

**Ανάλυση Πωλήσεων:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Δημιουργεί SQL με σωστά joins και φιλτράρισμα ημερομηνιών*

**Σημασιολογική Αναζήτηση:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Χρησιμοποιεί ενσωματώσεις για να βρει προϊόντα με σημασιολογική ομοιότητα*

**Ανάλυση Πολλαπλών Καταστημάτων:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*Το RLS διασφαλίζει ότι μόνο δεδομένα του καταστήματος Seattle είναι προσβάσιμα*

### Προχωρημένα Πρότυπα Ερωτημάτων

#### 1. **Ανάλυση Χρονοσειρών**
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

#### 2. **Απόδοση Προϊόντων με Κατηγορίες**
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

## Προχωρημένες Λειτουργίες

### Υλοποίηση Ασφάλειας σε Επίπεδο Γραμμής

#### 1. **Δημιουργία Πολιτικής**
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

#### 2. **Ρύθμιση Πλαισίου στον MCP Server**
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

### Ανάλυση Σημασιολογικής Αναζήτησης

#### 1. **Διαδικασία Ενσωμάτωσης**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Βελτιστοποίηση Αναζήτησης Ομοιότητας**
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

### Παρακολούθηση και Παρατηρησιμότητα

#### 1. **Ενσωμάτωση Azure Application Insights**
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

#### 2. **Προσαρμοσμένες Μετρήσεις και Καταγραφή**
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

## Αντιμετώπιση Προβλημάτων

### Συνηθισμένα Προβλήματα και Λύσεις

#### 1. **Προβλήματα Σύνδεσης Βάσης Δεδομένων**
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

**Συνηθισμένες Λύσεις:**
- Επαληθεύστε ότι το PostgreSQL λειτουργεί: `docker ps`
- Ελέγξτε τις παραμέτρους σύνδεσης στο `.env`
- Επαληθεύστε ότι η βάση δεδομένων υπάρχει: `docker exec -it pg17 psql -U postgres -l`
- Δοκιμάστε τη συνδεσιμότητα δικτύου: `telnet localhost 5432`

#### 2. **Προβλήματα Πολιτικής RLS**
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

#### 3. **Προβλήματα Υπηρεσίας Ενσωματώσεων**
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

### Βελτιστοποίηση Απόδοσης

#### 1. **Ρύθμιση Πισίνας Συνδέσεων**
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

#### 2. **Βελτιστοποίηση Ερωτημάτων**
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

## Βέλτιστες Πρακτικές

### Βέλτιστες Πρακτικές Ασφάλειας

#### 1. **Διαχείριση Μεταβλητών Περιβάλλοντος**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Κατευθυντήριες Γραμμές Υλοποίησης RLS**
- **Αρχική Άρνηση**: Ξεκινήστε με περιοριστικές πολιτικές
- **Τακτικός Έλεγχος**: Παρακολουθήστε την αποτελεσματικότητα των πολιτικών
- **Εκτενείς Δοκιμές**: Επαληθεύστε τα πρότυπα πρόσβασης
- **Τεκμηρίωση Πολιτικών**: Διατηρήστε σαφή τεκμηρίωση

#### 3. **Ασφάλεια Δικτύου**
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

### Βέλτιστες Πρακτικές Ανάπτυξης

#### 1. **Πρότυπα Διαχείρισης Σφαλμάτων**
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

#### 2. **Στρατηγικές Δ

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.