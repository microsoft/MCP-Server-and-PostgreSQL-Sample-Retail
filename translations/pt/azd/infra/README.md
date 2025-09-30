<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:25:16+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "pt"
}
-->
# Modelos de Infraestrutura

Esta pasta contém os modelos de implementação de infraestrutura para o projeto MCP Retail Analytics.

## 📁 Visão Geral dos Ficheiros

| Ficheiro | Descrição | Caso de Uso |
|----------|-----------|-------------|
| `azuredeploy.json` | **Modelo ARM** - Implementação completa ao nível da subscrição | Recomendado para todas as implementações |
| `azuredeploy.parameters.json` | **Parâmetros ARM** - Valores de configuração estáticos | Usado com `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Guia de implementação ARM** - Instruções detalhadas | Documentação completa da implementação |
| `README.md` | **Este ficheiro** - Visão geral da infraestrutura | Referência rápida |

## 🚀 Opções de Implementação

### Opção 1: Azure CLI (Recomendado)
Implementação completa com criação de grupo de recursos:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opção 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opção 3: Portal do Azure
1. Aceda ao [Portal do Azure](https://portal.azure.com)
2. Pesquise por "Implementar um modelo personalizado"
3. Carregue o ficheiro `azuredeploy.json`
4. Configure os parâmetros e implemente

## 🏗️ Componentes da Infraestrutura

O modelo ARM implementa a seguinte infraestrutura:

- **Grupo de Recursos**: Contém todos os recursos com nomes consistentes
- **Log Analytics Workspace**: Central de registo e monitorização (retenção de 30 dias)
- **Application Insights**: Monitorização de desempenho de aplicações integrada com Log Analytics
- **Azure AI Services**: Hub de serviços de IA (nível S0) com identidade gerida
- **Modelos OpenAI**:
  - `gpt-4o-mini` (capacidade de 120) - Modelo de chat e conclusão
  - `text-embedding-3-small` (capacidade de 50) - Embeddings de texto para pesquisa semântica

## 🔧 Configuração do Modelo

### Parâmetros
O modelo ARM aceita os seguintes parâmetros personalizáveis:

| Parâmetro | Padrão | Descrição |
|-----------|--------|-----------|
| `resourcePrefix` | `mcpretail` | Prefixo para todos os nomes de recursos |
| `location` | `westus2` | Região do Azure para implementação |
| `uniqueSuffix` | Gerado automaticamente | Identificador único de 4 caracteres |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nome de exibição |
| `gptModelCapacity` | `120` | Capacidade de tokens do modelo GPT |
| `embeddingModelCapacity` | `50` | Capacidade de tokens do modelo de embeddings |

### Convenção de Nomenclatura de Recursos
Todos os recursos seguem o padrão: `{type}-{resourcePrefix}-{uniqueSuffix}`

Exemplos:
- Grupo de Recursos: `rg-mcpretail-demo`
- Serviço de IA: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validação do Modelo

### Validar Antes da Implementação
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Verificar o Estado da Implementação
```bash
az deployment sub list --output table
```

## 💰 Estimativa de Custos

Custos mensais estimados para carga de trabalho de desenvolvimento:

| Serviço | Configuração | Custo Estimado/Mês |
|---------|--------------|--------------------|
| Azure AI Services | Nível S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Monitorização básica | $5-15 |
| Log Analytics | 1GB/mês | $2-5 |
| **Total** | | **$42-115** |

## 📚 Recursos Adicionais

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Guia detalhado de implementação com resolução de problemas
- [Documentação do Modelo ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Documentação do Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultados da validação dos ficheiros

## 🆘 Resolução Rápida de Problemas

### Problemas Comuns
- **Autenticação**: Execute `az login` para autenticar
- **Limites de Quota**: Verifique a disponibilidade do modelo OpenAI na região alvo
- **Conflitos de Nomes**: Utilize um parâmetro `uniqueSuffix` diferente
- **Permissões**: Certifique-se de que a conta tem o papel de Contribuidor na subscrição

### Obter Ajuda
- Consulte [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) para resolução detalhada de problemas
- Verifique os registos de implementação no Portal do Azure
- Visite [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Para a configuração completa do projeto, consulte o [README principal](../../README.md) ou o [guia do projeto](../../walkthrough/README.md).

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.