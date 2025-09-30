<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:15:31+00:00",
  "source_file": "README.md",
  "language_code": "ro"
}
-->
# MCP Server și Exemplu PostgreSQL - Analiza Vânzărilor Retail

## Învață MCP cu Integrarea Bazei de Date prin Exemple Practice

[![Contribuitori GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Probleme GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Pull Requests GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Alătură-te Discordului Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Urmează acești pași pentru a începe să folosești aceste resurse:

1. **Fork Repository-ul**: Click [aici pentru fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repository-ul**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Alătură-te Discordului Azure AI Foundry**: [Cunoaște experți și alți dezvoltatori](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Suport Multi-Limbă

#### Suportat prin GitHub Action (Automat & Mereu Actualizat)

[Franceză](../fr/README.md) | [Spaniolă](../es/README.md) | [Germană](../de/README.md) | [Rusă](../ru/README.md) | [Arabă](../ar/README.md) | [Persană (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chineză (Simplificată)](../zh/README.md) | [Chineză (Tradițională, Macau)](../mo/README.md) | [Chineză (Tradițională, Hong Kong)](../hk/README.md) | [Chineză (Tradițională, Taiwan)](../tw/README.md) | [Japoneză](../ja/README.md) | [Coreeană](../ko/README.md) | [Hindi](../hi/README.md) | [Bengaleză](../bn/README.md) | [Marathi](../mr/README.md) | [Nepaleză](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugheză (Portugalia)](../pt/README.md) | [Portugheză (Brazilia)](../br/README.md) | [Italiană](../it/README.md) | [Poloneză](../pl/README.md) | [Turcă](../tr/README.md) | [Greacă](../el/README.md) | [Thailandeză](../th/README.md) | [Suedeză](../sv/README.md) | [Daneză](../da/README.md) | [Norvegiană](../no/README.md) | [Finlandeză](../fi/README.md) | [Olandeză](../nl/README.md) | [Ebraică](../he/README.md) | [Vietnameză](../vi/README.md) | [Indoneziană](../id/README.md) | [Malayeză](../ms/README.md) | [Tagalog (Filipineză)](../tl/README.md) | [Swahili](../sw/README.md) | [Maghiară](../hu/README.md) | [Cehă](../cs/README.md) | [Slovacă](../sk/README.md) | [Română](./README.md) | [Bulgară](../bg/README.md) | [Sârbă (Chirilică)](../sr/README.md) | [Croată](../hr/README.md) | [Slovenă](../sl/README.md) | [Ucraineană](../uk/README.md) | [Birmaneză (Myanmar)](../my/README.md)

**Dacă dorești să fie suportate alte limbi, lista completă este disponibilă [aici](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introducere

Acest exemplu demonstrează cum să construiești și să implementezi un **server Model Context Protocol (MCP)** care oferă asistenților AI acces inteligent și securizat la datele de vânzări retail prin PostgreSQL. Proiectul evidențiază caracteristici de nivel enterprise, inclusiv **Row Level Security (RLS)**, **căutare semantică**, și **integrare Azure AI** pentru scenarii reale de analiză retail.

**Cazuri de utilizare cheie:**
- **Analiză de vânzări bazată pe AI**: Permite asistenților AI să interogheze și să analizeze datele de vânzări retail prin limbaj natural
- **Acces securizat multi-tenant**: Demonstrează implementarea Row Level Security unde managerii de magazin pot accesa doar datele magazinului lor
- **Căutare semantică de produse**: Prezintă descoperirea produselor îmbunătățită cu AI folosind text embeddings
- **Integrare enterprise**: Ilustrează cum să integrezi serverele MCP cu serviciile Azure și bazele de date PostgreSQL

**Perfect pentru:**
- Dezvoltatori care învață să construiască servere MCP cu integrare de baze de date
- Ingineri de date care implementează soluții de analiză securizată multi-tenant
- Dezvoltatori de aplicații AI care lucrează cu date retail sau e-commerce
- Oricine este interesat de combinarea asistenților AI cu baze de date enterprise

## Alătură-te Comunității Discord Azure AI Foundry
Împărtășește experiențele tale despre MCP și cunoaște experții și grupurile de produse

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Server MCP pentru Analiza Vânzărilor

Un server Model Context Protocol (MCP) care oferă acces complet la baza de date a vânzărilor pentru afacerea Zava Retail DIY. Acest server permite asistenților AI să interogheze și să analizeze datele de vânzări retail printr-o interfață securizată și conștientă de schemă.

## 📚 Ghid Complet de Implementare

Pentru o analiză detaliată a modului în care această soluție este construită și cum să implementezi servere MCP similare, vezi **[Parcurgerea Exemplului](Sample_Walkthrough.md)**. Acest ghid oferă:

- **Analiză Arhitecturală**: Analiza componentelor și modele de design
- **Construcție Pas cu Pas**: De la configurarea proiectului la implementare
- **Explicație Cod**: Detalii despre implementarea serverului MCP
- **Funcționalități Avansate**: Row Level Security, căutare semantică și monitorizare
- **Cele Mai Bune Practici**: Securitate, performanță și ghiduri de dezvoltare
- **Depanare**: Probleme comune și soluții

Perfect pentru dezvoltatori care vor să înțeleagă detaliile implementării și să construiască soluții similare.

## 🤖 Ce este MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** este un standard deschis care permite asistenților AI să acceseze în siguranță surse externe de date și instrumente în timp real. Gândește-te la el ca la un pod care permite modelelor AI să se conecteze cu baze de date, API-uri, sisteme de fișiere și alte resurse, menținând în același timp securitatea și controlul.

### Beneficii Cheie:
- **Acces la Date în Timp Real**: Asistenții AI pot interoga baze de date și API-uri live
- **Integrare Securizată**: Acces controlat cu autentificare și permisiuni  
- **Extensibilitate Instrumente**: Adaugă capabilități personalizate asistenților AI
- **Protocol Standardizat**: Funcționează pe diferite platforme și instrumente AI

### Nou în MCP?

Dacă ești nou în Model Context Protocol, îți recomandăm să începi cu resursele introductive ale Microsoft:

**📖 [Ghid MCP pentru Începători](https://aka.ms/mcp-for-beginners)**

Această resursă oferă:
- Introducere în conceptele și arhitectura MCP
- Tutoriale pas cu pas pentru construirea primului tău server MCP
- Cele mai bune practici pentru dezvoltarea MCP
- Exemple de integrare cu platforme AI populare
- Resurse comunitare și suport

După ce înțelegi bazele, revino aici pentru a explora această implementare avansată de analiză retail!

## 📚 Ghid Complet de Învățare: /walkthrough

Acest repository include o **parcurgere completă în 12 module** care deconstruiește acest exemplu de server MCP retail în lecții pas cu pas. Parcurgerea transformă acest exemplu funcțional într-o resursă educațională perfectă pentru dezvoltatori care vor să înțeleagă cum să construiască servere MCP gata de producție cu integrare de baze de date.

### Ce Vei Învăța

Parcurgerea acoperă totul, de la concepte de bază MCP la implementare avansată în producție, inclusiv:

- **Fundamente MCP**: Înțelegerea Model Context Protocol și aplicațiile sale reale
- **Integrare Bază de Date**: Implementarea conectivității securizate PostgreSQL cu Row Level Security
- **Funcționalități Îmbunătățite AI**: Adăugarea capabilităților de căutare semantică cu embeddings Azure OpenAI
- **Implementare Securitate**: Autentificare, autorizare și izolare de date de nivel enterprise
- **Dezvoltare Instrumente**: Construirea de instrumente MCP sofisticate pentru analiză de date și business intelligence
- **Testare & Depanare**: Strategii de testare cuprinzătoare și tehnici de depanare
- **Integrare VS Code**: Configurarea AI Chat pentru interogări de baze de date în limbaj natural
- **Implementare în Producție**: Containerizare, scalare și strategii de implementare în cloud
- **Monitorizare & Observabilitate**: Application Insights, logare și monitorizare performanță

### Prezentare Generală a Căii de Învățare

Parcurgerea urmează o structură progresivă de învățare, concepută pentru dezvoltatori de toate nivelurile:

| Modul | Domeniu de Focalizare | Descriere | Estimare Timp |
|-------|-----------------------|-----------|---------------|
| **[00-Introducere](walkthrough/00-Introduction/README.md)** | Fundament | Concepte MCP, studiu de caz Zava Retail, prezentare arhitectură | 30 minute |
| **[01-Arhitectură](walkthrough/01-Architecture/README.md)** | Modele de Design | Arhitectură tehnică, design stratificat, componente sistem | 45 minute |
| **[02-Securitate](walkthrough/02-Security/README.md)** | Securitate Enterprise | Autentificare Azure, Row Level Security, izolare multi-tenant | 60 minute |
| **[03-Configurare](walkthrough/03-Setup/README.md)** | Mediu | Configurare Docker, Azure CLI, configurare proiect, validare | 45 minute |
| **[04-Bază de Date](walkthrough/04-Database/README.md)** | Strat de Date | Schema PostgreSQL, pgvector, politici RLS, date de exemplu | 60 minute |
| **[05-Server MCP](walkthrough/05-MCP-Server/README.md)** | Implementare de Bază | Framework FastMCP, integrare bază de date, gestionare conexiuni | 90 minute |
| **[06-Instrumente](walkthrough/06-Tools/README.md)** | Dezvoltare Instrumente | Crearea de instrumente MCP, validare interogări, funcționalități business intelligence | 75 minute |
| **[07-Căutare Semantică](walkthrough/07-Semantic-Search/README.md)** | Integrare AI | Embeddings Azure OpenAI, căutare vectorială, strategii de căutare hibridă | 60 minute |
| **[08-Testare](walkthrough/08-Testing/README.md)** | Asigurarea Calității | Testare unitară, testare de integrare, testare performanță, depanare | 75 minute |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiență de Dezvoltare | Configurare VS Code, integrare AI Chat, fluxuri de lucru de depanare | 45 minute |
| **[10-Implementare](walkthrough/10-Deployment/README.md)** | Gata de Producție | Containerizare, Azure Container Apps, pipeline-uri CI/CD, scalare | 90 minute |
| **[11-Monitorizare](walkthrough/11-Monitoring/README.md)** | Observabilitate | Application Insights, logare structurată, metrici de performanță | 60 minute |
| **[12-Cele Mai Bune Practici](walkthrough/12-Best-Practices/README.md)** | Excelență în Producție | Întărirea securității, optimizarea performanței, modele enterprise | 45 minute |

**Timp Total de Învățare**: ~12-15 ore de învățare practică cuprinzătoare

### 🎯 Cum să Folosești Parcurgerea

**Pentru Începători**:
1. Începe cu [Modulul 00: Introducere](walkthrough/00-Introduction/README.md) pentru a înțelege fundamentele MCP
2. Urmează modulele în ordine pentru o experiență completă de învățare
3. Fiecare modul construiește pe conceptele anterioare și include exerciții practice

**Pentru Dezvoltatori Experimentați**:
1. Revizuiește [Prezentarea Generală a Parcurgerii](walkthrough/README.md) pentru un rezumat al modulelor
2. Sari la modulele care te interesează (ex. Modulul 07 pentru integrarea AI)
3. Folosește modulele individuale ca material de referință pentru propriile proiecte

**Pentru Implementare în Producție**:
1. Concentrează-te pe Modulele 02 (Securitate), 10 (Implementare) și 11 (Monitorizare)
2. Revizuiește Modulul 12 (Cele Mai Bune Practici) pentru ghiduri enterprise
3. Folosește exemplele de cod ca șabloane gata de producție

### 🚀 Opțiuni de Start Rapid

**Opțiunea 1: Calea Completă de Învățare** (Recomandată pentru începători)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opțiunea 2: Implementare Practică** (Începe direct construcția)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opțiunea 3: Focalizare pe Producție** (Implementare enterprise)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Cerințe preliminare pentru învățare

**Fundamente recomandate**:
- Experiență de bază în programarea Python
- Familiaritate cu REST APIs și baze de date
- Înțelegere generală a conceptelor AI/ML
- Cunoștințe de bază despre linia de comandă și Docker

**Nu sunt necesare (dar utile)**:
- Experiență anterioară cu MCP (acoperim acest aspect de la zero)
- Experiență cu cloud-ul Azure (oferim ghidare pas cu pas)
- Cunoștințe avansate de PostgreSQL (explicăm conceptele pe măsură ce sunt necesare)

### 💡 Sfaturi pentru învățare

1. **Abordare practică**: Fiecare modul include exemple de cod funcțional pe care le poți rula și modifica
2. **Complexitate progresivă**: Conceptele se construiesc treptat, de la simplu la avansat
3. **Context real**: Toate exemplele folosesc scenarii realiste din domeniul retail
4. **Pregătit pentru producție**: Exemplele de cod sunt concepute pentru utilizare reală în producție
5. **Sprijin comunitar**: Alătură-te comunității noastre pe [Discord](https://discord.com/invite/ByRwuEEgH4) pentru ajutor și discuții

### 🔗 Resurse conexe

- **[MCP pentru începători](https://aka.ms/mcp-for-beginners)**: Lectură esențială de fundamente
- **[Exemplu de prezentare](Sample_Walkthrough.md)**: Prezentare tehnică la nivel înalt
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Platforma cloud utilizată în exemple
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework Python pentru implementarea MCP

**Ești gata să începi?** Începe cu **[Modulul 00: Introducere](walkthrough/00-Introduction/README.md)** sau explorează **[prezentarea completă](walkthrough/README.md)**.

## Cerințe preliminare

1. Docker Desktop instalat
2. Git instalat
3. **Azure CLI**: Instalează și autentifică-te cu Azure CLI
4. Acces la modelul OpenAI `text-embedding-3-small` și, opțional, modelul `gpt-4o-mini`.

## Începe

Deschide o fereastră de terminal și rulează următoarele comenzi:

1. Autentifică-te cu Azure CLI

    ```bash
    az login
    ```

2. Clonează repository-ul

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navighează la directorul proiectului

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Implementarea resurselor Azure

Rulează scripturile de mai jos pentru a automatiza implementarea resurselor Azure necesare pentru serverul MCP.

Scripturile de implementare vor instala automat modelul `text-embedding-3-small`. În timpul implementării, vei avea opțiunea de a include și modelul `gpt-4o-mini`. Reține că `gpt-4o-mini` **nu este necesar** pentru acest proiect și este inclus doar pentru posibile îmbunătățiri viitoare.

**Alege scriptul pentru platforma ta:**

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

## Rularea serverului MCP

Cea mai simplă metodă de a rula întregul stack (PostgreSQL + server MCP) este utilizând Docker Compose:

### Pornirea stack-ului

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

## Utilizare

Următoarele presupun că vei folosi suportul integrat pentru server MCP din VS Code.

1. Deschide proiectul în VS Code. Din terminal, rulează:

    ```bash
    code .
    ```

2. Pornește unul sau mai multe servere MCP utilizând configurațiile din `.vscode/mcp.json`. Fișierul conține patru configurații diferite de server, fiecare reprezentând un rol diferit de manager de magazin:

   - Fiecare configurație folosește un ID unic de utilizator RLS (Row Level Security)
   - Aceste ID-uri de utilizator simulează identități diferite ale managerilor de magazin care accesează baza de date
   - Sistemul RLS restricționează accesul la date pe baza magazinului atribuit managerului
   - Acest lucru imită scenarii reale în care managerii de magazin se autentifică cu conturi diferite Entra ID

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

### Deschide AI Chat în VS Code

1. Activează modul AI Chat în VS Code
2. Tastează **#zava** și selectează unul dintre serverele MCP pe care le-ai pornit
3. Pune întrebări despre datele de vânzări - Vezi exemplele de interogări de mai jos

### Exemple de interogări

1. Afișează top 20 produse după venituri din vânzări
1. Afișează vânzările pe magazin
1. Care au fost vânzările pe categorii în ultimul trimestru?
1. Ce produse vindem care sunt similare cu "containere pentru vopsea"?

## Funcționalități

- **Acces la schema multi-tabel**: Recuperează schemele pentru mai multe tabele din baza de date într-o singură cerere
- **Executare sigură a interogărilor**: Rulează interogări PostgreSQL cu suport pentru Row Level Security (RLS)
- **Date în timp real**: Accesează date actuale despre vânzări, inventar și clienți
- **Utilități de dată/oră**: Obține timestamp-uri UTC actuale pentru analize sensibile la timp
- **Implementare flexibilă**: Suportă modul server HTTP

## Tabele suportate

Serverul oferă acces la următoarele tabele din baza de date retail:

- `retail.customers` - Informații și profiluri ale clienților
- `retail.stores` - Locații și detalii ale magazinelor
- `retail.categories` - Categorii de produse și ierarhii
- `retail.product_types` - Clasificări ale tipurilor de produse
- `retail.products` - Catalog de produse și specificații
- `retail.orders` - Comenzi și tranzacții ale clienților
- `retail.order_items` - Articole individuale din comenzi
- `retail.inventory` - Niveluri actuale de inventar și date despre stocuri

## Instrumente disponibile

### `get_multiple_table_schemas`

Recuperează schemele bazei de date pentru mai multe tabele într-o singură cerere.

**Parametri:**

- `table_names` (list[str]): Listă de nume valide de tabele din cele menționate mai sus

**Returnează:** Șiruri de scheme concatenate pentru tabelele solicitate

### `execute_sales_query`

Rulează interogări PostgreSQL pe baza de date de vânzări cu suport pentru Row Level Security.

**Parametri:**

- `postgresql_query` (str): O interogare PostgreSQL bine formată

**Returnează:** Rezultatele interogării formatate ca șir (limitate la 20 de rânduri pentru lizibilitate)

**Cele mai bune practici:**

- Recuperează întotdeauna mai întâi schemele tabelelor
- Folosește nume exacte de coloane din scheme
- Alătură tabelele relevante pentru analize cuprinzătoare
- Agregă rezultatele când este cazul
- Limitează output-ul pentru lizibilitate

### `get_current_utc_date`

Obține data și ora UTC curentă în format ISO.

**Returnează:** Data/ora UTC curentă în format ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Efectuează o căutare semantică pentru produse pe baza interogărilor utilizatorului.

**Returnează:** O listă de produse care corespund criteriilor de căutare

**Parametri:**

- `query` (str): Șirul de interogare pentru căutare

**Returnează:** O listă de produse care corespund criteriilor de căutare

## Funcționalități de securitate

### Row Level Security (RLS)

Serverul implementează Row Level Security pentru a se asigura că utilizatorii accesează doar datele pe care sunt autorizați să le vadă:

- **Mod HTTP**: Folosește header-ul `x-rls-user-id` pentru identificarea utilizatorului care face cererea

- **Fallback implicit**: Folosește UUID placeholder când nu este furnizat un ID de utilizator

#### ID-uri de utilizator RLS specifice magazinelor

Fiecare locație Zava Retail are un ID unic de utilizator RLS care determină ce date poate accesa utilizatorul:

| Locație magazin | ID utilizator RLS | Descriere |
|-----------------|-------------------|-----------|
| **Acces global** | `00000000-0000-0000-0000-000000000000` | Fallback implicit - acces la toate magazinele |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Datele magazinului Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Datele magazinului Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Datele magazinului Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Datele magazinului Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Datele magazinului Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Datele magazinului Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Datele magazinului Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Datele magazinului Zava Retail Online |

#### Implementarea RLS

Când un utilizator se conectează cu ID-ul de utilizator RLS al unui magazin specific, acesta va vedea doar:

- Clienții asociați acelui magazin
- Comenzile plasate la locația acelui magazin
- Datele de inventar pentru acel magazin specific
- Metrici de vânzări și performanță specifice magazinului

Acest lucru asigură izolarea datelor între locațiile diferite ale magazinelor, menținând în același timp o schemă unificată a bazei de date.

## Arhitectură

### Contextul aplicației

Serverul folosește un context de aplicație gestionat cu:

- **Pool de conexiuni la baza de date**: Gestionare eficientă a conexiunilor pentru modul HTTP
- **Managementul ciclului de viață**: Curățare adecvată a resurselor la închidere
- **Siguranța tipurilor**: Context puternic tipizat cu dataclass-ul `AppContext`

### Contextul cererii

- **Extracția header-ului**: Parsare sigură a header-ului pentru identificarea utilizatorului
- **Integrarea RLS**: Rezoluție automată a ID-ului utilizatorului din contextul cererii
- **Gestionarea erorilor**: Gestionare cuprinzătoare a erorilor cu mesaje prietenoase pentru utilizator

## Integrarea bazei de date

Serverul se integrează cu o bază de date PostgreSQL prin clasa `PostgreSQLSchemaProvider`:

- **Pooling de conexiuni**: Folosește pool-uri de conexiuni asincrone pentru scalabilitate
- **Metadate ale schemelor**: Oferă informații detaliate despre schema tabelelor
- **Executarea interogărilor**: Executare sigură a interogărilor cu suport RLS
- **Managementul resurselor**: Curățare automată a resurselor bazei de date

## Gestionarea erorilor

Serverul implementează o gestionare robustă a erorilor:

- **Validarea tabelelor**: Se asigură că sunt accesate doar nume valide de tabele
- **Validarea interogărilor**: Validează interogările PostgreSQL înainte de execuție
- **Managementul resurselor**: Curățare adecvată chiar și în timpul erorilor
- **Mesaje prietenoase pentru utilizator**: Mesaje clare de eroare pentru depanare

## Considerații de securitate

1. **Row Level Security**: Toate interogările respectă politicile RLS bazate pe identitatea utilizatorului
2. **Izolarea datelor magazinelor**: ID-ul de utilizator RLS al fiecărui magazin asigură acces doar la datele acelui magazin
3. **Validarea input-ului**: Numele tabelelor și interogările sunt validate înainte de execuție
4. **Limitarea resurselor**: Rezultatele interogărilor sunt limitate pentru a preveni utilizarea excesivă a resurselor
5. **Securitatea conexiunilor**: Folosește practici sigure de conectare la baza de date
6. **Verificarea identității utilizatorului**: Asigură întotdeauna utilizarea corectă a ID-ului de utilizator RLS pentru locația magazinului dorit

### Note importante de securitate

- **Nu folosi niciodată ID-uri de utilizator RLS de producție în medii de dezvoltare**
- **Verifică întotdeauna că ID-ul de utilizator RLS corespunde magazinului dorit înainte de a rula interogări**
- **UUID-ul implicit (`00000000-0000-0000-0000-000000000000`) oferă acces limitat**
- **Fiecare manager de magazin ar trebui să aibă acces doar la ID-ul de utilizator RLS al magazinului său**

## Dezvoltare

### Structura proiectului

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Componente cheie

- **Server FastMCP**: Implementare modernă a serverului MCP cu suport asincron
- **Provider PostgreSQL**: Strat de abstractizare a bazei de date cu suport RLS
- **Managementul contextului**: Gestionare tipizată a contextului aplicației și cererii
- **Înregistrarea instrumentelor**: Înregistrare declarativă a instrumentelor cu validare Pydantic

## Contribuții

Când contribui la acest server:

1. Asigură-te că toate interogările bazei de date respectă Row Level Security
2. Adaugă gestionare adecvată a erorilor pentru instrumentele noi
3. Actualizează acest README cu orice funcționalități sau modificări noi
4. Testează modul server HTTP
5. Validează parametrii de input și oferă mesaje clare de eroare

## [Licență](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Acest server MCP permite accesul sigur și eficient la datele de vânzări Zava Retail pentru analize și perspective bazate pe AI.*

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.