<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:08:31+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "pt"
}
-->
# Instruções de Implementação do Template ARM

Este documento fornece instruções para implementar a infraestrutura do MCP Retail Analytics utilizando o template ARM.

## 📋 Visão Geral

O template ARM `azuredeploy.json` realiza a implementação completa de:
- Grupo de Recursos do Azure
- Workspace do Log Analytics  
- Application Insights
- Serviços de IA do Azure (Foundry)
- Implementações de Modelos OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opções de Implementação

### Opção 1: Implementação via Azure CLI

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

### Opção 2: Implementação via PowerShell

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

### Opção 3: Portal do Azure

1. Acesse o [Portal do Azure](https://portal.azure.com)
2. Pesquise por "Implementar um template personalizado"
3. Clique em "Criar o seu próprio template no editor"
4. Copie e cole o conteúdo do `azuredeploy.json`
5. Clique em "Guardar" e depois em "Rever + criar"
6. Preencha os parâmetros necessários e implemente

## 🔧 Parâmetros do Template

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefixo para os nomes dos recursos |
| `location` | string | `westus2` | Região do Azure para implementação |
| `uniqueSuffix` | string | Gerado automaticamente | Identificador único de 4 caracteres |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nome de exibição para o projeto de IA |
| `aiProjectDescription` | string | Descrição do projeto | Descrição exibida no Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Capacidade de tokens para o modelo GPT |
| `embeddingModelCapacity` | int | `50` | Capacidade de tokens para o modelo de embedding |
| `tags` | object | Tags padrão | Tags de recursos para governança |

## 📤 Saídas do Template

O template fornece as seguintes saídas:

| Saída | Descrição |
|-------|-----------|
| `subscriptionId` | ID da subscrição do Azure |
| `resourceGroupName` | Nome do grupo de recursos criado |
| `aiFoundryName` | Nome do serviço Azure AI Foundry |
| `foundryEndpoint` | URL do endpoint do serviço de IA |
| `foundryAccountKey` | Chave de acesso ao serviço de IA |
| `deployedModels` | Array de modelos OpenAI implementados |
| `applicationInsightsConnectionString` | String de conexão do Application Insights |
| `logAnalyticsWorkspaceName` | Nome do workspace do Log Analytics |

## 🔍 Comandos de Verificação

Após a implementação, verifique os recursos:

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

## 🆚 ARM vs Bicep

Este projeto fornece templates tanto em ARM quanto em Bicep:

### Template ARM (`azuredeploy.json`)
- ✅ Formato nativo do Azure Resource Manager
- ✅ Funciona em qualquer lugar onde o ARM é suportado
- ✅ Não requer ferramentas adicionais
- ❌ Sintaxe JSON mais verbosa
- ❌ Mais difícil de ler e manter

### Template Bicep (`main.bicep`)
- ✅ Sintaxe moderna e limpa
- ✅ Melhor suporte a ferramentas e IntelliSense
- ✅ Mais fácil de ler e manter
- ✅ Validação em tempo de compilação
- ❌ Requer CLI do Bicep
- ❌ Passo adicional de compilação

**Recomendação**: Utilize templates Bicep (`main.bicep`) para desenvolvimento e o template ARM (`azuredeploy.json`) para cenários que exijam JSON puro do ARM.

## 🔧 Personalização

### Adicionar Recursos Personalizados

Para adicionar recursos adicionais ao template ARM:

1. Adicione a definição do recurso ao array `resources` do template aninhado
2. Adicione quaisquer novos parâmetros à seção `parameters`
3. Adicione saídas correspondentes, se necessário
4. Atualize o ficheiro de parâmetros com valores padrão

### Exemplo: Adicionar Conta de Armazenamento

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

## 🐛 Resolução de Problemas

### Problemas Comuns

#### 1. Erros de Validação do Template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Conflitos de Nome de Recursos
- Certifique-se de que `uniqueSuffix` é realmente único
- Utilize a função `uniqueString()` para geração automática
- Verifique os recursos existentes na região de destino

#### 3. Limites de Quota
- Verifique a disponibilidade do modelo OpenAI na região de destino
- Confirme as quotas da subscrição para serviços de IA
- Considere utilizar outras regiões se os limites forem atingidos

#### 4. Problemas de Permissão
- Certifique-se de que a conta tem o papel de Contribuidor na subscrição
- Verifique se a subscrição está habilitada para serviços de IA
- Confirme os registos dos provedores de recursos

### Comandos de Depuração

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

## 🔐 Considerações de Segurança

### Controlo de Acesso
- O serviço de IA utiliza identidade gerida para acesso seguro
- O grupo de recursos fornece um limite para RBAC
- O Application Insights possui controlos de acesso separados

### Segurança de Rede
- O acesso à rede pública está ativado por padrão
- Considere endpoints privados para produção
- ACLs de rede podem ser configuradas para segurança adicional

### Gestão de Chaves
- As chaves do serviço de IA são geradas automaticamente
- Utilize o Azure Key Vault para segredos em produção
- Rode as chaves regularmente para maior segurança

## 📚 Próximos Passos

Após a implementação bem-sucedida:

1. **Configurar Variáveis de Ambiente**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Iniciar o Servidor MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Testar Integração**:
   - Abra o VS Code com o projeto
   - Configure os servidores MCP no ficheiro `.vscode/mcp.json`
   - Teste o Chat de IA com consultas de dados de retalho

4. **Monitorizar Desempenho**:
   - Veja métricas no Application Insights
   - Verifique os logs no workspace do Log Analytics
   - Configure alertas para eventos importantes

---

Para mais informações, consulte o [README principal](../README.md) ou o [guia QUICKSTART](../QUICKSTART.md).

---

**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.