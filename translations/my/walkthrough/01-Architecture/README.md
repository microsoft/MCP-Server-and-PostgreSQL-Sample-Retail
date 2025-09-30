<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "907b008a90c728fd33a1c0f66889e8e2",
  "translation_date": "2025-09-30T07:52:22+00:00",
  "source_file": "walkthrough/01-Architecture/README.md",
  "language_code": "my"
}
-->
# အဓိက Architecture အယူအဆများ

## 🎯 ဒီ Module မှာ ဘာတွေ ပါဝင်သလဲ

ဒီ module က MCP server architecture patterns, database design အခြေခံများနဲ့ AI application တွေကို database တွေထည့်သွင်းပြီး အားကောင်းအောင်လုပ်ဆောင်နိုင်တဲ့ နည်းလမ်းတွေကို အနက်အနက်ရှင်းလင်းဖော်ပြပေးမှာ ဖြစ်ပါတယ်။

## အကျဉ်းချုပ်

Database integration ပါဝင်တဲ့ production-ready MCP server တစ်ခုကို တည်ဆောက်ဖို့အတွက် architecture ဆိုင်ရာ ဆုံးဖြတ်ချက်တွေကို သေချာစွာ လုပ်ဆောင်ဖို့လိုအပ်ပါတယ်။ ဒီ module က Zava Retail analytics solution ကို အားကောင်း၊ လုံခြုံ၊ အဆင့်မြှင့်တင်နိုင်အောင် ဖန်တီးပေးတဲ့ အဓိက component တွေ၊ design patterns တွေ၊ နည်းပညာဆိုင်ရာ အချက်အလက်တွေကို ခွဲခြမ်းဖော်ပြပေးမှာ ဖြစ်ပါတယ်။

သင် ဒီ layer တစ်ခုချင်းစီ ဘယ်လို အလုပ်လုပ်သလဲ၊ ဘာကြောင့် အထူးသတ်မှတ်ထားတဲ့ နည်းပညာတွေကို ရွေးချယ်ထားသလဲ၊ နဲ့ MCP implementation ကို ကိုယ်တိုင်လုပ်ဆောင်တဲ့အခါ ဘယ်လို pattern တွေကို အသုံးပြုရမလဲဆိုတာကို နားလည်နိုင်ပါလိမ့်မယ်။

## သင်ယူရမယ့် ရည်မှန်းချက်များ

ဒီ module ကို အပြီးသတ်တဲ့အခါ သင်တတ်မြောက်ထားမယ့်အရာများမှာ -

- **ခွဲခြမ်းစိတ်ဖြာနိုင်ခြင်း** MCP server architecture ကို database integration ပါဝင်တဲ့ အခြေခံ layer တွေကို နားလည်ခြင်း  
- **နားလည်နိုင်ခြင်း** Architecture component တစ်ခုချင်းစီရဲ့ အခန်းကဏ္ဍနဲ့ တာဝန်  
- **ဒီဇိုင်းဆွဲနိုင်ခြင်း** Multi-tenant MCP application တွေကို ထောက်ပံ့နိုင်တဲ့ database schema  
- **အကောင်အထည်ဖော်နိုင်ခြင်း** Connection pooling နဲ့ resource management နည်းလမ်းများ  
- **အသုံးချနိုင်ခြင်း** Error handling နဲ့ logging pattern တွေကို production system တွေမှာ အသုံးချခြင်း  
- **အကဲဖြတ်နိုင်ခြင်း** Architecture နည်းလမ်းအမျိုးမျိုးကြားက trade-offs တွေ  

## 🏗️ MCP Server Architecture Layers

MCP server က **layered architecture** ကို အသုံးပြုထားပြီး concern တွေကို ခွဲခြားထားကာ maintainability ကို မြှင့်တင်ပေးပါတယ်။

### Layer 1: Protocol Layer (FastMCP)
**တာဝန်**: MCP protocol communication နဲ့ message routing ကို စီမံခန့်ခွဲခြင်း

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

**အဓိက အင်္ဂါရပ်များ**:
- **Protocol Compliance**: MCP specification အပြည့်အဝ ထောက်ပံ့မှု  
- **Type Safety**: Request/response validation အတွက် Pydantic models  
- **Async Support**: High concurrency အတွက် Non-blocking I/O  
- **Error Handling**: Error response တွေကို စံပြအတိုင်း ပြန်လည်ပေးပို့ခြင်း  

### Layer 2: Business Logic Layer
**တာဝန်**: Business rules တွေကို အကောင်အထည်ဖော်ပြီး protocol နဲ့ data layer တွေကို ချိတ်ဆက်ပေးခြင်း

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

**အဓိက အင်္ဂါရပ်များ**:
- **Business Rule Enforcement**: Store access validation နဲ့ data integrity  
- **Service Coordination**: Database နဲ့ AI service တွေကြားမှာ အလုပ်ချင်းချိတ်ဆက်ပေးခြင်း  
- **Data Transformation**: Raw data ကို business insights အဖြစ် ပြောင်းလဲပေးခြင်း  
- **Caching Strategy**: Frequent queries အတွက် performance optimization  

### Layer 3: Data Access Layer
**တာဝန်**: Database connection, query execution, နဲ့ data mapping ကို စီမံခန့်ခွဲခြင်း

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

**အဓိက အင်္ဂါရပ်များ**:
- **Connection Pooling**: Resource management ကို ထိရောက်စွာ စီမံခြင်း  
- **Transaction Management**: ACID compliance နဲ့ rollback handling  
- **Query Optimization**: Performance monitoring နဲ့ optimization  
- **RLS Integration**: Row-level security context management  

### Layer 4: Infrastructure Layer
**တာဝန်**: Logging, monitoring, configuration စတဲ့ cross-cutting concern တွေကို စီမံခြင်း

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

## 🗄️ Database Design Patterns

PostgreSQL schema က multi-tenant MCP application တွေအတွက် အဓိက pattern အချို့ကို အသုံးပြုထားပါတယ်။

### 1. Multi-Tenant Schema Design

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

**ဒီဇိုင်းအခြေခံများ**:
- **Foreign Key Consistency**: Table တွေကြား data integrity ကို အာမခံခြင်း  
- **Store ID Propagation**: Transactional table တစ်ခုချင်းစီမှာ store_id ပါဝင်ခြင်း  
- **UUID Primary Keys**: Distributed systems အတွက် globally unique identifier  
- **Timestamp Tracking**: Data change အတွက် audit trail  

### 2. Row Level Security Implementation

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

**RLS အကျိုးကျေးဇူးများ**:
- **Automatic Filtering**: Database က data isolation ကို အလိုအလျောက် enforce လုပ်ပေးခြင်း  
- **Application ရိုးရှင်းမှု**: WHERE clause တွေကို မလိုအပ်အောင် လုပ်ဆောင်ပေးခြင်း  
- **Security by Default**: မှားယွင်းတဲ့ data ကို မရောက်အောင် အာမခံပေးခြင်း  
- **Audit Compliance**: Data access boundary တွေကို ရှင်းလင်းစွာ ဖော်ပြပေးခြင်း  

### 3. Vector Search Schema

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

## 🔌 Connection Management Patterns

Database connection management ကို ထိရောက်စွာ စီမံခြင်းက MCP server performance အတွက် အရေးကြီးပါတယ်။

### Connection Pool Configuration

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

### Resource Lifecycle Management

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

## 🛡️ Error Handling and Resilience Patterns

Error handling ကို အားကောင်းစွာ လုပ်ဆောင်ခြင်းက MCP server operation ကို ယုံကြည်စိတ်ချစွာ လုပ်ဆောင်နိုင်စေပါတယ်။

### Hierarchical Error Types

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

### Error Handling Middleware

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

## 📊 Performance Optimization Strategies

### Query Performance Monitoring

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

### Caching Strategy

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

## 🎯 အဓိက အကျဉ်းချုပ်

ဒီ module ကို အပြီးသတ်တဲ့အခါ သင်နားလည်ထားမယ့်အရာများမှာ -

✅ **Layered Architecture**: MCP server design မှာ concern တွေကို ခွဲခြားထားတဲ့ နည်းလမ်း  
✅ **Database Patterns**: Multi-tenant schema design နဲ့ RLS implementation  
✅ **Connection Management**: Pooling နဲ့ resource lifecycle ကို ထိရောက်စွာ စီမံခြင်း  
✅ **Error Handling**: Hierarchical error types နဲ့ resilience patterns  
✅ **Performance Optimization**: Monitoring, caching, နဲ့ query optimization  
✅ **Production Readiness**: Infrastructure concern တွေ နဲ့ operational patterns  

## 🚀 အခုနောက်တစ်ခု

**[Module 02: Security and Multi-Tenancy](../02-Security/README.md)** ကို ဆက်လက်လေ့လာပြီး -

- Row Level Security implementation အချက်အလက်များ  
- Authentication နဲ့ authorization pattern  
- Multi-tenant data isolation နည်းလမ်းများ  
- Security audit နဲ့ compliance အချက်အလက်များ  

## 📚 အပိုဆောင်း ရင်းမြစ်များ

### Architecture Patterns
- [Clean Architecture in Python](https://github.com/cosmic-python/code) - Python application တွေအတွက် architectural patterns  
- [Database Design Patterns](https://en.wikipedia.org/wiki/Database_design) - Relational database design အခြေခံများ  
- [Microservices Patterns](https://microservices.io/patterns/) - Service architecture patterns  

### PostgreSQL Advanced Topics
- [PostgreSQL Performance Tuning](https://wiki.postgresql.org/wiki/Performance_Optimization) - Database optimization လမ်းညွှန်  
- [Connection Pooling Best Practices](https://www.postgresql.org/docs/current/runtime-config-connection.html) - Connection management  
- [Query Planning and Optimization](https://www.postgresql.org/docs/current/planner-optimizer.html) - Query performance  

### Python Async Patterns
- [AsyncIO Best Practices](https://docs.python.org/3/library/asyncio.html) - Async programming patterns  
- [FastAPI Architecture](https://fastapi.tiangolo.com/advanced/) - Modern Python web architecture  
- [Pydantic Models](https://pydantic-docs.helpmanual.io/) - Data validation နဲ့ serialization  

---

**Next**: Security pattern တွေကို လေ့လာဖို့ အဆင်သင့်ဖြစ်ပါပြီလား? [Module 02: Security and Multi-Tenancy](../02-Security/README.md) ကို ဆက်လက်လေ့လာပါ!

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအချော်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။