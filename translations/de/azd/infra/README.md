<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:20:00+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "de"
}
-->
# Infrastrukturvorlagen

Dieser Ordner enthält die Vorlagen für die Infrastrukturbereitstellung des MCP Retail Analytics Projekts.

## 📁 Dateiübersicht

| Datei | Beschreibung | Anwendungsfall |
|-------|--------------|----------------|
| `azuredeploy.json` | **ARM-Vorlage** - Bereitstellung auf Abonnementebene | Empfohlen für alle Bereitstellungen |
| `azuredeploy.parameters.json` | **ARM-Parameter** - Statische Konfigurationswerte | Wird mit `azuredeploy.json` verwendet |
| `ARM-DEPLOYMENT.md` | **ARM-Bereitstellungsanleitung** - Detaillierte Anweisungen | Vollständige Bereitstellungsdokumentation |
| `README.md` | **Diese Datei** - Infrastrukturübersicht | Schnelle Referenz |

## 🚀 Bereitstellungsoptionen

### Option 1: Azure CLI (Empfohlen)
Vollständige Bereitstellung mit Erstellung der Ressourcengruppe:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Option 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Option 3: Azure Portal
1. Gehe zu [Azure Portal](https://portal.azure.com)
2. Suche nach "Benutzerdefinierte Vorlage bereitstellen"
3. Lade `azuredeploy.json` hoch
4. Konfiguriere die Parameter und führe die Bereitstellung durch

## 🏗️ Infrastrukturkomponenten

Die ARM-Vorlage stellt die folgende Infrastruktur bereit:

- **Ressourcengruppe**: Container für alle Ressourcen mit konsistenter Namensgebung
- **Log Analytics Workspace**: Zentrale Protokollierung und Überwachung (30 Tage Aufbewahrung)
- **Application Insights**: Leistungsüberwachung für Anwendungen, integriert mit Log Analytics
- **Azure AI Services**: Multi-Service-AI-Hub (S0-Tarif) mit verwalteter Identität
- **OpenAI-Modelle**:
  - `gpt-4o-mini` (120 Kapazität) - Chat- und Abschlussmodell
  - `text-embedding-3-small` (50 Kapazität) - Text-Einbettungen für semantische Suche

## 🔧 Vorlagenkonfiguration

### Parameter
Die ARM-Vorlage akzeptiert die folgenden anpassbaren Parameter:

| Parameter | Standardwert | Beschreibung |
|-----------|--------------|--------------|
| `resourcePrefix` | `mcpretail` | Präfix für alle Ressourcennamen |
| `location` | `westus2` | Azure-Region für die Bereitstellung |
| `uniqueSuffix` | Automatisch generiert | 4-stelliger eindeutiger Bezeichner |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Anzeigename |
| `gptModelCapacity` | `120` | GPT-Modell-Token-Kapazität |
| `embeddingModelCapacity` | `50` | Kapazität des Einbettungsmodells |

### Namenskonvention für Ressourcen
Alle Ressourcen folgen dem Muster: `{type}-{resourcePrefix}-{uniqueSuffix}`

Beispiele:
- Ressourcengruppe: `rg-mcpretail-demo`
- AI-Dienst: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validierung der Vorlage

### Validierung vor der Bereitstellung
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Überprüfung des Bereitstellungsstatus
```bash
az deployment sub list --output table
```


## 💰 Kostenschätzung

Geschätzte monatliche Kosten für Entwicklungsarbeitslasten:

| Dienst | Konfiguration | Geschätzte Kosten/Monat |
|--------|---------------|-------------------------|
| Azure AI Services | S0-Tarif | $15-50 |
| OpenAI GPT-4o-mini | 120K Tokens | $15-30 |
| OpenAI Einbettungen | 50K Tokens | $5-15 |
| Application Insights | Basisüberwachung | $5-15 |
| Log Analytics | 1GB/Monat | $2-5 |
| **Gesamt** | | **$42-115** |

## 📚 Zusätzliche Ressourcen

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detaillierte Bereitstellungsanleitung mit Fehlerbehebung
- [ARM-Vorlagen-Dokumentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services-Dokumentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Validierungsergebnisse der Dateien

## 🆘 Schnelle Fehlerbehebung

### Häufige Probleme
- **Authentifizierung**: Führe `az login` aus, um dich zu authentifizieren
- **Kontingentgrenzen**: Überprüfe die Verfügbarkeit des OpenAI-Modells in der Zielregion
- **Namenskonflikte**: Verwende einen anderen `uniqueSuffix`-Parameter
- **Berechtigungen**: Stelle sicher, dass das Konto die Rolle "Mitwirkender" im Abonnement hat

### Hilfe erhalten
- Siehe [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) für detaillierte Fehlerbehebung
- Überprüfe die Bereitstellungsprotokolle im Azure Portal
- Besuche [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Für die vollständige Projektkonfiguration siehe die [Haupt-README](../../README.md) oder die [Projektanleitung](../../walkthrough/README.md).

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, weisen wir darauf hin, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.