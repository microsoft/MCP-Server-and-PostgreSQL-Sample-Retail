<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:15:53+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "sk"
}
-->
# Pokyny na nasadenie ARM šablóny

Tento dokument poskytuje pokyny na nasadenie infraštruktúry MCP Retail Analytics pomocou ARM šablóny.

## 📋 Prehľad

ARM šablóna `azuredeploy.json` poskytuje kompletné nasadenie:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Možnosti nasadenia

### Možnosť 1: Nasadenie cez Azure CLI

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

### Možnosť 2: Nasadenie cez PowerShell

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

### Možnosť 3: Azure Portal

1. Prejdite na [Azure Portal](https://portal.azure.com)
2. Vyhľadajte "Deploy a custom template"
3. Kliknite na "Build your own template in the editor"
4. Skopírujte a vložte obsah súboru `azuredeploy.json`
5. Kliknite na "Save" a potom na "Review + create"
6. Vyplňte požadované parametre a nasadte šablónu

## 🔧 Parametre šablóny

| Parameter | Typ | Predvolená hodnota | Popis |
|-----------|------|--------------------|-------|
| `resourcePrefix` | string | `mcpretail` | Prefix pre názvy zdrojov |
| `location` | string | `westus2` | Azure región pre nasadenie |
| `uniqueSuffix` | string | Automaticky generované | 4-znakový unikátny identifikátor |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Zobrazovaný názov AI projektu |
| `aiProjectDescription` | string | Popis projektu | Popis zobrazený v Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapacita tokenov pre GPT model |
| `embeddingModelCapacity` | int | `50` | Kapacita tokenov pre embedding model |
| `tags` | object | Predvolené tagy | Tagy zdrojov pre správu |

## 📤 Výstupy šablóny

Šablóna poskytuje nasledujúce výstupy:

| Výstup | Popis |
|--------|-------|
| `subscriptionId` | ID Azure predplatného |
| `resourceGroupName` | Názov vytvorenej resource group |
| `aiFoundryName` | Názov služby Azure AI Foundry |
| `foundryEndpoint` | URL endpointu AI služby |
| `foundryAccountKey` | Prístupový kľúč AI služby |
| `deployedModels` | Pole nasadených OpenAI modelov |
| `applicationInsightsConnectionString` | Connection string pre Application Insights |
| `logAnalyticsWorkspaceName` | Názov Log Analytics workspace |

## 🔍 Overovacie príkazy

Po nasadení overte zdroje:

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

Tento projekt poskytuje šablóny ARM aj Bicep:

### ARM šablóna (`azuredeploy.json`)
- ✅ Natívny formát Azure Resource Manager
- ✅ Funguje všade, kde je podporovaný ARM
- ✅ Nevyžaduje žiadne dodatočné nástroje
- ❌ Rozsiahla syntax JSON
- ❌ Ťažšie čitateľné a udržiavateľné

### Bicep šablóna (`main.bicep`)
- ✅ Moderná, čistá syntax
- ✅ Lepšie nástroje a IntelliSense
- ✅ Jednoduchšie čitateľné a udržiavateľné
- ✅ Validácia počas kompilácie
- ❌ Vyžaduje Bicep CLI
- ❌ Dodatočný krok kompilácie

**Odporúčanie**: Používajte Bicep šablóny (`main.bicep`) na vývoj a ARM šablónu (`azuredeploy.json`) pre scenáre vyžadujúce čistý ARM JSON.

## 🔧 Prispôsobenie

### Pridanie vlastných zdrojov

Ak chcete pridať ďalšie zdroje do ARM šablóny:

1. Pridajte definíciu zdroja do poľa `resources` v nested šablóne
2. Pridajte nové parametre do sekcie `parameters`
3. Pridajte zodpovedajúce výstupy, ak je to potrebné
4. Aktualizujte súbor s parametrami predvolenými hodnotami

### Príklad: Pridanie Storage Account

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

## 🐛 Riešenie problémov

### Bežné problémy

#### 1. Chyby validácie šablóny
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikty názvov zdrojov
- Uistite sa, že `uniqueSuffix` je skutočne unikátny
- Použite funkciu `uniqueString()` na automatické generovanie
- Skontrolujte existujúce zdroje v cieľovom regióne

#### 3. Limity kvót
- Overte dostupnosť OpenAI modelov v cieľovom regióne
- Skontrolujte kvóty predplatného pre AI služby
- Zvážte použitie iných regiónov, ak sú limity dosiahnuté

#### 4. Problémy s oprávneniami
- Uistite sa, že účet má rolu Contributor na predplatnom
- Skontrolujte, či je predplatné povolené pre AI služby
- Overte registrácie poskytovateľov zdrojov

### Debugovacie príkazy

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

## 🔐 Bezpečnostné aspekty

### Riadenie prístupu
- AI služba používa spravovanú identitu na bezpečný prístup
- Resource group poskytuje hranicu pre RBAC
- Application Insights má samostatné prístupové kontroly

### Sieťová bezpečnosť
- Verejný prístup k sieti je predvolene povolený
- Zvážte použitie privátnych endpointov pre produkciu
- Sieťové ACL je možné konfigurovať pre dodatočnú bezpečnosť

### Správa kľúčov
- Kľúče AI služby sú automaticky generované
- Použite Azure Key Vault pre produkčné tajomstvá
- Pravidelne rotujte kľúče pre bezpečnosť

## 📚 Ďalšie kroky

Po úspešnom nasadení:

1. **Konfigurujte environmentálne premenné**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Spustite MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Otestujte integráciu**:
   - Otvorte VS Code s projektom
   - Konfigurujte MCP servery v `.vscode/mcp.json`
   - Otestujte AI Chat s dotazmi na retailové dáta

4. **Monitorujte výkon**:
   - Zobrazte metriky v Application Insights
   - Skontrolujte logy v Log Analytics workspace
   - Nastavte upozornenia na dôležité udalosti

---

Pre viac informácií si pozrite [hlavný README](../README.md) alebo [QUICKSTART príručku](../QUICKSTART.md).

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.