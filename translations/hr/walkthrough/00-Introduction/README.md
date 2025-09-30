<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-30T07:21:05+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "hr"
}
-->
# Uvod u MCP integraciju s bazom podataka

## 🎯 Što pokriva ovaj modul

Ovaj uvodni modul pruža sveobuhvatan pregled izgradnje Model Context Protocol (MCP) servera s integracijom baze podataka. Kroz primjer analitike Zava Retaila, razumjet ćete poslovni slučaj, tehničku arhitekturu i primjenu u stvarnom svijetu.

## Pregled

**Model Context Protocol (MCP)** omogućuje AI asistentima siguran pristup i interakciju s vanjskim izvorima podataka u stvarnom vremenu. Kada se kombinira s integracijom baze podataka, MCP otključava moćne mogućnosti za aplikacije temeljene na podacima.

Ovaj obrazovni put vas uči kako izgraditi MCP servere spremne za produkciju koji povezuju AI asistente s podacima o maloprodaji putem PostgreSQL-a, implementirajući poslovne obrasce poput sigurnosti na razini redaka, semantičkog pretraživanja i pristupa podacima za više korisnika.

## Ciljevi učenja

Na kraju ovog modula, moći ćete:

- **Definirati** Model Context Protocol i njegove ključne prednosti za integraciju baze podataka
- **Identificirati** ključne komponente arhitekture MCP servera s bazama podataka
- **Razumjeti** slučaj Zava Retaila i njegove poslovne zahtjeve
- **Prepoznati** poslovne obrasce za siguran i skalabilan pristup bazama podataka
- **Navesti** alate i tehnologije korištene tijekom ovog obrazovnog puta

## 🧭 Izazov: AI susreće podatke iz stvarnog svijeta

### Ograničenja tradicionalnog AI-a

Moderni AI asistenti su iznimno moćni, ali suočavaju se s značajnim ograničenjima kada rade s podacima iz stvarnog poslovnog svijeta:

| **Izazov**          | **Opis**                                   | **Poslovni utjecaj**              |
|----------------------|-------------------------------------------|-----------------------------------|
| **Statističko znanje** | AI modeli trenirani na fiksnim skupovima podataka ne mogu pristupiti aktualnim poslovnim podacima | Zastarjeli uvidi, propuštene prilike |
| **Izolirani podaci**  | Informacije zaključane u bazama podataka, API-ima i sustavima koje AI ne može dosegnuti | Nepotpuna analiza, fragmentirani procesi |
| **Sigurnosna ograničenja** | Direktan pristup bazi podataka povećava sigurnosne i regulatorne rizike | Ograničena primjena, ručna priprema podataka |
| **Kompleksni upiti**   | Poslovni korisnici trebaju tehničko znanje za izvlačenje uvida iz podataka | Smanjena primjena, neučinkoviti procesi |

### MCP rješenje

Model Context Protocol rješava ove izazove pružajući:

- **Pristup podacima u stvarnom vremenu**: AI asistenti upituju aktivne baze podataka i API-je
- **Sigurnu integraciju**: Kontrolirani pristup s autentifikacijom i dozvolama
- **Sučelje prirodnog jezika**: Poslovni korisnici postavljaju pitanja na običnom engleskom jeziku
- **Standardizirani protokol**: Radi na različitim AI platformama i alatima

## 🏪 Upoznajte Zava Retail: Naš studijski slučaj

Kroz ovaj obrazovni put, izgradit ćemo MCP server za **Zava Retail**, izmišljeni lanac trgovina za "uradi sam" projekte s više lokacija. Ovaj realistični scenarij demonstrira implementaciju MCP-a na razini poduzeća.

### Poslovni kontekst

**Zava Retail** upravlja:
- **8 fizičkih trgovina** diljem savezne države Washington (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 online trgovinom** za e-trgovinu
- **Raznolikim katalogom proizvoda** uključujući alate, građevinski materijal, vrtni pribor i opremu
- **Višerazinskim upravljanjem** s voditeljima trgovina, regionalnim menadžerima i izvršnim direktorima

### Poslovni zahtjevi

Voditelji trgovina i izvršni direktori trebaju analitiku temeljenu na AI-u za:

1. **Analizu prodajnih rezultata** po trgovinama i vremenskim razdobljima
2. **Praćenje razine zaliha** i identifikaciju potreba za dopunom
3. **Razumijevanje ponašanja kupaca** i obrazaca kupovine
4. **Otkrivanje uvida o proizvodima** putem semantičkog pretraživanja
5. **Generiranje izvještaja** pomoću upita na prirodnom jeziku
6. **Održavanje sigurnosti podataka** s kontrolom pristupa temeljenom na ulogama

### Tehnički zahtjevi

MCP server mora omogućiti:

- **Pristup podacima za više korisnika** gdje voditelji trgovina vide samo podatke svoje trgovine
- **Fleksibilno upitovanje** koje podržava kompleksne SQL operacije
- **Semantičko pretraživanje** za otkrivanje proizvoda i preporuke
- **Podatke u stvarnom vremenu** koji odražavaju aktualno poslovno stanje
- **Sigurnu autentifikaciju** s sigurnošću na razini redaka
- **Skalabilnu arhitekturu** koja podržava više istovremenih korisnika

## 🏗️ Pregled arhitekture MCP servera

Naš MCP server implementira slojevitu arhitekturu optimiziranu za integraciju baze podataka:

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

#### **1. MCP sloj servera**
- **FastMCP Framework**: Moderna Python implementacija MCP servera
- **Registracija alata**: Deklarativne definicije alata s provjerom tipova
- **Kontekst zahtjeva**: Upravljanje identitetom korisnika i sesijama
- **Upravljanje greškama**: Robusno upravljanje greškama i zapisivanje

#### **2. Sloj integracije baze podataka**
- **Pool konekcija**: Učinkovito upravljanje asyncpg konekcijama
- **Pružatelj sheme**: Dinamičko otkrivanje sheme tablica
- **Izvršitelj upita**: Sigurno izvršavanje SQL upita s RLS kontekstom
- **Upravljanje transakcijama**: Poštivanje ACID principa i rukovanje povratima

#### **3. Sigurnosni sloj**
- **Sigurnost na razini redaka**: PostgreSQL RLS za izolaciju podataka za više korisnika
- **Identitet korisnika**: Autentifikacija i autorizacija voditelja trgovina
- **Kontrola pristupa**: Fino podešene dozvole i zapisivanje aktivnosti
- **Validacija unosa**: Prevencija SQL injekcija i validacija upita

#### **4. Sloj AI poboljšanja**
- **Semantičko pretraživanje**: Vektorski prikazi za otkrivanje proizvoda
- **Integracija Azure OpenAI**: Generiranje tekstualnih vektora
- **Algoritmi sličnosti**: pgvector pretraživanje kosinusne sličnosti
- **Optimizacija pretraživanja**: Indeksiranje i podešavanje performansi

## 🔧 Tehnološki paket

### Osnovne tehnologije

| **Komponenta**       | **Tehnologija**           | **Namjena**                     |
|-----------------------|---------------------------|----------------------------------|
| **MCP Framework**     | FastMCP (Python)         | Moderna implementacija MCP servera |
| **Baza podataka**     | PostgreSQL 17 + pgvector | Relacijski podaci s vektorskim pretraživanjem |
| **AI usluge**         | Azure OpenAI             | Tekstualni vektori i jezični modeli |
| **Kontejnerizacija**  | Docker + Docker Compose  | Razvojno okruženje              |
| **Cloud platforma**   | Microsoft Azure          | Produkcijsko okruženje          |
| **IDE integracija**   | VS Code                  | AI Chat i razvojni tijek rada   |

### Alati za razvoj

| **Alat**              | **Namjena**              |
|-----------------------|--------------------------|
| **asyncpg**           | Visokoučinkoviti PostgreSQL driver |
| **Pydantic**          | Validacija i serijalizacija podataka |
| **Azure SDK**         | Integracija cloud usluga |
| **pytest**            | Okvir za testiranje      |
| **Docker**            | Kontejnerizacija i implementacija |

### Produkcijski paket

| **Usluga**            | **Azure resurs**         | **Namjena**                     |
|-----------------------|--------------------------|----------------------------------|
| **Baza podataka**     | Azure Database for PostgreSQL | Upravljana baza podataka       |
| **Kontejner**         | Azure Container Apps     | Serverless hosting kontejnera   |
| **AI usluge**         | Azure AI Foundry         | OpenAI modeli i krajnje točke   |
| **Praćenje**          | Application Insights     | Promatranje i dijagnostika      |
| **Sigurnost**         | Azure Key Vault          | Upravljanje tajnama i konfiguracijom |

## 🎬 Scenariji korištenja u stvarnom svijetu

Pogledajmo kako različiti korisnici koriste naš MCP server:

### Scenarij 1: Pregled performansi voditelja trgovine

**Korisnik**: Sarah, voditeljica trgovine u Seattleu  
**Cilj**: Analizirati prodajne rezultate za posljednje tromjesečje

**Upit na prirodnom jeziku**:
> "Pokaži mi 10 najboljih proizvoda po prihodu za moju trgovinu u Q4 2024"

**Što se događa**:
1. VS Code AI Chat šalje upit MCP serveru
2. MCP server identificira kontekst trgovine Sarah (Seattle)
3. RLS politike filtriraju podatke samo za trgovinu u Seattleu
4. Generira se i izvršava SQL upit
5. Rezultati se formatiraju i vraćaju u AI Chat
6. AI pruža analizu i uvide

### Scenarij 2: Otkrivanje proizvoda pomoću semantičkog pretraživanja

**Korisnik**: Mike, voditelj inventara  
**Cilj**: Pronaći proizvode slične zahtjevu kupca

**Upit na prirodnom jeziku**:
> "Koje proizvode prodajemo koji su slični 'vodootpornim električnim konektorima za vanjsku upotrebu'?"

**Što se događa**:
1. Upit obrađuje alat za semantičko pretraživanje
2. Azure OpenAI generira vektorski prikaz
3. pgvector izvršava pretraživanje sličnosti
4. Srodni proizvodi rangirani prema relevantnosti
5. Rezultati uključuju detalje o proizvodima i dostupnost
6. AI predlaže alternative i mogućnosti kombiniranja

### Scenarij 3: Analitika između trgovina

**Korisnik**: Jennifer, regionalna menadžerica  
**Cilj**: Usporediti performanse između svih trgovina

**Upit na prirodnom jeziku**:
> "Usporedi prodaju po kategorijama za sve trgovine u posljednjih 6 mjeseci"

**Što se događa**:
1. RLS kontekst postavljen za pristup regionalnog menadžera
2. Generira se kompleksan upit za više trgovina
3. Podaci se agregiraju između lokacija trgovina
4. Rezultati uključuju trendove i usporedbe
5. AI identificira uvide i preporuke

## 🔒 Sigurnost i pristup za više korisnika: Detaljan pregled

Naša implementacija prioritizira sigurnost na razini poduzeća:

### Sigurnost na razini redaka (RLS)

PostgreSQL RLS osigurava izolaciju podataka:

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

### Upravljanje identitetom korisnika

Svaka MCP konekcija uključuje:
- **ID voditelja trgovine**: Jedinstveni identifikator za RLS kontekst
- **Dodjela uloga**: Dozvole i razine pristupa
- **Upravljanje sesijama**: Sigurni autentifikacijski tokeni
- **Zapisivanje aktivnosti**: Kompletna povijest pristupa

### Zaštita podataka

Višestruki slojevi sigurnosti:
- **Šifriranje konekcija**: TLS za sve konekcije s bazom podataka
- **Prevencija SQL injekcija**: Isključivo parametarski upiti
- **Validacija unosa**: Sveobuhvatna validacija zahtjeva
- **Upravljanje greškama**: Bez osjetljivih podataka u porukama o greškama

## 🎯 Ključni zaključci

Nakon završetka ovog uvoda, trebali biste razumjeti:

✅ **Vrijednost MCP-a**: Kako MCP povezuje AI asistente i podatke iz stvarnog svijeta  
✅ **Poslovni kontekst**: Zahtjeve i izazove Zava Retaila  
✅ **Pregled arhitekture**: Ključne komponente i njihove interakcije  
✅ **Tehnološki paket**: Alate i okvire korištene tijekom obrazovnog puta  
✅ **Sigurnosni model**: Pristup podacima za više korisnika i zaštita  
✅ **Obrasci korištenja**: Scenariji upita u stvarnom svijetu i tijekovi rada  

## 🚀 Što slijedi

Spremni za dublje istraživanje? Nastavite s:

**[Modul 01: Osnovni koncepti arhitekture](../01-Architecture/README.md)**

Naučite o obrascima arhitekture MCP servera, principima dizajna baza podataka i detaljnoj tehničkoj implementaciji koja pokreće naše rješenje za analitiku maloprodaje.

## 📚 Dodatni resursi

### MCP dokumentacija
- [MCP Specifikacija](https://modelcontextprotocol.io/docs/) - Službena dokumentacija protokola
- [MCP za početnike](https://aka.ms/mcp-for-beginners) - Sveobuhvatan vodič za MCP
- [FastMCP Dokumentacija](https://github.com/modelcontextprotocol/python-sdk) - Dokumentacija Python SDK-a

### Integracija baze podataka
- [PostgreSQL Dokumentacija](https://www.postgresql.org/docs/) - Kompletna referenca za PostgreSQL
- [pgvector Vodič](https://github.com/pgvector/pgvector) - Dokumentacija ekstenzije za vektore
- [Sigurnost na razini redaka](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - Vodič za PostgreSQL RLS

### Azure usluge
- [Azure OpenAI Dokumentacija](https://docs.microsoft.com/azure/cognitive-services/openai/) - Integracija AI usluga
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Upravljana baza podataka
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Serverless kontejneri

---

**Napomena**: Ovo je obrazovna vježba koja koristi izmišljene podatke o maloprodaji. Uvijek slijedite politike upravljanja podacima i sigurnosti vaše organizacije prilikom implementacije sličnih rješenja u produkcijskim okruženjima.

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.