<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:26:16+00:00",
  "source_file": "azd/README.md",
  "language_code": "sk"
}
-->
# Rýchly štart s Azure Developer CLI (azd)

## 🚀 Nasadenie pomocou Azure Developer CLI

Tento projekt je teraz plne kompatibilný s Azure Developer CLI (azd) pre automatizované nasadenie infraštruktúry aj aplikácie MCP servera.

### Predpoklady

1. **Nainštalujte Azure Developer CLI**:
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

2. **Prihláste sa do Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Nasadenie jedným príkazom

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

### 🔧 Vývojový pracovný postup

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

### 📦 Čo sa nasadzuje

#### **Infraštruktúra**
- Resource Group (Skupina zdrojov)
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (s modelmi OpenAI)
- Prostredie pre Container App

#### **Aplikácia**
- MCP Server (Container App)
- Povolené monitorovanie stavu
- Nastavené premenné prostredia
- Integrácia s Application Insights

### 🌍 Premenné prostredia

Po nasadení sú tieto premenné automaticky dostupné:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitorovanie a správa

- **Azure Portal**: Zobrazenie všetkých zdrojov vo vašej skupine zdrojov
- **Application Insights**: Monitorovanie výkonu aplikácie a logov
- **Container Apps**: Zobrazenie logov a metrík aplikácie
- **AI Studio**: Správa nasadení modelov OpenAI

### 📋 Riešenie problémov

#### **Bežné problémy**

1. **Nepodporovaná lokalita**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Prekročené kvóty zdrojov**:
   - Skontrolujte limity vášho predplatného v Azure Portal
   - Skúste inú oblasť

3. **Problémy s autentifikáciou**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Zobrazenie logov nasadenia**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatíva: Manuálne nasadenie

Ak preferujete manuálne nasadenie, môžete použiť infraštruktúru v priečinku `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Viac informácií

- [Dokumentácia Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentácia Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentácia Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.