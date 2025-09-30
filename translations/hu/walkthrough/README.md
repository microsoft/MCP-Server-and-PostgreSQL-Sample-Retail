<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T05:56:39+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "hu"
}
-->
# 🚀 MCP Server PostgreSQL-val - Teljes Tanulási Útmutató

## 🧠 Áttekintés az MCP adatbázis-integráció tanulási útvonaláról

Ez az átfogó tanulási útmutató megtanítja, hogyan építsünk gyártásra kész **Model Context Protocol (MCP) szervereket**, amelyek adatbázisokkal integrálódnak egy gyakorlati kiskereskedelmi analitikai megvalósításon keresztül. Megismerheted a vállalati szintű mintákat, mint például **soros szintű biztonság (RLS)**, **szemantikus keresés**, **Azure AI integráció**, és **több bérlős adat-hozzáférés**.

Akár backend fejlesztő, AI mérnök vagy adatarchitekt vagy, ez az útmutató strukturált tanulást kínál valós példákkal és gyakorlati feladatokkal.

## 🔗 Hivatalos MCP Források

- 📘 [MCP Dokumentáció](https://modelcontextprotocol.io/) – Részletes oktatóanyagok és felhasználói útmutatók
- 📜 [MCP Specifikáció](https://modelcontextprotocol.io/docs/) – Protokoll architektúra és technikai referenciák
- 🧑‍💻 [MCP GitHub Repository](https://github.com/modelcontextprotocol) – Nyílt forráskódú SDK-k, eszközök és kódminták
- 🌐 [MCP Közösség](https://github.com/orgs/modelcontextprotocol/discussions) – Csatlakozz a beszélgetésekhez és járulj hozzá a közösséghez
- 📚 [MCP Kezdőknek](https://aka.ms/mcp-for-beginners) – Kezdj itt, ha új vagy az MCP-ben

## 🧭 MCP Adatbázis-Integráció Tanulási Útvonal

### 📚 Teljes Tanulási Struktúra

| Modul | Téma | Leírás | Link |
|-------|------|--------|------|
| **1-3. modul: Alapok** | | | |
| 00 | [Bevezetés az MCP adatbázis-integrációba](./00-Introduction/README.md) | Áttekintés az MCP-ről adatbázis-integrációval és kiskereskedelmi analitikai esettanulmány | [Kezdd itt](./00-Introduction/README.md) |
| 01 | [Alapvető architektúra koncepciók](./01-Architecture/README.md) | MCP szerver architektúra, adatbázis rétegek és biztonsági minták megértése | [Tanulj](./01-Architecture/README.md) |
| 02 | [Biztonság és több bérlős megoldások](./02-Security/README.md) | Soros szintű biztonság, hitelesítés és több bérlős adat-hozzáférés | [Tanulj](./02-Security/README.md) |
| 03 | [Környezet beállítása](./03-Setup/README.md) | Fejlesztési környezet beállítása, Docker, Azure erőforrások | [Beállítás](./03-Setup/README.md) |
| **4-6. modul: MCP szerver építése** | | | |
| 04 | [Adatbázis tervezés és séma](./04-Database/README.md) | PostgreSQL beállítása, kiskereskedelmi séma tervezése és mintaadatok | [Építs](./04-Database/README.md) |
| 05 | [MCP szerver megvalósítása](./05-MCP-Server/README.md) | FastMCP szerver építése adatbázis-integrációval | [Építs](./05-MCP-Server/README.md) |
| 06 | [Eszközfejlesztés](./06-Tools/README.md) | Adatbázis-lekérdezési eszközök és séma introspekció létrehozása | [Építs](./06-Tools/README.md) |
| **7-9. modul: Haladó funkciók** | | | |
| 07 | [Szemantikus keresés integrációja](./07-Semantic-Search/README.md) | Vektor beágyazások megvalósítása Azure OpenAI-val és pgvectorral | [Haladj tovább](./07-Semantic-Search/README.md) |
| 08 | [Tesztelés és hibakeresés](./08-Testing/README.md) | Tesztelési stratégiák, hibakeresési eszközök és validációs megközelítések | [Tesztelj](./08-Testing/README.md) |
| 09 | [VS Code integráció](./09-VS-Code/README.md) | VS Code MCP integráció és AI Chat használatának konfigurálása | [Integrálj](./09-VS-Code/README.md) |
| **10-12. modul: Gyártás és legjobb gyakorlatok** | | | |
| 10 | [Telepítési stratégiák](./10-Deployment/README.md) | Docker telepítés, Azure Container Apps és skálázási szempontok | [Telepíts](./10-Deployment/README.md) |
| 11 | [Felügyelet és megfigyelhetőség](./11-Monitoring/README.md) | Application Insights, naplózás, teljesítményfigyelés | [Figyelj](./11-Monitoring/README.md) |
| 12 | [Legjobb gyakorlatok és optimalizálás](./12-Best-Practices/README.md) | Teljesítményoptimalizálás, biztonsági megerősítés és gyártási tippek | [Optimalizálj](./12-Best-Practices/README.md) |

### 💻 Amit építeni fogsz

A tanulási útvonal végére egy teljes **Zava Retail Analytics MCP szervert** fogsz létrehozni, amely tartalmazza:

- **Több táblás kiskereskedelmi adatbázis** ügyfélrendelésekkel, termékekkel és készletekkel
- **Soros szintű biztonság** az üzlet-alapú adat elkülönítéshez
- **Szemantikus termékkeresés** Azure OpenAI beágyazásokkal
- **VS Code AI Chat integráció** természetes nyelvű lekérdezésekhez
- **Gyártásra kész telepítés** Dockerrel és Azure-val
- **Átfogó megfigyelés** Application Insights segítségével

## 🎯 Tanulási előfeltételek

Ahhoz, hogy a legtöbbet hozd ki ebből a tanulási útvonalból, rendelkezned kell:

- **Programozási tapasztalat**: Python (előnyben részesített) vagy hasonló nyelvek ismerete
- **Adatbázis ismeretek**: SQL és relációs adatbázisok alapvető megértése
- **API koncepciók**: REST API-k és HTTP alapfogalmak ismerete
- **Fejlesztési eszközök**: Parancssor, Git és kódszerkesztők használatának tapasztalata
- **Felhő alapok**: (Opcionális) Azure vagy hasonló felhőplatformok alapvető ismerete
- **Docker ismeretek**: (Opcionális) Konténerizációs koncepciók megértése

### Szükséges eszközök

- **Docker Desktop** - PostgreSQL és MCP szerver futtatásához
- **Azure CLI** - Felhő erőforrások telepítéséhez
- **VS Code** - Fejlesztéshez és MCP integrációhoz
- **Git** - Verziókezeléshez
- **Python 3.8+** - MCP szerver fejlesztéséhez

## 📚 Tanulási útmutató és források

Ez a tanulási útvonal átfogó forrásokat tartalmaz, amelyek segítenek hatékonyan navigálni:

### Tanulási útmutató

Minden modul tartalmaz:
- **Világos tanulási célokat** - Mit fogsz elérni
- **Lépésről lépésre útmutatók** - Részletes megvalósítási útmutatók
- **Kódminták** - Működő példák magyarázatokkal
- **Feladatok** - Gyakorlati lehetőségek
- **Hibakeresési útmutatók** - Gyakori problémák és megoldások
- **További források** - További olvasási és felfedezési lehetőségek

### Előfeltételek ellenőrzése

Minden modul előtt megtalálod:
- **Szükséges ismeretek** - Mit kell tudnod előzetesen
- **Beállítás ellenőrzése** - Hogyan ellenőrizd a környezeted
- **Időbecslések** - Várható befejezési idő
- **Tanulási eredmények** - Mit fogsz tudni a modul végére

### Ajánlott tanulási útvonalak

Válassz útvonalat tapasztalati szinted alapján:

#### 🟢 **Kezdő útvonal** (Új az MCP-ben)
1. Kezdd a [MCP Kezdőknek](https://aka.ms/mcp-for-beginners) útmutatóval
2. Fejezd be a 00-03 modulokat az alapok megértéséhez
3. Kövesd a 04-06 modulokat gyakorlati építéshez
4. Próbáld ki a 07-09 modulokat gyakorlati használatra

#### 🟡 **Középhaladó útvonal** (Némi MCP tapasztalat)
1. Nézd át a 00-01 modulokat az adatbázis-specifikus koncepciókért
2. Koncentrálj a 02-06 modulokra a megvalósításhoz
3. Mélyedj el a 07-12 modulokban a haladó funkciókért

#### 🔴 **Haladó útvonal** (Tapasztalt MCP felhasználók)
1. Fusd át a 00-03 modulokat a kontextusért
2. Koncentrálj a 04-09 modulokra az adatbázis-integrációhoz
3. Összpontosíts a 10-12 modulokra a gyártási telepítéshez

## 🛠️ Hogyan használd hatékonyan ezt a tanulási útvonalat

### Szekvenciális tanulás (Ajánlott)

Haladj végig a modulokon sorrendben az átfogó megértés érdekében:

1. **Olvasd el az áttekintést** - Értsd meg, mit fogsz tanulni
2. **Ellenőrizd az előfeltételeket** - Győződj meg róla, hogy rendelkezel a szükséges ismeretekkel
3. **Kövesd a lépésről lépésre útmutatókat** - Valósítsd meg, miközben tanulsz
4. **Teljesítsd a feladatokat** - Erősítsd meg a megértésed
5. **Tekintsd át a kulcsfontosságú tanulságokat** - Szilárdítsd meg a tanulási eredményeket

### Célzott tanulás

Ha konkrét készségekre van szükséged:

- **Adatbázis-integráció**: Koncentrálj a 04-06 modulokra
- **Biztonsági megvalósítás**: Összpontosíts a 02, 08, 12 modulokra
- **AI/Szemantikus keresés**: Mélyedj el a 07 modulban
- **Gyártási telepítés**: Tanulmányozd a 10-12 modulokat

### Gyakorlati tapasztalat

Minden modul tartalmaz:
- **Működő kódminták** - Másold, módosítsd és kísérletezz
- **Valós forgatókönyvek** - Gyakorlati kiskereskedelmi analitikai esettanulmányok
- **Fokozatos komplexitás** - Egyszerűtől a haladóig építkezés
- **Validációs lépések** - Ellenőrizd, hogy a megvalósításod működik

## 🌟 Közösség és támogatás

### Segítség kérése

- **Azure AI Discord**: [Csatlakozz szakértői támogatásért](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Jelents problémákat vagy tegyél fel kérdéseket](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Közösség**: [Csatlakozz az MCP beszélgetésekhez](https://github.com/orgs/modelcontextprotocol/discussions)

### Hozzájárulás

Szívesen fogadjuk a hozzájárulásokat a tanulási útvonal fejlesztéséhez:
- **Hibák vagy elírások javítása** - Küldj pull requesteket
- **Példák hozzáadása** - Oszd meg megvalósításaidat
- **Dokumentáció fejlesztése** - Segíts másoknak tanulni
- **Problémák jelentése** - Segíts nekünk a problémák megoldásában

## 📜 Licencinformáció

Ez a tanulási tartalom az MIT Licenc alatt van licencelve. Lásd a [LICENSE](../../../LICENSE) fájlt a feltételekért.

## 🚀 Készen állsz a kezdésre?

Kezdd az utadat a **[00. modul: Bevezetés az MCP adatbázis-integrációba](./00-Introduction/README.md)**

---

*Mesteri szinten építs gyártásra kész MCP szervereket adatbázis-integrációval ezen átfogó, gyakorlati tanulási élmény segítségével.*

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy téves értelmezésekért.