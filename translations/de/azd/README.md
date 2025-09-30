<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:19:25+00:00",
  "source_file": "azd/README.md",
  "language_code": "de"
}
-->
# Azure Developer CLI (azd) Schnellstart

## 🚀 Bereitstellung mit Azure Developer CLI

Dieses Projekt ist vollständig kompatibel mit Azure Developer CLI (azd) für die automatisierte Bereitstellung sowohl der Infrastruktur als auch der MCP-Serveranwendung.

### Voraussetzungen

1. **Azure Developer CLI installieren**:
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

2. **Bei Azure anmelden**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Bereitstellung mit einem Befehl

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

### 🔧 Entwicklungsworkflow

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

### 📦 Was wird bereitgestellt?

#### **Infrastruktur**
- Ressourcengruppe
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (mit OpenAI-Modellen)
- Container App-Umgebung

#### **Anwendung**
- MCP-Server (Container App)
- Aktivierte Gesundheitsüberwachung
- Konfigurierte Umgebungsvariablen
- Integration mit Application Insights

### 🌍 Umgebungsvariablen

Nach der Bereitstellung sind diese Variablen automatisch verfügbar:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Überwachung & Verwaltung

- **Azure-Portal**: Alle Ressourcen in Ihrer Ressourcengruppe anzeigen
- **Application Insights**: Anwendungsleistung und Logs überwachen
- **Container Apps**: Anwendungslogs und Metriken anzeigen
- **AI Studio**: OpenAI-Modellbereitstellungen verwalten

### 📋 Fehlerbehebung

#### **Häufige Probleme**

1. **Nicht unterstützter Standort**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Ressourcenquoten überschritten**:
   - Überprüfen Sie Ihre Abonnementlimits im Azure-Portal
   - Versuchen Sie eine andere Region

3. **Authentifizierungsprobleme**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Bereitstellungslogs anzeigen**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternative: Manuelle Bereitstellung

Falls Sie die manuelle Bereitstellung bevorzugen, können Sie weiterhin die Infrastruktur im Ordner `/infra` verwenden:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Mehr erfahren

- [Azure Developer CLI Dokumentation](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Dokumentation](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services Dokumentation](https://docs.microsoft.com/azure/ai-services/)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.