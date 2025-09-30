<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T05:50:17+00:00",
  "source_file": "README.md",
  "language_code": "cs"
}
-->
# MCP Server a PostgreSQL Ukázka - Analýza maloobchodního prodeje

## Naučte se MCP s integrací databáze prostřednictvím praktických příkladů

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Připojte se k Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Postupujte podle těchto kroků, abyste mohli začít používat tyto zdroje:

1. **Forkněte repozitář**: Klikněte [zde pro fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Naklonujte repozitář**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Připojte se k Azure AI Foundry Discord**: [Setkejte se s odborníky a dalšími vývojáři](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podpora více jazyků

#### Podporováno prostřednictvím GitHub Action (automatizované a vždy aktuální)

[Francouzština](../fr/README.md) | [Španělština](../es/README.md) | [Němčina](../de/README.md) | [Ruština](../ru/README.md) | [Arabština](../ar/README.md) | [Perština (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradiční, Macao)](../mo/README.md) | [Čínština (tradiční, Hongkong)](../hk/README.md) | [Čínština (tradiční, Tchaj-wan)](../tw/README.md) | [Japonština](../ja/README.md) | [Korejština](../ko/README.md) | [Hindština](../hi/README.md) | [Bengálština](../bn/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Paňdžábština (Gurmukhi)](../pa/README.md) | [Portugalština (Portugalsko)](../pt/README.md) | [Portugalština (Brazílie)](../br/README.md) | [Italština](../it/README.md) | [Polština](../pl/README.md) | [Turečtina](../tr/README.md) | [Řečtina](../el/README.md) | [Thajština](../th/README.md) | [Švédština](../sv/README.md) | [Dánština](../da/README.md) | [Norština](../no/README.md) | [Finština](../fi/README.md) | [Nizozemština](../nl/README.md) | [Hebrejština](../he/README.md) | [Vietnamština](../vi/README.md) | [Indonéština](../id/README.md) | [Malajština](../ms/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Svahilština](../sw/README.md) | [Maďarština](../hu/README.md) | [Čeština](./README.md) | [Slovenština](../sk/README.md) | [Rumunština](../ro/README.md) | [Bulharština](../bg/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Chorvatština](../hr/README.md) | [Slovinština](../sl/README.md) | [Ukrajinština](../uk/README.md) | [Barmština (Myanmar)](../my/README.md)

**Pokud si přejete přidat další překlady, seznam podporovaných jazyků najdete [zde](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Úvod

Tento příklad ukazuje, jak vytvořit a nasadit komplexní **Model Context Protocol (MCP) server**, který poskytuje AI asistentům bezpečný a inteligentní přístup k datům o maloobchodním prodeji prostřednictvím PostgreSQL. Projekt představuje funkce na podnikové úrovni, včetně **Row Level Security (RLS)**, **schopností semantického vyhledávání** a **integrace Azure AI** pro reálné scénáře analýzy maloobchodního prodeje.

**Klíčové případy použití:**
- **Analýza prodeje poháněná AI**: Umožněte AI asistentům dotazovat se na data o maloobchodním prodeji a analyzovat je pomocí přirozeného jazyka
- **Bezpečný přístup pro více nájemců**: Ukázka implementace Row Level Security, kde různí manažeři obchodů mohou přistupovat pouze k datům svého obchodu
- **Semantické vyhledávání produktů**: Ukázka AI vylepšeného vyhledávání produktů pomocí textových embeddingů
- **Podniková integrace**: Ilustrace, jak integrovat MCP servery s Azure službami a PostgreSQL databázemi

**Ideální pro:**
- Vývojáře, kteří se učí vytvářet MCP servery s integrací databáze
- Datové inženýry implementující bezpečná analytická řešení pro více nájemců
- Vývojáře AI aplikací pracující s daty z maloobchodu nebo e-commerce
- Kohokoli, kdo má zájem kombinovat AI asistenty s podnikovými databázemi

## Připojte se k Azure AI Foundry Discord komunitě
Sdílejte své zkušenosti s MCP a setkejte se s odborníky a produktovými skupinami

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# MCP Server pro analýzu prodeje

Model Context Protocol (MCP) server, který poskytuje komplexní přístup k databázi zákaznického prodeje pro Zava Retail DIY Business. Tento server umožňuje AI asistentům dotazovat se na data o maloobchodním prodeji a analyzovat je prostřednictvím bezpečného, schématicky orientovaného rozhraní.

## 📚 Kompletní průvodce implementací

Pro podrobný rozbor toho, jak je toto řešení vytvořeno a jak implementovat podobné MCP servery, si přečtěte náš komplexní **[Ukázkový průvodce](Sample_Walkthrough.md)**. Tento průvodce poskytuje:

- **Hloubkový pohled na architekturu**: Analýza komponent a návrhové vzory
- **Krok za krokem**: Od nastavení projektu po nasazení
- **Rozbor kódu**: Podrobná vysvětlení implementace MCP serveru
- **Pokročilé funkce**: Row Level Security, semantické vyhledávání a monitoring
- **Osvědčené postupy**: Bezpečnost, výkon a vývojové pokyny
- **Řešení problémů**: Běžné problémy a jejich řešení

Ideální pro vývojáře, kteří chtějí pochopit detaily implementace a vytvořit podobná řešení.

## 🤖 Co je MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** je otevřený standard, který umožňuje AI asistentům bezpečně přistupovat k externím datovým zdrojům a nástrojům v reálném čase. Představte si to jako most, který umožňuje AI modelům připojit se k databázím, API, souborovým systémům a dalším zdrojům při zachování bezpečnosti a kontroly.

### Klíčové výhody:
- **Přístup k datům v reálném čase**: AI asistenti mohou dotazovat živé databáze a API
- **Bezpečná integrace**: Kontrolovaný přístup s autentizací a oprávněními  
- **Rozšiřitelnost nástrojů**: Přidání vlastních schopností AI asistentům
- **Standardizovaný protokol**: Funguje napříč různými AI platformami a nástroji

### Noví v MCP?

Pokud jste v Model Context Protocol noví, doporučujeme začít s komplexními zdroji pro začátečníky od Microsoftu:

**📖 [Průvodce MCP pro začátečníky](https://aka.ms/mcp-for-beginners)**

Tento zdroj poskytuje:
- Úvod do konceptů a architektury MCP
- Krok za krokem návody na vytvoření vašeho prvního MCP serveru
- Osvědčené postupy pro vývoj MCP
- Příklady integrace s populárními AI platformami
- Komunitní zdroje a podporu

Jakmile pochopíte základy, vraťte se sem a prozkoumejte tuto pokročilou implementaci analýzy maloobchodního prodeje!

## 📚 Komplexní průvodce učením: /walkthrough

Tento repozitář obsahuje kompletní **12-modulový průvodce učením**, který rozkládá tento MCP server pro maloobchod na stravitelné, krok za krokem lekce. Průvodce transformuje tento funkční příklad na komplexní vzdělávací zdroj ideální pro vývojáře, kteří chtějí pochopit, jak vytvořit produkčně připravené MCP servery s integrací databáze.

### Co se naučíte

Průvodce pokrývá vše od základních konceptů MCP po pokročilé nasazení v produkci, včetně:

- **Základy MCP**: Porozumění Model Context Protocol a jeho reálným aplikacím
- **Integrace databáze**: Implementace bezpečného připojení PostgreSQL s Row Level Security
- **AI vylepšené funkce**: Přidání schopností semantického vyhledávání pomocí embeddingů Azure OpenAI
- **Implementace bezpečnosti**: Autentizace na podnikové úrovni, autorizace a izolace dat
- **Vývoj nástrojů**: Vytváření sofistikovaných MCP nástrojů pro analýzu dat a business intelligence
- **Testování a ladění**: Komplexní strategie testování a techniky ladění
- **Integrace VS Code**: Konfigurace AI Chat pro dotazy na databázi pomocí přirozeného jazyka
- **Nasazení do produkce**: Kontejnerizace, škálování a strategie nasazení do cloudu
- **Monitoring a pozorovatelnost**: Application Insights, logování a monitoring výkonu

### Přehled učební cesty

Průvodce sleduje progresivní strukturu učení navrženou pro vývojáře všech úrovní dovedností:

| Modul | Oblast zaměření | Popis | Odhadovaný čas |
|-------|-----------------|-------|----------------|
| **[00-Úvod](walkthrough/00-Introduction/README.md)** | Základy | Koncepty MCP, případová studie Zava Retail, přehled architektury | 30 minut |
| **[01-Architektura](walkthrough/01-Architecture/README.md)** | Návrhové vzory | Technická architektura, vrstvený design, systémové komponenty | 45 minut |
| **[02-Bezpečnost](walkthrough/02-Security/README.md)** | Podniková bezpečnost | Autentizace Azure, Row Level Security, izolace pro více nájemců | 60 minut |
| **[03-Nastavení](walkthrough/03-Setup/README.md)** | Prostředí | Nastavení Dockeru, Azure CLI, konfigurace projektu, validace | 45 minut |
| **[04-Databáze](walkthrough/04-Database/README.md)** | Datová vrstva | Schéma PostgreSQL, pgvector, RLS politiky, ukázková data | 60 minut |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Základní implementace | FastMCP framework, integrace databáze, správa připojení | 90 minut |
| **[06-Nástroje](walkthrough/06-Tools/README.md)** | Vývoj nástrojů | Vytváření MCP nástrojů, validace dotazů, funkce business intelligence | 75 minut |
| **[07-Semantické vyhledávání](walkthrough/07-Semantic-Search/README.md)** | Integrace AI | Embeddingy Azure OpenAI, vyhledávání vektoru, hybridní strategie vyhledávání | 60 minut |
| **[08-Testování](walkthrough/08-Testing/README.md)** | Zajištění kvality | Jednotkové testování, integrační testování, testování výkonu, ladění | 75 minut |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Vývojové prostředí | Konfigurace VS Code, integrace AI Chat, pracovní postupy ladění | 45 minut |
| **[10-Nasazení](walkthrough/10-Deployment/README.md)** | Připraveno pro produkci | Kontejnerizace, Azure Container Apps, CI/CD pipelines, škálování | 90 minut |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Pozorovatelnost | Application Insights, strukturované logování, metriky výkonu | 60 minut |
| **[12-Osvědčené postupy](walkthrough/12-Best-Practices/README.md)** | Excelence v produkci | Zpevnění bezpečnosti, optimalizace výkonu, podnikové vzory | 45 minut |

**Celkový čas učení**: ~12-15 hodin komplexního praktického učení

### 🎯 Jak používat průvodce

**Pro začátečníky**:
1. Začněte s [Modulem 00: Úvod](walkthrough/00-Introduction/README.md) pro pochopení základů MCP
2. Postupujte moduly postupně pro kompletní vzdělávací zážitek
3. Každý modul staví na předchozích konceptech a obsahuje praktická cvičení

**Pro zkušené vývojáře**:
1. Projděte si [Hlavní přehled průvodce](walkthrough/README.md) pro kompletní shrnutí modulů
2. Přeskočte na konkrétní moduly, které vás zajímají (např. Modul 07 pro integraci AI)
3. Používejte jednotlivé moduly jako referenční materiál pro své vlastní projekty

**Pro implementaci v produkci**:
1. Zaměřte se na moduly 02 (Bezpečnost), 10 (Nasazení) a 11 (Monitoring)
2. Projděte si modul 12 (Osvědčené postupy) pro podnikové pokyny
3. Používejte příklady kódu jako šablony připravené pro produkci

### 🚀 Možnosti rychlého startu

**Možnost 1: Kompletní učební cesta** (doporučeno pro nováčky)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Možnost 2: Praktická implementace** (Začněte rovnou s budováním)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Možnost 3: Zaměření na produkci** (Podnikové nasazení)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Požadavky na znalosti

**Doporučené předpoklady**:
- Základní zkušenosti s programováním v Pythonu
- Znalost REST API a databází
- Obecné porozumění konceptům AI/ML
- Základní znalosti příkazového řádku a Dockeru

**Není nutné (ale užitečné)**:
- Předchozí zkušenosti s MCP (vysvětlujeme od základů)
- Zkušenosti s Azure cloudem (poskytujeme podrobný návod)
- Pokročilé znalosti PostgreSQL (vysvětlujeme koncepty podle potřeby)

### 💡 Tipy pro učení

1. **Praktický přístup**: Každý modul obsahuje funkční příklady kódu, které můžete spustit a upravit
2. **Postupná složitost**: Koncepty se budují postupně od jednoduchých k pokročilým
3. **Reálný kontext**: Všechny příklady využívají realistické scénáře z oblasti maloobchodu
4. **Připraveno pro produkci**: Příklady kódu jsou navrženy pro skutečné použití v produkci
5. **Podpora komunity**: Připojte se k naší [komunitě na Discordu](https://discord.com/invite/ByRwuEEgH4) pro pomoc a diskuse

### 🔗 Související zdroje

- **[MCP pro začátečníky](https://aka.ms/mcp-for-beginners)**: Základní čtení
- **[Ukázkový průchod](Sample_Walkthrough.md)**: Technický přehled na vysoké úrovni
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloudová platforma použitá v příkladech
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Pythonový framework pro implementaci MCP

**Připraven/a začít?** Začněte s **[Modulem 00: Úvod](walkthrough/00-Introduction/README.md)** nebo prozkoumejte **[kompletní přehled průchodu](walkthrough/README.md)**.

## Požadavky

1. Nainstalovaný Docker Desktop
2. Nainstalovaný Git
3. **Azure CLI**: Nainstalujte a ověřte pomocí Azure CLI
4. Přístup k modelu OpenAI `text-embedding-3-small` a volitelně k modelu `gpt-4o-mini`.

## Začínáme

Otevřete okno terminálu a spusťte následující příkazy:

1. Ověřte se pomocí Azure CLI

    ```bash
    az login
    ```

2. Naklonujte repozitář

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Přejděte do adresáře projektu

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Nasazení Azure zdrojů

Spusťte následující skripty pro automatizaci nasazení Azure zdrojů potřebných pro MCP server.

Skripty nasazení automaticky nasadí model `text-embedding-3-small`. Během nasazení budete mít možnost zahrnout také model `gpt-4o-mini`. Upozorňujeme, že model `gpt-4o-mini` **není nutný** pro tento projekt a je zahrnut pouze pro možné budoucí rozšíření.

**Vyberte skript pro vaši platformu:**

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

## Spuštění MCP serveru

Nejjednodušší způsob, jak spustit kompletní stack (PostgreSQL + MCP server), je použití Docker Compose:

### Spuštění stacku

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

## Použití

Následující předpokládá, že budete používat vestavěnou podporu MCP serveru v VS Code.

1. Otevřete projekt ve VS Code. Z terminálu spusťte:

    ```bash
    code .
    ```

2. Spusťte jeden nebo více MCP serverů pomocí konfigurací v souboru `.vscode/mcp.json`. Soubor obsahuje čtyři různé konfigurace serveru, z nichž každá představuje roli manažera obchodu:

   - Každá konfigurace používá jedinečné ID uživatele RLS (Row Level Security)
   - Tato ID uživatelů simulují různé identity manažerů obchodů přistupujících k databázi
   - Systém RLS omezuje přístup k datům na základě přiděleného obchodu manažera
   - To napodobuje reálné scénáře, kdy se manažeři obchodů přihlašují pomocí různých účtů Entra ID

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

### Otevření AI chatu ve VS Code

1. Otevřete režim AI chatu ve VS Code
2. Zadejte **#zava** a vyberte jeden z MCP serverů, které jste spustili
3. Pokládejte otázky ohledně prodejních dat - viz ukázkové dotazy níže

### Ukázkové dotazy

1. Zobrazit 20 nejlepších produktů podle příjmů z prodeje
1. Zobrazit prodeje podle obchodu
1. Jaké byly prodeje za poslední čtvrtletí podle kategorií?
1. Jaké produkty prodáváme, které jsou podobné "nádobám na barvu"?

## Funkce

- **Přístup ke schématům více tabulek**: Získání schémat pro více databázových tabulek v jedné žádosti
- **Bezpečné provádění dotazů**: Provádění dotazů PostgreSQL s podporou Row Level Security (RLS)
- **Data v reálném čase**: Přístup k aktuálním prodejním, inventárním a zákaznickým datům
- **Datum/čas nástroje**: Získání aktuálních UTC časových značek pro analýzu citlivou na čas
- **Flexibilní nasazení**: Podpora režimu HTTP serveru

## Podporované tabulky

Server poskytuje přístup k následujícím tabulkám maloobchodní databáze:

- `retail.customers` - Informace o zákaznících a profily
- `retail.stores` - Lokace obchodů a detaily
- `retail.categories` - Kategorie produktů a hierarchie
- `retail.product_types` - Klasifikace typů produktů
- `retail.products` - Katalog produktů a specifikace
- `retail.orders` - Objednávky zákazníků a transakce
- `retail.order_items` - Jednotlivé položky v objednávkách
- `retail.inventory` - Aktuální úrovně zásob a data o skladování

## Dostupné nástroje

### `get_multiple_table_schemas`

Získání schémat databázových tabulek pro více tabulek v jedné žádosti.

**Parametry:**

- `table_names` (list[str]): Seznam platných názvů tabulek z výše uvedených podporovaných tabulek

**Výstup:** Spojené řetězce schémat pro požadované tabulky

### `execute_sales_query`

Provádění dotazů PostgreSQL proti databázi prodejů s podporou Row Level Security.

**Parametry:**

- `postgresql_query` (str): Dobře vytvořený dotaz PostgreSQL

**Výstup:** Výsledky dotazu formátované jako řetězec (omezeno na 20 řádků pro čitelnost)

**Nejlepší postupy:**

- Vždy nejprve získat schémata tabulek
- Používat přesné názvy sloupců ze schémat
- Spojovat související tabulky pro komplexní analýzu
- Agregovat výsledky, pokud je to vhodné
- Omezit výstup pro čitelnost

### `get_current_utc_date`

Získání aktuálního UTC data a času ve formátu ISO.

**Výstup:** Aktuální UTC datum/čas ve formátu ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Provádění sémantického vyhledávání produktů na základě uživatelských dotazů.

**Výstup:** Seznam produktů odpovídajících kritériím vyhledávání

**Parametry:**

- `query` (str): Řetězec dotazu pro vyhledávání

**Výstup:** Seznam produktů odpovídajících kritériím vyhledávání

## Bezpečnostní funkce

### Row Level Security (RLS)

Server implementuje Row Level Security, aby zajistil, že uživatelé mají přístup pouze k datům, ke kterým jsou oprávněni:

- **Režim HTTP**: Používá hlavičku `x-rls-user-id` k identifikaci požadujícího uživatele

- **Výchozí záloha**: Používá UUID jako zástupce, pokud není poskytnuto ID uživatele

#### Specifická RLS ID uživatelů pro obchody

Každá lokace obchodu Zava Retail má jedinečné RLS ID uživatele, které určuje, ke kterým datům má uživatel přístup:

| Lokace obchodu | RLS ID uživatele | Popis |
|----------------|------------------|-------|
| **Globální přístup** | `00000000-0000-0000-0000-000000000000` | Výchozí záloha - přístup ke všem obchodům |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Data obchodu Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Data obchodu Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Data obchodu Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Data obchodu Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Data obchodu Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Data obchodu Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Data obchodu Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Data online obchodu Zava Retail |

#### Implementace RLS

Když se uživatel připojí s konkrétním RLS ID uživatele obchodu, uvidí pouze:

- Zákazníky spojené s tímto obchodem
- Objednávky provedené v této lokaci obchodu
- Data inventáře pro tento konkrétní obchod
- Prodejní a výkonnostní metriky specifické pro obchod

To zajišťuje izolaci dat mezi různými lokacemi obchodů při zachování jednotného schématu databáze.

## Architektura

### Kontext aplikace

Server používá spravovaný kontext aplikace s:

- **Pool připojení k databázi**: Efektivní správa připojení pro režim HTTP
- **Správa životního cyklu**: Správné uvolnění zdrojů při vypnutí
- **Typová bezpečnost**: Silně typovaný kontext s datovou třídou `AppContext`

### Kontext požadavku

- **Extrahování hlaviček**: Bezpečné parsování hlaviček pro identifikaci uživatele
- **Integrace RLS**: Automatické rozlišení ID uživatele z kontextu požadavku
- **Zpracování chyb**: Komplexní zpracování chyb s přívětivými zprávami

## Integrace databáze

Server se integruje s databází PostgreSQL prostřednictvím třídy `PostgreSQLSchemaProvider`:

- **Pool připojení**: Používá asynchronní pooly připojení pro škálovatelnost
- **Metadata schémat**: Poskytuje podrobné informace o schématech tabulek
- **Provádění dotazů**: Bezpečné provádění dotazů s podporou RLS
- **Správa zdrojů**: Automatické uvolnění zdrojů databáze

## Zpracování chyb

Server implementuje robustní zpracování chyb:

- **Validace tabulek**: Zajišťuje přístup pouze k platným názvům tabulek
- **Validace dotazů**: Ověřuje dotazy PostgreSQL před jejich provedením
- **Správa zdrojů**: Správné uvolnění i během chyb
- **Přívětivé zprávy**: Jasné chybové zprávy pro odstraňování problémů

## Bezpečnostní úvahy

1. **Row Level Security**: Všechny dotazy respektují politiky RLS na základě identity uživatele
2. **Izolace dat obchodů**: RLS ID uživatele každého obchodu zajišťuje přístup pouze k datům tohoto obchodu
3. **Validace vstupů**: Názvy tabulek a dotazy jsou ověřovány před provedením
4. **Limity zdrojů**: Výsledky dotazů jsou omezeny, aby se zabránilo nadměrnému využití zdrojů
5. **Bezpečnost připojení**: Používá bezpečné praktiky připojení k databázi
6. **Ověření identity uživatele**: Vždy zajistěte, že je použito správné RLS ID uživatele pro zamýšlenou lokaci obchodu

### Důležité bezpečnostní poznámky

- **Nikdy nepoužívejte produkční RLS ID uživatelů v vývojových prostředích**
- **Vždy ověřte, že RLS ID uživatele odpovídá zamýšlenému obchodu před spuštěním dotazů**
- **Výchozí UUID (`00000000-0000-0000-0000-000000000000`) poskytuje omezený přístup**
- **Každý manažer obchodu by měl mít přístup pouze k RLS ID uživatele svého obchodu**

## Vývoj

### Struktura projektu

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Klíčové komponenty

- **FastMCP Server**: Moderní implementace MCP serveru s podporou asynchronních operací
- **PostgreSQL Provider**: Abstrakční vrstva databáze s podporou RLS
- **Správa kontextu**: Typově bezpečné zpracování kontextu aplikace a požadavků
- **Registrace nástrojů**: Deklarativní registrace nástrojů s validací pomocí Pydantic

## Přispívání

Při přispívání do tohoto serveru:

1. Zajistěte, aby všechny dotazy k databázi respektovaly Row Level Security
2. Přidejte správné zpracování chyb pro nové nástroje
3. Aktualizujte tento README s novými funkcemi nebo změnami
4. Otestujte režim HTTP serveru
5. Ověřte vstupní parametry a poskytujte jasné chybové zprávy

## [Licence](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Tento MCP server umožňuje bezpečný a efektivní přístup k prodejním datům Zava Retail pro analýzu a přehledy poháněné AI.*

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nenese odpovědnost za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.