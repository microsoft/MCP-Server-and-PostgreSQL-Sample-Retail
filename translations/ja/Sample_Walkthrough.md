<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T16:57:15+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ja"
}
-->
# MCPサーバーとPostgreSQLサンプル - 完全ガイド

## 目次
1. [概要](../..)
2. [アーキテクチャの詳細](../..)
3. [ソリューションの構築](../..)
4. [コンポーネントの詳細](../..)
5. [デプロイメントガイド](../..)
6. [ソリューションの使用方法](../..)
7. [高度な機能](../..)
8. [トラブルシューティング](../..)
9. [ベストプラクティス](../..)

## 概要

このガイドでは、PostgreSQLとAzure AIサービスを統合した**Model Context Protocol (MCP)サーバー**を構築し、利用する方法を分解して説明します。このサンプルは、行レベルセキュリティ、セマンティック検索、マルチテナントデータアクセスなどのエンタープライズグレードのパターンを示しています。

### 学べること
- データベース統合を備えたMCPサーバーの設計方法
- マルチテナントシナリオ向けの行レベルセキュリティの実装
- Azure OpenAI埋め込みを使用したセマンティック検索の構築
- Dockerベースの開発環境の作成
- Bicepテンプレートを使用したAzureインフラのデプロイ
- AI分析に対応したVS Codeとの統合

### 使用技術
- **MCPプロトコル**: AIツール統合のためのModel Context Protocol
- **FastMCP**: モダンなPython MCPサーバーフレームワーク
- **PostgreSQL**: pgvector拡張を備えたデータベース
- **Azure OpenAI**: テキスト埋め込みとオプションのGPTモデル
- **Docker**: 一貫性のある環境のためのコンテナ化
- **Bicep**: Azureリソースのコード化によるインフラ管理
- **VS Code**: MCP統合を備えた開発環境

## 📚 構造化学習ガイド: /walkthrough

この技術ガイドに加えて、このリポジトリには**12モジュールの学習ガイド**が含まれています。`/walkthrough`ディレクトリにあります。この構造化アプローチは、複雑な実装を理解しやすい学習モジュールに分解しており、各コンポーネントを段階的に学びたい開発者に最適です。

### 学習モジュール概要

| モジュール | トピック | 内容 | 所要時間 |
|--------|-------|-------|----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCPの基本 | コア概念、Zava Retailケーススタディ、アーキテクチャ概要 | 30分 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | システム設計 | 技術アーキテクチャ、設計パターン、コンポーネントの関係 | 45分 |
| **[02-Security](walkthrough/02-Security/README.md)** | エンタープライズセキュリティ | Azure認証、行レベルセキュリティ、マルチテナント分離 | 60分 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | 環境セットアップ | Docker設定、Azure CLI、プロジェクト初期化 | 45分 |
| **[04-Database](walkthrough/04-Database/README.md)** | データ層 | PostgreSQLスキーマ、pgvector設定、RLSポリシー、サンプルデータ | 60分 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | コア実装 | FastMCPフレームワーク、データベース統合、ツール開発 | 90分 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | ツール開発 | MCPツール作成、クエリ検証、ビジネスインテリジェンス | 75分 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI統合 | Azure OpenAI埋め込み、ベクトル検索、ハイブリッドクエリ | 60分 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | 品質保証 | テスト戦略、デバッグ技術、性能テスト | 75分 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | 開発体験 | VS Code設定、AIチャット統合、デバッグワークフロー | 45分 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | 本番デプロイ | コンテナ化、Azure Container Apps、CI/CDパイプライン | 90分 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | 可観測性 | Application Insights、構造化ログ、性能指標 | 60分 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | 本番運用の最適化 | セキュリティ強化、最適化、エンタープライズパターン | 45分 |

### 学習ガイドの使い方

**📖 学習用**: `/walkthrough`モジュールは、各コンポーネントがどのように設計されているかを説明しながら、段階的な指示を提供します。モジュール00から順番に進めてください。

**🔧 実装用**: このSample_Walkthrough.mdは、完全な実装を迅速に理解したい開発者向けに技術的な詳細を提供します。

**🚀 本番用**: モジュール02、10、11、12は、本番環境でのデプロイ、セキュリティ、監視に特化しています。

**📚 完全な学習パス**: **[/walkthrough/README.md](walkthrough/README.md)**を訪問して、詳細な学習目標と前提条件を含む完全な学習ガイド概要をご覧ください。

---

## アーキテクチャの詳細

### 高レベルアーキテクチャ

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

### コアコンポーネント

#### 1. **MCPサーバー (`sales_analysis.py`)**
- **FastMCPフレームワーク**: HTTP/SSEプロトコル通信を処理
- **ツール登録**: データベースクエリとスキーマツールを公開
- **リクエストコンテキスト**: RLSユーザー識別を管理
- **エラーハンドリング**: 堅牢なエラーマネジメントとログ記録

#### 2. **データベース層 (`sales_analysis_postgres.py`)**
- **接続プーリング**: 効率的なasyncpg接続管理
- **スキーマプロバイダー**: 動的なテーブルスキーマの発見
- **クエリ実行**: RLSを使用した安全なSQL実行
- **セマンティック検索**: pgvectorによるベクトル類似検索

#### 3. **構成管理 (`config.py`)**
- **環境変数**: 集中化された構成管理
- **接続パラメータ**: データベースとAzureサービスの構成
- **検証**: 必須環境変数の検証

#### 4. **インフラ (`infra/`)**
- **Bicepテンプレート**: 宣言型Azureリソースプロビジョニング
- **モデルデプロイ**: 自動化されたAIモデルデプロイ
- **ロール割り当て**: セキュリティロール構成

### データフロー

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## ソリューションの構築

### ステップ1: プロジェクト構造のセットアップ

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

### ステップ2: コア依存関係

**Python要件:**
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

**システム要件:**
- コンテナ化のためのDocker Desktop
- デプロイのためのAzure CLI
- pgvector拡張を備えたPostgreSQL
- AI拡張機能を備えたVS Code

### ステップ3: データベーススキーマ設計

このサンプルでは、以下の主要なテーブルを含む小売データベースを使用します:

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

**行レベルセキュリティ (RLS) の実装:**
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

## コンポーネントの詳細

### MCPサーバーコア (`sales_analysis.py`)

#### ツール登録パターン
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

**主な機能:**
- **型アノテーション**: AI理解のためのPydanticフィールド記述
- **コンテキスト抽出**: HTTPヘッダーからのユーザー識別
- **エラーハンドリング**: 情報豊富なメッセージによる優雅な失敗処理
- **ログ記録**: 包括的な操作ログ

#### リクエストコンテキスト管理
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### データベース層 (`sales_analysis_postgres.py`)

#### 接続プール管理
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

**設計パターン:**
- **リソース管理**: 適切なプールライフサイクル管理
- **性能調整**: 最適化されたPostgreSQL設定
- **エラー回復**: 接続再試行とフォールバックロジック
- **セキュリティ**: 接続ごとのRLSコンテキスト設定

#### スキーマイントロスペクション
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

### セマンティック検索統合

#### 埋め込み生成
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

#### ベクトル類似検索
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

## デプロイメントガイド

### Azureインフラのデプロイ

#### 1. **Bicepテンプレート構造**

**メインテンプレート (`main.bicep`):**
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

#### 2. **デプロイメント自動化**

**PowerShellデプロイメント (`deploy.ps1`):**
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

### ローカル開発セットアップ

#### 1. **Docker Compose設定**
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

#### 2. **データベース初期化**
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

## ソリューションの使用方法

### VS Code統合

#### 1. **MCP設定 (`.vscode/mcp.json`)**
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

#### 2. **クエリ例**

**スキーマ発見:**
```
AI: #zava What tables are available in the database?
```
*MCPサーバーは`get_multiple_table_schemas`を使用してテーブル構造を返します*

**売上分析:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*適切な結合と日付フィルタリングを備えたSQLを生成します*

**セマンティック検索:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*埋め込みを使用して意味的に類似した製品を検索します*

**複数店舗分析:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLSはシアトル店舗データのみをアクセス可能にします*

### 高度なクエリパターン

#### 1. **時系列分析**
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

#### 2. **カテゴリ別製品性能**
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

## 高度な機能

### 行レベルセキュリティの実装

#### 1. **ポリシー作成**
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

#### 2. **MCPサーバーでのコンテキスト設定**
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

### セマンティック検索の詳細

#### 1. **埋め込みパイプライン**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **類似検索の最適化**
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

### 監視と可観測性

#### 1. **Azure Application Insights統合**
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

#### 2. **カスタムメトリクスとログ記録**
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

## トラブルシューティング

### よくある問題と解決策

#### 1. **データベース接続の問題**
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

**一般的な修正方法:**
- PostgreSQLが稼働しているか確認: `docker ps`
- `.env`内の接続パラメータを確認
- データベースが存在するか検証: `docker exec -it pg17 psql -U postgres -l`
- ネットワーク接続をテスト: `telnet localhost 5432`

#### 2. **RLSポリシーの問題**
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

#### 3. **埋め込みサービスの問題**
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

### 性能最適化

#### 1. **接続プールの調整**
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

#### 2. **クエリの最適化**
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

## ベストプラクティス

### セキュリティのベストプラクティス

#### 1. **環境変数管理**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS実装ガイドライン**
- **デフォルト拒否**: 制限的なポリシーから開始
- **定期監査**: ポリシーの有効性を監視
- **徹底的なテスト**: アクセスパターンを検証
- **ポリシーの文書化**: 明確な文書を維持

#### 3. **ネットワークセキュリティ**
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

### 開発のベストプラクティス

#### 1. **エラーハンドリングパターン**
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

#### 2. **テスト戦略**
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

#### 3. **監視とアラート**
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

### デプロイメントのベストプラクティス

#### 1. **コード化されたインフラ**
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

#### 2. **CI/CDパイプライン統合**
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

この包括的なガイドは、PostgreSQL統合を備えた本番対応のMCPサーバーを構築、デプロイ、運用するための基盤を提供します。ここで示されたパターンとプラクティスは、セキュリティ、性能、保守性を維持しながら、他のドメインやユースケースに拡張することができます。

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。