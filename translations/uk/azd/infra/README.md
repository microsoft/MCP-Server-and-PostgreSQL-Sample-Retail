<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:34:28+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "uk"
}
-->
# Шаблони Інфраструктури

Ця папка містить шаблони для розгортання інфраструктури проєкту MCP Retail Analytics.

## 📁 Огляд файлів

| Файл | Опис | Використання |
|------|-------------|----------|
| `azuredeploy.json` | **ARM шаблон** - Повне розгортання на рівні підписки | Рекомендовано для всіх розгортань |
| `azuredeploy.parameters.json` | **ARM параметри** - Статичні значення конфігурації | Використовується разом із `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Посібник з розгортання ARM** - Детальні інструкції | Повна документація з розгортання |
| `README.md` | **Цей файл** - Огляд інфраструктури | Швидкий довідник |

## 🚀 Варіанти розгортання

### Варіант 1: Azure CLI (Рекомендовано)
Повне розгортання з створенням групи ресурсів:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Варіант 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Варіант 3: Azure Portal
1. Перейдіть до [Azure Portal](https://portal.azure.com)
2. Знайдіть "Deploy a custom template"
3. Завантажте `azuredeploy.json`
4. Налаштуйте параметри та розгорніть

## 🏗️ Компоненти інфраструктури

ARM шаблон розгортає наступну інфраструктуру:

- **Група ресурсів**: Контейнер для всіх ресурсів із узгодженими назвами
- **Log Analytics Workspace**: Центральне логування та моніторинг (зберігання даних протягом 30 днів)
- **Application Insights**: Моніторинг продуктивності додатків, інтегрований із Log Analytics
- **Azure AI Services**: Центр багатосервісного AI (рівень S0) із керованою ідентичністю
- **Моделі OpenAI**:
  - `gpt-4o-mini` (120 одиниць потужності) - Модель для чатів і завершення тексту
  - `text-embedding-3-small` (50 одиниць потужності) - Текстові вбудовування для семантичного пошуку

## 🔧 Конфігурація шаблону

### Параметри
ARM шаблон приймає наступні параметри, які можна налаштувати:

| Параметр | За замовчуванням | Опис |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Префікс для назв усіх ресурсів |
| `location` | `westus2` | Регіон Azure для розгортання |
| `uniqueSuffix` | Автоматично генерується | Унікальний ідентифікатор із 4 символів |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Відображувана назва |
| `gptModelCapacity` | `120` | Потужність моделі GPT у токенах |
| `embeddingModelCapacity` | `50` | Потужність моделі вбудовування у токенах |

### Конвенція назв ресурсів
Усі ресурси дотримуються шаблону: `{type}-{resourcePrefix}-{uniqueSuffix}`

Приклади:
- Група ресурсів: `rg-mcpretail-demo`
- AI сервіс: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Валідація шаблону

### Перевірка перед розгортанням
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Перевірка статусу розгортання
```bash
az deployment sub list --output table
```

## 💰 Оцінка вартості

Орієнтовна щомісячна вартість для робочого навантаження розробки:

| Сервіс | Конфігурація | Орієнтовна вартість/місяць |
|---------|---------------|-----------------|
| Azure AI Services | Рівень S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K токенів | $15-30 |
| OpenAI Embeddings | 50K токенів | $5-15 |
| Application Insights | Базовий моніторинг | $5-15 |
| Log Analytics | 1GB/місяць | $2-5 |
| **Загалом** | | **$42-115** |

## 📚 Додаткові ресурси

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Детальний посібник із розгортання та усунення несправностей
- [Документація ARM шаблонів](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Документація Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Результати перевірки файлів

## 🆘 Швидке усунення несправностей

### Поширені проблеми
- **Аутентифікація**: Виконайте `az login` для аутентифікації
- **Ліміти квот**: Перевірте доступність моделі OpenAI у цільовому регіоні
- **Конфлікти назв**: Використовуйте інший параметр `uniqueSuffix`
- **Дозволи**: Переконайтеся, що обліковий запис має роль Contributor у підписці

### Отримати допомогу
- Дивіться [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) для детального усунення несправностей
- Перевірте журнали розгортання в Azure Portal
- Відвідайте [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Для повного налаштування проєкту дивіться [основний README](../../README.md) або [покроковий посібник проєкту](../../walkthrough/README.md).

---

**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, звертаємо вашу увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний переклад людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильне тлумачення, що виникли внаслідок використання цього перекладу.