<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "050a552dfb618cf1a5d2aa9b0eddbf78",
  "translation_date": "2025-09-29T17:13:46+00:00",
  "source_file": "walkthrough/04-Database/README.md",
  "language_code": "ko"
}
-->
# 데이터베이스 설계 및 스키마

## 🎯 이 모듈에서 다루는 내용

이 모듈은 Zava Retail 시스템을 위한 PostgreSQL 데이터베이스 설계에 대해 깊이 탐구합니다. 벡터 검색 기능, 멀티 테넌트 데이터 모델링, 데이터 격리를 위한 Row Level Security(RLS)를 포함한 포괄적인 리테일 스키마를 구현하는 방법을 배우게 됩니다.

## 개요

데이터베이스는 MCP 서버의 기반으로, 여러 매장의 리테일 데이터를 저장하면서 엄격한 데이터 격리를 유지합니다. 우리는 PostgreSQL과 pgvector 확장을 사용하여 고객이 자연어 쿼리를 통해 제품을 검색할 수 있는 의미론적 검색 기능을 제공합니다.

우리의 스키마는 현대적인 멀티 테넌트 패턴을 따르며, Row Level Security를 통해 사용자가 승인된 매장의 데이터만 접근할 수 있도록 보장합니다. 이 접근 방식은 엔터프라이즈급 보안을 제공하면서도 최적의 성능을 유지합니다.

## 학습 목표

이 모듈을 완료하면 다음을 수행할 수 있습니다:

- **설계**: 확장 가능한 멀티 테넌트 리테일 데이터베이스 스키마 설계
- **구현**: 벡터 검색을 위한 PostgreSQL과 pgvector 설정
- **구성**: 데이터 격리를 위한 Row Level Security 설정
- **생성**: 테스트를 위한 현실적인 샘플 데이터 생성
- **최적화**: 리테일 워크로드를 위한 데이터베이스 성능 최적화
- **구현**: 백업 및 복구 전략

## 🗃️ 데이터베이스 아키텍처

### PostgreSQL과 pgvector

우리의 데이터베이스는 PostgreSQL의 엔터프라이즈 기능과 AI 기반 검색을 위한 pgvector 확장을 결합하여 활용합니다:

```sql
-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "vector";

-- Verify vector extension installation
SELECT * FROM pg_extension WHERE extname = 'vector';
```

### 멀티 테넌트 아키텍처

데이터베이스는 Row Level Security를 사용하는 **공유 데이터베이스, 공유 스키마** 멀티 테넌시 모델을 채택합니다:

```
┌─────────────────────────────────────────────────┐
│                 PostgreSQL                      │
├─────────────────────────────────────────────────┤
│  retail Schema (Shared)                        │
│  ├── stores (Master tenant data)               │
│  ├── customers (RLS by store_id)               │
│  ├── products (RLS by store_id)                │
│  ├── sales_transactions (RLS by store_id)      │
│  ├── sales_transaction_items (RLS via join)    │
│  └── product_embeddings (RLS by store_id)      │
└─────────────────────────────────────────────────┘
```

## 📊 핵심 스키마 설계

### Stores 테이블 (테넌트 마스터)

```sql
-- Stores table: Master tenant registry
CREATE TABLE retail.stores (
    store_id VARCHAR(50) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_location VARCHAR(100),
    store_type VARCHAR(50),
    region VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Sample stores data
INSERT INTO retail.stores (store_id, store_name, store_location, store_type, region) VALUES
('seattle', 'Zava Retail Seattle', 'Seattle, WA', 'flagship', 'west'),
('redmond', 'Zava Retail Redmond', 'Redmond, WA', 'standard', 'west'),
('bellevue', 'Zava Retail Bellevue', 'Bellevue, WA', 'standard', 'west'),
('online', 'Zava Retail Online', 'Digital', 'ecommerce', 'global');

-- Create index for performance
CREATE INDEX idx_stores_region ON retail.stores(region);
CREATE INDEX idx_stores_active ON retail.stores(is_active) WHERE is_active = TRUE;
```

### Customers 테이블

```sql
-- Customers table with RLS
CREATE TABLE retail.customers (
    customer_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id VARCHAR(50) NOT NULL REFERENCES retail.stores(store_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(20),
    customer_since DATE DEFAULT CURRENT_DATE,
    loyalty_tier VARCHAR(20) DEFAULT 'bronze',
    total_lifetime_value DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Enable RLS
ALTER TABLE retail.customers ENABLE ROW LEVEL SECURITY;

-- RLS Policy: Users can only see customers from their store
CREATE POLICY customers_store_isolation ON retail.customers
    FOR ALL
    TO mcp_user
    USING (store_id = current_setting('app.current_store_id', true));

-- Indexes for performance
CREATE INDEX idx_customers_store_id ON retail.customers(store_id);
CREATE INDEX idx_customers_email ON retail.customers(email);
CREATE INDEX idx_customers_loyalty_tier ON retail.customers(loyalty_tier);
CREATE INDEX idx_customers_created_at ON retail.customers(created_at);
```

### Products 테이블 및 카테고리

```sql
-- Product categories
CREATE TABLE retail.product_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    parent_category_id INTEGER REFERENCES retail.product_categories(category_id),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

-- Insert sample categories
INSERT INTO retail.product_categories (category_name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Apparel and fashion items'),
('Home & Garden', 'Home improvement and garden supplies'),
('Sports & Outdoors', 'Sports equipment and outdoor gear'),
('Books & Media', 'Books, movies, and digital media'),
('Health & Beauty', 'Health and beauty products'),
('Automotive', 'Car parts and automotive accessories');

-- Products table with rich metadata
CREATE TABLE retail.products (
    product_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id VARCHAR(50) NOT NULL REFERENCES retail.stores(store_id),
    sku VARCHAR(50) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    product_description TEXT,
    category_id INTEGER REFERENCES retail.product_categories(category_id),
    brand VARCHAR(100),
    model VARCHAR(100),
    color VARCHAR(50),
    size VARCHAR(50),
    weight_kg DECIMAL(8,3),
    dimensions_cm VARCHAR(50), -- e.g., "30x20x15"
    price DECIMAL(10,2) NOT NULL,
    cost DECIMAL(10,2),
    current_stock INTEGER DEFAULT 0,
    minimum_stock INTEGER DEFAULT 0,
    maximum_stock INTEGER DEFAULT 1000,
    reorder_point INTEGER DEFAULT 10,
    supplier_name VARCHAR(100),
    supplier_sku VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    rating_average DECIMAL(3,2) DEFAULT 0.00,
    rating_count INTEGER DEFAULT 0,
    tags TEXT[], -- Array of tags for flexible categorization
    metadata JSONB, -- Flexible metadata storage
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- Ensure SKU uniqueness within store
    CONSTRAINT unique_sku_per_store UNIQUE (store_id, sku)
);

-- Enable RLS for products
ALTER TABLE retail.products ENABLE ROW LEVEL SECURITY;

-- RLS Policy for products
CREATE POLICY products_store_isolation ON retail.products
    FOR ALL
    TO mcp_user
    USING (store_id = current_setting('app.current_store_id', true));

-- Comprehensive indexes
CREATE INDEX idx_products_store_id ON retail.products(store_id);
CREATE INDEX idx_products_sku ON retail.products(sku);
CREATE INDEX idx_products_category ON retail.products(category_id);
CREATE INDEX idx_products_brand ON retail.products(brand);
CREATE INDEX idx_products_price ON retail.products(price);
CREATE INDEX idx_products_stock ON retail.products(current_stock);
CREATE INDEX idx_products_active ON retail.products(is_active) WHERE is_active = TRUE;
CREATE INDEX idx_products_featured ON retail.products(is_featured) WHERE is_featured = TRUE;
CREATE INDEX idx_products_tags ON retail.products USING GIN(tags);
CREATE INDEX idx_products_metadata ON retail.products USING GIN(metadata);
CREATE INDEX idx_products_text_search ON retail.products USING GIN(
    to_tsvector('english', product_name || ' ' || COALESCE(product_description, '') || ' ' || COALESCE(brand, ''))
);
```

### Sales Transactions

```sql
-- Sales transactions table
CREATE TABLE retail.sales_transactions (
    transaction_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id VARCHAR(50) NOT NULL REFERENCES retail.stores(store_id),
    customer_id UUID REFERENCES retail.customers(customer_id),
    transaction_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    transaction_type VARCHAR(20) DEFAULT 'sale', -- 'sale', 'return', 'exchange'
    payment_method VARCHAR(50), -- 'cash', 'credit_card', 'debit_card', 'digital_wallet'
    subtotal DECIMAL(10,2) NOT NULL,
    tax_amount DECIMAL(10,2) DEFAULT 0.00,
    discount_amount DECIMAL(10,2) DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL,
    cashier_id VARCHAR(50),
    register_id VARCHAR(50),
    receipt_number VARCHAR(50),
    notes TEXT,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Sales transaction items (line items)
CREATE TABLE retail.sales_transaction_items (
    item_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    transaction_id UUID NOT NULL REFERENCES retail.sales_transactions(transaction_id) ON DELETE CASCADE,
    product_id UUID NOT NULL REFERENCES retail.products(product_id),
    quantity INTEGER NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) DEFAULT 0.00,
    tax_amount DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- Ensure positive quantities and prices
    CONSTRAINT positive_quantity CHECK (quantity > 0),
    CONSTRAINT positive_unit_price CHECK (unit_price >= 0),
    CONSTRAINT positive_total_price CHECK (total_price >= 0)
);

-- Enable RLS for transactions
ALTER TABLE retail.sales_transactions ENABLE ROW LEVEL SECURITY;

-- RLS Policy for sales transactions
CREATE POLICY sales_transactions_store_isolation ON retail.sales_transactions
    FOR ALL
    TO mcp_user
    USING (store_id = current_setting('app.current_store_id', true));

-- RLS for transaction items (via join with transactions)
ALTER TABLE retail.sales_transaction_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY sales_transaction_items_store_isolation ON retail.sales_transaction_items
    FOR ALL
    TO mcp_user
    USING (
        transaction_id IN (
            SELECT transaction_id 
            FROM retail.sales_transactions 
            WHERE store_id = current_setting('app.current_store_id', true)
        )
    );

-- Performance indexes
CREATE INDEX idx_sales_transactions_store_id ON retail.sales_transactions(store_id);
CREATE INDEX idx_sales_transactions_customer_id ON retail.sales_transactions(customer_id);
CREATE INDEX idx_sales_transactions_date ON retail.sales_transactions(transaction_date);
CREATE INDEX idx_sales_transactions_type ON retail.sales_transactions(transaction_type);
CREATE INDEX idx_sales_transactions_payment ON retail.sales_transactions(payment_method);

CREATE INDEX idx_sales_transaction_items_transaction_id ON retail.sales_transaction_items(transaction_id);
CREATE INDEX idx_sales_transaction_items_product_id ON retail.sales_transaction_items(product_id);
```

## 🔍 벡터 검색 구현

### Product Embeddings 테이블

```sql
-- Product embeddings for semantic search
CREATE TABLE retail.product_embeddings (
    embedding_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_id UUID NOT NULL REFERENCES retail.products(product_id) ON DELETE CASCADE,
    store_id VARCHAR(50) NOT NULL REFERENCES retail.stores(store_id),
    embedding_text TEXT NOT NULL, -- The text that was embedded
    embedding vector(1536), -- OpenAI text-embedding-3-small dimension
    embedding_model VARCHAR(100) NOT NULL DEFAULT 'text-embedding-3-small',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- Ensure one embedding per product per model
    CONSTRAINT unique_product_embedding UNIQUE (product_id, embedding_model)
);

-- Enable RLS for embeddings
ALTER TABLE retail.product_embeddings ENABLE ROW LEVEL SECURITY;

-- RLS Policy for embeddings
CREATE POLICY product_embeddings_store_isolation ON retail.product_embeddings
    FOR ALL
    TO mcp_user
    USING (store_id = current_setting('app.current_store_id', true));

-- Vector similarity index (HNSW for fast approximate search)
CREATE INDEX idx_product_embeddings_vector ON retail.product_embeddings 
USING hnsw (embedding vector_cosine_ops);

-- Additional indexes
CREATE INDEX idx_product_embeddings_product_id ON retail.product_embeddings(product_id);
CREATE INDEX idx_product_embeddings_store_id ON retail.product_embeddings(store_id);
CREATE INDEX idx_product_embeddings_model ON retail.product_embeddings(embedding_model);
```

### 벡터 검색 함수

```sql
-- Function to search products by similarity
CREATE OR REPLACE FUNCTION retail.search_products_by_similarity(
    search_embedding vector(1536),
    similarity_threshold float DEFAULT 0.7,
    max_results integer DEFAULT 20
)
RETURNS TABLE (
    product_id UUID,
    product_name VARCHAR(200),
    product_description TEXT,
    brand VARCHAR(100),
    price DECIMAL(10,2),
    similarity_score float
) 
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.product_id,
        p.product_name,
        p.product_description,
        p.brand,
        p.price,
        1 - (pe.embedding <=> search_embedding) as similarity_score
    FROM retail.product_embeddings pe
    JOIN retail.products p ON pe.product_id = p.product_id
    WHERE 
        pe.store_id = current_setting('app.current_store_id', true)
        AND p.is_active = TRUE
        AND 1 - (pe.embedding <=> search_embedding) >= similarity_threshold
    ORDER BY pe.embedding <=> search_embedding
    LIMIT max_results;
END;
$$;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION retail.search_products_by_similarity TO mcp_user;
```

## 🔐 Row Level Security 설정

### 데이터베이스 역할 및 권한

```sql
-- Create MCP application role
CREATE ROLE mcp_user LOGIN;

-- Grant schema usage
GRANT USAGE ON SCHEMA retail TO mcp_user;

-- Grant table permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA retail TO mcp_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA retail TO mcp_user;

-- Grant permissions on future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA retail GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO mcp_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA retail GRANT USAGE, SELECT ON SEQUENCES TO mcp_user;

-- Function to set store context
CREATE OR REPLACE FUNCTION retail.set_store_context(store_id_param VARCHAR(50))
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- Verify store exists and user has access
    IF NOT EXISTS (SELECT 1 FROM retail.stores WHERE store_id = store_id_param AND is_active = TRUE) THEN
        RAISE EXCEPTION 'Invalid or inactive store: %', store_id_param;
    END IF;
    
    -- Set the store context
    PERFORM set_config('app.current_store_id', store_id_param, false);
    
    -- Log the context change
    INSERT INTO retail.audit_log (
        table_name,
        action,
        user_name,
        store_id,
        metadata
    ) VALUES (
        'security_context',
        'store_context_set',
        current_user,
        store_id_param,
        jsonb_build_object('timestamp', current_timestamp)
    );
END;
$$;

-- Grant execute permission
GRANT EXECUTE ON FUNCTION retail.set_store_context TO mcp_user;
```

### 감사 로그

```sql
-- Audit log table for security and compliance
CREATE TABLE retail.audit_log (
    log_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    table_name VARCHAR(100) NOT NULL,
    action VARCHAR(50) NOT NULL, -- INSERT, UPDATE, DELETE, SELECT
    user_name VARCHAR(100) NOT NULL DEFAULT current_user,
    store_id VARCHAR(50),
    record_id UUID,
    old_values JSONB,
    new_values JSONB,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Index for audit queries
CREATE INDEX idx_audit_log_table_name ON retail.audit_log(table_name);
CREATE INDEX idx_audit_log_action ON retail.audit_log(action);
CREATE INDEX idx_audit_log_user_name ON retail.audit_log(user_name);
CREATE INDEX idx_audit_log_store_id ON retail.audit_log(store_id);
CREATE INDEX idx_audit_log_created_at ON retail.audit_log(created_at);

-- Audit trigger function
CREATE OR REPLACE FUNCTION retail.audit_trigger()
RETURNS trigger AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO retail.audit_log (
            table_name,
            action,
            store_id,
            record_id,
            old_values
        ) VALUES (
            TG_TABLE_NAME,
            TG_OP,
            COALESCE(OLD.store_id, current_setting('app.current_store_id', true)),
            COALESCE(OLD.customer_id, OLD.product_id, OLD.transaction_id),
            row_to_json(OLD)
        );
        RETURN OLD;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO retail.audit_log (
            table_name,
            action,
            store_id,
            record_id,
            old_values,
            new_values
        ) VALUES (
            TG_TABLE_NAME,
            TG_OP,
            COALESCE(NEW.store_id, current_setting('app.current_store_id', true)),
            COALESCE(NEW.customer_id, NEW.product_id, NEW.transaction_id),
            row_to_json(OLD),
            row_to_json(NEW)
        );
        RETURN NEW;
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO retail.audit_log (
            table_name,
            action,
            store_id,
            record_id,
            new_values
        ) VALUES (
            TG_TABLE_NAME,
            TG_OP,
            COALESCE(NEW.store_id, current_setting('app.current_store_id', true)),
            COALESCE(NEW.customer_id, NEW.product_id, NEW.transaction_id),
            row_to_json(NEW)
        );
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Create audit triggers
CREATE TRIGGER customers_audit_trigger
    AFTER INSERT OR UPDATE OR DELETE ON retail.customers
    FOR EACH ROW EXECUTE FUNCTION retail.audit_trigger();

CREATE TRIGGER products_audit_trigger
    AFTER INSERT OR UPDATE OR DELETE ON retail.products
    FOR EACH ROW EXECUTE FUNCTION retail.audit_trigger();

CREATE TRIGGER sales_transactions_audit_trigger
    AFTER INSERT OR UPDATE OR DELETE ON retail.sales_transactions
    FOR EACH ROW EXECUTE FUNCTION retail.audit_trigger();
```

## 📊 샘플 데이터 생성

### 현실적인 테스트 데이터 스크립트

```python
# scripts/generate_sample_data.py
"""
Generate realistic sample data for the Zava Retail database.
"""
import asyncio
import asyncpg
import random
import json
from datetime import datetime, timedelta
from faker import Faker
from typing import List, Dict, Any
import numpy as np

fake = Faker()

class SampleDataGenerator:
    """Generate realistic retail sample data."""
    
    def __init__(self, connection_string: str):
        self.connection_string = connection_string
        self.stores = ['seattle', 'redmond', 'bellevue', 'online']
        
        # Product categories with realistic items
        self.product_data = {
            'Electronics': {
                'brands': ['Apple', 'Samsung', 'Sony', 'LG', 'HP', 'Dell'],
                'items': [
                    'Smartphone', 'Laptop', 'Tablet', 'Headphones', 'Smart TV',
                    'Gaming Console', 'Smartwatch', 'Bluetooth Speaker'
                ]
            },
            'Clothing': {
                'brands': ['Nike', 'Adidas', 'Zara', 'H&M', 'Levi\'s', 'Gap'],
                'items': [
                    'T-Shirt', 'Jeans', 'Dress', 'Jacket', 'Sneakers',
                    'Sweater', 'Shorts', 'Blouse'
                ]
            },
            'Home & Garden': {
                'brands': ['IKEA', 'Home Depot', 'Wayfair', 'Target', 'Walmart'],
                'items': [
                    'Sofa', 'Dining Table', 'Lamp', 'Garden Tool', 'Plant Pot',
                    'Curtains', 'Rug', 'Kitchen Appliance'
                ]
            }
        }
    
    async def generate_all_data(self):
        """Generate complete sample dataset."""
        
        conn = await asyncpg.connect(self.connection_string)
        
        try:
            print("🏪 Generating stores data...")
            await self._ensure_stores_exist(conn)
            
            print("👥 Generating customers...")
            customers = await self._generate_customers(conn, 2000)
            
            print("📦 Generating products...")
            products = await self._generate_products(conn, 500)
            
            print("🛒 Generating sales transactions...")
            await self._generate_sales_transactions(conn, customers, products, 5000)
            
            print("✅ Sample data generation complete!")
            
        finally:
            await conn.close()
    
    async def _ensure_stores_exist(self, conn):
        """Ensure all stores exist in the database."""
        
        stores_data = [
            ('seattle', 'Zava Retail Seattle', 'Seattle, WA', 'flagship', 'west'),
            ('redmond', 'Zava Retail Redmond', 'Redmond, WA', 'standard', 'west'),
            ('bellevue', 'Zava Retail Bellevue', 'Bellevue, WA', 'standard', 'west'),
            ('online', 'Zava Retail Online', 'Digital', 'ecommerce', 'global')
        ]
        
        for store_data in stores_data:
            await conn.execute("""
                INSERT INTO retail.stores (store_id, store_name, store_location, store_type, region)
                VALUES ($1, $2, $3, $4, $5)
                ON CONFLICT (store_id) DO NOTHING
            """, *store_data)
    
    async def _generate_customers(self, conn, count: int) -> List[Dict]:
        """Generate realistic customer data."""
        
        customers = []
        
        for _ in range(count):
            store_id = random.choice(self.stores)
            customer_data = {
                'store_id': store_id,
                'first_name': fake.first_name(),
                'last_name': fake.last_name(),
                'email': fake.unique.email(),
                'phone': fake.phone_number()[:20],
                'date_of_birth': fake.date_of_birth(minimum_age=18, maximum_age=80),
                'gender': random.choice(['Male', 'Female', 'Other', 'Prefer not to say']),
                'customer_since': fake.date_between(start_date='-5y', end_date='today'),
                'loyalty_tier': random.choices(
                    ['bronze', 'silver', 'gold', 'platinum'],
                    weights=[50, 30, 15, 5]
                )[0]
            }
            
            customer_id = await conn.fetchval("""
                INSERT INTO retail.customers (
                    store_id, first_name, last_name, email, phone,
                    date_of_birth, gender, customer_since, loyalty_tier
                ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
                RETURNING customer_id
            """, *customer_data.values())
            
            customer_data['customer_id'] = customer_id
            customers.append(customer_data)
        
        return customers
    
    async def _generate_products(self, conn, count: int) -> List[Dict]:
        """Generate realistic product data."""
        
        # Get category IDs
        categories = await conn.fetch("SELECT category_id, category_name FROM retail.product_categories")
        category_map = {cat['category_name']: cat['category_id'] for cat in categories}
        
        products = []
        
        for _ in range(count):
            store_id = random.choice(self.stores)
            category_name = random.choice(list(self.product_data.keys()))
            category_id = category_map.get(category_name)
            
            if not category_id:
                continue
            
            brand = random.choice(self.product_data[category_name]['brands'])
            item_type = random.choice(self.product_data[category_name]['items'])
            
            # Generate realistic pricing
            base_price = random.uniform(10, 1000)
            cost = base_price * random.uniform(0.4, 0.7)  # 40-70% cost margin
            
            product_data = {
                'store_id': store_id,
                'sku': f"{brand[:3].upper()}-{fake.unique.random_number(digits=6)}",
                'product_name': f"{brand} {item_type}",
                'product_description': fake.text(max_nb_chars=500),
                'category_id': category_id,
                'brand': brand,
                'model': f"Model {fake.random_number(digits=4)}",
                'color': fake.color_name(),
                'size': random.choice(['XS', 'S', 'M', 'L', 'XL', 'XXL', 'One Size']),
                'weight_kg': round(random.uniform(0.1, 10.0), 2),
                'price': round(base_price, 2),
                'cost': round(cost, 2),
                'current_stock': random.randint(0, 100),
                'minimum_stock': random.randint(5, 20),
                'reorder_point': random.randint(10, 30),
                'supplier_name': fake.company(),
                'is_featured': random.choice([True, False]),
                'rating_average': round(random.uniform(3.0, 5.0), 2),
                'rating_count': random.randint(0, 500),
                'tags': random.sample([
                    'popular', 'new', 'sale', 'limited', 'bestseller', 
                    'eco-friendly', 'premium', 'budget'
                ], k=random.randint(1, 3))
            }
            
            product_id = await conn.fetchval("""
                INSERT INTO retail.products (
                    store_id, sku, product_name, product_description, category_id,
                    brand, model, color, size, weight_kg, price, cost,
                    current_stock, minimum_stock, reorder_point, supplier_name,
                    is_featured, rating_average, rating_count, tags
                ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20)
                RETURNING product_id
            """, *product_data.values())
            
            product_data['product_id'] = product_id
            products.append(product_data)
        
        return products
    
    async def _generate_sales_transactions(self, conn, customers: List[Dict], products: List[Dict], count: int):
        """Generate realistic sales transaction data."""
        
        for _ in range(count):
            # Select customer and matching store products
            customer = random.choice(customers)
            store_products = [p for p in products if p['store_id'] == customer['store_id']]
            
            if not store_products:
                continue
            
            # Generate transaction basics
            transaction_date = fake.date_time_between(start_date='-1y', end_date='now')
            transaction_type = random.choices(
                ['sale', 'return', 'exchange'],
                weights=[90, 7, 3]
            )[0]
            
            payment_method = random.choices(
                ['credit_card', 'debit_card', 'cash', 'digital_wallet'],
                weights=[45, 25, 20, 10]
            )[0]
            
            # Generate transaction items (1-5 items per transaction)
            num_items = random.choices([1, 2, 3, 4, 5], weights=[40, 30, 20, 7, 3])[0]
            selected_products = random.sample(store_products, min(num_items, len(store_products)))
            
            subtotal = 0
            transaction_items = []
            
            for product in selected_products:
                quantity = random.randint(1, 3)
                unit_price = product['price']
                
                # Apply random discounts occasionally
                discount_amount = 0
                if random.random() < 0.2:  # 20% chance of discount
                    discount_amount = unit_price * quantity * random.uniform(0.05, 0.25)
                
                total_price = (unit_price * quantity) - discount_amount
                subtotal += total_price
                
                transaction_items.append({
                    'product_id': product['product_id'],
                    'quantity': quantity,
                    'unit_price': unit_price,
                    'total_price': total_price,
                    'discount_amount': discount_amount
                })
            
            # Calculate totals
            discount_amount = sum(item['discount_amount'] for item in transaction_items)
            tax_amount = subtotal * 0.08  # 8% tax rate
            total_amount = subtotal + tax_amount
            
            # Insert transaction
            transaction_id = await conn.fetchval("""
                INSERT INTO retail.sales_transactions (
                    store_id, customer_id, transaction_date, transaction_type,
                    payment_method, subtotal, tax_amount, discount_amount, total_amount,
                    cashier_id, register_id, receipt_number
                ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
                RETURNING transaction_id
            """, 
                customer['store_id'], customer['customer_id'], transaction_date,
                transaction_type, payment_method, subtotal, tax_amount,
                discount_amount, total_amount, f"CASHIER{random.randint(1, 10)}",
                f"REG{random.randint(1, 5)}", f"RCP{fake.random_number(digits=8)}"
            )
            
            # Insert transaction items
            for item in transaction_items:
                await conn.execute("""
                    INSERT INTO retail.sales_transaction_items (
                        transaction_id, product_id, quantity, unit_price,
                        total_price, discount_amount
                    ) VALUES ($1, $2, $3, $4, $5, $6)
                """, 
                    transaction_id, item['product_id'], item['quantity'],
                    item['unit_price'], item['total_price'], item['discount_amount']
                )

# Usage example
if __name__ == "__main__":
    import os
    from config import Config
    
    config = Config()
    generator = SampleDataGenerator(config.database.connection_string)
    
    asyncio.run(generator.generate_all_data())
```

## 🚀 성능 최적화

### 데이터베이스 구성

```sql
-- Performance-oriented PostgreSQL settings
-- Add to postgresql.conf

# Memory settings
shared_buffers = '256MB'                # 25% of RAM for dedicated DB server
effective_cache_size = '1GB'           # Estimate of OS cache size
work_mem = '4MB'                       # Memory for sorts and hash joins
maintenance_work_mem = '64MB'          # Memory for VACUUM, CREATE INDEX

# Connection settings
max_connections = 100                  # Adjust based on application needs

# Write-ahead logging
wal_buffers = '16MB'
checkpoint_segments = 32               # PostgreSQL < 9.5
max_wal_size = '1GB'                   # PostgreSQL >= 9.5

# Query planner
random_page_cost = 1.1                 # SSD-optimized
effective_io_concurrency = 200         # SSD concurrent I/O capability

# Logging for performance monitoring
log_min_duration_statement = 1000      # Log queries > 1 second
log_checkpoints = on
log_connections = on
log_disconnections = on
log_line_prefix = '%t [%p-%l] %q%u@%d '
```

### 쿼리 최적화 뷰

```sql
-- Create monitoring views for query performance
CREATE VIEW retail.slow_queries AS
SELECT 
    query,
    calls,
    total_exec_time,
    mean_exec_time,
    max_exec_time,
    stddev_exec_time,
    rows,
    100.0 * shared_blks_hit / nullif(shared_blks_hit + shared_blks_read, 0) AS hit_percent
FROM pg_stat_statements
WHERE mean_exec_time > 100  -- Queries taking more than 100ms on average
ORDER BY mean_exec_time DESC;

-- Table sizes and index usage
CREATE VIEW retail.table_stats AS
SELECT
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size,
    pg_stat_get_tuples_inserted(c.oid) as inserts,
    pg_stat_get_tuples_updated(c.oid) as updates,
    pg_stat_get_tuples_deleted(c.oid) as deletes,
    pg_stat_get_live_tuples(c.oid) as live_tuples,
    pg_stat_get_dead_tuples(c.oid) as dead_tuples
FROM pg_tables pt
JOIN pg_class c ON c.relname = pt.tablename
WHERE schemaname = 'retail'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- Index usage statistics
CREATE VIEW retail.index_usage AS
SELECT
    schemaname,
    tablename,
    indexname,
    idx_tup_read,
    idx_tup_fetch,
    pg_size_pretty(pg_relation_size(indexrelname)) as size
FROM pg_stat_user_indexes
WHERE schemaname = 'retail'
ORDER BY idx_tup_read DESC;
```

### 자동 유지 관리

```sql
-- Create function for automated maintenance
CREATE OR REPLACE FUNCTION retail.perform_maintenance()
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
    -- Update table statistics
    ANALYZE retail.customers;
    ANALYZE retail.products;
    ANALYZE retail.sales_transactions;
    ANALYZE retail.sales_transaction_items;
    ANALYZE retail.product_embeddings;
    
    -- Vacuum tables with high update/delete activity
    VACUUM (ANALYZE, VERBOSE) retail.customers;
    VACUUM (ANALYZE, VERBOSE) retail.products;
    
    -- Reindex if needed (check for index bloat)
    REINDEX INDEX CONCURRENTLY idx_products_text_search;
    REINDEX INDEX CONCURRENTLY idx_product_embeddings_vector;
    
    -- Log maintenance completion
    INSERT INTO retail.audit_log (
        table_name,
        action,
        metadata
    ) VALUES (
        'maintenance',
        'automated_maintenance_completed',
        jsonb_build_object(
            'timestamp', current_timestamp,
            'database_size', pg_database_size(current_database())
        )
    );
END;
$$;

-- Schedule maintenance (would typically be done via cron or scheduled job)
-- Example cron entry: 0 2 * * 0 psql -d retail_db -c "SELECT retail.perform_maintenance();"
```

## 💾 백업 및 복구

### 백업 전략

```bash
#!/bin/bash
# scripts/backup_database.sh

# Comprehensive backup script for production environments

set -e

# Configuration
DB_HOST="${POSTGRES_HOST:-localhost}"
DB_PORT="${POSTGRES_PORT:-5432}"
DB_NAME="${POSTGRES_DB:-retail_db}"
DB_USER="${POSTGRES_USER:-postgres}"
BACKUP_DIR="/backups/postgresql"
RETENTION_DAYS=30

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Generate backup filename with timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/retail_backup_$TIMESTAMP.sql"
COMPRESSED_BACKUP="$BACKUP_FILE.gz"

echo "Starting database backup: $TIMESTAMP"

# Create comprehensive backup
pg_dump \
    --host="$DB_HOST" \
    --port="$DB_PORT" \
    --username="$DB_USER" \
    --dbname="$DB_NAME" \
    --verbose \
    --clean \
    --create \
    --if-exists \
    --format=custom \
    --file="$BACKUP_FILE"

# Compress backup
gzip "$BACKUP_FILE"

# Verify backup integrity
echo "Verifying backup integrity..."
pg_restore --list "$COMPRESSED_BACKUP" > /dev/null

# Clean up old backups
find "$BACKUP_DIR" -name "retail_backup_*.sql.gz" -mtime +$RETENTION_DAYS -delete

# Calculate backup size
BACKUP_SIZE=$(du -h "$COMPRESSED_BACKUP" | cut -f1)

echo "Backup completed successfully:"
echo "  File: $COMPRESSED_BACKUP"
echo "  Size: $BACKUP_SIZE"
echo "  Timestamp: $TIMESTAMP"

# Optional: Upload to cloud storage
if [ -n "$AZURE_STORAGE_ACCOUNT" ] && [ -n "$AZURE_STORAGE_KEY" ]; then
    echo "Uploading backup to Azure Storage..."
    az storage blob upload \
        --account-name "$AZURE_STORAGE_ACCOUNT" \
        --account-key "$AZURE_STORAGE_KEY" \
        --container-name "database-backups" \
        --name "retail_backup_$TIMESTAMP.sql.gz" \
        --file "$COMPRESSED_BACKUP"
fi
```

### 복구 절차

```bash
#!/bin/bash
# scripts/restore_database.sh

# Database restoration script

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <backup_file> [target_database]"
    echo "Example: $0 /backups/retail_backup_20241001_120000.sql.gz retail_db_restored"
    exit 1
fi

BACKUP_FILE="$1"
TARGET_DB="${2:-retail_db_restored}"

# Configuration
DB_HOST="${POSTGRES_HOST:-localhost}"
DB_PORT="${POSTGRES_PORT:-5432}"
DB_USER="${POSTGRES_USER:-postgres}"

echo "Starting database restoration..."
echo "  Source: $BACKUP_FILE"
echo "  Target: $TARGET_DB"

# Verify backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file not found: $BACKUP_FILE"
    exit 1
fi

# Create target database
createdb \
    --host="$DB_HOST" \
    --port="$DB_PORT" \
    --username="$DB_USER" \
    --owner="$DB_USER" \
    "$TARGET_DB"

# Restore from backup
if [[ "$BACKUP_FILE" == *.gz ]]; then
    # Compressed backup
    gunzip -c "$BACKUP_FILE" | pg_restore \
        --host="$DB_HOST" \
        --port="$DB_PORT" \
        --username="$DB_USER" \
        --dbname="$TARGET_DB" \
        --verbose \
        --clean \
        --if-exists
else
    # Uncompressed backup
    pg_restore \
        --host="$DB_HOST" \
        --port="$DB_PORT" \
        --username="$DB_USER" \
        --dbname="$TARGET_DB" \
        --verbose \
        --clean \
        --if-exists \
        "$BACKUP_FILE"
fi

echo "Database restoration completed successfully!"
echo "Restored database: $TARGET_DB"

# Verify restoration
echo "Verifying restoration..."
TABLES_COUNT=$(psql \
    --host="$DB_HOST" \
    --port="$DB_PORT" \
    --username="$DB_USER" \
    --dbname="$TARGET_DB" \
    --tuples-only \
    --command="SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'retail';"
)

echo "Verified $TABLES_COUNT tables in retail schema"
```

## 🎯 주요 요점

이 모듈을 완료한 후, 다음을 달성할 수 있습니다:

✅ **멀티 테넌트 데이터베이스 설계**: 안전한 데이터 격리를 위한 Row Level Security 구현  
✅ **벡터 검색 기능**: 의미론적 제품 검색을 위한 pgvector 설정  
✅ **포괄적인 스키마**: 프로덕션 준비가 된 리테일 데이터베이스 스키마 생성  
✅ **샘플 데이터 생성**: 개발 및 테스트를 위한 현실적인 테스트 데이터 구축  
✅ **성능 최적화**: 인덱스 및 쿼리 최적화 구성  
✅ **백업 및 복구**: 강력한 데이터 보호 전략 수립  

## 🚀 다음 단계

**[모듈 05: MCP 서버 구현](../05-MCP-Server/README.md)**을 계속 진행하여:

- 이 데이터베이스에 연결하는 FastMCP 서버 구축
- MCP 프로토콜을 위한 데이터베이스 쿼리 도구 구현
- 임베딩을 활용한 의미론적 검색 기능 추가
- 연결 풀링 및 오류 처리 구성

## 📚 추가 자료

### PostgreSQL & pgvector
- [PostgreSQL 문서](https://www.postgresql.org/docs/) - PostgreSQL의 완전한 참조 문서
- [pgvector 확장](https://github.com/pgvector/pgvector) - PostgreSQL을 위한 벡터 유사성 검색
- [PostgreSQL 성능 튜닝](https://wiki.postgresql.org/wiki/Performance_Optimization) - 최적화 모범 사례

### 멀티 테넌트 아키텍처
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - PostgreSQL RLS 문서
- [멀티 테넌트 데이터 아키텍처](https://docs.microsoft.com/azure/architecture/patterns/multitenancy) - Azure 아키텍처 패턴
- [데이터베이스 보안 모범 사례](https://www.postgresql.org/docs/current/security.html) - PostgreSQL 보안 가이드

### 벡터 데이터베이스
- [벡터 검색 기본](https://www.pinecone.io/learn/vector-database/) - 벡터 데이터베이스 이해하기
- [임베딩 모델](https://platform.openai.com/docs/guides/embeddings) - OpenAI 임베딩 문서
- [HNSW 알고리즘](https://arxiv.org/abs/1603.09320) - 계층적 탐색 가능한 소형 세계 그래프

---

**이전**: [모듈 03: 환경 설정](../03-Setup/README.md)  
**다음**: [모듈 05: MCP 서버 구현](../05-MCP-Server/README.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.