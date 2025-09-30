<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:20:15+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ru"
}
-->
# Шаблоны инфраструктуры

Эта папка содержит шаблоны развертывания инфраструктуры для проекта MCP Retail Analytics.

## 📁 Обзор файлов

| Файл | Описание | Сценарий использования |
|------|-------------|----------|
| `azuredeploy.json` | **ARM-шаблон** - Полное развертывание на уровне подписки | Рекомендуется для всех развертываний |
| `azuredeploy.parameters.json` | **Параметры ARM** - Статические значения конфигурации | Используется с `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Руководство по развертыванию ARM** - Подробные инструкции | Полная документация по развертыванию |
| `README.md` | **Этот файл** - Обзор инфраструктуры | Быстрая справка |

## 🚀 Варианты развертывания

### Вариант 1: Azure CLI (рекомендуется)
Полное развертывание с созданием группы ресурсов:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Вариант 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Вариант 3: Azure Portal
1. Перейдите в [Azure Portal](https://portal.azure.com)
2. Найдите "Deploy a custom template"
3. Загрузите `azuredeploy.json`
4. Настройте параметры и выполните развертывание

## 🏗️ Компоненты инфраструктуры

ARM-шаблон развертывает следующую инфраструктуру:

- **Группа ресурсов**: Контейнер для всех ресурсов с единообразным именованием
- **Рабочая область Log Analytics**: Централизованный сбор и мониторинг логов (хранение 30 дней)
- **Application Insights**: Мониторинг производительности приложений с интеграцией в Log Analytics
- **Сервисы Azure AI**: Многосервисный AI-хаб (уровень S0) с управляемой идентификацией
- **Модели OpenAI**:
  - `gpt-4o-mini` (120 емкость) - Модель для чата и завершения текста
  - `text-embedding-3-small` (50 емкость) - Текстовые эмбеддинги для семантического поиска

## 🔧 Конфигурация шаблона

### Параметры
ARM-шаблон принимает следующие настраиваемые параметры:

| Параметр | Значение по умолчанию | Описание |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Префикс для всех имен ресурсов |
| `location` | `westus2` | Регион Azure для развертывания |
| `uniqueSuffix` | Автогенерация | Уникальный идентификатор из 4 символов |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Отображаемое имя |
| `gptModelCapacity` | `120` | Емкость токенов модели GPT |
| `embeddingModelCapacity` | `50` | Емкость токенов модели эмбеддингов |

### Конвенция именования ресурсов
Все ресурсы следуют шаблону: `{type}-{resourcePrefix}-{uniqueSuffix}`

Примеры:
- Группа ресурсов: `rg-mcpretail-demo`
- Сервис AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Проверка шаблона

### Проверка перед развертыванием
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Проверка статуса развертывания
```bash
az deployment sub list --output table
```

## 💰 Оценка стоимости

Ориентировочные ежемесячные расходы для рабочей нагрузки разработки:

| Сервис | Конфигурация | Оценочная стоимость/месяц |
|---------|---------------|-----------------|
| Сервисы Azure AI | Уровень S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K токенов | $15-30 |
| OpenAI Embeddings | 50K токенов | $5-15 |
| Application Insights | Базовый мониторинг | $5-15 |
| Log Analytics | 1GB/месяц | $2-5 |
| **Итого** | | **$42-115** |

## 📚 Дополнительные ресурсы

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Подробное руководство по развертыванию с устранением неполадок
- [Документация ARM-шаблонов](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Документация Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Результаты проверки файлов

## 🆘 Быстрое устранение неполадок

### Распространенные проблемы
- **Аутентификация**: Выполните `az login` для аутентификации
- **Ограничения квот**: Проверьте доступность моделей OpenAI в целевом регионе
- **Конфликты имен**: Используйте другой параметр `uniqueSuffix`
- **Разрешения**: Убедитесь, что учетная запись имеет роль Contributor в подписке

### Получить помощь
- См. [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) для подробного устранения неполадок
- Проверьте журналы развертывания в Azure Portal
- Посетите [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Для полного настройки проекта см. [основной README](../../README.md) или [пошаговое руководство по проекту](../../walkthrough/README.md).

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.