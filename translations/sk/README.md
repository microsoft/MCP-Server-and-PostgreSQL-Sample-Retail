<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:13:56+00:00",
  "source_file": "README.md",
  "language_code": "sk"
}
-->
# MCP Server a PostgreSQL Ukážka - Analýza maloobchodného predaja

## Naučte sa MCP s integráciou databázy prostredníctvom praktických príkladov

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Pripojte sa k Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Postupujte podľa týchto krokov, aby ste mohli začať používať tieto zdroje:

1. **Forknite repozitár**: Kliknite [sem na forknutie](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klonujte repozitár**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Pripojte sa k Azure AI Foundry Discord**: [Spojte sa s odborníkmi a ďalšími vývojármi](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podpora viacerých jazykov

#### Podporované prostredníctvom GitHub Action (automatizované a vždy aktuálne)

[Francúzština](../fr/README.md) | [Španielčina](../es/README.md) | [Nemčina](../de/README.md) | [Ruština](../ru/README.md) | [Arabčina](../ar/README.md) | [Perzština (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradičná, Macao)](../mo/README.md) | [Čínština (tradičná, Hongkong)](../hk/README.md) | [Čínština (tradičná, Taiwan)](../tw/README.md) | [Japončina](../ja/README.md) | [Kórejčina](../ko/README.md) | [Hindčina](../hi/README.md) | [Bengálčina](../bn/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Portugalčina (Portugalsko)](../pt/README.md) | [Portugalčina (Brazília)](../br/README.md) | [Taliančina](../it/README.md) | [Poľština](../pl/README.md) | [Turečtina](../tr/README.md) | [Gréčtina](../el/README.md) | [Thajčina](../th/README.md) | [Švédčina](../sv/README.md) | [Dánčina](../da/README.md) | [Nórčina](../no/README.md) | [Fínčina](../fi/README.md) | [Holandčina](../nl/README.md) | [Hebrejčina](../he/README.md) | [Vietnamčina](../vi/README.md) | [Indonézština](../id/README.md) | [Malajčina](../ms/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Swahilčina](../sw/README.md) | [Maďarčina](../hu/README.md) | [Čeština](../cs/README.md) | [Slovenčina](./README.md) | [Rumunčina](../ro/README.md) | [Bulharčina](../bg/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Chorvátčina](../hr/README.md) | [Slovinčina](../sl/README.md) | [Ukrajinčina](../uk/README.md) | [Barmčina (Mjanmarsko)](../my/README.md)

**Ak si želáte podporu ďalších jazykov, zoznam podporovaných jazykov nájdete [tu](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Úvod

Táto ukážka demonštruje, ako vytvoriť a nasadiť komplexný **Model Context Protocol (MCP) server**, ktorý poskytuje AI asistentom bezpečný a inteligentný prístup k údajom o maloobchodnom predaji prostredníctvom PostgreSQL. Projekt predstavuje funkcie na podnikovej úrovni, vrátane **Row Level Security (RLS)**, **semantického vyhľadávania** a **integrácie Azure AI** pre reálne scenáre analýzy maloobchodného predaja.

**Kľúčové prípady použitia:**
- **Analýza predaja poháňaná AI**: Umožnite AI asistentom dotazovať sa na údaje o maloobchodnom predaji a analyzovať ich prostredníctvom prirodzeného jazyka
- **Bezpečný prístup pre viacerých nájomcov**: Ukážka implementácie Row Level Security, kde rôzni manažéri obchodov majú prístup iba k údajom svojho obchodu
- **Semantické vyhľadávanie produktov**: Predstavte AI vylepšené objavovanie produktov pomocou textových embeddingov
- **Podniková integrácia**: Ukážka integrácie MCP serverov so službami Azure a databázami PostgreSQL

**Ideálne pre:**
- Vývojárov, ktorí sa učia vytvárať MCP servery s integráciou databázy
- Datových inžinierov implementujúcich bezpečné analytické riešenia pre viacerých nájomcov
- Vývojárov AI aplikácií pracujúcich s maloobchodnými alebo e-commerce údajmi
- Každého, kto má záujem kombinovať AI asistentov s podnikovými databázami

## Pripojte sa k Azure AI Foundry Discord komunite
Podeľte sa o svoje skúsenosti s MCP a stretnite sa s odborníkmi a produktovými skupinami

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server pre analýzu predaja

Model Context Protocol (MCP) server, ktorý poskytuje komplexný prístup k databáze zákazníckeho predaja pre Zava Retail DIY Business. Tento server umožňuje AI asistentom dotazovať sa na údaje o maloobchodnom predaji a analyzovať ich prostredníctvom bezpečného, schémovo orientovaného rozhrania.

## 📚 Kompletný implementačný sprievodca

Pre podrobný rozbor, ako je toto riešenie vytvorené a ako implementovať podobné MCP servery, si pozrite náš komplexný **[Ukážkový sprievodca](Sample_Walkthrough.md)**. Tento sprievodca poskytuje:

- **Hĺbkovú analýzu architektúry**: Analýza komponentov a návrhových vzorov
- **Krok za krokom budovanie**: Od nastavenia projektu po nasadenie
- **Rozbor kódu**: Podrobné vysvetlenie implementácie MCP servera
- **Pokročilé funkcie**: Row Level Security, semantické vyhľadávanie a monitorovanie
- **Najlepšie postupy**: Bezpečnosť, výkon a vývojové pokyny
- **Riešenie problémov**: Bežné problémy a ich riešenia

Ideálne pre vývojárov, ktorí chcú pochopiť detaily implementácie a vytvárať podobné riešenia.

## 🤖 Čo je MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** je otvorený štandard, ktorý umožňuje AI asistentom bezpečne pristupovať k externým zdrojom údajov a nástrojom v reálnom čase. Predstavte si ho ako most, ktorý umožňuje AI modelom pripojiť sa k databázam, API, súborovým systémom a ďalším zdrojom pri zachovaní bezpečnosti a kontroly.

### Kľúčové výhody:
- **Prístup k údajom v reálnom čase**: AI asistenti môžu dotazovať živé databázy a API
- **Bezpečná integrácia**: Kontrolovaný prístup s autentifikáciou a povoleniami  
- **Rozšíriteľnosť nástrojov**: Pridanie vlastných schopností AI asistentom
- **Štandardizovaný protokol**: Funguje na rôznych AI platformách a nástrojoch

### Noví v MCP?

Ak ste noví v Model Context Protocol, odporúčame začať s komplexnými zdrojmi pre začiatočníkov od Microsoftu:

**📖 [Sprievodca MCP pre začiatočníkov](https://aka.ms/mcp-for-beginners)**

Tento zdroj poskytuje:
- Úvod do konceptov MCP a architektúry
- Krok za krokom tutoriály na vytvorenie vášho prvého MCP servera
- Najlepšie postupy pre vývoj MCP
- Príklady integrácie s populárnymi AI platformami
- Komunitné zdroje a podporu

Keď pochopíte základy, vráťte sa sem a preskúmajte túto pokročilú implementáciu analýzy maloobchodného predaja!

## 📚 Komplexný vzdelávací sprievodca: /walkthrough

Tento repozitár obsahuje kompletný **12-modulový vzdelávací sprievodca**, ktorý rozkladá túto ukážku MCP servera pre maloobchod na stráviteľné, krok za krokom lekcie. Sprievodca transformuje tento funkčný príklad na komplexný vzdelávací zdroj ideálny pre vývojárov, ktorí chcú pochopiť, ako vytvárať produkčne pripravené MCP servery s integráciou databázy.

### Čo sa naučíte

Sprievodca pokrýva všetko od základných konceptov MCP po pokročilé nasadenie v produkcii, vrátane:

- **Základy MCP**: Pochopenie Model Context Protocol a jeho reálnych aplikácií
- **Integrácia databázy**: Implementácia bezpečného pripojenia PostgreSQL s Row Level Security
- **Funkcie vylepšené AI**: Pridanie semantických vyhľadávacích funkcií pomocou embeddingov Azure OpenAI
- **Implementácia bezpečnosti**: Autentifikácia na podnikovej úrovni, autorizácia a izolácia údajov
- **Vývoj nástrojov**: Vytváranie sofistikovaných MCP nástrojov pre analýzu údajov a obchodnú inteligenciu
- **Testovanie a ladenie**: Komplexné testovacie stratégie a techniky ladenia
- **Integrácia VS Code**: Konfigurácia AI Chat pre dotazy na databázu v prirodzenom jazyku
- **Nasadenie do produkcie**: Kontajnerizácia, škálovanie a stratégie nasadenia do cloudu
- **Monitorovanie a pozorovateľnosť**: Application Insights, logovanie a monitorovanie výkonu

### Prehľad vzdelávacej cesty

Sprievodca nasleduje progresívnu vzdelávaciu štruktúru navrhnutú pre vývojárov všetkých úrovní zručností:

| Modul | Oblasť zamerania | Popis | Odhadovaný čas |
|-------|------------------|-------|----------------|
| **[00-Úvod](walkthrough/00-Introduction/README.md)** | Základy | Koncepty MCP, prípadová štúdia Zava Retail, prehľad architektúry | 30 minút |
| **[01-Architektúra](walkthrough/01-Architecture/README.md)** | Návrhové vzory | Technická architektúra, vrstvený dizajn, systémové komponenty | 45 minút |
| **[02-Bezpečnosť](walkthrough/02-Security/README.md)** | Podniková bezpečnosť | Autentifikácia Azure, Row Level Security, izolácia pre viacerých nájomcov | 60 minút |
| **[03-Nastavenie](walkthrough/03-Setup/README.md)** | Prostredie | Nastavenie Dockeru, Azure CLI, konfigurácia projektu, validácia | 45 minút |
| **[04-Databáza](walkthrough/04-Database/README.md)** | Datová vrstva | PostgreSQL schéma, pgvector, RLS politiky, ukážkové údaje | 60 minút |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Základná implementácia | FastMCP framework, integrácia databázy, správa pripojení | 90 minút |
| **[06-Nástroje](walkthrough/06-Tools/README.md)** | Vývoj nástrojov | Vytváranie MCP nástrojov, validácia dotazov, funkcie obchodnej inteligencie | 75 minút |
| **[07-Semantické vyhľadávanie](walkthrough/07-Semantic-Search/README.md)** | Integrácia AI | Embeddingy Azure OpenAI, vyhľadávanie vektorov, hybridné vyhľadávacie stratégie | 60 minút |
| **[08-Testovanie](walkthrough/08-Testing/README.md)** | Zabezpečenie kvality | Jednotkové testovanie, integračné testovanie, testovanie výkonu, ladenie | 75 minút |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Vývojové prostredie | Konfigurácia VS Code, integrácia AI Chat, pracovné postupy ladenia | 45 minút |
| **[10-Nasadenie](walkthrough/10-Deployment/README.md)** | Pripravené na produkciu | Kontajnerizácia, Azure Container Apps, CI/CD pipelines, škálovanie | 90 minút |
| **[11-Monitorovanie](walkthrough/11-Monitoring/README.md)** | Pozorovateľnosť | Application Insights, štruktúrované logovanie, metriky výkonu | 60 minút |
| **[12-Najlepšie postupy](walkthrough/12-Best-Practices/README.md)** | Excelencia v produkcii | Posilnenie bezpečnosti, optimalizácia výkonu, podnikové vzory | 45 minút |

**Celkový čas učenia**: ~12-15 hodín komplexného praktického učenia

### 🎯 Ako používať sprievodcu

**Pre začiatočníkov**:
1. Začnite s [Modulom 00: Úvod](walkthrough/00-Introduction/README.md) na pochopenie základov MCP
2. Postupujte modulmi postupne pre kompletný vzdelávací zážitok
3. Každý modul stavia na predchádzajúcich konceptoch a obsahuje praktické cvičenia

**Pre skúsených vývojárov**:
1. Prezrite si [Hlavný prehľad sprievodcu](walkthrough/README.md) pre súhrn modulov
2. Preskočte na konkrétne moduly, ktoré vás zaujímajú (napr. Modul 07 pre integráciu AI)
3. Používajte jednotlivé moduly ako referenčný materiál pre vaše vlastné projekty

**Pre produkčnú implementáciu**:
1. Zamerajte sa na moduly 02 (Bezpečnosť), 10 (Nasadenie) a 11 (Monitorovanie)
2. Prezrite si modul 12 (Najlepšie postupy) pre podnikové pokyny
3. Používajte príklady kódu ako šablóny pripravené na produkciu

### 🚀 Možnosti rýchleho štartu

**Možnosť 1: Kompletná vzdelávacia cesta** (Odporúčané pre nováčikov)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Možnosť 2: Praktická implementácia** (Začnite priamo s budovaním)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Možnosť 3: Zameranie na produkciu** (Podnikové nasadenie)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Požiadavky na učenie

**Odporúčané predpoklady**:
- Základné skúsenosti s programovaním v Pythone
- Znalosť REST API a databáz
- Všeobecné pochopenie konceptov AI/ML
- Základné znalosti príkazového riadku a Dockeru

**Nie je potrebné (ale užitočné)**:
- Predchádzajúce skúsenosti s MCP (vysvetľujeme od základov)
- Skúsenosti s Azure cloudom (poskytujeme podrobný návod)
- Pokročilé znalosti PostgreSQL (vysvetľujeme koncepty podľa potreby)

### 💡 Tipy na učenie

1. **Praktický prístup**: Každý modul obsahuje funkčné príklady kódu, ktoré môžete spustiť a upraviť
2. **Postupná náročnosť**: Koncepty sa budujú postupne od jednoduchých po pokročilé
3. **Reálny kontext**: Všetky príklady využívajú realistické scenáre z maloobchodu
4. **Pripravené na produkciu**: Príklady kódu sú navrhnuté pre skutočné použitie v produkcii
5. **Podpora komunity**: Pridajte sa k našej [Discord komunite](https://discord.com/invite/ByRwuEEgH4) pre pomoc a diskusie

### 🔗 Súvisiace zdroje

- **[MCP pre začiatočníkov](https://aka.ms/mcp-for-beginners)**: Základné čítanie
- **[Ukážkový prehľad](Sample_Walkthrough.md)**: Vysokoúrovňový technický prehľad
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloudová platforma použitá v príkladoch
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Rámec pre implementáciu MCP v Pythone

**Pripravení začať?** Začnite s **[Modul 00: Úvod](walkthrough/00-Introduction/README.md)** alebo preskúmajte **[kompletný prehľad](walkthrough/README.md)**.

## Predpoklady

1. Nainštalovaný Docker Desktop
2. Nainštalovaný Git
3. **Azure CLI**: Nainštalujte a autentifikujte sa pomocou Azure CLI
4. Prístup k modelu OpenAI `text-embedding-3-small` a voliteľne k modelu `gpt-4o-mini`.

## Začíname

Otvorte terminálové okno a spustite nasledujúce príkazy:

1. Autentifikujte sa pomocou Azure CLI

    ```bash
    az login
    ```

2. Klonujte repozitár

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Prejdite do adresára projektu

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Nasadenie Azure zdrojov

Spustite nasledujúce skripty na automatizáciu nasadenia Azure zdrojov potrebných pre MCP server.

Nasadzovacie skripty automaticky nasadia model `text-embedding-3-small`. Počas nasadenia budete mať možnosť zahrnúť aj model `gpt-4o-mini`. Upozorňujeme, že model `gpt-4o-mini` **nie je potrebný** pre tento projekt a je zahrnutý len pre potenciálne budúce vylepšenia.

**Vyberte skript pre vašu platformu:**

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

## Spustenie MCP servera

Najjednoduchší spôsob, ako spustiť kompletný stack (PostgreSQL + MCP Server), je pomocou Docker Compose:

### Spustenie stacku

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

## Použitie

Nasledujúce predpokladá, že budete používať vstavanú podporu MCP servera vo VS Code.

1. Otvorte projekt vo VS Code. Z terminálu spustite:

    ```bash
    code .
    ```

2. Spustite jeden alebo viac MCP serverov pomocou konfigurácií v súbore `.vscode/mcp.json`. Súbor obsahuje štyri rôzne konfigurácie servera, z ktorých každá predstavuje inú rolu manažéra predajne:

   - Každá konfigurácia používa jedinečné RLS (Row Level Security) ID používateľa
   - Tieto ID simulujú rôzne identity manažérov predajní pristupujúcich k databáze
   - Systém RLS obmedzuje prístup k údajom na základe priradenej predajne manažéra
   - Toto napodobňuje reálne scenáre, kde sa manažéri predajní prihlasujú pomocou rôznych účtov Entra ID

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

### Otvorte AI Chat vo VS Code

1. Otvorte režim AI Chat vo VS Code
2. Napíšte **#zava** a vyberte jeden z MCP serverov, ktoré ste spustili
3. Pýtajte sa otázky o predajných údajoch - Pozrite si ukážkové dotazy nižšie

### Ukážkové dotazy

1. Zobraziť top 20 produktov podľa tržieb
1. Zobraziť predaje podľa predajní
1. Aké boli predaje za posledný štvrťrok podľa kategórie?
1. Aké produkty predávame, ktoré sú podobné "nádobám na farbu"?

## Funkcie

- **Prístup k viacerým tabuľkám**: Získajte schémy pre viacero databázových tabuliek v jednej požiadavke
- **Bezpečné vykonávanie dotazov**: Spúšťajte PostgreSQL dotazy s podporou Row Level Security (RLS)
- **Dáta v reálnom čase**: Prístup k aktuálnym údajom o predajoch, zásobách a zákazníkoch
- **Nástroje pre dátum/čas**: Získajte aktuálne UTC časové pečiatky pre analýzy citlivé na čas
- **Flexibilné nasadenie**: Podpora režimu HTTP servera

## Podporované tabuľky

Server poskytuje prístup k nasledujúcim tabuľkám maloobchodnej databázy:

- `retail.customers` - Informácie a profily zákazníkov
- `retail.stores` - Lokality a detaily predajní
- `retail.categories` - Kategórie produktov a hierarchie
- `retail.product_types` - Klasifikácie typov produktov
- `retail.products` - Katalóg produktov a špecifikácie
- `retail.orders` - Objednávky a transakcie zákazníkov
- `retail.order_items` - Jednotlivé položky v objednávkach
- `retail.inventory` - Aktuálne úrovne zásob a údaje o sklade

## Dostupné nástroje

### `get_multiple_table_schemas`

Získajte schémy databáz pre viacero tabuliek v jednej požiadavke.

**Parametre:**

- `table_names` (list[str]): Zoznam platných názvov tabuliek z vyššie uvedených podporovaných tabuliek

**Výstup:** Spojené reťazce schém pre požadované tabuľky

### `execute_sales_query`

Spúšťajte PostgreSQL dotazy na predajnú databázu s podporou Row Level Security.

**Parametre:**

- `postgresql_query` (str): Správne zostavený PostgreSQL dotaz

**Výstup:** Výsledky dotazu vo formáte reťazca (obmedzené na 20 riadkov pre čitateľnosť)

**Najlepšie postupy:**

- Vždy najprv získajte schémy tabuliek
- Používajte presné názvy stĺpcov zo schém
- Spájajte súvisiace tabuľky pre komplexnú analýzu
- Agregujte výsledky, keď je to vhodné
- Obmedzte výstup pre lepšiu čitateľnosť

### `get_current_utc_date`

Získajte aktuálny dátum a čas UTC vo formáte ISO.

**Výstup:** Aktuálny dátum/čas UTC vo formáte ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Vykonajte sémantické vyhľadávanie produktov na základe používateľských dotazov.

**Parametre:**

- `query` (str): Reťazec vyhľadávacieho dotazu

**Výstup:** Zoznam produktov zodpovedajúcich kritériám vyhľadávania

## Bezpečnostné funkcie

### Row Level Security (RLS)

Server implementuje Row Level Security, aby zabezpečil, že používatelia majú prístup len k údajom, na ktoré sú oprávnení:

- **Režim HTTP**: Používa hlavičku `x-rls-user-id` na identifikáciu žiadajúceho používateľa

- **Predvolená záloha**: Používa zástupné UUID, keď nie je poskytnuté ID používateľa

#### Špecifické RLS ID používateľov pre predajne

Každá predajňa Zava Retail má jedinečné RLS ID používateľa, ktoré určuje, ku ktorým údajom má používateľ prístup:

| Lokalita predajne | RLS ID používateľa | Popis |
|-------------------|--------------------|-------|
| **Globálny prístup** | `00000000-0000-0000-0000-000000000000` | Predvolená záloha - prístup ku všetkým predajniam |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Údaje predajne Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Údaje predajne Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Údaje predajne Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Údaje predajne Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Údaje predajne Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Údaje predajne Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Údaje predajne Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Údaje online predajne Zava Retail |

#### Implementácia RLS

Keď sa používateľ pripojí s konkrétnym RLS ID používateľa pre predajňu, uvidí iba:

- Zákazníkov priradených k tejto predajni
- Objednávky uskutočnené v tejto predajni
- Údaje o zásobách pre konkrétnu predajňu
- Predajné a výkonnostné metriky špecifické pre predajňu

Tým sa zabezpečí izolácia údajov medzi rôznymi predajňami pri zachovaní jednotnej databázovej schémy.

## Architektúra

### Kontext aplikácie

Server používa spravovaný aplikačný kontext s:

- **Pool pripojení k databáze**: Efektívne spravovanie pripojení pre režim HTTP
- **Správa životného cyklu**: Správne uvoľnenie zdrojov pri vypnutí
- **Typová bezpečnosť**: Silne typovaný kontext s dataclass `AppContext`

### Kontext požiadavky

- **Extrahovanie hlavičiek**: Bezpečné spracovanie hlavičiek na identifikáciu používateľa
- **Integrácia RLS**: Automatické rozpoznanie ID používateľa z kontextu požiadavky
- **Spracovanie chýb**: Komplexné spracovanie chýb s užívateľsky prívetivými správami

## Integrácia databázy

Server sa integruje s databázou PostgreSQL prostredníctvom triedy `PostgreSQLSchemaProvider`:

- **Pooling pripojení**: Používa asynchrónne pooly pripojení pre škálovateľnosť
- **Metadáta schém**: Poskytuje podrobné informácie o schémach tabuliek
- **Vykonávanie dotazov**: Bezpečné vykonávanie dotazov s podporou RLS
- **Správa zdrojov**: Automatické uvoľnenie databázových zdrojov

## Spracovanie chýb

Server implementuje robustné spracovanie chýb:

- **Validácia tabuliek**: Zabezpečuje prístup len k platným názvom tabuliek
- **Validácia dotazov**: Overuje PostgreSQL dotazy pred ich vykonaním
- **Správa zdrojov**: Správne uvoľnenie zdrojov aj počas chýb
- **Užívateľsky prívetivé správy**: Jasné chybové správy na riešenie problémov

## Bezpečnostné úvahy

1. **Row Level Security**: Všetky dotazy rešpektujú politiky RLS na základe identity používateľa
2. **Izolácia údajov predajní**: Každé RLS ID používateľa pre predajňu zabezpečuje prístup len k údajom tej predajne
3. **Validácia vstupov**: Názvy tabuliek a dotazy sú validované pred vykonaním
4. **Obmedzenia zdrojov**: Výsledky dotazov sú obmedzené, aby sa predišlo nadmernému využívaniu zdrojov
5. **Bezpečnosť pripojenia**: Používa bezpečné praktiky pripojenia k databáze
6. **Overenie identity používateľa**: Vždy zabezpečte, že správne RLS ID používateľa je použité pre zamýšľanú predajňu

### Dôležité bezpečnostné poznámky

- **Nikdy nepoužívajte produkčné RLS ID používateľov v testovacích prostrediach**
- **Vždy overte, že RLS ID používateľa zodpovedá zamýšľanej predajni pred spustením dotazov**
- **Predvolené UUID (`00000000-0000-0000-0000-000000000000`) poskytuje obmedzený prístup**
- **Každý manažér predajne by mal mať prístup len k RLS ID svojej predajne**

## Vývoj

### Štruktúra projektu

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Kľúčové komponenty

- **FastMCP Server**: Moderná implementácia MCP servera s podporou asynchrónnych operácií
- **PostgreSQL Provider**: Abstrakčná vrstva databázy s podporou RLS
- **Správa kontextu**: Typovo bezpečné spracovanie aplikačného a požiadavkového kontextu
- **Registrácia nástrojov**: Deklaratívna registrácia nástrojov s validáciou pomocou Pydantic

## Prispievanie

Pri prispievaní na tento server:

1. Zabezpečte, že všetky databázové dotazy rešpektujú Row Level Security
2. Pridajte správne spracovanie chýb pre nové nástroje
3. Aktualizujte tento README s akýmikoľvek novými funkciami alebo zmenami
4. Otestujte režim HTTP servera
5. Validujte vstupné parametre a poskytujte jasné chybové správy

## [Licencia](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Tento MCP server umožňuje bezpečný a efektívny prístup k predajným údajom Zava Retail pre analýzy a poznatky poháňané AI.*

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.