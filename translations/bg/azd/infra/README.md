<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:32:41+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "bg"
}
-->
# Шаблони за инфраструктура

Тази папка съдържа шаблони за разгръщане на инфраструктура за проекта MCP Retail Analytics.

## 📁 Преглед на файловете

| Файл | Описание | Приложение |
|------|-------------|----------|
| `azuredeploy.json` | **ARM шаблон** - Пълно разгръщане на ниво абонамент | Препоръчва се за всички разгръщания |
| `azuredeploy.parameters.json` | **ARM параметри** - Статични конфигурационни стойности | Използва се с `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Ръководство за ARM разгръщане** - Подробни инструкции | Пълна документация за разгръщане |
| `README.md` | **Този файл** - Преглед на инфраструктурата | Бърза справка |

## 🚀 Опции за разгръщане

### Опция 1: Azure CLI (Препоръчително)
Пълно разгръщане с създаване на ресурсна група:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Опция 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Опция 3: Azure Portal
1. Отидете на [Azure Portal](https://portal.azure.com)
2. Потърсете "Deploy a custom template"
3. Качете `azuredeploy.json`
4. Конфигурирайте параметрите и разгръщайте

## 🏗️ Компоненти на инфраструктурата

ARM шаблонът разгръща следната инфраструктура:

- **Ресурсна група**: Контейнер за всички ресурси с последователно именуване
- **Log Analytics Workspace**: Централизирано логване и мониторинг (30-дневно съхранение)
- **Application Insights**: Мониторинг на производителността на приложения, интегриран с Log Analytics
- **Azure AI Services**: Многофункционален AI хъб (S0 ниво) с управлявана идентичност
- **OpenAI модели**:
  - `gpt-4o-mini` (120 капацитет) - Модел за чат и завършване
  - `text-embedding-3-small` (50 капацитет) - Текстови вграждания за семантично търсене

## 🔧 Конфигурация на шаблона

### Параметри
ARM шаблонът приема следните персонализируеми параметри:

| Параметър | По подразбиране | Описание |
|-----------|----------------|----------|
| `resourcePrefix` | `mcpretail` | Префикс за всички имена на ресурси |
| `location` | `westus2` | Azure регион за разгръщане |
| `uniqueSuffix` | Автоматично генериран | Уникален идентификатор от 4 символа |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Име за показване |
| `gptModelCapacity` | `120` | Капацитет на GPT модела (токени) |
| `embeddingModelCapacity` | `50` | Капацитет на модела за вграждания |

### Конвенция за именуване на ресурси
Всички ресурси следват шаблона: `{type}-{resourcePrefix}-{uniqueSuffix}`

Примери:
- Ресурсна група: `rg-mcpretail-demo`
- AI услуга: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Валидация на шаблона

### Валидация преди разгръщане
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Проверка на статуса на разгръщане
```bash
az deployment sub list --output table
```

## 💰 Оценка на разходите

Оценени месечни разходи за разработка:

| Услуга | Конфигурация | Оценка на разходите/месец |
|--------|--------------|--------------------------|
| Azure AI Services | S0 ниво | $15-50 |
| OpenAI GPT-4o-mini | 120K токени | $15-30 |
| OpenAI Embeddings | 50K токени | $5-15 |
| Application Insights | Основен мониторинг | $5-15 |
| Log Analytics | 1GB/месец | $2-5 |
| **Общо** | | **$42-115** |

## 📚 Допълнителни ресурси

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Подробно ръководство за разгръщане с отстраняване на проблеми
- [Документация за ARM шаблони](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Документация за Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Резултати от валидация на файлове

## 🆘 Бързо отстраняване на проблеми

### Чести проблеми
- **Автентикация**: Изпълнете `az login` за автентикация
- **Квотни ограничения**: Проверете наличността на OpenAI модела в целевия регион
- **Конфликти в именуването**: Използвайте различен параметър `uniqueSuffix`
- **Разрешения**: Уверете се, че акаунтът има роля Contributor за абонамента

### Получаване на помощ
- Вижте [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) за подробности относно отстраняване на проблеми
- Проверете логовете за разгръщане в Azure Portal
- Посетете [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

За пълна настройка на проекта вижте [основния README](../../README.md) или [ръководството за проекта](../../walkthrough/README.md).

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.