<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T16:56:39+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "fr"
}
-->
# Exemple de serveur MCP et PostgreSQL - Guide complet

## Table des matières
1. [Aperçu](../..)
2. [Analyse approfondie de l'architecture](../..)
3. [Construction de la solution](../..)
4. [Décomposition des composants](../..)
5. [Guide de déploiement](../..)
6. [Utilisation de la solution](../..)
7. [Fonctionnalités avancées](../..)
8. [Dépannage](../..)
9. [Bonnes pratiques](../..)

## Aperçu

Ce guide explique comment construire et utiliser un **serveur Model Context Protocol (MCP)** prêt pour la production, intégrant PostgreSQL et les services Azure AI. L'exemple illustre des modèles de niveau entreprise, notamment la sécurité au niveau des lignes, la recherche sémantique et l'accès aux données multi-locataires.

### Ce que vous apprendrez
- Comment concevoir un serveur MCP avec intégration de base de données
- Implémenter la sécurité au niveau des lignes pour des scénarios multi-locataires
- Construire une recherche sémantique avec les embeddings Azure OpenAI
- Créer des environnements de développement basés sur Docker
- Déployer une infrastructure Azure avec des modèles Bicep
- Intégrer VS Code pour des analyses alimentées par l'IA

### Technologies utilisées
- **Protocole MCP** : Protocole Model Context pour l'intégration des outils IA
- **FastMCP** : Framework Python moderne pour serveur MCP
- **PostgreSQL** : Base de données avec extension pgvector pour la recherche sémantique
- **Azure OpenAI** : Embeddings textuels et modèles GPT optionnels
- **Docker** : Conteneurisation pour des environnements cohérents
- **Bicep** : Infrastructure en tant que code pour les ressources Azure
- **VS Code** : Environnement de développement avec intégration MCP

## 📚 Guide d'apprentissage structuré : /walkthrough

En complément de ce guide technique, ce dépôt inclut un **guide d'apprentissage en 12 modules** situé dans le répertoire `/walkthrough`. Cette approche structurée décompose l'implémentation complexe en modules d'apprentissage digestes, parfaits pour les développeurs souhaitant comprendre chaque composant étape par étape.

### Aperçu des modules d'apprentissage

| Module | Sujet | Focus | Durée |
|--------|-------|-------|-------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Fondamentaux MCP | Concepts clés, étude de cas Zava Retail, aperçu de l'architecture | 30 min |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Conception système | Architecture technique, modèles de conception, relations entre composants | 45 min |
| **[02-Sécurité](walkthrough/02-Security/README.md)** | Sécurité d'entreprise | Authentification Azure, sécurité au niveau des lignes, isolation multi-locataires | 60 min |
| **[03-Configuration](walkthrough/03-Setup/README.md)** | Configuration de l'environnement | Configuration Docker, CLI Azure, initialisation du projet | 45 min |
| **[04-Base de données](walkthrough/04-Database/README.md)** | Couche de données | Schéma PostgreSQL, configuration pgvector, politiques RLS, données d'exemple | 60 min |
| **[05-Serveur MCP](walkthrough/05-MCP-Server/README.md)** | Implémentation principale | Framework FastMCP, intégration de base de données, développement d'outils | 90 min |
| **[06-Outils](walkthrough/06-Tools/README.md)** | Développement d'outils | Création d'outils MCP, validation de requêtes, intelligence d'affaires | 75 min |
| **[07-Recherche sémantique](walkthrough/07-Semantic-Search/README.md)** | Intégration IA | Embeddings Azure OpenAI, recherche vectorielle, requêtes hybrides | 60 min |
| **[08-Test](walkthrough/08-Testing/README.md)** | Assurance qualité | Stratégies de test, techniques de débogage, tests de performance | 75 min |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Expérience de développement | Configuration VS Code, intégration Chat IA, workflows de débogage | 45 min |
| **[10-Déploiement](walkthrough/10-Deployment/README.md)** | Déploiement en production | Conteneurisation, Azure Container Apps, pipelines CI/CD | 90 min |
| **[11-Surveillance](walkthrough/11-Monitoring/README.md)** | Observabilité | Application Insights, journalisation structurée, métriques de performance | 60 min |
| **[12-Bonnes pratiques](walkthrough/12-Best-Practices/README.md)** | Excellence en production | Renforcement de la sécurité, optimisation, modèles d'entreprise | 45 min |

### Comment utiliser le guide d'apprentissage

**📖 Pour apprendre** : Les modules `/walkthrough` fournissent des instructions étape par étape avec des explications sur la conception de chaque composant. Commencez par le module 00 et progressez dans l'ordre.

**🔧 Pour implémenter** : Ce fichier Sample_Walkthrough.md offre une analyse technique approfondie et une décomposition du code pour les développeurs souhaitant comprendre rapidement l'implémentation complète.

**🚀 Pour la production** : Les modules 02, 10, 11 et 12 se concentrent spécifiquement sur le déploiement prêt pour la production, la sécurité et les considérations de surveillance.

**📚 Parcours d'apprentissage complet** : Consultez **[/walkthrough/README.md](walkthrough/README.md)** pour une vue d'ensemble complète du guide d'apprentissage avec des objectifs d'apprentissage détaillés et des prérequis.

---

## Analyse approfondie de l'architecture

### Architecture de haut niveau

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

### Composants principaux

#### 1. **Serveur MCP (`sales_analysis.py`)**
- **Framework FastMCP** : Gère la communication HTTP/SSE
- **Enregistrement des outils** : Expose les outils de requête et de schéma de base de données
- **Contexte des requêtes** : Gère l'identification des utilisateurs pour RLS
- **Gestion des erreurs** : Gestion robuste des erreurs et journalisation

#### 2. **Couche base de données (`sales_analysis_postgres.py`)**
- **Pooling de connexions** : Gestion efficace des connexions asyncpg
- **Fournisseur de schéma** : Découverte dynamique des schémas de table
- **Exécution des requêtes** : Exécution SQL sécurisée avec RLS
- **Recherche sémantique** : Recherche de similarité vectorielle avec pgvector

#### 3. **Gestion de la configuration (`config.py`)**
- **Variables d'environnement** : Gestion centralisée de la configuration
- **Paramètres de connexion** : Configuration des services de base de données et Azure
- **Validation** : Validation des variables d'environnement requises

#### 4. **Infrastructure (`infra/`)**
- **Modèles Bicep** : Provisionnement déclaratif des ressources Azure
- **Déploiement de modèles** : Déploiement automatisé des modèles IA
- **Attributions de rôles** : Configuration des rôles de sécurité

### Flux de données

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Construction de la solution

### Étape 1 : Configuration de la structure du projet

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

### Étape 2 : Dépendances principales

**Exigences Python :**
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

**Exigences système :**
- Docker Desktop pour la conteneurisation
- CLI Azure pour le déploiement
- PostgreSQL avec extension pgvector
- VS Code avec extensions IA

### Étape 3 : Conception du schéma de base de données

L'exemple utilise une base de données de vente au détail avec les tables clés suivantes :

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

**Implémentation de la sécurité au niveau des lignes (RLS) :**
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

## Décomposition des composants

### Noyau du serveur MCP (`sales_analysis.py`)

#### Modèle d'enregistrement des outils
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

**Caractéristiques principales :**
- **Annotations de type** : Descriptions de champs Pydantic pour la compréhension IA
- **Extraction de contexte** : Identité utilisateur à partir des en-têtes HTTP
- **Gestion des erreurs** : Échecs gracieux avec messages informatifs
- **Journalisation** : Journalisation complète des opérations

#### Gestion du contexte des requêtes
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Couche base de données (`sales_analysis_postgres.py`)

#### Gestion du pool de connexions
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

**Modèles de conception :**
- **Gestion des ressources** : Gestion appropriée du cycle de vie du pool
- **Optimisation des performances** : Paramètres PostgreSQL optimisés
- **Récupération des erreurs** : Reconnexion et logique de secours
- **Sécurité** : Configuration du contexte RLS par connexion

#### Introspection du schéma
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

### Intégration de la recherche sémantique

#### Génération d'embeddings
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

#### Recherche de similarité vectorielle
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

## Guide de déploiement

### Déploiement de l'infrastructure Azure

#### 1. **Structure des modèles Bicep**

**Modèle principal (`main.bicep`) :**
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

#### 2. **Automatisation du déploiement**

**Déploiement PowerShell (`deploy.ps1`) :**
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

### Configuration du développement local

#### 1. **Configuration Docker Compose**
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

#### 2. **Initialisation de la base de données**
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

## Utilisation de la solution

### Intégration VS Code

#### 1. **Configuration MCP (`.vscode/mcp.json`)**
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

#### 2. **Exemples de requêtes**

**Découverte de schéma :**
```
AI: #zava What tables are available in the database?
```
*Le serveur MCP utilise `get_multiple_table_schemas` pour retourner les structures de table*

**Analyse des ventes :**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Génère du SQL avec des jointures et un filtrage par date appropriés*

**Recherche sémantique :**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Utilise des embeddings pour trouver des produits sémantiquement similaires*

**Analyse multi-magasins :**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS garantit que seules les données du magasin de Seattle sont accessibles*

### Modèles de requêtes avancés

#### 1. **Analyse de séries temporelles**
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

#### 2. **Performance des produits avec catégories**
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

## Fonctionnalités avancées

### Implémentation de la sécurité au niveau des lignes

#### 1. **Création de politiques**
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

#### 2. **Configuration du contexte dans le serveur MCP**
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

### Analyse approfondie de la recherche sémantique

#### 1. **Pipeline d'embeddings**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Optimisation de la recherche de similarité**
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

### Surveillance et observabilité

#### 1. **Intégration Azure Application Insights**
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

#### 2. **Métriques et journalisation personnalisées**
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

## Dépannage

### Problèmes courants et solutions

#### 1. **Problèmes de connexion à la base de données**
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

**Solutions courantes :**
- Vérifiez que PostgreSQL est en cours d'exécution : `docker ps`
- Vérifiez les paramètres de connexion dans `.env`
- Validez l'existence de la base de données : `docker exec -it pg17 psql -U postgres -l`
- Testez la connectivité réseau : `telnet localhost 5432`

#### 2. **Problèmes de politiques RLS**
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

#### 3. **Problèmes avec le service d'embeddings**
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

### Optimisation des performances

#### 1. **Réglage du pool de connexions**
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

#### 2. **Optimisation des requêtes**
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

## Bonnes pratiques

### Bonnes pratiques de sécurité

#### 1. **Gestion des variables d'environnement**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Directives pour l'implémentation RLS**
- **Refus par défaut** : Commencez avec des politiques restrictives
- **Audit régulier** : Surveillez l'efficacité des politiques
- **Test approfondi** : Validez les modèles d'accès
- **Documentez les politiques** : Maintenez une documentation claire

#### 3. **Sécurité réseau**
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

### Bonnes pratiques de développement

#### 1. **Modèles de gestion des erreurs**
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

#### 2. **Stratégies de test**
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

#### 3. **Surveillance et alertes**
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

### Bonnes pratiques de déploiement

#### 1. **Infrastructure en tant que code**
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

#### 2. **Intégration des pipelines CI/CD**
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

Ce guide complet fournit les bases pour construire, déployer et exploiter un serveur MCP prêt pour la production avec une intégration PostgreSQL. Les modèles et pratiques démontrés ici peuvent être étendus à d'autres domaines et cas d'utilisation tout en maintenant la sécurité, les performances et la maintenabilité.

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.