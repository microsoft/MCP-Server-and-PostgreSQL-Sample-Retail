<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:22:38+00:00",
  "source_file": "azd/README.md",
  "language_code": "pt"
}
-->
# Azure Developer CLI (azd) Guia Rápido

## 🚀 Implementar com Azure Developer CLI

Este projeto é agora totalmente compatível com o Azure Developer CLI (azd) para a implementação automatizada tanto da infraestrutura como da aplicação do servidor MCP.

### Pré-requisitos

1. **Instalar o Azure Developer CLI**:
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

2. **Iniciar sessão no Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Implementação com um único comando

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

### 📦 O que é Implementado

#### **Infraestrutura**
- Grupo de Recursos
- Espaço de Trabalho do Log Analytics  
- Application Insights
- Serviços de IA do Azure (com modelos OpenAI)
- Ambiente de Aplicações em Contêiner

#### **Aplicação**
- Servidor MCP (Aplicação em Contêiner)
- Monitorização de saúde ativada
- Variáveis de ambiente configuradas
- Integração com Application Insights

### 🌍 Variáveis de Ambiente

Após a implementação, estas variáveis estarão automaticamente disponíveis:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitorização e Gestão

- **Portal do Azure**: Visualizar todos os recursos no seu grupo de recursos
- **Application Insights**: Monitorizar o desempenho e os registos da aplicação
- **Aplicações em Contêiner**: Visualizar registos e métricas da aplicação
- **AI Studio**: Gerir implementações de modelos OpenAI

### 📋 Resolução de Problemas

#### **Problemas Comuns**

1. **Localização não suportada**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Limites de recursos excedidos**:
   - Verifique os limites da sua subscrição no Portal do Azure
   - Experimente uma região diferente

3. **Problemas de autenticação**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Visualizar registos de implementação**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Implementação Manual

Se preferir uma implementação manual, ainda pode utilizar a infraestrutura na pasta `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Saiba Mais

- [Documentação do Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentação de Aplicações em Contêiner](https://docs.microsoft.com/azure/container-apps/)
- [Documentação dos Serviços de IA do Azure](https://docs.microsoft.com/azure/ai-services/)

---

**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.