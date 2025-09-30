<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:25:42+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "br"
}
-->
# Modelos de Infraestrutura

Esta pasta contém os modelos de implantação de infraestrutura para o projeto MCP Retail Analytics.

## 📁 Visão Geral dos Arquivos

| Arquivo | Descrição | Caso de Uso |
|---------|-----------|-------------|
| `azuredeploy.json` | **Modelo ARM** - Implantação completa no escopo da assinatura | Recomendado para todas as implantações |
| `azuredeploy.parameters.json` | **Parâmetros ARM** - Valores de configuração estáticos | Usado com `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Guia de implantação ARM** - Instruções detalhadas | Documentação completa de implantação |
| `README.md` | **Este arquivo** - Visão geral da infraestrutura | Referência rápida |

## 🚀 Opções de Implantação

### Opção 1: Azure CLI (Recomendado)
Implantação completa com criação de grupo de recursos:
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
1. Acesse o [Portal do Azure](https://portal.azure.com)
2. Pesquise por "Implantar um modelo personalizado"
3. Faça upload de `azuredeploy.json`
4. Configure os parâmetros e implante

## 🏗️ Componentes da Infraestrutura

O modelo ARM implanta a seguinte infraestrutura:

- **Grupo de Recursos**: Contêiner para todos os recursos com nomenclatura consistente
- **Workspace do Log Analytics**: Central de monitoramento e registro (retenção de 30 dias)
- **Application Insights**: Monitoramento de desempenho de aplicativos integrado ao Log Analytics
- **Serviços de IA do Azure**: Hub de IA com múltiplos serviços (camada S0) e identidade gerenciada
- **Modelos OpenAI**:
  - `gpt-4o-mini` (capacidade de 120) - Modelo de chat e conclusão
  - `text-embedding-3-small` (capacidade de 50) - Embeddings de texto para busca semântica

## 🔧 Configuração do Modelo

### Parâmetros
O modelo ARM aceita os seguintes parâmetros personalizáveis:

| Parâmetro | Padrão | Descrição |
|-----------|--------|-----------|
| `resourcePrefix` | `mcpretail` | Prefixo para todos os nomes de recursos |
| `location` | `westus2` | Região do Azure para implantação |
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

### Validar Antes da Implantação
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Verificar Status da Implantação
```bash
az deployment sub list --output table
```

## 💰 Estimativa de Custos

Custos mensais estimados para carga de trabalho de desenvolvimento:

| Serviço | Configuração | Custo Estimado/Mês |
|---------|--------------|--------------------|
| Serviços de IA do Azure | Camada S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| Embeddings OpenAI | 50K tokens | $5-15 |
| Application Insights | Monitoramento básico | $5-15 |
| Log Analytics | 1GB/mês | $2-5 |
| **Total** | | **$42-115** |

## 📚 Recursos Adicionais

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Guia detalhado de implantação com solução de problemas
- [Documentação de Modelos ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Documentação de Serviços de IA do Azure](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultados da validação de arquivos

## 🆘 Solução Rápida de Problemas

### Problemas Comuns
- **Autenticação**: Execute `az login` para autenticar
- **Limites de Cota**: Verifique a disponibilidade do modelo OpenAI na região de destino
- **Conflitos de Nomenclatura**: Use um parâmetro `uniqueSuffix` diferente
- **Permissões**: Certifique-se de que a conta possui a função de Contribuidor na assinatura

### Obter Ajuda
- Consulte [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) para solução de problemas detalhada
- Verifique os logs de implantação no Portal do Azure
- Visite [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Para a configuração completa do projeto, veja o [README principal](../../README.md) ou o [guia do projeto](../../walkthrough/README.md).

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.