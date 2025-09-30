<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T05:48:45+00:00",
  "source_file": "README.md",
  "language_code": "hu"
}
-->
# MCP Server és PostgreSQL Példa - Kiskereskedelmi Értékesítési Elemzés

## Tanulj MCP-t adatbázis integrációval gyakorlati példákon keresztül

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Csatlakozz az Azure AI Foundry Discordhoz](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Kövesd az alábbi lépéseket, hogy elkezdhesd használni ezeket az erőforrásokat:

1. **Forkold a repót**: Kattints [ide a forkhoz](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone-old a repót**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Csatlakozz az Azure AI Foundry Discordhoz**: [Találkozz szakértőkkel és fejlesztőkkel](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Többnyelvű támogatás

#### GitHub Action által támogatott (Automatikus és mindig naprakész)

[Francia](../fr/README.md) | [Spanyol](../es/README.md) | [Német](../de/README.md) | [Orosz](../ru/README.md) | [Arab](../ar/README.md) | [Perzsa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kínai (Egyszerűsített)](../zh/README.md) | [Kínai (Hagyományos, Makaó)](../mo/README.md) | [Kínai (Hagyományos, Hongkong)](../hk/README.md) | [Kínai (Hagyományos, Tajvan)](../tw/README.md) | [Japán](../ja/README.md) | [Koreai](../ko/README.md) | [Hindi](../hi/README.md) | [Bengáli](../bn/README.md) | [Marathi](../mr/README.md) | [Nepáli](../ne/README.md) | [Pandzsábi (Gurmukhi)](../pa/README.md) | [Portugál (Portugália)](../pt/README.md) | [Portugál (Brazília)](../br/README.md) | [Olasz](../it/README.md) | [Lengyel](../pl/README.md) | [Török](../tr/README.md) | [Görög](../el/README.md) | [Thai](../th/README.md) | [Svéd](../sv/README.md) | [Dán](../da/README.md) | [Norvég](../no/README.md) | [Finn](../fi/README.md) | [Holland](../nl/README.md) | [Héber](../he/README.md) | [Vietnámi](../vi/README.md) | [Indonéz](../id/README.md) | [Maláj](../ms/README.md) | [Tagalog (Filippínó)](../tl/README.md) | [Szuahéli](../sw/README.md) | [Magyar](./README.md) | [Cseh](../cs/README.md) | [Szlovák](../sk/README.md) | [Román](../ro/README.md) | [Bolgár](../bg/README.md) | [Szerb (Cirill)](../sr/README.md) | [Horvát](../hr/README.md) | [Szlovén](../sl/README.md) | [Ukrán](../uk/README.md) | [Burmai (Mianmar)](../my/README.md)

**Ha további fordításokat szeretnél, a támogatott nyelvek listája [itt található](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Bevezetés

Ez a példa bemutatja, hogyan lehet egy átfogó **Model Context Protocol (MCP) szervert** építeni és telepíteni, amely AI asszisztensek számára biztonságos, intelligens hozzáférést biztosít a kiskereskedelmi értékesítési adatokhoz PostgreSQL-en keresztül. A projekt vállalati szintű funkciókat mutat be, mint például **soros szintű biztonság (Row Level Security - RLS)**, **szemantikus keresési képességek**, és **Azure AI integráció** valós kiskereskedelmi elemzési forgatókönyvekhez.

**Főbb felhasználási esetek:**
- **AI-alapú értékesítési elemzés**: Lehetővé teszi az AI asszisztensek számára, hogy természetes nyelven lekérdezzék és elemezzék a kiskereskedelmi értékesítési adatokat
- **Biztonságos több-bérlős hozzáférés**: Bemutatja a soros szintű biztonság megvalósítását, ahol különböző üzletvezetők csak a saját üzletük adataihoz férhetnek hozzá
- **Szemantikus termékkeresés**: AI-alapú termékfelfedezés szöveges beágyazásokkal
- **Vállalati integráció**: Bemutatja, hogyan lehet MCP szervereket integrálni Azure szolgáltatásokkal és PostgreSQL adatbázisokkal

**Ideális:**
- Fejlesztők számára, akik MCP szervereket szeretnének építeni adatbázis integrációval
- Adatmérnökök számára, akik biztonságos több-bérlős elemzési megoldásokat valósítanak meg
- AI alkalmazásfejlesztők számára, akik kiskereskedelmi vagy e-kereskedelmi adatokkal dolgoznak
- Bárki számára, aki AI asszisztenseket szeretne vállalati adatbázisokkal kombinálni

## Csatlakozz az Azure AI Foundry Discord közösséghez
Oszd meg MCP tapasztalataidat, és találkozz szakértőkkel és termékcsoportokkal

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Értékesítési Elemzés MCP Szerver

Egy Model Context Protocol (MCP) szerver, amely átfogó ügyfélértékesítési adatbázis-hozzáférést biztosít a Zava Retail DIY üzlet számára. Ez a szerver lehetővé teszi az AI asszisztensek számára, hogy biztonságos, séma-tudatos interfészen keresztül lekérdezzék és elemezzék a kiskereskedelmi értékesítési adatokat.

## 📚 Teljes Megvalósítási Útmutató

A megoldás részletes felépítéséhez és hasonló MCP szerverek megvalósításához tekintsd meg átfogó **[Példa Bemutató](Sample_Walkthrough.md)** útmutatónkat. Ez az útmutató tartalmazza:

- **Architektúra Mélyelemzés**: Komponensek elemzése és tervezési minták
- **Lépésről-lépésre Építés**: A projekt beállításától a telepítésig
- **Kód Elemzés**: MCP szerver megvalósításának részletes magyarázata
- **Haladó Funkciók**: Soros szintű biztonság, szemantikus keresés és monitorozás
- **Legjobb Gyakorlatok**: Biztonság, teljesítmény és fejlesztési irányelvek
- **Hibakeresés**: Gyakori problémák és megoldások

Ideális fejlesztők számára, akik meg akarják érteni a megvalósítás részleteit és hasonló megoldásokat szeretnének építeni.

## 🤖 Mi az MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** egy nyílt szabvány, amely lehetővé teszi az AI asszisztensek számára, hogy biztonságosan hozzáférjenek külső adatforrásokhoz és eszközökhöz valós időben. Gondolj rá úgy, mint egy hídra, amely lehetővé teszi az AI modellek számára, hogy adatbázisokhoz, API-khoz, fájlrendszerekhez és más erőforrásokhoz csatlakozzanak, miközben megőrzik a biztonságot és az irányítást.

### Főbb Előnyök:
- **Valós idejű Adathozzáférés**: Az AI asszisztensek élő adatbázisokat és API-kat kérdezhetnek le
- **Biztonságos Integráció**: Ellenőrzött hozzáférés hitelesítéssel és jogosultságokkal  
- **Eszköz Bővíthetőség**: Egyedi képességek hozzáadása az AI asszisztensekhez
- **Szabványosított Protokoll**: Különböző AI platformokon és eszközökön működik

### Új az MCP-ben?

Ha új vagy a Model Context Protocol területén, javasoljuk, hogy kezdj a Microsoft átfogó kezdő erőforrásaival:

**📖 [MCP Kezdőknek Útmutató](https://aka.ms/mcp-for-beginners)**

Ez az erőforrás tartalmazza:
- MCP fogalmak és architektúra bemutatása
- Lépésről-lépésre oktatóanyagok az első MCP szerver építéséhez
- Legjobb gyakorlatok az MCP fejlesztéshez
- Integrációs példák népszerű AI platformokkal
- Közösségi erőforrások és támogatás

Miután megértetted az alapokat, térj vissza ide, hogy felfedezd ezt a haladó kiskereskedelmi elemzési megvalósítást!

## 📚 Átfogó Tanulási Útmutató: /walkthrough

Ez a repó egy teljes **12 modulból álló tanulási bemutatót** tartalmaz, amely lépésről-lépésre bontja le ezt az MCP kiskereskedelmi szerver mintát. A bemutató egy átfogó oktatási erőforrássá alakítja ezt a működő példát, amely tökéletes fejlesztők számára, akik meg akarják érteni, hogyan építsenek gyártásra kész MCP szervereket adatbázis integrációval.

### Amit Megtanulsz

A bemutató mindent lefed az alapvető MCP fogalmaktól a haladó gyártási telepítésig, beleértve:

- **MCP Alapok**: A Model Context Protocol megértése és valós alkalmazásai
- **Adatbázis Integráció**: Biztonságos PostgreSQL csatlakozás megvalósítása soros szintű biztonsággal
- **AI-Alapú Funkciók**: Szemantikus keresési képességek hozzáadása Azure OpenAI beágyazásokkal
- **Biztonsági Megvalósítás**: Vállalati szintű hitelesítés, jogosultságok és adatizoláció
- **Eszközfejlesztés**: Kifinomult MCP eszközök építése adat-elemzéshez és üzleti intelligenciához
- **Tesztelés és Hibakeresés**: Átfogó tesztelési stratégiák és hibakeresési technikák
- **VS Code Integráció**: AI Chat konfigurálása természetes nyelvű adatbázis lekérdezésekhez
- **Gyártási Telepítés**: Konténerizáció, skálázás és felhő telepítési stratégiák
- **Monitorozás és Megfigyelhetőség**: Application Insights, naplózás és teljesítmény monitorozás

### Tanulási Útvonal Áttekintés

A bemutató egy progresszív tanulási struktúrát követ, amely minden szintű fejlesztő számára alkalmas:

| Modul | Fókuszterület | Leírás | Időbecslés |
|-------|---------------|--------|------------|
| **[00-Bevezetés](walkthrough/00-Introduction/README.md)** | Alapok | MCP fogalmak, Zava Retail esettanulmány, architektúra áttekintés | 30 perc |
| **[01-Architektúra](walkthrough/01-Architecture/README.md)** | Tervezési Minták | Technikai architektúra, rétegezett tervezés, rendszerkomponensek | 45 perc |
| **[02-Biztonság](walkthrough/02-Security/README.md)** | Vállalati Biztonság | Azure hitelesítés, soros szintű biztonság, több-bérlős izoláció | 60 perc |
| **[03-Beállítás](walkthrough/03-Setup/README.md)** | Környezet | Docker beállítás, Azure CLI, projekt konfiguráció, validáció | 45 perc |
| **[04-Adatbázis](walkthrough/04-Database/README.md)** | Adatréteg | PostgreSQL séma, pgvector, RLS szabályok, mintaadatok | 60 perc |
| **[05-MCP-Szerver](walkthrough/05-MCP-Server/README.md)** | Alapvető Megvalósítás | FastMCP keretrendszer, adatbázis integráció, kapcsolatkezelés | 90 perc |
| **[06-Eszközök](walkthrough/06-Tools/README.md)** | Eszközfejlesztés | MCP eszközök létrehozása, lekérdezés validáció, üzleti intelligencia funkciók | 75 perc |
| **[07-Szemantikus-Keresés](walkthrough/07-Semantic-Search/README.md)** | AI Integráció | Azure OpenAI beágyazások, vektorkeresés, hibrid keresési stratégiák | 60 perc |
| **[08-Tesztelés](walkthrough/08-Testing/README.md)** | Minőségbiztosítás | Egységtesztelés, integrációs tesztelés, teljesítménytesztelés, hibakeresés | 75 perc |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Fejlesztési Élmény | VS Code konfiguráció, AI Chat integráció, hibakeresési munkafolyamatok | 45 perc |
| **[10-Telepítés](walkthrough/10-Deployment/README.md)** | Gyártásra Kész | Konténerizáció, Azure Container Apps, CI/CD folyamatok, skálázás | 90 perc |
| **[11-Monitorozás](walkthrough/11-Monitoring/README.md)** | Megfigyelhetőség | Application Insights, strukturált naplózás, teljesítménymutatók | 60 perc |
| **[12-Legjobb-Gyakorlatok](walkthrough/12-Best-Practices/README.md)** | Gyártási Kiválóság | Biztonsági megerősítés, teljesítmény optimalizálás, vállalati minták | 45 perc |

**Teljes Tanulási Idő**: ~12-15 óra átfogó gyakorlati tanulás

### 🎯 Hogyan Használd a Bemutatót

**Kezdőknek**:
1. Kezdd a [00. Modul: Bevezetés](walkthrough/00-Introduction/README.md) modullal, hogy megértsd az MCP alapjait
2. Kövesd a modulokat sorrendben a teljes tanulási élményért
3. Minden modul az előző fogalmakra épít, és gyakorlati feladatokat tartalmaz

**Tapasztalt Fejlesztőknek**:
1. Nézd át a [Fő Bemutató Áttekintést](walkthrough/README.md) a modulok összefoglalójáért
2. Ugorj az érdeklődési körödnek megfelelő modulokra (pl. Modul 07 az AI integrációhoz)
3. Használd az egyes modulokat referenciaként saját projektjeidhez

**Gyártási Megvalósításhoz**:
1. Koncentrálj
### 📋 Tanulási előfeltételek

**Ajánlott háttérismeretek**:
- Alapvető Python programozási tapasztalat
- REST API-k és adatbázisok ismerete
- Általános AI/ML koncepciók megértése
- Alapvető parancssori és Docker ismeretek

**Nem kötelező (de hasznos)**:
- Korábbi MCP tapasztalat (az alapoktól kezdve bemutatjuk)
- Azure felhő tapasztalat (lépésről lépésre végigvezetünk)
- Haladó PostgreSQL ismeretek (szükség esetén elmagyarázzuk a fogalmakat)

### 💡 Tanulási tippek

1. **Gyakorlati megközelítés**: Minden modul tartalmaz működő kódpéldákat, amelyeket futtathatsz és módosíthatsz
2. **Fokozatos komplexitás**: A koncepciók egyszerűtől haladnak az összetettig
3. **Valós példák**: Minden példa valós kiskereskedelmi üzleti forgatókönyveket használ
4. **Termelésre kész**: A kódpéldák tényleges termelési használatra vannak tervezve
5. **Közösségi támogatás**: Csatlakozz a [Discord közösségünkhöz](https://discord.com/invite/ByRwuEEgH4) segítségért és beszélgetésekért

### 🔗 Kapcsolódó források

- **[MCP kezdőknek](https://aka.ms/mcp-for-beginners)**: Alapvető háttérolvasmány
- **[Minta bemutató](Sample_Walkthrough.md)**: Magas szintű technikai áttekintés
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Felhőplatform, amelyet a példákban használunk
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP implementációs keretrendszer

**Készen állsz a tanulásra?** Kezdd el a **[00. modul: Bevezetés](walkthrough/00-Introduction/README.md)** című modullal, vagy fedezd fel a **[teljes bemutató áttekintést](walkthrough/README.md)**.

## Előfeltételek

1. Telepített Docker Desktop
2. Telepített Git
3. **Azure CLI**: Telepítsd és hitelesítsd az Azure CLI-t
4. Hozzáférés az OpenAI `text-embedding-3-small` modellhez, opcionálisan a `gpt-4o-mini` modellhez.

## Első lépések

Nyiss meg egy terminálablakot, és futtasd az alábbi parancsokat:

1. Hitelesítés az Azure CLI-vel

    ```bash
    az login
    ```

2. A repozitórium klónozása

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigálj a projekt könyvtárába

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure erőforrások telepítése

Futtasd az alábbi szkripteket az MCP szerverhez szükséges Azure erőforrások telepítésének automatizálásához.

A telepítési szkriptek automatikusan telepítik a `text-embedding-3-small` modellt. A telepítés során lehetőséged lesz a `gpt-4o-mini` modell hozzáadására is. Fontos megjegyezni, hogy a `gpt-4o-mini` **nem kötelező** ehhez a projekthez, és csak jövőbeli fejlesztésekhez van benne.

**Válaszd ki a platformodhoz megfelelő szkriptet:**

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

## MCP szerver futtatása

A legegyszerűbb módja a teljes stack (PostgreSQL + MCP szerver) futtatásának a Docker Compose használata:

### Stack indítása

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

## Használat

Az alábbiak feltételezik, hogy a beépített VS Code MCP szerver támogatást fogod használni.

1. Nyisd meg a projektet a VS Code-ban. A terminálból futtasd:

    ```bash
    code .
    ```

2. Indíts el egy vagy több MCP szervert a `.vscode/mcp.json` konfigurációk alapján. A fájl négy különböző szerverkonfigurációt tartalmaz, amelyek mindegyike egy-egy üzletvezető szerepet szimulál:

   - Minden konfiguráció egyedi RLS (Row Level Security) felhasználói azonosítót használ
   - Ezek a felhasználói azonosítók különböző üzletvezetői identitásokat szimulálnak, akik hozzáférnek az adatbázishoz
   - Az RLS rendszer korlátozza az adatokhoz való hozzáférést az üzletvezető által kijelölt üzlet alapján
   - Ez valós forgatókönyveket szimulál, ahol az üzletvezetők különböző Entra ID fiókokkal jelentkeznek be

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

### VS Code AI Chat megnyitása

1. Nyisd meg az AI Chat módot a VS Code-ban
2. Írd be **#zava**, és válassz ki egyet az elindított MCP szerverek közül
3. Tegyél fel kérdéseket az értékesítési adatokkal kapcsolatban - Lásd az alábbi mintakérdéseket

### Mintakérdések

1. Mutasd a 20 legjobb terméket értékesítési bevétel alapján
1. Mutasd az értékesítéseket üzletenként
1. Milyen volt az előző negyedév értékesítése kategóriánként?
1. Milyen termékeket árulunk, amelyek hasonlóak a "festéktartályokhoz"?

## Funkciók

- **Több táblás séma hozzáférés**: Több adatbázis-tábla sémájának lekérése egyetlen kérésben
- **Biztonságos lekérdezés végrehajtás**: PostgreSQL lekérdezések végrehajtása Row Level Security (RLS) támogatással
- **Valós idejű adatok**: Aktuális értékesítési, készlet- és ügyféladatok elérése
- **Dátum/idő segédprogramok**: Aktuális UTC időbélyegek lekérése időérzékeny elemzésekhez
- **Rugalmas telepítés**: Támogatja a HTTP szerver módot

## Támogatott táblák

A szerver hozzáférést biztosít az alábbi kiskereskedelmi adatbázis-táblákhoz:

- `retail.customers` - Ügyfélinformációk és profilok
- `retail.stores` - Üzlethelyszínek és részletek
- `retail.categories` - Termékkategóriák és hierarchiák
- `retail.product_types` - Terméktípus osztályozások
- `retail.products` - Termékkatalógus és specifikációk
- `retail.orders` - Ügyfélrendelések és tranzakciók
- `retail.order_items` - Rendeléseken belüli egyedi tételek
- `retail.inventory` - Aktuális készletszintek és készletadatok

## Elérhető eszközök

### `get_multiple_table_schemas`

Adatbázis-táblák sémáinak lekérése egyetlen kérésben.

**Paraméterek:**

- `table_names` (list[str]): Az alábbi támogatott táblákból származó érvényes táblanevek listája

**Visszatérési érték:** A kért táblákhoz tartozó sémasztringek összefűzve

### `execute_sales_query`

PostgreSQL lekérdezések végrehajtása az értékesítési adatbázisban Row Level Security támogatással.

**Paraméterek:**

- `postgresql_query` (str): Egy jól formázott PostgreSQL lekérdezés

**Visszatérési érték:** Lekérdezési eredmények sztringként formázva (olvashatóság érdekében 20 sorra korlátozva)

**Legjobb gyakorlatok:**

- Mindig először kérd le a táblák sémáit
- Használj pontos oszlopneveket a sémákból
- Kapcsolj össze kapcsolódó táblákat átfogó elemzéshez
- Aggregáld az eredményeket, amikor szükséges
- Korlátozd a kimenetet az olvashatóság érdekében

### `get_current_utc_date`

Az aktuális UTC dátum és idő lekérése ISO formátumban.

**Visszatérési érték:** Az aktuális UTC dátum/idő ISO formátumban (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Termékek szemantikai keresése felhasználói lekérdezések alapján.

**Visszatérési érték:** A keresési kritériumoknak megfelelő termékek listája

**Paraméterek:**

- `query` (str): A keresési lekérdezés sztringje

**Visszatérési érték:** A keresési kritériumoknak megfelelő termékek listája

## Biztonsági funkciók

### Row Level Security (RLS)

A szerver Row Level Security-t alkalmaz, hogy biztosítsa, hogy a felhasználók csak az általuk engedélyezett adatokat érjék el:

- **HTTP mód**: Az `x-rls-user-id` fejlécet használja a kérő felhasználó azonosítására

- **Alapértelmezett visszaesés**: Helyőrző UUID-t használ, ha nincs megadva felhasználói azonosító

#### Üzlet-specifikus RLS felhasználói azonosítók

Minden Zava Retail üzlethelyszínnek egyedi RLS felhasználói azonosítója van, amely meghatározza, hogy a felhasználó mely adatokhoz férhet hozzá:

| Üzlethelyszín | RLS felhasználói azonosító | Leírás |
|---------------|-----------------------------|--------|
| **Globális hozzáférés** | `00000000-0000-0000-0000-000000000000` | Alapértelmezett visszaesés - minden üzlet hozzáférése |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle üzlet adatai |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue üzlet adatai |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma üzlet adatai |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane üzlet adatai |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett üzlet adatai |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond üzlet adatai |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland üzlet adatai |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online üzlet adatai |

#### RLS megvalósítás

Amikor egy felhasználó egy adott üzlet RLS felhasználói azonosítójával csatlakozik, csak az alábbiakat látja:

- Az adott üzlethez kapcsolódó ügyfelek
- Az adott üzlethelyszínen leadott rendelések
- Az adott üzlet készletadatai
- Üzlet-specifikus értékesítési és teljesítménymutatók

Ez biztosítja az adatok elkülönítését a különböző üzlethelyszínek között, miközben egységes adatbázis-sémát tart fenn.

## Architektúra

### Alkalmazási kontextus

A szerver egy kezelt alkalmazási kontextust használ:

- **Adatbázis kapcsolat pool**: Hatékony kapcsolatkezelés HTTP módban
- **Életciklus kezelés**: Megfelelő erőforrás-tisztítás leállításkor
- **Típusbiztonság**: Erősen típusos kontextus az `AppContext` dataclass-szal

### Kérés kontextus

- **Fejléc kinyerés**: Biztonságos fejléc elemzés a felhasználói azonosításhoz
- **RLS integráció**: Automatikus felhasználói azonosító feloldás a kérés kontextusából
- **Hibakezelés**: Átfogó hibakezelés felhasználóbarát üzenetekkel

## Adatbázis integráció

A szerver PostgreSQL adatbázissal integrálódik a `PostgreSQLSchemaProvider` osztályon keresztül:

- **Kapcsolat poolozás**: Aszinkron kapcsolat poolokat használ a skálázhatóság érdekében
- **Séma metaadatok**: Részletes táblaséma információkat biztosít
- **Lekérdezés végrehajtás**: Biztonságos lekérdezés végrehajtás RLS támogatással
- **Erőforrás kezelés**: Automatikus adatbázis erőforrás-tisztítás

## Hibakezelés

A szerver robusztus hibakezelést valósít meg:

- **Táblák validálása**: Biztosítja, hogy csak érvényes táblanevekhez férjen hozzá
- **Lekérdezés validálása**: Ellenőrzi a PostgreSQL lekérdezéseket végrehajtás előtt
- **Erőforrás kezelés**: Megfelelő tisztítás még hibák esetén is
- **Felhasználóbarát üzenetek**: Világos hibaüzenetek a hibaelhárításhoz

## Biztonsági megfontolások

1. **Row Level Security**: Minden lekérdezés tiszteletben tartja az RLS szabályokat a felhasználói identitás alapján
2. **Üzletadatok elkülönítése**: Minden üzlet RLS felhasználói azonosítója biztosítja, hogy csak az adott üzlet adataihoz férjenek hozzá
3. **Bemenet validálása**: A táblanevek és lekérdezések validálása végrehajtás előtt
4. **Erőforrás korlátok**: A lekérdezési eredmények korlátozása a túlzott erőforrás-használat megelőzése érdekében
5. **Kapcsolat biztonsága**: Biztonságos adatbázis kapcsolat gyakorlatokat használ
6. **Felhasználói identitás ellenőrzése**: Mindig győződj meg róla, hogy a megfelelő RLS felhasználói azonosítót használod a kívánt üzlethez

### Fontos biztonsági megjegyzések

- **Soha ne használj termelési RLS felhasználói azonosítókat fejlesztési környezetben**
- **Mindig ellenőrizd, hogy az RLS felhasználói azonosító megfelel-e a kívánt üzletnek, mielőtt lekérdezéseket futtatsz**
- **Az alapértelmezett UUID (`00000000-0000-0000-0000-000000000000`) korlátozott hozzáférést biztosít**
- **Minden üzletvezetőnek csak a saját üzletének RLS felhasználói azonosítójához kell hozzáférnie**

## Fejlesztés

### Projektstruktúra

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Kulcskomponensek

- **FastMCP szerver**: Modern MCP szerver implementáció aszinkron támogatással
- **PostgreSQL Provider**: Adatbázis absztrakciós réteg RLS támogatással
- **Kontextus kezelés**: Típusbiztos alkalmazási és kérési kontextus kezelés
- **Eszköz regisztráció**: Deklaratív eszköz regisztráció Pydantic validálással

## Hozzájárulás

Amikor hozzájárulsz ehhez a szerverhez:

1. Biztosítsd, hogy minden adatbázis lekérdezés tiszteletben tartja a Row Level Security-t
2. Adj megfelelő hibakezelést az új eszközökhöz
3. Frissítsd ezt a README-t minden új funkcióval vagy változással
4. Teszteld a HTTP szerver módot
5. Validáld a bemeneti paramétereket, és biztosíts

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.