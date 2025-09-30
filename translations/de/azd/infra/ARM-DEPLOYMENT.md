<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:02:52+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "de"
}
-->
# ARM-Template-Bereitstellungsanleitung

Dieses Dokument enthält Anweisungen zur Bereitstellung der MCP Retail Analytics-Infrastruktur mithilfe der ARM-Template.

## 📋 Übersicht

Das `azuredeploy.json` ARM-Template ermöglicht eine vollständige Bereitstellung von:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI-Modellbereitstellungen (GPT-4o-mini, text-embedding-3-small)

## 🚀 Bereitstellungsoptionen

### Option 1: Azure CLI-Bereitstellung

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

### Option 2: PowerShell-Bereitstellung

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

### Option 3: Azure-Portal

1. Gehe zum [Azure-Portal](https://portal.azure.com)
2. Suche nach "Benutzerdefiniertes Template bereitstellen"
3. Klicke auf "Eigenes Template im Editor erstellen"
4. Kopiere und füge den Inhalt von `azuredeploy.json` ein
5. Klicke auf "Speichern" und dann auf "Überprüfen + Erstellen"
6. Fülle die erforderlichen Parameter aus und führe die Bereitstellung durch

## 🔧 Template-Parameter

| Parameter | Typ | Standardwert | Beschreibung |
|-----------|------|-------------|--------------|
| `resourcePrefix` | string | `mcpretail` | Präfix für Ressourcennamen |
| `location` | string | `westus2` | Azure-Region für die Bereitstellung |
| `uniqueSuffix` | string | Automatisch generiert | 4-stelliger eindeutiger Bezeichner |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Anzeigename für das KI-Projekt |
| `aiProjectDescription` | string | Projektbeschreibung | Beschreibung, die in Azure AI Foundry angezeigt wird |
| `gptModelCapacity` | int | `120` | Token-Kapazität für das GPT-Modell |
| `embeddingModelCapacity` | int | `50` | Token-Kapazität für das Embedding-Modell |
| `tags` | object | Standard-Tags | Ressourcentags für Governance |

## 📤 Template-Ausgaben

Das Template liefert die folgenden Ausgaben:

| Ausgabe | Beschreibung |
|---------|--------------|
| `subscriptionId` | Azure-Abonnement-ID |
| `resourceGroupName` | Name der erstellten Resource Group |
| `aiFoundryName` | Name des Azure AI Foundry-Dienstes |
| `foundryEndpoint` | URL des KI-Dienstendpunkts |
| `foundryAccountKey` | Zugriffsschlüssel für den KI-Dienst |
| `deployedModels` | Array der bereitgestellten OpenAI-Modelle |
| `applicationInsightsConnectionString` | Verbindungszeichenfolge für Application Insights |
| `logAnalyticsWorkspaceName` | Name des Log Analytics Workspace |

## 🔍 Verifizierungsbefehle

Nach der Bereitstellung können die Ressourcen überprüft werden:

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

Dieses Projekt bietet sowohl ARM- als auch Bicep-Templates:

### ARM-Template (`azuredeploy.json`)
- ✅ Native Azure Resource Manager-Format
- ✅ Funktioniert überall, wo ARM unterstützt wird
- ✅ Keine zusätzlichen Tools erforderlich
- ❌ Umständlichere JSON-Syntax
- ❌ Schwerer zu lesen und zu warten

### Bicep-Template (`main.bicep`)
- ✅ Moderne, übersichtliche Syntax
- ✅ Bessere Tools und IntelliSense
- ✅ Einfacher zu lesen und zu warten
- ✅ Validierung zur Kompilierungszeit
- ❌ Erfordert Bicep CLI
- ❌ Zusätzlicher Build-Schritt

**Empfehlung**: Verwende Bicep-Templates (`main.bicep`) für die Entwicklung und das ARM-Template (`azuredeploy.json`) für Szenarien, die reines ARM-JSON erfordern.

## 🔧 Anpassung

### Hinzufügen benutzerdefinierter Ressourcen

Um zusätzliche Ressourcen zum ARM-Template hinzuzufügen:

1. Füge die Ressourcendefinition zum `resources`-Array des verschachtelten Templates hinzu
2. Ergänze neue Parameter im Abschnitt `parameters`
3. Füge bei Bedarf entsprechende Ausgaben hinzu
4. Aktualisiere die Parameterdatei mit Standardwerten

### Beispiel: Hinzufügen eines Storage Accounts

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

## 🐛 Fehlerbehebung

### Häufige Probleme

#### 1. Template-Validierungsfehler
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Ressourcennamenskonflikte
- Stelle sicher, dass `uniqueSuffix` wirklich eindeutig ist
- Verwende die Funktion `uniqueString()` für automatische Generierung
- Überprüfe vorhandene Ressourcen in der Zielregion

#### 3. Quotenbeschränkungen
- Überprüfe die Verfügbarkeit von OpenAI-Modellen in der Zielregion
- Prüfe Abonnementquoten für KI-Dienste
- Ziehe andere Regionen in Betracht, falls Limits erreicht sind

#### 4. Berechtigungsprobleme
- Stelle sicher, dass das Konto die Rolle "Mitwirkender" im Abonnement hat
- Überprüfe, ob das Abonnement für KI-Dienste aktiviert ist
- Verifiziere die Registrierung von Ressourcendiensten

### Debugging-Befehle

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

## 🔐 Sicherheitsüberlegungen

### Zugriffskontrolle
- Der KI-Dienst verwendet eine verwaltete Identität für sicheren Zugriff
- Die Resource Group bietet eine Grenze für RBAC
- Application Insights hat separate Zugriffskontrollen

### Netzwerksicherheit
- Öffentlicher Netzwerkzugriff ist standardmäßig aktiviert
- Ziehe private Endpunkte für Produktionsumgebungen in Betracht
- Netzwerk-ACLs können für zusätzliche Sicherheit konfiguriert werden

### Schlüsselverwaltung
- KI-Dienstschlüssel werden automatisch generiert
- Verwende Azure Key Vault für Produktionsgeheimnisse
- Drehe Schlüssel regelmäßig für mehr Sicherheit

## 📚 Nächste Schritte

Nach erfolgreicher Bereitstellung:

1. **Umgebungsvariablen konfigurieren**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP-Server starten**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Integration testen**:
   - Öffne VS Code mit dem Projekt
   - Konfiguriere MCP-Server in `.vscode/mcp.json`
   - Teste KI-Chat mit Abfragen zu Retail-Daten

4. **Leistung überwachen**:
   - Betrachte Metriken in Application Insights
   - Überprüfe Protokolle im Log Analytics Workspace
   - Richte Warnungen für wichtige Ereignisse ein

---

Weitere Informationen findest du im [Haupt-README](../README.md) oder im [QUICKSTART-Leitfaden](../QUICKSTART.md).

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.