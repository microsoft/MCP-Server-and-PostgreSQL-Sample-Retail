<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:59:25+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "sk"
}
-->
# Azure Developer CLI (azd) Overenie infraštruktúry

## ✅ **Aktuálny stav: PRIPRAVENÉ pre azd**

Priečinok `azd\infra` je teraz **PLNE KOMPATIBILNÝ** s nasadením cez Azure Developer CLI. Všetky potrebné súbory boli vytvorené a nakonfigurované.

### 📁 **Kompletná štruktúra azd**
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

#### 1. `azure.yaml` ✅ **PRIPRAVENÉ**
- **Umiestnenie**: `azd/azure.yaml`
- **Účel**: Hlavný konfiguračný súbor azd
- **Stav**: ✅ Vytvorený a nakonfigurovaný
- **Funkcie**:
  - Definícia služby pre MCP server
  - Konfigurácia hostingu pre Container App
  - Mapovanie environmentálnych premenných
  - Nasadzovacie háky pre správu životného cyklu

#### 2. **Bicep infraštruktúra** ✅ **PRIPRAVENÉ**
- **Hlavná šablóna**: `main.bicep` (na úrovni predplatného)
- **Parametre**: `main.parameters.json` s premennými azd
- **Moduly**: Modulárna architektúra Bicep
- **Stav**: ✅ Kompletné nasadenie infraštruktúry

#### 3. **Konfigurácia služby** ✅ **PRIPRAVENÉ**
- **MCP Server**: Nasadenie Container App pripravené
- **Docker**: Existujúci Dockerfile nakonfigurovaný
- **Environmentálne premenné**: Integrácia Azure AI Services
- **Monitorovanie**: Pripojené Application Insights

### 🚀 **Pripravené na nasadenie cez azd**

Teraz môžete nasadiť pomocou Azure Developer CLI:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **Nasadené zdroje**

Nasadenie cez azd vytvorí:

#### **Infraštuktúra** 
- ✅ Resource Group (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ Nasadenia modelov OpenAI:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ Prostredie pre Container App

#### **Aplikácia**
- ✅ MCP Server (Container App)
- ✅ Povolené kontroly zdravia
- ✅ Pripojené monitorovanie
- ✅ Nakonfigurované environmentálne premenné

### 📊 **azd vs Manuálne nasadenie**

| Funkcia | azd `/azd` | Manuálne `/infra` |
|---------|------------|-------------------|
| **Stav** | ✅ Pripravené a kompletné | ✅ Funkčné |
| **Šablóna** | Moduly Bicep | Moduly Bicep |
| **Nasadenie** | Automatizácia `azd up` | Manuálne skripty |
| **Prostredie** | Automatické premenné | Manuálne nastavenie |
| **Služby** | Container Apps | Len infraštruktúra |
| **Konfigurácia** | Kompletná so službami | Zameraná na infraštruktúru |

### 🛠️ **Environmentálne premenné**

azd automaticky nastaví tieto výstupné premenné:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **Zhrnutie overenia**

- **azure.yaml**: ✅ Vytvorený a nakonfigurovaný
- **Bicep šablóny**: ✅ Kompletná modulárna architektúra
- **Súbor parametrov**: ✅ Premenné kompatibilné s azd
- **Definícia služby**: ✅ Pripravené pre Container App
- **Docker konfigurácia**: ✅ Používa existujúci Dockerfile
- **Environmentálne premenné**: ✅ Integrované Azure AI Services
- **Pripravené pre azd**: ✅ **ÁNO - PLNE KOMPATIBILNÉ**

**Odporúčanie**: Použite `azd up` pre kompletné automatizované nasadenie vrátane infraštruktúry a aplikačných služieb.

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.