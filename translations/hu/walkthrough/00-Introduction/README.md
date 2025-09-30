<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-30T06:09:58+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "hu"
}
-->
# Bevezetés az MCP adatbázis-integrációba

## 🎯 Mit tartalmaz ez a modul?

Ez a bevezető modul átfogó képet nyújt arról, hogyan építhetünk Model Context Protocol (MCP) szervereket adatbázis-integrációval. Megismerheted az üzleti esetet, a technikai architektúrát és a valós alkalmazásokat a Zava Retail analitikai példáján keresztül.

## Áttekintés

A **Model Context Protocol (MCP)** lehetővé teszi, hogy az AI asszisztensek biztonságosan hozzáférjenek külső adatforrásokhoz és valós időben interakcióba lépjenek velük. Az adatbázis-integrációval kombinálva az MCP erőteljes képességeket nyit meg az adatvezérelt AI alkalmazások számára.

Ez a tanulási útmutató megtanít arra, hogyan építsünk gyártásra kész MCP szervereket, amelyek PostgreSQL-en keresztül kapcsolják össze az AI asszisztenseket a kiskereskedelmi értékesítési adatokkal, miközben vállalati mintákat, például sor szintű biztonságot, szemantikus keresést és több bérlős adat-hozzáférést valósítunk meg.

## Tanulási célok

A modul végére képes leszel:

- **Meghatározni** a Model Context Protocol-t és annak alapvető előnyeit az adatbázis-integrációban
- **Azonosítani** az MCP szerver architektúra kulcselemeit adatbázisokkal
- **Megérteni** a Zava Retail példát és annak üzleti követelményeit
- **Felismerni** a biztonságos, skálázható adatbázis-hozzáférés vállalati mintáit
- **Felsorolni** azokat az eszközöket és technológiákat, amelyeket a tanulási út során használunk

## 🧭 A kihívás: AI és valós adatok találkozása

### A hagyományos AI korlátai

A modern AI asszisztensek rendkívül erősek, de jelentős korlátokkal szembesülnek, amikor valós üzleti adatokkal dolgoznak:

| **Kihívás** | **Leírás** | **Üzleti hatás** |
|-------------|------------|------------------|
| **Statikus tudás** | Az AI modellek fix adatállományokon vannak betanítva, nem férnek hozzá aktuális üzleti adatokhoz | Elavult betekintések, elszalasztott lehetőségek |
| **Adatszigetek** | Az információk adatbázisokban, API-kban és rendszerekben vannak bezárva, amelyeket az AI nem ér el | Hiányos elemzés, széttagolt munkafolyamatok |
| **Biztonsági korlátok** | Az adatbázisok közvetlen elérése biztonsági és megfelelőségi problémákat vet fel | Korlátozott bevezetés, manuális adat-előkészítés |
| **Komplex lekérdezések** | Az üzleti felhasználóknak technikai tudásra van szükségük az adatok kinyeréséhez | Csökkentett elfogadás, hatékonytalan folyamatok |

### Az MCP megoldás

A Model Context Protocol megoldja ezeket a kihívásokat az alábbiak révén:

- **Valós idejű adat-hozzáférés**: Az AI asszisztensek élő adatbázisokat és API-kat kérdezhetnek le
- **Biztonságos integráció**: Ellenőrzött hozzáférés hitelesítéssel és jogosultságokkal
- **Természetes nyelvi interfész**: Az üzleti felhasználók egyszerű angol nyelven tehetnek fel kérdéseket
- **Standardizált protokoll**: Különböző AI platformokkal és eszközökkel működik

## 🏪 Ismerd meg a Zava Retail-t: Tanulmányi esettanulmányunk

A tanulási út során egy MCP szervert építünk a **Zava Retail** számára, amely egy kitalált barkácsáruházlánc több üzlethelyszínnel. Ez a valósághű forgatókönyv bemutatja a vállalati szintű MCP megvalósítást.

### Üzleti háttér

A **Zava Retail** működése:
- **8 fizikai üzlet** Washington államban (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online áruház** e-kereskedelmi értékesítéshez
- **Sokszínű termékkatalógus**, amely tartalmaz szerszámokat, hardvereket, kerti kellékeket és építőanyagokat
- **Többszintű menedzsment** üzletvezetőkkel, regionális vezetőkkel és vezető tisztségviselőkkel

### Üzleti követelmények

Az üzletvezetők és vezetők AI-alapú analitikát igényelnek az alábbiakhoz:

1. **Értékesítési teljesítmény elemzése** üzletek és időszakok szerint
2. **Készletszintek nyomon követése** és újrarendelési igények azonosítása
3. **Vásárlói viselkedés megértése** és vásárlási minták feltárása
4. **Termékismeretek felfedezése** szemantikus keresés révén
5. **Jelentések generálása** természetes nyelvi lekérdezésekkel
6. **Adatbiztonság fenntartása** szerepkör-alapú hozzáférés-vezérléssel

### Technikai követelmények

Az MCP szervernek biztosítania kell:

- **Több bérlős adat-hozzáférést**, ahol az üzletvezetők csak a saját üzletük adatait látják
- **Rugalmas lekérdezést**, amely támogatja a komplex SQL műveleteket
- **Szemantikus keresést** termékfelfedezéshez és ajánlásokhoz
- **Valós idejű adatokat**, amelyek tükrözik az aktuális üzleti állapotot
- **Biztonságos hitelesítést** sor szintű biztonsággal
- **Skálázható architektúrát**, amely több egyidejű felhasználót támogat

## 🏗️ MCP szerver architektúra áttekintése

Az MCP szerverünk rétegezett architektúrát valósít meg, amely optimalizált az adatbázis-integrációhoz:

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

### Kulcselemek

#### **1. MCP szerver réteg**
- **FastMCP keretrendszer**: Modern Python MCP szerver implementáció
- **Eszközregisztráció**: Deklaratív eszközdefiníciók típusbiztonsággal
- **Lekérdezési kontextus**: Felhasználói identitás és munkamenet-kezelés
- **Hibakezelés**: Robusztus hiba- és naplókezelés

#### **2. Adatbázis-integrációs réteg**
- **Kapcsolatkezelés**: Hatékony asyncpg kapcsolatkezelés
- **Séma szolgáltató**: Dinamikus táblaséma-felfedezés
- **Lekérdezés végrehajtó**: Biztonságos SQL végrehajtás RLS kontextussal
- **Tranzakciókezelés**: ACID megfelelőség és visszagörgetés kezelése

#### **3. Biztonsági réteg**
- **Sor szintű biztonság**: PostgreSQL RLS több bérlős adatizolációhoz
- **Felhasználói identitás**: Üzletvezető hitelesítés és jogosultságkezelés
- **Hozzáférés-vezérlés**: Finomhangolt jogosultságok és audit nyomvonalak
- **Bemenet validálás**: SQL injekció megelőzése és lekérdezés validálása

#### **4. AI fejlesztési réteg**
- **Szemantikus keresés**: Vektor beágyazások termékfelfedezéshez
- **Azure OpenAI integráció**: Szövegbeágyazás generálása
- **Hasonlósági algoritmusok**: pgvector koszinusz hasonlósági keresés
- **Keresési optimalizálás**: Indexelés és teljesítményhangolás

## 🔧 Technológiai stack

### Alapvető technológiák

| **Elem** | **Technológia** | **Cél** |
|----------|-----------------|---------|
| **MCP keretrendszer** | FastMCP (Python) | Modern MCP szerver implementáció |
| **Adatbázis** | PostgreSQL 17 + pgvector | Relációs adatok vektorkereséssel |
| **AI szolgáltatások** | Azure OpenAI | Szövegbeágyazások és nyelvi modellek |
| **Konténerizáció** | Docker + Docker Compose | Fejlesztési környezet |
| **Felhőplatform** | Microsoft Azure | Gyártási környezet |
| **IDE integráció** | VS Code | AI Chat és fejlesztési munkafolyamat |

### Fejlesztési eszközök

| **Eszköz** | **Cél** |
|------------|---------|
| **asyncpg** | Nagy teljesítményű PostgreSQL driver |
| **Pydantic** | Adatvalidálás és sorosítás |
| **Azure SDK** | Felhőszolgáltatás integráció |
| **pytest** | Tesztelési keretrendszer |
| **Docker** | Konténerizáció és telepítés |

### Gyártási stack

| **Szolgáltatás** | **Azure erőforrás** | **Cél** |
|------------------|---------------------|---------|
| **Adatbázis** | Azure Database for PostgreSQL | Kezelt adatbázis-szolgáltatás |
| **Konténer** | Azure Container Apps | Szerver nélküli konténerhoszting |
| **AI szolgáltatások** | Azure AI Foundry | OpenAI modellek és végpontok |
| **Monitoring** | Application Insights | Megfigyelés és diagnosztika |
| **Biztonság** | Azure Key Vault | Titkok és konfigurációkezelés |

## 🎬 Valós használati forgatókönyvek

Nézzük meg, hogyan használják különböző felhasználók az MCP szervert:

### Forgatókönyv 1: Üzletvezetői teljesítményértékelés

**Felhasználó**: Sarah, Seattle üzletvezető  
**Cél**: Az előző negyedév értékesítési teljesítményének elemzése

**Természetes nyelvi lekérdezés**:
> "Mutasd meg a 10 legnagyobb bevételt hozó terméket az üzletemben 2024 Q4-ben"

**Mi történik**:
1. A VS Code AI Chat elküldi a lekérdezést az MCP szervernek
2. Az MCP szerver azonosítja Sarah üzleti kontextusát (Seattle)
3. Az RLS szabályok csak a Seattle üzlet adatait szűrik
4. SQL lekérdezés generálása és végrehajtása
5. Az eredmények formázása és visszaküldése az AI Chat-nek
6. Az AI elemzést és betekintést nyújt

### Forgatókönyv 2: Termékfelfedezés szemantikus kereséssel

**Felhasználó**: Mike, készletkezelő  
**Cél**: Olyan termékek keresése, amelyek hasonlóak egy vásárlói kéréshez

**Természetes nyelvi lekérdezés**:
> "Milyen termékeket árulunk, amelyek hasonlóak a 'vízálló elektromos csatlakozók kültéri használatra'?"

**Mi történik**:
1. A lekérdezést a szemantikus kereső eszköz dolgozza fel
2. Az Azure OpenAI generál egy beágyazási vektort
3. A pgvector végrehajtja a hasonlósági keresést
4. Kapcsolódó termékek relevancia szerint rangsorolva
5. Az eredmények tartalmazzák a termék részleteit és elérhetőségét
6. Az AI alternatívákat és csomagolási lehetőségeket javasol

### Forgatókönyv 3: Üzletek közötti analitika

**Felhasználó**: Jennifer, regionális vezető  
**Cél**: Teljesítmény összehasonlítása az összes üzlet között

**Természetes nyelvi lekérdezés**:
> "Hasonlítsd össze az értékesítést kategóriánként az összes üzletben az elmúlt 6 hónapban"

**Mi történik**:
1. Az RLS kontextus beállítása regionális vezetői hozzáféréshez
2. Komplex több üzletet érintő lekérdezés generálása
3. Adatok aggregálása üzlethelyszínek szerint
4. Az eredmények tartalmazzák a trendeket és összehasonlításokat
5. Az AI betekintéseket és ajánlásokat nyújt

## 🔒 Biztonság és több bérlős megoldás mélyebb áttekintése

A megvalósításunk prioritásként kezeli a vállalati szintű biztonságot:

### Sor szintű biztonság (RLS)

A PostgreSQL RLS biztosítja az adatizolációt:

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

### Felhasználói identitáskezelés

Minden MCP kapcsolat tartalmazza:
- **Üzletvezető ID**: Egyedi azonosító az RLS kontextushoz
- **Szerepkör hozzárendelés**: Jogosultságok és hozzáférési szintek
- **Munkamenet-kezelés**: Biztonságos hitelesítési tokenek
- **Audit naplózás**: Teljes hozzáférési előzmények

### Adatvédelem

Több biztonsági réteg:
- **Kapcsolat titkosítása**: TLS minden adatbázis-kapcsolathoz
- **SQL injekció megelőzése**: Csak paraméterezett lekérdezések
- **Bemenet validálás**: Átfogó kérésvalidálás
- **Hibakezelés**: Nincs érzékeny adat a hibaüzenetekben

## 🎯 Főbb tanulságok

A bevezető elvégzése után érteni fogod:

✅ **MCP értékajánlat**: Hogyan hidalja át az MCP az AI asszisztensek és a valós adatok közötti szakadékot  
✅ **Üzleti háttér**: A Zava Retail követelményei és kihívásai  
✅ **Architektúra áttekintés**: Kulcselemek és azok kölcsönhatásai  
✅ **Technológiai stack**: Az út során használt eszközök és keretrendszerek  
✅ **Biztonsági modell**: Több bérlős adat-hozzáférés és védelem  
✅ **Használati minták**: Valós lekérdezési forgatókönyvek és munkafolyamatok  

## 🚀 Mi következik?

Készen állsz a mélyebb merülésre? Folytasd:

**[01. modul: Alapvető architektúra koncepciók](../01-Architecture/README.md)**

Ismerd meg az MCP szerver architektúra mintáit, adatbázis-tervezési elveit és a részletes technikai megvalósítást, amely a kiskereskedelmi analitikai megoldásunkat működteti.

## 📚 További források

### MCP dokumentáció
- [MCP specifikáció](https://modelcontextprotocol.io/docs/) - Hivatalos protokoll dokumentáció
- [MCP kezdőknek](https://aka.ms/mcp-for-beginners) - Átfogó MCP tanulási útmutató
- [FastMCP dokumentáció](https://github.com/modelcontextprotocol/python-sdk) - Python SDK dokumentáció

### Adatbázis-integráció
- [PostgreSQL dokumentáció](https://www.postgresql.org/docs/) - Teljes PostgreSQL referencia
- [pgvector útmutató](https://github.com/pgvector/pgvector) - Vektor kiterjesztés dokumentáció
- [Sor szintű biztonság](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - PostgreSQL RLS útmutató

### Azure szolgáltatások
- [Azure OpenAI dokumentáció](https://docs.microsoft.com/azure/cognitive-services/openai/) - AI szolgáltatás integráció
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Kezelt adatbázis-szolgáltatás
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Szerver nélküli konténerek

---

**Figyelmeztetés**: Ez egy tanulási gyakorlat kitalált kiskereskedelmi adatokkal. Mindig kövesd szervezeted adatkezelési és biztonsági irányelveit

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével került lefordításra. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.