<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:21:49+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "mo"
}
-->
# 基礎架構範本

此資料夾包含 MCP 零售分析專案的基礎架構部署範本。

## 📁 檔案概覽

| 檔案 | 描述 | 使用情境 |
|------|------|----------|
| `azuredeploy.json` | **ARM 範本** - 完整的訂閱範圍部署 | 建議用於所有部署 |
| `azuredeploy.parameters.json` | **ARM 參數** - 靜態配置值 | 與 `azuredeploy.json` 一起使用 |
| `ARM-DEPLOYMENT.md` | **ARM 部署指南** - 詳細指引 | 完整的部署文件 |
| `README.md` | **此檔案** - 基礎架構概述 | 快速參考 |

## 🚀 部署選項

### 選項 1：Azure CLI（推薦）
包含資源群組建立的完整部署：
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### 選項 2：PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### 選項 3：Azure Portal
1. 前往 [Azure Portal](https://portal.azure.com)
2. 搜尋「部署自訂範本」
3. 上傳 `azuredeploy.json`
4. 配置參數並部署

## 🏗️ 基礎架構元件

ARM 範本部署以下基礎架構：

- **資源群組**：包含所有資源，並具有一致的命名
- **Log Analytics Workspace**：集中式日誌記錄與監控（30 天保留期）
- **Application Insights**：應用程式效能監控，與 Log Analytics 整合
- **Azure AI Services**：多服務 AI 中心（S0 層級），具有受管理的身分識別
- **OpenAI 模型**：
  - `gpt-4o-mini`（120 容量）- 聊天與完成模型
  - `text-embedding-3-small`（50 容量）- 用於語義搜尋的文字嵌入

## 🔧 範本配置

### 參數
ARM 範本接受以下可自訂的參數：

| 參數 | 預設值 | 描述 |
|------|-------|------|
| `resourcePrefix` | `mcpretail` | 所有資源名稱的前綴 |
| `location` | `westus2` | 部署的 Azure 區域 |
| `uniqueSuffix` | 自動生成 | 4 字元的唯一識別碼 |
| `aiProjectFriendlyName` | `MCP 零售分析專案` | 顯示名稱 |
| `gptModelCapacity` | `120` | GPT 模型的 token 容量 |
| `embeddingModelCapacity` | `50` | 嵌入模型的容量 |

### 資源命名規範
所有資源遵循以下模式：`{type}-{resourcePrefix}-{uniqueSuffix}`

範例：
- 資源群組：`rg-mcpretail-demo`
- AI 服務：`fdy-mcpretail-demo`
- Application Insights：`appi-mcpretail-demo`

## 🔍 範本驗證

### 部署前驗證
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### 檢查部署狀態
```bash
az deployment sub list --output table
```


## 💰 成本估算

針對開發工作負載的每月估算成本：

| 服務 | 配置 | 每月估算成本 |
|------|------|-------------|
| Azure AI Services | S0 層級 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI 嵌入 | 50K tokens | $5-15 |
| Application Insights | 基本監控 | $5-15 |
| Log Analytics | 每月 1GB | $2-5 |
| **總計** | | **$42-115** |

## 📚 其他資源

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - 詳細部署指南與故障排除
- [ARM 範本文件](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services 文件](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - 檔案驗證結果

## 🆘 快速故障排除

### 常見問題
- **身份驗證**：執行 `az login` 進行身份驗證
- **配額限制**：檢查目標區域的 OpenAI 模型可用性
- **命名衝突**：使用不同的 `uniqueSuffix` 參數
- **權限**：確保帳戶具有訂閱的 Contributor 角色

### 尋求協助
- 查看 [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) 以獲取詳細故障排除指南
- 在 Azure Portal 中檢查部署日誌
- 訪問 [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

如需完整的專案設置，請參閱 [主 README](../../README.md) 或 [專案操作指南](../../walkthrough/README.md)。

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們努力確保翻譯的準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。