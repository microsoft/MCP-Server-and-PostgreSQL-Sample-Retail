<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:20:40+00:00",
  "source_file": "azd/README.md",
  "language_code": "hk"
}
-->
# Azure Developer CLI (azd) 快速入門

## 🚀 使用 Azure Developer CLI 部署

此專案現已完全兼容 Azure Developer CLI (azd)，可自動部署基礎設施及 MCP 伺服器應用程式。

### 先決條件

1. **安裝 Azure Developer CLI**：
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **登入 Azure**：
   ```bash
   az login
   azd auth login
   ```

### 🎯 一鍵部署

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 開發工作流程

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 部署內容

#### **基礎設施**
- 資源群組
- Log Analytics 工作區  
- Application Insights
- Azure AI 服務（包含 OpenAI 模型）
- 容器應用環境

#### **應用程式**
- MCP 伺服器（容器應用）
- 啟用健康監控
- 環境變數已配置
- 集成 Application Insights

### 🌍 環境變數

部署完成後，以下變數將自動可用：

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 監控與管理

- **Azure Portal**：查看資源群組中的所有資源
- **Application Insights**：監控應用程式效能及日誌
- **Container Apps**：查看應用程式日誌及指標
- **AI Studio**：管理 OpenAI 模型部署

### 📋 疑難排解

#### **常見問題**

1. **位置不支援**：
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **資源配額超出**：
   - 在 Azure Portal 中檢查您的訂閱限制
   - 嘗試使用其他地區

3. **身份驗證問題**：
   ```bash
   azd auth login --use-device-code
   ```

4. **查看部署日誌**：
   ```bash
   azd show --output json
   ```

### 🔄 替代方案：手動部署

如果您偏好手動部署，仍可使用 `/infra` 資料夾中的基礎設施：

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 了解更多

- [Azure Developer CLI 文件](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [容器應用文件](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI 服務文件](https://docs.microsoft.com/azure/ai-services/)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋概不負責。