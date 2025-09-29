<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T22:16:41+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "nl"
}
-->
# 🚀 MCP Server met PostgreSQL - Complete Leerhandleiding

## 🧠 Overzicht van het MCP Database Integratie Leerpad

Deze uitgebreide leerhandleiding leert je hoe je productieklare **Model Context Protocol (MCP) servers** bouwt die integreren met databases via een praktische implementatie voor retail analytics. Je leert patronen van ondernemingsniveau, waaronder **Row Level Security (RLS)**, **semantisch zoeken**, **Azure AI-integratie**, en **multi-tenant data toegang**.

Of je nu een backend ontwikkelaar, AI-ingenieur of data-architect bent, deze gids biedt gestructureerd leren met praktijkvoorbeelden en hands-on oefeningen.

## 🔗 Officiële MCP Bronnen

- 📘 [MCP Documentatie](https://modelcontextprotocol.io/) – Gedetailleerde tutorials en gebruikershandleidingen
- 📜 [MCP Specificatie](https://modelcontextprotocol.io/docs/) – Protocolarchitectuur en technische referenties
- 🧑‍💻 [MCP GitHub Repository](https://github.com/modelcontextprotocol) – Open-source SDK's, tools en codevoorbeelden
- 🌐 [MCP Community](https://github.com/orgs/modelcontextprotocol/discussions) – Neem deel aan discussies en draag bij aan de community
- 📚 [MCP voor Beginners](https://aka.ms/mcp-for-beginners) – Begin hier als je nieuw bent met MCP

## 🧭 MCP Database Integratie Leerpad

### 📚 Complete Leerstructuur

| Module | Onderwerp | Beschrijving | Link |
|--------|-----------|--------------|------|
| **Module 1-3: Basisprincipes** | | | |
| 00 | [Introductie tot MCP Database Integratie](./00-Introduction/README.md) | Overzicht van MCP met database-integratie en retail analytics use case | [Start Hier](./00-Introduction/README.md) |
| 01 | [Kernarchitectuur Concepten](./01-Architecture/README.md) | Begrip van MCP serverarchitectuur, databaselagen en beveiligingspatronen | [Leer](./01-Architecture/README.md) |
| 02 | [Beveiliging en Multi-Tenancy](./02-Security/README.md) | Row Level Security, authenticatie en multi-tenant data toegang | [Leer](./02-Security/README.md) |
| 03 | [Omgevingsinstellingen](./03-Setup/README.md) | Instellen van ontwikkelomgeving, Docker, Azure resources | [Instellen](./03-Setup/README.md) |
| **Module 4-6: Bouwen van de MCP Server** | | | |
| 04 | [Database Ontwerp en Schema](./04-Database/README.md) | PostgreSQL setup, retail schema ontwerp en voorbeelddata | [Bouwen](./04-Database/README.md) |
| 05 | [MCP Server Implementatie](./05-MCP-Server/README.md) | Bouwen van de FastMCP server met database-integratie | [Bouwen](./05-MCP-Server/README.md) |
| 06 | [Tool Ontwikkeling](./06-Tools/README.md) | Creëren van database query tools en schema introspectie | [Bouwen](./06-Tools/README.md) |
| **Module 7-9: Geavanceerde Functies** | | | |
| 07 | [Semantische Zoekintegratie](./07-Semantic-Search/README.md) | Implementeren van vector embeddings met Azure OpenAI en pgvector | [Geavanceerd](./07-Semantic-Search/README.md) |
| 08 | [Testen en Debuggen](./08-Testing/README.md) | Teststrategieën, debugging tools en validatiebenaderingen | [Testen](./08-Testing/README.md) |
| 09 | [VS Code Integratie](./09-VS-Code/README.md) | Configureren van VS Code MCP integratie en AI Chat gebruik | [Integreren](./09-VS-Code/README.md) |
| **Module 10-12: Productie en Best Practices** | | | |
| 10 | [Implementatiestrategieën](./10-Deployment/README.md) | Docker implementatie, Azure Container Apps en schaaloverwegingen | [Implementeren](./10-Deployment/README.md) |
| 11 | [Monitoring en Observatie](./11-Monitoring/README.md) | Application Insights, logging, prestatiemonitoring | [Monitoren](./11-Monitoring/README.md) |
| 12 | [Best Practices en Optimalisatie](./12-Best-Practices/README.md) | Prestatieoptimalisatie, beveiligingsversterking en productietips | [Optimaliseren](./12-Best-Practices/README.md) |

### 💻 Wat Je Gaat Bouwen

Aan het einde van dit leerpad heb je een complete **Zava Retail Analytics MCP Server** gebouwd met:

- **Multi-table retail database** met klantorders, producten en voorraad
- **Row Level Security** voor winkelgebaseerde data-isolatie
- **Semantisch product zoeken** met Azure OpenAI embeddings
- **VS Code AI Chat integratie** voor natuurlijke taalqueries
- **Productieklaar implementatie** met Docker en Azure
- **Uitgebreide monitoring** met Application Insights

## 🎯 Vereisten voor Leren

Om het meeste uit dit leerpad te halen, zou je moeten beschikken over:

- **Programmeervaardigheden**: Bekendheid met Python (voorkeur) of vergelijkbare talen
- **Databasekennis**: Basisbegrip van SQL en relationele databases
- **API Concepten**: Begrip van REST API's en HTTP-concepten
- **Ontwikkeltools**: Ervaring met command line, Git en code-editors
- **Cloud Basiskennis**: (Optioneel) Basiskennis van Azure of vergelijkbare cloudplatforms
- **Docker Bekendheid**: (Optioneel) Begrip van containerisatieconcepten

### Vereiste Tools

- **Docker Desktop** - Voor het draaien van PostgreSQL en de MCP server
- **Azure CLI** - Voor cloud resource implementatie
- **VS Code** - Voor ontwikkeling en MCP integratie
- **Git** - Voor versiebeheer
- **Python 3.8+** - Voor MCP server ontwikkeling

## 📚 Studiegids & Bronnen

Dit leerpad bevat uitgebreide bronnen om je effectief te begeleiden:

### Studiegids

Elke module bevat:
- **Duidelijke leerdoelen** - Wat je zult bereiken
- **Stapsgewijze instructies** - Gedetailleerde implementatiehandleidingen
- **Codevoorbeelden** - Werkende voorbeelden met uitleg
- **Oefeningen** - Hands-on praktijkmogelijkheden
- **Probleemoplossingsgidsen** - Veelvoorkomende problemen en oplossingen
- **Aanvullende bronnen** - Verdere lectuur en verkenning

### Vereisten Controle

Voor het starten van elke module vind je:
- **Vereiste kennis** - Wat je vooraf moet weten
- **Setup validatie** - Hoe je je omgeving kunt verifiëren
- **Tijdsinschattingen** - Verwachte voltooiingstijd
- **Leerresultaten** - Wat je zult weten na voltooiing

### Aanbevolen Leerpaden

Kies je pad op basis van je ervaringsniveau:

#### 🟢 **Beginner Pad** (Nieuw met MCP)
1. Begin met [MCP voor Beginners](https://aka.ms/mcp-for-beginners)
2. Voltooi modules 00-03 om de basis te begrijpen
3. Volg modules 04-06 voor hands-on bouwen
4. Probeer modules 07-09 voor praktische toepassing

#### 🟡 **Intermediate Pad** (Enige MCP Ervaring)
1. Bekijk modules 00-01 voor database-specifieke concepten
2. Focus op modules 02-06 voor implementatie
3. Duik diep in modules 07-12 voor geavanceerde functies

#### 🔴 **Advanced Pad** (Ervaren met MCP)
1. Bekijk modules 00-03 voor context
2. Focus op modules 04-09 voor database-integratie
3. Concentreer je op modules 10-12 voor productie-implementatie

## 🛠️ Hoe Dit Leerpad Effectief te Gebruiken

### Sequentieel Leren (Aanbevolen)

Werk modules in volgorde door voor een uitgebreide begrip:

1. **Lees het overzicht** - Begrijp wat je zult leren
2. **Controleer vereisten** - Zorg dat je de benodigde kennis hebt
3. **Volg stapsgewijze gidsen** - Implementeer terwijl je leert
4. **Voltooi oefeningen** - Versterk je begrip
5. **Bekijk belangrijke punten** - Verstevig leerresultaten

### Gericht Leren

Als je specifieke vaardigheden nodig hebt:

- **Database Integratie**: Focus op modules 04-06
- **Beveiligingsimplementatie**: Concentreer je op modules 02, 08, 12
- **AI/Semantisch Zoeken**: Duik diep in module 07
- **Productie-implementatie**: Bestudeer modules 10-12

### Hands-on Praktijk

Elke module bevat:
- **Werkende codevoorbeelden** - Kopieer, wijzig en experimenteer
- **Praktijkvoorbeelden** - Praktische retail analytics use cases
- **Progressieve complexiteit** - Opbouw van eenvoudig naar geavanceerd
- **Validatiestappen** - Verifieer dat je implementatie werkt

## 🌟 Community en Ondersteuning

### Hulp Krijgen

- **Azure AI Discord**: [Word lid voor deskundige ondersteuning](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Meld problemen of stel vragen](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Community**: [Neem deel aan bredere MCP-discussies](https://github.com/orgs/modelcontextprotocol/discussions)

### Bijdragen

We verwelkomen bijdragen om dit leerpad te verbeteren:
- **Fouten of typefouten corrigeren** - Dien pull requests in
- **Voorbeelden toevoegen** - Deel je implementaties
- **Documentatie verbeteren** - Help anderen leren
- **Problemen melden** - Help ons problemen op te lossen

## 📜 Licentie-informatie

Deze leerinhoud is gelicentieerd onder de MIT-licentie. Zie het [LICENSE](../../../LICENSE) bestand voor voorwaarden.

## 🚀 Klaar om te Beginnen?

Begin je reis met **[Module 00: Introductie tot MCP Database Integratie](./00-Introduction/README.md)**

---

*Beheers het bouwen van productieklare MCP servers met database-integratie via deze uitgebreide, hands-on leerervaring.*

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.