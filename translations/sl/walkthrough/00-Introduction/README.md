<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-30T07:57:11+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "sl"
}
-->
# Uvod v integracijo MCP z bazo podatkov

## 🎯 Kaj zajema ta modul

Ta uvodni modul ponuja celovit pregled gradnje strežnikov Model Context Protocol (MCP) z integracijo baze podatkov. Spoznali boste poslovni primer, tehnično arhitekturo in praktične aplikacije skozi primer analitike Zava Retail.

## Pregled

**Model Context Protocol (MCP)** omogoča AI asistentom varno dostopanje do zunanjih virov podatkov in interakcijo z njimi v realnem času. Ko je MCP združen z integracijo baze podatkov, odklene zmogljive možnosti za aplikacije, ki temeljijo na podatkih.

Ta učna pot vas nauči, kako zgraditi produkcijsko pripravljene MCP strežnike, ki povezujejo AI asistente s podatki o prodaji na drobno prek PostgreSQL, pri čemer se uporabljajo vzorci za podjetja, kot so varnost na ravni vrstic, semantično iskanje in dostop do podatkov za več najemnikov.

## Cilji učenja

Do konca tega modula boste sposobni:

- **Opredeliti** Model Context Protocol in njegove ključne prednosti za integracijo baze podatkov
- **Prepoznati** ključne komponente arhitekture MCP strežnika z bazami podatkov
- **Razumeti** primer uporabe Zava Retail in njegove poslovne zahteve
- **Prepoznati** vzorce za varno in skalabilno dostopanje do baze podatkov
- **Našteti** orodja in tehnologije, uporabljene v tej učni poti

## 🧭 Izziv: AI sreča podatke iz resničnega sveta

### Omejitve tradicionalnega AI

Sodobni AI asistenti so izjemno zmogljivi, vendar se soočajo z velikimi omejitvami pri delu s podatki iz resničnega poslovnega sveta:

| **Izziv** | **Opis** | **Poslovni vpliv** |
|-----------|----------|--------------------|
| **Statično znanje** | AI modeli, usposobljeni na fiksnih podatkovnih nizih, ne morejo dostopati do trenutnih poslovnih podatkov | Zastarele vpoglede, zamujene priložnosti |
| **Podatkovni silosi** | Informacije so zaklenjene v bazah podatkov, API-jih in sistemih, do katerih AI ne more dostopati | Nepopolna analiza, razdrobljeni delovni tokovi |
| **Varnostne omejitve** | Neposreden dostop do baze podatkov povzroča varnostne in skladnostne težave | Omejena uporaba, ročna priprava podatkov |
| **Zapletene poizvedbe** | Poslovni uporabniki potrebujejo tehnično znanje za pridobivanje vpogledov iz podatkov | Zmanjšana uporaba, neučinkoviti procesi |

### Rešitev MCP

Model Context Protocol rešuje te izzive z zagotavljanjem:

- **Dostopa do podatkov v realnem času**: AI asistenti poizvedujejo po živih bazah podatkov in API-jih
- **Varne integracije**: Nadzorovan dostop z avtentikacijo in dovoljenji
- **Vmesnika v naravnem jeziku**: Poslovni uporabniki postavljajo vprašanja v preprostem jeziku
- **Standardiziranega protokola**: Deluje na različnih AI platformah in orodjih

## 🏪 Spoznajte Zava Retail: Naša študija primera

V tej učni poti bomo zgradili MCP strežnik za **Zava Retail**, izmišljeno verigo trgovin za domače mojstre z več lokacijami. Ta realističen scenarij prikazuje implementacijo MCP na ravni podjetja.

### Poslovni kontekst

**Zava Retail** upravlja:
- **8 fizičnih trgovin** po zvezni državi Washington (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 spletno trgovino** za e-prodajo
- **Raznolik katalog izdelkov**, vključno z orodji, strojno opremo, vrtnimi potrebščinami in gradbenim materialom
- **Večnivojsko upravljanje** z vodji trgovin, regionalnimi vodji in vodstvom podjetja

### Poslovne zahteve

Vodje trgovin in vodstvo potrebujejo analitiko, ki jo poganja AI, za:

1. **Analizo prodajne uspešnosti** po trgovinah in časovnih obdobjih
2. **Sledenje zalogam** in prepoznavanje potreb po ponovnem naročanju
3. **Razumevanje vedenja strank** in nakupnih vzorcev
4. **Odkritje vpogledov v izdelke** prek semantičnega iskanja
5. **Generiranje poročil** z naravnimi jezikovnimi poizvedbami
6. **Ohranjanje varnosti podatkov** z nadzorom dostopa na podlagi vlog

### Tehnične zahteve

MCP strežnik mora zagotavljati:

- **Dostop do podatkov za več najemnikov**, kjer vodje trgovin vidijo le podatke svoje trgovine
- **Prilagodljive poizvedbe**, ki podpirajo zapletene SQL operacije
- **Semantično iskanje** za odkrivanje izdelkov in priporočila
- **Podatke v realnem času**, ki odražajo trenutno poslovno stanje
- **Varno avtentikacijo** z varnostjo na ravni vrstic
- **Skalabilno arhitekturo**, ki podpira več sočasnih uporabnikov

## 🏗️ Pregled arhitekture MCP strežnika

Naš MCP strežnik implementira slojno arhitekturo, optimizirano za integracijo baze podatkov:

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

### Ključne komponente

#### **1. Sloj MCP strežnika**
- **FastMCP Framework**: Sodobna Python implementacija MCP strežnika
- **Registracija orodij**: Deklarativne definicije orodij z varnostjo tipov
- **Kontekst zahteve**: Upravljanje identitete uporabnika in seje
- **Upravljanje napak**: Zanesljivo upravljanje napak in beleženje

#### **2. Sloj integracije baze podatkov**
- **Upravljanje povezav**: Učinkovito upravljanje povezav asyncpg
- **Ponudnik sheme**: Dinamično odkrivanje sheme tabel
- **Izvajalec poizvedb**: Varno izvajanje SQL z RLS kontekstom
- **Upravljanje transakcij**: Skladnost z ACID in upravljanje povratkov

#### **3. Varnostni sloj**
- **Varnost na ravni vrstic**: PostgreSQL RLS za izolacijo podatkov za več najemnikov
- **Identiteta uporabnika**: Avtentikacija in avtorizacija vodij trgovin
- **Nadzor dostopa**: Dovoljenja na podlagi vlog in revizijske sledi
- **Validacija vnosa**: Preprečevanje SQL injekcij in validacija poizvedb

#### **4. Sloj izboljšanja AI**
- **Semantično iskanje**: Vektorske vdelave za odkrivanje izdelkov
- **Integracija Azure OpenAI**: Generiranje besedilnih vdelav
- **Algoritmi podobnosti**: pgvector iskanje podobnosti s kosinusom
- **Optimizacija iskanja**: Indeksiranje in izboljšanje zmogljivosti

## 🔧 Tehnološki sklad

### Osnovne tehnologije

| **Komponenta** | **Tehnologija** | **Namen** |
|----------------|-----------------|-----------|
| **MCP Framework** | FastMCP (Python) | Sodobna implementacija MCP strežnika |
| **Baza podatkov** | PostgreSQL 17 + pgvector | Relacijski podatki z vektorskim iskanjem |
| **AI storitve** | Azure OpenAI | Besedilne vdelave in jezikovni modeli |
| **Kontejnerizacija** | Docker + Docker Compose | Razvojno okolje |
| **Oblak** | Microsoft Azure | Produkcijska namestitev |
| **Integracija IDE** | VS Code | AI Chat in delovni tok razvoja |

### Orodja za razvoj

| **Orodje** | **Namen** |
|------------|-----------|
| **asyncpg** | Visoko zmogljiv PostgreSQL gonilnik |
| **Pydantic** | Validacija podatkov in serializacija |
| **Azure SDK** | Integracija oblačnih storitev |
| **pytest** | Okvir za testiranje |
| **Docker** | Kontejnerizacija in namestitev |

### Produkcijski sklad

| **Storitev** | **Azure vir** | **Namen** |
|--------------|---------------|-----------|
| **Baza podatkov** | Azure Database for PostgreSQL | Upravljana storitev baze podatkov |
| **Kontejner** | Azure Container Apps | Gostovanje kontejnerjev brez strežnika |
| **AI storitve** | Azure AI Foundry | OpenAI modeli in končne točke |
| **Nadzor** | Application Insights | Opazovanje in diagnostika |
| **Varnost** | Azure Key Vault | Upravljanje skrivnosti in konfiguracije |

## 🎬 Scenariji uporabe v resničnem svetu

Poglejmo, kako različni uporabniki uporabljajo naš MCP strežnik:

### Scenarij 1: Pregled uspešnosti vodje trgovine

**Uporabnik**: Sarah, vodja trgovine v Seattlu  
**Cilj**: Analizirati prodajno uspešnost zadnjega četrtletja

**Poizvedba v naravnem jeziku**:
> "Pokaži mi 10 najboljših izdelkov po prihodkih za mojo trgovino v Q4 2024"

**Kaj se zgodi**:
1. VS Code AI Chat pošlje poizvedbo MCP strežniku
2. MCP strežnik identificira kontekst trgovine Sarah (Seattle)
3. RLS politike filtrirajo podatke samo za trgovino v Seattlu
4. SQL poizvedba se generira in izvede
5. Rezultati se formatirajo in vrnejo AI Chatu
6. AI ponudi analizo in vpoglede

### Scenarij 2: Odkritje izdelkov s semantičnim iskanjem

**Uporabnik**: Mike, upravitelj zalog  
**Cilj**: Najti izdelke, podobne zahtevam stranke

**Poizvedba v naravnem jeziku**:
> "Katere izdelke prodajamo, ki so podobni 'vodotesnim električnim konektorjem za zunanjo uporabo'?"

**Kaj se zgodi**:
1. Poizvedba se obdela z orodjem za semantično iskanje
2. Azure OpenAI generira vektorsko vdelavo
3. pgvector izvede iskanje podobnosti
4. Povezani izdelki se razvrstijo po ustreznosti
5. Rezultati vključujejo podrobnosti o izdelkih in razpoložljivost
6. AI predlaga alternative in možnosti za pakiranje

### Scenarij 3: Analitika med trgovinami

**Uporabnik**: Jennifer, regionalna vodja  
**Cilj**: Primerjati uspešnost med vsemi trgovinami

**Poizvedba v naravnem jeziku**:
> "Primerjaj prodajo po kategorijah za vse trgovine v zadnjih 6 mesecih"

**Kaj se zgodi**:
1. RLS kontekst se nastavi za dostop regionalne vodje
2. Generira se zapletena poizvedba za več trgovin
3. Podatki se agregirajo po lokacijah trgovin
4. Rezultati vključujejo trende in primerjave
5. AI identificira vpoglede in priporočila

## 🔒 Poglobljen pogled na varnost in večnajemništvo

Naša implementacija daje prednost varnosti na ravni podjetja:

### Varnost na ravni vrstic (RLS)

PostgreSQL RLS zagotavlja izolacijo podatkov:

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

### Upravljanje identitete uporabnika

Vsaka povezava MCP vključuje:
- **ID vodje trgovine**: Unikatni identifikator za RLS kontekst
- **Dodelitev vlog**: Dovoljenja in ravni dostopa
- **Upravljanje sej**: Varni avtentikacijski žetoni
- **Beleženje revizij**: Popolna zgodovina dostopa

### Zaščita podatkov

Več slojev varnosti:
- **Šifriranje povezav**: TLS za vse povezave z bazo podatkov
- **Preprečevanje SQL injekcij**: Samo parametizirane poizvedbe
- **Validacija vnosa**: Celovita validacija zahtev
- **Upravljanje napak**: Brez občutljivih podatkov v sporočilih o napakah

## 🎯 Ključni poudarki

Po zaključku tega uvoda bi morali razumeti:

✅ **Vrednost MCP**: Kako MCP povezuje AI asistente in podatke iz resničnega sveta  
✅ **Poslovni kontekst**: Zahteve in izzive Zava Retail  
✅ **Pregled arhitekture**: Ključne komponente in njihove interakcije  
✅ **Tehnološki sklad**: Orodja in okvirji, uporabljeni v celotnem procesu  
✅ **Varnostni model**: Dostop do podatkov za več najemnikov in zaščita  
✅ **Vzorce uporabe**: Scenariji poizvedb in delovni tokovi v resničnem svetu  

## 🚀 Kaj sledi

Pripravljeni na poglobitev? Nadaljujte z:

**[Modul 01: Osnovni koncepti arhitekture](../01-Architecture/README.md)**

Spoznajte vzorce arhitekture MCP strežnika, načela oblikovanja baze podatkov in podrobno tehnično implementacijo, ki poganja našo rešitev za analitiko na drobno.

## 📚 Dodatni viri

### Dokumentacija MCP
- [Specifikacija MCP](https://modelcontextprotocol.io/docs/) - Uradna dokumentacija protokola
- [MCP za začetnike](https://aka.ms/mcp-for-beginners) - Celovit vodič za učenje MCP
- [Dokumentacija FastMCP](https://github.com/modelcontextprotocol/python-sdk) - Dokumentacija Python SDK

### Integracija baze podatkov
- [Dokumentacija PostgreSQL](https://www.postgresql.org/docs/) - Celoten referenčni priročnik PostgreSQL
- [Vodič pgvector](https://github.com/pgvector/pgvector) - Dokumentacija razširitve za vektorje
- [Varnost na ravni vrstic](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - Vodič za PostgreSQL RLS

### Azure storitve
- [Dokumentacija Azure OpenAI](https://docs.microsoft.com/azure/cognitive-services/openai/) - Integracija AI storitev
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Upravljana storitev baze podatkov
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Kontejnerji brez strežnika

---

**Opozorilo**: To je učna vaja z uporabo izmišljenih podatkov o prodaji na drobno. Vedno upoštevajte politike upravljanja podatkov in varnosti vaše organizacije pri implementaciji podobnih rešitev v produkcijskih okoljih.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.