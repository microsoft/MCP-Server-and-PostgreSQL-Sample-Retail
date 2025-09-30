<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-30T07:37:22+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# MCP Server နှင့် PostgreSQL နမူနာ - လက်လီရောင်းအားခွဲခြမ်းစိတ်ဖြာခြင်း

## MCP ကို ဒေတာဘေ့စ်ပေါင်းစည်းမှုဖြင့် လက်တွေ့လေ့လာပါ

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

ဤအရင်းအမြစ်များကို အသုံးပြုရန်အဆင့်များကို လိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [ဒီနေရာကိုနှိပ်ပြီး Fork လုပ်ပါ](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discord ကို Join လုပ်ပါ**: [ကျွမ်းကျင်သူများနှင့် Developer မိတ်ဆွေများနှင့်တွေ့ဆုံပါ](https://discord.com/invite/ByRwuEEgH4)

### 🌐 ဘာသာစကားများစွာကို ပံ့ပိုးမှု

#### GitHub Action မှတဆင့် ပံ့ပိုးထားသည် (အလိုအလျောက် & အမြဲ Update ဖြစ်နေသည်)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)

**အပိုဘာသာစကားများကို ပံ့ပိုးလိုပါက [ဒီနေရာ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) တွင် ရှာဖွေပါ**

## မိတ်ဆက်

ဤနမူနာသည် **Model Context Protocol (MCP) server** တစ်ခုကို တည်ဆောက်ခြင်းနှင့် deploy လုပ်ခြင်းကို ပြသသည်။ AI အကူအညီများကို PostgreSQL မှတဆင့် လက်လီရောင်းအားဒေတာများကို လုံခြုံစွာ၊ ဉာဏ်ရည်ရှိစွာ access ပြုနိုင်စေရန် MCP server ကို အသုံးပြုသည်။ Row Level Security (RLS), semantic search, Azure AI integration စသည်တို့ပါဝင်သော လုပ်ငန်းအဆင့် features များကို ပြသထားသည်။

**အဓိက အသုံးပြုမှုများ**:
- **AI-Powered Sales Analytics**: AI အကူအညီများကို သဘာဝဘာသာစကားဖြင့် လက်လီရောင်းအားဒေတာကို query နှင့် ခွဲခြမ်းစိတ်ဖြာနိုင်စေရန်
- **Secure Multi-Tenant Access**: Row Level Security ကို အသုံးပြု၍ ဆိုင်မန်နေဂျာများသည် သူတို့ဆိုင်၏ဒေတာကိုသာ access ပြုနိုင်စေရန်
- **Semantic Product Search**: Text embeddings ကို အသုံးပြု၍ AI ဖြင့် ပစ္စည်းရှာဖွေမှုကို ပြသခြင်း
- **Enterprise Integration**: MCP server များကို Azure services နှင့် PostgreSQL databases နှင့် ပေါင်းစည်းခြင်း

**အထူးသင့်လျော်သောသူများ**:
- MCP server များကို database integration ဖြင့် တည်ဆောက်လိုသူ developer များ
- လုံခြုံသော multi-tenant analytics solution များကို အကောင်အထည်ဖော်လိုသူ data engineer များ
- လက်လီရောင်းအား ဒေတာနှင့် e-commerce ဒေတာများကို AI application တွင် အသုံးပြုလိုသူ developer များ
- AI အကူအညီများကို လုပ်ငန်း database များနှင့် ပေါင်းစည်းလိုသူ

## Azure AI Foundry Discord Community ကို Join လုပ်ပါ
MCP အတွေ့အကြုံများကို မျှဝေပြီး ကျွမ်းကျင်သူများနှင့် ပရိုဒတ်အဖွဲ့များနှင့် တွေ့ဆုံပါ

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Sales Analysis MCP Server

Zava Retail DIY Business အတွက် customer sales database ကို access ပြုနိုင်စေရန် Model Context Protocol (MCP) server တစ်ခုဖြစ်သည်။ AI အကူအညီများသည် လုံခြုံသော schema-aware interface မှတဆင့် လက်လီရောင်းအားဒေတာကို query နှင့် ခွဲခြမ်းစိတ်ဖြာနိုင်သည်။

## 📚 အကောင်အထည်ဖော်မှုလမ်းညွှန်ချက်

ဤ solution ကို ဘယ်လိုတည်ဆောက်ရမည်နှင့် MCP server များကို တူညီသောနည်းလမ်းဖြင့် အကောင်အထည်ဖော်ရန်အတွက် **[Sample Walkthrough](Sample_Walkthrough.md)** ကို ကြည့်ပါ။ ဤလမ်းညွှန်ချက်တွင် ပါဝင်သည်-

- **Architecture Deep Dive**: အစိတ်အပိုင်းများနှင့် ဒီဇိုင်းပုံစံများ
- **Step-by-Step Building**: Project setup မှ deployment အထိ
- **Code Breakdown**: MCP server အကောင်အထည်ဖော်မှုကို အသေးစိတ်ရှင်းပြခြင်း
- **Advanced Features**: Row Level Security, semantic search, နှင့် monitoring
- **Best Practices**: လုံခြုံမှု, စွမ်းဆောင်ရည်, နှင့် ဖွံ့ဖြိုးရေးလမ်းညွှန်ချက်များ
- **Troubleshooting**: ရှေ့ဆောင်ပြဿနာများနှင့် ဖြေရှင်းနည်းများ

ဤလမ်းညွှန်သည် တူညီသော solution များကို တည်ဆောက်လိုသူ developer များအတွက် အထူးသင့်လျော်သည်။

## 🤖 MCP (Model Context Protocol) ဆိုတာဘာလဲ?

**Model Context Protocol (MCP)** သည် AI အကူအညီများကို လုံခြုံစွာ အပြင်ပဒေတာအရင်းအမြစ်များနှင့် tools များကို အချိန်နှင့်တပြေးညီ access ပြုနိုင်စေရန် ဖွင့်လှစ် standard တစ်ခုဖြစ်သည်။ ဒေတာဘေ့စ်များ၊ APIs, ဖိုင်စနစ်များနှင့် အခြားအရင်းအမြစ်များကို AI models များနှင့် ချိတ်ဆက်ပေးသော တံတားတစ်ခုအဖြစ် လုပ်ဆောင်သည်။

### အဓိက အကျိုးကျေးဇူးများ:
- **Real-time Data Access**: AI အကူအညီများသည် live databases နှင့် APIs ကို query ပြုနိုင်သည်
- **Secure Integration**: Authentication နှင့် permissions ဖြင့် လုံခြုံစွာချိတ်ဆက်မှု
- **Tool Extensibility**: AI အကူအညီများအတွက် custom capabilities များထည့်သွင်းနိုင်သည်
- **Standardized Protocol**: အမျိုးမျိုးသော AI platforms နှင့် tools များတွင် အလုပ်လုပ်နိုင်သည်

### MCP အသစ်တစ်ခုကို စတင်လေ့လာပါ

Model Context Protocol ကို အသစ်စတင်လေ့လာသူများအတွက် Microsoft ၏ စတင်လေ့လာရန်အရင်းအမြစ်များကို အကြံပြုပါသည်-

**📖 [MCP for Beginners Guide](https://aka.ms/mcp-for-beginners)**

ဤအရင်းအမြစ်တွင် ပါဝင်သည်-
- MCP အကြောင်းအရာနှင့် architecture ကို မိတ်ဆက်ခြင်း
- MCP server တစ်ခုကို တည်ဆောက်ရန်အဆင့်ဆင့်လမ်းညွှန်
- MCP ဖွံ့ဖြိုးရေးအတွက် အကောင်းဆုံးလမ်းညွှန်ချက်များ
- လူကြိုက်များသော AI platforms များနှင့် integration နမူနာများ
- Community အရင်းအမြစ်များနှင့် ပံ့ပိုးမှု

အခြေခံများကို နားလည်ပြီးပါက ဤလက်လီရောင်းအား analytics အကောင်အထည်ဖော်မှုကို လေ့လာရန် ပြန်လာပါ!

## 📚 လေ့လာရေးလမ်းညွှန်ချက်: /walkthrough

ဤ repository တွင် **12-module learning walkthrough** တစ်ခုပါဝင်ပြီး ဤ MCP retail server နမူနာကို အဆင့်ဆင့် သင်ခန်းစာများအဖြစ် ခွဲခြမ်းစိတ်ဖြာထားသည်။ walkthrough သည် ဤအလုပ်လုပ်နေသောနမူနာကို လေ့လာရေးအရင်းအမြစ်အဖြစ် ပြောင်းလဲထားပြီး database integration ဖြင့် production-ready MCP server များကို တည်ဆောက်လိုသူ developer များအတွက် အထူးသင့်လျော်သည်။

### သင်လေ့လာနိုင်မည့်အရာများ

walkthrough တွင် MCP အခြေခံအကြောင်းအရာမှ production deployment အထိ အားလုံးကို ဖုံးကွယ်ထားပြီး-

- **MCP Fundamentals**: Model Context Protocol နှင့် ၎င်း၏ လက်တွေ့အသုံးချမှုများကို နားလည်ခြင်း
- **Database Integration**: Row Level Security ဖြင့် PostgreSQL ကို လုံခြုံစွာချိတ်ဆက်ခြင်း
- **AI-Enhanced Features**: Azure OpenAI embeddings ဖြင့် semantic search capabilities ထည့်သွင်းခြင်း
- **Security Implementation**: လုပ်ငန်းအဆင့် authentication, authorization, နှင့် data isolation
- **Tool Development**: ဒေတာခွဲခြမ်းစိတ်ဖြာမှုနှင့် လုပ်ငန်းသတင်းအချက်အလက်များအတွက် sophisticated MCP tools တည်ဆောက်ခြင်း
- **Testing & Debugging**: စုံစမ်းမှုနည်းလမ်းများနှင့် debugging နည်းလမ်းများ
- **VS Code Integration**: သဘာဝဘာသာစကား database queries အတွက် AI Chat ကို configure လုပ်ခြင်း
- **Production Deployment**: Containerization, scaling, နှင့် cloud deployment strategies
- **Monitoring & Observability**: Application Insights, logging, နှင့် စွမ်းဆောင်ရည် monitoring

### လေ့လာရေးလမ်းကြောင်းအကျဉ်းချုပ်

walkthrough သည် developer များအားလုံးအတွက် progressive learning structure ကို လိုက်နာသည်-

| Module | အဓိကအကျယ်အဝန်း | ဖော်ပြချက် | အချိန်ခန့်မှန်းချက် |
|--------|------------------|------------|--------------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | အခြေခံ | MCP အကြောင်းအရာများ၊ Zava Retail case study, architecture overview | 30 မိနစ် |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | ဒီဇိုင်းပုံစံများ | Technical architecture, layered design, system components | 45 မိနစ် |
| **[02-Security](walkthrough/02-Security/README.md)** | လုံခြုံရေး | Azure authentication, Row Level Security, multi-tenant isolation | 60 မိနစ် |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ပတ်ဝန်းကျင် | Docker setup, Azure CLI, project configuration, validation | 45 မိနစ် |
| **[04-Database](walkthrough/04-Database/README.md)** | ဒေတာအလွှာ | PostgreSQL schema, pgvector, RLS policies, sample data | 60 မိနစ် |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | အဓိကအကောင်အထည်ဖော်မှု | FastMCP framework, database integration, connection management | 90 မိနစ် |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Tool Development | MCP tool creation, query validation, business intelligence features | 75 မိနစ် |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI Integration | Azure OpenAI embeddings, vector search, hybrid search strategies | 60 မိနစ် |
| **[08-Testing](walkthrough/08-Testing/README.md)** | အရည်အသွေးအာမခံ | Unit testing, integration testing, performance testing, debugging | 75 မိနစ် |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ဖွံ့ဖြိုးရေးအတွေ့အကြုံ | VS Code configuration, AI Chat integration, debugging workflows | 45 မိနစ် |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Production Ready | Containerization, Azure Container Apps, CI/CD pipelines, scaling | 90 မိနစ် |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observability | Application Insights, structured logging, performance metrics | 60 မိနစ် |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Production Excellence | Security hardening, performance optimization, enterprise patterns | 45 မိနစ် |

**စုစုပေါင်းလေ့လာချိန်**: ~12-15 နာရီ၏ လက်တွေ့လေ့လာမှု

### 🎯 Walkthrough ကို ဘယ်လိုအသုံးပြုမလဲ

**Beginner များအတွက်**:
1. [Module 00: Introduction](walkthrough/00-Introduction/README.md) ကို စတင်ပြီး MCP အခြေခံအကြောင်းအရာများကို နားလည်ပါ
2. Modules များကို အစဉ်လိုက် လေ့လာပါ
3. Module တစ်ခုစီသည် အရင်အကြောင်းအရာများကို အခြေခံပြီး လက်တွေ့လေ့ကျင့်မှုများပါဝင်သည်

**ကျွမ်းကျင် Developer များအတွက်**:
1. [Main Walkthrough Overview](walkthrough/README.md) ကို ကြည့်ပြီး module အကျဉ်းချုပ်ကို နားလည်ပါ
2. စိတ်ဝင်စားသော modules (ဥပမာ- Module 07: AI integration) ကို ရွေးချယ်ပါ
3. ကိုယ်ပိုင် project များအတွက် modules တစ်ခုချင်းစီကို ရည်ညွှန်းအဖြစ် အသုံးပြုပါ

**Production Implementation အတွက်**:
1. Module 02 (Security), 10 (Deployment), နှင့် 11 (Monitoring) ကို အဓိကထားပါ
2. Module 12 (Best Practices) ကို လုပ်ငန်းအဆင့်လမ်းညွှန်
### 📋 သင်ယူရန် မလိုအပ်သော အခြေခံအချက်များ

**အကြံပြုထားသော အခြေခံအချက်များ**:
- Python programming အခြေခံအတတ်ပညာ
- REST APIs နှင့် databases အကြောင်း သိရှိမှု
- AI/ML အယူအဆများကို အထွေထွေ သိရှိမှု
- Command-line နှင့် Docker အခြေခံအသုံးပြုမှု

**မလိုအပ် (သို့သော် အကျိုးရှိနိုင်သည်)**:
- MCP အတွေ့အကြုံ (ကျွန်ုပ်တို့ အခြေခံမှ စတင်ရှင်းပြပါမည်)
- Azure cloud အတွေ့အကြုံ (အဆင့်ဆင့် လမ်းညွှန်ချက်များ ပေးပါမည်)
- PostgreSQL အဆင့်မြင့် အသုံးပြုမှု (လိုအပ်သည့်အခါ ရှင်းပြပါမည်)

### 💡 သင်ယူရန် အကြံပြုချက်များ

1. **လက်တွေ့ လေ့လာမှု**: Module တစ်ခုစီတွင် run လုပ်နိုင်ပြီး ပြင်ဆင်နိုင်သော code အကြောင်းအရာများ ပါဝင်သည်
2. **အဆင့်မြှင့်တိုးတက်မှု**: အယူအဆများကို ရိုးရှင်းမှ စတင်ပြီး အဆင့်မြင့်အထိ တိုးတက်စေသည်
3. **အမှန်တကယ် အခြေအနေများ**: ဥပမာများအားလုံးသည် လက်တွေ့ retail business အခြေအနေများကို အသုံးပြုသည်
4. **ထုတ်လုပ်မှုအဆင့်**: Code အကြောင်းအရာများကို အမှန်တကယ် ထုတ်လုပ်မှုအတွက် ဒီဇိုင်းဆွဲထားသည်
5. **အသိုင်းအဝိုင်း အထောက်အပံ့**: [Discord အသိုင်းအဝိုင်း](https://discord.com/invite/ByRwuEEgH4) တွင် ပါဝင်ပြီး အကူအညီနှင့် ဆွေးနွေးမှုများ ပြုလုပ်ပါ

### 🔗 ဆက်စပ် အရင်းအမြစ်များ

- **[MCP for Beginners](https://aka.ms/mcp-for-beginners)**: အခြေခံအချက်များကို ဖတ်ရှုရန် အရေးပါသည်
- **[Sample Walkthrough](Sample_Walkthrough.md)**: နည်းပညာဆိုင်ရာ အကျဉ်းချုပ်
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: ဥပမာများတွင် အသုံးပြုထားသော cloud platform
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP implementation framework

**သင်ယူရန် စတင်လိုပါသလား?** **[Module 00: Introduction](walkthrough/00-Introduction/README.md)** ကို စတင်ပါ သို့မဟုတ် **[complete walkthrough overview](walkthrough/README.md)** ကို ရှာဖွေပါ။

## မလိုအပ်သော အခြေခံအချက်များ

1. Docker Desktop ကို install လုပ်ထားရမည်
2. Git ကို install လုပ်ထားရမည်
3. **Azure CLI**: Azure CLI ဖြင့် install လုပ်ပြီး authenticate လုပ်ပါ
4. OpenAI `text-embedding-3-small` model နှင့် optionally `gpt-4o-mini` model ကို အသုံးပြုနိုင်ရမည်

## စတင်ရန်

Terminal window ကို ဖွင့်ပြီး အောက်ပါ command များကို run လုပ်ပါ:

1. Azure CLI ဖြင့် authenticate လုပ်ပါ

    ```bash
    az login
    ```

2. Repository ကို clone လုပ်ပါ

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Project directory သို့ သွားပါ

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure Resources ကို Deploy လုပ်ပါ

MCP server အတွက် လိုအပ်သော Azure resources ကို automate လုပ်ရန် အောက်ပါ scripts များကို run လုပ်ပါ။

Deployment scripts များသည် `text-embedding-3-small` model ကို အလိုအလျောက် deploy လုပ်ပါမည်။ Deployment အတွင်း `gpt-4o-mini` model ကိုလည်း ထည့်သွင်းနိုင်မည်ဖြစ်သည်။ သို့သော် `gpt-4o-mini` model သည် **ဤ project အတွက် မလိုအပ်ပါ** သာမက အနာဂတ်အဆင့်မြှင့်မှုများအတွက်သာ ထည့်သွင်းထားပါသည်။

**သင့် platform အတွက် script ကို ရွေးပါ:**

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

## MCP Server ကို run လုပ်ခြင်း

PostgreSQL + MCP Server အားလုံးကို run လုပ်ရန် အလွယ်ဆုံးနည်းလမ်းမှာ Docker Compose ကို အသုံးပြုခြင်းဖြစ်သည်:

### Stack ကို စတင်ပါ

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

## အသုံးပြုခြင်း

VS Code MCP server support built-in ကို အသုံးပြုမည်ဟု ခန့်မှန်းထားပါသည်။

1. Project ကို VS Code တွင် ဖွင့်ပါ။ Terminal မှ run လုပ်ပါ:

    ```bash
    code .
    ```

2. `.vscode/mcp.json` တွင်ပါဝင်သော configuration များကို အသုံးပြု၍ MCP servers တစ်ခု သို့မဟုတ် အများကို စတင်ပါ။ ဖိုင်တွင် store manager role များကို ကိုယ်စားပြုသော server configuration လေးခု ပါဝင်သည်:

   - Configuration တစ်ခုစီတွင် RLS (Row Level Security) user ID တစ်ခုစီကို အသုံးပြုထားသည်
   - User IDs များသည် database ကို access လုပ်သော store manager identities များကို simulation ပြုလုပ်သည်
   - RLS system သည် manager ရဲ့ assigned store အပေါ်မူတည်၍ data access ကို ကန့်သတ်သည်
   - Store managers များသည် အခြား Entra ID accounts ဖြင့် sign in လုပ်သော လက်တွေ့အခြေအနေများကို simulation ပြုလုပ်သည်

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

### VS Code AI Chat ကို ဖွင့်ပါ

1. VS Code တွင် AI Chat mode ကို ဖွင့်ပါ
2. **#zava** ကို ရိုက်ထည့်ပြီး သင်စတင်ထားသော MCP servers တစ်ခုကို ရွေးပါ
3. Sales data အကြောင်းမေးမြန်းပါ - အောက်ပါ sample queries ကို ကြည့်ပါ

### Sample Queries

1. Sales revenue အနက် top 20 products ကို ပြပါ
1. Store အလိုက် sales ကို ပြပါ
1. နောက်ဆုံးလေးလအတွင်း category အလိုက် sales ဘယ်လိုရှိခဲ့သလဲ?
1. "containers for paint" နှင့် ဆင်တူသော ကျွန်ုပ်တို့ရောင်းသော products များက ဘာတွေလဲ?

## Features

- **Multi-table Schema Access**: Database tables အများအပြား၏ schemas ကို တစ်ခါတည်း request ဖြင့် ရယူနိုင်သည်
- **Secure Query Execution**: PostgreSQL queries ကို Row Level Security (RLS) support ဖြင့် execute လုပ်နိုင်သည်
- **Real-time Data**: လက်ရှိ sales, inventory, နှင့် customer data ကို access လုပ်နိုင်သည်
- **Date/Time Utilities**: အချိန်နှင့်ဆိုင်သော analysis အတွက် လက်ရှိ UTC timestamps ကို ရယူနိုင်သည်
- **Flexible Deployment**: HTTP server mode ကို support လုပ်သည်

## Supported Tables

Server သည် အောက်ပါ retail database tables များကို access လုပ်နိုင်သည်:

- `retail.customers` - Customer အချက်အလက်နှင့် profiles
- `retail.stores` - Store locations နှင့် details
- `retail.categories` - Product categories နှင့် hierarchies
- `retail.product_types` - Product type classifications
- `retail.products` - Product catalog နှင့် specifications
- `retail.orders` - Customer orders နှင့် transactions
- `retail.order_items` - Orders အတွင်း individual items
- `retail.inventory` - လက်ရှိ inventory အဆင့်နှင့် stock data

## Tools Available

### `get_multiple_table_schemas`

Database schemas များကို တစ်ခါတည်း request ဖြင့် ရယူနိုင်သည်။

**Parameters:**

- `table_names` (list[str]): Supported tables အထက်မှ valid table names များ၏ list

**Returns:** Request လုပ်ထားသော tables များ၏ schema strings ကို concatenated အနေဖြင့် ပြန်ပေးသည်

### `execute_sales_query`

PostgreSQL queries ကို Row Level Security support ဖြင့် sales database အပေါ် execute လုပ်ပါ။

**Parameters:**

- `postgresql_query` (str): PostgreSQL query တစ်ခု

**Returns:** Query results ကို string အနေဖြင့် format လုပ်ပြီး (ဖတ်ရှုရလွယ်ကူစေရန် 20 rows အထိ ကန့်သတ်ထားသည်)

**Best Practices:**

- Table schemas ကို အရင်ဆုံး fetch လုပ်ပါ
- Schema များမှ column names ကို တိတိကျကျ အသုံးပြုပါ
- Related tables များကို join လုပ်ပါ
- အချက်အလက်များကို aggregate လုပ်ပါ
- Output ကို ဖတ်ရှုရလွယ်ကူစေရန် ကန့်သတ်ပါ

### `get_current_utc_date`

လက်ရှိ UTC date နှင့် time ကို ISO format ဖြင့် ရယူပါ။

**Returns:** လက်ရှိ UTC date/time ကို ISO format (YYYY-MM-DDTHH:MM:SS.fffffZ) ဖြင့် ပြန်ပေးသည်

### `semantic_search_products`

User queries အပေါ်မူတည်၍ products များကို semantic search ပြုလုပ်ပါ။

**Returns:** Search criteria နှင့် ကိုက်ညီသော products များ၏ list

**Parameters:**

- `query` (str): Search query string

**Returns:** Search criteria နှင့် ကိုက်ညီသော products များ၏ list

## Security Features

### Row Level Security (RLS)

Server သည် Row Level Security ကို အသုံးပြု၍ user များသည် authorized ဖြစ်သော data ကိုသာ access လုပ်နိုင်စေရန် အာမခံသည်:

- **HTTP Mode**: `x-rls-user-id` header ကို အသုံးပြု၍ request လုပ်သော user ကို ဖော်ထုတ်သည်

- **Default Fallback**: User ID မရှိပါက placeholder UUID ကို အသုံးပြုသည်

#### Store-Specific RLS User IDs

Zava Retail store တစ်ခုစီတွင် unique RLS user ID တစ်ခုစီရှိပြီး user များသည် access လုပ်နိုင်သော data ကို သတ်မှတ်ပေးသည်:

| Store Location | RLS User ID | Description |
|---------------|-------------|-------------|
| **Global Access** | `00000000-0000-0000-0000-000000000000` | Default fallback - store အားလုံးကို access လုပ်နိုင်သည် |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle store data |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue store data |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma store data |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane store data |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett store data |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond store data |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland store data |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online store data |

#### RLS Implementation

User တစ်ဦးသည် store တစ်ခု၏ RLS User ID ဖြင့် connect လုပ်သောအခါ:

- Store သို့ဆိုင်သော customers
- Store location တွင် order တင်ထားသော orders
- Store-specific inventory data
- Store-specific sales နှင့် performance metrics

ဤအချက်များကိုသာ access လုပ်နိုင်မည်ဖြစ်သည်။ Store location များအကြား data isolation ကို အာမခံပြီး unified database schema ကို ထိန်းသိမ်းထားသည်။

## Architecture

### Application Context

Server သည် managed application context ကို အသုံးပြုသည်:

- **Database Connection Pool**: HTTP mode အတွက် connection management ကို ထိရောက်စွာ ပြုလုပ်သည်
- **Lifecycle Management**: Shutdown အတွင်း resource cleanup ကို သေချာစွာ ပြုလုပ်သည်
- **Type Safety**: `AppContext` dataclass ဖြင့် strongly typed context

### Request Context

- **Header Extraction**: User identification အတွက် header parsing ကို secure လုပ်သည်
- **RLS Integration**: Request context မှ user ID resolution ကို အလိုအလျောက် ပြုလုပ်သည်
- **Error Handling**: User-friendly messages ဖြင့် error handling ကို ပြုလုပ်သည်

## Database Integration

Server သည် `PostgreSQLSchemaProvider` class ကို အသုံးပြု၍ PostgreSQL database နှင့် ပေါင်းစည်းထားသည်:

- **Connection Pooling**: Scalability အတွက် async connection pools ကို အသုံးပြုသည်
- **Schema Metadata**: Table schema အချက်အလက်များကို ပေးသည်
- **Query Execution**: RLS support ဖြင့် secure query execution
- **Resource Management**: Database resources ကို အလိုအလျောက် cleanup ပြုလုပ်သည်

## Error Handling

Server သည် error handling ကို ခိုင်မာစွာ ပြုလုပ်ထားသည်:

- **Table Validation**: Valid table names ကိုသာ access လုပ်နိုင်စေရန် အာမခံသည်
- **Query Validation**: PostgreSQL queries ကို execute လုပ်မီ validate လုပ်သည်
- **Resource Management**: Error ဖြစ်ပေါ်သည့်အခါ resource cleanup ကို သေချာစွာ ပြုလုပ်သည်
- **User-Friendly Messages**: Troubleshooting အတွက် error messages ကို ရှင်းလင်းစွာ ပေးသည်

## Security Considerations

1. **Row Level Security**: Query များအားလုံးသည် user identity အပေါ်မူတည်၍ RLS policies ကို လိုက်နာသည်
2. **Store Data Isolation**: Store-specific RLS User ID သည် data access ကို သတ်မှတ်ပေးသည်
3. **Input Validation**: Table names နှင့် queries များကို execute မပြုလုပ်မီ validate လုပ်သည်
4. **Resource Limits**: Query results ကို resource usage များပြားမှုကို ကန့်သတ်ရန် အတွက် ကန့်သတ်ထားသည်
5. **Connection Security**: Secure database connection practices ကို အသုံးပြုသည်
6. **User Identity Verification**: Store location အတွက် RLS User ID ကို သေချာစွာ verify လုပ်ပါ

### အရေးပါသော Security မှတ်ချက်များ

- **Production RLS User IDs ကို development environments တွင် အသုံးမပြုပါနှင့်**
- **RLS User ID သည် intended store နှင့် ကိုက်ညီမှုရှိကြောင်း verify လုပ်ပါ**
- **Default UUID (`00000000-0000-0000-0000-000000000000`) သည် access ကို ကန့်သတ်ထားသည်**
- **Store manager တစ်ဦးစီသည် သူ၏ store-specific RLS User ID ကိုသာ access လုပ်နိုင်ရမည်**

## Development

### Project Structure

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Key Components

- **FastMCP Server**: Modern MCP server implementation with async support
- **PostgreSQL Provider**: Database abstraction layer with RLS support
- **Context Management**: Type-safe application နှင့် request context handling
- **Tool Registration**: Declarative tool registration with Pydantic validation

## Contributing

Server သို့ အထောက်အကူပြုလိုပါက:

1. Database queries အားလုံးသည် Row Level Security ကို လိုက်နာကြောင်း အာမခံပါ
2. New tools အတွက် error handling ကို သင့်တော်စွာ ထည့်သွင်းပါ
3. New features သို့မဟုတ် ပြောင်းလဲမှုများကို README တွင် update လုပ်ပါ
4. HTTP server mode ကို စမ်းသပ်ပါ
5. Input parameters ကို validate လုပ်ပြီး ရှင်းလင်းသော error messages ကို ပေးပါ

## [License](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*ဤ MCP server သည် Zava Retail sales data ကို AI-powered analysis နှင့် insights အတွက် secure, efficient access ပေးသည်။*

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရားရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲသုံးစားမှု သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။