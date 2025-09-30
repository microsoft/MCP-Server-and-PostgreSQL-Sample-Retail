<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T06:40:56+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "sk"
}
-->
# 🚀 MCP Server s PostgreSQL - Kompletný sprievodca učením

## 🧠 Prehľad učebnej cesty integrácie MCP databázy

Tento komplexný sprievodca učením vás naučí, ako vytvoriť produkčne pripravené **Model Context Protocol (MCP) servery**, ktoré sa integrujú s databázami prostredníctvom praktickej implementácie maloobchodnej analytiky. Naučíte sa vzory na podnikovej úrovni vrátane **Row Level Security (RLS)**, **semantického vyhľadávania**, **integrácie Azure AI** a **prístupu k dátam pre viacerých nájomcov**.

Či už ste backendový vývojár, AI inžinier alebo dátový architekt, tento sprievodca poskytuje štruktúrované učenie s príkladmi z reálneho sveta a praktickými cvičeniami.

## 🔗 Oficiálne MCP zdroje

- 📘 [MCP Dokumentácia](https://modelcontextprotocol.io/) – Podrobné tutoriály a používateľské príručky
- 📜 [MCP Špecifikácia](https://modelcontextprotocol.io/docs/) – Architektúra protokolu a technické referencie
- 🧑‍💻 [MCP GitHub Repozitár](https://github.com/modelcontextprotocol) – Open-source SDK, nástroje a ukážky kódu
- 🌐 [MCP Komunita](https://github.com/orgs/modelcontextprotocol/discussions) – Pripojte sa k diskusiám a prispievajte do komunity
- 📚 [MCP pre začiatočníkov](https://aka.ms/mcp-for-beginners) – Začnite tu, ak ste v MCP nováčik

## 🧭 Učebná cesta integrácie MCP databázy

### 📚 Kompletná štruktúra učenia

| Modul | Téma | Popis | Odkaz |
|-------|------|-------|-------|
| **Moduly 1-3: Základy** | | | |
| 00 | [Úvod do integrácie MCP databázy](./00-Introduction/README.md) | Prehľad MCP s integráciou databázy a prípadová štúdia maloobchodnej analytiky | [Začnite tu](./00-Introduction/README.md) |
| 01 | [Základné koncepty architektúry](./01-Architecture/README.md) | Porozumenie architektúre MCP servera, databázovým vrstvám a bezpečnostným vzorom | [Učte sa](./01-Architecture/README.md) |
| 02 | [Bezpečnosť a multi-tenancy](./02-Security/README.md) | Row Level Security, autentifikácia a prístup k dátam pre viacerých nájomcov | [Učte sa](./02-Security/README.md) |
| 03 | [Nastavenie prostredia](./03-Setup/README.md) | Nastavenie vývojového prostredia, Docker, Azure zdroje | [Nastavte](./03-Setup/README.md) |
| **Moduly 4-6: Budovanie MCP servera** | | | |
| 04 | [Návrh databázy a schéma](./04-Database/README.md) | Nastavenie PostgreSQL, návrh maloobchodnej schémy a vzorové dáta | [Budujte](./04-Database/README.md) |
| 05 | [Implementácia MCP servera](./05-MCP-Server/README.md) | Budovanie FastMCP servera s integráciou databázy | [Budujte](./05-MCP-Server/README.md) |
| 06 | [Vývoj nástrojov](./06-Tools/README.md) | Tvorba nástrojov na dotazovanie databázy a introspekciu schémy | [Budujte](./06-Tools/README.md) |
| **Moduly 7-9: Pokročilé funkcie** | | | |
| 07 | [Integrácia semantického vyhľadávania](./07-Semantic-Search/README.md) | Implementácia vektorových embeddingov s Azure OpenAI a pgvector | [Pokročte](./07-Semantic-Search/README.md) |
| 08 | [Testovanie a ladenie](./08-Testing/README.md) | Testovacie stratégie, nástroje na ladenie a validačné prístupy | [Testujte](./08-Testing/README.md) |
| 09 | [Integrácia VS Code](./09-VS-Code/README.md) | Konfigurácia VS Code MCP integrácie a používanie AI Chat | [Integrujte](./09-VS-Code/README.md) |
| **Moduly 10-12: Produkcia a najlepšie praktiky** | | | |
| 10 | [Stratégie nasadenia](./10-Deployment/README.md) | Nasadenie pomocou Dockeru, Azure Container Apps a úvahy o škálovaní | [Nasadzujte](./10-Deployment/README.md) |
| 11 | [Monitoring a pozorovateľnosť](./11-Monitoring/README.md) | Application Insights, logovanie, monitoring výkonu | [Monitorujte](./11-Monitoring/README.md) |
| 12 | [Najlepšie praktiky a optimalizácia](./12-Best-Practices/README.md) | Optimalizácia výkonu, posilnenie bezpečnosti a tipy pre produkciu | [Optimalizujte](./12-Best-Practices/README.md) |

### 💻 Čo vytvoríte

Na konci tejto učebnej cesty budete mať kompletný **Zava Retail Analytics MCP Server**, ktorý obsahuje:

- **Maloobchodnú databázu s viacerými tabuľkami** vrátane zákazníckych objednávok, produktov a inventára
- **Row Level Security** na izoláciu dát podľa obchodov
- **Semantické vyhľadávanie produktov** pomocou embeddingov Azure OpenAI
- **Integráciu VS Code AI Chat** na dotazy v prirodzenom jazyku
- **Produkčne pripravené nasadenie** s Dockerom a Azure
- **Komplexný monitoring** pomocou Application Insights

## 🎯 Predpoklady pre učenie

Aby ste z tejto učebnej cesty získali maximum, mali by ste mať:

- **Skúsenosti s programovaním**: Znalosť Pythonu (preferovaný) alebo podobných jazykov
- **Znalosť databáz**: Základné porozumenie SQL a relačným databázam
- **Koncepty API**: Porozumenie REST API a HTTP konceptom
- **Vývojové nástroje**: Skúsenosti s príkazovým riadkom, Gitom a editormi kódu
- **Základy cloudu**: (Voliteľné) Základné znalosti Azure alebo podobných cloudových platforiem
- **Znalosť Dockeru**: (Voliteľné) Porozumenie konceptom kontajnerizácie

### Potrebné nástroje

- **Docker Desktop** - Na spustenie PostgreSQL a MCP servera
- **Azure CLI** - Na nasadenie cloudových zdrojov
- **VS Code** - Na vývoj a integráciu MCP
- **Git** - Na verzionovanie
- **Python 3.8+** - Na vývoj MCP servera

## 📚 Sprievodca učením a zdroje

Táto učebná cesta obsahuje komplexné zdroje, ktoré vám pomôžu efektívne sa orientovať:

### Sprievodca učením

Každý modul obsahuje:
- **Jasné ciele učenia** - Čo dosiahnete
- **Krok za krokom inštrukcie** - Podrobné implementačné príručky
- **Príklady kódu** - Fungujúce ukážky s vysvetleniami
- **Cvičenia** - Príležitosti na praktické precvičenie
- **Príručky na riešenie problémov** - Bežné problémy a riešenia
- **Dodatočné zdroje** - Ďalšie čítanie a prieskum

### Kontrola predpokladov

Pred začatím každého modulu nájdete:
- **Požadované znalosti** - Čo by ste mali vedieť vopred
- **Validácia nastavenia** - Ako overiť vaše prostredie
- **Odhady času** - Očakávaný čas na dokončenie
- **Výsledky učenia** - Čo budete vedieť po dokončení

### Odporúčané učebné cesty

Vyberte si cestu podľa vašej úrovne skúseností:

#### 🟢 **Cesta pre začiatočníkov** (Nováčik v MCP)
1. Začnite s [MCP pre začiatočníkov](https://aka.ms/mcp-for-beginners)
2. Dokončite moduly 00-03 na pochopenie základov
3. Pokračujte modulmi 04-06 na praktické budovanie
4. Skúste moduly 07-09 na praktické použitie

#### 🟡 **Cesta pre stredne pokročilých** (Niektoré skúsenosti s MCP)
1. Prejdite moduly 00-01 na koncepty špecifické pre databázy
2. Zamerajte sa na moduly 02-06 na implementáciu
3. Ponorte sa do modulov 07-12 na pokročilé funkcie

#### 🔴 **Cesta pre pokročilých** (Skúsení v MCP)
1. Prejdite moduly 00-03 na kontext
2. Zamerajte sa na moduly 04-09 na integráciu databázy
3. Koncentrujte sa na moduly 10-12 na produkčné nasadenie

## 🛠️ Ako efektívne používať túto učebnú cestu

### Sekvenčné učenie (Odporúčané)

Prejdite moduly postupne na komplexné porozumenie:

1. **Prečítajte si prehľad** - Pochopte, čo sa naučíte
2. **Skontrolujte predpoklady** - Uistite sa, že máte potrebné znalosti
3. **Postupujte podľa krok za krokom príručiek** - Implementujte počas učenia
4. **Dokončite cvičenia** - Posilnite svoje porozumenie
5. **Preskúmajte kľúčové poznatky** - Upevnite výsledky učenia

### Cielené učenie

Ak potrebujete konkrétne zručnosti:

- **Integrácia databázy**: Zamerajte sa na moduly 04-06
- **Implementácia bezpečnosti**: Koncentrujte sa na moduly 02, 08, 12
- **AI/Semantické vyhľadávanie**: Ponorte sa do modulu 07
- **Produkčné nasadenie**: Študujte moduly 10-12

### Praktické cvičenie

Každý modul obsahuje:
- **Fungujúce príklady kódu** - Kopírujte, upravujte a experimentujte
- **Scenáre z reálneho sveta** - Praktické prípady použitia maloobchodnej analytiky
- **Progresívnu komplexnosť** - Budovanie od jednoduchého k pokročilému
- **Kroky validácie** - Overte, že vaša implementácia funguje

## 🌟 Komunita a podpora

### Získajte pomoc

- **Azure AI Discord**: [Pripojte sa na odbornú podporu](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Nahláste problémy alebo položte otázky](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Komunita**: [Pripojte sa k širším diskusiám o MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Prispievajte

Uvítame príspevky na zlepšenie tejto učebnej cesty:
- **Opravte chyby alebo preklepy** - Podajte pull requesty
- **Pridajte príklady** - Zdieľajte svoje implementácie
- **Zlepšite dokumentáciu** - Pomôžte ostatným učiť sa
- **Nahláste problémy** - Pomôžte nám opraviť problémy

## 📜 Informácie o licencii

Tento učebný obsah je licencovaný pod MIT licenciou. Pozrite si súbor [LICENSE](../../../LICENSE) pre podmienky a pravidlá.

## 🚀 Pripravení začať?

Začnite svoju cestu s **[Modulom 00: Úvod do integrácie MCP databázy](./00-Introduction/README.md)**

---

*Ovládnite budovanie produkčne pripravených MCP serverov s integráciou databázy prostredníctvom tejto komplexnej, praktickej učebnej skúsenosti.*

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.