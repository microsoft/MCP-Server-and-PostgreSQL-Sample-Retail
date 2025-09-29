<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T17:36:45+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "pt"
}
-->
# Exemplo de Servidor MCP e PostgreSQL - Guia Completo

## Índice
1. [Visão Geral](../..)
2. [Exploração da Arquitetura](../..)
3. [Construção da Solução](../..)
4. [Detalhamento dos Componentes](../..)
5. [Guia de Implementação](../..)
6. [Utilização da Solução](../..)
7. [Funcionalidades Avançadas](../..)
8. [Resolução de Problemas](../..)
9. [Melhores Práticas](../..)

## Visão Geral

Este guia detalha como construir e utilizar um **servidor Model Context Protocol (MCP)** pronto para produção, que integra PostgreSQL e serviços de IA da Azure. O exemplo demonstra padrões empresariais, incluindo Segurança a Nível de Linha (Row Level Security), pesquisa semântica e acesso a dados multi-inquilino.

### O que irá aprender
- Como arquitetar um servidor MCP com integração de base de dados
- Implementação de Segurança a Nível de Linha para cenários multi-inquilino
- Construção de pesquisa semântica com embeddings do Azure OpenAI
- Criação de ambientes de desenvolvimento baseados em Docker
- Implementação de infraestrutura Azure com templates Bicep
- Integração com VS Code para análises impulsionadas por IA

### Tecnologias Utilizadas
- **Protocolo MCP**: Protocolo de Contexto de Modelo para integração de ferramentas de IA
- **FastMCP**: Framework moderno de servidor MCP em Python
- **PostgreSQL**: Base de dados com extensão pgvector para pesquisa semântica
- **Azure OpenAI**: Embeddings de texto e modelos GPT opcionais
- **Docker**: Containerização para ambientes consistentes
- **Bicep**: Infraestrutura como Código para recursos Azure
- **VS Code**: Ambiente de desenvolvimento com integração MCP

## 📚 Guia de Aprendizagem Estruturado: /walkthrough

Além deste guia técnico, este repositório inclui um **guia de aprendizagem com 12 módulos** localizado no diretório `/walkthrough`. Esta abordagem estruturada divide a implementação complexa em módulos de aprendizagem acessíveis, ideal para programadores que desejam compreender cada componente passo a passo.

### Resumo dos Módulos de Aprendizagem

| Módulo | Tópico | Foco | Duração |
|--------|-------|-------|----------|
| **[00-Introdução](walkthrough/00-Introduction/README.md)** | Fundamentos do MCP | Conceitos principais, estudo de caso Zava Retail, visão geral da arquitetura | 30 min |
| **[01-Arquitetura](walkthrough/01-Architecture/README.md)** | Design do Sistema | Arquitetura técnica, padrões de design, relações entre componentes | 45 min |
| **[02-Segurança](walkthrough/02-Security/README.md)** | Segurança Empresarial | Autenticação Azure, Segurança a Nível de Linha, isolamento multi-inquilino | 60 min |
| **[03-Configuração](walkthrough/03-Setup/README.md)** | Configuração do Ambiente | Configuração do Docker, CLI Azure, inicialização do projeto | 45 min |
| **[04-Base de Dados](walkthrough/04-Database/README.md)** | Camada de Dados | Esquema PostgreSQL, configuração pgvector, políticas RLS, dados de exemplo | 60 min |
| **[05-Servidor MCP](walkthrough/05-MCP-Server/README.md)** | Implementação Principal | Framework FastMCP, integração de base de dados, desenvolvimento de ferramentas | 90 min |
| **[06-Ferramentas](walkthrough/06-Tools/README.md)** | Desenvolvimento de Ferramentas | Criação de ferramentas MCP, validação de consultas, inteligência empresarial | 75 min |
| **[07-Pesquisa Semântica](walkthrough/07-Semantic-Search/README.md)** | Integração de IA | Embeddings do Azure OpenAI, pesquisa vetorial, consultas híbridas | 60 min |
| **[08-Testes](walkthrough/08-Testing/README.md)** | Garantia de Qualidade | Estratégias de teste, técnicas de depuração, testes de desempenho | 75 min |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiência de Desenvolvimento | Configuração do VS Code, integração de Chat IA, fluxos de depuração | 45 min |
| **[10-Implementação](walkthrough/10-Deployment/README.md)** | Implementação em Produção | Containerização, Azure Container Apps, pipelines CI/CD | 90 min |
| **[11-Monitorização](walkthrough/11-Monitoring/README.md)** | Observabilidade | Application Insights, registo estruturado, métricas de desempenho | 60 min |
| **[12-Melhores Práticas](walkthrough/12-Best-Practices/README.md)** | Excelência em Produção | Reforço de segurança, otimização, padrões empresariais | 45 min |

### Como Utilizar o Guia de Aprendizagem

**📖 Para Aprendizagem**: Os módulos `/walkthrough` fornecem instruções passo a passo com explicações sobre o design de cada componente. Comece pelo Módulo 00 e avance sequencialmente.

**🔧 Para Implementação**: Este Sample_Walkthrough.md oferece uma análise técnica detalhada e explicação do código para programadores que desejam compreender rapidamente a implementação completa.

**🚀 Para Produção**: Os módulos 02, 10, 11 e 12 focam especificamente na implementação pronta para produção, segurança e considerações de monitorização.

**📚 Caminho de Aprendizagem Completo**: Visite **[/walkthrough/README.md](walkthrough/README.md)** para a visão geral completa do guia de aprendizagem com objetivos detalhados e pré-requisitos.

---

## Exploração da Arquitetura

### Arquitetura de Alto Nível

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

### Componentes Principais

#### 1. **Servidor MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Gerencia comunicação HTTP/SSE
- **Registo de Ferramentas**: Expõe ferramentas de consulta e esquema de base de dados
- **Contexto de Pedido**: Gerencia identificação de utilizador para RLS
- **Gestão de Erros**: Gestão robusta de erros e registo

#### 2. **Camada de Base de Dados (`sales_analysis_postgres.py`)**
- **Pooling de Conexões**: Gestão eficiente de conexões asyncpg
- **Provedor de Esquema**: Descoberta dinâmica de esquemas de tabelas
- **Execução de Consultas**: Execução segura de SQL com RLS
- **Pesquisa Semântica**: Pesquisa de similaridade vetorial com pgvector

#### 3. **Gestão de Configuração (`config.py`)**
- **Variáveis de Ambiente**: Gestão centralizada de configuração
- **Parâmetros de Conexão**: Configuração de base de dados e serviços Azure
- **Validação**: Validação de variáveis de ambiente obrigatórias

#### 4. **Infraestrutura (`infra/`)**
- **Templates Bicep**: Provisionamento declarativo de recursos Azure
- **Implementação de Modelos**: Implementação automatizada de modelos de IA
- **Atribuições de Funções**: Configuração de funções de segurança

### Fluxo de Dados

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Construção da Solução

### Passo 1: Configuração da Estrutura do Projeto

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

### Passo 2: Dependências Principais

**Requisitos Python:**
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

**Requisitos do Sistema:**
- Docker Desktop para containerização
- CLI Azure para implementação
- PostgreSQL com extensão pgvector
- VS Code com extensões de IA

### Passo 3: Design do Esquema da Base de Dados

O exemplo utiliza uma base de dados de retalho com estas tabelas principais:

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

**Implementação de Segurança a Nível de Linha (RLS):**
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

## Detalhamento dos Componentes

### Núcleo do Servidor MCP (`sales_analysis.py`)

#### Padrão de Registo de Ferramentas
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

**Funcionalidades Principais:**
- **Anotações de Tipo**: Descrições de campos Pydantic para compreensão por IA
- **Extração de Contexto**: Identidade do utilizador a partir de cabeçalhos HTTP
- **Gestão de Erros**: Falhas controladas com mensagens informativas
- **Registo**: Registo abrangente de operações

#### Gestão de Contexto de Pedido
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Camada de Base de Dados (`sales_analysis_postgres.py`)

#### Gestão de Pool de Conexões
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

**Padrões de Design:**
- **Gestão de Recursos**: Gestão adequada do ciclo de vida do pool
- **Otimização de Desempenho**: Configurações otimizadas do PostgreSQL
- **Recuperação de Erros**: Retentativa de conexão e lógica de fallback
- **Segurança**: Configuração de contexto RLS por conexão

#### Introspecção de Esquema
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

### Integração de Pesquisa Semântica

#### Geração de Embeddings
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

#### Pesquisa de Similaridade Vetorial
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

## Guia de Implementação

### Implementação de Infraestrutura Azure

#### 1. **Estrutura de Template Bicep**

**Template Principal (`main.bicep`):**
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

#### 2. **Automação de Implementação**

**Implementação PowerShell (`deploy.ps1`):**
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

### Configuração de Desenvolvimento Local

#### 1. **Configuração Docker Compose**
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

#### 2. **Inicialização da Base de Dados**
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

## Utilização da Solução

### Integração com VS Code

#### 1. **Configuração MCP (`.vscode/mcp.json`)**
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

#### 2. **Exemplos de Consultas**

**Descoberta de Esquema:**
```
AI: #zava What tables are available in the database?
```
*O servidor MCP utiliza `get_multiple_table_schemas` para retornar estruturas de tabelas*

**Análise de Vendas:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Gera SQL com joins adequados e filtragem por data*

**Pesquisa Semântica:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Utiliza embeddings para encontrar produtos semanticamente semelhantes*

**Análise Multi-Loja:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS garante acesso apenas aos dados da loja de Seattle*

### Padrões Avançados de Consulta

#### 1. **Análise de Séries Temporais**
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

#### 2. **Desempenho de Produtos com Categorias**
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

## Funcionalidades Avançadas

### Implementação de Segurança a Nível de Linha

#### 1. **Criação de Políticas**
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

#### 2. **Configuração de Contexto no Servidor MCP**
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

### Exploração da Pesquisa Semântica

#### 1. **Pipeline de Embeddings**
```python
# Generate embeddings for product descriptions
async def generate_product_embeddings():
    products = await get_all_products()
    
    for product in products:
        description = f"{product.name} {product.description} {product.category}"
        embedding = embedding_client.generate_embedding(description)
        
        await store_embedding(product.id, embedding)
```

#### 2. **Otimização de Pesquisa de Similaridade**
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

### Monitorização e Observabilidade

#### 1. **Integração com Azure Application Insights**
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

#### 2. **Métricas e Registo Personalizados**
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

## Resolução de Problemas

### Problemas Comuns e Soluções

#### 1. **Problemas de Conexão à Base de Dados**
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

**Soluções Comuns:**
- Verifique se o PostgreSQL está em execução: `docker ps`
- Confirme os parâmetros de conexão em `.env`
- Valide se a base de dados existe: `docker exec -it pg17 psql -U postgres -l`
- Teste a conectividade de rede: `telnet localhost 5432`

#### 2. **Problemas com Políticas RLS**
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

#### 3. **Problemas com Serviço de Embeddings**
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

### Otimização de Desempenho

#### 1. **Ajuste de Pool de Conexões**
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

#### 2. **Otimização de Consultas**
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

## Melhores Práticas

### Melhores Práticas de Segurança

#### 1. **Gestão de Variáveis de Ambiente**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Diretrizes para Implementação de RLS**
- **Negação Padrão**: Comece com políticas restritivas
- **Audite Regularmente**: Monitorize a eficácia das políticas
- **Teste Minuciosamente**: Valide padrões de acesso
- **Documente Políticas**: Mantenha documentação clara

#### 3. **Segurança de Rede**
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

### Melhores Práticas de Desenvolvimento

#### 1. **Padrões de Gestão de Erros**
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

#### 2. **Estratégias de Teste**
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

#### 3. **Monitorização e Alertas**
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

### Melhores Práticas de Implementação

#### 1. **Infraestrutura como Código**
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

#### 2. **Integração de Pipeline CI/CD**
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

Este guia completo fornece a base para construir, implementar e operar um servidor MCP pronto para produção com integração PostgreSQL. Os padrões e práticas demonstrados aqui podem ser estendidos para outros domínios e casos de uso, mantendo segurança, desempenho e facilidade de manutenção.

---

**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.