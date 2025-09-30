<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:22:47+00:00",
  "source_file": "azd/README.md",
  "language_code": "br"
}
-->
# Azure Developer CLI (azd) Introdução Rápida

## 🚀 Implantação com Azure Developer CLI

Este projeto agora é totalmente compatível com o Azure Developer CLI (azd) para implantação automatizada tanto da infraestrutura quanto do aplicativo do servidor MCP.

### Pré-requisitos

1. **Instale o Azure Developer CLI**:
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

2. **Faça login no Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Implantação com um único comando

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

### 🔧 Fluxo de Trabalho de Desenvolvimento

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

### 📦 O que é implantado

#### **Infraestrutura**
- Grupo de Recursos
- Workspace do Log Analytics  
- Application Insights
- Serviços de IA do Azure (com modelos OpenAI)
- Ambiente de Aplicativos em Contêiner

#### **Aplicativo**
- Servidor MCP (Aplicativo em Contêiner)
- Monitoramento de saúde habilitado
- Variáveis de ambiente configuradas
- Integração com Application Insights

### 🌍 Variáveis de Ambiente

Após a implantação, estas variáveis estarão automaticamente disponíveis:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitoramento e Gerenciamento

- **Portal do Azure**: Visualize todos os recursos no seu grupo de recursos
- **Application Insights**: Monitore o desempenho e os logs do aplicativo
- **Aplicativos em Contêiner**: Visualize os logs e métricas do aplicativo
- **AI Studio**: Gerencie as implantações de modelos OpenAI

### 📋 Solução de Problemas

#### **Problemas Comuns**

1. **Localização não suportada**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Cotas de recursos excedidas**:
   - Verifique os limites da sua assinatura no Portal do Azure
   - Experimente uma região diferente

3. **Problemas de autenticação**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Visualizar logs de implantação**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Implantação Manual

Se preferir uma implantação manual, você ainda pode usar a infraestrutura na pasta `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Saiba Mais

- [Documentação do Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação de Aplicativos em Contêiner](https://docs.microsoft.com/azure/container-apps/)
- [Documentação de Serviços de IA do Azure](https://docs.microsoft.com/azure/ai-services/)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.