<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T16:58:08+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "ko"
}
-->
# MCP 서버와 PostgreSQL 샘플 - 완벽한 가이드

## 목차
1. [개요](../..)
2. [아키텍처 심층 분석](../..)
3. [솔루션 구축](../..)
4. [구성 요소 분석](../..)
5. [배포 가이드](../..)
6. [솔루션 사용법](../..)
7. [고급 기능](../..)
8. [문제 해결](../..)
9. [모범 사례](../..)

## 개요

이 가이드는 **Model Context Protocol (MCP) 서버**를 구축하고 PostgreSQL 및 Azure AI 서비스를 통합하여 프로덕션 환경에서 활용하는 방법을 설명합니다. 샘플은 행 수준 보안(Row Level Security), 의미 검색, 멀티 테넌트 데이터 접근 등 엔터프라이즈급 패턴을 보여줍니다.

### 학습 내용
- 데이터베이스 통합을 포함한 MCP 서버 아키텍처 설계
- 멀티 테넌트 시나리오를 위한 행 수준 보안 구현
- Azure OpenAI 임베딩을 활용한 의미 검색 구축
- Docker 기반 개발 환경 생성
- Bicep 템플릿을 사용한 Azure 인프라 배포
- VS Code를 활용한 AI 분석 통합

### 사용 기술
- **MCP Protocol**: AI 도구 통합을 위한 모델 컨텍스트 프로토콜
- **FastMCP**: 현대적인 Python MCP 서버 프레임워크
- **PostgreSQL**: pgvector 확장을 활용한 데이터베이스 및 의미 검색
- **Azure OpenAI**: 텍스트 임베딩 및 선택적 GPT 모델
- **Docker**: 일관된 환경을 위한 컨테이너화
- **Bicep**: Azure 리소스를 위한 코드형 인프라
- **VS Code**: MCP 통합 개발 환경

## 📚 구조화된 학습 가이드: /walkthrough

이 기술 가이드 외에도, 이 저장소에는 `/walkthrough` 디렉터리에 위치한 **12개 모듈 학습 가이드**가 포함되어 있습니다. 이 구조화된 접근법은 복잡한 구현을 단계별로 나누어 개발자가 각 구성 요소를 쉽게 이해할 수 있도록 돕습니다.

### 학습 모듈 개요

| 모듈 | 주제 | 초점 | 소요 시간 |
|------|------|------|-----------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | MCP 기본 개념 | 핵심 개념, Zava Retail 사례 연구, 아키텍처 개요 | 30분 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | 시스템 설계 | 기술 아키텍처, 설계 패턴, 구성 요소 관계 | 45분 |
| **[02-Security](walkthrough/02-Security/README.md)** | 엔터프라이즈 보안 | Azure 인증, 행 수준 보안, 멀티 테넌트 분리 | 60분 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | 환경 설정 | Docker 구성, Azure CLI, 프로젝트 초기화 | 45분 |
| **[04-Database](walkthrough/04-Database/README.md)** | 데이터 계층 | PostgreSQL 스키마, pgvector 설정, RLS 정책, 샘플 데이터 | 60분 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | 핵심 구현 | FastMCP 프레임워크, 데이터베이스 통합, 도구 개발 | 90분 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | 도구 개발 | MCP 도구 생성, 쿼리 검증, 비즈니스 인텔리전스 | 75분 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI 통합 | Azure OpenAI 임베딩, 벡터 검색, 하이브리드 쿼리 | 60분 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | 품질 보증 | 테스트 전략, 디버깅 기술, 성능 테스트 | 75분 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | 개발 경험 | VS Code 구성, AI 채팅 통합, 디버깅 워크플로 | 45분 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | 프로덕션 배포 | 컨테이너화, Azure Container Apps, CI/CD 파이프라인 | 90분 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | 관찰 가능성 | Application Insights, 구조화된 로깅, 성능 메트릭 | 60분 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | 프로덕션 우수 사례 | 보안 강화, 최적화, 엔터프라이즈 패턴 | 45분 |

### 학습 가이드 활용 방법

**📖 학습용**: `/walkthrough` 모듈은 각 구성 요소가 왜 그렇게 설계되었는지에 대한 설명과 함께 단계별 지침을 제공합니다. 모듈 00부터 순차적으로 진행하세요.

**🔧 구현용**: 이 Sample_Walkthrough.md는 전체 구현을 빠르게 이해하고자 하는 개발자를 위한 기술 심층 분석과 코드 설명을 제공합니다.

**🚀 프로덕션용**: 모듈 02, 10, 11, 12는 프로덕션 배포, 보안, 모니터링에 중점을 둡니다.

**📚 전체 학습 경로**: **[/walkthrough/README.md](walkthrough/README.md)**를 방문하여 자세한 학습 목표와 사전 요구 사항을 확인하세요.

---

## 아키텍처 심층 분석

### 고급 아키텍처

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

### 핵심 구성 요소

#### 1. **MCP 서버 (`sales_analysis.py`)**
- **FastMCP 프레임워크**: HTTP/SSE 프로토콜 통신 처리
- **도구 등록**: 데이터베이스 쿼리 및 스키마 도구 노출
- **요청 컨텍스트**: RLS 사용자 식별 관리
- **오류 처리**: 강력한 오류 관리 및 로깅

#### 2. **데이터베이스 계층 (`sales_analysis_postgres.py`)**
- **연결 풀링**: 효율적인 asyncpg 연결 관리
- **스키마 제공자**: 동적 테이블 스키마 검색
- **쿼리 실행**: RLS를 활용한 안전한 SQL 실행
- **의미 검색**: pgvector를 활용한 벡터 유사성 검색

#### 3. **구성 관리 (`config.py`)**
- **환경 변수**: 중앙 집중식 구성 관리
- **연결 매개변수**: 데이터베이스 및 Azure 서비스 구성
- **유효성 검사**: 필수 환경 변수 검증

#### 4. **인프라 (`infra/`)**
- **Bicep 템플릿**: 선언적 Azure 리소스 프로비저닝
- **모델 배포**: 자동화된 AI 모델 배포
- **역할 할당**: 보안 역할 구성

### 데이터 흐름

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## 솔루션 구축

### 1단계: 프로젝트 구조 설정

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

### 2단계: 핵심 종속성

**Python 요구 사항:**
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

**시스템 요구 사항:**
- 컨테이너화를 위한 Docker Desktop
- 배포를 위한 Azure CLI
- pgvector 확장이 포함된 PostgreSQL
- AI 확장이 포함된 VS Code

### 3단계: 데이터베이스 스키마 설계

샘플은 다음 주요 테이블을 포함한 소매 데이터베이스를 사용합니다:

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

**행 수준 보안(RLS) 구현:**
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

## 구성 요소 분석

### MCP 서버 핵심 (`sales_analysis.py`)

#### 도구 등록 패턴
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

**주요 기능:**
- **타입 주석**: AI 이해를 위한 Pydantic 필드 설명
- **컨텍스트 추출**: HTTP 헤더에서 사용자 식별
- **오류 처리**: 정보 제공 메시지를 통한 우아한 실패 처리
- **로깅**: 포괄적인 작업 로깅

#### 요청 컨텍스트 관리
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### 데이터베이스 계층 (`sales_analysis_postgres.py`)

#### 연결 풀 관리
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

**설계 패턴:**
- **리소스 관리**: 적절한 풀 라이프사이클 관리
- **성능 튜닝**: 최적화된 PostgreSQL 설정
- **오류 복구**: 연결 재시도 및 대체 로직
- **보안**: 연결당 RLS 컨텍스트 설정

#### 스키마 탐색
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

### 의미 검색 통합

#### 임베딩 생성
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

#### 벡터 유사성 검색
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

## 배포 가이드

### Azure 인프라 배포

#### 1. **Bicep 템플릿 구조**

**메인 템플릿 (`main.bicep`):**
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

#### 2. **배포 자동화**

**PowerShell 배포 (`deploy.ps1`):**
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

### 로컬 개발 설정

#### 1. **Docker Compose 구성**
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

#### 2. **데이터베이스 초기화**
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

## 솔루션 사용법

### VS Code 통합

#### 1. **MCP 구성 (`.vscode/mcp.json`)**
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

#### 2. **쿼리 예제**

**스키마 검색:**
```
AI: #zava What tables are available in the database?
```
*MCP 서버는 `get_multiple_table_schemas`를 사용하여 테이블 구조를 반환합니다*

**판매 분석:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*적절한 조인 및 날짜 필터링을 포함한 SQL 생성*

**의미 검색:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*임베딩을 사용하여 의미적으로 유사한 제품 검색*

**멀티 스토어 분석:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS는 시애틀 매장 데이터만 접근 가능하도록 보장합니다*

### 고급 쿼리 패턴

#### 1. **시계열 분석**
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

#### 2. **카테고리별 제품 성과**
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

## 고급 기능

### 행 수준 보안 구현

#### 1. **정책 생성**
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

#### 2. **MCP 서버에서 컨텍스트 설정**
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

### 의미 검색 심층 분석

#### 1. **임베딩 파이프라인**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **유사성 검색 최적화**
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

### 모니터링 및 관찰 가능성

#### 1. **Azure Application Insights 통합**
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

#### 2. **맞춤형 메트릭 및 로깅**
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

## 문제 해결

### 일반적인 문제와 해결책

#### 1. **데이터베이스 연결 문제**
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

**일반적인 해결책:**
- PostgreSQL 실행 확인: `docker ps`
- `.env`의 연결 매개변수 확인
- 데이터베이스 존재 여부 확인: `docker exec -it pg17 psql -U postgres -l`
- 네트워크 연결 테스트: `telnet localhost 5432`

#### 2. **RLS 정책 문제**
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

#### 3. **임베딩 서비스 문제**
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

### 성능 최적화

#### 1. **연결 풀 튜닝**
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

#### 2. **쿼리 최적화**
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

## 모범 사례

### 보안 모범 사례

#### 1. **환경 변수 관리**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **RLS 구현 지침**
- **기본 거부**: 제한적인 정책으로 시작
- **정기 감사**: 정책 효과 모니터링
- **철저한 테스트**: 접근 패턴 검증
- **정책 문서화**: 명확한 문서 유지

#### 3. **네트워크 보안**
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

### 개발 모범 사례

#### 1. **오류 처리 패턴**
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

#### 2. **테스트 전략**
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

#### 3. **모니터링 및 알림**
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

### 배포 모범 사례

#### 1. **코드형 인프라**
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

#### 2. **CI/CD 파이프라인 통합**
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

이 완벽한 가이드는 PostgreSQL 통합을 포함한 프로덕션 준비 MCP 서버를 구축, 배포 및 운영하는 데 필요한 기초를 제공합니다. 여기서 보여준 패턴과 실천 방법은 보안, 성능, 유지 관리성을 유지하면서 다른 도메인 및 사용 사례로 확장할 수 있습니다.

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.