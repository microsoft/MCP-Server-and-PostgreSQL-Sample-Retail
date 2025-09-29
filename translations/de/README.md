<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T17:35:30+00:00",
  "source_file": "README.md",
  "language_code": "de"
}
-->
# MCP-Server und PostgreSQL-Beispiel - Analyse des Einzelhandelsumsatzes

## Lernen Sie MCP mit Datenbankintegration durch praktische Beispiele

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Folgen Sie diesen Schritten, um mit diesen Ressourcen zu beginnen:

1. **Repository forken**: Klicken Sie [hier, um zu forken](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Repository klonen**: `git clone https://github.com/IHR-BENUTZERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Treten Sie dem Azure AI Foundry Discord bei**: [Treffen Sie Experten und andere Entwickler](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Mehrsprachige Unterstützung

#### Unterstützt durch GitHub Action (Automatisiert & Immer aktuell)

[Französisch](../fr/README.md) | [Spanisch](../es/README.md) | [Deutsch](./README.md) | [Russisch](../ru/README.md) | [Arabisch](../ar/README.md) | [Persisch (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinesisch (vereinfacht)](../zh/README.md) | [Chinesisch (traditionell, Macau)](../mo/README.md) | [Chinesisch (traditionell, Hongkong)](../hk/README.md) | [Chinesisch (traditionell, Taiwan)](../tw/README.md) | [Japanisch](../ja/README.md) | [Koreanisch](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalisch](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugiesisch (Portugal)](../pt/README.md) | [Portugiesisch (Brasilien)](../br/README.md) | [Italienisch](../it/README.md) | [Polnisch](../pl/README.md) | [Türkisch](../tr/README.md) | [Griechisch](../el/README.md) | [Thailändisch](../th/README.md) | [Schwedisch](../sv/README.md) | [Dänisch](../da/README.md) | [Norwegisch](../no/README.md) | [Finnisch](../fi/README.md) | [Niederländisch](../nl/README.md) | [Hebräisch](../he/README.md) | [Vietnamesisch](../vi/README.md) | [Indonesisch](../id/README.md) | [Malaiisch](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungarisch](../hu/README.md) | [Tschechisch](../cs/README.md) | [Slowakisch](../sk/README.md) | [Rumänisch](../ro/README.md) | [Bulgarisch](../bg/README.md) | [Serbisch (kyrillisch)](../sr/README.md) | [Kroatisch](../hr/README.md) | [Slowenisch](../sl/README.md) | [Ukrainisch](../uk/README.md) | [Birmanisch (Myanmar)](../my/README.md)

**Falls Sie zusätzliche Übersetzungen wünschen, finden Sie die unterstützten Sprachen [hier](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Einführung

Dieses Beispiel zeigt, wie man einen umfassenden **Model Context Protocol (MCP)-Server** erstellt und bereitstellt, der KI-Assistenten sicheren und intelligenten Zugriff auf Einzelhandelsumsatzdaten über PostgreSQL bietet. Das Projekt demonstriert Funktionen auf Unternehmensniveau, darunter **Row Level Security (RLS)**, **semantische Suchfunktionen** und **Azure AI-Integration** für reale Szenarien der Einzelhandelsanalyse.

**Wichtige Anwendungsfälle:**
- **KI-gestützte Verkaufsanalyse**: Ermöglichen Sie KI-Assistenten, Einzelhandelsumsatzdaten durch natürliche Sprache abzufragen und zu analysieren
- **Sicherer Multi-Tenant-Zugriff**: Demonstrieren Sie die Implementierung von Row Level Security, bei der verschiedene Filialleiter nur auf die Daten ihrer eigenen Filiale zugreifen können
- **Semantische Produktsuche**: Zeigen Sie KI-gestützte Produktsuche mit Text-Embeddings
- **Unternehmensintegration**: Veranschaulichen Sie, wie MCP-Server mit Azure-Diensten und PostgreSQL-Datenbanken integriert werden können

**Ideal für:**
- Entwickler, die lernen möchten, MCP-Server mit Datenbankintegration zu erstellen
- Dateningenieure, die sichere Multi-Tenant-Analyselösungen implementieren
- KI-Anwendungsentwickler, die mit Einzelhandels- oder E-Commerce-Daten arbeiten
- Alle, die daran interessiert sind, KI-Assistenten mit Unternehmensdatenbanken zu kombinieren

## Treten Sie der Azure AI Foundry Discord Community bei
Teilen Sie Ihre Erfahrungen mit MCP und treffen Sie Experten und Produktgruppen

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# MCP-Server für Verkaufsanalysen

Ein Model Context Protocol (MCP)-Server, der umfassenden Zugriff auf Kundendatenbanken für das Zava Retail DIY-Geschäft bietet. Dieser Server ermöglicht KI-Assistenten, Einzelhandelsumsatzdaten über eine sichere, schema-basierte Schnittstelle abzufragen und zu analysieren.

## 📚 Vollständige Implementierungsanleitung

Für eine detaillierte Aufschlüsselung, wie diese Lösung erstellt wird und wie ähnliche MCP-Server implementiert werden können, lesen Sie unsere umfassende **[Beispiel-Durchführung](Sample_Walkthrough.md)**. Diese Anleitung bietet:

- **Architektur-Analyse**: Komponentenanalyse und Designmuster
- **Schritt-für-Schritt-Erstellung**: Von der Projektkonfiguration bis zur Bereitstellung
- **Code-Erklärung**: Detaillierte Beschreibung der MCP-Server-Implementierung
- **Erweiterte Funktionen**: Row Level Security, semantische Suche und Überwachung
- **Best Practices**: Sicherheits-, Leistungs- und Entwicklungsrichtlinien
- **Fehlerbehebung**: Häufige Probleme und Lösungen

Ideal für Entwickler, die die Implementierungsdetails verstehen und ähnliche Lösungen erstellen möchten.

## 🤖 Was ist MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** ist ein offener Standard, der es KI-Assistenten ermöglicht, sicher auf externe Datenquellen und Tools in Echtzeit zuzugreifen. Es fungiert als Brücke, die es KI-Modellen erlaubt, mit Datenbanken, APIs, Dateisystemen und anderen Ressourcen zu interagieren, während Sicherheit und Kontrolle gewährleistet bleiben.

### Hauptvorteile:
- **Echtzeit-Datenzugriff**: KI-Assistenten können Live-Datenbanken und APIs abfragen
- **Sichere Integration**: Kontrollierter Zugriff mit Authentifizierung und Berechtigungen  
- **Tool-Erweiterbarkeit**: Benutzerdefinierte Funktionen für KI-Assistenten hinzufügen
- **Standardisiertes Protokoll**: Funktioniert plattformübergreifend mit verschiedenen KI-Tools

### Neu bei MCP?

Falls Sie neu beim Model Context Protocol sind, empfehlen wir Ihnen, mit den umfassenden Einsteigerressourcen von Microsoft zu beginnen:

**📖 [MCP für Anfänger Leitfaden](https://aka.ms/mcp-for-beginners)**

Diese Ressource bietet:
- Einführung in MCP-Konzepte und Architektur
- Schritt-für-Schritt-Tutorials zum Aufbau Ihres ersten MCP-Servers
- Best Practices für die MCP-Entwicklung
- Integrationsbeispiele mit beliebten KI-Plattformen
- Community-Ressourcen und Unterstützung

Sobald Sie die Grundlagen verstanden haben, kehren Sie hierher zurück, um diese fortgeschrittene Einzelhandelsanalyse-Implementierung zu erkunden!

## 📚 Umfassender Lernleitfaden: /walkthrough

Dieses Repository enthält eine vollständige **12-Modul-Lern-Durchführung**, die dieses MCP-Einzelhandelsserver-Beispiel in leicht verständliche, schrittweise Lektionen zerlegt. Die Durchführung verwandelt dieses funktionierende Beispiel in eine umfassende Bildungsressource, die perfekt für Entwickler geeignet ist, die lernen möchten, wie man produktionsreife MCP-Server mit Datenbankintegration erstellt.

### Was Sie lernen werden

Die Durchführung deckt alles ab, von grundlegenden MCP-Konzepten bis hin zur fortgeschrittenen Produktionsbereitstellung, einschließlich:

- **MCP-Grundlagen**: Verständnis des Model Context Protocol und seiner realen Anwendungen
- **Datenbankintegration**: Sichere PostgreSQL-Konnektivität mit Row Level Security implementieren
- **KI-gestützte Funktionen**: Semantische Suchfunktionen mit Azure OpenAI-Embeddings hinzufügen
- **Sicherheitsimplementierung**: Authentifizierung, Autorisierung und Datenisolierung auf Unternehmensniveau
- **Tool-Entwicklung**: Komplexe MCP-Tools für Datenanalyse und Business Intelligence erstellen
- **Testen & Debuggen**: Umfassende Teststrategien und Debugging-Techniken
- **VS Code-Integration**: KI-Chat für natürliche Sprachdatenbankabfragen konfigurieren
- **Produktionsbereitstellung**: Containerisierung, Skalierung und Cloud-Bereitstellungsstrategien
- **Überwachung & Beobachtbarkeit**: Application Insights, Logging und Leistungsüberwachung

### Überblick über den Lernpfad

Die Durchführung folgt einer progressiven Lernstruktur, die für Entwickler aller Erfahrungsstufen geeignet ist:

| Modul | Schwerpunkt | Beschreibung | Zeitaufwand |
|-------|-------------|--------------|-------------|
| **[00-Einführung](walkthrough/00-Introduction/README.md)** | Grundlagen | MCP-Konzepte, Zava Retail Fallstudie, Architekturüberblick | 30 Minuten |
| **[01-Architektur](walkthrough/01-Architecture/README.md)** | Designmuster | Technische Architektur, Schichtendesign, Systemkomponenten | 45 Minuten |
| **[02-Sicherheit](walkthrough/02-Security/README.md)** | Unternehmenssicherheit | Azure-Authentifizierung, Row Level Security, Multi-Tenant-Isolierung | 60 Minuten |
| **[03-Einrichtung](walkthrough/03-Setup/README.md)** | Umgebung | Docker-Einrichtung, Azure CLI, Projektkonfiguration, Validierung | 45 Minuten |
| **[04-Datenbank](walkthrough/04-Database/README.md)** | Datenebene | PostgreSQL-Schema, pgvector, RLS-Richtlinien, Beispieldaten | 60 Minuten |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Kernimplementierung | FastMCP-Framework, Datenbankintegration, Verbindungsmanagement | 90 Minuten |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Tool-Entwicklung | MCP-Tool-Erstellung, Abfragevalidierung, Business Intelligence-Funktionen | 75 Minuten |
| **[07-Semantische-Suche](walkthrough/07-Semantic-Search/README.md)** | KI-Integration | Azure OpenAI-Embeddings, Vektorsuche, hybride Suchstrategien | 60 Minuten |
| **[08-Testen](walkthrough/08-Testing/README.md)** | Qualitätssicherung | Unit-Tests, Integrationstests, Leistungstests, Debugging | 75 Minuten |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Entwicklungserfahrung | VS Code-Konfiguration, KI-Chat-Integration, Debugging-Workflows | 45 Minuten |
| **[10-Bereitstellung](walkthrough/10-Deployment/README.md)** | Produktionsreife | Containerisierung, Azure Container Apps, CI/CD-Pipelines, Skalierung | 90 Minuten |
| **[11-Überwachung](walkthrough/11-Monitoring/README.md)** | Beobachtbarkeit | Application Insights, strukturiertes Logging, Leistungsmetriken | 60 Minuten |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Produktions-Exzellenz | Sicherheitsoptimierung, Leistungsoptimierung, Unternehmensmuster | 45 Minuten |

**Gesamte Lernzeit**: ~12-15 Stunden umfassendes praktisches Lernen

### 🎯 So nutzen Sie die Durchführung

**Für Anfänger**:
1. Beginnen Sie mit [Modul 00: Einführung](walkthrough/00-Introduction/README.md), um MCP-Grundlagen zu verstehen
2. Folgen Sie den Modulen der Reihe nach für ein vollständiges Lernerlebnis
3. Jedes Modul baut auf vorherigen Konzepten auf und enthält praktische Übungen

**Für erfahrene Entwickler**:
1. Überprüfen Sie die [Hauptübersicht der Durchführung](walkthrough/README.md) für eine Zusammenfassung aller Module
2. Springen Sie zu spezifischen Modulen, die Sie interessieren (z. B. Modul 07 für KI-Integration)
3. Nutzen Sie einzelne Module als Referenzmaterial für Ihre eigenen Projekte

**Für Produktionsimplementierung**:
1. Konzentrieren Sie sich auf Module 02 (Sicherheit), 10 (Bereitstellung) und 11 (Überwachung)
2. Überprüfen Sie Modul 12 (Best Practices) für Unternehmensrichtlinien
3. Verwenden Sie die Codebeispiele als produktionsreife Vorlagen

### 🚀 Schnellstart-Optionen

**Option 1: Vollständiger Lernpfad** (Empfohlen für Anfänger)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Option 2: Praktische Implementierung** (Direkt mit dem Aufbau beginnen)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Option 3: Produktionsfokus** (Bereitstellung auf Unternehmensebene)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Lernvoraussetzungen

**Empfohlener Hintergrund**:
- Grundlegende Erfahrung mit Python-Programmierung
- Vertrautheit mit REST-APIs und Datenbanken
- Allgemeines Verständnis von KI/ML-Konzepten
- Grundkenntnisse in der Kommandozeile und Docker

**Nicht erforderlich (aber hilfreich)**:
- Vorherige MCP-Erfahrung (wir behandeln dies von Grund auf)
- Erfahrung mit Azure Cloud (wir bieten Schritt-für-Schritt-Anleitungen)
- Fortgeschrittene PostgreSQL-Kenntnisse (wir erklären die Konzepte bei Bedarf)

### 💡 Lerntipps

1. **Praktischer Ansatz**: Jedes Modul enthält funktionierende Codebeispiele, die Sie ausführen und anpassen können
2. **Progressive Komplexität**: Die Konzepte bauen sich schrittweise von einfach bis fortgeschritten auf
3. **Praxisbezug**: Alle Beispiele verwenden realistische Szenarien aus dem Einzelhandel
4. **Produktionsreife**: Die Codebeispiele sind für den tatsächlichen Einsatz in der Produktion konzipiert
5. **Community-Unterstützung**: Treten Sie unserer [Discord-Community](https://discord.com/invite/ByRwuEEgH4) bei, um Hilfe und Diskussionen zu erhalten

### 🔗 Verwandte Ressourcen

- **[MCP für Anfänger](https://aka.ms/mcp-for-beginners)**: Essentielle Hintergrundlektüre
- **[Beispiel-Durchlauf](Sample_Walkthrough.md)**: Technische Übersicht auf hoher Ebene
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloud-Plattform, die in den Beispielen verwendet wird
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python-Framework für MCP-Implementierungen

**Bereit zum Lernen?** Beginnen Sie mit **[Modul 00: Einführung](walkthrough/00-Introduction/README.md)** oder erkunden Sie die **[komplette Übersicht des Durchlaufs](walkthrough/README.md)**.

## Voraussetzungen

1. Docker Desktop installiert
2. Git installiert
3. **Azure CLI**: Installieren und authentifizieren Sie sich mit Azure CLI
4. Zugriff auf das OpenAI-Modell `text-embedding-3-small` und optional das Modell `gpt-4o-mini`.

## Erste Schritte

Öffnen Sie ein Terminalfenster und führen Sie die folgenden Befehle aus:

1. Authentifizieren Sie sich mit Azure CLI

    ```bash
    az login
    ```

2. Klonen Sie das Repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Wechseln Sie in das Projektverzeichnis

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure-Ressourcen bereitstellen

Führen Sie die folgenden Skripte aus, um die Bereitstellung der für den MCP-Server benötigten Azure-Ressourcen zu automatisieren.

Die Bereitstellungsskripte stellen automatisch das Modell `text-embedding-3-small` bereit. Während der Bereitstellung haben Sie die Möglichkeit, auch das Modell `gpt-4o-mini` einzuschließen. Beachten Sie, dass `gpt-4o-mini` **nicht erforderlich** für dieses Projekt ist und nur für mögliche zukünftige Erweiterungen enthalten ist.

**Wählen Sie das Skript für Ihre Plattform:**

#### Windows (PowerShell)

```powershell
# Run from the project root directory
cd infra && ./deploy.ps1
```

#### macOS/Linux (Bash)

```bash
# Run from the project root directory
cd infra && ./deploy.sh
```

## MCP-Server ausführen

Die einfachste Möglichkeit, den gesamten Stack (PostgreSQL + MCP-Server) auszuführen, ist die Verwendung von Docker Compose:

### Stack starten

```bash
# Start PostgreSQL and MCP Server
docker compose up -d

# View logs
docker compose logs -f

# View MCP Server Logs
docker compose logs -f mcp_server

# View the PostgreSQL Logs
docker compose logs -f pg17

# Stop the stack
docker compose down -v
```

## Nutzung

Die folgenden Schritte gehen davon aus, dass Sie die integrierte VS Code-Unterstützung für den MCP-Server verwenden.

1. Öffnen Sie das Projekt in VS Code. Führen Sie im Terminal aus:

    ```bash
    code .
    ```

2. Starten Sie einen oder mehrere MCP-Server mit den Konfigurationen in `.vscode/mcp.json`. Die Datei enthält vier verschiedene Serverkonfigurationen, die jeweils eine andere Rolle eines Filialleiters darstellen:

   - Jede Konfiguration verwendet eine eindeutige RLS (Row Level Security)-Benutzer-ID
   - Diese Benutzer-IDs simulieren verschiedene Identitäten von Filialleitern, die auf die Datenbank zugreifen
   - Das RLS-System beschränkt den Datenzugriff basierend auf dem zugewiesenen Standort des Filialleiters
   - Dies spiegelt reale Szenarien wider, in denen sich Filialleiter mit unterschiedlichen Entra-ID-Konten anmelden

    ```json
    {
        "servers": {
            "zava-sales-analysis-headoffice": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "00000000-0000-0000-0000-000000000000"}
            },
            "zava-sales-analysis-seattle": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "f47ac10b-58cc-4372-a567-0e02b2c3d479"}
            },
            "zava-sales-analysis-redmond": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "e7f8a9b0-c1d2-3e4f-5678-90abcdef1234"}
            },
            "zava-sales-analysis-online": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2"}
            }
        },
        "inputs": []
    }
    ```

### VS Code AI Chat öffnen

1. Öffnen Sie den AI-Chat-Modus in VS Code
2. Geben Sie **#zava** ein und wählen Sie einen der gestarteten MCP-Server aus
3. Stellen Sie Fragen zu den Verkaufsdaten – siehe Beispielanfragen unten

### Beispielanfragen

1. Zeige die Top 20 Produkte nach Umsatz
1. Zeige Verkäufe nach Filiale
1. Wie waren die Verkäufe des letzten Quartals nach Kategorie?
1. Welche Produkte verkaufen wir, die "Behältern für Farbe" ähneln?

## Funktionen

- **Zugriff auf mehrere Tabellen-Schemata**: Abrufen von Schemata für mehrere Datenbanktabellen in einer einzigen Anfrage
- **Sichere Abfrageausführung**: Ausführen von PostgreSQL-Abfragen mit Unterstützung für Row Level Security (RLS)
- **Echtzeitdaten**: Zugriff auf aktuelle Verkaufs-, Bestands- und Kundendaten
- **Datum-/Zeit-Werkzeuge**: Abrufen aktueller UTC-Zeitstempel für zeitkritische Analysen
- **Flexible Bereitstellung**: Unterstützt HTTP-Server-Modus

## Unterstützte Tabellen

Der Server bietet Zugriff auf die folgenden Datenbanktabellen des Einzelhandels:

- `retail.customers` - Kundeninformationen und Profile
- `retail.stores` - Filialstandorte und Details
- `retail.categories` - Produktkategorien und Hierarchien
- `retail.product_types` - Klassifikationen von Produkttypen
- `retail.products` - Produktkatalog und Spezifikationen
- `retail.orders` - Kundenbestellungen und Transaktionen
- `retail.order_items` - Einzelne Artikel innerhalb von Bestellungen
- `retail.inventory` - Aktuelle Bestandsdaten und Lagerbestände

## Verfügbare Werkzeuge

### `get_multiple_table_schemas`

Abrufen von Datenbankschemata für mehrere Tabellen in einer einzigen Anfrage.

**Parameter:**

- `table_names` (list[str]): Liste gültiger Tabellennamen aus den oben unterstützten Tabellen

**Rückgabe:** Zusammengefügte Schema-Strings für die angeforderten Tabellen

### `execute_sales_query`

Ausführen von PostgreSQL-Abfragen gegen die Verkaufsdatenbank mit Row Level Security.

**Parameter:**

- `postgresql_query` (str): Eine korrekt formulierte PostgreSQL-Abfrage

**Rückgabe:** Abfrageergebnisse, formatiert als String (auf 20 Zeilen begrenzt für bessere Lesbarkeit)

**Best Practices:**

- Rufen Sie immer zuerst die Tabellenschemata ab
- Verwenden Sie exakte Spaltennamen aus den Schemata
- Verbinden Sie verwandte Tabellen für umfassende Analysen
- Aggregieren Sie Ergebnisse, wenn angemessen
- Begrenzen Sie die Ausgabe für bessere Lesbarkeit

### `get_current_utc_date`

Abrufen des aktuellen UTC-Datums und der Uhrzeit im ISO-Format.

**Rückgabe:** Aktuelles UTC-Datum/Uhrzeit im ISO-Format (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Durchführen einer semantischen Suche nach Produkten basierend auf Benutzeranfragen.

**Rückgabe:** Eine Liste von Produkten, die den Suchkriterien entsprechen

**Parameter:**

- `query` (str): Die Suchanfrage als String

**Rückgabe:** Eine Liste von Produkten, die den Suchkriterien entsprechen

## Sicherheitsfunktionen

### Row Level Security (RLS)

Der Server implementiert Row Level Security, um sicherzustellen, dass Benutzer nur auf Daten zugreifen, zu denen sie berechtigt sind:

- **HTTP-Modus**: Verwendet den Header `x-rls-user-id`, um den anfragenden Benutzer zu identifizieren

- **Standard-Fallback**: Verwendet eine Platzhalter-UUID, wenn keine Benutzer-ID angegeben ist

#### Filialspezifische RLS-Benutzer-IDs

Jeder Standort von Zava Retail hat eine eindeutige RLS-Benutzer-ID, die bestimmt, auf welche Daten der Benutzer zugreifen kann:

| Filialstandort | RLS-Benutzer-ID | Beschreibung |
|----------------|-----------------|--------------|
| **Globaler Zugriff** | `00000000-0000-0000-0000-000000000000` | Standard-Fallback – Zugriff auf alle Filialen |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Daten der Zava Retail-Filiale in Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Daten der Zava Retail-Filiale in Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Daten der Zava Retail-Filiale in Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Daten der Zava Retail-Filiale in Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Daten der Zava Retail-Filiale in Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Daten der Zava Retail-Filiale in Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Daten der Zava Retail-Filiale in Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Daten des Zava Retail-Online-Shops |

#### RLS-Implementierung

Wenn sich ein Benutzer mit der spezifischen RLS-Benutzer-ID einer Filiale verbindet, sieht er nur:

- Kunden, die mit dieser Filiale verbunden sind
- Bestellungen, die an diesem Standort aufgegeben wurden
- Bestandsdaten für diese spezifische Filiale
- Filialspezifische Verkaufs- und Leistungskennzahlen

Dies gewährleistet die Datenisolierung zwischen verschiedenen Filialstandorten, während ein einheitliches Datenbankschema beibehalten wird.

## Architektur

### Anwendungskontext

Der Server verwendet einen verwalteten Anwendungskontext mit:

- **Datenbank-Verbindungspool**: Effizientes Verbindungsmanagement für den HTTP-Modus
- **Lebenszyklus-Management**: Ordnungsgemäße Ressourcenbereinigung beim Herunterfahren
- **Typensicherheit**: Stark typisierter Kontext mit der `AppContext`-Dataclass

### Anfragekontext

- **Header-Extraktion**: Sichere Header-Analyse zur Benutzeridentifikation
- **RLS-Integration**: Automatische Benutzer-ID-Auflösung aus dem Anfragekontext
- **Fehlerbehandlung**: Umfassende Fehlerbehandlung mit benutzerfreundlichen Nachrichten

## Datenbankintegration

Der Server integriert sich mit einer PostgreSQL-Datenbank über die Klasse `PostgreSQLSchemaProvider`:

- **Verbindungspooling**: Verwendet asynchrone Verbindungspools für Skalierbarkeit
- **Schema-Metadaten**: Bietet detaillierte Informationen zu Tabellenschemata
- **Abfrageausführung**: Sichere Abfrageausführung mit RLS-Unterstützung
- **Ressourcenmanagement**: Automatische Bereinigung von Datenbankressourcen

## Fehlerbehandlung

Der Server implementiert eine robuste Fehlerbehandlung:

- **Tabellenvalidierung**: Stellt sicher, dass nur gültige Tabellennamen abgerufen werden
- **Abfragevalidierung**: Validiert PostgreSQL-Abfragen vor der Ausführung
- **Ressourcenmanagement**: Ordnungsgemäße Bereinigung auch bei Fehlern
- **Benutzerfreundliche Nachrichten**: Klare Fehlermeldungen zur Fehlerbehebung

## Sicherheitsüberlegungen

1. **Row Level Security**: Alle Abfragen respektieren RLS-Richtlinien basierend auf der Benutzeridentität
2. **Datenisolierung der Filialen**: Jede Filiale hat eine eigene RLS-Benutzer-ID, die nur Zugriff auf die Daten dieser Filiale gewährt
3. **Eingabevalidierung**: Tabellennamen und Abfragen werden vor der Ausführung validiert
4. **Ressourcenbegrenzung**: Abfrageergebnisse sind begrenzt, um übermäßige Ressourcennutzung zu verhindern
5. **Verbindungssicherheit**: Verwendet sichere Datenbankverbindungspraktiken
6. **Benutzeridentitätsprüfung**: Stellt sicher, dass die korrekte RLS-Benutzer-ID für die beabsichtigte Filiale verwendet wird

### Wichtige Sicherheitshinweise

- **Verwenden Sie niemals Produktions-RLS-Benutzer-IDs in Entwicklungsumgebungen**
- **Überprüfen Sie immer, ob die RLS-Benutzer-ID mit der beabsichtigten Filiale übereinstimmt, bevor Sie Abfragen ausführen**
- **Die Standard-UUID (`00000000-0000-0000-0000-000000000000`) bietet eingeschränkten Zugriff**
- **Jeder Filialleiter sollte nur Zugriff auf die RLS-Benutzer-ID seiner Filiale haben**

## Entwicklung

### Projektstruktur

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Schlüsselkomponenten

- **FastMCP-Server**: Moderne MCP-Server-Implementierung mit asynchroner Unterstützung
- **PostgreSQL-Provider**: Datenbank-Abstraktionsschicht mit RLS-Unterstützung
- **Kontextmanagement**: Typensicheres Handling von Anwendungs- und Anfragekontexten
- **Werkzeugregistrierung**: Deklarative Werkzeugregistrierung mit Pydantic-Validierung

## Beitrag leisten

Wenn Sie zu diesem Server beitragen:

1. Stellen Sie sicher, dass alle Datenbankabfragen Row Level Security respektieren
2. Fügen Sie eine ordnungsgemäße Fehlerbehandlung für neue Werkzeuge hinzu
3. Aktualisieren Sie diese README-Datei mit neuen Funktionen oder Änderungen
4. Testen Sie den HTTP-Server-Modus
5. Validieren Sie Eingabeparameter und bieten Sie klare Fehlermeldungen

## [Lizenz](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Dieser MCP-Server ermöglicht sicheren, effizienten Zugriff auf Verkaufsdaten von Zava Retail für KI-gestützte Analysen und Einblicke.*

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.