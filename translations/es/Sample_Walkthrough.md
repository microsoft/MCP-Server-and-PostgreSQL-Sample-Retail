<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c86955fe1dbaafcb4540d8875649e2f5",
  "translation_date": "2025-09-29T17:37:17+00:00",
  "source_file": "Sample_Walkthrough.md",
  "language_code": "es"
}
-->
# Ejemplo de Servidor MCP y PostgreSQL - Guía Completa

## Tabla de Contenidos
1. [Resumen](../..)
2. [Análisis Detallado de la Arquitectura](../..)
3. [Construyendo la Solución](../..)
4. [Desglose de Componentes](../..)
5. [Guía de Despliegue](../..)
6. [Usando la Solución](../..)
7. [Características Avanzadas](../..)
8. [Resolución de Problemas](../..)
9. [Mejores Prácticas](../..)

## Resumen

Este recorrido descompone cómo construir y utilizar un **servidor Model Context Protocol (MCP)** listo para producción que se integra con PostgreSQL y servicios de Azure AI. El ejemplo demuestra patrones de nivel empresarial, incluyendo Seguridad a Nivel de Fila, búsqueda semántica y acceso a datos multi-tenant.

### Lo que Aprenderás
- Cómo diseñar un servidor MCP con integración de bases de datos
- Implementar Seguridad a Nivel de Fila para escenarios multi-tenant
- Construir búsqueda semántica con embeddings de Azure OpenAI
- Crear entornos de desarrollo basados en Docker
- Desplegar infraestructura de Azure con plantillas Bicep
- Integrar con VS Code para análisis impulsados por IA

### Tecnologías Utilizadas
- **Protocolo MCP**: Protocolo Model Context para integración de herramientas de IA
- **FastMCP**: Framework moderno de Python para servidores MCP
- **PostgreSQL**: Base de datos con extensión pgvector para búsqueda semántica
- **Azure OpenAI**: Embeddings de texto y modelos GPT opcionales
- **Docker**: Contenerización para entornos consistentes
- **Bicep**: Infraestructura como Código para recursos de Azure
- **VS Code**: Entorno de desarrollo con integración MCP

## 📚 Guía de Aprendizaje Estructurada: /walkthrough

Además de este recorrido técnico, este repositorio incluye una **guía de aprendizaje de 12 módulos** ubicada en el directorio `/walkthrough`. Este enfoque estructurado descompone la implementación compleja en módulos de aprendizaje digeribles, ideal para desarrolladores que desean entender cada componente paso a paso.

### Resumen de los Módulos de Aprendizaje

| Módulo | Tema | Enfoque | Duración |
|--------|------|---------|----------|
| **[00-Introducción](walkthrough/00-Introduction/README.md)** | Fundamentos de MCP | Conceptos básicos, estudio de caso Zava Retail, visión general de la arquitectura | 30 min |
| **[01-Arquitectura](walkthrough/01-Architecture/README.md)** | Diseño del Sistema | Arquitectura técnica, patrones de diseño, relaciones entre componentes | 45 min |
| **[02-Seguridad](walkthrough/02-Security/README.md)** | Seguridad Empresarial | Autenticación en Azure, Seguridad a Nivel de Fila, aislamiento multi-tenant | 60 min |
| **[03-Configuración](walkthrough/03-Setup/README.md)** | Configuración del Entorno | Configuración de Docker, CLI de Azure, inicialización del proyecto | 45 min |
| **[04-Base de Datos](walkthrough/04-Database/README.md)** | Capa de Datos | Esquema de PostgreSQL, configuración de pgvector, políticas RLS, datos de ejemplo | 60 min |
| **[05-Servidor MCP](walkthrough/05-MCP-Server/README.md)** | Implementación Central | Framework FastMCP, integración de bases de datos, desarrollo de herramientas | 90 min |
| **[06-Herramientas](walkthrough/06-Tools/README.md)** | Desarrollo de Herramientas | Creación de herramientas MCP, validación de consultas, inteligencia empresarial | 75 min |
| **[07-Búsqueda Semántica](walkthrough/07-Semantic-Search/README.md)** | Integración de IA | Embeddings de Azure OpenAI, búsqueda vectorial, consultas híbridas | 60 min |
| **[08-Pruebas](walkthrough/08-Testing/README.md)** | Garantía de Calidad | Estrategias de prueba, técnicas de depuración, pruebas de rendimiento | 75 min |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiencia de Desarrollo | Configuración de VS Code, integración de Chat IA, flujos de trabajo de depuración | 45 min |
| **[10-Despliegue](walkthrough/10-Deployment/README.md)** | Despliegue en Producción | Contenerización, Azure Container Apps, pipelines CI/CD | 90 min |
| **[11-Monitoreo](walkthrough/11-Monitoring/README.md)** | Observabilidad | Application Insights, registro estructurado, métricas de rendimiento | 60 min |
| **[12-Mejores Prácticas](walkthrough/12-Best-Practices/README.md)** | Excelencia en Producción | Fortalecimiento de seguridad, optimización, patrones empresariales | 45 min |

### Cómo Usar la Guía de Aprendizaje

**📖 Para Aprender**: Los módulos `/walkthrough` proporcionan instrucciones paso a paso con explicaciones sobre por qué cada componente está diseñado de esa manera. Comienza con el Módulo 00 y avanza de forma secuencial.

**🔧 Para Implementar**: Este archivo Sample_Walkthrough.md ofrece un análisis técnico detallado y desglose de código para desarrolladores que desean entender rápidamente la implementación completa.

**🚀 Para Producción**: Los módulos 02, 10, 11 y 12 se centran específicamente en el despliegue listo para producción, seguridad y consideraciones de monitoreo.

**📚 Ruta de Aprendizaje Completa**: Visita **[/walkthrough/README.md](walkthrough/README.md)** para la visión general completa de la guía de aprendizaje con objetivos de aprendizaje detallados y requisitos previos.

---

## Análisis Detallado de la Arquitectura

### Arquitectura de Alto Nivel

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

### Componentes Principales

#### 1. **Servidor MCP (`sales_analysis.py`)**
- **Framework FastMCP**: Maneja la comunicación HTTP/SSE
- **Registro de Herramientas**: Expone herramientas de consulta y esquema de base de datos
- **Contexto de Solicitud**: Gestiona la identificación de usuarios para RLS
- **Manejo de Errores**: Gestión robusta de errores y registro

#### 2. **Capa de Base de Datos (`sales_analysis_postgres.py`)**
- **Pooling de Conexiones**: Gestión eficiente de conexiones asyncpg
- **Proveedor de Esquema**: Descubrimiento dinámico de esquemas de tablas
- **Ejecución de Consultas**: Ejecución segura de SQL con RLS
- **Búsqueda Semántica**: Búsqueda de similitud vectorial con pgvector

#### 3. **Gestión de Configuración (`config.py`)**
- **Variables de Entorno**: Manejo centralizado de configuración
- **Parámetros de Conexión**: Configuración de base de datos y servicios de Azure
- **Validación**: Validación de variables de entorno requeridas

#### 4. **Infraestructura (`infra/`)**
- **Plantillas Bicep**: Aprovisionamiento declarativo de recursos de Azure
- **Despliegue de Modelos**: Despliegue automatizado de modelos de IA
- **Asignaciones de Roles**: Configuración de roles de seguridad

### Flujo de Datos

```
1. VS Code AI Client sends query
2. MCP Server receives request with RLS headers
3. Server extracts user identity and sets context
4. Database queries execute with RLS filtering
5. Results return through MCP protocol
6. AI Client processes structured response
```

---

## Construyendo la Solución

### Paso 1: Configuración de la Estructura del Proyecto

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

### Paso 2: Dependencias Principales

**Requisitos de Python:**
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

**Requisitos del Sistema:**
- Docker Desktop para contenerización
- CLI de Azure para despliegue
- PostgreSQL con extensión pgvector
- VS Code con extensiones de IA

### Paso 3: Diseño del Esquema de Base de Datos

El ejemplo utiliza una base de datos de retail con estas tablas clave:

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

**Implementación de Seguridad a Nivel de Fila (RLS):**
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

## Desglose de Componentes

### Núcleo del Servidor MCP (`sales_analysis.py`)

#### Patrón de Registro de Herramientas
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

**Características Clave:**
- **Anotaciones de Tipo**: Descripciones de campos Pydantic para comprensión de IA
- **Extracción de Contexto**: Identidad del usuario desde encabezados HTTP
- **Manejo de Errores**: Fallos controlados con mensajes informativos
- **Registro**: Registro exhaustivo de operaciones

#### Gestión del Contexto de Solicitudes
```python
def get_rls_user_id(ctx: Context) -> str:
    """Extract Row Level Security User ID from request context."""
    rls_user_id = get_header(ctx, "x-rls-user-id")
    if rls_user_id is None:
        # Default to placeholder if not provided
        rls_user_id = "00000000-0000-0000-0000-000000000000"
    return rls_user_id
```

### Capa de Base de Datos (`sales_analysis_postgres.py`)

#### Gestión de Pooling de Conexiones
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

**Patrones de Diseño:**
- **Gestión de Recursos**: Manejo adecuado del ciclo de vida del pool
- **Optimización de Rendimiento**: Configuración optimizada de PostgreSQL
- **Recuperación de Errores**: Lógica de reintento y fallback de conexiones
- **Seguridad**: Configuración de contexto RLS por conexión

#### Introspección de Esquema
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

### Integración de Búsqueda Semántica

#### Generación de Embeddings
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

#### Búsqueda de Similitud Vectorial
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

## Guía de Despliegue

### Despliegue de Infraestructura en Azure

#### 1. **Estructura de Plantillas Bicep**

**Plantilla Principal (`main.bicep`):**
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

#### 2. **Automatización del Despliegue**

**Despliegue con PowerShell (`deploy.ps1`):**
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

### Configuración de Desarrollo Local

#### 1. **Configuración de Docker Compose**
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

#### 2. **Inicialización de la Base de Datos**
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

## Usando la Solución

### Integración con VS Code

#### 1. **Configuración MCP (`.vscode/mcp.json`)**
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

#### 2. **Ejemplos de Consultas**

**Descubrimiento de Esquema:**
```
AI: #zava What tables are available in the database?
```
*El servidor MCP utiliza `get_multiple_table_schemas` para devolver estructuras de tablas*

**Análisis de Ventas:**
```
AI: #zava Show me the top 10 products by revenue last quarter
```
*Genera SQL con joins adecuados y filtrado por fecha*

**Búsqueda Semántica:**
```
AI: #zava Find products similar to "waterproof electrical connectors"
```
*Utiliza embeddings para encontrar productos semánticamente similares*

**Análisis Multi-Tienda:**
```
# Switch to Seattle store manager context
AI: #zava-seattle What are our best-selling categories this month?
```
*RLS asegura que solo se accedan datos de la tienda de Seattle*

### Patrones Avanzados de Consultas

#### 1. **Análisis de Series Temporales**
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

#### 2. **Rendimiento de Productos con Categorías**
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

## Características Avanzadas

### Implementación de Seguridad a Nivel de Fila

#### 1. **Creación de Políticas**
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

#### 2. **Configuración de Contexto en el Servidor MCP**
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

### Análisis Detallado de Búsqueda Semántica

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

#### 2. **Optimización de Búsqueda de Similitud**
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

### Monitoreo y Observabilidad

#### 1. **Integración con Azure Application Insights**
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

#### 2. **Métricas Personalizadas y Registro**
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

## Resolución de Problemas

### Problemas Comunes y Soluciones

#### 1. **Problemas de Conexión a la Base de Datos**
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

**Soluciones Comunes:**
- Verifica que PostgreSQL esté ejecutándose: `docker ps`
- Revisa los parámetros de conexión en `.env`
- Valida que la base de datos exista: `docker exec -it pg17 psql -U postgres -l`
- Prueba la conectividad de red: `telnet localhost 5432`

#### 2. **Problemas con Políticas RLS**
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

#### 3. **Problemas con el Servicio de Embeddings**
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

### Optimización de Rendimiento

#### 1. **Ajuste de Pooling de Conexiones**
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

#### 2. **Optimización de Consultas**
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

## Mejores Prácticas

### Mejores Prácticas de Seguridad

#### 1. **Gestión de Variables de Entorno**
```bash
# Use strong, unique passwords
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Rotate service principal credentials regularly
az ad sp credential reset --id $SP_ID --credential-description "Rotated $(date)"

# Use Azure Key Vault in production
az keyvault secret set --vault-name $VAULT_NAME --name "db-password" --value $PASSWORD
```

#### 2. **Directrices para Implementación de RLS**
- **Denegar por Defecto**: Comienza con políticas restrictivas
- **Audita Regularmente**: Monitorea la efectividad de las políticas
- **Prueba Exhaustivamente**: Valida patrones de acceso
- **Documenta las Políticas**: Mantén documentación clara

#### 3. **Seguridad de Red**
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

### Mejores Prácticas de Desarrollo

#### 1. **Patrones de Manejo de Errores**
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

#### 2. **Estrategias de Pruebas**
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

#### 3. **Monitoreo y Alertas**
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

### Mejores Prácticas de Despliegue

#### 1. **Infraestructura como Código**
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

#### 2. **Integración de Pipeline CI/CD**
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

Este recorrido completo proporciona la base para construir, desplegar y operar un servidor MCP listo para producción con integración de PostgreSQL. Los patrones y prácticas demostrados aquí pueden extenderse a otros dominios y casos de uso mientras se mantiene la seguridad, el rendimiento y la mantenibilidad.

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.