<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T07:01:00+00:00",
  "source_file": "README.md",
  "language_code": "hr"
}
-->
# MCP Server i PostgreSQL Primjer - Analiza maloprodajnih podataka

## Naučite MCP s integracijom baze podataka kroz praktične primjere

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Pridružite se Azure AI Foundry Discordu](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Slijedite ove korake kako biste započeli s korištenjem ovih resursa:

1. **Forkajte repozitorij**: Kliknite [ovdje za fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klonirajte repozitorij**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Pridružite se Azure AI Foundry Discordu**: [Upoznajte stručnjake i kolege developere](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podrška za više jezika

#### Podržano putem GitHub Action (Automatski i uvijek ažurirano)

[Francuski](../fr/README.md) | [Španjolski](../es/README.md) | [Njemački](../de/README.md) | [Ruski](../ru/README.md) | [Arapski](../ar/README.md) | [Perzijski (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kineski (pojednostavljeni)](../zh/README.md) | [Kineski (tradicionalni, Makao)](../mo/README.md) | [Kineski (tradicionalni, Hong Kong)](../hk/README.md) | [Kineski (tradicionalni, Tajvan)](../tw/README.md) | [Japanski](../ja/README.md) | [Korejski](../ko/README.md) | [Hindski](../hi/README.md) | [Bengalski](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Pandžapski (Gurmukhi)](../pa/README.md) | [Portugalski (Portugal)](../pt/README.md) | [Portugalski (Brazil)](../br/README.md) | [Talijanski](../it/README.md) | [Poljski](../pl/README.md) | [Turski](../tr/README.md) | [Grčki](../el/README.md) | [Tajlandski](../th/README.md) | [Švedski](../sv/README.md) | [Danski](../da/README.md) | [Norveški](../no/README.md) | [Finski](../fi/README.md) | [Nizozemski](../nl/README.md) | [Hebrejski](../he/README.md) | [Vijetnamski](../vi/README.md) | [Indonezijski](../id/README.md) | [Malajski](../ms/README.md) | [Tagalog (Filipinski)](../tl/README.md) | [Svahili](../sw/README.md) | [Mađarski](../hu/README.md) | [Češki](../cs/README.md) | [Slovački](../sk/README.md) | [Rumunjski](../ro/README.md) | [Bugarski](../bg/README.md) | [Srpski (ćirilica)](../sr/README.md) | [Hrvatski](./README.md) | [Slovenski](../sl/README.md) | [Ukrajinski](../uk/README.md) | [Burmanski (Mjanmar)](../my/README.md)

**Ako želite dodati dodatne jezike, podržani jezici navedeni su [ovdje](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Uvod

Ovaj primjer pokazuje kako izgraditi i implementirati sveobuhvatan **Model Context Protocol (MCP) server** koji omogućuje AI asistentima siguran i inteligentan pristup podacima o maloprodaji putem PostgreSQL-a. Projekt prikazuje značajke na razini poduzeća, uključujući **sigurnost na razini redaka (Row Level Security - RLS)**, **semantičke mogućnosti pretraživanja** i **integraciju s Azure AI** za stvarne scenarije analitike maloprodaje.

**Ključni slučajevi upotrebe:**
- **Analitika prodaje vođena AI-jem**: Omogućite AI asistentima da upitaju i analiziraju podatke o maloprodaji putem prirodnog jezika
- **Siguran pristup za više korisnika**: Prikaz implementacije sigurnosti na razini redaka gdje različiti upravitelji trgovina mogu pristupiti samo podacima svoje trgovine
- **Semantičko pretraživanje proizvoda**: Prikaz AI-poboljšanog otkrivanja proizvoda pomoću tekstualnih ugrađivanja
- **Integracija na razini poduzeća**: Ilustracija kako integrirati MCP servere s Azure uslugama i PostgreSQL bazama podataka

**Idealno za:**
- Developere koji žele naučiti kako izgraditi MCP servere s integracijom baze podataka
- Inženjere podataka koji implementiraju sigurna rješenja za analitiku s više korisnika
- Razvijatelje AI aplikacija koji rade s podacima o maloprodaji ili e-trgovini
- Sve zainteresirane za kombiniranje AI asistenata s bazama podataka na razini poduzeća

## Pridružite se Azure AI Foundry Discord zajednici
Podijelite svoja iskustva s MCP-om i upoznajte stručnjake i produktne grupe

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# MCP Server za analizu prodaje

Model Context Protocol (MCP) server koji omogućuje sveobuhvatan pristup bazi podataka o prodaji za Zava Retail DIY Business. Ovaj server omogućuje AI asistentima da upitaju i analiziraju podatke o maloprodaji putem sigurnog, svjesnog sheme sučelja.

## 📚 Potpuni vodič za implementaciju

Za detaljan pregled kako je ovo rješenje izgrađeno i kako implementirati slične MCP servere, pogledajte naš sveobuhvatan **[Vodič kroz primjer](Sample_Walkthrough.md)**. Ovaj vodič pruža:

- **Dubinska analiza arhitekture**: Analiza komponenti i dizajnerskih obrazaca
- **Korak-po-korak izgradnja**: Od postavljanja projekta do implementacije
- **Razrada koda**: Detaljno objašnjenje implementacije MCP servera
- **Napredne značajke**: Sigurnost na razini redaka, semantičko pretraživanje i praćenje
- **Najbolje prakse**: Sigurnost, performanse i smjernice za razvoj
- **Rješavanje problema**: Uobičajeni problemi i rješenja

Savršeno za developere koji žele razumjeti detalje implementacije i izgraditi slična rješenja.

## 🤖 Što je MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** je otvoreni standard koji omogućuje AI asistentima siguran pristup vanjskim izvorima podataka i alatima u stvarnom vremenu. Zamislite ga kao most koji omogućuje AI modelima povezivanje s bazama podataka, API-jima, datotečnim sustavima i drugim resursima uz održavanje sigurnosti i kontrole.

### Ključne prednosti:
- **Pristup podacima u stvarnom vremenu**: AI asistenti mogu upitati aktivne baze podataka i API-je
- **Sigurna integracija**: Kontrolirani pristup s autentifikacijom i dozvolama  
- **Proširivost alata**: Dodavanje prilagođenih mogućnosti AI asistentima
- **Standardizirani protokol**: Radi na različitim AI platformama i alatima

### Novi u MCP-u?

Ako ste novi u Model Context Protocolu, preporučujemo da započnete s Microsoftovim sveobuhvatnim resursima za početnike:

**📖 [Vodič za MCP za početnike](https://aka.ms/mcp-for-beginners)**

Ovaj resurs pruža:
- Uvod u MCP koncepte i arhitekturu
- Korak-po-korak vodiče za izgradnju vašeg prvog MCP servera
- Najbolje prakse za MCP razvoj
- Primjere integracije s popularnim AI platformama
- Zajedničke resurse i podršku

Kada razumijete osnove, vratite se ovdje kako biste istražili ovu naprednu implementaciju analitike maloprodaje!

## 📚 Sveobuhvatan vodič za učenje: /walkthrough

Ovaj repozitorij uključuje kompletan **12-modulni vodič za učenje** koji razlaže ovaj MCP primjer servera za maloprodaju u probavljive, korak-po-korak lekcije. Vodič pretvara ovaj radni primjer u sveobuhvatan edukativni resurs savršen za developere koji žele razumjeti kako izgraditi MCP servere spremne za produkciju s integracijom baze podataka.

### Što ćete naučiti

Vodič pokriva sve, od osnovnih MCP koncepata do napredne produkcijske implementacije, uključujući:

- **Osnove MCP-a**: Razumijevanje Model Context Protocola i njegovih stvarnih primjena
- **Integracija baze podataka**: Implementacija sigurne PostgreSQL povezanosti sa sigurnošću na razini redaka
- **AI-poboljšane značajke**: Dodavanje semantičkih mogućnosti pretraživanja s Azure OpenAI ugrađivanjima
- **Implementacija sigurnosti**: Autentifikacija, autorizacija i izolacija podataka na razini poduzeća
- **Razvoj alata**: Izgradnja sofisticiranih MCP alata za analizu podataka i poslovnu inteligenciju
- **Testiranje i otklanjanje grešaka**: Sveobuhvatne strategije testiranja i tehnike otklanjanja grešaka
- **Integracija s VS Codeom**: Konfiguriranje AI Chata za upite baze podataka putem prirodnog jezika
- **Produkcijska implementacija**: Kontejnerizacija, skaliranje i strategije implementacije u oblaku
- **Praćenje i preglednost**: Application Insights, logiranje i praćenje performansi

### Pregled puta učenja

Vodič slijedi progresivnu strukturu učenja dizajniranu za developere svih razina vještina:

| Modul | Područje fokusa | Opis | Procijenjeno vrijeme |
|-------|-----------------|------|----------------------|
| **[00-Uvod](walkthrough/00-Introduction/README.md)** | Osnove | MCP koncepti, studija slučaja Zava Retail, pregled arhitekture | 30 minuta |
| **[01-Arhitektura](walkthrough/01-Architecture/README.md)** | Dizajnerski obrasci | Tehnička arhitektura, slojeviti dizajn, komponente sustava | 45 minuta |
| **[02-Sigurnost](walkthrough/02-Security/README.md)** | Sigurnost na razini poduzeća | Azure autentifikacija, sigurnost na razini redaka, izolacija za više korisnika | 60 minuta |
| **[03-Postavljanje](walkthrough/03-Setup/README.md)** | Okruženje | Docker postavljanje, Azure CLI, konfiguracija projekta, validacija | 45 minuta |
| **[04-Baza podataka](walkthrough/04-Database/README.md)** | Podatkovni sloj | PostgreSQL shema, pgvector, RLS politike, uzorci podataka | 60 minuta |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Osnovna implementacija | FastMCP okvir, integracija baze podataka, upravljanje povezivanjem | 90 minuta |
| **[06-Alati](walkthrough/06-Tools/README.md)** | Razvoj alata | Izrada MCP alata, validacija upita, značajke poslovne inteligencije | 75 minuta |
| **[07-Semantičko pretraživanje](walkthrough/07-Semantic-Search/README.md)** | AI integracija | Azure OpenAI ugrađivanja, pretraživanje vektora, strategije hibridnog pretraživanja | 60 minuta |
| **[08-Testiranje](walkthrough/08-Testing/README.md)** | Osiguranje kvalitete | Jedinično testiranje, integracijsko testiranje, testiranje performansi, otklanjanje grešaka | 75 minuta |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Iskustvo razvoja | Konfiguracija VS Codea, integracija AI Chata, radni tijekovi otklanjanja grešaka | 45 minuta |
| **[10-Implementacija](walkthrough/10-Deployment/README.md)** | Spremnost za produkciju | Kontejnerizacija, Azure Container Apps, CI/CD pipelineovi, skaliranje | 90 minuta |
| **[11-Praćenje](walkthrough/11-Monitoring/README.md)** | Preglednost | Application Insights, strukturirano logiranje, metričke performanse | 60 minuta |
| **[12-Najbolje prakse](walkthrough/12-Best-Practices/README.md)** | Izvrsnost u produkciji | Pojačanje sigurnosti, optimizacija performansi, obrasci na razini poduzeća | 45 minuta |

**Ukupno vrijeme učenja**: ~12-15 sati sveobuhvatnog praktičnog učenja

### 🎯 Kako koristiti vodič

**Za početnike**:
1. Započnite s [Modulom 00: Uvod](walkthrough/00-Introduction/README.md) kako biste razumjeli osnove MCP-a
2. Slijedite module redoslijedom za potpuno iskustvo učenja
3. Svaki modul nadograđuje prethodne koncepte i uključuje praktične vježbe

**Za iskusne developere**:
1. Pregledajte [Glavni pregled vodiča](walkthrough/README.md) za sažetak svih modula
2. Preskočite na specifične module koji vas zanimaju (npr. Modul 07 za AI integraciju)
3. Koristite pojedinačne module kao referentni materijal za vlastite projekte

**Za produkcijsku implementaciju**:
1. Fokusirajte se na Module 02 (Sigurnost), 10 (Implementacija) i 11 (Praćenje)
2. Pregledajte Modul 12 (Najbolje prakse) za smjernice na razini poduzeća
3. Koristite primjere koda kao predloške spremne za produkciju

### 🚀 Opcije brzog početka

**Opcija 1: Kompletan put učenja** (Preporučeno za početnike)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opcija 2: Praktična implementacija** (Odmah započnite s izgradnjom)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opcija 3: Fokus na produkciju** (Implementacija na razini poduzeća)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Preduvjeti za učenje

**Preporučena pozadina**:
- Osnovno iskustvo u programiranju u Pythonu
- Poznavanje REST API-ja i baza podataka
- Opće razumijevanje AI/ML koncepata
- Osnovno znanje rada s naredbenim retkom i Dockerom

**Nije obavezno (ali korisno)**:
- Prethodno MCP iskustvo (pokrivamo od početka)
- Iskustvo s Azure cloudom (pružamo detaljne upute)
- Napredno znanje PostgreSQL-a (objašnjavamo pojmove po potrebi)

### 💡 Savjeti za učenje

1. **Praktični pristup**: Svaki modul uključuje primjere koda koje možete pokrenuti i prilagoditi
2. **Postupna složenost**: Koncepti se postupno razvijaju od jednostavnih prema složenijima
3. **Kontekst iz stvarnog svijeta**: Svi primjeri koriste realne scenarije iz maloprodaje
4. **Spremno za produkciju**: Primjeri koda dizajnirani su za stvarnu produkcijsku upotrebu
5. **Podrška zajednice**: Pridružite se našoj [Discord zajednici](https://discord.com/invite/ByRwuEEgH4) za pomoć i rasprave

### 🔗 Povezani resursi

- **[MCP za početnike](https://aka.ms/mcp-for-beginners)**: Osnovno štivo
- **[Primjer koraka](Sample_Walkthrough.md)**: Pregled tehničkih detalja
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Cloud platforma korištena u primjerima
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP implementacijski okvir

**Spremni za početak?** Započnite s **[Modulom 00: Uvod](walkthrough/00-Introduction/README.md)** ili istražite **[potpuni pregled koraka](walkthrough/README.md)**.

## Preduvjeti

1. Instaliran Docker Desktop
2. Instaliran Git
3. **Azure CLI**: Instalirajte i autentificirajte se pomoću Azure CLI
4. Pristup OpenAI modelu `text-embedding-3-small` i opcionalno modelu `gpt-4o-mini`.

## Početak rada

Otvorite terminal i pokrenite sljedeće naredbe:

1. Autentificirajte se pomoću Azure CLI

    ```bash
    az login
    ```

2. Klonirajte repozitorij

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Idite u direktorij projekta

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Implementacija Azure resursa

Pokrenite sljedeće skripte za automatizaciju implementacije Azure resursa potrebnih za MCP server.

Skripte za implementaciju automatski će implementirati model `text-embedding-3-small`. Tijekom implementacije imat ćete opciju uključiti i model `gpt-4o-mini`. Napominjemo da `gpt-4o-mini` **nije obavezan** za ovaj projekt i uključen je samo za potencijalna buduća poboljšanja.

**Odaberite skriptu za svoju platformu:**

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

## Pokretanje MCP servera

Najlakši način za pokretanje cijelog sustava (PostgreSQL + MCP server) je korištenje Docker Compose:

### Pokrenite sustav

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

## Upotreba

Sljedeće pretpostavlja da ćete koristiti ugrađenu podršku za MCP server u VS Code-u.

1. Otvorite projekt u VS Code-u. U terminalu pokrenite:

    ```bash
    code .
    ```

2. Pokrenite jedan ili više MCP servera koristeći konfiguracije u `.vscode/mcp.json`. Datoteka sadrži četiri različite konfiguracije servera, svaka predstavlja ulogu različitog upravitelja trgovine:

   - Svaka konfiguracija koristi jedinstveni RLS (Row Level Security) korisnički ID
   - Ovi korisnički ID-ovi simuliraju identitete različitih upravitelja trgovina koji pristupaju bazi podataka
   - RLS sustav ograničava pristup podacima na temelju dodijeljene trgovine upravitelja
   - Ovo oponaša stvarne scenarije gdje se upravitelji trgovina prijavljuju s različitim Entra ID računima

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

### Otvorite VS Code AI Chat

1. Otvorite način rada AI Chat u VS Code-u
2. Upišite **#zava** i odaberite jedan od MCP servera koje ste pokrenuli
3. Postavljajte pitanja o prodajnim podacima - Pogledajte primjere upita u nastavku

### Primjeri upita

1. Prikaži 20 najboljih proizvoda prema prihodima od prodaje
1. Prikaži prodaju po trgovinama
1. Koja je bila prodaja po kategorijama u zadnjem kvartalu?
1. Koje proizvode prodajemo koji su slični "spremnicima za boju"?

## Značajke

- **Pristup više tablica**: Dohvatite sheme za više tablica baze podataka u jednom zahtjevu
- **Sigurno izvršavanje upita**: Izvršava PostgreSQL upite s podrškom za Row Level Security (RLS)
- **Podaci u stvarnom vremenu**: Pristup trenutnim podacima o prodaji, zalihama i kupcima
- **Alati za datum/vrijeme**: Dohvatite trenutne UTC vremenske oznake za analizu osjetljivu na vrijeme
- **Fleksibilna implementacija**: Podržava HTTP način rada servera

## Podržane tablice

Server omogućuje pristup sljedećim tablicama maloprodajne baze podataka:

- `retail.customers` - Informacije o kupcima i profili
- `retail.stores` - Lokacije trgovina i detalji
- `retail.categories` - Kategorije proizvoda i hijerarhije
- `retail.product_types` - Klasifikacije vrsta proizvoda
- `retail.products` - Katalog proizvoda i specifikacije
- `retail.orders` - Narudžbe kupaca i transakcije
- `retail.order_items` - Pojedinačni artikli unutar narudžbi
- `retail.inventory` - Trenutne razine zaliha i podaci o zalihama

## Dostupni alati

### `get_multiple_table_schemas`

Dohvatite sheme baza podataka za više tablica u jednom zahtjevu.

**Parametri:**

- `table_names` (list[str]): Popis valjanih naziva tablica iz gore navedenih podržanih tablica

**Vraća:** Konkatenirane sheme za tražene tablice

### `execute_sales_query`

Izvršava PostgreSQL upite na prodajnoj bazi podataka s podrškom za Row Level Security.

**Parametri:**

- `postgresql_query` (str): Ispravno oblikovan PostgreSQL upit

**Vraća:** Rezultati upita formatirani kao string (ograničeno na 20 redaka radi preglednosti)

**Najbolje prakse:**

- Uvijek prvo dohvatite sheme tablica
- Koristite točne nazive stupaca iz shema
- Povezujte povezane tablice za sveobuhvatnu analizu
- Agregirajte rezultate kada je to prikladno
- Ograničite izlaz radi preglednosti

### `get_current_utc_date`

Dohvatite trenutni UTC datum i vrijeme u ISO formatu.

**Vraća:** Trenutni UTC datum/vrijeme u ISO formatu (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Izvršite semantičku pretragu proizvoda na temelju korisničkih upita.

**Vraća:** Popis proizvoda koji odgovaraju kriterijima pretrage

**Parametri:**

- `query` (str): String upita za pretragu

**Vraća:** Popis proizvoda koji odgovaraju kriterijima pretrage

## Sigurnosne značajke

### Row Level Security (RLS)

Server implementira Row Level Security kako bi osigurao da korisnici pristupaju samo podacima za koje su ovlašteni:

- **HTTP način rada**: Koristi zaglavlje `x-rls-user-id` za identifikaciju korisnika koji šalje zahtjev

- **Zadana zamjena**: Koristi UUID zamjenu kada korisnički ID nije dostavljen

#### Specifični RLS korisnički ID-ovi za trgovine

Svaka lokacija Zava Retail trgovine ima jedinstveni RLS korisnički ID koji određuje koje podatke korisnik može vidjeti:

| Lokacija trgovine | RLS korisnički ID | Opis |
|-------------------|-------------------|------|
| **Globalni pristup** | `00000000-0000-0000-0000-000000000000` | Zadana zamjena - pristup svim trgovinama |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Podaci Zava Retail trgovine u Seattleu |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Podaci Zava Retail trgovine u Bellevueu |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Podaci Zava Retail trgovine u Tacomi |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Podaci Zava Retail trgovine u Spokaneu |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Podaci Zava Retail trgovine u Everettu |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Podaci Zava Retail trgovine u Redmondu |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Podaci Zava Retail trgovine u Kirklandu |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Podaci Zava Retail online trgovine |

#### Implementacija RLS-a

Kada se korisnik poveže s određenim RLS korisničkim ID-om trgovine, vidjet će samo:

- Kupce povezane s tom trgovinom
- Narudžbe izvršene u toj trgovini
- Podatke o zalihama za tu specifičnu trgovinu
- Prodajne i performansne metrike specifične za trgovinu

Ovo osigurava izolaciju podataka između različitih lokacija trgovina uz održavanje jedinstvene sheme baze podataka.

## Arhitektura

### Kontekst aplikacije

Server koristi upravljani kontekst aplikacije s:

- **Pool veze s bazom podataka**: Učinkovito upravljanje vezama za HTTP način rada
- **Upravljanje životnim ciklusom**: Ispravno čišćenje resursa pri gašenju
- **Sigurnost tipova**: Strogo tipizirani kontekst s dataclassom `AppContext`

### Kontekst zahtjeva

- **Ekstrakcija zaglavlja**: Sigurno parsiranje zaglavlja za identifikaciju korisnika
- **Integracija RLS-a**: Automatsko rješavanje korisničkog ID-a iz konteksta zahtjeva
- **Rukovanje greškama**: Sveobuhvatno rukovanje greškama s porukama prilagođenim korisniku

## Integracija baze podataka

Server se integrira s PostgreSQL bazom podataka putem klase `PostgreSQLSchemaProvider`:

- **Pool veze**: Koristi asinkrone poolove veza za skalabilnost
- **Metapodaci sheme**: Pruža detaljne informacije o shemi tablica
- **Izvršavanje upita**: Sigurno izvršavanje upita s podrškom za RLS
- **Upravljanje resursima**: Automatsko čišćenje resursa baze podataka

## Rukovanje greškama

Server implementira robusno rukovanje greškama:

- **Validacija tablica**: Osigurava pristup samo valjanim nazivima tablica
- **Validacija upita**: Provjerava PostgreSQL upite prije izvršavanja
- **Upravljanje resursima**: Ispravno čišćenje čak i tijekom grešaka
- **Poruke prilagođene korisniku**: Jasne poruke o greškama za lakše otklanjanje problema

## Sigurnosni aspekti

1. **Row Level Security**: Svi upiti poštuju RLS politike na temelju identiteta korisnika
2. **Izolacija podataka trgovina**: RLS korisnički ID svake trgovine osigurava pristup samo podacima te trgovine
3. **Validacija unosa**: Nazivi tablica i upiti se validiraju prije izvršavanja
4. **Ograničenja resursa**: Rezultati upita su ograničeni kako bi se spriječila prekomjerna upotreba resursa
5. **Sigurnost veze**: Koristi sigurne prakse povezivanja s bazom podataka
6. **Provjera identiteta korisnika**: Uvijek osigurajte da se koristi ispravan RLS korisnički ID za namijenjenu trgovinu

### Važne sigurnosne napomene

- **Nikada ne koristite produkcijske RLS korisničke ID-ove u razvojnim okruženjima**
- **Uvijek provjerite da RLS korisnički ID odgovara namijenjenoj trgovini prije pokretanja upita**
- **Zadani UUID (`00000000-0000-0000-0000-000000000000`) pruža ograničen pristup**
- **Svaki upravitelj trgovine treba imati pristup samo svom RLS korisničkom ID-u**

## Razvoj

### Struktura projekta

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Ključne komponente

- **FastMCP Server**: Moderna MCP implementacija servera s podrškom za asinkroni rad
- **PostgreSQL Provider**: Abstrakcijski sloj baze podataka s podrškom za RLS
- **Upravljanje kontekstom**: Tipizirano upravljanje kontekstom aplikacije i zahtjeva
- **Registracija alata**: Deklarativna registracija alata s Pydantic validacijom

## Doprinos

Prilikom doprinosa ovom serveru:

1. Osigurajte da svi upiti na bazu podataka poštuju Row Level Security
2. Dodajte ispravno rukovanje greškama za nove alate
3. Ažurirajte ovaj README s novim značajkama ili promjenama
4. Testirajte HTTP način rada servera
5. Validirajte ulazne parametre i pružite jasne poruke o greškama

## [Licenca](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ovaj MCP server omogućuje siguran i učinkovit pristup prodajnim podacima Zava Retaila za AI analizu i uvide.*

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.