<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:20:19+00:00",
  "source_file": "azd/README.md",
  "language_code": "zh"
}
-->
# Azure Developer CLI (azd) 快速入门

## 🚀 使用 Azure Developer CLI 部署

此项目现已完全兼容 Azure Developer CLI (azd)，可实现基础设施和 MCP 服务器应用的自动化部署。

### 前置条件

1. **安装 Azure Developer CLI**：
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

2. **登录 Azure**：
   ```bash
   az login
   azd auth login
   ```

### 🎯 一键部署

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

### 🔧 开发工作流

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

### 📦 部署内容

#### **基础设施**
- 资源组
- 日志分析工作区  
- 应用程序洞察
- Azure AI 服务（包含 OpenAI 模型）
- 容器应用环境

#### **应用程序**
- MCP 服务器（容器应用）
- 启用健康监控
- 配置环境变量
- 集成应用程序洞察

### 🌍 环境变量

部署完成后，这些变量会自动可用：

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 监控与管理

- **Azure 门户**：查看资源组中的所有资源
- **应用程序洞察**：监控应用性能和日志
- **容器应用**：查看应用日志和指标
- **AI Studio**：管理 OpenAI 模型部署

### 📋 故障排除

#### **常见问题**

1. **位置不支持**：
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **资源配额超限**：
   - 在 Azure 门户检查订阅限制
   - 尝试选择其他区域

3. **身份验证问题**：
   ```bash
   azd auth login --use-device-code
   ```

4. **查看部署日志**：
   ```bash
   azd show --output json
   ```

### 🔄 替代方案：手动部署

如果您更喜欢手动部署，可以使用 `/infra` 文件夹中的基础设施：

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 了解更多

- [Azure Developer CLI 文档](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [容器应用文档](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI 服务文档](https://docs.microsoft.com/azure/ai-services/)

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言版本的文档应被视为权威来源。对于重要信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。