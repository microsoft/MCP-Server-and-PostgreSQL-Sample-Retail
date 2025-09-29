<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T22:46:42+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "tl"
}
-->
# 🚀 MCP Server na may PostgreSQL - Kumpletong Gabay sa Pag-aaral

## 🧠 Pangkalahatang-ideya ng Landas sa Pag-aaral ng MCP Database Integration

Ang komprehensibong gabay na ito ay nagtuturo kung paano bumuo ng **Model Context Protocol (MCP) servers** na handa para sa produksyon at may integrasyon sa mga database gamit ang isang praktikal na retail analytics na implementasyon. Matutunan mo ang mga enterprise-grade na pattern tulad ng **Row Level Security (RLS)**, **semantic search**, **Azure AI integration**, at **multi-tenant data access**.

Kung ikaw ay isang backend developer, AI engineer, o data architect, ang gabay na ito ay nagbibigay ng istrukturadong pag-aaral na may mga halimbawa mula sa totoong mundo at mga hands-on na pagsasanay.

## 🔗 Opisyal na Mga Mapagkukunan ng MCP

- 📘 [MCP Documentation](https://modelcontextprotocol.io/) – Detalyadong mga tutorial at gabay para sa mga user
- 📜 [MCP Specification](https://modelcontextprotocol.io/docs/) – Arkitektura ng protocol at mga teknikal na sanggunian
- 🧑‍💻 [MCP GitHub Repository](https://github.com/modelcontextprotocol) – Mga open-source SDK, tools, at code samples
- 🌐 [MCP Community](https://github.com/orgs/modelcontextprotocol/discussions) – Sumali sa mga talakayan at mag-ambag sa komunidad
- 📚 [MCP for Beginners](https://aka.ms/mcp-for-beginners) – Simulan dito kung bago ka sa MCP

## 🧭 Landas sa Pag-aaral ng MCP Database Integration

### 📚 Kumpletong Istruktura ng Pag-aaral

| Module | Paksa | Deskripsyon | Link |
|--------|-------|-------------|------|
| **Module 1-3: Mga Pundasyon** | | | |
| 00 | [Panimula sa MCP Database Integration](./00-Introduction/README.md) | Pangkalahatang-ideya ng MCP na may integrasyon sa database at retail analytics na use case | [Simulan Dito](./00-Introduction/README.md) |
| 01 | [Mga Pangunahing Konsepto ng Arkitektura](./01-Architecture/README.md) | Pag-unawa sa arkitektura ng MCP server, mga layer ng database, at mga pattern ng seguridad | [Matuto](./01-Architecture/README.md) |
| 02 | [Seguridad at Multi-Tenancy](./02-Security/README.md) | Row Level Security, authentication, at multi-tenant na pag-access sa data | [Matuto](./02-Security/README.md) |
| 03 | [Pag-set up ng Kapaligiran](./03-Setup/README.md) | Pag-set up ng development environment, Docker, at mga Azure resources | [Setup](./03-Setup/README.md) |
| **Module 4-6: Pagbuo ng MCP Server** | | | |
| 04 | [Disenyo ng Database at Schema](./04-Database/README.md) | Pag-set up ng PostgreSQL, disenyo ng retail schema, at sample na data | [Bumuo](./04-Database/README.md) |
| 05 | [Implementasyon ng MCP Server](./05-MCP-Server/README.md) | Pagbuo ng FastMCP server na may integrasyon sa database | [Bumuo](./05-MCP-Server/README.md) |
| 06 | [Pagbuo ng Mga Tool](./06-Tools/README.md) | Paglikha ng mga tool para sa query sa database at introspeksyon ng schema | [Bumuo](./06-Tools/README.md) |
| **Module 7-9: Mga Advanced na Tampok** | | | |
| 07 | [Integrasyon ng Semantic Search](./07-Semantic-Search/README.md) | Pag-implement ng vector embeddings gamit ang Azure OpenAI at pgvector | [Mag-advance](./07-Semantic-Search/README.md) |
| 08 | [Pagsubok at Pag-debug](./08-Testing/README.md) | Mga estratehiya sa pagsubok, mga tool sa pag-debug, at mga diskarte sa pag-validate | [Subukan](./08-Testing/README.md) |
| 09 | [Integrasyon ng VS Code](./09-VS-Code/README.md) | Pag-configure ng VS Code MCP integration at paggamit ng AI Chat | [Integrate](./09-VS-Code/README.md) |
| **Module 10-12: Produksyon at Mga Pinakamahusay na Kasanayan** | | | |
| 10 | [Mga Estratehiya sa Deployment](./10-Deployment/README.md) | Deployment gamit ang Docker, Azure Container Apps, at mga konsiderasyon sa scaling | [I-deploy](./10-Deployment/README.md) |
| 11 | [Pag-monitor at Observability](./11-Monitoring/README.md) | Application Insights, logging, at pag-monitor ng performance | [I-monitor](./11-Monitoring/README.md) |
| 12 | [Mga Pinakamahusay na Kasanayan at Pag-optimize](./12-Best-Practices/README.md) | Pag-optimize ng performance, pagpapalakas ng seguridad, at mga tip para sa produksyon | [I-optimize](./12-Best-Practices/README.md) |

### 💻 Ano ang Iyong Mabubuo

Sa pagtatapos ng landas sa pag-aaral na ito, makakabuo ka ng kumpletong **Zava Retail Analytics MCP Server** na may:

- **Multi-table retail database** na may customer orders, products, at inventory
- **Row Level Security** para sa data isolation batay sa store
- **Semantic product search** gamit ang Azure OpenAI embeddings
- **VS Code AI Chat integration** para sa natural language queries
- **Deployment na handa para sa produksyon** gamit ang Docker at Azure
- **Komprehensibong pag-monitor** gamit ang Application Insights

## 🎯 Mga Kinakailangan para sa Pag-aaral

Upang masulit ang landas sa pag-aaral na ito, dapat ay mayroon kang:

- **Karanasan sa Programming**: Pamilyar sa Python (mas mainam) o katulad na mga wika
- **Kaalaman sa Database**: Pangunahing pag-unawa sa SQL at relational databases
- **Mga Konsepto ng API**: Pag-unawa sa REST APIs at HTTP concepts
- **Mga Tool sa Pag-develop**: Karanasan sa command line, Git, at mga code editor
- **Mga Pangunahing Kaalaman sa Cloud**: (Opsyonal) Pangunahing kaalaman sa Azure o katulad na cloud platforms
- **Pamilyar sa Docker**: (Opsyonal) Pag-unawa sa mga konsepto ng containerization

### Mga Kinakailangang Tool

- **Docker Desktop** - Para sa pagpatakbo ng PostgreSQL at MCP server
- **Azure CLI** - Para sa pag-deploy ng cloud resources
- **VS Code** - Para sa pag-develop at integrasyon ng MCP
- **Git** - Para sa version control
- **Python 3.8+** - Para sa pag-develop ng MCP server

## 📚 Gabay sa Pag-aaral at Mga Mapagkukunan

Ang landas sa pag-aaral na ito ay may kasamang komprehensibong mga mapagkukunan upang matulungan kang mag-navigate nang epektibo:

### Gabay sa Pag-aaral

Ang bawat module ay may kasamang:
- **Malinaw na layunin sa pag-aaral** - Ano ang iyong maaabot
- **Step-by-step na mga tagubilin** - Detalyadong mga gabay sa implementasyon
- **Mga halimbawa ng code** - Mga gumaganang sample na may paliwanag
- **Mga pagsasanay** - Mga pagkakataon para sa hands-on na pagsasanay
- **Mga gabay sa troubleshooting** - Mga karaniwang isyu at solusyon
- **Karagdagang mapagkukunan** - Karagdagang babasahin at eksplorasyon

### Pagsusuri ng Mga Kinakailangan

Bago simulan ang bawat module, makikita mo:
- **Kinakailangang kaalaman** - Ano ang dapat mong malaman bago magsimula
- **Pag-validate ng setup** - Paano i-verify ang iyong kapaligiran
- **Mga pagtatantya ng oras** - Inaasahang oras ng pagkumpleto
- **Mga resulta ng pag-aaral** - Ano ang iyong malalaman pagkatapos makumpleto

### Inirerekomendang Landas sa Pag-aaral

Piliin ang iyong landas batay sa iyong antas ng karanasan:

#### 🟢 **Landas para sa Baguhan** (Bago sa MCP)
1. Simulan sa [MCP for Beginners](https://aka.ms/mcp-for-beginners)
2. Kumpletuhin ang mga module 00-03 para maunawaan ang mga pundasyon
3. Sundan ang mga module 04-06 para sa hands-on na pagbuo
4. Subukan ang mga module 07-09 para sa praktikal na paggamit

#### 🟡 **Landas para sa Intermediate** (May Karanasan sa MCP)
1. Suriin ang mga module 00-01 para sa mga konsepto na may kaugnayan sa database
2. Mag-focus sa mga module 02-06 para sa implementasyon
3. Mag-dive deep sa mga module 07-12 para sa mga advanced na tampok

#### 🔴 **Landas para sa Advanced** (May Malawak na Karanasan sa MCP)
1. Basahin ang mga module 00-03 para sa konteksto
2. Mag-focus sa mga module 04-09 para sa integrasyon ng database
3. Mag-concentrate sa mga module 10-12 para sa deployment sa produksyon

## 🛠️ Paano Gamitin ang Landas sa Pag-aaral na Ito nang Epektibo

### Sequential Learning (Inirerekomenda)

Sundan ang mga module nang sunod-sunod para sa komprehensibong pag-unawa:

1. **Basahin ang pangkalahatang-ideya** - Alamin kung ano ang iyong matututunan
2. **Suriin ang mga kinakailangan** - Siguraduhing mayroon kang kinakailangang kaalaman
3. **Sundan ang step-by-step na mga gabay** - Ipatupad habang natututo
4. **Kumpletuhin ang mga pagsasanay** - Palakasin ang iyong pag-unawa
5. **Balikan ang mga pangunahing takeaway** - Patatagin ang mga resulta ng pag-aaral

### Targeted Learning

Kung kailangan mo ng partikular na kasanayan:

- **Integrasyon ng Database**: Mag-focus sa mga module 04-06
- **Implementasyon ng Seguridad**: Mag-concentrate sa mga module 02, 08, 12
- **AI/Semantic Search**: Mag-dive deep sa module 07
- **Deployment sa Produksyon**: Pag-aralan ang mga module 10-12

### Hands-on na Pagsasanay

Ang bawat module ay may kasamang:
- **Mga gumaganang halimbawa ng code** - Kopyahin, baguhin, at subukan
- **Mga senaryo mula sa totoong mundo** - Praktikal na retail analytics na use cases
- **Progressive na komplikasyon** - Mula sa simple hanggang sa advanced
- **Mga hakbang sa pag-validate** - Siguraduhing gumagana ang iyong implementasyon

## 🌟 Komunidad at Suporta

### Humingi ng Tulong

- **Azure AI Discord**: [Sumali para sa ekspertong suporta](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Mag-report ng mga problema o magtanong](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Community**: [Sumali sa mas malawak na talakayan ng MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Mag-ambag

Malugod naming tinatanggap ang mga kontribusyon upang mapabuti ang landas sa pag-aaral na ito:
- **Ayusin ang mga bug o typo** - Mag-submit ng pull requests
- **Magdagdag ng mga halimbawa** - Ibahagi ang iyong mga implementasyon
- **Pagbutihin ang dokumentasyon** - Tulungan ang iba na matuto
- **Mag-report ng mga isyu** - Tulungan kaming ayusin ang mga problema

## 📜 Impormasyon sa Lisensya

Ang nilalaman ng pag-aaral na ito ay lisensyado sa ilalim ng MIT License. Tingnan ang [LICENSE](../../../LICENSE) file para sa mga tuntunin at kundisyon.

## 🚀 Handa Ka Na Bang Magsimula?

Simulan ang iyong paglalakbay sa **[Module 00: Panimula sa MCP Database Integration](./00-Introduction/README.md)**

---

*Masterin ang pagbuo ng mga MCP server na handa para sa produksyon na may integrasyon sa database gamit ang komprehensibo at hands-on na karanasan sa pag-aaral.*

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.