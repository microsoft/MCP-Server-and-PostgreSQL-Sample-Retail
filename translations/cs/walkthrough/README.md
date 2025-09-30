<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T05:57:32+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "cs"
}
-->
# 🚀 MCP Server s PostgreSQL - Kompletní průvodce učením

## 🧠 Přehled vzdělávací cesty integrace MCP databáze

Tento komplexní průvodce učením vás naučí, jak vytvořit produkčně připravené **Model Context Protocol (MCP) servery**, které se integrují s databázemi prostřednictvím praktické implementace maloobchodní analytiky. Naučíte se vzory na podnikové úrovni, včetně **Row Level Security (RLS)**, **sémantického vyhledávání**, **integrace Azure AI** a **přístupu k datům pro více nájemců**.

Ať už jste backendový vývojář, AI inženýr nebo datový architekt, tento průvodce poskytuje strukturované učení s příklady z reálného světa a praktickými cvičeními.

## 🔗 Oficiální MCP zdroje

- 📘 [MCP Dokumentace](https://modelcontextprotocol.io/) – Podrobné tutoriály a uživatelské příručky
- 📜 [MCP Specifikace](https://modelcontextprotocol.io/docs/) – Architektura protokolu a technické reference
- 🧑‍💻 [MCP GitHub Repozitář](https://github.com/modelcontextprotocol) – Open-source SDK, nástroje a ukázky kódu
- 🌐 [MCP Komunita](https://github.com/orgs/modelcontextprotocol/discussions) – Připojte se k diskuzím a přispějte do komunity
- 📚 [MCP pro začátečníky](https://aka.ms/mcp-for-beginners) – Začněte zde, pokud jste v MCP noví

## 🧭 Vzdělávací cesta integrace MCP databáze

### 📚 Kompletní struktura učení

| Modul | Téma | Popis | Odkaz |
|-------|------|-------|-------|
| **Moduly 1-3: Základy** | | | |
| 00 | [Úvod do integrace MCP databáze](./00-Introduction/README.md) | Přehled MCP s integrací databáze a případ použití maloobchodní analytiky | [Začněte zde](./00-Introduction/README.md) |
| 01 | [Základní koncepty architektury](./01-Architecture/README.md) | Porozumění architektuře MCP serveru, databázovým vrstvám a bezpečnostním vzorům | [Učte se](./01-Architecture/README.md) |
| 02 | [Bezpečnost a více nájemců](./02-Security/README.md) | Row Level Security, autentizace a přístup k datům pro více nájemců | [Učte se](./02-Security/README.md) |
| 03 | [Nastavení prostředí](./03-Setup/README.md) | Nastavení vývojového prostředí, Dockeru, Azure zdrojů | [Nastavte](./03-Setup/README.md) |
| **Moduly 4-6: Vytváření MCP serveru** | | | |
| 04 | [Návrh databáze a schéma](./04-Database/README.md) | Nastavení PostgreSQL, návrh maloobchodního schématu a ukázková data | [Vytvořte](./04-Database/README.md) |
| 05 | [Implementace MCP serveru](./05-MCP-Server/README.md) | Vytvoření FastMCP serveru s integrací databáze | [Vytvořte](./05-MCP-Server/README.md) |
| 06 | [Vývoj nástrojů](./06-Tools/README.md) | Vytvoření nástrojů pro dotazy na databázi a introspekci schématu | [Vytvořte](./06-Tools/README.md) |
| **Moduly 7-9: Pokročilé funkce** | | | |
| 07 | [Integrace sémantického vyhledávání](./07-Semantic-Search/README.md) | Implementace vektorových embeddingů s Azure OpenAI a pgvector | [Pokročte](./07-Semantic-Search/README.md) |
| 08 | [Testování a ladění](./08-Testing/README.md) | Strategie testování, nástroje pro ladění a přístupy k validaci | [Testujte](./08-Testing/README.md) |
| 09 | [Integrace VS Code](./09-VS-Code/README.md) | Konfigurace integrace VS Code MCP a použití AI Chat | [Integrujte](./09-VS-Code/README.md) |
| **Moduly 10-12: Produkce a osvědčené postupy** | | | |
| 10 | [Strategie nasazení](./10-Deployment/README.md) | Nasazení pomocí Dockeru, Azure Container Apps a úvahy o škálování | [Nasazujte](./10-Deployment/README.md) |
| 11 | [Monitoring a pozorovatelnost](./11-Monitoring/README.md) | Application Insights, logování, monitoring výkonu | [Monitorujte](./11-Monitoring/README.md) |
| 12 | [Osvědčené postupy a optimalizace](./12-Best-Practices/README.md) | Optimalizace výkonu, zpevnění bezpečnosti a tipy pro produkci | [Optimalizujte](./12-Best-Practices/README.md) |

### 💻 Co vytvoříte

Na konci této vzdělávací cesty vytvoříte kompletní **Zava Retail Analytics MCP Server**, který zahrnuje:

- **Více-tabulkovou maloobchodní databázi** se zákaznickými objednávkami, produkty a inventářem
- **Row Level Security** pro izolaci dat na úrovni obchodů
- **Sémantické vyhledávání produktů** pomocí embeddingů Azure OpenAI
- **Integraci VS Code AI Chat** pro dotazy v přirozeném jazyce
- **Produkčně připravené nasazení** s Dockerem a Azure
- **Komplexní monitoring** pomocí Application Insights

## 🎯 Předpoklady pro učení

Abyste z této vzdělávací cesty získali maximum, měli byste mít:

- **Zkušenosti s programováním**: Znalost Pythonu (preferováno) nebo podobných jazyků
- **Znalost databází**: Základní porozumění SQL a relačním databázím
- **Koncepty API**: Porozumění REST API a HTTP konceptům
- **Vývojové nástroje**: Zkušenosti s příkazovou řádkou, Gitem a editory kódu
- **Základy cloudu**: (Volitelné) Základní znalost Azure nebo podobných cloudových platforem
- **Znalost Dockeru**: (Volitelné) Porozumění konceptům kontejnerizace

### Potřebné nástroje

- **Docker Desktop** - Pro spuštění PostgreSQL a MCP serveru
- **Azure CLI** - Pro nasazení cloudových zdrojů
- **VS Code** - Pro vývoj a integraci MCP
- **Git** - Pro verzování kódu
- **Python 3.8+** - Pro vývoj MCP serveru

## 📚 Průvodce studiem a zdroje

Tato vzdělávací cesta zahrnuje komplexní zdroje, které vám pomohou efektivně se orientovat:

### Průvodce studiem

Každý modul obsahuje:
- **Jasné cíle učení** - Co dosáhnete
- **Krok za krokem instrukce** - Podrobné implementační pokyny
- **Ukázky kódu** - Funkční příklady s vysvětlením
- **Cvičení** - Příležitosti k praktickému procvičení
- **Průvodce řešením problémů** - Běžné problémy a jejich řešení
- **Další zdroje** - Další čtení a průzkum

### Kontrola předpokladů

Před zahájením každého modulu najdete:
- **Požadované znalosti** - Co byste měli vědět předem
- **Ověření nastavení** - Jak ověřit vaše prostředí
- **Odhady času** - Očekávaný čas dokončení
- **Výsledky učení** - Co budete vědět po dokončení

### Doporučené vzdělávací cesty

Vyberte si cestu podle své úrovně zkušeností:

#### 🟢 **Cesta pro začátečníky** (Noví v MCP)
1. Začněte s [MCP pro začátečníky](https://aka.ms/mcp-for-beginners)
2. Dokončete moduly 00-03 pro pochopení základů
3. Následujte moduly 04-06 pro praktické budování
4. Vyzkoušejte moduly 07-09 pro praktické použití

#### 🟡 **Cesta pro pokročilé** (Nějaké zkušenosti s MCP)
1. Projděte moduly 00-01 pro koncepty specifické pro databáze
2. Zaměřte se na moduly 02-06 pro implementaci
3. Ponořte se do modulů 07-12 pro pokročilé funkce

#### 🔴 **Cesta pro experty** (Zkušenosti s MCP)
1. Rychle projděte moduly 00-03 pro kontext
2. Zaměřte se na moduly 04-09 pro integraci databáze
3. Soustřeďte se na moduly 10-12 pro nasazení do produkce

## 🛠️ Jak efektivně využít tuto vzdělávací cestu

### Sekvenční učení (doporučeno)

Projděte moduly postupně pro komplexní porozumění:

1. **Přečtěte si přehled** - Porozumějte tomu, co se naučíte
2. **Zkontrolujte předpoklady** - Ujistěte se, že máte potřebné znalosti
3. **Postupujte podle kroků** - Implementujte během učení
4. **Dokončete cvičení** - Posilte své porozumění
5. **Projděte klíčové poznatky** - Upevněte výsledky učení

### Cílené učení

Pokud potřebujete konkrétní dovednosti:

- **Integrace databáze**: Zaměřte se na moduly 04-06
- **Implementace bezpečnosti**: Soustřeďte se na moduly 02, 08, 12
- **AI/Sémantické vyhledávání**: Ponořte se do modulu 07
- **Nasazení do produkce**: Studujte moduly 10-12

### Praktické cvičení

Každý modul obsahuje:
- **Funkční ukázky kódu** - Kopírujte, upravujte a experimentujte
- **Scénáře z reálného světa** - Praktické případy použití maloobchodní analytiky
- **Postupnou složitost** - Budování od jednoduchého k pokročilému
- **Kroky ověření** - Ověřte, že vaše implementace funguje

## 🌟 Komunita a podpora

### Získejte pomoc

- **Azure AI Discord**: [Připojte se pro odbornou podporu](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Nahlaste problémy nebo položte otázky](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Komunita**: [Připojte se k širším diskuzím o MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Přispějte

Uvítáme příspěvky na zlepšení této vzdělávací cesty:
- **Oprava chyb nebo překlepů** - Podávejte pull requesty
- **Přidání příkladů** - Sdílejte své implementace
- **Zlepšení dokumentace** - Pomozte ostatním učit se
- **Nahlášení problémů** - Pomozte nám opravit chyby

## 📜 Informace o licenci

Tento vzdělávací obsah je licencován pod licencí MIT. Podívejte se na soubor [LICENSE](../../../LICENSE) pro podmínky a ustanovení.

## 🚀 Připraveni začít?

Začněte svou cestu s **[Modulem 00: Úvod do integrace MCP databáze](./00-Introduction/README.md)**

---

*Mistrovsky zvládněte tvorbu produkčně připravených MCP serverů s integrací databáze prostřednictvím této komplexní, praktické vzdělávací zkušenosti.*

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.