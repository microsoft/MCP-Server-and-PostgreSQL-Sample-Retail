<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:27:43+00:00",
  "source_file": "azd/README.md",
  "language_code": "uk"
}
-->
# Azure Developer CLI (azd) Швидкий старт

## 🚀 Розгортання за допомогою Azure Developer CLI

Цей проєкт тепер повністю сумісний з Azure Developer CLI (azd) для автоматизованого розгортання як інфраструктури, так і серверного додатка MCP.

### Попередні вимоги

1. **Встановіть Azure Developer CLI**:
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

2. **Увійдіть до Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Розгортання однією командою

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

### 🔧 Робочий процес розробки

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

### 📦 Що розгортається

#### **Інфраструктура**
- Група ресурсів
- Робоча область Log Analytics  
- Application Insights
- Сервіси Azure AI (з моделями OpenAI)
- Середовище для контейнерних додатків

#### **Додаток**
- Сервер MCP (контейнерний додаток)
- Увімкнено моніторинг стану
- Налаштовані змінні середовища
- Інтеграція з Application Insights

### 🌍 Змінні середовища

Після розгортання ці змінні автоматично доступні:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Моніторинг та управління

- **Azure Portal**: Перегляд усіх ресурсів у вашій групі ресурсів
- **Application Insights**: Моніторинг продуктивності додатка та журналів
- **Container Apps**: Перегляд журналів та метрик додатка
- **AI Studio**: Управління розгортаннями моделей OpenAI

### 📋 Вирішення проблем

#### **Поширені проблеми**

1. **Розташування не підтримується**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Перевищено квоти ресурсів**:
   - Перевірте ліміти вашої підписки в Azure Portal
   - Спробуйте інший регіон

3. **Проблеми з автентифікацією**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Перегляд журналів розгортання**:
   ```bash
   azd show --output json
   ```

### 🔄 Альтернатива: Ручне розгортання

Якщо ви віддаєте перевагу ручному розгортанню, ви все ще можете використовувати інфраструктуру з папки `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Дізнайтеся більше

- [Документація Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Документація Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Документація Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.