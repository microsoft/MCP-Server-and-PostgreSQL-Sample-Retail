<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:33:01+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "sr"
}
-->
# Шаблони инфраструктуре

Овај директоријум садржи шаблоне за имплементацију инфраструктуре за MCP Retail Analytics пројекат.

## 📁 Преглед датотека

| Датотека | Опис | Примена |
|----------|------|---------|
| `azuredeploy.json` | **ARM шаблон** - Комплетна имплементација на нивоу претплате | Препоручено за све имплементације |
| `azuredeploy.parameters.json` | **ARM параметри** - Статичке вредности конфигурације | Користи се са `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Водич за ARM имплементацију** - Детаљна упутства | Комплетна документација за имплементацију |
| `README.md` | **Ова датотека** - Преглед инфраструктуре | Брза референца |

## 🚀 Опције имплементације

### Опција 1: Azure CLI (Препоручено)
Комплетна имплементација са креирањем групе ресурса:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Опција 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Опција 3: Azure Portal
1. Идите на [Azure Portal](https://portal.azure.com)
2. Претражите "Deploy a custom template"
3. Отпремите `azuredeploy.json`
4. Конфигуришите параметре и имплементирајте

## 🏗️ Компоненте инфраструктуре

ARM шаблон имплементира следећу инфраструктуру:

- **Група ресурса**: Контејнер за све ресурсе са конзистентним именовањем
- **Log Analytics Workspace**: Централно логовање и праћење (задржавање 30 дана)
- **Application Insights**: Праћење перформанси апликација интегрисано са Log Analytics
- **Azure AI Services**: Вишесервисни AI хаб (S0 ниво) са управљаним идентитетом
- **OpenAI модели**:
  - `gpt-4o-mini` (120 капацитет) - Модел за ћаскање и комплетирање
  - `text-embedding-3-small` (50 капацитет) - Текстуална угњежђења за семантичко претраживање

## 🔧 Конфигурација шаблона

### Параметри
ARM шаблон прихвата следеће параметре који се могу прилагодити:

| Параметар | Подразумевано | Опис |
|-----------|--------------|------|
| `resourcePrefix` | `mcpretail` | Префикс за сва имена ресурса |
| `location` | `westus2` | Azure регион за имплементацију |
| `uniqueSuffix` | Аутоматски генерисан | Јединствени идентификатор од 4 карактера |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Приказно име |
| `gptModelCapacity` | `120` | Капацитет токена GPT модела |
| `embeddingModelCapacity` | `50` | Капацитет модела за угњежђења |

### Конвенција именовања ресурса
Сви ресурси следе образац: `{type}-{resourcePrefix}-{uniqueSuffix}`

Примери:
- Група ресурса: `rg-mcpretail-demo`
- AI услуга: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Валидација шаблона

### Валидација пре имплементације
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Провера статуса имплементације
```bash
az deployment sub list --output table
```

## 💰 Процена трошкова

Процењени месечни трошкови за развојно оптерећење:

| Услуга | Конфигурација | Процена трошкова/месец |
|--------|--------------|-----------------------|
| Azure AI Services | S0 ниво | $15-50 |
| OpenAI GPT-4o-mini | 120K токена | $15-30 |
| OpenAI Embeddings | 50K токена | $5-15 |
| Application Insights | Основно праћење | $5-15 |
| Log Analytics | 1GB/месец | $2-5 |
| **Укупно** | | **$42-115** |

## 📚 Додатни ресурси

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Детаљан водич за имплементацију са решавањем проблема
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Резултати валидације датотека

## 🆘 Брзо решавање проблема

### Уобичајени проблеми
- **Аутентификација**: Покрените `az login` за аутентификацију
- **Ограничења квота**: Проверите доступност OpenAI модела у циљаном региону
- **Конфликти у именовању**: Користите другачији параметар `uniqueSuffix`
- **Дозволе**: Уверите се да налог има улогу Contributor на претплати

### Потражите помоћ
- Погледајте [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) за детаљно решавање проблема
- Проверите логове имплементације у Azure Portal
- Посетите [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

За комплетно подешавање пројекта, погледајте [главни README](../../README.md) или [водич кроз пројекат](../../walkthrough/README.md).

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која могу произаћи из коришћења овог превода.