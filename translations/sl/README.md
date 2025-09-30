<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T07:32:40+00:00",
  "source_file": "README.md",
  "language_code": "sl"
}
-->
# MCP strežnik in vzorčni primer PostgreSQL - Analiza prodaje na drobno

## Naučite se MCP z integracijo podatkovnih baz skozi praktične primere

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Pridružite se Discordu Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Sledite tem korakom, da začnete uporabljati te vire:

1. **Forkajte repozitorij**: Kliknite [tukaj za fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klonirajte repozitorij**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Pridružite se Discordu Azure AI Foundry**: [Spoznajte strokovnjake in druge razvijalce](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podpora za več jezikov

#### Podprto prek GitHub Action (samodejno in vedno posodobljeno)

[Francoščina](../fr/README.md) | [Španščina](../es/README.md) | [Nemščina](../de/README.md) | [Ruščina](../ru/README.md) | [Arabščina](../ar/README.md) | [Perzijščina (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kitajščina (poenostavljena)](../zh/README.md) | [Kitajščina (tradicionalna, Macao)](../mo/README.md) | [Kitajščina (tradicionalna, Hong Kong)](../hk/README.md) | [Kitajščina (tradicionalna, Tajvan)](../tw/README.md) | [Japonščina](../ja/README.md) | [Korejščina](../ko/README.md) | [Hindijščina](../hi/README.md) | [Bengalščina](../bn/README.md) | [Maratščina](../mr/README.md) | [Nepalščina](../ne/README.md) | [Pandžabščina (Gurmukhi)](../pa/README.md) | [Portugalščina (Portugalska)](../pt/README.md) | [Portugalščina (Brazilija)](../br/README.md) | [Italijanščina](../it/README.md) | [Poljščina](../pl/README.md) | [Turščina](../tr/README.md) | [Grščina](../el/README.md) | [Tajščina](../th/README.md) | [Švedščina](../sv/README.md) | [Danščina](../da/README.md) | [Norveščina](../no/README.md) | [Finščina](../fi/README.md) | [Nizozemščina](../nl/README.md) | [Hebrejščina](../he/README.md) | [Vietnamščina](../vi/README.md) | [Indonezijščina](../id/README.md) | [Malajščina](../ms/README.md) | [Tagalog (Filipinsko)](../tl/README.md) | [Svahili](../sw/README.md) | [Madžarščina](../hu/README.md) | [Češčina](../cs/README.md) | [Slovaščina](../sk/README.md) | [Romunščina](../ro/README.md) | [Bolgarščina](../bg/README.md) | [Srbščina (cirilica)](../sr/README.md) | [Hrvaščina](../hr/README.md) | [Slovenščina](./README.md) | [Ukrajinščina](../uk/README.md) | [Burmanščina (Myanmar)](../my/README.md)

**Če želite dodati dodatne prevode, so podprti jeziki navedeni [tukaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Uvod

Ta primer prikazuje, kako zgraditi in namestiti celovit **Model Context Protocol (MCP) strežnik**, ki omogoča AI asistentom varen in inteligenten dostop do podatkov o prodaji na drobno prek PostgreSQL. Projekt vključuje funkcije na ravni podjetja, kot so **Row Level Security (RLS)**, **semantično iskanje**, in **integracija Azure AI** za analizo prodaje v resničnih scenarijih.

**Ključni primeri uporabe:**
- **Analitika prodaje, podprta z AI**: Omogočite AI asistentom poizvedovanje in analizo podatkov o prodaji na drobno prek naravnega jezika
- **Varen dostop za več najemnikov**: Prikaz implementacije Row Level Security, kjer lahko različni vodje trgovin dostopajo le do podatkov svoje trgovine
- **Semantično iskanje izdelkov**: Prikaz AI-podprtega odkrivanja izdelkov z uporabo besedilnih vektorskih predstavitev
- **Integracija na ravni podjetja**: Prikaz, kako integrirati MCP strežnike z Azure storitvami in PostgreSQL podatkovnimi bazami

**Idealno za:**
- Razvijalce, ki se učijo gradnje MCP strežnikov z integracijo podatkovnih baz
- Podatkovne inženirje, ki izvajajo varne analitične rešitve za več najemnikov
- Razvijalce AI aplikacij, ki delajo s podatki o prodaji na drobno ali e-trgovini
- Vsakogar, ki ga zanima kombinacija AI asistentov z bazami podatkov na ravni podjetja

## Pridružite se skupnosti Discord Azure AI Foundry
Delite svoje izkušnje z MCP in spoznajte strokovnjake ter produktne skupine

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# MCP strežnik za analizo prodaje

Model Context Protocol (MCP) strežnik, ki omogoča celovit dostop do podatkovne baze o prodaji strank za Zava Retail DIY Business. Ta strežnik omogoča AI asistentom poizvedovanje in analizo podatkov o prodaji na drobno prek varnega, shema-zavednega vmesnika.

## 📚 Celovit vodič za implementacijo

Za podroben pregled, kako je ta rešitev zgrajena in kako implementirati podobne MCP strežnike, si oglejte naš celovit **[Vodič po vzorčnem primeru](Sample_Walkthrough.md)**. Ta vodič vključuje:

- **Poglobljena analiza arhitekture**: Analiza komponent in vzorcev oblikovanja
- **Korak za korakom gradnja**: Od nastavitve projekta do namestitve
- **Razčlenitev kode**: Podrobna razlaga implementacije MCP strežnika
- **Napredne funkcije**: Row Level Security, semantično iskanje in spremljanje
- **Najboljše prakse**: Varnost, zmogljivost in smernice za razvoj
- **Odpravljanje težav**: Pogoste težave in rešitve

Idealno za razvijalce, ki želijo razumeti podrobnosti implementacije in zgraditi podobne rešitve.

## 🤖 Kaj je MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** je odprti standard, ki omogoča AI asistentom varen dostop do zunanjih virov podatkov in orodij v realnem času. Predstavljajte si ga kot most, ki AI modelom omogoča povezovanje z bazami podatkov, API-ji, datotečnimi sistemi in drugimi viri, hkrati pa ohranja varnost in nadzor.

### Ključne prednosti:
- **Dostop do podatkov v realnem času**: AI asistenti lahko poizvedujejo po živih bazah podatkov in API-jih
- **Varna integracija**: Nadzorovan dostop z avtentikacijo in dovoljenji  
- **Razširljivost orodij**: Dodajanje prilagojenih zmogljivosti AI asistentom
- **Standardiziran protokol**: Deluje na različnih AI platformah in orodjih

### Novinec pri MCP?

Če ste novi pri Model Context Protocol, priporočamo začetek z Microsoftovimi celovitimi viri za začetnike:

**📖 [Vodnik za začetnike MCP](https://aka.ms/mcp-for-beginners)**

Ta vir vključuje:
- Uvod v MCP koncepte in arhitekturo
- Korak za korakom vadnice za gradnjo vašega prvega MCP strežnika
- Najboljše prakse za razvoj MCP
- Primeri integracije z priljubljenimi AI platformami
- Skupnostni viri in podpora

Ko razumete osnove, se vrnite sem, da raziščete to napredno implementacijo analitike prodaje na drobno!

## 📚 Celovit učni vodič: /walkthrough

Ta repozitorij vključuje celovit **12-modulni učni vodič**, ki razčleni ta vzorčni MCP strežnik za prodajo na drobno v prebavljive, korak za korakom lekcije. Vodič pretvori ta delujoči primer v celovit izobraževalni vir, idealen za razvijalce, ki želijo razumeti, kako zgraditi produkcijsko pripravljene MCP strežnike z integracijo podatkovnih baz.

### Kaj se boste naučili

Vodič pokriva vse od osnovnih konceptov MCP do napredne produkcijske namestitve, vključno z:

- **Osnove MCP**: Razumevanje Model Context Protocol in njegovih aplikacij v resničnem svetu
- **Integracija podatkovnih baz**: Implementacija varne povezljivosti PostgreSQL z Row Level Security
- **AI-podprte funkcije**: Dodajanje semantičnih iskalnih zmogljivosti z Azure OpenAI vektorskimi predstavitvami
- **Implementacija varnosti**: Avtentikacija na ravni podjetja, avtorizacija in izolacija podatkov
- **Razvoj orodij**: Gradnja naprednih MCP orodij za analizo podatkov in poslovno inteligenco
- **Testiranje in odpravljanje napak**: Celovite strategije testiranja in tehnike odpravljanja napak
- **Integracija z VS Code**: Konfiguracija AI Chat za poizvedbe podatkovnih baz v naravnem jeziku
- **Produkcijska namestitev**: Kontejnerizacija, skaliranje in strategije namestitve v oblaku
- **Spremljanje in opazovanje**: Application Insights, beleženje in spremljanje zmogljivosti

### Pregled učne poti

Vodič sledi progresivni učni strukturi, zasnovani za razvijalce vseh ravni znanja:

| Modul | Osrednja tema | Opis | Časovna ocena |
|-------|---------------|------|---------------|
| **[00-Uvod](walkthrough/00-Introduction/README.md)** | Osnove | Koncepti MCP, študija primera Zava Retail, pregled arhitekture | 30 minut |
| **[01-Arhitektura](walkthrough/01-Architecture/README.md)** | Vzorci oblikovanja | Tehnična arhitektura, slojno oblikovanje, sistemske komponente | 45 minut |
| **[02-Varnost](walkthrough/02-Security/README.md)** | Varnost na ravni podjetja | Avtentikacija Azure, Row Level Security, izolacija več najemnikov | 60 minut |
| **[03-Nastavitev](walkthrough/03-Setup/README.md)** | Okolje | Nastavitev Dockerja, Azure CLI, konfiguracija projekta, validacija | 45 minut |
| **[04-Podatkovna baza](walkthrough/04-Database/README.md)** | Podatkovni sloj | PostgreSQL shema, pgvector, RLS politike, vzorčni podatki | 60 minut |
| **[05-MCP-strežnik](walkthrough/05-MCP-Server/README.md)** | Osnovna implementacija | FastMCP okvir, integracija podatkovne baze, upravljanje povezav | 90 minut |
| **[06-Orodja](walkthrough/06-Tools/README.md)** | Razvoj orodij | Ustvarjanje MCP orodij, validacija poizvedb, funkcije poslovne inteligence | 75 minut |
| **[07-Semantično iskanje](walkthrough/07-Semantic-Search/README.md)** | AI integracija | Azure OpenAI vektorske predstavitve, iskanje po vektorjih, hibridne strategije iskanja | 60 minut |
| **[08-Testiranje](walkthrough/08-Testing/README.md)** | Zagotavljanje kakovosti | Enotno testiranje, integracijsko testiranje, testiranje zmogljivosti, odpravljanje napak | 75 minut |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Razvojna izkušnja | Konfiguracija VS Code, integracija AI Chat, delovni tokovi odpravljanja napak | 45 minut |
| **[10-Namestitev](walkthrough/10-Deployment/README.md)** | Pripravljeno za produkcijo | Kontejnerizacija, Azure Container Apps, CI/CD pipelines, skaliranje | 90 minut |
| **[11-Spremljanje](walkthrough/11-Monitoring/README.md)** | Opazovanje | Application Insights, strukturirano beleženje, zmogljivostne metrike | 60 minut |
| **[12-Najboljše prakse](walkthrough/12-Best-Practices/README.md)** | Odličnost v produkciji | Krepitev varnosti, optimizacija zmogljivosti, vzorci na ravni podjetja | 45 minut |

**Skupni čas učenja**: ~12-15 ur celovitega praktičnega učenja

### 🎯 Kako uporabljati vodič

**Za začetnike**:
1. Začnite z [Modulom 00: Uvod](walkthrough/00-Introduction/README.md), da razumete osnove MCP
2. Sledite modulom zaporedno za celovito učno izkušnjo
3. Vsak modul gradi na prejšnjih konceptih in vključuje praktične vaje

**Za izkušene razvijalce**:
1. Preglejte [Glavni pregled vodiča](walkthrough/README.md) za povzetek modulov
2. Skočite na specifične module, ki vas zanimajo (npr. Modul 07 za AI integracijo)
3. Uporabite posamezne module kot referenčni material za svoje projekte

**Za produkcijsko implementacijo**:
1. Osredotočite se na Module 02 (Varnost), 10 (Namestitev) in 11 (Spremljanje)
2. Preglejte Modul 12 (Najboljše prakse) za smernice na ravni podjetja
3. Uporabite primere kode kot predloge, pripravljene za produkcijo

### 🚀 Možnosti hitrega začetka

**Možnost 1: Celovita učna pot** (Priporočeno za začetnike)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Možnost 2: Praktična implementacija** (Takoj začnite z gradnjo)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Možnost 3: Osredotočenost na produkcijo** (Namestitev na ravni podjetja)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Predpogoji za učenje

**Priporočeno predznanje**:
- Osnovne izkušnje s programiranjem v Pythonu
- Poznavanje REST API-jev in baz podatkov
- Splošno razumevanje konceptov AI/ML
- Osnovno znanje ukazne vrstice in Dockerja

**Ni potrebno (vendar koristno)**:
- Predhodne izkušnje z MCP (začnemo od začetka)
- Izkušnje z oblakom Azure (zagotovimo podrobna navodila)
- Napredno znanje PostgreSQL (koncepte razložimo po potrebi)

### 💡 Nasveti za učenje

1. **Praktičen pristop**: Vsak modul vključuje delujoče primere kode, ki jih lahko zaženete in prilagodite
2. **Postopna kompleksnost**: Koncepti se gradijo postopoma, od enostavnih do naprednih
3. **Realni kontekst**: Vsi primeri temeljijo na realističnih scenarijih maloprodajnega poslovanja
4. **Pripravljeno za produkcijo**: Primeri kode so zasnovani za dejansko uporabo v produkciji
5. **Podpora skupnosti**: Pridružite se naši [Discord skupnosti](https://discord.com/invite/ByRwuEEgH4) za pomoč in razprave

### 🔗 Povezani viri

- **[MCP za začetnike](https://aka.ms/mcp-for-beginners)**: Ključno branje za ozadje
- **[Primer sprehoda](Sample_Walkthrough.md)**: Tehnični pregled na visoki ravni
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Oblak, uporabljen v primerih
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Pythonov okvir za implementacijo MCP

**Pripravljeni na začetek?** Začnite z **[Modul 00: Uvod](walkthrough/00-Introduction/README.md)** ali raziščite **[celoten pregled sprehoda](walkthrough/README.md)**.

## Predpogoji

1. Nameščen Docker Desktop
2. Nameščen Git
3. **Azure CLI**: Namestite in se prijavite z Azure CLI
4. Dostop do modela OpenAI `text-embedding-3-small` in po želji modela `gpt-4o-mini`.

## Začetek

Odprite terminal in zaženite naslednje ukaze:

1. Prijavite se z Azure CLI

    ```bash
    az login
    ```

2. Klonirajte repozitorij

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Premaknite se v projektno mapo

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Uvedba virov Azure

Zaženite naslednje skripte za avtomatizacijo uvedbe virov Azure, potrebnih za strežnik MCP.

Skripti za uvedbo bodo samodejno uvedli model `text-embedding-3-small`. Med uvedbo boste imeli možnost vključiti tudi model `gpt-4o-mini`. Upoštevajte, da model `gpt-4o-mini` **ni potreben** za ta projekt in je vključen le za morebitne prihodnje izboljšave.

**Izberite skript za svojo platformo:**

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

## Zagon strežnika MCP

Najlažji način za zagon celotnega sklopa (PostgreSQL + strežnik MCP) je uporaba Docker Compose:

### Zaženite sklop

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

## Uporaba

Naslednji koraki predvidevajo, da boste uporabljali vgrajeno podporo za strežnik MCP v VS Code.

1. Odprite projekt v VS Code. V terminalu zaženite:

    ```bash
    code .
    ```

2. Zaženite enega ali več strežnikov MCP z uporabo konfiguracij v `.vscode/mcp.json`. Datoteka vsebuje štiri različne konfiguracije strežnikov, ki predstavljajo različne vloge upraviteljev trgovin:

   - Vsaka konfiguracija uporablja edinstven RLS (Row Level Security) ID uporabnika
   - Ti ID-ji uporabnikov simulirajo identitete različnih upraviteljev trgovin, ki dostopajo do baze podatkov
   - Sistem RLS omejuje dostop do podatkov glede na dodeljeno trgovino upravitelja
   - To posnema realne scenarije, kjer se upravitelji trgovin prijavijo z različnimi računi Entra ID

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

### Odprite AI Chat v VS Code

1. Odprite način AI Chat v VS Code
2. Vnesite **#zava** in izberite enega od strežnikov MCP, ki ste jih zagnali
3. Postavite vprašanja o prodajnih podatkih - Spodaj so primeri poizvedb

### Primeri poizvedb

1. Prikaži 20 najboljših izdelkov po prihodku od prodaje
1. Prikaži prodajo po trgovinah
1. Kakšna je bila prodaja po kategorijah v zadnjem četrtletju?
1. Katere izdelke prodajamo, ki so podobni "posodam za barvo"?

## Funkcionalnosti

- **Dostop do več tabel sheme**: Pridobite sheme za več tabel baze podatkov v eni zahtevi
- **Varno izvajanje poizvedb**: Izvajajte poizvedbe PostgreSQL z podporo za Row Level Security (RLS)
- **Podatki v realnem času**: Dostop do trenutnih podatkov o prodaji, zalogah in strankah
- **Orodja za datum/čas**: Pridobite trenutne UTC časovne žige za analize, občutljive na čas
- **Prilagodljiva uvedba**: Podpira način HTTP strežnika

## Podprte tabele

Strežnik omogoča dostop do naslednjih tabel maloprodajne baze podatkov:

- `retail.customers` - Informacije in profili strank
- `retail.stores` - Lokacije in podrobnosti trgovin
- `retail.categories` - Kategorije izdelkov in hierarhije
- `retail.product_types` - Klasifikacije vrst izdelkov
- `retail.products` - Katalog izdelkov in specifikacije
- `retail.orders` - Naročila in transakcije strank
- `retail.order_items` - Posamezni artikli v naročilih
- `retail.inventory` - Trenutne zaloge in podatki o zalogah

## Razpoložljiva orodja

### `get_multiple_table_schemas`

Pridobite sheme baz podatkov za več tabel v eni zahtevi.

**Parametri:**

- `table_names` (list[str]): Seznam veljavnih imen tabel iz zgoraj navedenih podprtih tabel

**Vrne:** Združene nize shem za zahtevane tabele

### `execute_sales_query`

Izvajajte poizvedbe PostgreSQL v prodajni bazi podatkov z Row Level Security.

**Parametri:**

- `postgresql_query` (str): Dobro oblikovana poizvedba PostgreSQL

**Vrne:** Rezultati poizvedbe, oblikovani kot niz (omejeno na 20 vrstic za boljšo berljivost)

**Najboljše prakse:**

- Vedno najprej pridobite sheme tabel
- Uporabljajte natančna imena stolpcev iz shem
- Povežite povezane tabele za celovito analizo
- Združujte rezultate, kadar je to primerno
- Omejite izhod za boljšo berljivost

### `get_current_utc_date`

Pridobite trenutni UTC datum in čas v ISO formatu.

**Vrne:** Trenutni UTC datum/čas v ISO formatu (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Izvedite semantično iskanje izdelkov na podlagi uporabniških poizvedb.

**Parametri:**

- `query` (str): Niz poizvedbe za iskanje

**Vrne:** Seznam izdelkov, ki ustrezajo kriterijem iskanja

## Varnostne funkcionalnosti

### Row Level Security (RLS)

Strežnik implementira Row Level Security, da zagotovi, da uporabniki dostopajo le do podatkov, za katere so pooblaščeni:

- **Način HTTP**: Uporablja glavo `x-rls-user-id` za identifikacijo uporabnika, ki pošilja zahtevo

- **Privzeta nastavitev**: Uporablja nadomestni UUID, kadar ID uporabnika ni podan

#### Specifični RLS ID-ji uporabnikov za trgovine

Vsaka lokacija trgovine Zava Retail ima edinstven RLS ID uporabnika, ki določa, do katerih podatkov lahko uporabnik dostopa:

| Lokacija trgovine | RLS ID uporabnika | Opis |
|-------------------|-------------------|------|
| **Globalni dostop** | `00000000-0000-0000-0000-000000000000` | Privzeta nastavitev - dostop do vseh trgovin |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Podatki trgovine Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Podatki trgovine Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Podatki trgovine Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Podatki trgovine Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Podatki trgovine Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Podatki trgovine Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Podatki trgovine Zava Retail Kirkland |
| **Spletna trgovina** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Podatki spletne trgovine Zava Retail |

#### Implementacija RLS

Ko se uporabnik poveže z določenim RLS ID-jem trgovine, bo videl le:

- Stranke, povezane s to trgovino
- Naročila, oddana na lokaciji te trgovine
- Podatke o zalogah za to specifično trgovino
- Prodajne in uspešnostne metrike specifične za trgovino

To zagotavlja izolacijo podatkov med različnimi lokacijami trgovin, hkrati pa ohranja enotno shemo baze podatkov.

## Arhitektura

### Kontekst aplikacije

Strežnik uporablja upravljan kontekst aplikacije z:

- **Bazen povezav z bazo podatkov**: Učinkovito upravljanje povezav za način HTTP
- **Upravljanje življenjskega cikla**: Pravilno čiščenje virov ob zaustavitvi
- **Tipna varnost**: Močno tipiziran kontekst z dataclass `AppContext`

### Kontekst zahteve

- **Izvleček glave**: Varno razčlenjevanje glave za identifikacijo uporabnika
- **Integracija RLS**: Samodejna razrešitev ID-ja uporabnika iz konteksta zahteve
- **Obravnava napak**: Celovito obravnavanje napak s prijaznimi sporočili za uporabnika

## Integracija z bazo podatkov

Strežnik se povezuje z bazo podatkov PostgreSQL prek razreda `PostgreSQLSchemaProvider`:

- **Bazen povezav**: Uporablja asinhrone bazene povezav za skalabilnost
- **Metapodatki sheme**: Ponuja podrobne informacije o shemi tabel
- **Izvajanje poizvedb**: Varno izvajanje poizvedb z RLS podporo
- **Upravljanje virov**: Samodejno čiščenje virov baze podatkov

## Obravnava napak

Strežnik implementira robustno obravnavanje napak:

- **Validacija tabel**: Zagotavlja, da so dostopna le veljavna imena tabel
- **Validacija poizvedb**: Validira poizvedbe PostgreSQL pred izvajanjem
- **Upravljanje virov**: Pravilno čiščenje tudi med napakami
- **Prijazna sporočila za uporabnika**: Jasna sporočila o napakah za odpravljanje težav

## Varnostni vidiki

1. **Row Level Security**: Vse poizvedbe spoštujejo RLS politike glede na identiteto uporabnika
2. **Izolacija podatkov trgovin**: RLS ID uporabnika za vsako trgovino zagotavlja dostop le do podatkov te trgovine
3. **Validacija vnosa**: Imena tabel in poizvedbe so validirane pred izvajanjem
4. **Omejitve virov**: Rezultati poizvedb so omejeni, da preprečijo prekomerno uporabo virov
5. **Varnost povezave**: Uporablja varne prakse povezovanja z bazo podatkov
6. **Preverjanje identitete uporabnika**: Vedno zagotovite, da se uporablja pravilen RLS ID uporabnika za predvideno trgovino

### Pomembne varnostne opombe

- **Nikoli ne uporabljajte produkcijskih RLS ID-jev v razvojnih okoljih**
- **Vedno preverite, ali RLS ID uporabnika ustreza predvideni trgovini pred izvajanjem poizvedb**
- **Privzeti UUID (`00000000-0000-0000-0000-000000000000`) omogoča omejen dostop**
- **Vsak upravitelj trgovine naj ima dostop le do RLS ID-ja svoje trgovine**

## Razvoj

### Struktura projekta

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Ključne komponente

- **FastMCP strežnik**: Sodobna implementacija strežnika MCP z asinhrono podporo
- **Ponudnik PostgreSQL**: Abstrakcijski sloj baze podatkov z RLS podporo
- **Upravljanje konteksta**: Tipno varen kontekst aplikacije in zahteve
- **Registracija orodij**: Deklarativna registracija orodij z validacijo Pydantic

## Prispevanje

Pri prispevanju k temu strežniku:

1. Zagotovite, da vse poizvedbe baze podatkov spoštujejo Row Level Security
2. Dodajte ustrezno obravnavanje napak za nova orodja
3. Posodobite ta README z novimi funkcionalnostmi ali spremembami
4. Testirajte način HTTP strežnika
5. Validirajte vhodne parametre in zagotovite jasna sporočila o napakah

## [Licenca](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ta strežnik MCP omogoča varen in učinkovit dostop do prodajnih podatkov Zava Retail za analizo in vpoglede, podprte z umetno inteligenco.*

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.