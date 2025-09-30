<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-30T06:50:11+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "sk"
}
-->
# Úvod do integrácie MCP s databázou

## 🎯 Čo tento modul pokrýva

Tento úvodný modul poskytuje komplexný prehľad o budovaní serverov Model Context Protocol (MCP) s integráciou databáz. Získate pochopenie obchodného prípadu, technickej architektúry a reálnych aplikácií prostredníctvom analytického prípadu Zava Retail.

## Prehľad

**Model Context Protocol (MCP)** umožňuje AI asistentom bezpečne pristupovať k externým zdrojom dát a interagovať s nimi v reálnom čase. V kombinácii s integráciou databáz MCP odomyká silné schopnosti pre aplikácie AI založené na dátach.

Táto vzdelávacia cesta vás naučí, ako vytvoriť produkčne pripravené MCP servery, ktoré prepájajú AI asistentov s údajmi o maloobchodnom predaji prostredníctvom PostgreSQL, pričom implementuje podnikové vzory ako Row Level Security, semantické vyhľadávanie a prístup k dátam pre viacerých nájomcov.

## Ciele vzdelávania

Na konci tohto modulu budete schopní:

- **Definovať** Model Context Protocol a jeho hlavné výhody pre integráciu databáz
- **Identifikovať** kľúčové komponenty architektúry MCP servera s databázami
- **Pochopiť** prípad použitia Zava Retail a jeho obchodné požiadavky
- **Rozpoznať** podnikové vzory pre bezpečný a škálovateľný prístup k databázam
- **Uviesť** nástroje a technológie použité v tejto vzdelávacej ceste

## 🧭 Výzva: AI a reálne dáta

### Obmedzenia tradičnej AI

Moderné AI asistenty sú neuveriteľne výkonné, ale čelia významným obmedzeniam pri práci s reálnymi obchodnými dátami:

| **Výzva** | **Popis** | **Dopad na podnikanie** |
|-----------|-----------|-------------------------|
| **Statické znalosti** | AI modely trénované na fixných datasetoch nemôžu pristupovať k aktuálnym obchodným dátam | Zastaralé poznatky, zmeškané príležitosti |
| **Dátové silá** | Informácie uzamknuté v databázach, API a systémoch, ku ktorým AI nemá prístup | Neúplná analýza, roztrieštené pracovné postupy |
| **Bezpečnostné obmedzenia** | Priamy prístup k databázam zvyšuje bezpečnostné a regulačné riziká | Obmedzené nasadenie, manuálna príprava dát |
| **Komplexné dotazy** | Obchodní používatelia potrebujú technické znalosti na získanie dátových poznatkov | Znížená adopcia, neefektívne procesy |

### Riešenie MCP

Model Context Protocol rieši tieto výzvy poskytovaním:

- **Prístupu k dátam v reálnom čase**: AI asistenti dotazujú živé databázy a API
- **Bezpečnej integrácie**: Kontrolovaný prístup s autentifikáciou a povoleniami
- **Rozhrania v prirodzenom jazyku**: Obchodní používatelia kladú otázky v bežnej angličtine
- **Štandardizovaného protokolu**: Funguje naprieč rôznymi AI platformami a nástrojmi

## 🏪 Zoznámte sa so Zava Retail: Naša študijná prípadová štúdia

Počas tejto vzdelávacej cesty vytvoríme MCP server pre **Zava Retail**, fiktívny reťazec DIY maloobchodov s viacerými predajňami. Tento realistický scenár demonštruje implementáciu MCP na podnikovej úrovni.

### Obchodný kontext

**Zava Retail** prevádzkuje:
- **8 kamenných predajní** v štáte Washington (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online predajňu** pre e-commerce predaj
- **Rozmanitý katalóg produktov** vrátane nástrojov, hardvéru, záhradných potrieb a stavebných materiálov
- **Viacúrovňové riadenie** s manažérmi predajní, regionálnymi manažérmi a vedúcimi pracovníkmi

### Obchodné požiadavky

Manažéri predajní a vedúci pracovníci potrebujú AI-poháňané analýzy na:

1. **Analýzu predajného výkonu** naprieč predajňami a časovými obdobiami
2. **Sledovanie úrovní zásob** a identifikáciu potrieb na doplnenie
3. **Pochopenie správania zákazníkov** a nákupných vzorcov
4. **Objavovanie produktových poznatkov** prostredníctvom semantického vyhľadávania
5. **Generovanie reportov** pomocou dotazov v prirodzenom jazyku
6. **Zachovanie bezpečnosti dát** s kontrolou prístupu na základe rolí

### Technické požiadavky

MCP server musí poskytovať:

- **Prístup k dátam pre viacerých nájomcov**, kde manažéri predajní vidia iba dáta svojej predajne
- **Flexibilné dotazovanie** podporujúce komplexné SQL operácie
- **Semantické vyhľadávanie** pre objavovanie produktov a odporúčania
- **Dáta v reálnom čase** odrážajúce aktuálny stav podnikania
- **Bezpečnú autentifikáciu** s Row Level Security
- **Škálovateľnú architektúru** podporujúcu viacerých súčasných používateľov

## 🏗️ Prehľad architektúry MCP servera

Náš MCP server implementuje vrstvenú architektúru optimalizovanú pre integráciu databáz:

```
┌─────────────────────────────────────────────────────────────┐
│                    VS Code AI Client                       │
│                  (Natural Language Queries)                │
└─────────────────────┬───────────────────────────────────────┘
                      │ HTTP/SSE
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                     MCP Server                             │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │   Tool Layer    │ │  Security Layer │ │  Config Layer │ │
│  │                 │ │                 │ │               │ │
│  │ • Query Tools   │ │ • RLS Context   │ │ • Environment │ │
│  │ • Schema Tools  │ │ • User Identity │ │ • Connections │ │
│  │ • Search Tools  │ │ • Access Control│ │ • Validation  │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ asyncpg
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                PostgreSQL Database                         │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │  Retail Schema  │ │   RLS Policies  │ │   pgvector    │ │
│  │                 │ │                 │ │               │ │
│  │ • Stores        │ │ • Store-based   │ │ • Embeddings  │ │
│  │ • Customers     │ │   Isolation     │ │ • Similarity  │ │
│  │ • Products      │ │ • Role Control  │ │   Search      │ │
│  │ • Orders        │ │ • Audit Logs    │ │               │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ REST API
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                  Azure OpenAI                              │
│               (Text Embeddings)                            │
└─────────────────────────────────────────────────────────────┘
```

### Kľúčové komponenty

#### **1. Vrstva MCP servera**
- **FastMCP Framework**: Moderná implementácia MCP servera v Pythone
- **Registrácia nástrojov**: Deklaratívne definície nástrojov s typovou bezpečnosťou
- **Kontext požiadavky**: Správa identity používateľa a relácie
- **Správa chýb**: Robustná správa chýb a logovanie

#### **2. Vrstva integrácie databáz**
- **Pooling pripojení**: Efektívna správa pripojení asyncpg
- **Poskytovateľ schém**: Dynamické objavovanie schém tabuliek
- **Executor dotazov**: Bezpečné vykonávanie SQL s kontextom RLS
- **Správa transakcií**: Dodržiavanie ACID a spracovanie rollbackov

#### **3. Bezpečnostná vrstva**
- **Row Level Security**: PostgreSQL RLS pre izoláciu dát viacerých nájomcov
- **Identita používateľa**: Autentifikácia a autorizácia manažérov predajní
- **Kontrola prístupu**: Jemne zrnité povolenia a auditné stopy
- **Validácia vstupov**: Prevencia SQL injekcií a validácia dotazov

#### **4. Vrstva AI vylepšení**
- **Semantické vyhľadávanie**: Vektorové embeddingy pre objavovanie produktov
- **Integrácia Azure OpenAI**: Generovanie textových embeddingov
- **Algoritmy podobnosti**: pgvector vyhľadávanie pomocou kosínovej podobnosti
- **Optimalizácia vyhľadávania**: Indexovanie a ladenie výkonu

## 🔧 Technologický stack

### Základné technológie

| **Komponent** | **Technológia** | **Účel** |
|---------------|----------------|----------|
| **MCP Framework** | FastMCP (Python) | Moderná implementácia MCP servera |
| **Databáza** | PostgreSQL 17 + pgvector | Relačné dáta s vektorovým vyhľadávaním |
| **AI služby** | Azure OpenAI | Textové embeddingy a jazykové modely |
| **Kontajnerizácia** | Docker + Docker Compose | Vývojové prostredie |
| **Cloudová platforma** | Microsoft Azure | Nasadenie do produkcie |
| **Integrácia IDE** | VS Code | AI Chat a pracovný tok vývoja |

### Vývojové nástroje

| **Nástroj** | **Účel** |
|-------------|----------|
| **asyncpg** | Vysoko výkonný PostgreSQL driver |
| **Pydantic** | Validácia a serializácia dát |
| **Azure SDK** | Integrácia cloudových služieb |
| **pytest** | Testovací framework |
| **Docker** | Kontajnerizácia a nasadenie |

### Produkčný stack

| **Služba** | **Azure Resource** | **Účel** |
|------------|--------------------|----------|
| **Databáza** | Azure Database for PostgreSQL | Spravovaná databázová služba |
| **Kontajner** | Azure Container Apps | Hosting kontajnerov bez servera |
| **AI služby** | Azure AI Foundry | OpenAI modely a endpointy |
| **Monitoring** | Application Insights | Pozorovateľnosť a diagnostika |
| **Bezpečnosť** | Azure Key Vault | Správa tajomstiev a konfigurácie |

## 🎬 Scenáre reálneho použitia

Pozrime sa, ako rôzni používatelia interagujú s naším MCP serverom:

### Scenár 1: Prehľad výkonu manažéra predajne

**Používateľ**: Sarah, manažérka predajne v Seattli  
**Cieľ**: Analyzovať predajný výkon za posledný štvrťrok

**Dotaz v prirodzenom jazyku**:
> "Ukáž mi 10 najlepších produktov podľa tržieb pre moju predajňu v Q4 2024"

**Čo sa stane**:
1. VS Code AI Chat pošle dotaz na MCP server
2. MCP server identifikuje kontext predajne Sarah (Seattle)
3. RLS politiky filtrujú dáta iba pre predajňu Seattle
4. SQL dotaz je vygenerovaný a vykonaný
5. Výsledky sú naformátované a vrátené do AI Chatu
6. AI poskytne analýzu a poznatky

### Scenár 2: Objavovanie produktov pomocou semantického vyhľadávania

**Používateľ**: Mike, manažér zásob  
**Cieľ**: Nájsť produkty podobné požiadavke zákazníka

**Dotaz v prirodzenom jazyku**:
> "Aké produkty predávame, ktoré sú podobné 'vodotesným elektrickým konektorom na vonkajšie použitie'?"

**Čo sa stane**:
1. Dotaz je spracovaný nástrojom semantického vyhľadávania
2. Azure OpenAI generuje vektor embedding
3. pgvector vykoná vyhľadávanie podobnosti
4. Súvisiace produkty sú zoradené podľa relevantnosti
5. Výsledky zahŕňajú detaily produktov a dostupnosť
6. AI navrhne alternatívy a možnosti balíčkovania

### Scenár 3: Analýza naprieč predajňami

**Používateľ**: Jennifer, regionálna manažérka  
**Cieľ**: Porovnať výkon naprieč všetkými predajňami

**Dotaz v prirodzenom jazyku**:
> "Porovnaj predaj podľa kategórií pre všetky predajne za posledných 6 mesiacov"

**Čo sa stane**:
1. RLS kontext je nastavený pre prístup regionálnej manažérky
2. Generuje sa komplexný dotaz pre viaceré predajne
3. Dáta sú agregované naprieč lokalitami predajní
4. Výsledky zahŕňajú trendy a porovnania
5. AI identifikuje poznatky a odporúčania

## 🔒 Hĺbkový pohľad na bezpečnosť a multi-tenancy

Naša implementácia kladie dôraz na bezpečnosť na podnikovej úrovni:

### Row Level Security (RLS)

PostgreSQL RLS zabezpečuje izoláciu dát:

```sql
-- Store managers see only their store's data
CREATE POLICY store_manager_policy ON retail.orders
  FOR ALL TO store_managers
  USING (store_id = get_current_user_store());

-- Regional managers see multiple stores
CREATE POLICY regional_manager_policy ON retail.orders
  FOR ALL TO regional_managers
  USING (store_id = ANY(get_user_store_list()));
```

### Správa identity používateľa

Každé pripojenie MCP zahŕňa:
- **ID manažéra predajne**: Jedinečný identifikátor pre kontext RLS
- **Priradenie rolí**: Povolenia a úrovne prístupu
- **Správa relácií**: Bezpečné autentifikačné tokeny
- **Auditné logovanie**: Kompletná história prístupu

### Ochrana dát

Viacero vrstiev bezpečnosti:
- **Šifrovanie pripojení**: TLS pre všetky pripojenia k databáze
- **Prevencia SQL injekcií**: Iba parametrizované dotazy
- **Validácia vstupov**: Komplexná validácia požiadaviek
- **Správa chýb**: Žiadne citlivé dáta v chybových správach

## 🎯 Kľúčové poznatky

Po dokončení tohto úvodu by ste mali rozumieť:

✅ **Hodnote MCP**: Ako MCP prepája AI asistentov s reálnymi dátami  
✅ **Obchodnému kontextu**: Požiadavkám a výzvam Zava Retail  
✅ **Prehľadu architektúry**: Kľúčovým komponentom a ich interakciám  
✅ **Technologickému stacku**: Nástrojom a frameworkom použitým v celom procese  
✅ **Bezpečnostnému modelu**: Prístupu k dátam pre viacerých nájomcov a ich ochrane  
✅ **Vzorcům použitia**: Scenárom dotazov a pracovným postupom v reálnom svete  

## 🚀 Čo ďalej

Pripravení ísť hlbšie? Pokračujte s:

**[Modul 01: Základné koncepty architektúry](../01-Architecture/README.md)**

Naučte sa o vzoroch architektúry MCP servera, princípoch návrhu databáz a podrobnej technickej implementácii, ktorá poháňa naše riešenie maloobchodnej analytiky.

## 📚 Ďalšie zdroje

### Dokumentácia MCP
- [Špecifikácia MCP](https://modelcontextprotocol.io/docs/) - Oficiálna dokumentácia protokolu
- [MCP pre začiatočníkov](https://aka.ms/mcp-for-beginners) - Komplexný sprievodca MCP
- [Dokumentácia FastMCP](https://github.com/modelcontextprotocol/python-sdk) - Dokumentácia Python SDK

### Integrácia databáz
- [Dokumentácia PostgreSQL](https://www.postgresql.org/docs/) - Kompletný referenčný materiál PostgreSQL
- [Sprievodca pgvector](https://github.com/pgvector/pgvector) - Dokumentácia rozšírenia pre vektory
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - Sprievodca PostgreSQL RLS

### Služby Azure
- [Dokumentácia Azure OpenAI](https://docs.microsoft.com/azure/cognitive-services/openai/) - Integrácia AI služieb
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Spravovaná databázová služba
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Kontajnery bez servera

---

**Upozornenie**: Toto je vzdelávacie cvičenie využívajúce fiktívne maloobchodné dáta. Pri implementácii podobných riešení v produkčnom prostredí vždy dodržiavajte pravidlá správy dát a bezpečnostné politiky vašej organizácie.

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.