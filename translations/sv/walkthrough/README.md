<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T21:20:20+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "sv"
}
-->
# 🚀 MCP-server med PostgreSQL - Komplett lärguide

## 🧠 Översikt över lärvägen för MCP-databasintegration

Denna omfattande lärguide lär dig att bygga produktionsklara **Model Context Protocol (MCP)-servrar** som integreras med databaser genom en praktisk implementering för detaljhandelsanalys. Du kommer att lära dig mönster i företagsklass, inklusive **Row Level Security (RLS)**, **semantisk sökning**, **Azure AI-integration** och **multi-tenant dataåtkomst**.

Oavsett om du är backend-utvecklare, AI-ingenjör eller dataarkitekt, erbjuder denna guide strukturerat lärande med verkliga exempel och praktiska övningar.

## 🔗 Officiella MCP-resurser

- 📘 [MCP-dokumentation](https://modelcontextprotocol.io/) – Detaljerade handledningar och användarguider
- 📜 [MCP-specifikation](https://modelcontextprotocol.io/docs/) – Protokollarkitektur och tekniska referenser
- 🧑‍💻 [MCP GitHub-repository](https://github.com/modelcontextprotocol) – Öppen källkod för SDK:er, verktyg och kodexempel
- 🌐 [MCP-community](https://github.com/orgs/modelcontextprotocol/discussions) – Delta i diskussioner och bidra till communityn
- 📚 [MCP för nybörjare](https://aka.ms/mcp-for-beginners) – Börja här om du är ny på MCP

## 🧭 Lärväg för MCP-databasintegration

### 📚 Komplett lärstruktur

| Modul | Ämne | Beskrivning | Länk |
|-------|------|-------------|------|
| **Modul 1-3: Grunder** | | | |
| 00 | [Introduktion till MCP-databasintegration](./00-Introduction/README.md) | Översikt över MCP med databasintegration och användningsfall för detaljhandelsanalys | [Börja här](./00-Introduction/README.md) |
| 01 | [Kärnarkitekturkoncept](./01-Architecture/README.md) | Förstå MCP-serverarkitektur, databaslager och säkerhetsmönster | [Lär dig](./01-Architecture/README.md) |
| 02 | [Säkerhet och multi-tenancy](./02-Security/README.md) | Row Level Security, autentisering och multi-tenant dataåtkomst | [Lär dig](./02-Security/README.md) |
| 03 | [Miljöinställning](./03-Setup/README.md) | Ställa in utvecklingsmiljö, Docker, Azure-resurser | [Ställ in](./03-Setup/README.md) |
| **Modul 4-6: Bygga MCP-servern** | | | |
| 04 | [Databaskonstruktion och schema](./04-Database/README.md) | PostgreSQL-inställning, detaljhandelsschema och exempeldata | [Bygg](./04-Database/README.md) |
| 05 | [Implementering av MCP-server](./05-MCP-Server/README.md) | Bygga FastMCP-servern med databasintegration | [Bygg](./05-MCP-Server/README.md) |
| 06 | [Verktygsutveckling](./06-Tools/README.md) | Skapa databasfrågeverktyg och schemaintrospektion | [Bygg](./06-Tools/README.md) |
| **Modul 7-9: Avancerade funktioner** | | | |
| 07 | [Integration av semantisk sökning](./07-Semantic-Search/README.md) | Implementera vektorinbäddningar med Azure OpenAI och pgvector | [Avancera](./07-Semantic-Search/README.md) |
| 08 | [Testning och felsökning](./08-Testing/README.md) | Teststrategier, felsökningsverktyg och valideringsmetoder | [Testa](./08-Testing/README.md) |
| 09 | [VS Code-integration](./09-VS-Code/README.md) | Konfigurera VS Code MCP-integration och AI Chat-användning | [Integrera](./09-VS-Code/README.md) |
| **Modul 10-12: Produktion och bästa praxis** | | | |
| 10 | [Implementeringsstrategier](./10-Deployment/README.md) | Docker-implementering, Azure Container Apps och skalningsöverväganden | [Implementera](./10-Deployment/README.md) |
| 11 | [Övervakning och observabilitet](./11-Monitoring/README.md) | Application Insights, loggning, prestandaövervakning | [Övervaka](./11-Monitoring/README.md) |
| 12 | [Bästa praxis och optimering](./12-Best-Practices/README.md) | Prestandaoptimering, säkerhetshärdning och produktionstips | [Optimera](./12-Best-Practices/README.md) |

### 💻 Vad du kommer att bygga

När du har slutfört denna lärväg kommer du ha byggt en komplett **Zava Retail Analytics MCP-server** med:

- **Multi-tabell detaljhandelsdatabas** med kundorder, produkter och lager
- **Row Level Security** för butiksbaserad dataisolering
- **Semantisk produktsökning** med Azure OpenAI-inbäddningar
- **VS Code AI Chat-integration** för naturliga språkfrågor
- **Produktionsklar implementering** med Docker och Azure
- **Omfattande övervakning** med Application Insights

## 🎯 Förkunskaper för lärande

För att få ut det mesta av denna lärväg bör du ha:

- **Programmeringskunskaper**: Erfarenhet av Python (föredras) eller liknande språk
- **Databaskunskaper**: Grundläggande förståelse för SQL och relationsdatabaser
- **API-koncept**: Förståelse för REST API:er och HTTP-koncept
- **Utvecklingsverktyg**: Erfarenhet av kommandorad, Git och kodredigerare
- **Grundläggande molnkunskaper**: (Valfritt) Grundläggande kunskap om Azure eller liknande molnplattformar
- **Docker-kunskaper**: (Valfritt) Förståelse för containerisering

### Nödvändiga verktyg

- **Docker Desktop** - För att köra PostgreSQL och MCP-servern
- **Azure CLI** - För att implementera molnresurser
- **VS Code** - För utveckling och MCP-integration
- **Git** - För versionskontroll
- **Python 3.8+** - För utveckling av MCP-servern

## 📚 Studievägledning och resurser

Denna lärväg inkluderar omfattande resurser för att hjälpa dig navigera effektivt:

### Studievägledning

Varje modul innehåller:
- **Tydliga lärandemål** - Vad du kommer att uppnå
- **Steg-för-steg-instruktioner** - Detaljerade implementeringsguider
- **Kodexempel** - Fungerande exempel med förklaringar
- **Övningar** - Praktiska övningsmöjligheter
- **Felsökningsguider** - Vanliga problem och lösningar
- **Ytterligare resurser** - Vidare läsning och utforskning

### Förkunskapskontroll

Innan du börjar varje modul hittar du:
- **Nödvändig kunskap** - Vad du bör veta i förväg
- **Miljövalidering** - Hur du verifierar din miljö
- **Tidsuppskattningar** - Förväntad slutförandetid
- **Lärandemål** - Vad du kommer att kunna efter slutförandet

### Rekommenderade lärvägar

Välj din väg baserat på din erfarenhetsnivå:

#### 🟢 **Nybörjarväg** (Ny på MCP)
1. Börja med [MCP för nybörjare](https://aka.ms/mcp-for-beginners)
2. Slutför modulerna 00-03 för att förstå grunderna
3. Följ modulerna 04-06 för praktisk byggande
4. Testa modulerna 07-09 för praktisk användning

#### 🟡 **Mellanväg** (Viss MCP-erfarenhet)
1. Granska modulerna 00-01 för databasrelaterade koncept
2. Fokusera på modulerna 02-06 för implementering
3. Fördjupa dig i modulerna 07-12 för avancerade funktioner

#### 🔴 **Avancerad väg** (Erfaren med MCP)
1. Skumma igenom modulerna 00-03 för sammanhang
2. Fokusera på modulerna 04-09 för databasintegration
3. Koncentrera dig på modulerna 10-12 för produktionsimplementering

## 🛠️ Hur du använder denna lärväg effektivt

### Sekventiellt lärande (Rekommenderas)

Arbeta igenom modulerna i ordning för en omfattande förståelse:

1. **Läs översikten** - Förstå vad du kommer att lära dig
2. **Kontrollera förkunskaper** - Säkerställ att du har nödvändig kunskap
3. **Följ steg-för-steg-guider** - Implementera medan du lär dig
4. **Slutför övningar** - Förstärk din förståelse
5. **Granska viktiga punkter** - Konsolidera lärandemål

### Målinriktat lärande

Om du behöver specifika färdigheter:

- **Databasintegration**: Fokusera på modulerna 04-06
- **Säkerhetsimplementering**: Koncentrera dig på modulerna 02, 08, 12
- **AI/Semantisk sökning**: Fördjupa dig i modul 07
- **Produktionsimplementering**: Studera modulerna 10-12

### Praktisk övning

Varje modul innehåller:
- **Fungerande kodexempel** - Kopiera, modifiera och experimentera
- **Verkliga scenarier** - Praktiska användningsfall för detaljhandelsanalys
- **Progressiv komplexitet** - Bygga från enkla till avancerade lösningar
- **Valideringssteg** - Verifiera att din implementering fungerar

## 🌟 Community och support

### Få hjälp

- **Azure AI Discord**: [Gå med för experthjälp](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Rapportera problem eller ställ frågor](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP-community**: [Delta i bredare MCP-diskussioner](https://github.com/orgs/modelcontextprotocol/discussions)

### Bidra

Vi välkomnar bidrag för att förbättra denna lärväg:
- **Rätta fel eller stavfel** - Skicka pull requests
- **Lägg till exempel** - Dela dina implementeringar
- **Förbättra dokumentation** - Hjälp andra att lära sig
- **Rapportera problem** - Hjälp oss att lösa problem

## 📜 Licensinformation

Detta lärinnehåll är licensierat under MIT-licensen. Se [LICENSE](../../../LICENSE) för villkor och bestämmelser.

## 🚀 Redo att börja?

Börja din resa med **[Modul 00: Introduktion till MCP-databasintegration](./00-Introduction/README.md)**

---

*Bemästra att bygga produktionsklara MCP-servrar med databasintegration genom denna omfattande, praktiska lärupplevelse.*

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.