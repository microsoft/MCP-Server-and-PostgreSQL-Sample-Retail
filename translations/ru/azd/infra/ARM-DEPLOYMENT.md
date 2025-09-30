<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:03:12+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ru"
}
-->
# Инструкции по развертыванию ARM-шаблона

Этот документ содержит инструкции по развертыванию инфраструктуры MCP Retail Analytics с использованием ARM-шаблона.

## 📋 Обзор

ARM-шаблон `azuredeploy.json` обеспечивает полное развертывание:
- Группы ресурсов Azure
- Рабочей области Log Analytics  
- Application Insights
- Сервисов Azure AI (Foundry)
- Развертываний моделей OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Варианты развертывания

### Вариант 1: Развертывание через Azure CLI

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

### Вариант 2: Развертывание через PowerShell

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

### Вариант 3: Azure Portal

1. Перейдите в [Azure Portal](https://portal.azure.com)
2. Найдите "Deploy a custom template"
3. Нажмите "Build your own template in the editor"
4. Скопируйте и вставьте содержимое файла `azuredeploy.json`
5. Нажмите "Save", затем "Review + create"
6. Заполните необходимые параметры и выполните развертывание

## 🔧 Параметры шаблона

| Параметр | Тип | Значение по умолчанию | Описание |
|----------|------|-----------------------|----------|
| `resourcePrefix` | строка | `mcpretail` | Префикс для имен ресурсов |
| `location` | строка | `westus2` | Регион Azure для развертывания |
| `uniqueSuffix` | строка | Автогенерация | Уникальный идентификатор из 4 символов |
| `aiProjectFriendlyName` | строка | `MCP Retail Analytics Project` | Отображаемое имя проекта AI |
| `aiProjectDescription` | строка | Описание проекта | Описание, отображаемое в Azure AI Foundry |
| `gptModelCapacity` | целое число | `120` | Емкость токенов для модели GPT |
| `embeddingModelCapacity` | целое число | `50` | Емкость токенов для модели embedding |
| `tags` | объект | Теги по умолчанию | Теги ресурсов для управления |

## 📤 Выходные данные шаблона

Шаблон предоставляет следующие выходные данные:

| Выходные данные | Описание |
|------------------|----------|
| `subscriptionId` | Идентификатор подписки Azure |
| `resourceGroupName` | Имя созданной группы ресурсов |
| `aiFoundryName` | Имя сервиса Azure AI Foundry |
| `foundryEndpoint` | URL конечной точки сервиса AI |
| `foundryAccountKey` | Ключ доступа к сервису AI |
| `deployedModels` | Массив развернутых моделей OpenAI |
| `applicationInsightsConnectionString` | Строка подключения Application Insights |
| `logAnalyticsWorkspaceName` | Имя рабочей области Log Analytics |

## 🔍 Команды проверки

После развертывания проверьте ресурсы:

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

В этом проекте предоставляются как ARM, так и Bicep шаблоны:

### ARM-шаблон (`azuredeploy.json`)
- ✅ Нативный формат Azure Resource Manager
- ✅ Работает везде, где поддерживается ARM
- ✅ Не требует дополнительных инструментов
- ❌ Более громоздкий синтаксис JSON
- ❌ Сложнее читать и поддерживать

### Bicep-шаблон (`main.bicep`)
- ✅ Современный, чистый синтаксис
- ✅ Улучшенные инструменты и IntelliSense
- ✅ Легче читать и поддерживать
- ✅ Проверка на этапе компиляции
- ❌ Требует Bicep CLI
- ❌ Дополнительный этап сборки

**Рекомендация**: Используйте Bicep-шаблоны (`main.bicep`) для разработки и ARM-шаблон (`azuredeploy.json`) для сценариев, требующих чистого JSON ARM.

## 🔧 Настройка

### Добавление пользовательских ресурсов

Чтобы добавить дополнительные ресурсы в ARM-шаблон:

1. Добавьте определение ресурса в массив `resources` вложенного шаблона
2. Добавьте новые параметры в раздел `parameters`
3. При необходимости добавьте соответствующие выходные данные
4. Обновите файл параметров с значениями по умолчанию

### Пример: Добавление учетной записи хранения

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

## 🐛 Устранение неполадок

### Распространенные проблемы

#### 1. Ошибки проверки шаблона
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Конфликты имен ресурсов
- Убедитесь, что `uniqueSuffix` действительно уникален
- Используйте функцию `uniqueString()` для автоматической генерации
- Проверьте существующие ресурсы в целевом регионе

#### 3. Ограничения квот
- Проверьте доступность моделей OpenAI в целевом регионе
- Проверьте квоты подписки для AI-сервисов
- Рассмотрите возможность использования других регионов, если квоты исчерпаны

#### 4. Проблемы с разрешениями
- Убедитесь, что учетная запись имеет роль Contributor в подписке
- Проверьте, что подписка активирована для AI-сервисов
- Убедитесь, что провайдеры ресурсов зарегистрированы

### Команды отладки

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

## 🔐 Соображения безопасности

### Управление доступом
- Сервис AI использует управляемую идентичность для безопасного доступа
- Группа ресурсов обеспечивает границы для RBAC
- Application Insights имеет отдельные элементы управления доступом

### Сетевые настройки безопасности
- Доступ к публичной сети включен по умолчанию
- Рассмотрите использование частных конечных точек для продакшена
- Сетевые ACL могут быть настроены для дополнительной безопасности

### Управление ключами
- Ключи сервиса AI генерируются автоматически
- Используйте Azure Key Vault для секретов в продакшене
- Регулярно обновляйте ключи для обеспечения безопасности

## 📚 Следующие шаги

После успешного развертывания:

1. **Настройте переменные окружения**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Запустите сервер MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Протестируйте интеграцию**:
   - Откройте проект в VS Code
   - Настройте серверы MCP в `.vscode/mcp.json`
   - Протестируйте AI Chat с запросами к данным ритейла

4. **Мониторинг производительности**:
   - Просматривайте метрики в Application Insights
   - Проверяйте логи в рабочей области Log Analytics
   - Настройте оповещения для важных событий

---

Для получения дополнительной информации смотрите [основной README](../README.md) или [QUICKSTART руководство](../QUICKSTART.md).

---

**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.