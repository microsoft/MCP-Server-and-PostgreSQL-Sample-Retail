<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:15:25+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "cs"
}
-->
# Pokyny k nasazení ARM šablony

Tento dokument poskytuje pokyny k nasazení infrastruktury MCP Retail Analytics pomocí ARM šablony.

## 📋 Přehled

ARM šablona `azuredeploy.json` poskytuje kompletní nasazení:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- Nasazení modelů OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Možnosti nasazení

### Možnost 1: Nasazení pomocí Azure CLI

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

### Možnost 2: Nasazení pomocí PowerShellu

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

### Možnost 3: Azure Portal

1. Přejděte na [Azure Portal](https://portal.azure.com)
2. Vyhledejte "Deploy a custom template"
3. Klikněte na "Build your own template in the editor"
4. Zkopírujte a vložte obsah souboru `azuredeploy.json`
5. Klikněte na "Save" a poté na "Review + create"
6. Vyplňte požadované parametry a nasazení spusťte

## 🔧 Parametry šablony

| Parametr | Typ | Výchozí hodnota | Popis |
|----------|-----|-----------------|-------|
| `resourcePrefix` | string | `mcpretail` | Prefix pro názvy zdrojů |
| `location` | string | `westus2` | Azure region pro nasazení |
| `uniqueSuffix` | string | Automaticky generováno | 4znakový unikátní identifikátor |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Zobrazovaný název AI projektu |
| `aiProjectDescription` | string | Popis projektu | Popis zobrazený v Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapacita tokenů pro GPT model |
| `embeddingModelCapacity` | int | `50` | Kapacita tokenů pro embedding model |
| `tags` | object | Výchozí tagy | Tagy zdrojů pro správu |

## 📤 Výstupy šablony

Šablona poskytuje následující výstupy:

| Výstup | Popis |
|--------|-------|
| `subscriptionId` | ID Azure předplatného |
| `resourceGroupName` | Název vytvořené resource group |
| `aiFoundryName` | Název služby Azure AI Foundry |
| `foundryEndpoint` | URL endpointu AI služby |
| `foundryAccountKey` | Přístupový klíč AI služby |
| `deployedModels` | Pole nasazených modelů OpenAI |
| `applicationInsightsConnectionString` | Connection string pro Application Insights |
| `logAnalyticsWorkspaceName` | Název Log Analytics workspace |

## 🔍 Ověřovací příkazy

Po nasazení ověřte zdroje:

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

Tento projekt poskytuje jak ARM, tak Bicep šablony:

### ARM šablona (`azuredeploy.json`)
- ✅ Nativní formát Azure Resource Manager
- ✅ Funguje všude, kde je podporován ARM
- ✅ Nevyžaduje žádné další nástroje
- ❌ Více rozvláčná syntaxe JSON
- ❌ Hůře čitelná a udržovatelná

### Bicep šablona (`main.bicep`)
- ✅ Moderní, přehledná syntaxe
- ✅ Lepší nástroje a IntelliSense
- ✅ Snadnější čtení a údržba
- ✅ Validace při kompilaci
- ❌ Vyžaduje Bicep CLI
- ❌ Další krok při sestavení

**Doporučení**: Používejte Bicep šablony (`main.bicep`) pro vývoj a ARM šablonu (`azuredeploy.json`) pro scénáře vyžadující čistý ARM JSON.

## 🔧 Přizpůsobení

### Přidání vlastních zdrojů

Pro přidání dalších zdrojů do ARM šablony:

1. Přidejte definici zdroje do pole `resources` v šabloně
2. Přidejte nové parametry do sekce `parameters`
3. Pokud je to potřeba, přidejte odpovídající výstupy
4. Aktualizujte soubor s parametry výchozími hodnotami

### Příklad: Přidání Storage Account

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

## 🐛 Řešení problémů

### Běžné problémy

#### 1. Chyby validace šablony
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikty názvů zdrojů
- Ujistěte se, že `uniqueSuffix` je skutečně unikátní
- Použijte funkci `uniqueString()` pro automatické generování
- Zkontrolujte existující zdroje v cílovém regionu

#### 3. Limity kvót
- Ověřte dostupnost modelů OpenAI v cílovém regionu
- Zkontrolujte kvóty předplatného pro AI služby
- Zvažte použití jiných regionů, pokud jsou limity překročeny

#### 4. Problémy s oprávněními
- Ujistěte se, že účet má roli Contributor na předplatném
- Zkontrolujte, zda je předplatné povoleno pro AI služby
- Ověřte registrace poskytovatelů zdrojů

### Ladicí příkazy

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

## 🔐 Bezpečnostní aspekty

### Řízení přístupu
- AI služba používá spravovanou identitu pro bezpečný přístup
- Resource group poskytuje hranici pro RBAC
- Application Insights má samostatné řízení přístupu

### Síťová bezpečnost
- Veřejný přístup k síti je ve výchozím nastavení povolen
- Zvažte použití privátních endpointů pro produkční prostředí
- Síťové ACL lze konfigurovat pro zvýšení bezpečnosti

### Správa klíčů
- Klíče AI služby jsou generovány automaticky
- Používejte Azure Key Vault pro produkční tajemství
- Pravidelně otáčejte klíče pro zvýšení bezpečnosti

## 📚 Další kroky

Po úspěšném nasazení:

1. **Konfigurujte proměnné prostředí**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Spusťte MCP server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Otestujte integraci**:
   - Otevřete projekt ve VS Code
   - Konfigurujte MCP servery v `.vscode/mcp.json`
   - Otestujte AI chat s dotazy na maloobchodní data

4. **Monitorujte výkon**:
   - Sledujte metriky v Application Insights
   - Zkontrolujte logy v Log Analytics workspace
   - Nastavte upozornění na důležité události

---

Pro více informací si přečtěte [hlavní README](../README.md) nebo [QUICKSTART průvodce](../QUICKSTART.md).

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.