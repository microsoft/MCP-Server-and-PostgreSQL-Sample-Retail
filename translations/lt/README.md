<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:29:22+00:00",
  "source_file": "README.md",
  "language_code": "lt"
}
-->
# MCP serveris ir PostgreSQL pavyzdys – Mažmeninės prekybos pardavimų analizė

## Mokykitės MCP su duomenų bazių integracija per praktinius pavyzdžius

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Prisijunkite prie Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Pradėkite naudotis šiais ištekliais atlikdami šiuos veiksmus:

1. **Fork'uokite saugyklą**: Spustelėkite [čia, kad fork'uotumėte](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Klonuokite saugyklą**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Prisijunkite prie Azure AI Foundry Discord**: [Susipažinkite su ekspertais ir kitais kūrėjais](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Daugiakalbė parama

#### Palaikoma per GitHub Action (automatizuota ir visada atnaujinama)

[Prancūzų](../fr/README.md) | [Ispanų](../es/README.md) | [Vokiečių](../de/README.md) | [Rusų](../ru/README.md) | [Arabų](../ar/README.md) | [Persų (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Kinų (supaprastinta)](../zh/README.md) | [Kinų (tradicinė, Makao)](../mo/README.md) | [Kinų (tradicinė, Honkongas)](../hk/README.md) | [Kinų (tradicinė, Taivanas)](../tw/README.md) | [Japonų](../ja/README.md) | [Korėjiečių](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalų](../bn/README.md) | [Maratų](../mr/README.md) | [Nepalų](../ne/README.md) | [Pandžabų (Gurmukhi)](../pa/README.md) | [Portugalų (Portugalija)](../pt/README.md) | [Portugalų (Brazilija)](../br/README.md) | [Italų](../it/README.md) | [Lenkų](../pl/README.md) | [Turkų](../tr/README.md) | [Graikų](../el/README.md) | [Tajų](../th/README.md) | [Švedų](../sv/README.md) | [Danų](../da/README.md) | [Norvegų](../no/README.md) | [Suomių](../fi/README.md) | [Olandų](../nl/README.md) | [Hebrajų](../he/README.md) | [Vietnamiečių](../vi/README.md) | [Indoneziečių](../id/README.md) | [Malajų](../ms/README.md) | [Tagalogų (Filipinų)](../tl/README.md) | [Svahilių](../sw/README.md) | [Vengrų](../hu/README.md) | [Čekų](../cs/README.md) | [Slovakų](../sk/README.md) | [Rumunų](../ro/README.md) | [Bulgarų](../bg/README.md) | [Serbų (kirilica)](../sr/README.md) | [Kroatų](../hr/README.md) | [Slovėnų](../sl/README.md) | [Ukrainiečių](../uk/README.md) | [Birmos (Mianmaras)](../my/README.md)

**Jei norite pridėti papildomų vertimų, palaikomų kalbų sąrašą rasite [čia](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Įvadas

Šis pavyzdys demonstruoja, kaip sukurti ir diegti išsamų **Model Context Protocol (MCP) serverį**, kuris suteikia AI asistentams saugią ir išmanią prieigą prie mažmeninės prekybos pardavimų duomenų per PostgreSQL. Projektas pristato įmonės lygio funkcijas, tokias kaip **eilutės lygio saugumas (RLS)**, **semantinė paieška** ir **Azure AI integracija**, skirtas realioms mažmeninės prekybos analizės situacijoms.

**Pagrindiniai naudojimo atvejai:**
- **AI pagrįsta pardavimų analizė**: Leiskite AI asistentams užklausinėti ir analizuoti mažmeninės prekybos pardavimų duomenis natūralia kalba
- **Saugus daugiabučių prieigos valdymas**: Pademonstruokite eilutės lygio saugumo įgyvendinimą, kai skirtingų parduotuvių vadovai gali pasiekti tik savo parduotuvės duomenis
- **Semantinė produktų paieška**: Pateikite AI patobulintą produktų atradimą naudojant teksto įterpimus
- **Įmonių integracija**: Iliustruokite, kaip integruoti MCP serverius su Azure paslaugomis ir PostgreSQL duomenų bazėmis

**Puikiai tinka:**
- Kūrėjams, norintiems išmokti kurti MCP serverius su duomenų bazių integracija
- Duomenų inžinieriams, įgyvendinantiems saugius daugiabučių analizės sprendimus
- AI programų kūrėjams, dirbantiems su mažmeninės prekybos ar e-komercijos duomenimis
- Visiems, besidomintiems AI asistentų ir įmonių duomenų bazių derinimu

## Prisijunkite prie Azure AI Foundry Discord bendruomenės
Pasidalinkite savo MCP patirtimi ir susipažinkite su ekspertais bei produktų grupėmis

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Pardavimų analizės MCP serveris

Model Context Protocol (MCP) serveris, suteikiantis išsamią klientų pardavimų duomenų bazės prieigą Zava Retail DIY verslui. Šis serveris leidžia AI asistentams užklausinėti ir analizuoti mažmeninės prekybos pardavimų duomenis per saugią, schemą suprantančią sąsają.

## 📚 Išsamus įgyvendinimo vadovas

Norėdami sužinoti, kaip ši sprendimas yra sukurtas ir kaip įgyvendinti panašius MCP serverius, peržiūrėkite mūsų išsamų **[Pavyzdžio vadovą](Sample_Walkthrough.md)**. Šis vadovas apima:

- **Architektūros analizė**: Komponentų analizė ir dizaino šablonai
- **Žingsnis po žingsnio kūrimas**: Nuo projekto nustatymo iki diegimo
- **Kodo analizė**: Išsamus MCP serverio įgyvendinimo paaiškinimas
- **Pažangios funkcijos**: Eilutės lygio saugumas, semantinė paieška ir stebėjimas
- **Geriausios praktikos**: Saugumo, našumo ir kūrimo gairės
- **Trikčių šalinimas**: Dažniausios problemos ir jų sprendimai

Puikiai tinka kūrėjams, norintiems suprasti įgyvendinimo detales ir kurti panašius sprendimus.

## 🤖 Kas yra MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** yra atviras standartas, leidžiantis AI asistentams saugiai pasiekti išorinius duomenų šaltinius ir įrankius realiuoju laiku. Tai tarsi tiltas, leidžiantis AI modeliams prisijungti prie duomenų bazių, API, failų sistemų ir kitų išteklių, išlaikant saugumą ir kontrolę.

### Pagrindiniai privalumai:
- **Prieiga prie duomenų realiuoju laiku**: AI asistentai gali užklausinėti gyvas duomenų bazes ir API
- **Saugus integravimas**: Kontroliuojama prieiga su autentifikacija ir leidimais  
- **Įrankių išplėtimas**: Pridėkite AI asistentams pasirinktines galimybes
- **Standartizuotas protokolas**: Veikia su skirtingomis AI platformomis ir įrankiais

### Nauji MCP?

Jei esate naujokas Model Context Protocol, rekomenduojame pradėti nuo Microsoft išsamių pradedančiųjų išteklių:

**📖 [MCP pradedančiųjų vadovas](https://aka.ms/mcp-for-beginners)**

Šis išteklius apima:
- MCP koncepcijų ir architektūros įvadą
- Žingsnis po žingsnio vadovus, kaip sukurti pirmąjį MCP serverį
- Geriausias MCP kūrimo praktikas
- Integracijos pavyzdžius su populiariomis AI platformomis
- Bendruomenės išteklius ir palaikymą

Kai suprasite pagrindus, grįžkite čia, kad išnagrinėtumėte šį pažangų mažmeninės prekybos analizės įgyvendinimą!

## 📚 Išsamus mokymosi vadovas: /walkthrough

Ši saugykla apima pilną **12 modulių mokymosi vadovą**, kuris išskaido šį MCP mažmeninės prekybos serverio pavyzdį į lengvai suprantamas, žingsnis po žingsnio pamokas. Vadovas paverčia šį veikiančią pavyzdį išsamiu edukaciniu ištekliu, puikiai tinkančiu kūrėjams, norintiems suprasti, kaip kurti gamybai paruoštus MCP serverius su duomenų bazių integracija.

### Ką išmoksite

Vadovas apima viską nuo pagrindinių MCP koncepcijų iki pažangaus diegimo gamyboje, įskaitant:

- **MCP pagrindai**: Model Context Protocol supratimas ir jo realūs pritaikymai
- **Duomenų bazių integracija**: Saugios PostgreSQL jungties įgyvendinimas su eilutės lygio saugumu
- **AI patobulintos funkcijos**: Semantinės paieškos galimybių pridėjimas naudojant Azure OpenAI įterpimus
- **Saugumo įgyvendinimas**: Įmonės lygio autentifikacija, autorizacija ir duomenų izoliacija
- **Įrankių kūrimas**: Sudėtingų MCP įrankių kūrimas duomenų analizei ir verslo intelektui
- **Testavimas ir derinimas**: Išsamios testavimo strategijos ir derinimo technikos
- **VS Code integracija**: AI Chat konfigūravimas natūralių kalbų duomenų bazių užklausoms
- **Diegimas gamyboje**: Konteinerizacija, mastelio keitimas ir debesų diegimo strategijos
- **Stebėjimas ir stebėsena**: Application Insights, žurnalų tvarkymas ir našumo stebėjimas

### Mokymosi kelio apžvalga

Vadovas seka progresyvią mokymosi struktūrą, skirtą įvairių įgūdžių lygių kūrėjams:

| Modulis | Dėmesio sritis | Aprašymas | Laiko sąmata |
|--------|------------|-------------|---------------|
| **[00-Įvadas](walkthrough/00-Introduction/README.md)** | Pagrindai | MCP koncepcijos, Zava Retail atvejo analizė, architektūros apžvalga | 30 minučių |
| **[01-Architektūra](walkthrough/01-Architecture/README.md)** | Dizaino šablonai | Techninė architektūra, sluoksniuotas dizainas, sistemos komponentai | 45 minutės |
| **[02-Saugumas](walkthrough/02-Security/README.md)** | Įmonės saugumas | Azure autentifikacija, eilutės lygio saugumas, daugiabučių izoliacija | 60 minučių |
| **[03-Nustatymas](walkthrough/03-Setup/README.md)** | Aplinka | Docker nustatymas, Azure CLI, projekto konfigūracija, validacija | 45 minutės |
| **[04-Duomenų bazė](walkthrough/04-Database/README.md)** | Duomenų sluoksnis | PostgreSQL schema, pgvector, RLS politikos, pavyzdiniai duomenys | 60 minučių |
| **[05-MCP-Serveris](walkthrough/05-MCP-Server/README.md)** | Pagrindinis įgyvendinimas | FastMCP karkasas, duomenų bazių integracija, jungčių valdymas | 90 minučių |
| **[06-Įrankiai](walkthrough/06-Tools/README.md)** | Įrankių kūrimas | MCP įrankių kūrimas, užklausų validacija, verslo intelekto funkcijos | 75 minutės |
| **[07-Semantinė paieška](walkthrough/07-Semantic-Search/README.md)** | AI integracija | Azure OpenAI įterpimai, vektorinė paieška, hibridinės paieškos strategijos | 60 minučių |
| **[08-Testavimas](walkthrough/08-Testing/README.md)** | Kokybės užtikrinimas | Vienetų testavimas, integracijos testavimas, našumo testavimas, derinimas | 75 minutės |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Kūrimo patirtis | VS Code konfigūracija, AI Chat integracija, derinimo darbo eiga | 45 minutės |
| **[10-Diegimas](walkthrough/10-Deployment/README.md)** | Paruošimas gamybai | Konteinerizacija, Azure Container Apps, CI/CD procesai, mastelio keitimas | 90 minučių |
| **[11-Stebėjimas](walkthrough/11-Monitoring/README.md)** | Stebėsena | Application Insights, struktūrizuotas žurnalų tvarkymas, našumo metrika | 60 minučių |
| **[12-Geriausios praktikos](walkthrough/12-Best-Practices/README.md)** | Gamybos tobulumas | Saugumo stiprinimas, našumo optimizavimas, įmonės šablonai | 45 minutės |

**Bendras mokymosi laikas**: ~12-15 valandų išsamaus praktinio mokymosi

### 🎯 Kaip naudotis vadovu

**Pradedantiesiems**:
1. Pradėkite nuo [00 modulio: Įvadas](walkthrough/00-Introduction/README.md), kad suprastumėte MCP pagrindus
2. Sekite modulius iš eilės, kad gautumėte pilną mokymosi patirtį
3. Kiekvienas modulis remiasi ankstesnėmis koncepcijomis ir apima praktines užduotis

**Patyrusiems kūrėjams**:
1. Peržiūrėkite [Pagrindinę vadovo apžvalgą](walkthrough/README.md), kad gautumėte visų modulių santrauką
2. Pereikite prie jus dominančių modulių (pvz., 07 modulis AI integracijai)
3. Naudokite atskirus modulius kaip nuorodų medžiagą savo projektams

**Gamybos įgyvendinimui**:
1. Susitelkite į 02 (Saugumas), 10 (Diegimas) ir 11 (Stebėjimas) modulius
2. Peržiūrėkite 12 modulį (Geriausios praktikos) dėl įmonės gairių
3. Na
### 📋 Mokymosi reikalavimai

**Rekomenduojama patirtis**:
- Pagrindinės Python programavimo žinios
- Susipažinimas su REST API ir duomenų bazėmis
- Bendras AI/ML koncepcijų supratimas
- Pagrindinės komandų eilutės ir Docker žinios

**Nereikalaujama (bet naudinga)**:
- Ankstesnė MCP patirtis (viską pradedame nuo nulio)
- Azure debesų kompiuterijos patirtis (teikiame žingsnis po žingsnio instrukcijas)
- Pažangios PostgreSQL žinios (paaiškiname koncepcijas pagal poreikį)

### 💡 Mokymosi patarimai

1. **Praktinis požiūris**: Kiekviename modulyje pateikiami veikiantys kodo pavyzdžiai, kuriuos galite paleisti ir modifikuoti
2. **Progresyvus sudėtingumas**: Koncepcijos pateikiamos palaipsniui – nuo paprastų iki sudėtingų
3. **Realių situacijų kontekstas**: Visi pavyzdžiai paremti realiomis mažmeninės prekybos verslo situacijomis
4. **Paruošta gamybai**: Kodo pavyzdžiai pritaikyti realiam naudojimui gamyboje
5. **Bendruomenės palaikymas**: Prisijunkite prie mūsų [Discord bendruomenės](https://discord.com/invite/ByRwuEEgH4) pagalbai ir diskusijoms

### 🔗 Susiję ištekliai

- **[MCP pradedantiesiems](https://aka.ms/mcp-for-beginners)**: Esminė pradinė medžiaga
- **[Pavyzdinė apžvalga](Sample_Walkthrough.md)**: Aukšto lygio techninė apžvalga
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Debesų platforma, naudojama pavyzdžiuose
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP įgyvendinimo sistema

**Pasiruošę pradėti mokytis?** Pradėkite nuo **[00 modulio: Įvadas](walkthrough/00-Introduction/README.md)** arba peržiūrėkite **[pilną apžvalgos vadovą](walkthrough/README.md)**.

## Reikalavimai

1. Įdiegtas Docker Desktop
2. Įdiegtas Git
3. **Azure CLI**: Įdiekite ir autentifikuokite naudodami Azure CLI
4. Prieiga prie OpenAI `text-embedding-3-small` modelio ir, jei reikia, `gpt-4o-mini` modelio.

## Pradžia

Atidarykite terminalo langą ir vykdykite šias komandas:

1. Autentifikuokitės naudodami Azure CLI

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

### Azure išteklių diegimas

Vykdykite šiuos scenarijus, kad automatizuotumėte MCP serveriui reikalingų Azure išteklių diegimą.

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

Lengviausias būdas paleisti visą sistemą (PostgreSQL + MCP serveris) yra naudojant Docker Compose:

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

1. Atidarykite projektą VS Code. Terminale vykdykite:

    ```bash
    code .
    ```

2. Paleiskite vieną ar daugiau MCP serverių naudodami `.vscode/mcp.json` konfigūracijas. Šiame faile yra keturios skirtingos serverio konfigūracijos, atitinkančios skirtingų parduotuvių vadovų vaidmenis:

   - Kiekviena konfigūracija naudoja unikalų RLS (Row Level Security) naudotojo ID
   - Šie naudotojo ID imituoja skirtingų parduotuvių vadovų prisijungimus prie duomenų bazės
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

### Atidarykite VS Code AI pokalbių režimą

1. Atidarykite AI pokalbių režimą VS Code
2. Įveskite **#zava** ir pasirinkite vieną iš paleistų MCP serverių
3. Užduokite klausimus apie pardavimų duomenis – žr. pavyzdinius užklausimus žemiau

### Pavyzdiniai užklausimai

1. Parodykite 20 geriausių produktų pagal pardavimų pajamas
1. Parodykite pardavimus pagal parduotuves
1. Kokie buvo praėjusio ketvirčio pardavimai pagal kategorijas?
1. Kokius produktus parduodame, kurie yra panašūs į „dažų konteinerius“?

## Funkcijos

- **Prieiga prie kelių lentelių schemų**: Vienu užklausimu gaukite kelių duomenų bazių lentelių schemas
- **Saugus užklausų vykdymas**: Vykdykite PostgreSQL užklausas su Row Level Security (RLS) palaikymu
- **Realaus laiko duomenys**: Prieiga prie dabartinių pardavimų, atsargų ir klientų duomenų
- **Datos/laiko įrankiai**: Gaukite dabartinius UTC laiko žymenis laiko jautriai analizei
- **Lankstus diegimas**: Palaiko HTTP serverio režimą

## Palaikomos lentelės

Serveris suteikia prieigą prie šių mažmeninės prekybos duomenų bazių lentelių:

- `retail.customers` - Klientų informacija ir profiliai
- `retail.stores` - Parduotuvės vietos ir detalės
- `retail.categories` - Produktų kategorijos ir hierarchijos
- `retail.product_types` - Produktų tipų klasifikacijos
- `retail.products` - Produktų katalogas ir specifikacijos
- `retail.orders` - Klientų užsakymai ir operacijos
- `retail.order_items` - Atskirų užsakymų elementai
- `retail.inventory` - Dabartiniai atsargų lygiai ir duomenys

## Galimi įrankiai

### `get_multiple_table_schemas`

Gaukite kelių lentelių schemas vienu užklausimu.

**Parametrai:**

- `table_names` (list[str]): Galimų lentelių pavadinimų sąrašas iš aukščiau pateiktų lentelių

**Grąžina:** Sujungtas schemas kaip eilutę

### `execute_sales_query`

Vykdykite PostgreSQL užklausas prieš pardavimų duomenų bazę su Row Level Security.

**Parametrai:**

- `postgresql_query` (str): Tinkamai suformuota PostgreSQL užklausa

**Grąžina:** Užklausos rezultatai kaip eilutė (apribota iki 20 eilučių dėl aiškumo)

**Geriausia praktika:**

- Visada pirmiausia gaukite lentelių schemas
- Naudokite tikslius stulpelių pavadinimus iš schemų
- Sujunkite susijusias lenteles išsamiai analizei
- Agreguokite rezultatus, kai tai tinkama
- Apribokite išvestį dėl aiškumo

### `get_current_utc_date`

Gaukite dabartinę UTC datą ir laiką ISO formatu.

**Grąžina:** Dabartinė UTC data/laikas ISO formatu (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Atlikite semantinę produktų paiešką pagal naudotojo užklausas.

**Grąžina:** Produktų sąrašas, atitinkantis paieškos kriterijus

**Parametrai:**

- `query` (str): Paieškos užklausos eilutė

**Grąžina:** Produktų sąrašas, atitinkantis paieškos kriterijus

## Saugumo funkcijos

### Row Level Security (RLS)

Serveris įgyvendina Row Level Security, kad užtikrintų, jog naudotojai matytų tik tuos duomenis, kuriuos jie yra įgalioti peržiūrėti:

- **HTTP režimas**: Naudoja `x-rls-user-id` antraštę naudotojo identifikavimui

- **Numatytasis režimas**: Naudoja vietos rezervavimo UUID, kai naudotojo ID nepateiktas

#### Parduotuvės specifiniai RLS naudotojo ID

Kiekviena Zava Retail parduotuvės vieta turi unikalų RLS naudotojo ID, kuris nustato, kokius duomenis naudotojas gali pasiekti:

| Parduotuvės vieta | RLS naudotojo ID | Aprašymas |
|-------------------|------------------|-----------|
| **Globali prieiga** | `00000000-0000-0000-0000-000000000000` | Numatytasis režimas – prieiga prie visų parduotuvių |
| **Sietlas** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Sietlo parduotuvės duomenys |
| **Belvju** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Belvju parduotuvės duomenys |
| **Takoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Takomos parduotuvės duomenys |
| **Spokanas** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokano parduotuvės duomenys |
| **Everetas** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Evereto parduotuvės duomenys |
| **Redmondas** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmondo parduotuvės duomenys |
| **Kirklandas** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirklando parduotuvės duomenys |
| **Internetinė parduotuvė** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail internetinės parduotuvės duomenys |

#### RLS įgyvendinimas

Kai naudotojas prisijungia su konkrečios parduotuvės RLS naudotojo ID, jis matys tik:

- Klientus, susijusius su ta parduotuve
- Užsakymus, pateiktus toje parduotuvėje
- Atsargų duomenis, susijusius su ta parduotuve
- Parduotuvės specifinius pardavimų ir veiklos rodiklius

Tai užtikrina duomenų izoliaciją tarp skirtingų parduotuvių vietų, išlaikant vieningą duomenų bazės schemą.

## Architektūra

### Programos kontekstas

Serveris naudoja valdomą programos kontekstą su:

- **Duomenų bazės jungčių baseinu**: Efektyvus jungčių valdymas HTTP režimui
- **Gyvavimo ciklo valdymas**: Tinkamas išteklių išvalymas uždarymo metu
- **Tipų saugumas**: Stipriai tipizuotas kontekstas su `AppContext` duomenų klase

### Užklausų kontekstas

- **Antraščių ištraukimas**: Saugus antraščių analizavimas naudotojo identifikavimui
- **RLS integracija**: Automatinis naudotojo ID nustatymas iš užklausos konteksto
- **Klaidų valdymas**: Išsamus klaidų valdymas su naudotojui draugiškomis žinutėmis

## Duomenų bazės integracija

Serveris integruojasi su PostgreSQL duomenų baze per `PostgreSQLSchemaProvider` klasę:

- **Jungčių baseinai**: Naudoja asinchroninius jungčių baseinus mastelio didinimui
- **Schemos metaduomenys**: Teikia išsamias lentelių schemos detales
- **Užklausų vykdymas**: Saugus užklausų vykdymas su RLS palaikymu
- **Išteklių valdymas**: Automatinis duomenų bazės išteklių išvalymas

## Klaidų valdymas

Serveris įgyvendina patikimą klaidų valdymą:

- **Lentelių validacija**: Užtikrina, kad būtų pasiekiamos tik galiojančios lentelės
- **Užklausų validacija**: Validuoja PostgreSQL užklausas prieš vykdymą
- **Išteklių valdymas**: Tinkamas išvalymas net ir klaidų atveju
- **Naudotojui draugiškos žinutės**: Aiškios klaidų žinutės problemų sprendimui

## Saugumo svarstymai

1. **Row Level Security**: Visos užklausos laikosi RLS politikų pagal naudotojo tapatybę
2. **Parduotuvės duomenų izoliacija**: Kiekvienos parduotuvės RLS naudotojo ID užtikrina prieigą tik prie tos parduotuvės duomenų
3. **Įvesties validacija**: Lentelių pavadinimai ir užklausos validuojamos prieš vykdymą
4. **Išteklių ribojimas**: Užklausų rezultatai ribojami, kad būtų išvengta perteklinio išteklių naudojimo
5. **Jungčių saugumas**: Naudojamos saugios duomenų bazės jungčių praktikos
6. **Naudotojo tapatybės patikrinimas**: Visada užtikrinkite, kad būtų naudojamas tinkamas RLS naudotojo ID numatytai parduotuvei

### Svarbios saugumo pastabos

- **Niekada nenaudokite gamybinių RLS naudotojo ID kūrimo aplinkose**
- **Visada patikrinkite, ar RLS naudotojo ID atitinka numatytą parduotuvę prieš vykdant užklausas**
- **Numatytasis UUID (`00000000-0000-0000-0000-000000000000`) suteikia ribotą prieigą**
- **Kiekvienas parduotuvės vadovas turėtų turėti prieigą tik prie savo parduotuvės RLS naudotojo ID**

## Kūrimas

### Projekto struktūra

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Pagrindiniai komponentai

- **FastMCP serveris**: Modernus MCP serverio įgyvendinimas su asinchroniniu palaikymu
- **PostgreSQL tiekėjas**: Duomenų bazės abstrakcijos sluoksnis su RLS palaikymu
- **Konteksto valdymas**: Tipų saugus programos ir užklausų konteksto valdymas
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

*Šis MCP serveris leidžia saugiai ir efektyviai pasiekti Zava Retail pardavimų duomenis AI pagrį

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.