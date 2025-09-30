<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:26:04+00:00",
  "source_file": "azd/README.md",
  "language_code": "cs"
}
-->
# Azure Developer CLI (azd) Rychlý start

## 🚀 Nasazení pomocí Azure Developer CLI

Tento projekt je nyní plně kompatibilní s Azure Developer CLI (azd) pro automatizované nasazení jak infrastruktury, tak aplikace MCP serveru.

### Požadavky

1. **Nainstalujte Azure Developer CLI**:
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

2. **Přihlaste se do Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Nasazení jedním příkazem

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

### 🔧 Vývojový pracovní postup

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

### 📦 Co se nasazuje

#### **Infrastruktura**
- Resource Group (Skupina prostředků)
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (s modely OpenAI)
- Prostředí pro Container App

#### **Aplikace**
- MCP Server (Container App)
- Aktivní monitorování stavu
- Nastavené proměnné prostředí
- Integrace s Application Insights

### 🌍 Proměnné prostředí

Po nasazení jsou tyto proměnné automaticky k dispozici:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitorování a správa

- **Azure Portal**: Zobrazte všechny prostředky ve své skupině prostředků
- **Application Insights**: Sledujte výkon aplikace a logy
- **Container Apps**: Zobrazte logy a metriky aplikace
- **AI Studio**: Spravujte nasazení modelů OpenAI

### 📋 Řešení problémů

#### **Běžné problémy**

1. **Nepodporovaná lokalita**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Překročené kvóty prostředků**:
   - Zkontrolujte limity svého předplatného v Azure Portal
   - Zkuste jiný region

3. **Problémy s ověřením**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Zobrazení logů nasazení**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Ruční nasazení

Pokud preferujete ruční nasazení, můžete stále využít infrastrukturu ve složce `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Další informace

- [Dokumentace Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentace Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentace Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Upozornění**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Za autoritativní zdroj by měl být považován původní dokument v jeho původním jazyce. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.