<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:14:57+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "hu"
}
-->
# ARM sablon telepítési útmutató

Ez a dokumentum az MCP Retail Analytics infrastruktúra ARM sablonnal történő telepítéséhez nyújt útmutatást.

## 📋 Áttekintés

Az `azuredeploy.json` ARM sablon teljes telepítést biztosít az alábbiakhoz:
- Azure erőforráscsoport
- Log Analytics munkaterület  
- Application Insights
- Azure AI szolgáltatások (Foundry)
- OpenAI modell telepítések (GPT-4o-mini, text-embedding-3-small)

## 🚀 Telepítési lehetőségek

### 1. lehetőség: Azure CLI telepítés

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

### 2. lehetőség: PowerShell telepítés

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

### 3. lehetőség: Azure Portál

1. Nyissa meg az [Azure Portált](https://portal.azure.com)
2. Keressen rá a "Deploy a custom template" opcióra
3. Kattintson a "Build your own template in the editor" gombra
4. Másolja be az `azuredeploy.json` tartalmát
5. Kattintson a "Save", majd a "Review + create" gombra
6. Töltse ki a szükséges paramétereket, és telepítse

## 🔧 Sablon paraméterek

| Paraméter | Típus | Alapértelmezett | Leírás |
|-----------|------|-----------------|--------|
| `resourcePrefix` | string | `mcpretail` | Erőforrásnevek előtagja |
| `location` | string | `westus2` | Azure régió a telepítéshez |
| `uniqueSuffix` | string | Automatikusan generált | 4 karakteres egyedi azonosító |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI projekt megjelenítési neve |
| `aiProjectDescription` | string | Projekt leírás | Leírás az Azure AI Foundry-ban |
| `gptModelCapacity` | int | `120` | GPT modell token kapacitása |
| `embeddingModelCapacity` | int | `50` | Beágyazási modell token kapacitása |
| `tags` | object | Alapértelmezett címkék | Erőforrás címkék irányításhoz |

## 📤 Sablon kimenetek

A sablon az alábbi kimeneteket biztosítja:

| Kimenet | Leírás |
|---------|--------|
| `subscriptionId` | Azure előfizetés azonosító |
| `resourceGroupName` | Létrehozott erőforráscsoport neve |
| `aiFoundryName` | Azure AI Foundry szolgáltatás neve |
| `foundryEndpoint` | AI szolgáltatás végpont URL |
| `foundryAccountKey` | AI szolgáltatás hozzáférési kulcs |
| `deployedModels` | Telepített OpenAI modellek tömbje |
| `applicationInsightsConnectionString` | Application Insights kapcsolati karakterlánc |
| `logAnalyticsWorkspaceName` | Log Analytics munkaterület neve |

## 🔍 Ellenőrzési parancsok

Telepítés után ellenőrizze az erőforrásokat:

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

Ez a projekt ARM és Bicep sablonokat is biztosít:

### ARM sablon (`azuredeploy.json`)
- ✅ Natív Azure Resource Manager formátum
- ✅ Mindenhol működik, ahol ARM támogatott
- ✅ Nincs szükség további eszközökre
- ❌ Bőbeszédű JSON szintaxis
- ❌ Nehezebb olvasni és karbantartani

### Bicep sablon (`main.bicep`)
- ✅ Modern, tiszta szintaxis
- ✅ Jobb eszközök és IntelliSense támogatás
- ✅ Könnyebb olvasni és karbantartani
- ✅ Fordítási időben történő validáció
- ❌ Bicep CLI szükséges
- ❌ További build lépés szükséges

**Ajánlás**: Használja a Bicep sablonokat (`main.bicep`) fejlesztéshez, és az ARM sablont (`azuredeploy.json`) olyan helyzetekben, ahol tiszta ARM JSON szükséges.

## 🔧 Testreszabás

### Egyedi erőforrások hozzáadása

Egyedi erőforrások hozzáadásához az ARM sablonhoz:

1. Adja hozzá az erőforrás definícióját a beágyazott sablon `resources` tömbjéhez
2. Adjon hozzá új paramétereket a `parameters` szekcióhoz
3. Szükség esetén adjon hozzá megfelelő kimeneteket
4. Frissítse a paraméterek fájlt alapértelmezett értékekkel

### Példa: Tárfiók hozzáadása

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

## 🐛 Hibakeresés

### Gyakori problémák

#### 1. Sablon validációs hibák
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Erőforrás névütközések
- Győződjön meg róla, hogy a `uniqueSuffix` valóban egyedi
- Használja a `uniqueString()` függvényt automatikus generáláshoz
- Ellenőrizze a meglévő erőforrásokat a célrégióban

#### 3. Kvóta korlátok
- Ellenőrizze az OpenAI modell elérhetőségét a célrégióban
- Ellenőrizze az előfizetés kvótáit az AI szolgáltatásokhoz
- Fontolja meg más régiók használatát, ha korlátokba ütközik

#### 4. Jogosultsági problémák
- Győződjön meg róla, hogy a fiók rendelkezik Contributor szerepkörrel az előfizetésen
- Ellenőrizze, hogy az előfizetés engedélyezve van-e az AI szolgáltatásokhoz
- Ellenőrizze az erőforrás-szolgáltató regisztrációkat

### Hibakeresési parancsok

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

## 🔐 Biztonsági szempontok

### Hozzáférés-vezérlés
- Az AI szolgáltatás kezelt identitást használ a biztonságos hozzáféréshez
- Az erőforráscsoport RBAC határokat biztosít
- Az Application Insights külön hozzáférés-vezérléssel rendelkezik

### Hálózati biztonság
- Nyilvános hálózati hozzáférés alapértelmezetten engedélyezve
- Fontolja meg privát végpontok használatát éles környezetben
- Hálózati ACL-ek konfigurálhatók további biztonság érdekében

### Kulcskezelés
- Az AI szolgáltatás kulcsai automatikusan generálódnak
- Használja az Azure Key Vault-ot éles titkokhoz
- Rendszeresen forgassa a kulcsokat a biztonság érdekében

## 📚 Következő lépések

Sikeres telepítés után:

1. **Környezetváltozók konfigurálása**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP szerver indítása**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Integráció tesztelése**:
   - Nyissa meg a projektet VS Code-ban
   - Konfigurálja az MCP szervereket a `.vscode/mcp.json` fájlban
   - Tesztelje az AI Chat-et kiskereskedelmi adatkérdésekkel

4. **Teljesítmény monitorozása**:
   - Nézze meg a metrikákat az Application Insights-ban
   - Ellenőrizze a naplókat a Log Analytics munkaterületen
   - Állítson be riasztásokat fontos eseményekhez

---

További információért tekintse meg a [fő README](../README.md) vagy a [QUICKSTART útmutatót](../QUICKSTART.md).

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.