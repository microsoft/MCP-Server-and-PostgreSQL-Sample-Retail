<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:16:57+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "sr"
}
-->
# Упутства за распоређивање ARM шаблона

Овај документ пружа упутства за распоређивање MCP Retail Analytics инфраструктуре користећи ARM шаблон.

## 📋 Преглед

`azuredeploy.json` ARM шаблон омогућава комплетно распоређивање:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Опције распоређивања

### Опција 1: Распоређивање преко Azure CLI

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

### Опција 2: Распоређивање преко PowerShell-а

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

### Опција 3: Azure Portal

1. Идите на [Azure Portal](https://portal.azure.com)
2. Потражите "Deploy a custom template"
3. Кликните на "Build your own template in the editor"
4. Копирајте и налепите садржај `azuredeploy.json`
5. Кликните на "Save", а затим на "Review + create"
6. Попуните потребне параметре и распоредите

## 🔧 Параметри шаблона

| Параметар | Тип | Подразумевано | Опис |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Префикс за називе ресурса |
| `location` | string | `westus2` | Azure регион за распоређивање |
| `uniqueSuffix` | string | Аутоматски генерисано | Јединствени идентификатор од 4 карактера |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Приказни назив за AI пројекат |
| `aiProjectDescription` | string | Опис пројекта | Опис приказан у Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Капацитет токена за GPT модел |
| `embeddingModelCapacity` | int | `50` | Капацитет токена за embedding модел |
| `tags` | object | Подразумеване ознаке | Ознаке ресурса за управљање |

## 📤 Излазни подаци шаблона

Шаблон пружа следеће излазне податке:

| Излаз | Опис |
|--------|-------------|
| `subscriptionId` | Azure ID претплате |
| `resourceGroupName` | Назив креиране групе ресурса |
| `aiFoundryName` | Назив Azure AI Foundry услуге |
| `foundryEndpoint` | URL крајње тачке AI услуге |
| `foundryAccountKey` | Кључ за приступ AI услузи |
| `deployedModels` | Низ распоређених OpenAI модела |
| `applicationInsightsConnectionString` | Конекцијски низ за Application Insights |
| `logAnalyticsWorkspaceName` | Назив Log Analytics радног простора |

## 🔍 Команде за проверу

Након распоређивања, проверите ресурсе:

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

Овај пројекат пружа и ARM и Bicep шаблоне:

### ARM шаблон (`azuredeploy.json`)
- ✅ Нативни формат Azure Resource Manager-а
- ✅ Ради свуда где је ARM подржан
- ✅ Нема потребе за додатним алатима
- ❌ Више опширна JSON синтакса
- ❌ Теже за читање и одржавање

### Bicep шаблон (`main.bicep`)
- ✅ Модерна, чиста синтакса
- ✅ Бољи алати и IntelliSense
- ✅ Лакше за читање и одржавање
- ✅ Валидација током компилације
- ❌ Захтева Bicep CLI
- ❌ Додатни корак компилације

**Препорука**: Користите Bicep шаблоне (`main.bicep`) за развој, а ARM шаблон (`azuredeploy.json`) за сценарије који захтевају чист ARM JSON.

## 🔧 Прилагођавање

### Додавање прилагођених ресурса

Да бисте додали додатне ресурсе у ARM шаблон:

1. Додајте дефиницију ресурса у `resources` низ у угнежденом шаблону
2. Додајте нове параметре у секцију `parameters`
3. Додајте одговарајуће излазне податке ако је потребно
4. Ажурирајте датотеку параметара са подразумеваним вредностима

### Пример: Додавање Storage Account-а

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

## 🐛 Решавање проблема

### Уобичајени проблеми

#### 1. Грешке у валидацији шаблона
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Конфликти у називима ресурса
- Уверите се да је `uniqueSuffix` заиста јединствен
- Користите функцију `uniqueString()` за аутоматско генерисање
- Проверите постојеће ресурсе у циљном региону

#### 3. Ограничења квота
- Проверите доступност OpenAI модела у циљном региону
- Проверите квоте претплате за AI услуге
- Размотрите коришћење различитих региона ако су лимити достигнути

#### 4. Проблеми са дозволама
- Уверите се да налог има Contributor улогу на претплати
- Проверите да ли је претплата омогућена за AI услуге
- Проверите регистрације провајдера ресурса

### Команде за дебаговање

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

## 🔐 Безбедносни аспекти

### Контрола приступа
- AI услуга користи управљани идентитет за сигуран приступ
- Група ресурса пружа границу за RBAC
- Application Insights има засебне контроле приступа

### Мрежна безбедност
- Јавни приступ мрежи је подразумевано омогућен
- Размотрите приватне крајње тачке за продукцију
- Мрежни ACL-ови могу бити конфигурисани за додатну безбедност

### Управљање кључевима
- Кључеви за AI услугу се аутоматски генеришу
- Користите Azure Key Vault за продукционе тајне
- Редовно ротирајте кључеве ради безбедности

## 📚 Следећи кораци

Након успешног распоређивања:

1. **Конфигуришите променљиве окружења**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Покрените MCP сервер**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Тестирајте интеграцију**:
   - Отворите VS Code са пројектом
   - Конфигуришите MCP сервере у `.vscode/mcp.json`
   - Тестирајте AI Chat са упитима о подацима из малопродаје

4. **Пратите перформансе**:
   - Погледајте метрике у Application Insights
   - Проверите логове у Log Analytics радном простору
   - Поставите упозорења за важне догађаје

---

За више информација, погледајте [главни README](../README.md) или [QUICKSTART водич](../QUICKSTART.md).

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.