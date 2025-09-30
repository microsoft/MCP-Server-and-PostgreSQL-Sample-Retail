<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T08:41:34+00:00",
  "source_file": "README.md",
  "language_code": "lt"
}
-->
# MCP Server ir PostgreSQL Pavyzdys - Mažmeninės Prekybos Pardavimų Analizė

## Mokykitės MCP su Duomenų Bazės Integracija per Praktinius Pavyzdžius

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Prisijunkite prie Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Sekite šiuos žingsnius, kad pradėtumėte naudotis šiais ištekliais:

1. **Fork Repository**: Spustelėkite [čia, kad fork'intumėte](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klonuokite Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Prisijunkite prie Azure AI Foundry Discord**: [Susipažinkite su ekspertais ir kitais kūrėjais](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Daugiakalbė Palaikymas

#### Palaikoma per GitHub Action (Automatizuota ir Visada Atnaujinta)

[Prancūzų](../fr/README.md) | [Ispanų](../es/README.md) | [Vokiečių](../de/README.md) | [Rusų](../ru/README.md) | [Arabų](../ar/README.md) | [Persų (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinų (Supaprastinta)](../zh/README.md) | [Kinų (Tradicinė, Makao)](../mo/README.md) | [Kinų (Tradicinė, Honkongas)](../hk/README.md) | [Kinų (Tradicinė, Taivanas)](../tw/README.md) | [Japonų](../ja/README.md) | [Korėjiečių](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalų](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalų](../ne/README.md) | [Pundžabi (Gurmukhi)](../pa/README.md) | [Portugalų (Portugalija)](../pt/README.md) | [Portugalų (Brazilija)](../br/README.md) | [Italų](../it/README.md) | [Lenkų](../pl/README.md) | [Turkų](../tr/README.md) | [Graikų](../el/README.md) | [Tajų](../th/README.md) | [Švedų](../sv/README.md) | [Danų](../da/README.md) | [Norvegų](../no/README.md) | [Suomių](../fi/README.md) | [Olandų](../nl/README.md) | [Hebrajų](../he/README.md) | [Vietnamiečių](../vi/README.md) | [Indoneziečių](../id/README.md) | [Malajų](../ms/README.md) | [Tagalog (Filipinų)](../tl/README.md) | [Svahilių](../sw/README.md) | [Vengrų](../hu/README.md) | [Čekų](../cs/README.md) | [Slovakų](../sk/README.md) | [Rumunų](../ro/README.md) | [Bulgarų](../bg/README.md) | [Serbų (Kirilica)](../sr/README.md) | [Kroatų](../hr/README.md) | [Slovėnų](../sl/README.md) | [Ukrainiečių](../uk/README.md) | [Birmos (Mianmaras)](../my/README.md)

**Jei norite, kad būtų palaikomos papildomos kalbos, sąrašą rasite [čia](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Įvadas

Šis pavyzdys demonstruoja, kaip sukurti ir diegti išsamų **Model Context Protocol (MCP) serverį**, kuris suteikia AI asistentams saugų ir intelektualų prieigą prie mažmeninės prekybos pardavimų duomenų per PostgreSQL. Projektas pristato įmonės lygio funkcijas, tokias kaip **Row Level Security (RLS)**, **semantinio paieškos galimybes** ir **Azure AI integraciją**, skirtą realaus pasaulio mažmeninės prekybos analitikos scenarijams.

**Pagrindiniai Naudojimo Atvejai:**
- **AI-Powered Pardavimų Analitika**: Leiskite AI asistentams užklausinėti ir analizuoti mažmeninės prekybos pardavimų duomenis naudojant natūralią kalbą
- **Saugus Daugiafunkcinis Priėjimas**: Demonstracija, kaip įgyvendinti Row Level Security, kur skirtingų parduotuvių vadovai gali pasiekti tik savo parduotuvės duomenis
- **Semantinė Produktų Paieška**: AI patobulinta produktų atranka naudojant tekstinius įterpimus
- **Įmonės Integracija**: Iliustracija, kaip integruoti MCP serverius su Azure paslaugomis ir PostgreSQL duomenų bazėmis

**Puikiai tinka:**
- Kūrėjams, norintiems išmokti kurti MCP serverius su duomenų bazės integracija
- Duomenų inžinieriams, įgyvendinantiems saugius daugiafunkcinius analitikos sprendimus
- AI programų kūrėjams, dirbantiems su mažmeninės prekybos ar e-komercijos duomenimis
- Visiems, besidomintiems AI asistentų ir įmonės duomenų bazių derinimu

## Prisijunkite prie Azure AI Foundry Discord Bendruomenės
Pasidalinkite savo MCP patirtimi ir susipažinkite su ekspertais bei produktų grupėmis

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Pardavimų Analizės MCP Serveris

Model Context Protocol (MCP) serveris, kuris suteikia išsamų klientų pardavimų duomenų bazės priėjimą Zava Retail DIY verslui. Šis serveris leidžia AI asistentams užklausinėti ir analizuoti mažmeninės prekybos pardavimų duomenis per saugią, schemos suprantančią sąsają.

## 📚 Pilnas Įgyvendinimo Vadovas

Norėdami gauti išsamų šio sprendimo kūrimo ir panašių MCP serverių įgyvendinimo aprašymą, peržiūrėkite mūsų išsamų **[Pavyzdžio Aprašymą](Sample_Walkthrough.md)**. Šis vadovas apima:

- **Architektūros Analizė**: Komponentų analizė ir dizaino šablonai
- **Žingsnis po Žingsnio Kūrimas**: Nuo projekto nustatymo iki diegimo
- **Kodo Aprašymas**: Išsamus MCP serverio įgyvendinimo paaiškinimas
- **Pažangios Funkcijos**: Row Level Security, semantinė paieška ir stebėjimas
- **Geriausios Praktikos**: Saugumo, našumo ir kūrimo gairės
- **Problemos Sprendimas**: Dažniausiai pasitaikančios problemos ir jų sprendimai

Puikiai tinka kūrėjams, norintiems suprasti įgyvendinimo detales ir kurti panašius sprendimus.

## 🤖 Kas yra MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** yra atviras standartas, leidžiantis AI asistentams saugiai pasiekti išorinius duomenų šaltinius ir įrankius realiuoju laiku. Tai tarsi tiltas, leidžiantis AI modeliams prisijungti prie duomenų bazių, API, failų sistemų ir kitų išteklių, išlaikant saugumą ir kontrolę.

### Pagrindiniai Privalumai:
- **Duomenų Prieiga Realiuoju Laiku**: AI asistentai gali užklausinėti gyvas duomenų bazes ir API
- **Saugus Integravimas**: Kontroliuojama prieiga su autentifikacija ir leidimais  
- **Įrankių Išplėtimas**: Pridėkite AI asistentams pritaikytas funkcijas
- **Standartizuotas Protokolas**: Veikia su skirtingomis AI platformomis ir įrankiais

### Nauji MCP?

Jei esate naujokas Model Context Protocol srityje, rekomenduojame pradėti nuo Microsoft išsamių pradedančiųjų išteklių:

**📖 [MCP Pradedančiųjų Vadovas](https://aka.ms/mcp-for-beginners)**

Šis išteklius suteikia:
- Įvadas į MCP koncepcijas ir architektūrą
- Žingsnis po žingsnio pamokos, kaip sukurti pirmąjį MCP serverį
- Geriausios MCP kūrimo praktikos
- Integracijos pavyzdžiai su populiariomis AI platformomis
- Bendruomenės ištekliai ir palaikymas

Kai suprasite pagrindus, grįžkite čia, kad išnagrinėtumėte šį pažangų mažmeninės prekybos analitikos įgyvendinimą!

## 📚 Išsamus Mokymosi Vadovas: /walkthrough

Šiame repository yra pilnas **12 modulių mokymosi vadovas**, kuris suskaido šį MCP mažmeninės prekybos serverio pavyzdį į lengvai suprantamas, žingsnis po žingsnio pamokas. Vadovas paverčia šį veikiančią pavyzdį į išsamų edukacinį išteklių, puikiai tinkantį kūrėjams, norintiems suprasti, kaip kurti gamybai paruoštus MCP serverius su duomenų bazės integracija.

### Ką Išmoksite

Vadovas apima viską nuo pagrindinių MCP koncepcijų iki pažangaus gamybos diegimo, įskaitant:

- **MCP Pagrindai**: Model Context Protocol supratimas ir jo realaus pasaulio taikymas
- **Duomenų Bazės Integracija**: Saugios PostgreSQL jungties įgyvendinimas su Row Level Security
- **AI Patobulintos Funkcijos**: Semantinės paieškos galimybių pridėjimas su Azure OpenAI įterpimais
- **Saugumo Įgyvendinimas**: Įmonės lygio autentifikacija, autorizacija ir duomenų izoliacija
- **Įrankių Kūrimas**: Sudėtingų MCP įrankių kūrimas duomenų analizei ir verslo intelektui
- **Testavimas ir Derinimas**: Išsamios testavimo strategijos ir derinimo technikos
- **VS Code Integracija**: AI Chat konfigūravimas natūralių kalbų duomenų bazės užklausoms
- **Gamybos Diegimas**: Konteinerizacija, mastelio keitimas ir debesų diegimo strategijos
- **Stebėjimas ir Stebėsena**: Application Insights, logų registravimas ir našumo stebėjimas

### Mokymosi Kelio Apžvalga

Vadovas seka progresyvią mokymosi struktūrą, skirtą kūrėjams su įvairiais įgūdžių lygiais:

| Modulis | Fokusas | Aprašymas | Laiko Sąmata |
|--------|------------|-------------|---------------|
| **[00-Įvadas](walkthrough/00-Introduction/README.md)** | Pagrindai | MCP koncepcijos, Zava Retail atvejo analizė, architektūros apžvalga | 30 minučių |
| **[01-Architektūra](walkthrough/01-Architecture/README.md)** | Dizaino Šablonai | Techninė architektūra, sluoksniuotas dizainas, sistemos komponentai | 45 minutės |
| **[02-Saugumas](walkthrough/02-Security/README.md)** | Įmonės Saugumas | Azure autentifikacija, Row Level Security, daugiafunkcinė izoliacija | 60 minučių |
| **[03-Nustatymas](walkthrough/03-Setup/README.md)** | Aplinka | Docker nustatymas, Azure CLI, projekto konfigūracija, validacija | 45 minutės |
| **[04-Duomenų Bazė](walkthrough/04-Database/README.md)** | Duomenų Sluoksnis | PostgreSQL schema, pgvector, RLS politikos, pavyzdiniai duomenys | 60 minučių |
| **[05-MCP-Serveris](walkthrough/05-MCP-Server/README.md)** | Pagrindinis Įgyvendinimas | FastMCP framework, duomenų bazės integracija, jungties valdymas | 90 minučių |
| **[06-Įrankiai](walkthrough/06-Tools/README.md)** | Įrankių Kūrimas | MCP įrankių kūrimas, užklausų validacija, verslo intelekto funkcijos | 75 minutės |
| **[07-Semantinė Paieška](walkthrough/07-Semantic-Search/README.md)** | AI Integracija | Azure OpenAI įterpimai, vektorinė paieška, hibridinės paieškos strategijos | 60 minučių |
| **[08-Testavimas](walkthrough/08-Testing/README.md)** | Kokybės Užtikrinimas | Vienetų testavimas, integracijos testavimas, našumo testavimas, derinimas | 75 minutės |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Kūrimo Patirtis | VS Code konfigūracija, AI Chat integracija, derinimo darbo eiga | 45 minutės |
| **[10-Diegimas](walkthrough/10-Deployment/README.md)** | Gamybos Paruošimas | Konteinerizacija, Azure Container Apps, CI/CD procesai, mastelio keitimas | 90 minučių |
| **[11-Stebėjimas](walkthrough/11-Monitoring/README.md)** | Stebėsena | Application Insights, struktūrizuotas logų registravimas, našumo metrikos | 60 minučių |
| **[12-Geriausios Praktikos](walkthrough/12-Best-Practices/README.md)** | Gamybos Tobulumas | Saugumo stiprinimas, našumo optimizavimas, įmonės šablonai | 45 minutės |

**Bendras Mokymosi Laikas**: ~12-15 valandų išsamaus praktinio mokymosi

### 🎯 Kaip Naudoti Vadovą

**Pradedantiesiems**:
1. Pradėkite nuo [Modulio 00: Įvadas](walkthrough/00-Introduction/README.md), kad suprastumėte MCP pagrindus
2. Sekite modulius nuosekliai, kad gautumėte pilną mokymosi patirtį
3. Kiekvienas modulis remiasi ankstesnėmis koncepcijomis ir apima praktinius pratimus

**Patyrusiems Kūrėjams**:
1. Peržiūrėkite [Pagrindinę Vadovo Apžvalgą](walkthrough/README.md), kad gautumėte visų modulių santrauką
2. Pereikite prie konkrečių modulių, kurie jus domina (pvz., Modulis 07 AI integracijai)
3. Naudokite atskirus modulius kaip nuorodą savo projektams

**Gamybos Įgyvendinimui**:
1. Susitelkite į Modulius 02 (Saugumas), 10 (Diegimas) ir 11 (Stebėjimas)
2. Peržiūrėkite Modulį 12 (Geriausios Praktikos) dėl įmonės gairių
3. Naudokite kodo pavyzdžius kaip gamybai paruoštus šablonus

### 🚀 Greito Pradžios
### 📋 Mokymosi Prielaidos

**Rekomenduojamas pagrindas**:
- Pagrindinės Python programavimo žinios
- Susipažinimas su REST API ir duomenų bazėmis
- Bendras AI/ML koncepcijų supratimas
- Pagrindinės komandinės eilutės ir Docker žinios

**Nereikalaujama (bet naudinga)**:
- Ankstesnė MCP patirtis (pradėsime nuo nulio)
- Azure debesų platformos patirtis (pateikiame žingsnis po žingsnio instrukcijas)
- Pažangios PostgreSQL žinios (paaiškiname koncepcijas pagal poreikį)

### 💡 Mokymosi patarimai

1. **Praktinis požiūris**: Kiekviename modulyje pateikiami veikiantys kodo pavyzdžiai, kuriuos galite paleisti ir modifikuoti
2. **Progresyvus sudėtingumas**: Koncepcijos palaipsniui pereina nuo paprastų iki sudėtingų
3. **Realių situacijų kontekstas**: Visi pavyzdžiai naudoja realistiškus mažmeninės prekybos verslo scenarijus
4. **Paruošta gamybai**: Kodo pavyzdžiai sukurti taip, kad būtų tinkami naudoti gamyboje
5. **Bendruomenės palaikymas**: Prisijunkite prie mūsų [Discord bendruomenės](https://discord.com/invite/ByRwuEEgH4) pagalbai ir diskusijoms

### 🔗 Susiję ištekliai

- **[MCP pradedantiesiems](https://aka.ms/mcp-for-beginners)**: Esminė medžiaga
- **[Pavyzdinis apžvalga](Sample_Walkthrough.md)**: Aukšto lygio techninė apžvalga
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Debesų platforma, naudojama pavyzdžiuose
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP įgyvendinimo sistema

**Pasiruošę pradėti mokytis?** Pradėkite nuo **[Modulio 00: Įvadas](walkthrough/00-Introduction/README.md)** arba peržiūrėkite **[pilną apžvalgos vadovą](walkthrough/README.md)**.

## Prielaidos

1. Įdiegta Docker Desktop
2. Įdiegtas Git
3. **Azure CLI**: Įdiekite ir autentifikuokite naudodami Azure CLI
4. Prieiga prie OpenAI `text-embedding-3-small` modelio ir, jei pageidaujama, `gpt-4o-mini` modelio.

## Pradžia

Atidarykite terminalo langą ir vykdykite šias komandas:

1. Autentifikuokite naudodami Azure CLI

    ```bash
    az login
    ```

2. Klonuokite saugyklą

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Pereikite į projekto katalogą

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure resursų diegimas

Vykdykite šiuos scenarijus, kad automatizuotumėte MCP serveriui reikalingų Azure resursų diegimą.

Diegimo scenarijai automatiškai įdiegs `text-embedding-3-small` modelį. Diegimo metu turėsite galimybę įtraukti ir `gpt-4o-mini` modelį. Atkreipkite dėmesį, kad `gpt-4o-mini` **nėra būtinas** šiam projektui ir įtraukiamas tik galimiems ateities patobulinimams.

**Pasirinkite scenarijų pagal savo platformą:**

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

## MCP serverio paleidimas

Lengviausias būdas paleisti visą sistemą (PostgreSQL + MCP serverį) yra naudojant Docker Compose:

### Sistemos paleidimas

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

## Naudojimas

Toliau pateikiama instrukcija, kaip naudoti integruotą VS Code MCP serverio palaikymą.

1. Atidarykite projektą VS Code. Iš terminalo vykdykite:

    ```bash
    code .
    ```

2. Paleiskite vieną ar daugiau MCP serverių, naudodami `.vscode/mcp.json` konfigūracijas. Failas turi keturias skirtingas serverio konfigūracijas, kiekviena atitinka skirtingą parduotuvės vadovo rolę:

   - Kiekviena konfigūracija naudoja unikalų RLS (Row Level Security) vartotojo ID
   - Šie vartotojo ID imituoja skirtingų parduotuvių vadovų tapatybes, kurios pasiekia duomenų bazę
   - RLS sistema riboja duomenų prieigą pagal vadovo priskirtą parduotuvę
   - Tai atspindi realias situacijas, kai parduotuvių vadovai prisijungia naudodami skirtingas Entra ID paskyras

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

### Atidarykite VS Code AI pokalbį

1. Atidarykite AI pokalbio režimą VS Code
2. Įveskite **#zava** ir pasirinkite vieną iš paleistų MCP serverių
3. Užduokite klausimus apie pardavimų duomenis - žr. pavyzdinius užklausimus žemiau

### Pavyzdiniai užklausimai

1. Parodykite 20 geriausių produktų pagal pardavimų pajamas
1. Parodykite pardavimus pagal parduotuvę
1. Kokie buvo praėjusio ketvirčio pardavimai pagal kategorijas?
1. Kokius produktus parduodame, kurie yra panašūs į "dažų konteinerius"?

## Funkcijos

- **Prieiga prie kelių lentelių schemų**: Gaukite kelių duomenų bazės lentelių schemas vienu užklausimu
- **Saugus užklausų vykdymas**: Vykdykite PostgreSQL užklausas su Row Level Security (RLS) palaikymu
- **Realių duomenų prieiga**: Pasiekite dabartinius pardavimų, inventoriaus ir klientų duomenis
- **Data/laikas įrankiai**: Gaukite dabartinius UTC laiko žymenis laiko jautriai analizei
- **Lankstus diegimas**: Palaiko HTTP serverio režimą

## Palaikomos lentelės

Serveris suteikia prieigą prie šių mažmeninės prekybos duomenų bazės lentelių:

- `retail.customers` - Klientų informacija ir profiliai
- `retail.stores` - Parduotuvės vietos ir detalės
- `retail.categories` - Produktų kategorijos ir hierarchijos
- `retail.product_types` - Produktų tipų klasifikacijos
- `retail.products` - Produktų katalogas ir specifikacijos
- `retail.orders` - Klientų užsakymai ir transakcijos
- `retail.order_items` - Individualūs užsakymo elementai
- `retail.inventory` - Dabartiniai inventoriaus lygiai ir atsargų duomenys

## Galimi įrankiai

### `get_multiple_table_schemas`

Gaukite kelių lentelių schemas vienu užklausimu.

**Parametrai:**

- `table_names` (list[str]): Galimų lentelių pavadinimų sąrašas iš aukščiau pateiktų lentelių

**Grąžina:** Sujungtas schemų tekstas prašomoms lentelėms

### `execute_sales_query`

Vykdykite PostgreSQL užklausas pardavimų duomenų bazėje su Row Level Security.

**Parametrai:**

- `postgresql_query` (str): Tinkamai suformuota PostgreSQL užklausa

**Grąžina:** Užklausos rezultatai, suformatuoti kaip tekstas (ribojama iki 20 eilučių dėl aiškumo)

**Geriausia praktika:**

- Visada pirmiausia gaukite lentelių schemas
- Naudokite tikslius stulpelių pavadinimus iš schemų
- Sujunkite susijusias lenteles išsamiai analizei
- Agreguokite rezultatus, kai tai tinkama
- Ribokite išvestį dėl aiškumo

### `get_current_utc_date`

Gaukite dabartinę UTC datą ir laiką ISO formatu.

**Grąžina:** Dabartinė UTC data/laikas ISO formatu (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Atlikite semantinę produktų paiešką pagal vartotojo užklausas.

**Grąžina:** Produktų sąrašas, atitinkantis paieškos kriterijus

**Parametrai:**

- `query` (str): Paieškos užklausos tekstas

**Grąžina:** Produktų sąrašas, atitinkantis paieškos kriterijus

## Saugumo funkcijos

### Row Level Security (RLS)

Serveris įgyvendina Row Level Security, kad užtikrintų, jog vartotojai pasiektų tik tuos duomenis, kuriuos jie yra įgalioti matyti:

- **HTTP režimas**: Naudoja `x-rls-user-id` antraštę vartotojo identifikavimui

- **Numatytasis režimas**: Naudoja UUID vietos rezervą, kai vartotojo ID nepateikiamas

#### Parduotuvės specifiniai RLS vartotojo ID

Kiekviena Zava Retail parduotuvės vieta turi unikalų RLS vartotojo ID, kuris nustato, kokius duomenis vartotojas gali pasiekti:

| Parduotuvės vieta | RLS vartotojo ID | Aprašymas |
|-------------------|------------------|-----------|
| **Globali prieiga** | `00000000-0000-0000-0000-000000000000` | Numatytasis režimas - prieiga prie visų parduotuvių |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle parduotuvės duomenys |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue parduotuvės duomenys |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma parduotuvės duomenys |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane parduotuvės duomenys |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett parduotuvės duomenys |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond parduotuvės duomenys |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland parduotuvės duomenys |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online parduotuvės duomenys |

#### RLS įgyvendinimas

Kai vartotojas prisijungia su konkrečios parduotuvės RLS vartotojo ID, jis matys tik:

- Klientus, susijusius su ta parduotuve
- Užsakymus, pateiktus toje parduotuvės vietoje
- Inventoriaus duomenis, susijusius su ta parduotuve
- Parduotuvės specifinius pardavimų ir veiklos rodiklius

Tai užtikrina duomenų izoliaciją tarp skirtingų parduotuvių vietų, išlaikant vieningą duomenų bazės schemą.

## Architektūra

### Programos kontekstas

Serveris naudoja valdomą programos kontekstą su:

- **Duomenų bazės jungčių baseinas**: Efektyvus jungčių valdymas HTTP režimui
- **Gyvavimo ciklo valdymas**: Tinkamas resursų išvalymas uždarymo metu
- **Tipų saugumas**: Stipriai tipizuotas kontekstas su `AppContext` dataklase

### Užklausos kontekstas

- **Antraščių ištraukimas**: Saugus antraščių analizavimas vartotojo identifikavimui
- **RLS integracija**: Automatinis vartotojo ID nustatymas iš užklausos konteksto
- **Klaidų valdymas**: Išsamus klaidų valdymas su vartotojui draugiškomis žinutėmis

## Duomenų bazės integracija

Serveris integruojasi su PostgreSQL duomenų baze per `PostgreSQLSchemaProvider` klasę:

- **Jungčių baseinas**: Naudoja asinchroninius jungčių baseinus mastelio didinimui
- **Schemos metaduomenys**: Pateikia išsamias lentelių schemos detales
- **Užklausų vykdymas**: Saugus užklausų vykdymas su RLS palaikymu
- **Resursų valdymas**: Automatinis duomenų bazės resursų išvalymas

## Klaidų valdymas

Serveris įgyvendina patikimą klaidų valdymą:

- **Lentelių validacija**: Užtikrina, kad būtų pasiekiami tik galiojantys lentelių pavadinimai
- **Užklausų validacija**: Validuoja PostgreSQL užklausas prieš vykdymą
- **Resursų valdymas**: Tinkamas išvalymas net ir klaidų metu
- **Vartotojui draugiškos žinutės**: Aiškios klaidų žinutės problemų sprendimui

## Saugumo aspektai

1. **Row Level Security**: Visos užklausos laikosi RLS politikų pagal vartotojo tapatybę
2. **Parduotuvės duomenų izoliacija**: Kiekvienos parduotuvės RLS vartotojo ID užtikrina prieigą tik prie tos parduotuvės duomenų
3. **Įvesties validacija**: Lentelių pavadinimai ir užklausos validuojami prieš vykdymą
4. **Resursų ribojimai**: Užklausų rezultatai ribojami, kad būtų išvengta per didelio resursų naudojimo
5. **Jungčių saugumas**: Naudojamos saugios duomenų bazės jungčių praktikos
6. **Vartotojo tapatybės patikrinimas**: Visada užtikrinkite, kad būtų naudojamas tinkamas RLS vartotojo ID norimai parduotuvei

### Svarbios saugumo pastabos

- **Niekada nenaudokite gamybos RLS vartotojo ID vystymo aplinkose**
- **Visada patikrinkite, ar RLS vartotojo ID atitinka norimą parduotuvę prieš vykdant užklausas**
- **Numatytasis UUID (`00000000-0000-0000-0000-000000000000`) suteikia ribotą prieigą**
- **Kiekvienas parduotuvės vadovas turėtų turėti prieigą tik prie savo parduotuvės RLS vartotojo ID**

## Vystymas

### Projekto struktūra

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Pagrindiniai komponentai

- **FastMCP Server**: Modernus MCP serverio įgyvendinimas su asinchroniniu palaikymu
- **PostgreSQL Provider**: Duomenų bazės abstrakcijos sluoksnis su RLS palaikymu
- **Konteksto valdymas**: Tipų saugus programos ir užklausos konteksto valdymas
- **Įrankių registracija**: Deklaratyvi įrankių registracija su Pydantic validacija

## Prisidėjimas

Prisidedant prie šio serverio:

1. Užtikrinkite, kad visos duomenų bazės užklausos laikytųsi Row Level Security
2. Pridėkite tinkamą klaidų valdymą naujiems įrankiams
3. Atnaujinkite šį README su naujomis funkcijomis ar pakeitimais
4. Testuokite HTTP serverio režimą
5. Validuokite įvesties parametrus ir pateikite aiškias klaidų žinutes

## [Licencija](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Šis MCP serveris leidžia saugiai ir efektyviai pasiekti Zava Retail pardavimų duomenis AI pagrįstai analizei ir įžvalgoms.*

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.