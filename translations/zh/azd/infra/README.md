<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:21:32+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "zh"
}
-->
# 基础设施模板

此文件夹包含用于 MCP 零售分析项目的基础设施部署模板。

## 📁 文件概览

| 文件 | 描述 | 使用场景 |
|------|-------------|----------|
| `azuredeploy.json` | **ARM 模板** - 完整的订阅范围部署 | 推荐用于所有部署 |
| `azuredeploy.parameters.json` | **ARM 参数** - 静态配置值 | 与 `azuredeploy.json` 一起使用 |
| `ARM-DEPLOYMENT.md` | **ARM 部署指南** - 详细说明 | 完整的部署文档 |
| `README.md` | **此文件** - 基础设施概览 | 快速参考 |

## 🚀 部署选项

### 选项 1：Azure CLI（推荐）
完整部署并创建资源组：
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### 选项 2：PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### 选项 3：Azure Portal
1. 访问 [Azure Portal](https://portal.azure.com)
2. 搜索“部署自定义模板”
3. 上传 `azuredeploy.json`
4. 配置参数并部署

## 🏗️ 基础设施组件

ARM 模板将部署以下基础设施：

- **资源组**：包含所有资源并保持一致的命名
- **日志分析工作区**：集中日志记录和监控（30 天保留期）
- **应用程序洞察**：与日志分析集成的应用性能监控
- **Azure AI 服务**：多服务 AI 中心（S0 层）并带有托管身份
- **OpenAI 模型**：
  - `gpt-4o-mini`（120 容量）- 聊天和完成模型
  - `text-embedding-3-small`（50 容量）- 用于语义搜索的文本嵌入

## 🔧 模板配置

### 参数
ARM 模板接受以下可自定义参数：

| 参数 | 默认值 | 描述 |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | 所有资源名称的前缀 |
| `location` | `westus2` | 部署的 Azure 区域 |
| `uniqueSuffix` | 自动生成 | 4 个字符的唯一标识符 |
| `aiProjectFriendlyName` | `MCP 零售分析项目` | 显示名称 |
| `gptModelCapacity` | `120` | GPT 模型的令牌容量 |
| `embeddingModelCapacity` | `50` | 嵌入模型的容量 |

### 资源命名规范
所有资源遵循以下模式：`{type}-{resourcePrefix}-{uniqueSuffix}`

示例：
- 资源组：`rg-mcpretail-demo`
- AI 服务：`fdy-mcpretail-demo`
- 应用程序洞察：`appi-mcpretail-demo`

## 🔍 模板验证

### 部署前验证
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### 检查部署状态
```bash
az deployment sub list --output table
```


## 💰 成本估算

开发工作负载的月度成本估算：

| 服务 | 配置 | 估算成本/月 |
|---------|---------------|-----------------|
| Azure AI 服务 | S0 层 | $15-50 |
| OpenAI GPT-4o-mini | 120K 令牌 | $15-30 |
| OpenAI 嵌入 | 50K 令牌 | $5-15 |
| 应用程序洞察 | 基本监控 | $5-15 |
| 日志分析 | 1GB/月 | $2-5 |
| **总计** | | **$42-115** |

## 📚 其他资源

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - 包含故障排除的详细部署指南
- [ARM 模板文档](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI 服务文档](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - 文件验证结果

## 🆘 快速故障排除

### 常见问题
- **身份验证**：运行 `az login` 进行身份验证
- **配额限制**：检查目标区域的 OpenAI 模型可用性
- **命名冲突**：使用不同的 `uniqueSuffix` 参数
- **权限**：确保账户在订阅中具有“贡献者”角色

### 获取帮助
- 查看 [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) 以获取详细故障排除信息
- 在 Azure Portal 中检查部署日志
- 访问 [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

有关完整的项目设置，请参阅 [主 README](../../README.md) 或 [项目演练](../../walkthrough/README.md)。

---

**免责声明**：  
本文档使用AI翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 进行翻译。尽管我们努力确保翻译的准确性，但请注意，自动翻译可能包含错误或不准确之处。原始语言的文档应被视为权威来源。对于关键信息，建议使用专业人工翻译。我们不对因使用此翻译而产生的任何误解或误读承担责任。