<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T21:50:12+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "da"
}
-->
# 🚀 MCP Server med PostgreSQL - Komplet Læringsguide

## 🧠 Oversigt over MCP Database Integration Læringssti

Denne omfattende læringsguide lærer dig, hvordan du bygger produktionsklare **Model Context Protocol (MCP) servere**, der integrerer med databaser gennem en praktisk implementering af detailanalyse. Du vil lære mønstre i virksomhedsklassen, herunder **Row Level Security (RLS)**, **semantisk søgning**, **Azure AI-integration** og **multi-tenant dataadgang**.

Uanset om du er backend-udvikler, AI-ingeniør eller dataarkitekt, giver denne guide struktureret læring med eksempler fra den virkelige verden og praktiske øvelser.

## 🔗 Officielle MCP Ressourcer

- 📘 [MCP Dokumentation](https://modelcontextprotocol.io/) – Detaljerede vejledninger og brugerguides
- 📜 [MCP Specifikation](https://modelcontextprotocol.io/docs/) – Protokolarkitektur og tekniske referencer
- 🧑‍💻 [MCP GitHub Repository](https://github.com/modelcontextprotocol) – Open-source SDK'er, værktøjer og kodeeksempler
- 🌐 [MCP Community](https://github.com/orgs/modelcontextprotocol/discussions) – Deltag i diskussioner og bidrag til fællesskabet
- 📚 [MCP for Begyndere](https://aka.ms/mcp-for-beginners) – Start her, hvis du er ny til MCP

## 🧭 MCP Database Integration Læringssti

### 📚 Komplet Læringsstruktur

| Modul | Emne | Beskrivelse | Link |
|-------|------|-------------|------|
| **Modul 1-3: Grundlag** | | | |
| 00 | [Introduktion til MCP Database Integration](./00-Introduction/README.md) | Oversigt over MCP med databaseintegration og detailanalyse-case | [Start Her](./00-Introduction/README.md) |
| 01 | [Kernearkitektur Koncepter](./01-Architecture/README.md) | Forstå MCP serverarkitektur, databaselag og sikkerhedsmønstre | [Lær](./01-Architecture/README.md) |
| 02 | [Sikkerhed og Multi-Tenancy](./02-Security/README.md) | Row Level Security, autentifikation og multi-tenant dataadgang | [Lær](./02-Security/README.md) |
| 03 | [Opsætning af Miljø](./03-Setup/README.md) | Opsætning af udviklingsmiljø, Docker, Azure ressourcer | [Opsæt](./03-Setup/README.md) |
| **Modul 4-6: Bygning af MCP Serveren** | | | |
| 04 | [Database Design og Skema](./04-Database/README.md) | PostgreSQL opsætning, detail-skema design og eksempeldata | [Byg](./04-Database/README.md) |
| 05 | [MCP Server Implementering](./05-MCP-Server/README.md) | Bygning af FastMCP server med databaseintegration | [Byg](./05-MCP-Server/README.md) |
| 06 | [Udvikling af Værktøjer](./06-Tools/README.md) | Oprettelse af databaseforespørgselsværktøjer og skema introspektion | [Byg](./06-Tools/README.md) |
| **Modul 7-9: Avancerede Funktioner** | | | |
| 07 | [Semantisk Søgningsintegration](./07-Semantic-Search/README.md) | Implementering af vektorindlejring med Azure OpenAI og pgvector | [Avancer](./07-Semantic-Search/README.md) |
| 08 | [Test og Fejlfinding](./08-Testing/README.md) | Teststrategier, fejlfindingsværktøjer og valideringsmetoder | [Test](./08-Testing/README.md) |
| 09 | [VS Code Integration](./09-VS-Code/README.md) | Konfiguration af VS Code MCP integration og AI Chat brug | [Integrer](./09-VS-Code/README.md) |
| **Modul 10-12: Produktion og Best Practices** | | | |
| 10 | [Udrulningsstrategier](./10-Deployment/README.md) | Docker-udrulning, Azure Container Apps og skaleringsovervejelser | [Udrul](./10-Deployment/README.md) |
| 11 | [Overvågning og Observabilitet](./11-Monitoring/README.md) | Application Insights, logning, performanceovervågning | [Overvåg](./11-Monitoring/README.md) |
| 12 | [Best Practices og Optimering](./12-Best-Practices/README.md) | Performanceoptimering, sikkerhedshærdning og produktionstips | [Optimer](./12-Best-Practices/README.md) |

### 💻 Hvad Du Vil Bygge

Ved afslutningen af denne læringssti vil du have bygget en komplet **Zava Retail Analytics MCP Server** med følgende funktioner:

- **Multi-table detaildatabase** med kundeordrer, produkter og lager
- **Row Level Security** for dataisolering baseret på butik
- **Semantisk produktsøgning** ved hjælp af Azure OpenAI-indlejring
- **VS Code AI Chat integration** til naturlige sprogforespørgsler
- **Produktionsklar udrulning** med Docker og Azure
- **Omfattende overvågning** med Application Insights

## 🎯 Forudsætninger for Læring

For at få mest muligt ud af denne læringssti bør du have:

- **Programmeringserfaring**: Kendskab til Python (foretrukket) eller lignende sprog
- **Databasekendskab**: Grundlæggende forståelse af SQL og relationelle databaser
- **API-koncepter**: Forståelse af REST API'er og HTTP-koncepter
- **Udviklingsværktøjer**: Erfaring med kommandolinje, Git og kodeeditorer
- **Cloud-grundlag**: (Valgfrit) Grundlæggende kendskab til Azure eller lignende cloud-platforme
- **Docker-kendskab**: (Valgfrit) Forståelse af containeriseringskoncepter

### Nødvendige Værktøjer

- **Docker Desktop** - Til at køre PostgreSQL og MCP serveren
- **Azure CLI** - Til udrulning af cloud-ressourcer
- **VS Code** - Til udvikling og MCP integration
- **Git** - Til versionskontrol
- **Python 3.8+** - Til MCP serverudvikling

## 📚 Studieguide & Ressourcer

Denne læringssti inkluderer omfattende ressourcer til at hjælpe dig med at navigere effektivt:

### Studieguide

Hvert modul inkluderer:
- **Klare læringsmål** - Hvad du vil opnå
- **Trinvise instruktioner** - Detaljerede implementeringsvejledninger
- **Kodeeksempler** - Arbejdseksempler med forklaringer
- **Øvelser** - Praktiske øvelsesmuligheder
- **Fejlfindingsvejledninger** - Almindelige problemer og løsninger
- **Yderligere ressourcer** - Videre læsning og udforskning

### Forudsætningskontrol

Før du starter hvert modul, vil du finde:
- **Nødvendig viden** - Hvad du bør vide på forhånd
- **Opsætningsvalidering** - Hvordan du verificerer dit miljø
- **Tidsestimater** - Forventet gennemførselstid
- **Læringsresultater** - Hvad du vil vide efter gennemførsel

### Anbefalede Læringsstier

Vælg din sti baseret på dit erfaringsniveau:

#### 🟢 **Begyndersti** (Ny til MCP)
1. Start med [MCP for Begyndere](https://aka.ms/mcp-for-beginners) først
2. Gennemfør modulerne 00-03 for at forstå grundlag
3. Følg modulerne 04-06 for praktisk opbygning
4. Prøv modulerne 07-09 for praktisk anvendelse

#### 🟡 **Mellemsti** (Noget MCP Erfaring)
1. Gennemgå modulerne 00-01 for database-specifikke koncepter
2. Fokuser på modulerne 02-06 for implementering
3. Dyk dybt ned i modulerne 07-12 for avancerede funktioner

#### 🔴 **Avanceret sti** (Erfaren med MCP)
1. Skim modulerne 00-03 for kontekst
2. Fokuser på modulerne 04-09 for databaseintegration
3. Koncentrer dig om modulerne 10-12 for produktionsudrulning

## 🛠️ Sådan Bruger Du Denne Læringssti Effektivt

### Sekventiel Læring (Anbefalet)

Arbejd gennem modulerne i rækkefølge for en omfattende forståelse:

1. **Læs oversigten** - Forstå hvad du vil lære
2. **Kontroller forudsætninger** - Sørg for, at du har den nødvendige viden
3. **Følg trinvise vejledninger** - Implementer mens du lærer
4. **Gennemfør øvelser** - Styrk din forståelse
5. **Gennemgå nøglepunkter** - Konsolider læringsresultater

### Målrettet Læring

Hvis du har brug for specifikke færdigheder:

- **Databaseintegration**: Fokuser på modulerne 04-06
- **Sikkerhedsimplementering**: Koncentrer dig om modulerne 02, 08, 12
- **AI/Semantisk søgning**: Dyk dybt ned i modul 07
- **Produktionsudrulning**: Studér modulerne 10-12

### Praktisk Øvelse

Hvert modul inkluderer:
- **Arbejdende kodeeksempler** - Kopiér, modificér og eksperimentér
- **Virkelighedsnære scenarier** - Praktiske detailanalyse-cases
- **Progressiv kompleksitet** - Byg fra simpelt til avanceret
- **Valideringstrin** - Bekræft, at din implementering fungerer

## 🌟 Fællesskab og Support

### Få Hjælp

- **Azure AI Discord**: [Deltag for ekspertstøtte](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Rapportér problemer eller stil spørgsmål](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Community**: [Deltag i bredere MCP-diskussioner](https://github.com/orgs/modelcontextprotocol/discussions)

### Bidrag

Vi byder velkommen til bidrag for at forbedre denne læringssti:
- **Ret fejl eller stavefejl** - Indsend pull requests
- **Tilføj eksempler** - Del dine implementeringer
- **Forbedr dokumentation** - Hjælp andre med at lære
- **Rapportér problemer** - Hjælp os med at løse problemer

## 📜 Licensinformation

Dette læringsindhold er licenseret under MIT-licensen. Se [LICENSE](../../../LICENSE) filen for vilkår og betingelser.

## 🚀 Klar til at Starte?

Begynd din rejse med **[Modul 00: Introduktion til MCP Database Integration](./00-Introduction/README.md)**

---

*Bliv ekspert i at bygge produktionsklare MCP servere med databaseintegration gennem denne omfattende, praktiske læringsoplevelse.*

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.