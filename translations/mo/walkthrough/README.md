<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T19:29:47+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "mo"
}
-->
# 🚀 MCP 伺服器與 PostgreSQL - 完整學習指南

## 🧠 MCP 資料庫整合學習路徑概述

這份全面的學習指南教您如何透過零售分析的實際應用，建立可投入生產的 **Model Context Protocol (MCP) 伺服器**，並整合資料庫。您將學習企業級模式，包括 **Row Level Security (RLS)**、**語義搜尋**、**Azure AI 整合** 和 **多租戶資料存取**。

無論您是後端開發者、AI 工程師，還是資料架構師，這份指南提供結構化的學習內容，搭配真實案例和實作練習。

## 🔗 官方 MCP 資源

- 📘 [MCP 文件](https://modelcontextprotocol.io/) – 詳細教學與使用指南
- 📜 [MCP 規範](https://modelcontextprotocol.io/docs/) – 協議架構與技術參考
- 🧑‍💻 [MCP GitHub 儲存庫](https://github.com/modelcontextprotocol) – 開源 SDK、工具與程式碼範例
- 🌐 [MCP 社群](https://github.com/orgs/modelcontextprotocol/discussions) – 加入討論並為社群做出貢獻
- 📚 [MCP 初學者指南](https://aka.ms/mcp-for-beginners) – 如果您是 MCP 新手，請從這裡開始

## 🧭 MCP 資料庫整合學習路徑

### 📚 完整學習結構

| 模組 | 主題 | 描述 | 連結 |
|------|------|------|------|
| **模組 1-3：基礎** | | | |
| 00 | [MCP 資料庫整合簡介](./00-Introduction/README.md) | MCP 與資料庫整合及零售分析案例概述 | [開始](./00-Introduction/README.md) |
| 01 | [核心架構概念](./01-Architecture/README.md) | MCP 伺服器架構、資料庫層與安全模式的理解 | [學習](./01-Architecture/README.md) |
| 02 | [安全性與多租戶](./02-Security/README.md) | Row Level Security、身份驗證與多租戶資料存取 | [學習](./02-Security/README.md) |
| 03 | [環境設置](./03-Setup/README.md) | 開發環境設置、Docker、Azure 資源 | [設置](./03-Setup/README.md) |
| **模組 4-6：建立 MCP 伺服器** | | | |
| 04 | [資料庫設計與架構](./04-Database/README.md) | PostgreSQL 設置、零售架構設計與範例資料 | [建立](./04-Database/README.md) |
| 05 | [MCP 伺服器實作](./05-MCP-Server/README.md) | 建立與資料庫整合的 FastMCP 伺服器 | [建立](./05-MCP-Server/README.md) |
| 06 | [工具開發](./06-Tools/README.md) | 創建資料庫查詢工具與架構檢視工具 | [建立](./06-Tools/README.md) |
| **模組 7-9：進階功能** | | | |
| 07 | [語義搜尋整合](./07-Semantic-Search/README.md) | 使用 Azure OpenAI 和 pgvector 實作向量嵌入 | [進階](./07-Semantic-Search/README.md) |
| 08 | [測試與除錯](./08-Testing/README.md) | 測試策略、除錯工具與驗證方法 | [測試](./08-Testing/README.md) |
| 09 | [VS Code 整合](./09-VS-Code/README.md) | 配置 VS Code MCP 整合與 AI 聊天功能 | [整合](./09-VS-Code/README.md) |
| **模組 10-12：生產與最佳實踐** | | | |
| 10 | [部署策略](./10-Deployment/README.md) | Docker 部署、Azure Container Apps 與擴展考量 | [部署](./10-Deployment/README.md) |
| 11 | [監控與可觀察性](./11-Monitoring/README.md) | Application Insights、日誌記錄與效能監控 | [監控](./11-Monitoring/README.md) |
| 12 | [最佳實踐與優化](./12-Best-Practices/README.md) | 效能優化、安全加固與生產技巧 | [優化](./12-Best-Practices/README.md) |

### 💻 您將建立的內容

完成此學習路徑後，您將建立一個完整的 **Zava 零售分析 MCP 伺服器**，包括：

- **多表零售資料庫**，涵蓋客戶訂單、產品與庫存
- **Row Level Security**，實現基於商店的資料隔離
- **語義產品搜尋**，使用 Azure OpenAI 嵌入技術
- **VS Code AI 聊天整合**，支援自然語言查詢
- **生產就緒部署**，使用 Docker 與 Azure
- **全面監控**，透過 Application Insights 實現

## 🎯 學習前提

為了充分利用此學習路徑，您應具備以下技能：

- **程式設計經驗**：熟悉 Python（首選）或類似語言
- **資料庫知識**：基本了解 SQL 與關聯式資料庫
- **API 概念**：理解 REST API 與 HTTP 概念
- **開發工具**：熟悉命令列、Git 與程式編輯器
- **雲端基礎知識**：（選擇性）基本了解 Azure 或類似雲端平台
- **Docker 基礎**：（選擇性）理解容器化概念

### 所需工具

- **Docker Desktop** - 用於運行 PostgreSQL 和 MCP 伺服器
- **Azure CLI** - 用於雲端資源部署
- **VS Code** - 用於開發與 MCP 整合
- **Git** - 用於版本控制
- **Python 3.8+** - 用於 MCP 伺服器開發

## 📚 學習指南與資源

此學習路徑包含全面的資源，幫助您有效學習：

### 學習指南

每個模組包含：
- **清晰的學習目標** - 您將達成的目標
- **逐步指導** - 詳細的實作指南
- **程式碼範例** - 帶有解釋的工作範例
- **練習** - 實作練習機會
- **故障排除指南** - 常見問題與解決方案
- **額外資源** - 進一步閱讀與探索

### 前提檢查

在開始每個模組之前，您將看到：
- **所需知識** - 您應具備的基礎
- **設置驗證** - 如何驗證您的環境
- **時間估算** - 預期完成時間
- **學習成果** - 完成後您將掌握的內容

### 推薦學習路徑

根據您的經驗水平選擇學習路徑：

#### 🟢 **初學者路徑**（MCP 新手）
1. 首先完成 [MCP 初學者指南](https://aka.ms/mcp-for-beginners)
2. 完成模組 00-03，了解基礎
3. 跟進模組 04-06，進行實作
4. 嘗試模組 07-09，進行實際應用

#### 🟡 **中級路徑**（有 MCP 經驗）
1. 回顧模組 00-01，了解資料庫相關概念
2. 專注於模組 02-06，進行實作
3. 深入模組 07-12，探索進階功能

#### 🔴 **高級路徑**（熟悉 MCP）
1. 瀏覽模組 00-03，了解背景
2. 專注於模組 04-09，進行資料庫整合
3. 集中於模組 10-12，進行生產部署

## 🛠️ 如何有效使用此學習路徑

### 順序學習（推薦）

依次完成模組，全面掌握內容：

1. **閱讀概述** - 了解您將學習的內容
2. **檢查前提** - 確保具備所需知識
3. **遵循逐步指導** - 邊學邊實作
4. **完成練習** - 加強理解
5. **回顧重點** - 鞏固學習成果

### 目標導向學習

如果您需要特定技能：

- **資料庫整合**：專注於模組 04-06
- **安全性實作**：集中於模組 02、08、12
- **AI/語義搜尋**：深入模組 07
- **生產部署**：研究模組 10-12

### 實作練習

每個模組包含：
- **工作程式碼範例** - 複製、修改並實驗
- **真實案例** - 實際零售分析應用
- **漸進式複雜度** - 從簡單到進階
- **驗證步驟** - 確保您的實作有效

## 🌟 社群與支援

### 獲得幫助

- **Azure AI Discord**: [加入以獲得專家支援](https://discord.com/invite/ByRwuEEgH4)
- **GitHub 問題**: [回報問題或提出問題](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP 社群**: [加入更廣泛的 MCP 討論](https://github.com/orgs/modelcontextprotocol/discussions)

### 貢獻

我們歡迎您為此學習路徑做出貢獻：
- **修正錯誤或拼寫** - 提交 pull requests
- **新增範例** - 分享您的實作
- **改進文件** - 幫助其他人學習
- **回報問題** - 幫助我們解決問題

## 📜 授權資訊

此學習內容採用 MIT 授權。請參閱 [LICENSE](../../../LICENSE) 文件了解條款與條件。

## 🚀 準備開始了嗎？

從 **[模組 00：MCP 資料庫整合簡介](./00-Introduction/README.md)** 開始您的旅程吧！

---

*透過這份全面且實作導向的學習體驗，掌握建立生產就緒的 MCP 伺服器與資料庫整合的技能。*

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而產生的任何誤解或錯誤解釋不承擔責任。