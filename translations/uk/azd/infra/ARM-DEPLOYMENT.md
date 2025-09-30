<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:18:25+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "uk"
}
-->
# Інструкції з розгортання ARM-шаблону

Цей документ містить інструкції щодо розгортання інфраструктури MCP Retail Analytics за допомогою ARM-шаблону.

## 📋 Огляд

ARM-шаблон `azuredeploy.json` забезпечує повне розгортання:
- Групи ресурсів Azure
- Робочої області Log Analytics  
- Application Insights
- Сервісів Azure AI (Foundry)
- Розгортання моделей OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Варіанти розгортання

### Варіант 1: Розгортання через Azure CLI

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

### Варіант 2: Розгортання через PowerShell

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

### Варіант 3: Azure Portal

1. Перейдіть до [Azure Portal](https://portal.azure.com)
2. Знайдіть "Deploy a custom template"
3. Натисніть "Build your own template in the editor"
4. Скопіюйте та вставте вміст `azuredeploy.json`
5. Натисніть "Save", а потім "Review + create"
6. Заповніть необхідні параметри та розгорніть шаблон

## 🔧 Параметри шаблону

| Параметр | Тип | Значення за замовчуванням | Опис |
|----------|-----|---------------------------|------|
| `resourcePrefix` | рядок | `mcpretail` | Префікс для назв ресурсів |
| `location` | рядок | `westus2` | Регіон Azure для розгортання |
| `uniqueSuffix` | рядок | Автоматично генерується | Унікальний ідентифікатор з 4 символів |
| `aiProjectFriendlyName` | рядок | `MCP Retail Analytics Project` | Назва проекту для відображення |
| `aiProjectDescription` | рядок | Опис проекту | Опис, що відображається в Azure AI Foundry |
| `gptModelCapacity` | ціле число | `120` | Ємність токенів для моделі GPT |
| `embeddingModelCapacity` | ціле число | `50` | Ємність токенів для моделі embedding |
| `tags` | об'єкт | Теги за замовчуванням | Теги ресурсів для управління |

## 📤 Вихідні дані шаблону

Шаблон надає наступні вихідні дані:

| Вихідні дані | Опис |
|--------------|------|
| `subscriptionId` | Ідентифікатор підписки Azure |
| `resourceGroupName` | Назва створеної групи ресурсів |
| `aiFoundryName` | Назва сервісу Azure AI Foundry |
| `foundryEndpoint` | URL кінцевої точки сервісу AI |
| `foundryAccountKey` | Ключ доступу до сервісу AI |
| `deployedModels` | Масив розгорнутих моделей OpenAI |
| `applicationInsightsConnectionString` | Рядок підключення Application Insights |
| `logAnalyticsWorkspaceName` | Назва робочої області Log Analytics |

## 🔍 Команди перевірки

Після розгортання перевірте ресурси:

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

Цей проект надає як ARM, так і Bicep шаблони:

### ARM-шаблон (`azuredeploy.json`)
- ✅ Рідний формат Azure Resource Manager
- ✅ Працює скрізь, де підтримується ARM
- ✅ Не потребує додаткових інструментів
- ❌ Більш громіздкий синтаксис JSON
- ❌ Складніше читати та підтримувати

### Bicep-шаблон (`main.bicep`)
- ✅ Сучасний, чистий синтаксис
- ✅ Кращі інструменти та IntelliSense
- ✅ Легше читати та підтримувати
- ✅ Перевірка на етапі компіляції
- ❌ Потребує Bicep CLI
- ❌ Додатковий етап збірки

**Рекомендація**: Використовуйте Bicep-шаблони (`main.bicep`) для розробки, а ARM-шаблон (`azuredeploy.json`) для сценаріїв, що потребують чистого JSON ARM.

## 🔧 Налаштування

### Додавання власних ресурсів

Щоб додати додаткові ресурси до ARM-шаблону:

1. Додайте визначення ресурсу до масиву `resources` у вкладеному шаблоні
2. Додайте нові параметри до секції `parameters`
3. Додайте відповідні вихідні дані, якщо потрібно
4. Оновіть файл параметрів значеннями за замовчуванням

### Приклад: Додавання облікового запису сховища

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

## 🐛 Виправлення помилок

### Поширені проблеми

#### 1. Помилки перевірки шаблону
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Конфлікти назв ресурсів
- Переконайтеся, що `uniqueSuffix` є дійсно унікальним
- Використовуйте функцію `uniqueString()` для автоматичної генерації
- Перевірте існуючі ресурси в цільовому регіоні

#### 3. Ліміти квот
- Перевірте доступність моделей OpenAI у цільовому регіоні
- Перевірте квоти підписки для сервісів AI
- Розгляньте використання інших регіонів, якщо ліміти досягнуті

#### 4. Проблеми з дозволами
- Переконайтеся, що обліковий запис має роль Contributor у підписці
- Перевірте, чи підписка активована для сервісів AI
- Переконайтеся, що реєстрація постачальників ресурсів виконана

### Команди для налагодження

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

## 🔐 Міркування щодо безпеки

### Контроль доступу
- Сервіс AI використовує керовану ідентичність для безпечного доступу
- Група ресурсів забезпечує межі для RBAC
- Application Insights має окремі засоби контролю доступу

### Мережна безпека
- Доступ до публічної мережі увімкнено за замовчуванням
- Розгляньте приватні кінцеві точки для продакшну
- Мережеві ACL можуть бути налаштовані для додаткової безпеки

### Управління ключами
- Ключі сервісу AI генеруються автоматично
- Використовуйте Azure Key Vault для секретів у продакшні
- Регулярно змінюйте ключі для забезпечення безпеки

## 📚 Наступні кроки

Після успішного розгортання:

1. **Налаштуйте змінні середовища**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Запустіть сервер MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Перевірте інтеграцію**:
   - Відкрийте VS Code з проектом
   - Налаштуйте сервери MCP у файлі `.vscode/mcp.json`
   - Перевірте AI Chat із запитами до даних роздрібної торгівлі

4. **Моніторинг продуктивності**:
   - Переглядайте метрики в Application Insights
   - Перевіряйте журнали в робочій області Log Analytics
   - Налаштуйте сповіщення для важливих подій

---

Для отримання додаткової інформації дивіться [основний README](../README.md) або [QUICKSTART guide](../QUICKSTART.md).

---

**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.