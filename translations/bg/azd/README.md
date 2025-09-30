<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:26:37+00:00",
  "source_file": "azd/README.md",
  "language_code": "bg"
}
-->
# Бърз старт с Azure Developer CLI (azd)

## 🚀 Деплой с Azure Developer CLI

Този проект вече е напълно съвместим с Azure Developer CLI (azd) за автоматизирано разгръщане както на инфраструктурата, така и на приложението MCP сървър.

### Предварителни изисквания

1. **Инсталирайте Azure Developer CLI**:
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

2. **Влезте в Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Деплой с една команда

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

### 🔧 Работен процес за разработка

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

### 📦 Какво се разгръща

#### **Инфраструктура**
- Resource Group (група ресурси)
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (с OpenAI модели)
- Container App Environment (среда за контейнерни приложения)

#### **Приложение**
- MCP сървър (Container App)
- Активиран мониторинг на здравословното състояние
- Конфигурирани променливи на средата
- Интеграция с Application Insights

### 🌍 Променливи на средата

След разгръщането, тези променливи ще бъдат автоматично налични:

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

- **Azure Portal**: Преглеждайте всички ресурси във вашата група ресурси
- **Application Insights**: Наблюдавайте производителността и логовете на приложението
- **Container Apps**: Преглеждайте логове и метрики на приложението
- **AI Studio**: Управлявайте разгръщанията на OpenAI модели

### 📋 Отстраняване на проблеми

#### **Чести проблеми**

1. **Местоположението не се поддържа**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Превишени квоти за ресурси**:
   - Проверете лимитите на вашия абонамент в Azure Portal
   - Опитайте с друг регион

3. **Проблеми с автентикацията**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Преглед на логове от разгръщането**:
   ```bash
   azd show --output json
   ```

### 🔄 Алтернатива: Ръчно разгръщане

Ако предпочитате ръчно разгръщане, можете да използвате инфраструктурата в папката `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Научете повече

- [Документация за Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Документация за Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Документация за Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.