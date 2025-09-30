<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:53+00:00",
  "source_file": "azd/README.md",
  "language_code": "hu"
}
-->
# Azure Developer CLI (azd) Gyorsindítás

## 🚀 Telepítés az Azure Developer CLI-vel

Ez a projekt most már teljes mértékben kompatibilis az Azure Developer CLI-vel (azd), amely lehetővé teszi az infrastruktúra és az MCP szerveralkalmazás automatizált telepítését.

### Előfeltételek

1. **Azure Developer CLI telepítése**:
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **Bejelentkezés az Azure-ba**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Egyparancsos telepítés

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 Fejlesztési munkafolyamat

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 Mi kerül telepítésre?

#### **Infrastruktúra**
- Erőforráscsoport
- Log Analytics Munkaterület  
- Application Insights
- Azure AI Szolgáltatások (OpenAI modellekkel)
- Konténeralkalmazás-környezet

#### **Alkalmazás**
- MCP szerver (Konténeralkalmazás)
- Egészségfigyelés engedélyezve
- Környezeti változók konfigurálva
- Application Insights integráció

### 🌍 Környezeti változók

A telepítés után ezek a változók automatikusan elérhetők lesznek:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Felügyelet és monitorozás

- **Azure Portal**: Az összes erőforrás megtekintése az erőforráscsoportban
- **Application Insights**: Az alkalmazás teljesítményének és naplóinak monitorozása
- **Konténeralkalmazások**: Az alkalmazás naplóinak és metrikáinak megtekintése
- **AI Stúdió**: OpenAI modelltelepítések kezelése

### 📋 Hibakeresés

#### **Gyakori problémák**

1. **Nem támogatott helyszín**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Erőforráskvóták túllépése**:
   - Ellenőrizze az előfizetési korlátokat az Azure Portalon
   - Próbáljon ki egy másik régiót

3. **Hitelesítési problémák**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Telepítési naplók megtekintése**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatíva: Kézi telepítés

Ha inkább kézi telepítést szeretne, az `/infra` mappában található infrastruktúrát is használhatja:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 További információ

- [Azure Developer CLI dokumentáció](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Konténeralkalmazások dokumentáció](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Szolgáltatások dokumentáció](https://docs.microsoft.com/azure/ai-services/)

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.