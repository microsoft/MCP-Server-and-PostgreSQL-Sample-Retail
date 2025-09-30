<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:04:39+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "zh"
}
-->
# ARM 模板部署说明

本文档提供使用 ARM 模板部署 MCP 零售分析基础设施的说明。

## 📋 概述

`azuredeploy.json` ARM 模板提供以下完整部署：
- Azure 资源组
- Log Analytics 工作区  
- Application Insights
- Azure AI 服务 (Foundry)
- OpenAI 模型部署 (GPT-4o-mini, text-embedding-3-small)

## 🚀 部署选项

### 选项 1：使用 Azure CLI 部署

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

### 选项 2：使用 PowerShell 部署

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

### 选项 3：使用 Azure Portal

1. 进入 [Azure Portal](https://portal.azure.com)
2. 搜索“部署自定义模板”
3. 点击“在编辑器中构建自己的模板”
4. 复制并粘贴 `azuredeploy.json` 的内容
5. 点击“保存”，然后“审核 + 创建”
6. 填写所需参数并部署

## 🔧 模板参数

| 参数 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `resourcePrefix` | string | `mcpretail` | 资源名称的前缀 |
| `location` | string | `westus2` | 部署的 Azure 区域 |
| `uniqueSuffix` | string | 自动生成 | 4 个字符的唯一标识符 |
| `aiProjectFriendlyName` | string | `MCP 零售分析项目` | AI 项目的显示名称 |
| `aiProjectDescription` | string | 项目描述 | 在 Azure AI Foundry 中显示的描述 |
| `gptModelCapacity` | int | `120` | GPT 模型的令牌容量 |
| `embeddingModelCapacity` | int | `50` | 嵌入模型的令牌容量 |
| `tags` | object | 默认标签 | 用于治理的资源标签 |

## 📤 模板输出

模板提供以下输出：

| 输出 | 描述 |
|------|------|
| `subscriptionId` | Azure 订阅 ID |
| `resourceGroupName` | 创建的资源组名称 |
| `aiFoundryName` | Azure AI Foundry 服务名称 |
| `foundryEndpoint` | AI 服务端点 URL |
| `foundryAccountKey` | AI 服务访问密钥 |
| `deployedModels` | 部署的 OpenAI 模型数组 |
| `applicationInsightsConnectionString` | Application Insights 连接字符串 |
| `logAnalyticsWorkspaceName` | Log Analytics 工作区名称 |

## 🔍 验证命令

部署完成后，验证资源：

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

## 🆚 ARM 与 Bicep

此项目同时提供 ARM 和 Bicep 模板：

### ARM 模板 (`azuredeploy.json`)
- ✅ 原生 Azure Resource Manager 格式
- ✅ 在所有支持 ARM 的环境中工作
- ✅ 无需额外工具
- ❌ JSON 语法较冗长
- ❌ 难以阅读和维护

### Bicep 模板 (`main.bicep`)
- ✅ 现代化、简洁的语法
- ✅ 更好的工具支持和 IntelliSense
- ✅ 更易阅读和维护
- ✅ 编译时验证
- ❌ 需要 Bicep CLI
- ❌ 需要额外的构建步骤

**推荐**：开发时使用 Bicep 模板 (`main.bicep`)，需要纯 ARM JSON 时使用 ARM 模板 (`azuredeploy.json`)。

## 🔧 自定义

### 添加自定义资源

要向 ARM 模板添加额外资源：

1. 将资源定义添加到嵌套模板的 `resources` 数组中
2. 在 `parameters` 部分添加任何新参数
3. 如果需要，添加相应的输出
4. 更新参数文件以设置默认值

### 示例：添加存储账户

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

## 🐛 故障排除

### 常见问题

#### 1. 模板验证错误
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. 资源名称冲突
- 确保 `uniqueSuffix` 是真正唯一的
- 使用 `uniqueString()` 函数自动生成
- 检查目标区域中的现有资源

#### 3. 配额限制
- 验证目标区域中 OpenAI 模型的可用性
- 检查订阅的 AI 服务配额
- 如果达到限制，考虑使用其他区域

#### 4. 权限问题
- 确保账户在订阅中具有 Contributor 角色
- 检查订阅是否启用了 AI 服务
- 验证资源提供程序注册

### 调试命令

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

## 🔐 安全注意事项

### 访问控制
- AI 服务使用托管身份进行安全访问
- 资源组提供 RBAC 边界
- Application Insights 具有单独的访问控制

### 网络安全
- 默认启用公共网络访问
- 生产环境建议使用私有端点
- 可配置网络 ACL 以增强安全性

### 密钥管理
- AI 服务密钥自动生成
- 生产环境建议使用 Azure Key Vault 存储机密
- 定期轮换密钥以确保安全

## 📚 后续步骤

成功部署后：

1. **配置环境变量**：
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **启动 MCP 服务器**：
   ```bash
   cd .. && docker compose up -d
   ```

3. **测试集成**：
   - 使用项目打开 VS Code
   - 在 `.vscode/mcp.json` 中配置 MCP 服务器
   - 使用零售数据查询测试 AI 聊天功能

4. **监控性能**：
   - 在 Application Insights 中查看指标
   - 在 Log Analytics 工作区中检查日志
   - 设置重要事件的警报

---

更多信息请参阅 [主 README](../README.md) 或 [快速入门指南](../QUICKSTART.md)。

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。