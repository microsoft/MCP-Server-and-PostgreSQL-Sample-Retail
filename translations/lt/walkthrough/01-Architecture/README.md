<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "907b008a90c728fd33a1c0f66889e8e2",
  "translation_date": "2025-09-30T08:49:43+00:00",
  "source_file": "walkthrough/01-Architecture/README.md",
  "language_code": "lt"
}
-->
# Pagrindinės architektūros sąvokos

## 🎯 Ką apima šis modulis

Šis modulis išsamiai nagrinėja MCP serverio architektūros modelius, duomenų bazių projektavimo principus ir technines įgyvendinimo strategijas, kurios užtikrina patikimas, mastelio keičiamas, su duomenų bazėmis integruotas AI programas.

## Apžvalga

Norint sukurti gamybai paruoštą MCP serverį su duomenų bazių integracija, reikia atidžiai priimti architektūrinius sprendimus. Šiame modulyje išskaidomi pagrindiniai komponentai, projektavimo modeliai ir techniniai aspektai, kurie mūsų „Zava Retail“ analitikos sprendimą daro patikimą, saugų ir mastelio keičiamą.

Jūs suprasite, kaip sąveikauja kiekvienas sluoksnis, kodėl buvo pasirinktos tam tikros technologijos ir kaip pritaikyti šiuos modelius savo MCP įgyvendinimuose.

## Mokymosi tikslai

Baigę šį modulį, jūs galėsite:

- **Analizuoti** MCP serverio su duomenų bazių integracija sluoksniuotą architektūrą
- **Suprasti** kiekvieno architektūrinio komponento vaidmenį ir atsakomybę
- **Sukurti** duomenų bazių schemas, palaikančias kelių nuomininkų MCP programas
- **Įgyvendinti** jungčių telkimo ir išteklių valdymo strategijas
- **Taikyti** klaidų tvarkymo ir žurnalų rašymo modelius gamybos sistemoms
- **Įvertinti** skirtingų architektūrinių požiūrių privalumus ir trūkumus

## 🏗️ MCP serverio architektūros sluoksniai

Mūsų MCP serveris naudoja **sluoksniuotą architektūrą**, kuri atskiria atsakomybes ir skatina palaikomumą:

### 1 sluoksnis: Protokolo sluoksnis (FastMCP)
**Atsakomybė**: MCP protokolo komunikacijos ir pranešimų maršrutizavimas

```python
# FastMCP server setup
from fastmcp import FastMCP

mcp = FastMCP("Zava Retail Analytics")

# Tool registration with type safety
@mcp.tool()
async def execute_sales_query(
    ctx: Context,
    postgresql_query: Annotated[str, Field(description="Well-formed PostgreSQL query")]
) -> str:
    """Execute PostgreSQL queries with Row Level Security."""
    return await query_executor.execute(postgresql_query, ctx)
```

**Pagrindinės savybės**:
- **Protokolo atitiktis**: Pilnas MCP specifikacijos palaikymas
- **Tipų saugumas**: Pydantic modeliai užklausų/atsakymų validacijai
- **Asinchroninis palaikymas**: Neužblokuojantis I/O dideliam lygiagretumui
- **Klaidų tvarkymas**: Standartizuoti klaidų atsakymai

### 2 sluoksnis: Verslo logikos sluoksnis
**Atsakomybė**: Verslo taisyklių įgyvendinimas ir koordinavimas tarp protokolo ir duomenų sluoksnių

```python
class SalesAnalyticsService:
    """Business logic for retail analytics operations."""
    
    async def get_store_performance(
        self, 
        store_id: str, 
        time_period: str
    ) -> Dict[str, Any]:
        """Calculate store performance metrics."""
        
        # Validate business rules
        if not self._validate_store_access(store_id):
            raise UnauthorizedError("Access denied for store")
        
        # Coordinate data retrieval
        sales_data = await self.db_provider.get_sales_data(store_id, time_period)
        metrics = self._calculate_metrics(sales_data)
        
        return {
            "store_id": store_id,
            "period": time_period,
            "metrics": metrics,
            "insights": self._generate_insights(metrics)
        }
```

**Pagrindinės savybės**:
- **Verslo taisyklių laikymasis**: Parduotuvės prieigos validacija ir duomenų vientisumas
- **Paslaugų koordinavimas**: Orkestravimas tarp duomenų bazių ir AI paslaugų
- **Duomenų transformacija**: Žalių duomenų pavertimas verslo įžvalgomis
- **Talpyklos strategija**: Dažnų užklausų našumo optimizavimas

### 3 sluoksnis: Duomenų prieigos sluoksnis
**Atsakomybė**: Duomenų bazių jungčių valdymas, užklausų vykdymas ir duomenų susiejimas

```python
class PostgreSQLProvider:
    """Data access layer for PostgreSQL operations."""
    
    def __init__(self, connection_config: Dict[str, Any]):
        self.connection_pool: Optional[Pool] = None
        self.config = connection_config
    
    async def execute_query(
        self, 
        query: str, 
        rls_user_id: str
    ) -> List[Dict[str, Any]]:
        """Execute query with RLS context."""
        
        async with self.connection_pool.acquire() as conn:
            # Set RLS context
            await conn.execute(
                "SELECT set_config('app.current_rls_user_id', $1, false)",
                rls_user_id
            )
            
            # Execute query with timeout
            try:
                rows = await asyncio.wait_for(
                    conn.fetch(query),
                    timeout=30.0
                )
                return [dict(row) for row in rows]
            except asyncio.TimeoutError:
                raise QueryTimeoutError("Query execution exceeded timeout")
```

**Pagrindinės savybės**:
- **Jungčių telkimas**: Efektyvus išteklių valdymas
- **Sandorių valdymas**: ACID atitiktis ir atšaukimo tvarkymas
- **Užklausų optimizavimas**: Našumo stebėjimas ir optimizavimas
- **RLS integracija**: Eilučių lygio saugumo konteksto valdymas

### 4 sluoksnis: Infrastruktūros sluoksnis
**Atsakomybė**: Kryžminių funkcijų, tokių kaip žurnalų rašymas, stebėjimas ir konfigūracija, valdymas

```python
class InfrastructureManager:
    """Infrastructure concerns management."""
    
    def __init__(self):
        self.logger = self._setup_logging()
        self.metrics = self._setup_metrics()
        self.config = self._load_configuration()
    
    def _setup_logging(self) -> Logger:
        """Configure structured logging."""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            handlers=[
                logging.StreamHandler(),
                logging.FileHandler('mcp_server.log')
            ]
        )
        return logging.getLogger(__name__)
    
    async def track_query_execution(
        self, 
        query_type: str, 
        duration: float, 
        success: bool
    ):
        """Track query performance metrics."""
        self.metrics.counter('query_total').labels(
            type=query_type,
            status='success' if success else 'error'
        ).inc()
        
        self.metrics.histogram('query_duration').labels(
            type=query_type
        ).observe(duration)
```

## 🗄️ Duomenų bazių projektavimo modeliai

Mūsų PostgreSQL schema įgyvendina kelis pagrindinius modelius kelių nuomininkų MCP programoms:

### 1. Kelių nuomininkų schemos dizainas

```sql
-- Core retail entities with store-based partitioning
CREATE TABLE retail.stores (
    store_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    location VARCHAR(200) NOT NULL,
    manager_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE retail.customers (
    customer_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    store_id UUID REFERENCES retail.stores(store_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE retail.orders (
    order_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID REFERENCES retail.customers(customer_id),
    store_id UUID REFERENCES retail.stores(store_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending'
);
```

**Projektavimo principai**:
- **Užsienio raktų nuoseklumas**: Užtikrinti duomenų vientisumą tarp lentelių
- **Parduotuvės ID propagavimas**: Kiekviena transakcinė lentelė turi store_id
- **UUID pirminiai raktai**: Visuotinai unikalūs identifikatoriai paskirstytoms sistemoms
- **Laiko žymų sekimas**: Audito pėdsakas visiems duomenų pakeitimams

### 2. Eilučių lygio saugumo (RLS) įgyvendinimas

```sql
-- Enable RLS on multi-tenant tables
ALTER TABLE retail.customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE retail.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE retail.order_items ENABLE ROW LEVEL SECURITY;

-- Store manager can only see their store's data
CREATE POLICY store_manager_customers ON retail.customers
    FOR ALL TO store_managers
    USING (store_id = get_current_user_store());

CREATE POLICY store_manager_orders ON retail.orders
    FOR ALL TO store_managers
    USING (store_id = get_current_user_store());

-- Regional managers see multiple stores
CREATE POLICY regional_manager_orders ON retail.orders
    FOR ALL TO regional_managers
    USING (store_id = ANY(get_user_store_list()));

-- Support function for RLS context
CREATE OR REPLACE FUNCTION get_current_user_store()
RETURNS UUID AS $$
BEGIN
    RETURN current_setting('app.current_rls_user_id')::UUID;
EXCEPTION WHEN OTHERS THEN
    RETURN '00000000-0000-0000-0000-000000000000'::UUID;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

**RLS privalumai**:
- **Automatinis filtravimas**: Duomenų bazė užtikrina duomenų izoliaciją
- **Programos paprastumas**: Nereikia sudėtingų WHERE sąlygų
- **Saugumas pagal nutylėjimą**: Neįmanoma netyčia pasiekti neteisingų duomenų
- **Audito atitiktis**: Aiškios duomenų prieigos ribos

### 3. Vektorinės paieškos schema

```sql
-- Product embeddings for semantic search
CREATE TABLE retail.product_description_embeddings (
    product_id UUID PRIMARY KEY REFERENCES retail.products(product_id),
    description_embedding vector(1536),
    last_updated TIMESTAMP DEFAULT NOW()
);

-- Optimize vector similarity search
CREATE INDEX idx_product_embeddings_vector 
ON retail.product_description_embeddings 
USING ivfflat (description_embedding vector_cosine_ops);

-- Semantic search function
CREATE OR REPLACE FUNCTION search_products_by_description(
    query_embedding vector(1536),
    similarity_threshold FLOAT DEFAULT 0.7,
    max_results INTEGER DEFAULT 20
)
RETURNS TABLE(
    product_id UUID,
    name VARCHAR,
    description TEXT,
    similarity_score FLOAT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.product_id,
        p.name,
        p.description,
        (1 - (pde.description_embedding <=> query_embedding)) AS similarity_score
    FROM retail.products p
    JOIN retail.product_description_embeddings pde ON p.product_id = pde.product_id
    WHERE (pde.description_embedding <=> query_embedding) <= (1 - similarity_threshold)
    ORDER BY similarity_score DESC
    LIMIT max_results;
END;
$$ LANGUAGE plpgsql;
```

## 🔌 Jungčių valdymo modeliai

Efektyvus duomenų bazių jungčių valdymas yra esminis MCP serverio našumui:

### Jungčių telkimo konfigūracija

```python
class ConnectionPoolManager:
    """Manages PostgreSQL connection pools."""
    
    async def create_pool(self) -> Pool:
        """Create optimized connection pool."""
        return await asyncpg.create_pool(
            host=self.config.db_host,
            port=self.config.db_port,
            database=self.config.db_name,
            user=self.config.db_user,
            password=self.config.db_password,
            
            # Pool configuration
            min_size=2,          # Minimum connections
            max_size=10,         # Maximum connections
            max_inactive_connection_lifetime=300,  # 5 minutes
            
            # Query configuration
            command_timeout=30,   # Query timeout
            server_settings={
                "application_name": "zava-mcp-server",
                "jit": "off",          # Disable JIT for stability
                "work_mem": "4MB",     # Limit work memory
                "statement_timeout": "30s"
            }
        )
    
    async def execute_with_retry(
        self, 
        query: str, 
        params: Tuple = None,
        max_retries: int = 3
    ) -> List[Dict[str, Any]]:
        """Execute query with automatic retry logic."""
        
        for attempt in range(max_retries):
            try:
                async with self.pool.acquire() as conn:
                    if params:
                        rows = await conn.fetch(query, *params)
                    else:
                        rows = await conn.fetch(query)
                    return [dict(row) for row in rows]
                    
            except (ConnectionError, InterfaceError) as e:
                if attempt == max_retries - 1:
                    raise
                
                # Exponential backoff
                await asyncio.sleep(2 ** attempt)
                logger.warning(f"Database connection failed, retrying ({attempt + 1}/{max_retries})")
```

### Išteklių gyvavimo ciklo valdymas

```python
class MCPServerManager:
    """Manages MCP server lifecycle and resources."""
    
    async def startup(self):
        """Initialize server resources."""
        # Create database connection pool
        self.db_pool = await self.pool_manager.create_pool()
        
        # Initialize AI services
        self.ai_client = await self.create_ai_client()
        
        # Setup monitoring
        self.metrics_collector = MetricsCollector()
        
        logger.info("MCP server startup complete")
    
    async def shutdown(self):
        """Cleanup server resources."""
        try:
            # Close database connections
            if self.db_pool:
                await self.db_pool.close()
            
            # Cleanup AI client
            if self.ai_client:
                await self.ai_client.close()
            
            # Flush metrics
            await self.metrics_collector.flush()
            
            logger.info("MCP server shutdown complete")
            
        except Exception as e:
            logger.error(f"Error during shutdown: {e}")
    
    async def health_check(self) -> Dict[str, str]:
        """Verify server health status."""
        status = {}
        
        # Check database connection
        try:
            async with self.db_pool.acquire() as conn:
                await conn.fetchval("SELECT 1")
            status["database"] = "healthy"
        except Exception as e:
            status["database"] = f"unhealthy: {e}"
        
        # Check AI service
        try:
            await self.ai_client.health_check()
            status["ai_service"] = "healthy"
        except Exception as e:
            status["ai_service"] = f"unhealthy: {e}"
        
        return status
```

## 🛡️ Klaidų tvarkymo ir atsparumo modeliai

Patikimas klaidų tvarkymas užtikrina MCP serverio veikimo patikimumą:

### Hierarchiniai klaidų tipai

```python
class MCPError(Exception):
    """Base MCP server error."""
    def __init__(self, message: str, error_code: str = "MCP_ERROR"):
        self.message = message
        self.error_code = error_code
        super().__init__(message)

class DatabaseError(MCPError):
    """Database operation errors."""
    def __init__(self, message: str, query: str = None):
        super().__init__(message, "DATABASE_ERROR")
        self.query = query

class AuthorizationError(MCPError):
    """Access control errors."""
    def __init__(self, message: str, user_id: str = None):
        super().__init__(message, "AUTHORIZATION_ERROR")
        self.user_id = user_id

class QueryTimeoutError(DatabaseError):
    """Query execution timeout."""
    def __init__(self, query: str):
        super().__init__(f"Query timeout: {query[:100]}...", query)
        self.error_code = "QUERY_TIMEOUT"

class ValidationError(MCPError):
    """Input validation errors."""
    def __init__(self, field: str, value: Any, constraint: str):
        message = f"Validation failed for {field}: {constraint}"
        super().__init__(message, "VALIDATION_ERROR")
        self.field = field
        self.value = value
```

### Klaidų tvarkymo tarpinė programinė įranga

```python
@contextmanager
async def error_handling_context(operation_name: str, user_id: str = None):
    """Centralized error handling for operations."""
    start_time = time.time()
    
    try:
        yield
        
        # Success metrics
        duration = time.time() - start_time
        metrics.operation_success.labels(operation=operation_name).inc()
        metrics.operation_duration.labels(operation=operation_name).observe(duration)
        
    except ValidationError as e:
        logger.warning(f"Validation error in {operation_name}: {e.message}", extra={
            "operation": operation_name,
            "user_id": user_id,
            "error_type": "validation",
            "field": e.field
        })
        metrics.operation_error.labels(operation=operation_name, type="validation").inc()
        raise
        
    except AuthorizationError as e:
        logger.warning(f"Authorization error in {operation_name}: {e.message}", extra={
            "operation": operation_name,
            "user_id": user_id,
            "error_type": "authorization"
        })
        metrics.operation_error.labels(operation=operation_name, type="authorization").inc()
        raise
        
    except DatabaseError as e:
        logger.error(f"Database error in {operation_name}: {e.message}", extra={
            "operation": operation_name,
            "user_id": user_id,
            "error_type": "database",
            "query": e.query[:100] if e.query else None
        })
        metrics.operation_error.labels(operation=operation_name, type="database").inc()
        raise
        
    except Exception as e:
        logger.error(f"Unexpected error in {operation_name}: {str(e)}", extra={
            "operation": operation_name,
            "user_id": user_id,
            "error_type": "unexpected"
        }, exc_info=True)
        metrics.operation_error.labels(operation=operation_name, type="unexpected").inc()
        raise MCPError(f"Internal server error in {operation_name}")
```

## 📊 Našumo optimizavimo strategijos

### Užklausų našumo stebėjimas

```python
class QueryPerformanceMonitor:
    """Monitor and optimize query performance."""
    
    def __init__(self):
        self.slow_query_threshold = 1.0  # seconds
        self.query_stats = defaultdict(list)
    
    @contextmanager
    async def monitor_query(self, query: str, operation_type: str = "unknown"):
        """Monitor query execution time and performance."""
        start_time = time.time()
        query_hash = hashlib.md5(query.encode()).hexdigest()[:8]
        
        try:
            yield
            
            duration = time.time() - start_time
            
            # Record performance metrics
            self.query_stats[operation_type].append(duration)
            
            # Log slow queries
            if duration > self.slow_query_threshold:
                logger.warning(f"Slow query detected", extra={
                    "query_hash": query_hash,
                    "duration": duration,
                    "operation_type": operation_type,
                    "query": query[:200]
                })
            
            # Update metrics
            metrics.query_duration.labels(type=operation_type).observe(duration)
            
        except Exception as e:
            duration = time.time() - start_time
            logger.error(f"Query failed", extra={
                "query_hash": query_hash,
                "duration": duration,
                "operation_type": operation_type,
                "error": str(e)
            })
            raise
    
    def get_performance_summary(self) -> Dict[str, Any]:
        """Generate performance summary report."""
        summary = {}
        
        for operation_type, durations in self.query_stats.items():
            if durations:
                summary[operation_type] = {
                    "count": len(durations),
                    "avg_duration": sum(durations) / len(durations),
                    "max_duration": max(durations),
                    "min_duration": min(durations),
                    "slow_queries": len([d for d in durations if d > self.slow_query_threshold])
                }
        
        return summary
```

### Talpyklos strategija

```python
class QueryCache:
    """Intelligent query result caching."""
    
    def __init__(self, redis_url: str = None):
        self.cache = {}  # In-memory fallback
        self.redis_client = redis.Redis.from_url(redis_url) if redis_url else None
        self.cache_ttl = 300  # 5 minutes default
    
    async def get_cached_result(
        self, 
        cache_key: str, 
        query_func: Callable,
        ttl: int = None
    ) -> Any:
        """Get result from cache or execute query."""
        ttl = ttl or self.cache_ttl
        
        # Try cache first
        cached_result = await self._get_from_cache(cache_key)
        if cached_result is not None:
            metrics.cache_hit.labels(type="query").inc()
            return cached_result
        
        # Execute query
        metrics.cache_miss.labels(type="query").inc()
        result = await query_func()
        
        # Cache result
        await self._set_in_cache(cache_key, result, ttl)
        
        return result
    
    def _generate_cache_key(self, query: str, user_context: str) -> str:
        """Generate consistent cache key."""
        key_data = f"{query}:{user_context}"
        return hashlib.sha256(key_data.encode()).hexdigest()
```

## 🎯 Pagrindinės išvados

Baigę šį modulį, turėtumėte suprasti:

✅ **Sluoksniuotą architektūrą**: Kaip atskirti atsakomybes MCP serverio dizaine  
✅ **Duomenų bazių modelius**: Kelių nuomininkų schemos dizainą ir RLS įgyvendinimą  
✅ **Jungčių valdymą**: Efektyvų telkimą ir išteklių gyvavimo ciklą  
✅ **Klaidų tvarkymą**: Hierarchinius klaidų tipus ir atsparumo modelius  
✅ **Našumo optimizavimą**: Stebėjimą, talpyklą ir užklausų optimizavimą  
✅ **Gamybinį pasirengimą**: Infrastruktūros klausimus ir veiklos modelius  

## 🚀 Kas toliau

Tęskite su **[2 moduliu: Saugumas ir kelių nuomininkų palaikymas](../02-Security/README.md)**, kad išsamiai išnagrinėtumėte:

- Eilučių lygio saugumo įgyvendinimo detales
- Autentifikavimo ir autorizavimo modelius
- Kelių nuomininkų duomenų izoliacijos strategijas
- Saugumo audito ir atitikties klausimus

## 📚 Papildomi ištekliai

### Architektūros modeliai
- [Švari architektūra Python kalboje](https://github.com/cosmic-python/code) - Architektūros modeliai Python programoms
- [Duomenų bazių projektavimo modeliai](https://en.wikipedia.org/wiki/Database_design) - Reliacinių duomenų bazių projektavimo principai
- [Mikropaslaugų modeliai](https://microservices.io/patterns/) - Paslaugų architektūros modeliai

### PostgreSQL pažangios temos
- [PostgreSQL našumo optimizavimas](https://wiki.postgresql.org/wiki/Performance_Optimization) - Duomenų bazių optimizavimo vadovas
- [Jungčių telkimo geriausios praktikos](https://www.postgresql.org/docs/current/runtime-config-connection.html) - Jungčių valdymas
- [Užklausų planavimas ir optimizavimas](https://www.postgresql.org/docs/current/planner-optimizer.html) - Užklausų našumas

### Python asinchroniniai modeliai
- [AsyncIO geriausios praktikos](https://docs.python.org/3/library/asyncio.html) - Asinchroninio programavimo modeliai
- [FastAPI architektūra](https://fastapi.tiangolo.com/advanced/) - Moderni Python žiniatinklio architektūra
- [Pydantic modeliai](https://pydantic-docs.helpmanual.io/) - Duomenų validacija ir serializacija

---

**Toliau**: Pasiruošę tyrinėti saugumo modelius? Tęskite su [2 moduliu: Saugumas ir kelių nuomininkų palaikymas](../02-Security/README.md)

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.