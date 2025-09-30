<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:16:39+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "bg"
}
-->
# Инструкции за разгръщане на ARM шаблон

Този документ предоставя инструкции за разгръщане на инфраструктурата MCP Retail Analytics с помощта на ARM шаблон.

## 📋 Преглед

ARM шаблонът `azuredeploy.json` осигурява пълно разгръщане на:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI модели (GPT-4o-mini, text-embedding-3-small)

## 🚀 Опции за разгръщане

### Опция 1: Разгръщане чрез Azure CLI

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

### Опция 2: Разгръщане чрез PowerShell

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

### Опция 3: Azure Portal

1. Отидете на [Azure Portal](https://portal.azure.com)
2. Потърсете "Deploy a custom template"
3. Кликнете върху "Build your own template in the editor"
4. Копирайте и поставете съдържанието на `azuredeploy.json`
5. Кликнете върху "Save", след това "Review + create"
6. Попълнете необходимите параметри и разгръщайте

## 🔧 Параметри на шаблона

| Параметър | Тип | По подразбиране | Описание |
|-----------|------|----------------|----------|
| `resourcePrefix` | string | `mcpretail` | Префикс за имената на ресурсите |
| `location` | string | `westus2` | Azure регион за разгръщане |
| `uniqueSuffix` | string | Автоматично генериран | Уникален идентификатор от 4 символа |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Име за показване на AI проекта |
| `aiProjectDescription` | string | Описание на проекта | Описание, показвано в Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Капацитет на токени за GPT модела |
| `embeddingModelCapacity` | int | `50` | Капацитет на токени за embedding модела |
| `tags` | object | По подразбиране | Тагове за управление на ресурсите |

## 📤 Резултати от шаблона

Шаблонът предоставя следните резултати:

| Резултат | Описание |
|----------|----------|
| `subscriptionId` | ID на Azure абонамента |
| `resourceGroupName` | Име на създадената ресурсна група |
| `aiFoundryName` | Име на услугата Azure AI Foundry |
| `foundryEndpoint` | URL на крайна точка на AI услугата |
| `foundryAccountKey` | Ключ за достъп до AI услугата |
| `deployedModels` | Масив от разположени OpenAI модели |
| `applicationInsightsConnectionString` | Стринг за връзка с Application Insights |
| `logAnalyticsWorkspaceName` | Име на Log Analytics работното пространство |

## 🔍 Команди за проверка

След разгръщане, проверете ресурсите:

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

## 🆚 ARM срещу Bicep

Този проект предоставя както ARM, така и Bicep шаблони:

### ARM шаблон (`azuredeploy.json`)
- ✅ Нативен формат на Azure Resource Manager
- ✅ Работи навсякъде, където ARM се поддържа
- ✅ Не изисква допълнителни инструменти
- ❌ По-обемист JSON синтаксис
- ❌ По-труден за четене и поддръжка

### Bicep шаблон (`main.bicep`)
- ✅ Модерен, чист синтаксис
- ✅ По-добри инструменти и IntelliSense
- ✅ По-лесен за четене и поддръжка
- ✅ Валидация по време на компилация
- ❌ Изисква Bicep CLI
- ❌ Допълнителна стъпка за компилация

**Препоръка**: Използвайте Bicep шаблони (`main.bicep`) за разработка и ARM шаблона (`azuredeploy.json`) за сценарии, изискващи чист ARM JSON.

## 🔧 Персонализация

### Добавяне на персонализирани ресурси

За да добавите допълнителни ресурси към ARM шаблона:

1. Добавете дефиницията на ресурса към масива `resources` в вложения шаблон
2. Добавете нови параметри в секцията `parameters`
3. Добавете съответните резултати, ако е необходимо
4. Актуализирайте файла с параметри с стойности по подразбиране

### Пример: Добавяне на Storage Account

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

## 🐛 Отстраняване на проблеми

### Често срещани проблеми

#### 1. Грешки при валидиране на шаблона
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Конфликти с имената на ресурси
- Уверете се, че `uniqueSuffix` е наистина уникален
- Използвайте функцията `uniqueString()` за автоматично генериране
- Проверете съществуващите ресурси в целевия регион

#### 3. Ограничения на квоти
- Проверете наличността на OpenAI модели в целевия регион
- Проверете квотите на абонамента за AI услуги
- Обмислете използването на различни региони, ако лимитите са достигнати

#### 4. Проблеми с разрешенията
- Уверете се, че акаунтът има роля Contributor в абонамента
- Проверете дали абонаментът е активиран за AI услуги
- Уверете се, че доставчиците на ресурси са регистрирани

### Команди за дебъгване

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

## 🔐 Съображения за сигурност

### Контрол на достъпа
- AI услугата използва управлявана идентичност за сигурен достъп
- Ресурсната група предоставя граница за RBAC
- Application Insights има отделни контроли за достъп

### Мрежова сигурност
- Публичният мрежов достъп е активиран по подразбиране
- Обмислете използването на частни крайни точки за продукция
- Мрежовите ACL могат да бъдат конфигурирани за допълнителна сигурност

### Управление на ключове
- Ключовете за AI услугата се генерират автоматично
- Използвайте Azure Key Vault за секрети в продукция
- Редовно сменяйте ключовете за сигурност

## 📚 Следващи стъпки

След успешно разгръщане:

1. **Конфигурирайте променливи на средата**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Стартирайте MCP сървъра**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Тествайте интеграцията**:
   - Отворете VS Code с проекта
   - Конфигурирайте MCP сървърите в `.vscode/mcp.json`
   - Тествайте AI чат с въпроси за данни от търговията на дребно

4. **Наблюдавайте производителността**:
   - Прегледайте метриките в Application Insights
   - Проверете логовете в Log Analytics работното пространство
   - Настройте известия за важни събития

---

За повече информация вижте [основния README](../README.md) или [QUICKSTART ръководството](../QUICKSTART.md).

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.