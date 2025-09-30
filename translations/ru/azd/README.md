<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:19:36+00:00",
  "source_file": "azd/README.md",
  "language_code": "ru"
}
-->
# Azure Developer CLI (azd) Быстрый старт

## 🚀 Развертывание с помощью Azure Developer CLI

Этот проект полностью совместим с Azure Developer CLI (azd) для автоматизированного развертывания как инфраструктуры, так и серверного приложения MCP.

### Предварительные требования

1. **Установите Azure Developer CLI**:
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

2. **Войдите в Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Развертывание одной командой

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

### 🔧 Рабочий процесс разработки

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

### 📦 Что будет развернуто

#### **Инфраструктура**
- Группа ресурсов
- Рабочая область Log Analytics  
- Application Insights
- Azure AI Services (с моделями OpenAI)
- Среда для контейнерных приложений

#### **Приложение**
- MCP Server (контейнерное приложение)
- Включен мониторинг состояния
- Настроены переменные окружения
- Интеграция с Application Insights

### 🌍 Переменные окружения

После развертывания эти переменные автоматически становятся доступными:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Мониторинг и управление

- **Azure Portal**: Просмотр всех ресурсов в вашей группе ресурсов
- **Application Insights**: Мониторинг производительности приложения и логов
- **Container Apps**: Просмотр логов и метрик приложения
- **AI Studio**: Управление развертываниями моделей OpenAI

### 📋 Устранение неполадок

#### **Распространенные проблемы**

1. **Местоположение не поддерживается**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Превышены квоты ресурсов**:
   - Проверьте лимиты вашей подписки в Azure Portal
   - Попробуйте выбрать другой регион

3. **Проблемы с аутентификацией**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Просмотр логов развертывания**:
   ```bash
   azd show --output json
   ```

### 🔄 Альтернатива: ручное развертывание

Если вы предпочитаете ручное развертывание, вы можете использовать инфраструктуру из папки `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Узнать больше

- [Документация Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Документация Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Документация Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.