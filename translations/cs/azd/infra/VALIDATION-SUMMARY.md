<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:59:13+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "cs"
}
-->
# Azure Developer CLI (azd) Validace infrastruktury

## ✅ **Aktuální stav: PŘIPRAVENO pro azd**

Složka `azd\infra` je nyní **PLNĚ KOMPATIBILNÍ** s nasazením pomocí Azure Developer CLI. Všechny potřebné soubory byly vytvořeny a nakonfigurovány.

### 📁 **Kompletní struktura azd**
```
azd/
├── azure.yaml                       ✅ Main azd configuration
├── infra/
│   ├── main.bicep                   ✅ Subscription-scoped Bicep template
│   ├── main.parameters.json         ✅ Parameters with azd variables
│   ├── modules/
│   │   ├── main-resources.bicep     ✅ Core infrastructure module
│   │   └── container-app-environment.bicep ✅ Container Apps environment
│   ├── azuredeploy.json            📄 Legacy ARM template (backup)
│   ├── azuredeploy.parameters.json  📄 Legacy parameters (backup)
│   ├── ARM-DEPLOYMENT.md           📄 ARM deployment documentation
│   ├── README.md                   📄 Infrastructure overview
│   └── VALIDATION-SUMMARY.md       📝 This file
```

### ✅ **Komponenty Azure Developer CLI**

#### 1. `azure.yaml` ✅ **PŘIPRAVENO**
- **Umístění**: `azd/azure.yaml`
- **Účel**: Hlavní konfigurační soubor azd
- **Stav**: ✅ Vytvořeno a nakonfigurováno
- **Funkce**:
  - Definice služby pro MCP server
  - Konfigurace hostování Container App
  - Mapování proměnných prostředí
  - Nasazovací hooky pro správu životního cyklu

#### 2. **Bicep infrastruktura** ✅ **PŘIPRAVENO**
- **Hlavní šablona**: `main.bicep` (na úrovni předplatného)
- **Parametry**: `main.parameters.json` s proměnnými azd
- **Moduly**: Modulární architektura Bicep
- **Stav**: ✅ Kompletní nasazení infrastruktury

#### 3. **Konfigurace služby** ✅ **PŘIPRAVENO**
- **MCP Server**: Nasazení Container App připraveno
- **Docker**: Existující Dockerfile nakonfigurován
- **Proměnné prostředí**: Integrace Azure AI Services
- **Monitoring**: Připojeno k Application Insights

### 🚀 **Nasazení azd připraveno**

Nyní můžete nasadit pomocí Azure Developer CLI:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **Nasazené zdroje**

Nasazení azd vytvoří:

#### **Infrastruktura** 
- ✅ Resource Group (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ Nasazení modelů OpenAI:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ Prostředí Container App

#### **Aplikace**
- ✅ MCP Server (Container App)
- ✅ Aktivované kontroly stavu
- ✅ Připojený monitoring
- ✅ Nakonfigurované proměnné prostředí

### 📊 **azd vs manuální nasazení**

| Funkce | azd `/azd` | Manuální `/infra` |
|--------|------------|-------------------|
| **Stav** | ✅ Připraveno a kompletní | ✅ Funkční |
| **Šablona** | Moduly Bicep | Moduly Bicep |
| **Nasazení** | Automatizace `azd up` | Manuální skripty |
| **Prostředí** | Automatické proměnné prostředí | Manuální nastavení |
| **Služby** | Container Apps | Pouze infrastruktura |
| **Konfigurace** | Kompletní se službami | Zaměřeno na infrastrukturu |

### 🛠️ **Proměnné prostředí**

azd automaticky nastaví tyto výstupní proměnné:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **Shrnutí validace**

- **azure.yaml**: ✅ Vytvořeno a nakonfigurováno
- **Bicep šablony**: ✅ Kompletní modulární architektura
- **Soubor parametrů**: ✅ Proměnné kompatibilní s azd
- **Definice služby**: ✅ Připraveno pro Container App
- **Konfigurace Dockeru**: ✅ Použití existujícího Dockerfile
- **Proměnné prostředí**: ✅ Integrace Azure AI Services
- **Připraveno pro azd**: ✅ **ANO - PLNĚ KOMPATIBILNÍ**

**Doporučení**: Použijte `azd up` pro kompletní automatizované nasazení, které zahrnuje jak infrastrukturu, tak aplikační služby.

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.