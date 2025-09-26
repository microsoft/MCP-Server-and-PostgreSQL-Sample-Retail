# MCP Server and PostgreSQL Sample - Retail Sales Analysis

## Introduction

This sample demonstrates how to build and deploy a comprehensive **Model Context Protocol (MCP) server** that provides AI assistants with secure, intelligent access to retail sales data through PostgreSQL. The project showcases enterprise-grade features including **Row Level Security (RLS)**, **semantic search capabilities**, and **Azure AI integration** for real-world retail analytics scenarios.

**Key Use Cases:**
- **AI-Powered Sales Analytics**: Enable AI assistants to query and analyze retail sales data through natural language
- **Secure Multi-Tenant Access**: Demonstrate Row Level Security implementation where different store managers can only access their store's data
- **Semantic Product Search**: Showcase AI-enhanced product discovery using text embeddings
- **Enterprise Integration**: Illustrate how to integrate MCP servers with Azure services and PostgreSQL databases

**Perfect for:**
- Developers learning to build MCP servers with database integration
- Data engineers implementing secure multi-tenant analytics solutions
- AI application developers working with retail or e-commerce data
- Anyone interested in combining AI assistants with enterprise databases

## Join the Azure AI Foundry Discord Community
Share your experiences of MCP and meet the experts and product groups 

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Sales Analysis MCP Server

A Model Context Protocol (MCP) server that provides comprehensive customer sales database access for Zava Retail DIY Business. This server enables AI assistants to query and analyze retail sales data through a secure, schema-aware interface.

## Prerequisites

1. Docker Desktop installed
2. Git installed
3. **Azure CLI**: Install and authenticate with Azure CLI
4. Access to OpenAI `text-embedding-3-small` model and optionally `gpt-4o-mini` model.

## Getting Started

Open a terminal window and running the following commands:

1. Authenticate with Azure CLI

    ```bash
    az login
    ```

2. Clone the repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigate to the project directory

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Deploy Azure Resources

Run the following scripts to automate the deployment of Azure resources needed for the MCP server.

The deployment scripts will automatically deploy the `text-embedding-3-small` model. During deployment, you'll have the option to also include the `gpt-4o-mini` model. Note that `gpt-4o-mini` is **not required** for this project and is only included for potential future enhancements.

**Choose the script for your platform:**

#### Windows (PowerShell)

```powershell
# Run from the project root directory
cd infra && ./deploy.ps1
```

#### macOS/Linux (Bash)

```bash
# Run from the project root directory
cd infra && ./deploy.sh
```

## Running the MCP Server

The easiest way to run the complete stack (PostgreSQL + MCP Server) is using Docker Compose:

### Start the Stack

```bash
# Start PostgreSQL and MCP Server
docker compose up -d

# View logs
docker compose logs -f

# View MCP Server Logs
docker compose logs -f mcp_server

# View the PostgreSQL Logs
docker compose logs -f pg17

# Stop the stack
docker compose down -v
```

## Usage

The following assumes you'll be using the built-in VS Code MCP server support.

1. Open the project in VS Code. From the terminal, run:

    ```bash
    code .
    ```

2. Start one or more MCP servers using the configurations in `.vscode/mcp.json`. The file contains four different server configurations, each representing a different store manager role:

   - Each configuration uses a unique RLS (Row Level Security) user ID
   - These user IDs simulate different store manager identities accessing the database
   - The RLS system restricts data access based on the manager's assigned store
   - This mimics real-world scenarios where store managers sign in with different Entra ID accounts

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
            },
            "zava-sales-analysis-redmond": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "e7f8a9b0-c1d2-3e4f-5678-90abcdef1234"}
            },
            "zava-sales-analysis-online": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2"}
            }
        },
        "inputs": []
    }
    ```

### Open VS Code AI Chat

1. Open AI Chat mode in VS Code
2. Type **#zava** and select one of the MCP servers you started
3. Ask questions about the sales data - See sample queries below

### Sample Queries

1. Show top 20 products by sales revenue
1. Show sales by store
1. What were the last quarter's sales by category?
1. What products do we sell that are similar to "containers for paint"

## Features

- **Multi-table Schema Access**: Retrieve schemas for multiple database tables in a single request
- **Secure Query Execution**: Execute PostgreSQL queries with Row Level Security (RLS) support
- **Real-time Data**: Access current sales, inventory, and customer data
- **Date/Time Utilities**: Get current UTC timestamps for time-sensitive analysis
- **Flexible Deployment**: Supports HTTP server mode

## Supported Tables

The server provides access to the following retail database tables:

- `retail.customers` - Customer information and profiles
- `retail.stores` - Store locations and details
- `retail.categories` - Product categories and hierarchies
- `retail.product_types` - Product type classifications
- `retail.products` - Product catalog and specifications
- `retail.orders` - Customer orders and transactions
- `retail.order_items` - Individual items within orders
- `retail.inventory` - Current inventory levels and stock data

## Tools Available

### `get_multiple_table_schemas`

Retrieve database schemas for multiple tables in a single request.

**Parameters:**

- `table_names` (list[str]): List of valid table names from the supported tables above

**Returns:** Concatenated schema strings for the requested tables

### `execute_sales_query`

Execute PostgreSQL queries against the sales database with Row Level Security.

**Parameters:**

- `postgresql_query` (str): A well-formed PostgreSQL query

**Returns:** Query results formatted as a string (limited to 20 rows for readability)

**Best Practices:**

- Always fetch table schemas first
- Use exact column names from schemas
- Join related tables for comprehensive analysis
- Aggregate results when appropriate
- Limit output for readability

### `get_current_utc_date`

Get the current UTC date and time in ISO format.

**Returns:** Current UTC date/time in ISO format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Perform a semantic search for products based on user queries.

**Returns:** A list of products matching the search criteria

**Parameters:**

- `query` (str): The search query string

**Returns:** A list of products matching the search criteria

## Security Features

### Row Level Security (RLS)

The server implements Row Level Security to ensure users only access data they're authorized to view:

- **HTTP Mode**: Uses `x-rls-user-id` header to identify the requesting user

- **Default Fallback**: Uses placeholder UUID when no user ID is provided

#### Store-Specific RLS User IDs

Each Zava Retail store location has a unique RLS user ID that determines which data the user can access:

| Store Location | RLS User ID | Description |
|---------------|-------------|-------------|
| **Global Access** | `00000000-0000-0000-0000-000000000000` | Default fallback - all store access |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle store data |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue store data |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma store data |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane store data |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett store data |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond store data |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland store data |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online store data |

#### RLS Implementation

When a user connects with a specific store's RLS User ID, they will only see:

- Customers associated with that store
- Orders placed at that store location
- Inventory data for that specific store
- Store-specific sales and performance metrics

This ensures data isolation between different store locations while maintaining a unified database schema.

## Architecture

### Application Context

The server uses a managed application context with:

- **Database Connection Pool**: Efficient connection management for HTTP mode
- **Lifecycle Management**: Proper resource cleanup on shutdown
- **Type Safety**: Strongly typed context with `AppContext` dataclass

### Request Context

- **Header Extraction**: Secure header parsing for user identification
- **RLS Integration**: Automatic user ID resolution from request context
- **Error Handling**: Comprehensive error handling with user-friendly messages

## Database Integration

The server integrates with a PostgreSQL database through the `PostgreSQLSchemaProvider` class:

- **Connection Pooling**: Uses async connection pools for scalability
- **Schema Metadata**: Provides detailed table schema information
- **Query Execution**: Secure query execution with RLS support
- **Resource Management**: Automatic cleanup of database resources

## Error Handling

The server implements robust error handling:

- **Table Validation**: Ensures only valid table names are accessed
- **Query Validation**: Validates PostgreSQL queries before execution
- **Resource Management**: Proper cleanup even during errors
- **User-Friendly Messages**: Clear error messages for troubleshooting

## Security Considerations

1. **Row Level Security**: All queries respect RLS policies based on user identity
2. **Store Data Isolation**: Each store's RLS User ID ensures access only to that store's data
3. **Input Validation**: Table names and queries are validated before execution
4. **Resource Limits**: Query results are limited to prevent excessive resource usage
5. **Connection Security**: Uses secure database connection practices
6. **User Identity Verification**: Always ensure the correct RLS User ID is used for the intended store location

### Important Security Notes

- **Never use production RLS User IDs in development environments**
- **Always verify the RLS User ID matches the intended store before running queries**
- **The default UUID (`00000000-0000-0000-0000-000000000000`) provides limited access**
- **Each store manager should only have access to their store's RLS User ID**

## Development

### Project Structure

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Key Components

- **FastMCP Server**: Modern MCP server implementation with async support
- **PostgreSQL Provider**: Database abstraction layer with RLS support
- **Context Management**: Type-safe application and request context handling
- **Tool Registration**: Declarative tool registration with Pydantic validation

## Contributing

When contributing to this server:

1. Ensure all database queries respect Row Level Security
2. Add proper error handling for new tools
3. Update this README with any new features or changes
4. Test the HTTP server mode
5. Validate input parameters and provide clear error messages

## [License](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*This MCP server enables secure, efficient access to Zava Retail sales data for AI-powered analysis and insights.*
