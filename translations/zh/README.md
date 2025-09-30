<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:20:19+00:00",
  "source_file": "README.md",
  "language_code": "zh"
}
-->
# MCP服务器与PostgreSQL示例 - 零售销售分析

## 通过实践示例学习MCP与数据库集成

[![GitHub贡献者](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub问题](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub拉取请求](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![欢迎PR](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![加入Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

按照以下步骤开始使用这些资源：

1. **Fork仓库**：点击[这里Fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **克隆仓库**：`git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **加入Azure AI Foundry Discord**：[与专家和开发者交流](https://discord.com/invite/ByRwuEEgH4)

### 🌐 多语言支持

#### 通过GitHub Action支持（自动更新，始终保持最新）

[法语](../fr/README.md) | [西班牙语](../es/README.md) | [德语](../de/README.md) | [俄语](../ru/README.md) | [阿拉伯语](../ar/README.md) | [波斯语](../fa/README.md) | [乌尔都语](../ur/README.md) | [中文（简体）](./README.md) | [中文（繁体，澳门）](../mo/README.md) | [中文（繁体，香港）](../hk/README.md) | [中文（繁体，台湾）](../tw/README.md) | [日语](../ja/README.md) | [韩语](../ko/README.md) | [印地语](../hi/README.md) | [孟加拉语](../bn/README.md) | [马拉地语](../mr/README.md) | [尼泊尔语](../ne/README.md) | [旁遮普语（古木基文）](../pa/README.md) | [葡萄牙语（葡萄牙）](../pt/README.md) | [葡萄牙语（巴西）](../br/README.md) | [意大利语](../it/README.md) | [波兰语](../pl/README.md) | [土耳其语](../tr/README.md) | [希腊语](../el/README.md) | [泰语](../th/README.md) | [瑞典语](../sv/README.md) | [丹麦语](../da/README.md) | [挪威语](../no/README.md) | [芬兰语](../fi/README.md) | [荷兰语](../nl/README.md) | [希伯来语](../he/README.md) | [越南语](../vi/README.md) | [印尼语](../id/README.md) | [马来语](../ms/README.md) | [他加禄语（菲律宾语）](../tl/README.md) | [斯瓦希里语](../sw/README.md) | [匈牙利语](../hu/README.md) | [捷克语](../cs/README.md) | [斯洛伐克语](../sk/README.md) | [罗马尼亚语](../ro/README.md) | [保加利亚语](../bg/README.md) | [塞尔维亚语（西里尔文）](../sr/README.md) | [克罗地亚语](../hr/README.md) | [斯洛文尼亚语](../sl/README.md) | [乌克兰语](../uk/README.md) | [缅甸语（缅甸）](../my/README.md)

**如果您希望支持其他语言，请查看[这里](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## 简介

此示例展示了如何构建和部署一个全面的**模型上下文协议（MCP）服务器**，通过PostgreSQL为AI助手提供安全、智能的零售销售数据访问。项目展示了企业级功能，包括**行级安全（RLS）**、**语义搜索功能**以及**Azure AI集成**，适用于真实的零售分析场景。

**主要应用场景：**
- **AI驱动的销售分析**：使AI助手能够通过自然语言查询和分析零售销售数据
- **安全的多租户访问**：展示行级安全的实现，不同的店铺经理只能访问自己店铺的数据
- **语义产品搜索**：利用文本嵌入技术展示AI增强的产品发现功能
- **企业集成**：展示如何将MCP服务器与Azure服务和PostgreSQL数据库集成

**适合对象：**
- 学习如何构建带数据库集成的MCP服务器的开发者
- 实现安全多租户分析解决方案的数据工程师
- 使用零售或电商数据开发AI应用的开发者
- 对将AI助手与企业数据库结合感兴趣的任何人

## 加入Azure AI Foundry Discord社区
分享您对MCP的经验，与专家和产品团队交流

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# 销售分析MCP服务器

一个模型上下文协议（MCP）服务器，为Zava零售DIY业务提供全面的客户销售数据库访问。此服务器通过安全、支持模式的接口使AI助手能够查询和分析零售销售数据。

## 📚 完整实施指南

有关如何构建此解决方案以及实施类似MCP服务器的详细分解，请参阅我们的全面**[示例演练](Sample_Walkthrough.md)**。此指南提供：

- **架构深入分析**：组件分析和设计模式
- **逐步构建**：从项目设置到部署
- **代码分解**：详细解释MCP服务器的实现
- **高级功能**：行级安全、语义搜索和监控
- **最佳实践**：安全性、性能和开发指南
- **故障排除**：常见问题及解决方案

非常适合希望了解实施细节并构建类似解决方案的开发者。

## 🤖 什么是MCP（模型上下文协议）？

**模型上下文协议（MCP）**是一种开放标准，使AI助手能够实时安全地访问外部数据源和工具。它是一个桥梁，允许AI模型连接数据库、API、文件系统和其他资源，同时保持安全性和控制。

### 主要优势：
- **实时数据访问**：AI助手可以查询实时数据库和API
- **安全集成**：通过认证和权限控制访问
- **工具扩展性**：为AI助手添加自定义功能
- **标准化协议**：适用于不同的AI平台和工具

### MCP新手？

如果您是模型上下文协议的新手，我们建议从微软的全面初学者资源开始：

**📖 [MCP初学者指南](https://aka.ms/mcp-for-beginners)**

此资源提供：
- MCP概念和架构介绍
- 构建您的第一个MCP服务器的分步教程
- MCP开发的最佳实践
- 与流行AI平台的集成示例
- 社区资源和支持

了解基础知识后，返回这里探索此高级零售分析实现！

## 📚 综合学习指南：/walkthrough

此仓库包含完整的**12模块学习演练**，将此MCP零售服务器示例分解为易于理解的分步课程。演练将此工作示例转化为全面的教育资源，非常适合希望了解如何构建生产级MCP服务器并进行数据库集成的开发者。

### 您将学到什么

演练涵盖从基本MCP概念到高级生产部署的所有内容，包括：

- **MCP基础知识**：了解模型上下文协议及其实际应用
- **数据库集成**：实现安全的PostgreSQL连接与行级安全
- **AI增强功能**：使用Azure OpenAI嵌入添加语义搜索功能
- **安全实施**：企业级认证、授权和数据隔离
- **工具开发**：构建复杂的MCP工具用于数据分析和商业智能
- **测试与调试**：全面的测试策略和调试技术
- **VS Code集成**：配置AI聊天以进行自然语言数据库查询
- **生产部署**：容器化、扩展和云部署策略
- **监控与可观察性**：应用洞察、日志记录和性能监控

### 学习路径概览

演练遵循渐进式学习结构，适合各技能水平的开发者：

| 模块 | 重点领域 | 描述 | 时间估计 |
|--------|------------|-------------|---------------|
| **[00-简介](walkthrough/00-Introduction/README.md)** | 基础 | MCP概念、Zava零售案例研究、架构概览 | 30分钟 |
| **[01-架构](walkthrough/01-Architecture/README.md)** | 设计模式 | 技术架构、分层设计、系统组件 | 45分钟 |
| **[02-安全](walkthrough/02-Security/README.md)** | 企业安全 | Azure认证、行级安全、多租户隔离 | 60分钟 |
| **[03-设置](walkthrough/03-Setup/README.md)** | 环境 | Docker设置、Azure CLI、项目配置、验证 | 45分钟 |
| **[04-数据库](walkthrough/04-Database/README.md)** | 数据层 | PostgreSQL模式、pgvector、RLS策略、示例数据 | 60分钟 |
| **[05-MCP服务器](walkthrough/05-MCP-Server/README.md)** | 核心实现 | FastMCP框架、数据库集成、连接管理 | 90分钟 |
| **[06-工具](walkthrough/06-Tools/README.md)** | 工具开发 | MCP工具创建、查询验证、商业智能功能 | 75分钟 |
| **[07-语义搜索](walkthrough/07-Semantic-Search/README.md)** | AI集成 | Azure OpenAI嵌入、向量搜索、混合搜索策略 | 60分钟 |
| **[08-测试](walkthrough/08-Testing/README.md)** | 质量保证 | 单元测试、集成测试、性能测试、调试 | 75分钟 |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | 开发体验 | VS Code配置、AI聊天集成、调试工作流 | 45分钟 |
| **[10-部署](walkthrough/10-Deployment/README.md)** | 生产准备 | 容器化、Azure容器应用、CI/CD管道、扩展 | 90分钟 |
| **[11-监控](walkthrough/11-Monitoring/README.md)** | 可观察性 | 应用洞察、结构化日志记录、性能指标 | 60分钟 |
| **[12-最佳实践](walkthrough/12-Best-Practices/README.md)** | 生产卓越 | 安全加固、性能优化、企业模式 | 45分钟 |

**总学习时间**：约12-15小时的全面实践学习

### 🎯 如何使用演练

**对于初学者**：
1. 从[模块00：简介](walkthrough/00-Introduction/README.md)开始，了解MCP基础知识
2. 按顺序学习模块，获得完整的学习体验
3. 每个模块都基于之前的概念，并包含实践练习

**对于有经验的开发者**：
1. 查看[主要演练概览](walkthrough/README.md)，了解完整模块摘要
2. 跳到您感兴趣的特定模块（例如模块07：AI集成）
3. 将单个模块作为您自己项目的参考材料

**对于生产实施**：
1. 重点关注模块02（安全）、模块10（部署）和模块11（监控）
2. 查看模块12（最佳实践），了解企业指南
3. 使用代码示例作为生产级模板

### 🚀 快速开始选项

**选项1：完整学习路径**（推荐给新手）
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**选项2：实践实施**（直接开始构建）
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**选项3：生产重点**（企业部署）
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 学习前提条件

**推荐背景知识**：
- 基本的 Python 编程经验
- 熟悉 REST API 和数据库
- 对 AI/ML 概念有一般性了解
- 基本的命令行和 Docker 知识

**非必需（但有帮助）**：
- 之前的 MCP 经验（我们会从零开始讲解）
- Azure 云经验（我们提供逐步指导）
- 高级 PostgreSQL 知识（我们会根据需要解释相关概念）

### 💡 学习技巧

1. **动手实践**：每个模块都包含可运行和修改的代码示例
2. **逐步复杂化**：概念从简单到复杂逐步构建
3. **真实场景**：所有示例都基于现实的零售业务场景
4. **生产就绪**：代码示例设计用于实际生产环境
5. **社区支持**：加入我们的 [Discord 社区](https://discord.com/invite/ByRwuEEgH4) 获取帮助和讨论

### 🔗 相关资源

- **[MCP 初学者指南](https://aka.ms/mcp-for-beginners)**：基础阅读材料
- **[示例演练](Sample_Walkthrough.md)**：技术概览
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**：示例中使用的云平台
- **[FastMCP 框架](https://github.com/jlowin/fastmcp)**：Python MCP 实现框架

**准备好开始学习了吗？** 从 **[模块 00：简介](walkthrough/00-Introduction/README.md)** 开始，或者浏览 **[完整演练概览](walkthrough/README.md)**。

## 前提条件

1. 安装 Docker Desktop
2. 安装 Git
3. **Azure CLI**：安装并通过 Azure CLI 进行身份验证
4. 访问 OpenAI 的 `text-embedding-3-small` 模型，可选 `gpt-4o-mini` 模型

## 入门

打开终端窗口并运行以下命令：

1. 使用 Azure CLI 进行身份验证

    ```bash
    az login
    ```

2. 克隆代码库

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. 进入项目目录

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### 部署 Azure 资源

运行以下脚本以自动部署 MCP 服务器所需的 Azure 资源。

部署脚本会自动部署 `text-embedding-3-small` 模型。在部署过程中，您可以选择是否包括 `gpt-4o-mini` 模型。请注意，`gpt-4o-mini` **不是本项目的必需项**，仅用于未来可能的功能扩展。

**选择适合您平台的脚本：**

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

## 运行 MCP 服务器

运行完整堆栈（PostgreSQL + MCP 服务器）的最简单方法是使用 Docker Compose：

### 启动堆栈

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

## 使用方法

以下假设您将使用内置的 VS Code MCP 服务器支持。

1. 在 VS Code 中打开项目。从终端运行：

    ```bash
    code .
    ```

2. 使用 `.vscode/mcp.json` 中的配置启动一个或多个 MCP 服务器。该文件包含四种不同的服务器配置，每种配置代表一个不同的门店经理角色：

   - 每个配置使用唯一的 RLS（行级安全）用户 ID
   - 这些用户 ID 模拟不同门店经理访问数据库的身份
   - RLS 系统根据经理分配的门店限制数据访问
   - 这模拟了现实场景中门店经理使用不同的 Entra ID 账户登录的情况

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

### 打开 VS Code AI 聊天

1. 在 VS Code 中打开 AI 聊天模式
2. 输入 **#zava** 并选择您启动的 MCP 服务器之一
3. 查询销售数据 - 参见以下示例查询

### 示例查询

1. 显示按销售收入排名的前 20 种产品
2. 显示各门店的销售情况
3. 上季度按类别的销售情况如何？
4. 我们销售哪些类似于“油漆容器”的产品？

## 功能

- **多表架构访问**：在单次请求中检索多个数据库表的架构
- **安全查询执行**：支持行级安全（RLS）的 PostgreSQL 查询执行
- **实时数据**：访问当前销售、库存和客户数据
- **日期/时间工具**：获取当前 UTC 时间戳，用于时间敏感分析
- **灵活部署**：支持 HTTP 服务器模式

## 支持的表

服务器提供对以下零售数据库表的访问：

- `retail.customers` - 客户信息和档案
- `retail.stores` - 门店位置和详情
- `retail.categories` - 产品类别和层级
- `retail.product_types` - 产品类型分类
- `retail.products` - 产品目录和规格
- `retail.orders` - 客户订单和交易
- `retail.order_items` - 订单中的单个商品
- `retail.inventory` - 当前库存水平和库存数据

## 可用工具

### `get_multiple_table_schemas`

在单次请求中检索多个表的数据库架构。

**参数：**

- `table_names` (list[str])：支持表名列表（见上文）

**返回值：** 请求表的拼接架构字符串

### `execute_sales_query`

在支持行级安全的销售数据库中执行 PostgreSQL 查询。

**参数：**

- `postgresql_query` (str)：格式正确的 PostgreSQL 查询

**返回值：** 查询结果格式化为字符串（为便于阅读限制为 20 行）

**最佳实践：**

- 始终先获取表架构
- 使用架构中的确切列名
- 连接相关表以进行全面分析
- 适当聚合结果
- 限制输出以提高可读性

### `get_current_utc_date`

以 ISO 格式获取当前 UTC 日期和时间。

**返回值：** 当前 UTC 日期/时间，ISO 格式（YYYY-MM-DDTHH:MM:SS.fffffZ）

### `semantic_search_products`

根据用户查询执行产品的语义搜索。

**返回值：** 符合搜索条件的产品列表

**参数：**

- `query` (str)：搜索查询字符串

**返回值：** 符合搜索条件的产品列表

## 安全功能

### 行级安全（RLS）

服务器实现了行级安全，以确保用户只能访问其授权查看的数据：

- **HTTP 模式**：使用 `x-rls-user-id` 头标识请求用户

- **默认回退**：当未提供用户 ID 时使用占位符 UUID

#### 门店特定的 RLS 用户 ID

每个 Zava 零售门店位置都有一个唯一的 RLS 用户 ID，用于确定用户可以访问哪些数据：

| 门店位置 | RLS 用户 ID | 描述 |
|---------|-------------|------|
| **全局访问** | `00000000-0000-0000-0000-000000000000` | 默认回退 - 所有门店访问 |
| **西雅图** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava 零售西雅图门店数据 |
| **贝尔维尤** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava 零售贝尔维尤门店数据 |
| **塔科马** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava 零售塔科马门店数据 |
| **斯波坎** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava 零售斯波坎门店数据 |
| **埃弗里特** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava 零售埃弗里特门店数据 |
| **雷德蒙德** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava 零售雷德蒙德门店数据 |
| **柯克兰** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava 零售柯克兰门店数据 |
| **在线商店** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava 零售在线商店数据 |

#### RLS 实现

当用户使用特定门店的 RLS 用户 ID 连接时，他们只能看到：

- 与该门店相关的客户
- 在该门店位置下的订单
- 该门店的库存数据
- 门店特定的销售和绩效指标

这确保了不同门店位置之间的数据隔离，同时保持统一的数据库架构。

## 架构

### 应用上下文

服务器使用托管的应用上下文，包括：

- **数据库连接池**：高效的连接管理，用于 HTTP 模式
- **生命周期管理**：关闭时正确清理资源
- **类型安全**：使用 `AppContext` 数据类的强类型上下文

### 请求上下文

- **头信息提取**：安全的头信息解析，用于用户身份识别
- **RLS 集成**：从请求上下文自动解析用户 ID
- **错误处理**：全面的错误处理，提供用户友好的消息

## 数据库集成

服务器通过 `PostgreSQLSchemaProvider` 类与 PostgreSQL 数据库集成：

- **连接池**：使用异步连接池以提高可扩展性
- **架构元数据**：提供详细的表架构信息
- **查询执行**：支持 RLS 的安全查询执行
- **资源管理**：自动清理数据库资源

## 错误处理

服务器实现了强大的错误处理：

- **表验证**：确保只访问有效的表名
- **查询验证**：在执行前验证 PostgreSQL 查询
- **资源管理**：即使在发生错误时也能正确清理资源
- **用户友好消息**：提供清晰的错误消息以便排查问题

## 安全注意事项

1. **行级安全**：所有查询都遵守基于用户身份的 RLS 策略
2. **门店数据隔离**：每个门店的 RLS 用户 ID 确保仅访问该门店的数据
3. **输入验证**：在执行前验证表名和查询
4. **资源限制**：限制查询结果以防止过度资源使用
5. **连接安全**：使用安全的数据库连接实践
6. **用户身份验证**：始终确保使用正确的 RLS 用户 ID 访问目标门店

### 重要安全提示

- **切勿在开发环境中使用生产 RLS 用户 ID**
- **始终验证 RLS 用户 ID 是否与目标门店匹配后再运行查询**
- **默认 UUID (`00000000-0000-0000-0000-000000000000`) 提供有限访问权限**
- **每个门店经理应仅访问其门店的 RLS 用户 ID**

## 开发

### 项目结构

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### 关键组件

- **FastMCP 服务器**：支持异步的现代 MCP 服务器实现
- **PostgreSQL 提供者**：具有 RLS 支持的数据库抽象层
- **上下文管理**：类型安全的应用和请求上下文处理
- **工具注册**：使用 Pydantic 验证的声明式工具注册

## 贡献

在为此服务器贡献代码时：

1. 确保所有数据库查询遵守行级安全
2. 为新工具添加适当的错误处理
3. 更新此 README 文件以反映任何新功能或更改
4. 测试 HTTP 服务器模式
5. 验证输入参数并提供清晰的错误消息

## [许可证](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*此 MCP 服务器可安全、高效地访问 Zava 零售销售数据，用于 AI 驱动的分析和洞察。*

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们对因使用此翻译而产生的任何误解或误读不承担责任。