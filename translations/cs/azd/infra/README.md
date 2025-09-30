<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:31:46+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "cs"
}
-->
# Šablony infrastruktury

Tato složka obsahuje šablony pro nasazení infrastruktury projektu MCP Retail Analytics.

## 📁 Přehled souborů

| Soubor | Popis | Použití |
|--------|-------|---------|
| `azuredeploy.json` | **ARM šablona** - Kompletní nasazení na úrovni předplatného | Doporučeno pro všechna nasazení |
| `azuredeploy.parameters.json` | **ARM parametry** - Statické konfigurační hodnoty | Používá se s `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Průvodce nasazením ARM** - Podrobné instrukce | Kompletní dokumentace k nasazení |
| `README.md` | **Tento soubor** - Přehled infrastruktury | Rychlý odkaz |

## 🚀 Možnosti nasazení

### Možnost 1: Azure CLI (doporučeno)
Kompletní nasazení včetně vytvoření skupiny prostředků:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Možnost 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Možnost 3: Azure Portal
1. Přejděte na [Azure Portal](https://portal.azure.com)
2. Vyhledejte "Nasadit vlastní šablonu"
3. Nahrajte `azuredeploy.json`
4. Nakonfigurujte parametry a spusťte nasazení

## 🏗️ Komponenty infrastruktury

ARM šablona nasazuje následující infrastrukturu:

- **Skupina prostředků**: Kontejner pro všechny prostředky s konzistentním pojmenováním
- **Log Analytics Workspace**: Centrální logování a monitorování (uchování dat po dobu 30 dní)
- **Application Insights**: Monitorování výkonu aplikací integrované s Log Analytics
- **Azure AI Services**: Multiservisní AI hub (úroveň S0) s řízenou identitou
- **OpenAI modely**:
  - `gpt-4o-mini` (kapacita 120) - Model pro chat a dokončování textu
  - `text-embedding-3-small` (kapacita 50) - Textové vkládání pro sémantické vyhledávání

## 🔧 Konfigurace šablony

### Parametry
ARM šablona přijímá následující přizpůsobitelné parametry:

| Parametr | Výchozí hodnota | Popis |
|----------|-----------------|-------|
| `resourcePrefix` | `mcpretail` | Prefix pro názvy všech prostředků |
| `location` | `westus2` | Azure region pro nasazení |
| `uniqueSuffix` | Automaticky generováno | 4znakový unikátní identifikátor |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Zobrazovaný název |
| `gptModelCapacity` | `120` | Kapacita tokenů GPT modelu |
| `embeddingModelCapacity` | `50` | Kapacita tokenů modelu pro vkládání textu |

### Konvence pojmenování prostředků
Všechny prostředky následují vzor: `{type}-{resourcePrefix}-{uniqueSuffix}`

Příklady:
- Skupina prostředků: `rg-mcpretail-demo`
- AI služba: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validace šablony

### Validace před nasazením
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Kontrola stavu nasazení
```bash
az deployment sub list --output table
```

## 💰 Odhad nákladů

Odhadované měsíční náklady pro vývojové zatížení:

| Služba | Konfigurace | Odhadované náklady/měsíc |
|--------|-------------|--------------------------|
| Azure AI Services | Úroveň S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokenů | $15-30 |
| OpenAI Embeddings | 50K tokenů | $5-15 |
| Application Insights | Základní monitorování | $5-15 |
| Log Analytics | 1GB/měsíc | $2-5 |
| **Celkem** | | **$42-115** |

## 📚 Další zdroje

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Podrobný průvodce nasazením s řešením problémů
- [Dokumentace ARM šablon](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentace Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Výsledky validace souborů

## 🆘 Rychlé řešení problémů

### Běžné problémy
- **Autentizace**: Spusťte `az login` pro autentizaci
- **Limity kvót**: Zkontrolujte dostupnost modelů OpenAI v cílovém regionu
- **Konflikty názvů**: Použijte jiný parametr `uniqueSuffix`
- **Oprávnění**: Ujistěte se, že účet má roli Contributor na předplatném

### Získání pomoci
- Viz [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) pro podrobné řešení problémů
- Zkontrolujte logy nasazení v Azure Portalu
- Navštivte [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Pro kompletní nastavení projektu viz [hlavní README](../../README.md) nebo [průvodce projektem](../../walkthrough/README.md).

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.