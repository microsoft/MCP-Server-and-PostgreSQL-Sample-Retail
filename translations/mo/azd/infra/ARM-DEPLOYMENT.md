<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:04:56+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "mo"
}
-->
# ARM 模板部署指南

本文檔提供使用 ARM 模板部署 MCP 零售分析基礎架構的指導。

## 📋 概述

`azuredeploy.json` ARM 模板提供完整的部署，包括：
- Azure 資源群組
- Log Analytics 工作區  
- Application Insights
- Azure AI 服務 (Foundry)
- OpenAI 模型部署 (GPT-4o-mini, text-embedding-3-small)

## 🚀 部署選項

### 選項 1：使用 Azure CLI 部署

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### 選項 2：使用 PowerShell 部署

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### 選項 3：使用 Azure Portal

1. 前往 [Azure Portal](https://portal.azure.com)
2. 搜尋 "Deploy a custom template"
3. 點擊 "Build your own template in the editor"
4. 複製並貼上 `azuredeploy.json` 的內容
5. 點擊 "Save" 然後 "Review + create"
6. 填寫所需參數並部署

## 🔧 模板參數

| 參數 | 類型 | 預設值 | 描述 |
|------|------|--------|------|
| `resourcePrefix` | string | `mcpretail` | 資源名稱的前綴 |
| `location` | string | `westus2` | 部署的 Azure 地區 |
| `uniqueSuffix` | string | 自動生成 | 4 字元的唯一識別碼 |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI 項目的顯示名稱 |
| `aiProjectDescription` | string | 項目描述 | 在 Azure AI Foundry 中顯示的描述 |
| `gptModelCapacity` | int | `120` | GPT 模型的 Token 容量 |
| `embeddingModelCapacity` | int | `50` | 嵌入模型的 Token 容量 |
| `tags` | object | 預設標籤 | 用於治理的資源標籤 |

## 📤 模板輸出

模板提供以下輸出：

| 輸出 | 描述 |
|------|------|
| `subscriptionId` | Azure 訂閱 ID |
| `resourceGroupName` | 創建的資源群組名稱 |
| `aiFoundryName` | Azure AI Foundry 服務名稱 |
| `foundryEndpoint` | AI 服務端點 URL |
| `foundryAccountKey` | AI 服務訪問密鑰 |
| `deployedModels` | 部署的 OpenAI 模型陣列 |
| `applicationInsightsConnectionString` | Application Insights 連接字串 |
| `logAnalyticsWorkspaceName` | Log Analytics 工作區名稱 |

## 🔍 驗證命令

部署完成後，驗證資源：

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM 與 Bicep

此項目提供 ARM 和 Bicep 模板：

### ARM 模板 (`azuredeploy.json`)
- ✅ 原生 Azure Resource Manager 格式
- ✅ 在所有支持 ARM 的地方均可使用
- ✅ 不需要額外工具
- ❌ JSON 語法較冗長
- ❌ 閱讀和維護較困難

### Bicep 模板 (`main.bicep`)
- ✅ 現代化、簡潔的語法
- ✅ 更好的工具支持和 IntelliSense
- ✅ 更易於閱讀和維護
- ✅ 編譯時驗證
- ❌ 需要 Bicep CLI
- ❌ 需要額外的編譯步驟

**建議**：開發時使用 Bicep 模板 (`main.bicep`)，需要純 ARM JSON 時使用 ARM 模板 (`azuredeploy.json`)。

## 🔧 自訂化

### 添加自訂資源

要向 ARM 模板添加額外資源：

1. 將資源定義添加到嵌套模板的 `resources` 陣列中
2. 在 `parameters` 部分添加任何新參數
3. 如果需要，添加相應的輸出
4. 更新參數文件並設置預設值

### 範例：添加儲存帳戶

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 疑難排解

### 常見問題

#### 1. 模板驗證錯誤
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. 資源名稱衝突
- 確保 `uniqueSuffix` 是真正唯一的
- 使用 `uniqueString()` 函數自動生成
- 檢查目標地區的現有資源

#### 3. 配額限制
- 驗證目標地區的 OpenAI 模型可用性
- 檢查訂閱的 AI 服務配額
- 如果達到限制，考慮使用其他地區

#### 4. 權限問題
- 確保帳戶在訂閱中具有 Contributor 角色
- 檢查訂閱是否啟用了 AI 服務
- 驗證資源提供者是否已註冊

### 調試命令

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 安全考量

### 訪問控制
- AI 服務使用受管身份進行安全訪問
- 資源群組提供 RBAC 邊界
- Application Insights 有單獨的訪問控制

### 網絡安全
- 預設啟用公共網絡訪問
- 考慮在生產環境中使用私有端點
- 可配置網絡 ACL 以增強安全性

### 密鑰管理
- AI 服務密鑰自動生成
- 使用 Azure Key Vault 存儲生產環境的密鑰
- 定期輪換密鑰以提高安全性

## 📚 下一步

成功部署後：

1. **配置環境變數**：
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **啟動 MCP 伺服器**：
   ```bash
   cd .. && docker compose up -d
   ```

3. **測試集成**：
   - 使用 VS Code 打開項目
   - 在 `.vscode/mcp.json` 中配置 MCP 伺服器
   - 測試 AI 聊天功能，進行零售數據查詢

4. **監控性能**：
   - 在 Application Insights 中查看指標
   - 在 Log Analytics 工作區中檢查日誌
   - 為重要事件設置警報

---

欲了解更多信息，請參閱 [主 README](../README.md) 或 [快速入門指南](../QUICKSTART.md)。

---

**免責聲明**：  
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。應以原始語言的文件作為權威來源。對於關鍵資訊，建議尋求專業人工翻譯。我們對因使用本翻譯而引起的任何誤解或誤釋不承擔責任。