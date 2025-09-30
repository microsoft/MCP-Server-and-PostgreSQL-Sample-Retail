<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:23:01+00:00",
  "source_file": "README.md",
  "language_code": "hk"
}
-->
# MCP 伺服器與 PostgreSQL 範例 - 零售銷售分析

## 通過實踐範例學習 MCP 與資料庫整合

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![加入 Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

按照以下步驟開始使用這些資源：

1. **Fork 此儲存庫**：點擊[這裡 Fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone 此儲存庫**：`git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **加入 Azure AI Foundry Discord**：[與專家和其他開發者交流](https://discord.com/invite/ByRwuEEgH4)

### 🌐 多語言支援

#### 通過 GitHub Action 支援（自動化且始終保持最新）

[法文](../fr/README.md) | [西班牙文](../es/README.md) | [德文](../de/README.md) | [俄文](../ru/README.md) | [阿拉伯文](../ar/README.md) | [波斯文（法爾西）](../fa/README.md) | [烏爾都文](../ur/README.md) | [中文（簡體）](../zh/README.md) | [中文（繁體，澳門）](../mo/README.md) | [中文（繁體，香港）](./README.md) | [中文（繁體，台灣）](../tw/README.md) | [日文](../ja/README.md) | [韓文](../ko/README.md) | [印地文](../hi/README.md) | [孟加拉文](../bn/README.md) | [馬拉地文](../mr/README.md) | [尼泊爾文](../ne/README.md) | [旁遮普文（古木基文）](../pa/README.md) | [葡萄牙文（葡萄牙）](../pt/README.md) | [葡萄牙文（巴西）](../br/README.md) | [意大利文](../it/README.md) | [波蘭文](../pl/README.md) | [土耳其文](../tr/README.md) | [希臘文](../el/README.md) | [泰文](../th/README.md) | [瑞典文](../sv/README.md) | [丹麥文](../da/README.md) | [挪威文](../no/README.md) | [芬蘭文](../fi/README.md) | [荷蘭文](../nl/README.md) | [希伯來文](../he/README.md) | [越南文](../vi/README.md) | [印尼文](../id/README.md) | [馬來文](../ms/README.md) | [塔加洛語（菲律賓語）](../tl/README.md) | [斯瓦希里文](../sw/README.md) | [匈牙利文](../hu/README.md) | [捷克文](../cs/README.md) | [斯洛伐克文](../sk/README.md) | [羅馬尼亞文](../ro/README.md) | [保加利亞文](../bg/README.md) | [塞爾維亞文（西里爾文）](../sr/README.md) | [克羅地亞文](../hr/README.md) | [斯洛文尼亞文](../sl/README.md) | [烏克蘭文](../uk/README.md) | [緬甸文（緬甸）](../my/README.md)

**如果您希望支援其他語言，請參考[這裡](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## 簡介

此範例展示了如何構建和部署一個全面的 **Model Context Protocol (MCP) 伺服器**，該伺服器通過 PostgreSQL 為 AI 助手提供安全且智能的零售銷售數據訪問。該專案展示了企業級功能，包括 **行級安全性 (RLS)**、**語義搜索功能**以及 **Azure AI 整合**，適用於真實的零售分析場景。

**主要應用場景：**
- **AI 驅動的銷售分析**：讓 AI 助手通過自然語言查詢和分析零售銷售數據
- **安全的多租戶訪問**：展示行級安全性的實現，不同的店長只能訪問自己店鋪的數據
- **語義產品搜索**：展示使用文本嵌入的 AI 增強產品發現功能
- **企業整合**：展示如何將 MCP 伺服器與 Azure 服務和 PostgreSQL 資料庫整合

**適合對象：**
- 想學習 MCP 與資料庫整合的開發者
- 實施安全多租戶分析解決方案的數據工程師
- 使用零售或電子商務數據進行開發的 AI 應用開發者
- 對將 AI 助手與企業資料庫結合感興趣的任何人

## 加入 Azure AI Foundry Discord 社群
分享您對 MCP 的經驗，並與專家和產品團隊交流

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# 銷售分析 MCP 伺服器

一個 Model Context Protocol (MCP) 伺服器，為 Zava 零售 DIY 業務提供全面的客戶銷售數據訪問。此伺服器通過安全且結構化的介面，讓 AI 助手能夠查詢和分析零售銷售數據。

## 📚 完整實施指南

有關如何構建此解決方案以及如何實施類似 MCP 伺服器的詳細說明，請參閱我們的 **[範例指南](Sample_Walkthrough.md)**。該指南提供：

- **架構深入解析**：元件分析和設計模式
- **逐步構建**：從專案設置到部署
- **代碼解析**：MCP 伺服器實現的詳細說明
- **高級功能**：行級安全性、語義搜索和監控
- **最佳實踐**：安全性、性能和開發指南
- **故障排除**：常見問題和解決方案

非常適合希望了解實施細節並構建類似解決方案的開發者。

## 🤖 什麼是 MCP（Model Context Protocol）？

**Model Context Protocol (MCP)** 是一個開放標準，允許 AI 助手實時安全地訪問外部數據源和工具。可以將其視為一座橋樑，讓 AI 模型能夠連接到資料庫、API、文件系統和其他資源，同時保持安全性和控制。

### 主要優勢：
- **實時數據訪問**：AI 助手可以查詢即時資料庫和 API
- **安全整合**：通過身份驗證和權限控制訪問
- **工具擴展性**：為 AI 助手添加自定義功能
- **標準化協議**：適用於不同的 AI 平台和工具

### MCP 新手？

如果您是 Model Context Protocol 的新手，我們建議從 Microsoft 的全面入門資源開始：

**📖 [MCP 入門指南](https://aka.ms/mcp-for-beginners)**

該資源提供：
- MCP 概念和架構介紹
- 構建第一個 MCP 伺服器的逐步教程
- MCP 開發的最佳實踐
- 與流行 AI 平台的整合範例
- 社群資源和支援

了解基礎知識後，回到這裡探索此進階的零售分析實現！

## 📚 全面學習指南：/walkthrough

此儲存庫包含完整的 **12 模組學習指南**，將此 MCP 零售伺服器範例分解為易於理解的逐步課程。該指南將這個工作範例轉化為一個全面的教育資源，非常適合希望了解如何構建具有資料庫整合的生產級 MCP 伺服器的開發者。

### 您將學到什麼

該指南涵蓋從 MCP 基本概念到進階生產部署的所有內容，包括：

- **MCP 基礎**：了解 Model Context Protocol 及其實際應用
- **資料庫整合**：實現具有行級安全性的安全 PostgreSQL 連接
- **AI 增強功能**：使用 Azure OpenAI 嵌入添加語義搜索功能
- **安全性實現**：企業級身份驗證、授權和數據隔離
- **工具開發**：構建用於數據分析和商業智能的高級 MCP 工具
- **測試與調試**：全面的測試策略和調試技術
- **VS Code 整合**：配置 AI Chat 進行自然語言資料庫查詢
- **生產部署**：容器化、擴展和雲端部署策略
- **監控與可觀察性**：應用洞察、日誌記錄和性能監控

### 學習路徑概覽

該指南遵循一個漸進式學習結構，適合所有技能水平的開發者：

| 模組 | 重點領域 | 描述 | 時間預估 |
|--------|------------|-------------|---------------|
| **[00-簡介](walkthrough/00-Introduction/README.md)** | 基礎 | MCP 概念、Zava 零售案例研究、架構概覽 | 30 分鐘 |
| **[01-架構](walkthrough/01-Architecture/README.md)** | 設計模式 | 技術架構、分層設計、系統元件 | 45 分鐘 |
| **[02-安全性](walkthrough/02-Security/README.md)** | 企業安全 | Azure 身份驗證、行級安全性、多租戶隔離 | 60 分鐘 |
| **[03-設置](walkthrough/03-Setup/README.md)** | 環境 | Docker 設置、Azure CLI、專案配置、驗證 | 45 分鐘 |
| **[04-資料庫](walkthrough/04-Database/README.md)** | 資料層 | PostgreSQL 架構、pgvector、RLS 策略、範例數據 | 60 分鐘 |
| **[05-MCP 伺服器](walkthrough/05-MCP-Server/README.md)** | 核心實現 | FastMCP 框架、資料庫整合、連接管理 | 90 分鐘 |
| **[06-工具](walkthrough/06-Tools/README.md)** | 工具開發 | MCP 工具創建、查詢驗證、商業智能功能 | 75 分鐘 |
| **[07-語義搜索](walkthrough/07-Semantic-Search/README.md)** | AI 整合 | Azure OpenAI 嵌入、向量搜索、混合搜索策略 | 60 分鐘 |
| **[08-測試](walkthrough/08-Testing/README.md)** | 品質保證 | 單元測試、整合測試、性能測試、調試 | 75 分鐘 |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | 開發體驗 | VS Code 配置、AI Chat 整合、調試工作流 | 45 分鐘 |
| **[10-部署](walkthrough/10-Deployment/README.md)** | 生產準備 | 容器化、Azure Container Apps、CI/CD 管道、擴展 | 90 分鐘 |
| **[11-監控](walkthrough/11-Monitoring/README.md)** | 可觀察性 | 應用洞察、結構化日誌記錄、性能指標 | 60 分鐘 |
| **[12-最佳實踐](walkthrough/12-Best-Practices/README.md)** | 生產卓越 | 安全加固、性能優化、企業模式 | 45 分鐘 |

**總學習時間**：~12-15 小時的全面實踐學習

### 🎯 如何使用學習指南

**對於初學者**：
1. 從 [模組 00：簡介](walkthrough/00-Introduction/README.md) 開始，了解 MCP 基礎
2. 按順序學習模組，獲得完整的學習體驗
3. 每個模組都建立在之前的概念之上，並包含實踐練習

**對於有經驗的開發者**：
1. 查看 [主要指南概覽](walkthrough/README.md)，獲取完整模組摘要
2. 跳到您感興趣的特定模組（例如模組 07 的 AI 整合）
3. 將單個模組作為您自己專案的參考資料

**對於生產實施**：
1. 重點關注模組 02（安全性）、10（部署）和 11（監控）
2. 查看模組 12（最佳實踐），獲取企業指南
3. 使用代碼範例作為生產級模板

### 🚀 快速開始選項

**選項 1：完整學習路徑**（推薦給新手）
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**選項 2：實踐實施**（直接開始構建）
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**選項 3：生產重點**（企業部署）
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 學習前提條件

**建議背景知識**：
- 基本的 Python 程式設計經驗
- 熟悉 REST API 和資料庫
- 對 AI/ML 概念有一般理解
- 基本的命令列操作和 Docker 知識

**非必要（但有幫助）**：
- 之前的 MCP 經驗（我們會從零開始教）
- Azure 雲端經驗（我們提供逐步指導）
- 高級 PostgreSQL 知識（我們會根據需要解釋概念）

### 💡 學習技巧

1. **動手操作**：每個模組都包含可執行和修改的程式碼範例
2. **漸進式複雜度**：概念從簡單逐步到高級
3. **真實世界背景**：所有範例都基於真實的零售業務場景
4. **生產就緒**：程式碼範例設計可直接用於生產環境
5. **社群支援**：加入我們的 [Discord 社群](https://discord.com/invite/ByRwuEEgH4) 獲得幫助和討論

### 🔗 相關資源

- **[MCP 初學者指南](https://aka.ms/mcp-for-beginners)**：基本背景閱讀
- **[範例導覽](Sample_Walkthrough.md)**：高層次技術概述
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**：範例中使用的雲端平台
- **[FastMCP 框架](https://github.com/jlowin/fastmcp)**：Python MCP 實作框架

**準備好開始學習了嗎？** 從 **[模組 00：簡介](walkthrough/00-Introduction/README.md)** 開始，或探索 **[完整導覽概述](walkthrough/README.md)**。

## 前提條件

1. 安裝 Docker Desktop
2. 安裝 Git
3. **Azure CLI**：安裝並使用 Azure CLI 驗證
4. 可存取 OpenAI 的 `text-embedding-3-small` 模型，選擇性地使用 `gpt-4o-mini` 模型

## 開始使用

打開終端機窗口並執行以下命令：

1. 使用 Azure CLI 驗證

    ```bash
    az login
    ```

2. 克隆儲存庫

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. 進入專案目錄

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### 部署 Azure 資源

執行以下腳本以自動部署 MCP 伺服器所需的 Azure 資源。

部署腳本會自動部署 `text-embedding-3-small` 模型。在部署過程中，您可以選擇是否包括 `gpt-4o-mini` 模型。請注意，`gpt-4o-mini` **不是本專案所需**，僅供未來可能的增強使用。

**選擇適合您平台的腳本：**

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

## 運行 MCP 伺服器

運行完整堆疊（PostgreSQL + MCP 伺服器）最簡單的方法是使用 Docker Compose：

### 啟動堆疊

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

以下假設您將使用內建的 VS Code MCP 伺服器支援。

1. 在 VS Code 中打開專案。從終端機執行：

    ```bash
    code .
    ```

2. 使用 `.vscode/mcp.json` 中的配置啟動一個或多個 MCP 伺服器。該文件包含四個不同的伺服器配置，每個配置代表不同的商店管理角色：

   - 每個配置使用唯一的 RLS（行級安全性）使用者 ID
   - 這些使用者 ID 模擬不同商店管理者身份訪問資料庫
   - RLS 系統根據管理者分配的商店限制資料訪問
   - 模擬真實世界場景，商店管理者使用不同的 Entra ID 帳戶登入

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

### 打開 VS Code AI 聊天

1. 在 VS Code 中打開 AI 聊天模式
2. 輸入 **#zava** 並選擇您啟動的 MCP 伺服器之一
3. 詢問銷售數據相關問題 - 參考以下範例查詢

### 範例查詢

1. 顯示銷售收入最高的 20 個產品
2. 顯示各商店的銷售情況
3. 上季度各類別的銷售情況如何？
4. 我們銷售哪些與「油漆容器」類似的產品？

## 功能

- **多表架構訪問**：在一次請求中檢索多個資料表的架構
- **安全查詢執行**：支持行級安全性的 PostgreSQL 查詢執行
- **即時數據**：訪問當前銷售、庫存和客戶數據
- **日期/時間工具**：獲取時間敏感分析所需的當前 UTC 時間戳
- **靈活部署**：支持 HTTP 伺服器模式

## 支援的資料表

伺服器提供以下零售資料庫表的訪問：

- `retail.customers` - 客戶信息和檔案
- `retail.stores` - 商店位置和詳細信息
- `retail.categories` - 產品類別和層次結構
- `retail.product_types` - 產品類型分類
- `retail.products` - 產品目錄和規格
- `retail.orders` - 客戶訂單和交易
- `retail.order_items` - 訂單中的個別項目
- `retail.inventory` - 當前庫存水平和庫存數據

## 可用工具

### `get_multiple_table_schemas`

在一次請求中檢索多個資料表的架構。

**參數：**

- `table_names` (list[str]): 支援的資料表名稱列表

**返回值：** 請求表的合併架構字串

### `execute_sales_query`

使用行級安全性執行 PostgreSQL 銷售數據庫查詢。

**參數：**

- `postgresql_query` (str): 格式正確的 PostgreSQL 查詢

**返回值：** 格式化為字串的查詢結果（為了可讀性限制為 20 行）

**最佳實踐：**

- 始終先檢索表架構
- 使用架構中的準確列名
- 連接相關表以進行全面分析
- 適當時聚合結果
- 限制輸出以提高可讀性

### `get_current_utc_date`

以 ISO 格式獲取當前 UTC 日期和時間。

**返回值：** 當前 UTC 日期/時間，格式為 ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

基於使用者查詢執行產品的語義搜索。

**返回值：** 符合搜索條件的產品列表

**參數：**

- `query` (str): 搜索查詢字串

**返回值：** 符合搜索條件的產品列表

## 安全功能

### 行級安全性 (RLS)

伺服器實施行級安全性，確保使用者僅能訪問其授權查看的數據：

- **HTTP 模式**：使用 `x-rls-user-id` 標頭識別請求使用者

- **預設回退**：當未提供使用者 ID 時使用佔位符 UUID

#### 商店特定的 RLS 使用者 ID

每個 Zava 零售商店位置都有唯一的 RLS 使用者 ID，決定使用者可以訪問哪些數據：

| 商店位置 | RLS 使用者 ID | 描述 |
|----------|---------------|------|
| **全域訪問** | `00000000-0000-0000-0000-000000000000` | 預設回退 - 所有商店訪問 |
| **西雅圖** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava 零售西雅圖商店數據 |
| **貝爾維尤** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava 零售貝爾維尤商店數據 |
| **塔科馬** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava 零售塔科馬商店數據 |
| **斯波坎** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava 零售斯波坎商店數據 |
| **埃弗里特** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava 零售埃弗里特商店數據 |
| **雷德蒙** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava 零售雷德蒙商店數據 |
| **柯克蘭** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava 零售柯克蘭商店數據 |
| **線上商店** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava 零售線上商店數據 |

#### RLS 實施

當使用者使用特定商店的 RLS 使用者 ID 連接時，他們只能看到：

- 與該商店相關的客戶
- 在該商店位置下的訂單
- 該商店的庫存數據
- 商店特定的銷售和績效指標

這確保了不同商店位置之間的數據隔離，同時保持統一的資料庫架構。

## 架構

### 應用程式上下文

伺服器使用受管理的應用程式上下文，包括：

- **資料庫連接池**：高效的 HTTP 模式連接管理
- **生命週期管理**：關閉時正確清理資源
- **類型安全**：使用 `AppContext` 資料類型的強類型上下文

### 請求上下文

- **標頭提取**：安全的標頭解析以識別使用者
- **RLS 整合**：從請求上下文自動解析使用者 ID
- **錯誤處理**：全面的錯誤處理，提供使用者友好的消息

## 資料庫整合

伺服器通過 `PostgreSQLSchemaProvider` 類整合 PostgreSQL 資料庫：

- **連接池**：使用非同步連接池以提高可擴展性
- **架構元數據**：提供詳細的資料表架構信息
- **查詢執行**：支持行級安全性的安全查詢執行
- **資源管理**：自動清理資料庫資源

## 錯誤處理

伺服器實施了強大的錯誤處理：

- **表驗證**：確保僅訪問有效的資料表名稱
- **查詢驗證**：在執行前驗證 PostgreSQL 查詢
- **資源管理**：即使在錯誤期間也能正確清理
- **使用者友好消息**：提供清晰的錯誤消息以便排除故障

## 安全考量

1. **行級安全性**：所有查詢均遵守基於使用者身份的 RLS 政策
2. **商店數據隔離**：每個商店的 RLS 使用者 ID 確保僅訪問該商店的數據
3. **輸入驗證**：在執行前驗證資料表名稱和查詢
4. **資源限制**：限制查詢結果以防止過度使用資源
5. **連接安全性**：使用安全的資料庫連接實踐
6. **使用者身份驗證**：始終確保使用正確的 RLS 使用者 ID 用於目標商店位置

### 重要安全注意事項

- **切勿在開發環境中使用生產 RLS 使用者 ID**
- **始終驗證 RLS 使用者 ID 與目標商店匹配後再執行查詢**
- **預設 UUID (`00000000-0000-0000-0000-000000000000`) 提供有限訪問**
- **每個商店管理者應僅能訪問其商店的 RLS 使用者 ID**

## 開發

### 專案結構

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### 核心組件

- **FastMCP 伺服器**：現代 MCP 伺服器實作，支持非同步
- **PostgreSQL 提供者**：具有 RLS 支援的資料庫抽象層
- **上下文管理**：類型安全的應用程式和請求上下文處理
- **工具註冊**：使用 Pydantic 驗證的聲明式工具註冊

## 貢獻

在貢獻此伺服器時：

1. 確保所有資料庫查詢遵守行級安全性
2. 為新工具添加適當的錯誤處理
3. 更新此 README 文件以反映任何新功能或更改
4. 測試 HTTP 伺服器模式
5. 驗證輸入參數並提供清晰的錯誤消息

## [授權](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*此 MCP 伺服器可安全、高效地訪問 Zava 零售銷售數據，用於 AI 驅動的分析和洞察。*

---

**免責聲明**：  
本文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵信息，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。