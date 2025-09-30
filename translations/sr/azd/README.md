<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:26:49+00:00",
  "source_file": "azd/README.md",
  "language_code": "sr"
}
-->
# Azure Developer CLI (azd) Брзи почетак

## 🚀 Деплој са Azure Developer CLI

Овај пројекат је сада у потпуности компатибилан са Azure Developer CLI (azd) за аутоматизовани деплој инфраструктуре и MCP сервер апликације.

### Предуслови

1. **Инсталирајте Azure Developer CLI**:
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

2. **Пријавите се на Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Деплој у једној команди

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

### 🔧 Радни ток развоја

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

### 📦 Шта се деплојује

#### **Инфраструктура**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (са OpenAI моделима)
- Container App Environment

#### **Апликација**
- MCP сервер (Container App)
- Омогућено праћење здравља
- Конфигурисане променљиве окружења
- Интеграција са Application Insights

### 🌍 Променљиве окружења

Након деплоја, ове променљиве су аутоматски доступне:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Праћење и управљање

- **Azure Portal**: Прегледајте све ресурсе у вашем resource group-у
- **Application Insights**: Пратите перформансе апликације и логове
- **Container Apps**: Прегледајте логове и метрике апликације
- **AI Studio**: Управљајте деплојментима OpenAI модела

### 📋 Решавање проблема

#### **Чести проблеми**

1. **Локација није подржана**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Прекорачене квоте ресурса**:
   - Проверите лимите ваше претплате у Azure Portal-у
   - Покушајте са другом регијом

3. **Проблеми са аутентификацијом**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Прегледајте логове деплоја**:
   ```bash
   azd show --output json
   ```

### 🔄 Алтернатива: Ручни деплој

Ако више волите ручни деплој, и даље можете користити инфраструктуру у фолдеру `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Сазнајте више

- [Azure Developer CLI документација](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps документација](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services документација](https://docs.microsoft.com/azure/ai-services/)

---

**Одрицање од одговорности**:  
Овај документ је преведен помоћу услуге за превођење вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.