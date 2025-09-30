<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:26:11+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# MCP Server နှင့် PostgreSQL နမူနာ - လက်လီရောင်းအားခွဲခြမ်းစိတ်ဖြာခြင်း

## Database Integration နှင့် MCP ကို လက်တွေ့အတူတူလေ့လာပါ

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

ဤအရင်းအမြစ်များကို အသုံးပြုရန်အဆင့်များကို လိုက်နာပါ-

1. **Repository ကို Fork လုပ်ပါ**: [ဒီမှာ Fork လုပ်ပါ](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discord Join လုပ်ပါ**: [ကျွမ်းကျင်သူများနှင့် ဖွံ့ဖြိုးရေးသူများနှင့်တွေ့ဆုံပါ](https://discord.com/invite/ByRwuEEgH4)

### 🌐 ဘာသာစကားအမျိုးမျိုးအထောက်အပံ့

#### GitHub Action မှတဆင့် ထောက်ပံ့ထားသည် (အလိုအလျောက် & အမြဲအပ်ဒိတ်ဖြစ်နေ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)

**အခြားဘာသာစကားများကို ထည့်သွင်းလိုပါက [ဒီမှာ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ရှိသောစာရင်းကို ကြည့်ပါ**

## နိဒါန်း

ဤနမူနာသည် **Model Context Protocol (MCP) server** တစ်ခုကို တည်ဆောက်ပြီး Deploy လုပ်ပုံကို ပြသသည်။ ဤ server သည် PostgreSQL မှတဆင့် လက်လီရောင်းအားဒေတာများကို AI အကူအညီများမှ လုံခြုံစွာ၊ ထိရောက်စွာ ရယူနိုင်စေရန် အထောက်အကူပြုသည်။ ဤပရောဂျက်တွင် **Row Level Security (RLS)**, **semantic search capabilities**, နှင့် **Azure AI integration** စသည့် စီးပွားရေးအဆင့်အရည်အသွေးများကို ပြသထားသည်။

**အဓိကအသုံးချမှုများ:**
- **AI အကူအညီဖြင့် ရောင်းအားခွဲခြမ်းစိတ်ဖြာခြင်း**: လက်လီရောင်းအားဒေတာများကို သဘာဝဘာသာစကားဖြင့် AI အကူအညီများမှ စစ်ဆေးနိုင်စေသည်
- **လုံခြုံသော Multi-Tenant Access**: Row Level Security ကို အသုံးပြု၍ ဆိုင်မန်နေဂျာတစ်ဦးချင်းစီသည် သူ့ဆိုင်၏ဒေတာကိုသာ ကြည့်နိုင်စေရန် ပြသထားသည်
- **Semantic Product Search**: Text embeddings အသုံးပြု၍ AI ဖြင့် ထုတ်ကုန်ရှာဖွေမှုကို ပြသထားသည်
- **စီးပွားရေးအဆင့်ပေါင်းစည်းမှု**: MCP server များကို Azure ဝန်ဆောင်မှုများနှင့် PostgreSQL database များနှင့် ပေါင်းစည်းပုံကို ပြသထားသည်

**အထူးသင့်လျော်သည်:**
- Database integration ဖြင့် MCP server များတည်ဆောက်ရန် လေ့လာနေသော Developer များ
- လုံခြုံသော Multi-Tenant Analytics ဖြေရှင်းချက်များကို အကောင်အထည်ဖော်နေသော Data Engineer များ
- လက်လီရောင်းအား ဒေတာ သို့မဟုတ် e-commerce ဒေတာနှင့် အလုပ်လုပ်နေသော AI အက်ပလီကေးရှင်း Developer များ
- AI အကူအညီများနှင့် စီးပွားရေး Database များကို ပေါင်းစည်းလိုသူ မည်သူမဆို

## Azure AI Foundry Discord Community ကို Join လုပ်ပါ
MCP အတွေ့အကြုံများကို မျှဝေပြီး ကျွမ်းကျင်သူများနှင့် ထုတ်ကုန်အဖွဲ့များနှင့် တွေ့ဆုံပါ

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# ရောင်းအားခွဲခြမ်းစိတ်ဖြာ MCP Server

Zava Retail DIY Business အတွက် Comprehensive Customer Sales Database Access ကို ပံ့ပိုးပေးသော Model Context Protocol (MCP) server တစ်ခုဖြစ်သည်။ ဤ server သည် AI အကူအညီများမှ လုံခြုံပြီး Schema-Aware Interface ဖြင့် လက်လီရောင်းအားဒေတာများကို စစ်ဆေးနိုင်စေသည်။

## 📚 အပြည့်အစုံသော အကောင်အထည်ဖော်မှုလမ်းညွှန်

ဤဖြေရှင်းချက်ကို ဘယ်လိုတည်ဆောက်ပြီး အခြား MCP server များကို အကောင်အထည်ဖော်ရမည်ကို သိရှိရန် **[Sample Walkthrough](Sample_Walkthrough.md)** ကို ကြည့်ပါ။ ဤလမ်းညွှန်တွင် ပါဝင်သည်-

- **Architecture Deep Dive**: ပိုင်းဖွဲ့ခြင်းနှင့် ဒီဇိုင်းပုံစံများ
- **အဆင့်ဆင့်တည်ဆောက်ခြင်း**: ပရောဂျက်စတင်ခြင်းမှ Deployment အထိ
- **Code Breakdown**: MCP server အကောင်အထည်ဖော်မှု၏ အသေးစိတ်ရှင်းလင်းချက်
- **အဆင့်မြင့်အင်္ဂါရပ်များ**: Row Level Security, semantic search, နှင့် monitoring
- **အကောင်းဆုံးအလေ့အထများ**: လုံခြုံမှု, စွမ်းဆောင်ရည်, နှင့် ဖွံ့ဖြိုးရေးလမ်းညွှန်များ
- **ပြဿနာဖြေရှင်းခြင်း**: ရှိနိုင်သောပြဿနာများနှင့် ဖြေရှင်းချက်များ

ဤအကောင်အထည်ဖော်မှုအသေးစိတ်ကို နားလည်လိုသူ Developer များအတွက် အထူးသင့်လျော်သည်။

## 🤖 MCP (Model Context Protocol) ဆိုတာဘာလဲ?

**Model Context Protocol (MCP)** သည် AI အကူအညီများကို အပြင်ပဒေတာရင်းမြစ်များနှင့် ကိရိယာများကို လုံခြုံစွာ အချိန်နှင့်တပြေးညီ ချိတ်ဆက်နိုင်စေရန် အထောက်အကူပြုသော ဖွင့်လင်းစံနှုန်းတစ်ခုဖြစ်သည်။ ဒါကို AI မော်ဒယ်များနှင့် Database, API, File System, နှင့် အခြားအရင်းအမြစ်များကို ချိတ်ဆက်ပေးသော တံတားတစ်ခုအဖြစ် စဉ်းစားနိုင်သည်။

### အဓိကအကျိုးကျေးဇူးများ:
- **အချိန်နှင့်တပြေးညီ ဒေတာရယူမှု**: AI အကူအညီများမှ Database နှင့် API များကို တိုက်ရိုက်စစ်ဆေးနိုင်သည်
- **လုံခြုံသောပေါင်းစည်းမှု**: Authentication နှင့် Permissions ဖြင့် ထိန်းချုပ်ထားသော Access
- **ကိရိယာတိုးချဲ့နိုင်မှု**: AI အကူအညီများအတွက် စိတ်ကြိုက်စွမ်းဆောင်ရည်များ ထည့်သွင်းနိုင်သည်
- **စံနှုန်းတစ်ခုတည်း**: မတူညီသော AI ပလက်ဖောင်းများနှင့် ကိရိယာများအတွက် အလုပ်လုပ်နိုင်သည်

### MCP အသစ်လား?

Model Context Protocol အသစ်ဖြစ်ပါက Microsoft ၏ စတင်လေ့လာသူများအတွက် အပြည့်အစုံသော အရင်းအမြစ်များကို စတင်ရန် အကြံပြုပါသည်-

**📖 [MCP for Beginners Guide](https://aka.ms/mcp-for-beginners)**

ဤအရင်းအမြစ်တွင် ပါဝင်သည်-
- MCP အကြောင်းအရာနှင့် Architecture
- သင့်ရဲ့ ပထမဆုံး MCP server တည်ဆောက်ရန် အဆင့်ဆင့်လမ်းညွှန်
- MCP ဖွံ့ဖြိုးရေးအတွက် အကောင်းဆုံးအလေ့အထများ
- လူကြိုက်များသော AI ပလက်ဖောင်းများနှင့် ပေါင်းစည်းမှုနမူနာများ
- Community အရင်းအမြစ်များနှင့် အထောက်အပံ့

အခြေခံအချက်များကို နားလည်ပြီးပါက ဤအဆင့်မြင့် လက်လီရောင်းအားခွဲခြမ်းစိတ်ဖြာမှုအကောင်အထည်ဖော်မှုကို လေ့လာရန် ပြန်လာပါ!

## 📚 အပြည့်အစုံသော လေ့လာမှုလမ်းညွှန်: /walkthrough

ဤ Repository တွင် **12-Module Learning Walkthrough** တစ်ခုပါဝင်ပြီး ဤ MCP လက်လီ server နမူနာကို အဆင့်ဆင့် သင်ခန်းစာများအဖြစ် ခွဲခြမ်းထားသည်။ ဤ Walkthrough သည် ဤအလုပ်လုပ်နေသော နမူနာကို Database Integration ဖြင့် Production-Ready MCP server များတည်ဆောက်လိုသူ Developer များအတွက် Comprehensive Educational Resource အဖြစ် ပြောင်းလဲပေးသည်။

### သင်လေ့လာမည့်အရာများ

ဤ Walkthrough တွင် MCP အခြေခံအချက်များမှ စ၍ Production Deployment အထိ အရာအားလုံးကို ဖုံးလွှမ်းထားပြီး-

- **MCP အခြေခံအချက်များ**: Model Context Protocol နှင့် ၎င်း၏ အမှန်တကယ်အသုံးချမှုများကို နားလည်ခြင်း
- **Database Integration**: Row Level Security ဖြင့် လုံခြုံသော PostgreSQL ချိတ်ဆက်မှုကို အကောင်အထည်ဖော်ခြင်း
- **AI-Enhanced Features**: Azure OpenAI Embeddings ဖြင့် Semantic Search စွမ်းဆောင်ရည်များ ထည့်သွင်းခြင်း
- **လုံခြုံမှုအကောင်အထည်ဖော်မှု**: စီးပွားရေးအဆင့် Authentication, Authorization, နှင့် Data Isolation
- **Tool Development**: ဒေတာခွဲခြမ်းစိတ်ဖြာမှုနှင့် စီးပွားရေးထောက်လှမ်းမှုအတွက် Sophisticated MCP Tools တည်ဆောက်ခြင်း
- **Testing & Debugging**: စုံလင်သော စမ်းသပ်မှုမဟုတ်မှုနည်းလမ်းများနှင့် Debugging နည်းလမ်းများ
- **VS Code Integration**: Natural Language Database Queries အတွက် AI Chat ကို Configure လုပ်ခြင်း
- **Production Deployment**: Containerization, Scaling, နှင့် Cloud Deployment Strategies
- **Monitoring & Observability**: Application Insights, Logging, နှင့် Performance Monitoring

### လေ့လာမှုလမ်းကြောင်းအကျဉ်းချုပ်

ဤ Walkthrough သည် Developer များအားလုံးအတွက် သင့်လျော်သော Progressive Learning Structure ကို လိုက်နာသည်-

| Module | အဓိကအကျုံး | ဖော်ပြချက် | အချိန်ခန့်မှန်းချက် |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | အခြေခံ | MCP အကြောင်းအရာများ, Zava Retail Case Study, Architecture အကျဉ်းချုပ် | 30 မိနစ် |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | ဒီဇိုင်းပုံစံများ | နည်းပညာဆိုင်ရာ Architecture, Layered Design, System Components | 45 မိနစ် |
| **[02-Security](walkthrough/02-Security/README.md)** | စီးပွားရေးလုံခြုံမှု | Azure Authentication, Row Level Security, Multi-Tenant Isolation | 60 မိနစ် |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ပတ်ဝန်းကျင် | Docker Setup, Azure CLI, Project Configuration, Validation | 45 မိနစ် |
| **[04-Database](walkthrough/04-Database/README.md)** | ဒေတာအလွှာ | PostgreSQL Schema, pgvector, RLS Policies, Sample Data | 60 မိနစ် |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Core Implementation | FastMCP Framework, Database Integration, Connection Management | 90 မိနစ် |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Tool Development | MCP Tool Creation, Query Validation, Business Intelligence Features | 75 မိနစ် |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI Integration | Azure OpenAI Embeddings, Vector Search, Hybrid Search Strategies | 60 မိနစ် |
| **[08-Testing](walkthrough/08-Testing/README.md)** | အရည်အသွေးအာမခံမှု | Unit Testing, Integration Testing, Performance Testing, Debugging | 75 မိနစ် |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ဖွံ့ဖြိုးရေးအတွေ့အကြုံ | VS Code Configuration, AI Chat Integration, Debugging Workflows | 45 မိနစ် |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Production Ready | Containerization, Azure Container Apps, CI/CD Pipelines, Scaling | 90 မိနစ် |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Observability | Application Insights, Structured Logging, Performance Metrics | 60 မိနစ် |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Production Excellence | Security Hardening, Performance Optimization, Enterprise Patterns | 45 မိနစ် |

**စုစုပေါင်းလေ့လာမှုအချိန်**: ~12-15 နာရီအတွင်း လက်တွေ့လေ့လာမှု

### 🎯 Walkthrough ကို ဘယ်လိုအသုံးပြုမလဲ

**စတင်သူများအတွက်**
### 📋 သင်ယူရန်လိုအပ်ချက်များ

**အကြံပြုထားသော နောက်ခံအခြေခံများ**:
- Python programming အခြေခံအတတ်ပညာ
- REST APIs နှင့် databases အကြောင်း သိရှိမှု
- AI/ML အကြောင်းအရာများကို အထွေထွေ နားလည်မှု
- Command-line နှင့် Docker အခြေခံအသုံးပြုမှု

**မလိုအပ် (သို့သော် အကျိုးရှိနိုင်သည်)**:
- MCP အတွေ့အကြုံ (ကျွန်ုပ်တို့ အခြေခံမှ စတင်ရှင်းပြပါမည်)
- Azure cloud အတွေ့အကြုံ (အဆင့်ဆင့် လမ်းညွှန်ချက်များ ပေးပါမည်)
- PostgreSQL အဆင့်မြင့် အသုံးပြုမှု (လိုအပ်သည့်အခါ ရှင်းပြပါမည်)

### 💡 သင်ယူရန် အကြံပြုချက်များ

1. **လက်တွေ့လုပ်ဆောင်မှု**: Module တစ်ခုစီတွင် လုပ်ဆောင်နိုင်သော code နမူနာများ ပါဝင်ပြီး ပြင်ဆင်နိုင်ပါသည်။
2. **အဆင့်မြှင့်တိုးတက်မှု**: အကြောင်းအရာများကို ရိုးရှင်းမှ စတင်ပြီး အဆင့်မြင့်သို့ တဖြည်းဖြည်း တိုးတက်စေပါသည်။
3. **အမှန်တကယ် အခြေအနေများ**: နမူနာများအားလုံးကို စီးပွားရေးလုပ်ငန်းများ၏ အမှန်တကယ် အခြေအနေများနှင့် သက်ဆိုင်စေပါသည်။
4. **ထုတ်လုပ်မှုအဆင့်**: Code နမူနာများကို အမှန်တကယ် ထုတ်လုပ်မှုအတွက် အဆင့်မြင့်စေပါသည်။
5. **အသိုင်းအဝိုင်း အထောက်အပံ့**: [Discord အသိုင်းအဝိုင်း](https://discord.com/invite/ByRwuEEgH4) တွင် ပါဝင်ပြီး အကူအညီနှင့် ဆွေးနွေးမှုများ ပြုလုပ်ပါ။

### 🔗 သက်ဆိုင်သော အရင်းအမြစ်များ

- **[MCP for Beginners](https://aka.ms/mcp-for-beginners)**: အခြေခံအကြောင်းအရာများကို ဖတ်ရှုရန် အရေးကြီး
- **[Sample Walkthrough](Sample_Walkthrough.md)**: နည်းပညာအကြမ်းဖျင်း အကျဉ်းချုပ်
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: နမူနာများတွင် အသုံးပြုထားသော Cloud platform
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP implementation framework

**သင်ယူရန် စတင်လိုပါသလား?** **[Module 00: Introduction](walkthrough/00-Introduction/README.md)** ကို စတင်ပါ သို့မဟုတ် **[complete walkthrough overview](walkthrough/README.md)** ကို ရှာဖွေပါ။

## လိုအပ်ချက်များ

1. Docker Desktop ကို install လုပ်ထားရမည်
2. Git ကို install လုပ်ထားရမည်
3. **Azure CLI**: Azure CLI ကို install လုပ်ပြီး authenticate လုပ်ပါ
4. OpenAI `text-embedding-3-small` model နှင့် optionally `gpt-4o-mini` model ကို အသုံးပြုနိုင်ရမည်။

## စတင်ခြင်း

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

MCP server အတွက် လိုအပ်သော Azure resources များကို automate လုပ်ရန် အောက်ပါ scripts များကို run လုပ်ပါ။

Deployment scripts များသည် `text-embedding-3-small` model ကို အလိုအလျောက် deploy လုပ်ပါမည်။ Deployment အတွင်း `gpt-4o-mini` model ကိုလည်း ထည့်သွင်းနိုင်မည်ဖြစ်သည်။ သို့သော် `gpt-4o-mini` model သည် **ဤ project အတွက် မလိုအပ်ပါ** သို့သော် အနာဂတ်အဆင့်မြှင့်မှုများအတွက်သာ ထည့်သွင်းထားပါသည်။

**သင့် platform အတွက် script ကို ရွေးပါ**:

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

PostgreSQL + MCP Server အားလုံးကို run လုပ်ရန် အလွယ်ဆုံးနည်းလမ်းမှာ Docker Compose ကို အသုံးပြုခြင်းဖြစ်သည်။

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

VS Code MCP server support ကို built-in အနေဖြင့် အသုံးပြုမည်ဟု ခန့်မှန်းထားပါသည်။

1. Project ကို VS Code တွင် ဖွင့်ပါ။ Terminal မှာ အောက်ပါ command ကို run လုပ်ပါ:

    ```bash
    code .
    ```

2. `.vscode/mcp.json` တွင် ပါဝင်သော configuration များကို အသုံးပြု၍ MCP servers တစ်ခု သို့မဟုတ် အများကို စတင်ပါ။ ဖိုင်တွင် store manager role များကို ကိုယ်စားပြုသော server configuration လေးခု ပါဝင်သည်:

   - Configuration တစ်ခုစီတွင် ထူးခြားသော RLS (Row Level Security) user ID ကို အသုံးပြုထားသည်
   - User ID များသည် database ကို access လုပ်သော store manager identity များကို simulation ပြုလုပ်သည်
   - RLS system သည် manager ရဲ့ assigned store အပေါ်မူတည်၍ data access ကို ကန့်သတ်သည်
   - Store managers များသည် အမှန်တကယ် Entra ID accounts ဖြင့် sign in လုပ်သော အခြေအနေများကို simulation ပြုလုပ်သည်

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
3. Sales data အကြောင်းမေးမြန်းပါ - အောက်ပါ နမူနာ queries များကို ကြည့်ပါ

### နမူနာ Queries

1. Sales revenue အရ ထိပ်ဆုံး 20 products ကို ပြပါ
1. Store အလိုက် sales ကို ပြပါ
1. နောက်ဆုံးလတစ်လအတွင်း category အလိုက် sales ဘယ်လိုရှိခဲ့သလဲ?
1. "containers for paint" နှင့် ဆင်တူသော ကျွန်ုပ်တို့ရောင်းသော products များက ဘာတွေလဲ?

## အင်္ဂါရပ်များ

- **Multi-table Schema Access**: တစ်ခါတည်းမှာ database tables များစွာ၏ schemas ကို retrieve လုပ်နိုင်သည်
- **Secure Query Execution**: PostgreSQL queries များကို Row Level Security (RLS) support ဖြင့် execute လုပ်နိုင်သည်
- **Real-time Data**: လက်ရှိ sales, inventory, နှင့် customer data ကို access လုပ်နိုင်သည်
- **Date/Time Utilities**: အချိန်နှင့်သက်ဆိုင်သော analysis အတွက် လက်ရှိ UTC timestamps ကို ရယူနိုင်သည်
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
- `retail.inventory` - လက်ရှိ inventory အဆင့်များနှင့် stock data

## Tools ရရှိနိုင်မှု

### `get_multiple_table_schemas`

တစ်ခါတည်းမှာ tables များစွာ၏ database schemas ကို retrieve လုပ်ပါ။

**Parameters:**

- `table_names` (list[str]): အထက်ပါ supported tables မှ valid table names များ၏ list

**Returns:** တောင်းဆိုထားသော tables များ၏ schema strings ကို concatenated အနေဖြင့် ပြန်ပေးသည်

### `execute_sales_query`

PostgreSQL queries များကို Row Level Security support ဖြင့် sales database တွင် execute လုပ်ပါ။

**Parameters:**

- `postgresql_query` (str): PostgreSQL query တစ်ခု

**Returns:** Query results ကို string အနေဖြင့် format ပြုလုပ်ပြီး (ဖတ်ရှုရလွယ်ကူစေရန် 20 rows အထိ ကန့်သတ်ထားသည်)

**Best Practices:**

- Table schemas ကို အရင်ဆုံး fetch လုပ်ပါ
- Schemas မှ exact column names ကို အသုံးပြုပါ
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

Server သည် Row Level Security ကို အသုံးပြု၍ အသုံးပြုသူများသည် authorized ဖြစ်သော data ကိုသာ access လုပ်နိုင်စေရန် အာမခံသည်:

- **HTTP Mode**: `x-rls-user-id` header ကို အသုံးပြု၍ တောင်းဆိုသူကို သတ်မှတ်သည်

- **Default Fallback**: User ID မရှိပါက placeholder UUID ကို အသုံးပြုသည်

#### Store-Specific RLS User IDs

Zava Retail store တစ်ခုစီတွင် unique RLS user ID တစ်ခုရှိပြီး အသုံးပြုသူသည် access လုပ်နိုင်သော data ကို သတ်မှတ်ပေးသည်:

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

အသုံးပြုသူသည် store-specific RLS User ID ဖြင့် ချိတ်ဆက်သောအခါ:

- Store သို့ သက်ဆိုင်သော customers
- Store location တွင် order ပြုလုပ်ထားသော orders
- Store-specific inventory data
- Store-specific sales နှင့် performance metrics

ဤအရာသည် store location များအကြား data isolation ကို အာမခံပြီး database schema ကို တစ်ခုတည်းအနေဖြင့် ထိန်းသိမ်းထားနိုင်သည်။

## Architecture

### Application Context

Server သည် managed application context ကို အသုံးပြုသည်:

- **Database Connection Pool**: HTTP mode အတွက် အကျိုးရှိသော connection management
- **Lifecycle Management**: Shutdown အတွင်း resource cleanup ကို သေချာစွာ ပြုလုပ်သည်
- **Type Safety**: `AppContext` dataclass ဖြင့် strongly typed context

### Request Context

- **Header Extraction**: User identification အတွက် header parsing ကို secure လုပ်သည်
- **RLS Integration**: Request context မှ user ID resolution ကို အလိုအလျောက် ပြုလုပ်သည်
- **Error Handling**: အသုံးပြုသူအတွက် user-friendly messages ဖြင့် error handling ပြုလုပ်သည်

## Database Integration

Server သည် PostgreSQL database နှင့် `PostgreSQLSchemaProvider` class ကို အသုံးပြု၍ ချိတ်ဆက်ထားသည်:

- **Connection Pooling**: Scalability အတွက် async connection pools ကို အသုံးပြုသည်
- **Schema Metadata**: Table schema အချက်အလက်များကို ပေးသည်
- **Query Execution**: RLS support ဖြင့် secure query execution
- **Resource Management**: Database resources များကို အလိုအလျောက် cleanup ပြုလုပ်သည်

## Error Handling

Server သည် error handling ကို ခိုင်မာစွာ ပြုလုပ်ထားသည်:

- **Table Validation**: Valid table names များကိုသာ access လုပ်နိုင်စေရန် အာမခံသည်
- **Query Validation**: PostgreSQL queries များကို execute လုပ်မီ validate လုပ်သည်
- **Resource Management**: Error ဖြစ်ပေါ်သည့်အခါတွင် resource cleanup ကို သေချာစွာ ပြုလုပ်သည်
- **User-Friendly Messages**: Troubleshooting အတွက် ရိုးရှင်းသော error messages

## Security Considerations

1. **Row Level Security**: Query များအားလုံးသည် user identity အပေါ်မူတည်၍ RLS policies ကို လိုက်နာသည်
2. **Store Data Isolation**: Store-specific RLS User ID သည် store တစ်ခု၏ data ကိုသာ access လုပ်နိုင်စေရန် အာမခံသည်
3. **Input Validation**: Table names နှင့် queries များကို execute မပြုလုပ်မီ validate လုပ်သည်
4. **Resource Limits**: Query results များကို resource usage များပြားမှုကို ကန့်သတ်ရန် အတွက် ကန့်သတ်ထားသည်
5. **Connection Security**: Secure database connection practices ကို အသုံးပြုသည်
6. **User Identity Verification**: Store location အတွက် intended RLS User ID ကို အမြဲတမ်း verify လုပ်ပါ

### အရေးကြီးသော Security မှတ်ချက်များ

- **Production RLS User IDs ကို development environments တွင် မသုံးပါနှင့်**
- **RLS User ID သည် intended store နှင့် ကိုက်ညီမှုရှိကြောင်း အမြဲ verify လုပ်ပါ**
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

1. Database queries များအားလုံးသည် Row Level Security ကို လိုက်နာရမည်
2. New tools အတွက် error handling ကို သင့်တော်စွာ ထည့်သွင်းပါ
3. New features သို့မဟုတ် ပြောင်းလဲမှုများကို README တွင် update လုပ်ပါ
4. HTTP server mode ကို စမ်းသပ်ပါ
5. Input parameters များကို validate လုပ်ပြီး ရိုးရှင်းသော error messages ပေးပါ

## [License](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*ဤ MCP server သည် Zava Retail sales data ကို AI-powered analysis နှင့် insights အတွက် secure, efficient access ပေးနိုင်စေသည်။*

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်စနစ် [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူလဘာသာစကားဖြင့် ရေးသားထားသည့် စာရွက်စာတမ်းကို အတည်ပြုရမည့် အရင်းအမြစ်အဖြစ် သတ်မှတ်ပါ။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များ၏ အကူအညီကို သုံးစွဲရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသည့် နားလည်မှုမှားမှုများ သို့မဟုတ် အဓိပ္ပါယ်မှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မရှိပါ။