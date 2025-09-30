<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:07:45+00:00",
  "source_file": "README.md",
  "language_code": "sw"
}
-->
# MCP Server na Mfano wa PostgreSQL - Uchambuzi wa Mauzo ya Rejareja

## Jifunze MCP na Muunganisho wa Hifadhidata Kupitia Mifano ya Vitendo

[![Wachangiaji wa GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Masuala ya GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Maombi ya Kuvuta GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Jiunge na Discord ya Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Fuata hatua hizi kuanza kutumia rasilimali hizi:

1. **Fork Hifadhi**: Bonyeza [hapa kufork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Hifadhi**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Jiunge na Discord ya Azure AI Foundry**: [Kutana na wataalamu na waendelezaji wenzako](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Msaada wa Lugha Nyingi

#### Inasaidiwa kupitia GitHub Action (Imefanywa Kiotomatiki & Daima Inasasishwa)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](./README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Ikiwa ungependa lugha za ziada zisaidiwe, orodha ya lugha zinazopatikana inapatikana [hapa](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Utangulizi

Mfano huu unaonyesha jinsi ya kujenga na kupeleka **Model Context Protocol (MCP) server** kamili inayowapa wasaidizi wa AI ufikiaji salama na wenye akili wa data ya mauzo ya rejareja kupitia PostgreSQL. Mradi huu unaonyesha vipengele vya daraja la biashara ikiwa ni pamoja na **Usalama wa Kiwango cha Safu (RLS)**, **uwezo wa utafutaji wa semantiki**, na **muunganisho wa Azure AI** kwa hali halisi za uchambuzi wa rejareja.

**Matumizi Muhimu:**
- **Uchambuzi wa Mauzo Unaotumia AI**: Ruhusu wasaidizi wa AI kuuliza na kuchambua data ya mauzo ya rejareja kwa kutumia lugha ya kawaida
- **Ufikiaji Salama wa Wateja Wengi**: Onyesha utekelezaji wa Usalama wa Kiwango cha Safu ambapo mameneja wa maduka tofauti wanaweza kufikia data ya maduka yao pekee
- **Utafutaji wa Bidhaa wa Semantiki**: Onyesha ugunduzi wa bidhaa unaotumia AI kwa kutumia embeddings za maandishi
- **Muunganisho wa Biashara**: Eleza jinsi ya kuunganisha MCP server na huduma za Azure na hifadhidata za PostgreSQL

**Inafaa kwa:**
- Waendelezaji wanaojifunza kujenga MCP server na muunganisho wa hifadhidata
- Wahandisi wa data wanaotekeleza suluhisho salama za uchambuzi wa wateja wengi
- Waendelezaji wa programu za AI wanaofanya kazi na data ya rejareja au e-commerce
- Yeyote anayevutiwa na kuunganisha wasaidizi wa AI na hifadhidata za biashara

## Jiunge na Jamii ya Discord ya Azure AI Foundry
Shiriki uzoefu wako wa MCP na kutana na wataalamu na vikundi vya bidhaa

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server ya Uchambuzi wa Mauzo

Model Context Protocol (MCP) server inayotoa ufikiaji kamili wa hifadhidata ya mauzo ya wateja kwa Biashara ya Zava Retail DIY. Server hii inawawezesha wasaidizi wa AI kuuliza na kuchambua data ya mauzo ya rejareja kupitia interface salama na inayojua schema.

## 📚 Mwongozo Kamili wa Utekelezaji

Kwa maelezo ya kina ya jinsi suluhisho hili linajengwa na jinsi ya kutekeleza MCP server zinazofanana, angalia **[Mwongozo wa Mfano](Sample_Walkthrough.md)**. Mwongozo huu unatoa:

- **Uchambuzi wa Muundo wa Kifaa**: Uchambuzi wa vipengele na mifumo ya muundo
- **Hatua kwa Hatua ya Ujenzi**: Kuanzia usanidi wa mradi hadi upelekaji
- **Ufafanuzi wa Msimbo**: Maelezo ya kina ya utekelezaji wa MCP server
- **Vipengele vya Juu**: Usalama wa Kiwango cha Safu, utafutaji wa semantiki, na ufuatiliaji
- **Mbinu Bora**: Miongozo ya usalama, utendaji, na maendeleo
- **Utatuzi wa Matatizo**: Masuala ya kawaida na suluhisho

Inafaa kwa waendelezaji wanaotaka kuelewa maelezo ya utekelezaji na kujenga suluhisho zinazofanana.

## 🤖 MCP (Model Context Protocol) ni Nini?

**Model Context Protocol (MCP)** ni kiwango cha wazi kinachowezesha wasaidizi wa AI kufikia vyanzo vya data vya nje na zana kwa usalama na kwa wakati halisi. Fikiria kama daraja linaloruhusu mifano ya AI kuunganishwa na hifadhidata, API, mifumo ya faili, na rasilimali nyingine huku ikidumisha usalama na udhibiti.

### Faida Muhimu:
- **Ufikiaji wa Data kwa Wakati Halisi**: Wasaidizi wa AI wanaweza kuuliza hifadhidata na API za moja kwa moja
- **Muunganisho Salama**: Ufikiaji unaodhibitiwa na uthibitishaji na ruhusa  
- **Uongezaji wa Zana**: Ongeza uwezo maalum kwa wasaidizi wa AI
- **Kiwango Kilichowekwa**: Hufanya kazi katika majukwaa na zana tofauti za AI

### Mpya kwa MCP?

Ikiwa wewe ni mpya kwa Model Context Protocol, tunapendekeza kuanza na rasilimali za kina za Microsoft kwa wanaoanza:

**📖 [Mwongozo wa MCP kwa Wanaoanza](https://aka.ms/mcp-for-beginners)**

Rasilimali hii inatoa:
- Utangulizi wa dhana za MCP na muundo wake
- Mafunzo ya hatua kwa hatua ya kujenga MCP server yako ya kwanza
- Mbinu bora za maendeleo ya MCP
- Mifano ya muunganisho na majukwaa maarufu ya AI
- Rasilimali za jamii na msaada

Mara tu unapopata uelewa wa msingi, rudi hapa kuchunguza utekelezaji huu wa hali ya juu wa uchambuzi wa rejareja!

## 📚 Mwongozo Kamili wa Kujifunza: /walkthrough

Hifadhi hii inajumuisha **mwongozo wa mafunzo wa moduli 12** unaovunja mfano huu wa MCP server ya rejareja katika masomo yanayoweza kueleweka, hatua kwa hatua. Mwongozo huu hubadilisha mfano huu wa kazi kuwa rasilimali ya kina ya elimu inayofaa kwa waendelezaji wanaotaka kuelewa jinsi ya kujenga MCP server zinazofaa kwa uzalishaji na muunganisho wa hifadhidata.

### Kile Utakachojifunza

Mwongozo unashughulikia kila kitu kuanzia dhana za msingi za MCP hadi upelekaji wa uzalishaji wa hali ya juu, ikiwa ni pamoja na:

- **Misingi ya MCP**: Kuelewa Model Context Protocol na matumizi yake halisi
- **Muunganisho wa Hifadhidata**: Kutekeleza muunganisho salama wa PostgreSQL na Usalama wa Kiwango cha Safu
- **Vipengele Vinavyotumia AI**: Kuongeza uwezo wa utafutaji wa semantiki kwa embeddings za Azure OpenAI
- **Utekelezaji wa Usalama**: Uthibitishaji wa daraja la biashara, ruhusa, na kutenganisha data
- **Maendeleo ya Zana**: Kujenga zana za MCP za uchambuzi wa data na akili ya biashara
- **Upimaji na Utatuzi wa Hitilafu**: Mikakati ya upimaji wa kina na mbinu za utatuzi wa hitilafu
- **Muunganisho wa VS Code**: Kuseti AI Chat kwa maswali ya hifadhidata kwa lugha ya kawaida
- **Upelekaji wa Uzalishaji**: Uwekaji wa kontena, upanuzi, na mikakati ya upelekaji wa wingu
- **Ufuatiliaji na Uangalizi**: Ufuatiliaji wa programu, kumbukumbu, na ufuatiliaji wa utendaji

### Muhtasari wa Njia ya Kujifunza

Mwongozo unafuata muundo wa kujifunza unaoendelea ulioundwa kwa waendelezaji wa viwango vyote vya ujuzi:

| Moduli | Eneo la Kuzingatia | Maelezo | Makadirio ya Muda |
|--------|--------------------|---------|-------------------|
| **[00-Utangulizi](walkthrough/00-Introduction/README.md)** | Msingi | Dhana za MCP, utafiti wa kesi ya Zava Retail, muhtasari wa muundo | Dakika 30 |
| **[01-Muundo](walkthrough/01-Architecture/README.md)** | Mifumo ya Muundo | Muundo wa kiufundi, muundo wa tabaka, vipengele vya mfumo | Dakika 45 |
| **[02-Usalama](walkthrough/02-Security/README.md)** | Usalama wa Biashara | Uthibitishaji wa Azure, Usalama wa Kiwango cha Safu, kutenganisha wateja wengi | Dakika 60 |
| **[03-Usanidi](walkthrough/03-Setup/README.md)** | Mazingira | Usanidi wa Docker, Azure CLI, usanidi wa mradi, uthibitishaji | Dakika 45 |
| **[04-Hifadhidata](walkthrough/04-Database/README.md)** | Tabaka la Data | Schema ya PostgreSQL, pgvector, sera za RLS, data ya mfano | Dakika 60 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Utekelezaji wa Msingi | Mfumo wa FastMCP, muunganisho wa hifadhidata, usimamizi wa muunganisho | Dakika 90 |
| **[06-Zana](walkthrough/06-Tools/README.md)** | Maendeleo ya Zana | Uundaji wa zana za MCP, uthibitishaji wa maswali, vipengele vya akili ya biashara | Dakika 75 |
| **[07-Utafutaji wa Semantiki](walkthrough/07-Semantic-Search/README.md)** | Muunganisho wa AI | Embeddings za Azure OpenAI, utafutaji wa vector, mikakati ya utafutaji mseto | Dakika 60 |
| **[08-Upimaji](walkthrough/08-Testing/README.md)** | Uhakikisho wa Ubora | Upimaji wa vitengo, upimaji wa muunganisho, upimaji wa utendaji, utatuzi wa hitilafu | Dakika 75 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Uzoefu wa Maendeleo | Usanidi wa VS Code, muunganisho wa AI Chat, mifumo ya utatuzi wa hitilafu | Dakika 45 |
| **[10-Upelekaji](walkthrough/10-Deployment/README.md)** | Tayari kwa Uzalishaji | Uwekaji wa kontena, Azure Container Apps, mikondo ya CI/CD, upanuzi | Dakika 90 |
| **[11-Ufuatiliaji](walkthrough/11-Monitoring/README.md)** | Uangalizi | Ufuatiliaji wa programu, kumbukumbu zilizopangwa, vipimo vya utendaji | Dakika 60 |
| **[12-Mbinu Bora](walkthrough/12-Best-Practices/README.md)** | Ubora wa Uzalishaji | Kuimarisha usalama, kuboresha utendaji, mifumo ya biashara | Dakika 45 |

**Jumla ya Muda wa Kujifunza**: ~12-15 saa za kujifunza kwa vitendo kwa kina

### 🎯 Jinsi ya Kutumia Mwongozo

**Kwa Wanaoanza**:
1. Anza na [Moduli 00: Utangulizi](walkthrough/00-Introduction/README.md) kuelewa misingi ya MCP
2. Fuata moduli kwa mpangilio kwa uzoefu kamili wa kujifunza
3. Kila moduli inajenga dhana za awali na inajumuisha mazoezi ya vitendo

**Kwa Waendelezaji Wenye Uzoefu**:
1. Tathmini [Muhtasari wa Mwongozo Mkuu](walkthrough/README.md) kwa muhtasari wa moduli zote
2. Ruka hadi moduli maalum zinazokuvutia (mfano, Moduli 07 kwa muunganisho wa AI)
3. Tumia moduli za mtu binafsi kama nyenzo za marejeleo kwa miradi yako mwenyewe

**Kwa Utekelezaji wa Uzalishaji**:
1. Zingatia Moduli 02 (Usalama), 10 (Upelekaji), na 11 (Ufuatiliaji)
2. Tathmini Moduli 12 (Mbinu Bora) kwa miongozo ya biashara
3. Tumia mifano ya msimbo kama templates tayari kwa uzalishaji

### 🚀 Chaguo za Kuanza Haraka

**Chaguo 1: Njia Kamili ya Kujifunza** (Inapendekezwa kwa wanaoanza)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Chaguo 2: Utekelezaji wa Vitendo** (Anza moja kwa moja na ujenzi)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Chaguo 3: Kuzingatia Uzalishaji** (Upelekaji wa biashara)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Mahitaji ya Kujifunza

**Ujuzi Unaopendekezwa**:
- Uzoefu wa msingi wa programu ya Python
- Uelewa wa REST APIs na hifadhidata
- Uelewa wa jumla wa dhana za AI/ML
- Maarifa ya msingi ya mstari wa amri na Docker

**Sio Lazima (lakini ni msaada)**:
- Uzoefu wa awali wa MCP (tunafundisha kutoka mwanzo)
- Uzoefu wa wingu la Azure (tunatoa mwongozo wa hatua kwa hatua)
- Maarifa ya hali ya juu ya PostgreSQL (tunafafanua dhana inapohitajika)

### 💡 Vidokezo vya Kujifunza

1. **Njia ya Vitendo**: Kila moduli ina mifano ya msimbo inayoweza kuendeshwa na kubadilishwa
2. **Ugumu wa Kuendelea**: Dhana zinajengwa polepole kutoka rahisi hadi ngumu
3. **Muktadha wa Ulimwengu Halisi**: Mifano yote inatumia hali halisi za biashara ya rejareja
4. **Tayari kwa Uzalishaji**: Mifano ya msimbo imeundwa kwa matumizi halisi ya uzalishaji
5. **Msaada wa Jamii**: Jiunge na [jamii yetu ya Discord](https://discord.com/invite/ByRwuEEgH4) kwa msaada na mijadala

### 🔗 Rasilimali Zinazohusiana

- **[MCP kwa Anayeanza](https://aka.ms/mcp-for-beginners)**: Usomaji wa msingi muhimu
- **[Mfano wa Muhtasari](Sample_Walkthrough.md)**: Muhtasari wa kiufundi wa kiwango cha juu
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Jukwaa la wingu linalotumika katika mifano
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Mfumo wa utekelezaji wa MCP wa Python

**Uko tayari kuanza kujifunza?** Anza na **[Moduli 00: Utangulizi](walkthrough/00-Introduction/README.md)** au chunguza **[muhtasari kamili wa mwongozo](walkthrough/README.md)**.

## Mahitaji

1. Docker Desktop imewekwa
2. Git imewekwa
3. **Azure CLI**: Sakinisha na uthibitishe kwa Azure CLI
4. Ufikiaji wa modeli ya OpenAI `text-embedding-3-small` na kwa hiari modeli `gpt-4o-mini`.

## Kuanza

Fungua dirisha la terminal na endesha amri zifuatazo:

1. Thibitisha kwa Azure CLI

    ```bash
    az login
    ```

2. Clone hifadhi

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Elekea kwenye saraka ya mradi

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Kusambaza Rasilimali za Azure

Endesha hati zifuatazo ili kuendesha usambazaji wa rasilimali za Azure zinazohitajika kwa seva ya MCP.

Hati za usambazaji zitasambaza moja kwa moja modeli ya `text-embedding-3-small`. Wakati wa usambazaji, utakuwa na chaguo la kujumuisha pia modeli ya `gpt-4o-mini`. Kumbuka kuwa `gpt-4o-mini` **sio lazima** kwa mradi huu na imejumuishwa tu kwa maboresho ya baadaye yanayowezekana.

**Chagua hati kwa jukwaa lako:**

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

## Kuendesha Seva ya MCP

Njia rahisi ya kuendesha stack kamili (PostgreSQL + Seva ya MCP) ni kutumia Docker Compose:

### Anzisha Stack

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

## Matumizi

Hii inadhani utatumia msaada wa seva ya MCP ndani ya VS Code.

1. Fungua mradi katika VS Code. Kutoka kwa terminal, endesha:

    ```bash
    code .
    ```

2. Anzisha seva moja au zaidi za MCP ukitumia usanidi katika `.vscode/mcp.json`. Faili ina usanidi wa seva nne tofauti, kila moja ikiwakilisha jukumu tofauti la meneja wa duka:

   - Kila usanidi hutumia kitambulisho cha kipekee cha RLS (Usalama wa Kiwango cha Safu)
   - Vitambulisho hivi vya mtumiaji vinaiga utambulisho wa mameneja wa duka tofauti wanaopata hifadhidata
   - Mfumo wa RLS unazuia ufikiaji wa data kulingana na duka lililowekwa kwa meneja
   - Hii inaiga hali halisi ambapo mameneja wa duka huingia kwa akaunti tofauti za Entra ID

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

### Fungua VS Code AI Chat

1. Fungua hali ya AI Chat katika VS Code
2. Andika **#zava** na uchague moja ya seva za MCP ulizoanzisha
3. Uliza maswali kuhusu data ya mauzo - Tazama maswali ya mfano hapa chini

### Maswali ya Mfano

1. Onyesha bidhaa 20 bora kwa mapato ya mauzo
1. Onyesha mauzo kwa duka
1. Mauzo ya robo ya mwisho yalikuwa vipi kwa kila kategoria?
1. Ni bidhaa gani tunazouza zinazofanana na "vyombo vya rangi"

## Vipengele

- **Ufikiaji wa Mifumo ya Jedwali Nyingi**: Pata mifumo ya hifadhidata kwa meza nyingi kwa ombi moja
- **Utekelezaji Salama wa Maswali**: Endesha maswali ya PostgreSQL kwa msaada wa Usalama wa Kiwango cha Safu (RLS)
- **Data ya Wakati Halisi**: Pata mauzo ya sasa, hesabu, na data ya wateja
- **Zana za Tarehe/Muda**: Pata alama za muda za UTC za sasa kwa uchambuzi unaotegemea muda
- **Usambazaji Rahisi**: Inasaidia hali ya seva ya HTTP

## Meza Zinazoungwa Mkono

Seva inatoa ufikiaji kwa meza zifuatazo za hifadhidata ya rejareja:

- `retail.customers` - Taarifa za wateja na maelezo yao
- `retail.stores` - Maeneo ya maduka na maelezo
- `retail.categories` - Kategoria za bidhaa na miundo yao
- `retail.product_types` - Uainishaji wa aina za bidhaa
- `retail.products` - Katalogi ya bidhaa na maelezo
- `retail.orders` - Maagizo ya wateja na miamala
- `retail.order_items` - Vitu vya kibinafsi ndani ya maagizo
- `retail.inventory` - Viwango vya hesabu ya sasa na data ya hisa

## Zana Zinazopatikana

### `get_multiple_table_schemas`

Pata mifumo ya hifadhidata kwa meza nyingi kwa ombi moja.

**Vigezo:**

- `table_names` (list[str]): Orodha ya majina halali ya meza kutoka kwa meza zinazoungwa mkono hapo juu

**Inarudisha:** Mifumo ya meza iliyounganishwa kwa meza zilizoombwa

### `execute_sales_query`

Endesha maswali ya PostgreSQL dhidi ya hifadhidata ya mauzo kwa msaada wa Usalama wa Kiwango cha Safu.

**Vigezo:**

- `postgresql_query` (str): Swali la PostgreSQL lililoandaliwa vizuri

**Inarudisha:** Matokeo ya swali yaliyopangwa kama kamba (yamepunguzwa hadi safu 20 kwa usomaji)

**Mazoezi Bora:**

- Kila mara pata mifumo ya meza kwanza
- Tumia majina halisi ya safu kutoka kwa mifumo
- Unganisha meza zinazohusiana kwa uchambuzi wa kina
- Fanya muhtasari wa matokeo inapofaa
- Punguza matokeo kwa usomaji

### `get_current_utc_date`

Pata tarehe na muda wa sasa wa UTC katika muundo wa ISO.

**Inarudisha:** Tarehe/muda wa sasa wa UTC katika muundo wa ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Fanya utafutaji wa semantiki wa bidhaa kulingana na maswali ya mtumiaji.

**Inarudisha:** Orodha ya bidhaa zinazolingana na vigezo vya utafutaji

**Vigezo:**

- `query` (str): Kamba ya swali la utafutaji

**Inarudisha:** Orodha ya bidhaa zinazolingana na vigezo vya utafutaji

## Vipengele vya Usalama

### Usalama wa Kiwango cha Safu (RLS)

Seva inatekeleza Usalama wa Kiwango cha Safu ili kuhakikisha watumiaji wanapata tu data wanayoidhinishwa kuona:

- **Hali ya HTTP**: Inatumia kichwa cha `x-rls-user-id` kutambua mtumiaji anayefanya ombi

- **Chaguo-msingi**: Inatumia UUID ya nafasi wakati hakuna kitambulisho cha mtumiaji kinachotolewa

#### Vitambulisho vya Mtumiaji vya RLS vya Duka Mahususi

Kila eneo la duka la Zava Retail lina kitambulisho cha kipekee cha mtumiaji cha RLS kinachoamua data ambayo mtumiaji anaweza kufikia:

| Eneo la Duka | Kitambulisho cha Mtumiaji cha RLS | Maelezo |
|---------------|-------------|-------------|
| **Ufikiaji wa Ulimwengu** | `00000000-0000-0000-0000-000000000000` | Chaguo-msingi - ufikiaji wa maduka yote |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Data ya duka la Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Data ya duka la Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Data ya duka la Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Data ya duka la Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Data ya duka la Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Data ya duka la Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Data ya duka la Zava Retail Kirkland |
| **Mtandaoni** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Data ya duka la Zava Retail Mtandaoni |

#### Utekelezaji wa RLS

Wakati mtumiaji anaunganishwa na kitambulisho cha mtumiaji cha RLS cha duka mahususi, ataona tu:

- Wateja wanaohusiana na duka hilo
- Maagizo yaliyowekwa katika eneo hilo la duka
- Data ya hesabu kwa duka hilo mahususi
- Vipimo vya mauzo na utendaji vya duka hilo

Hii inahakikisha kutengwa kwa data kati ya maeneo tofauti ya duka huku ikihifadhi mfumo wa hifadhidata wa umoja.

## Muundo wa Mfumo

### Muktadha wa Programu

Seva inatumia muktadha wa programu uliosimamiwa na:

- **Kidimbwi cha Muunganisho wa Hifadhidata**: Usimamizi mzuri wa muunganisho kwa hali ya HTTP
- **Usimamizi wa Mzunguko wa Maisha**: Usafishaji sahihi wa rasilimali wakati wa kuzimwa
- **Usalama wa Aina**: Muktadha uliotajwa kwa nguvu na darasa la `AppContext`

### Muktadha wa Ombi

- **Uchimbaji wa Vichwa**: Uchambuzi salama wa vichwa kwa utambulisho wa mtumiaji
- **Ujumuishaji wa RLS**: Azimio la kitambulisho cha mtumiaji moja kwa moja kutoka kwa muktadha wa ombi
- **Ushughulikiaji wa Makosa**: Ushughulikiaji wa makosa wa kina na ujumbe wa kirafiki kwa mtumiaji

## Ushirikiano wa Hifadhidata

Seva inaunganishwa na hifadhidata ya PostgreSQL kupitia darasa la `PostgreSQLSchemaProvider`:

- **Kidimbwi cha Muunganisho**: Inatumia vidimbwi vya muunganisho vya async kwa upanuzi
- **Metadata ya Mfumo**: Inatoa maelezo ya kina ya mfumo wa meza
- **Utekelezaji wa Maswali**: Utekelezaji salama wa maswali kwa msaada wa RLS
- **Usimamizi wa Rasilimali**: Usafishaji wa rasilimali za hifadhidata moja kwa moja

## Ushughulikiaji wa Makosa

Seva inatekeleza ushughulikiaji wa makosa wa nguvu:

- **Uthibitishaji wa Meza**: Inahakikisha majina halali ya meza pekee yanapata ufikiaji
- **Uthibitishaji wa Maswali**: Inathibitisha maswali ya PostgreSQL kabla ya utekelezaji
- **Usimamizi wa Rasilimali**: Usafishaji sahihi hata wakati wa makosa
- **Ujumbe wa Kirafiki kwa Mtumiaji**: Ujumbe wa makosa wazi kwa utatuzi wa matatizo

## Masuala ya Usalama

1. **Usalama wa Kiwango cha Safu**: Maswali yote yanaheshimu sera za RLS kulingana na utambulisho wa mtumiaji
2. **Kutengwa kwa Data ya Duka**: Kitambulisho cha mtumiaji cha RLS cha kila duka kinahakikisha ufikiaji wa data ya duka hilo pekee
3. **Uthibitishaji wa Ingizo**: Majina ya meza na maswali yanathibitishwa kabla ya utekelezaji
4. **Mipaka ya Rasilimali**: Matokeo ya maswali yamepunguzwa ili kuzuia matumizi ya rasilimali kupita kiasi
5. **Usalama wa Muunganisho**: Inatumia mazoea salama ya muunganisho wa hifadhidata
6. **Uthibitishaji wa Utambulisho wa Mtumiaji**: Kila mara hakikisha kitambulisho sahihi cha mtumiaji cha RLS kinatumika kwa duka lililokusudiwa

### Vidokezo Muhimu vya Usalama

- **Usitumie vitambulisho vya mtumiaji vya RLS vya uzalishaji katika mazingira ya maendeleo**
- **Kila mara hakikisha kitambulisho cha mtumiaji cha RLS kinalingana na duka lililokusudiwa kabla ya kuendesha maswali**
- **UUID ya chaguo-msingi (`00000000-0000-0000-0000-000000000000`) inatoa ufikiaji mdogo**
- **Kila meneja wa duka anapaswa kuwa na ufikiaji wa kitambulisho cha mtumiaji cha RLS cha duka lake pekee**

## Maendeleo

### Muundo wa Mradi

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Vipengele Muhimu

- **Seva ya FastMCP**: Utekelezaji wa kisasa wa seva ya MCP na msaada wa async
- **Mtoa Huduma wa PostgreSQL**: Safu ya unyumbufu wa hifadhidata na msaada wa RLS
- **Usimamizi wa Muktadha**: Ushughulikiaji wa muktadha wa programu na ombi ulio salama kwa aina
- **Usajili wa Zana**: Usajili wa zana kwa tamko na uthibitishaji wa Pydantic

## Kuchangia

Unapochangia kwenye seva hii:

1. Hakikisha maswali yote ya hifadhidata yanaheshimu Usalama wa Kiwango cha Safu
2. Ongeza ushughulikiaji sahihi wa makosa kwa zana mpya
3. Sasisha README hii na vipengele vipya au mabadiliko yoyote
4. Jaribu hali ya seva ya HTTP
5. Thibitisha vigezo vya ingizo na toa ujumbe wa makosa wazi

## [Leseni](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Seva hii ya MCP inawezesha ufikiaji salama, wa ufanisi wa data ya mauzo ya Zava Retail kwa uchambuzi unaotegemea AI na maarifa.*

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.