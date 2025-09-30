<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:31:27+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "hu"
}
-->
# Infrastruktúra sablonok

Ez a mappa tartalmazza az MCP Retail Analytics projekt infrastruktúra telepítési sablonjait.

## 📁 Fájlok áttekintése

| Fájl | Leírás | Felhasználási eset |
|------|--------|--------------------|
| `azuredeploy.json` | **ARM sablon** - Teljes előfizetés-szintű telepítés | Ajánlott minden telepítéshez |
| `azuredeploy.parameters.json` | **ARM paraméterek** - Statikus konfigurációs értékek | Használható az `azuredeploy.json` fájllal |
| `ARM-DEPLOYMENT.md` | **ARM telepítési útmutató** - Részletes instrukciók | Teljes telepítési dokumentáció |
| `README.md` | **Ez a fájl** - Infrastruktúra áttekintés | Gyors referencia |

## 🚀 Telepítési lehetőségek

### Opció 1: Azure CLI (Ajánlott)
Teljes telepítés erőforráscsoport létrehozásával:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opció 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opció 3: Azure Portál
1. Lépjen az [Azure Portálra](https://portal.azure.com)
2. Keressen rá a "Egyéni sablon telepítése" opcióra
3. Töltse fel az `azuredeploy.json` fájlt
4. Konfigurálja a paramétereket, majd telepítse

## 🏗️ Infrastruktúra összetevők

Az ARM sablon a következő infrastruktúrát telepíti:

- **Erőforráscsoport**: Minden erőforrás tárolója egységes névvel
- **Log Analytics Workspace**: Központi naplózás és monitorozás (30 napos megőrzés)
- **Application Insights**: Alkalmazás teljesítményének monitorozása, integrálva a Log Analytics-szel
- **Azure AI Services**: Több szolgáltatást tartalmazó AI központ (S0 szint) kezelt identitással
- **OpenAI modellek**:
  - `gpt-4o-mini` (120 kapacitás) - Chat és szövegkiegészítő modell
  - `text-embedding-3-small` (50 kapacitás) - Szövegbeágyazás szemantikai kereséshez

## 🔧 Sablon konfiguráció

### Paraméterek
Az ARM sablon a következő testreszabható paramétereket fogadja:

| Paraméter | Alapértelmezett | Leírás |
|-----------|----------------|--------|
| `resourcePrefix` | `mcpretail` | Az erőforrások nevének előtagja |
| `location` | `westus2` | Azure régió a telepítéshez |
| `uniqueSuffix` | Automatikusan generált | 4 karakteres egyedi azonosító |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Megjelenítési név |
| `gptModelCapacity` | `120` | GPT modell token kapacitása |
| `embeddingModelCapacity` | `50` | Beágyazási modell kapacitása |

### Erőforrás elnevezési konvenció
Minden erőforrás a következő mintát követi: `{type}-{resourcePrefix}-{uniqueSuffix}`

Példák:
- Erőforráscsoport: `rg-mcpretail-demo`
- AI szolgáltatás: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Sablon érvényesítése

### Érvényesítés telepítés előtt
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Telepítési állapot ellenőrzése
```bash
az deployment sub list --output table
```


## 💰 Költségbecslés

Fejlesztési terhelés becsült havi költségei:

| Szolgáltatás | Konfiguráció | Becsült költség/hónap |
|--------------|--------------|-----------------------|
| Azure AI Services | S0 szint | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI beágyazások | 50K token | $5-15 |
| Application Insights | Alap monitorozás | $5-15 |
| Log Analytics | 1GB/hónap | $2-5 |
| **Összesen** | | **$42-115** |

## 📚 További források

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Részletes telepítési útmutató hibaelhárítással
- [ARM sablon dokumentáció](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services dokumentáció](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Fájl érvényesítési eredmények

## 🆘 Gyors hibaelhárítás

### Gyakori problémák
- **Hitelesítés**: Futtassa az `az login` parancsot a hitelesítéshez
- **Kvóta korlátok**: Ellenőrizze az OpenAI modell elérhetőségét a célrégióban
- **Névütközések**: Használjon másik `uniqueSuffix` paramétert
- **Jogosultságok**: Győződjön meg róla, hogy a fiók rendelkezik Contributor szerepkörrel az előfizetésben

### Segítség kérése
- Lásd [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) a részletes hibaelhárításhoz
- Ellenőrizze a telepítési naplókat az Azure Portálon
- Látogasson el a [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) oldalra

---

A teljes projekt beállításához tekintse meg a [fő README](../../README.md) fájlt vagy a [projekt bemutatót](../../walkthrough/README.md).

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy téves értelmezésekért.