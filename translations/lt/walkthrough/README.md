<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T08:45:38+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "lt"
}
-->
# 🚀 MCP serveris su PostgreSQL - Išsamus mokymosi vadovas

## 🧠 MCP duomenų bazės integracijos mokymosi kelio apžvalga

Šis išsamus mokymosi vadovas moko, kaip sukurti gamybai paruoštus **Model Context Protocol (MCP) serverius**, kurie integruojasi su duomenų bazėmis, naudojant praktinį mažmeninės prekybos analitikos įgyvendinimą. Jūs išmoksite įmonės lygio modelius, įskaitant **eilės lygio saugumą (RLS)**, **semantinę paiešką**, **Azure AI integraciją** ir **daugiabučių duomenų prieigą**.

Nesvarbu, ar esate backend programuotojas, AI inžinierius, ar duomenų architektas, šis vadovas siūlo struktūrizuotą mokymą su realaus pasaulio pavyzdžiais ir praktinėmis užduotimis.

## 🔗 Oficialūs MCP ištekliai

- 📘 [MCP dokumentacija](https://modelcontextprotocol.io/) – Išsamūs mokymai ir vartotojo vadovai
- 📜 [MCP specifikacija](https://modelcontextprotocol.io/docs/) – Protokolo architektūra ir techninės nuorodos
- 🧑‍💻 [MCP GitHub saugykla](https://github.com/modelcontextprotocol) – Atvirojo kodo SDK, įrankiai ir kodo pavyzdžiai
- 🌐 [MCP bendruomenė](https://github.com/orgs/modelcontextprotocol/discussions) – Prisijunkite prie diskusijų ir prisidėkite prie bendruomenės
- 📚 [MCP pradedantiesiems](https://aka.ms/mcp-for-beginners) – Pradėkite čia, jei esate naujokas MCP

## 🧭 MCP duomenų bazės integracijos mokymosi kelias

### 📚 Išsamus mokymosi struktūra

| Modulis | Tema | Aprašymas | Nuoroda |
|---------|------|-----------|---------|
| **Moduliai 1-3: Pagrindai** | | | |
| 00 | [Įvadas į MCP duomenų bazės integraciją](./00-Introduction/README.md) | MCP apžvalga su duomenų bazės integracija ir mažmeninės prekybos analitikos naudojimo atveju | [Pradėti čia](./00-Introduction/README.md) |
| 01 | [Pagrindinės architektūros sąvokos](./01-Architecture/README.md) | MCP serverio architektūros, duomenų bazės sluoksnių ir saugumo modelių supratimas | [Sužinoti](./01-Architecture/README.md) |
| 02 | [Saugumas ir daugiabučių prieiga](./02-Security/README.md) | Eilės lygio saugumas, autentifikacija ir daugiabučių duomenų prieiga | [Sužinoti](./02-Security/README.md) |
| 03 | [Aplinkos paruošimas](./03-Setup/README.md) | Vystymo aplinkos, Docker, Azure resursų paruošimas | [Paruošti](./03-Setup/README.md) |
| **Moduliai 4-6: MCP serverio kūrimas** | | | |
| 04 | [Duomenų bazės dizainas ir schema](./04-Database/README.md) | PostgreSQL paruošimas, mažmeninės prekybos schemos dizainas ir pavyzdiniai duomenys | [Kurti](./04-Database/README.md) |
| 05 | [MCP serverio įgyvendinimas](./05-MCP-Server/README.md) | FastMCP serverio kūrimas su duomenų bazės integracija | [Kurti](./05-MCP-Server/README.md) |
| 06 | [Įrankių kūrimas](./06-Tools/README.md) | Duomenų bazės užklausų įrankių ir schemos introspekcijos kūrimas | [Kurti](./06-Tools/README.md) |
| **Moduliai 7-9: Pažangios funkcijos** | | | |
| 07 | [Semantinės paieškos integracija](./07-Semantic-Search/README.md) | Vektorių įterpimų įgyvendinimas su Azure OpenAI ir pgvector | [Pažengti](./07-Semantic-Search/README.md) |
| 08 | [Testavimas ir derinimas](./08-Testing/README.md) | Testavimo strategijos, derinimo įrankiai ir validacijos metodai | [Testuoti](./08-Testing/README.md) |
| 09 | [VS Code integracija](./09-VS-Code/README.md) | VS Code MCP integracijos ir AI pokalbių naudojimo konfigūravimas | [Integruoti](./09-VS-Code/README.md) |
| **Moduliai 10-12: Gamyba ir geriausios praktikos** | | | |
| 10 | [Diegimo strategijos](./10-Deployment/README.md) | Docker diegimas, Azure Container Apps ir mastelio didinimo aspektai | [Diegti](./10-Deployment/README.md) |
| 11 | [Stebėjimas ir stebimumas](./11-Monitoring/README.md) | Application Insights, žurnalai, našumo stebėjimas | [Stebėti](./11-Monitoring/README.md) |
| 12 | [Geriausios praktikos ir optimizavimas](./12-Best-Practices/README.md) | Našumo optimizavimas, saugumo stiprinimas ir gamybos patarimai | [Optimizuoti](./12-Best-Practices/README.md) |

### 💻 Ką sukursite

Baigę šį mokymosi kelią, sukursite pilną **Zava mažmeninės prekybos analitikos MCP serverį**, kuriame bus:

- **Daugiatabulių mažmeninės prekybos duomenų bazė** su klientų užsakymais, produktais ir inventorizacija
- **Eilės lygio saugumas** parduotuvės duomenų izoliacijai
- **Semantinė produktų paieška** naudojant Azure OpenAI įterpimus
- **VS Code AI pokalbių integracija** natūralių kalbų užklausoms
- **Gamybai paruoštas diegimas** su Docker ir Azure
- **Išsamus stebėjimas** naudojant Application Insights

## 🎯 Mokymosi reikalavimai

Kad maksimaliai išnaudotumėte šį mokymosi kelią, turėtumėte:

- **Programavimo patirtis**: Susipažinimas su Python (pageidautina) arba panašiomis kalbomis
- **Duomenų bazės žinios**: Pagrindinis SQL ir reliacinių duomenų bazių supratimas
- **API sąvokos**: REST API ir HTTP sąvokų supratimas
- **Vystymo įrankiai**: Patirtis su komandine eilute, Git ir kodo redaktoriais
- **Debesų pagrindai**: (Pasirinktinai) Pagrindinės Azure arba panašių debesų platformų žinios
- **Docker supratimas**: (Pasirinktinai) Konteinerizacijos sąvokų supratimas

### Reikalingi įrankiai

- **Docker Desktop** - PostgreSQL ir MCP serverio paleidimui
- **Azure CLI** - Debesų resursų diegimui
- **VS Code** - Vystymui ir MCP integracijai
- **Git** - Versijų valdymui
- **Python 3.8+** - MCP serverio kūrimui

## 📚 Mokymosi vadovas ir ištekliai

Šis mokymosi kelias apima išsamius išteklius, kurie padės efektyviai mokytis:

### Mokymosi vadovas

Kiekviename modulyje rasite:
- **Aiškius mokymosi tikslus** - Ką pasieksite
- **Žingsnis po žingsnio instrukcijas** - Išsamūs įgyvendinimo vadovai
- **Kodo pavyzdžius** - Veikiantys pavyzdžiai su paaiškinimais
- **Užduotis** - Praktinės užduotys
- **Problemos sprendimo vadovus** - Dažniausios problemos ir sprendimai
- **Papildomus išteklius** - Tolimesniam skaitymui ir tyrinėjimui

### Reikalavimų patikrinimas

Prieš pradedant kiekvieną modulį, rasite:
- **Reikalingas žinias** - Ką turėtumėte žinoti iš anksto
- **Aplinkos patikrinimą** - Kaip patikrinti savo aplinką
- **Laiko įvertinimus** - Numatomas užbaigimo laikas
- **Mokymosi rezultatus** - Ką sužinosite po užbaigimo

### Rekomenduojami mokymosi keliai

Pasirinkite kelią pagal savo patirties lygį:

#### 🟢 **Pradedančiųjų kelias** (Naujokams MCP)
1. Pirmiausia pradėkite nuo [MCP pradedantiesiems](https://aka.ms/mcp-for-beginners)
2. Užbaikite modulius 00-03, kad suprastumėte pagrindus
3. Sekite modulius 04-06 praktiniam kūrimui
4. Išbandykite modulius 07-09 praktiniam naudojimui

#### 🟡 **Vidutinis kelias** (Turintiems MCP patirties)
1. Peržiūrėkite modulius 00-01 dėl duomenų bazės specifinių sąvokų
2. Susitelkite į modulius 02-06 įgyvendinimui
3. Gilinkitės į modulius 07-12 dėl pažangių funkcijų

#### 🔴 **Pažangus kelias** (Patyrusiems MCP)
1. Greitai peržiūrėkite modulius 00-03 dėl konteksto
2. Susitelkite į modulius 04-09 dėl duomenų bazės integracijos
3. Koncentruokitės į modulius 10-12 dėl gamybos diegimo

## 🛠️ Kaip efektyviai naudoti šį mokymosi kelią

### Nuoseklus mokymasis (Rekomenduojama)

Eikite per modulius iš eilės, kad gautumėte išsamų supratimą:

1. **Perskaitykite apžvalgą** - Supraskite, ką išmoksite
2. **Patikrinkite reikalavimus** - Įsitikinkite, kad turite reikalingas žinias
3. **Sekite žingsnis po žingsnio vadovus** - Įgyvendinkite mokydamiesi
4. **Atlikite užduotis** - Sustiprinkite savo supratimą
5. **Peržiūrėkite pagrindines išvadas** - Įtvirtinkite mokymosi rezultatus

### Tikslinis mokymasis

Jei jums reikia specifinių įgūdžių:

- **Duomenų bazės integracija**: Susitelkite į modulius 04-06
- **Saugumo įgyvendinimas**: Koncentruokitės į modulius 02, 08, 12
- **AI/Semantinė paieška**: Gilinkitės į modulį 07
- **Gamybos diegimas**: Studijuokite modulius 10-12

### Praktinis mokymasis

Kiekviename modulyje rasite:
- **Veikiančius kodo pavyzdžius** - Kopijuokite, modifikuokite ir eksperimentuokite
- **Realios situacijos** - Praktiniai mažmeninės prekybos analitikos naudojimo atvejai
- **Progresyvus sudėtingumas** - Nuo paprasto iki sudėtingo
- **Validacijos žingsniai** - Patikrinkite, ar jūsų įgyvendinimas veikia

## 🌟 Bendruomenė ir palaikymas

### Gaukite pagalbą

- **Azure AI Discord**: [Prisijunkite ekspertų palaikymui](https://discord.com/invite/ByRwuEEgH4)
- **GitHub problemos**: [Praneškite apie problemas arba užduokite klausimus](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP bendruomenė**: [Prisijunkite prie platesnių MCP diskusijų](https://github.com/orgs/modelcontextprotocol/discussions)

### Prisidėkite

Mes laukiame jūsų indėlio, kad pagerintume šį mokymosi kelią:
- **Taisykite klaidas ar rašybos klaidas** - Pateikite pull requests
- **Pridėkite pavyzdžių** - Pasidalinkite savo įgyvendinimais
- **Tobulinkite dokumentaciją** - Padėkite kitiems mokytis
- **Praneškite apie problemas** - Padėkite mums išspręsti problemas

## 📜 Licencijos informacija

Šis mokymosi turinys licencijuotas pagal MIT licenciją. Žr. [LICENSE](../../../LICENSE) failą dėl sąlygų ir nuostatų.

## 🚀 Pasiruošę pradėti?

Pradėkite savo kelionę su **[Moduliu 00: Įvadas į MCP duomenų bazės integraciją](./00-Introduction/README.md)**

---

*Išmokite kurti gamybai paruoštus MCP serverius su duomenų bazės integracija per šį išsamų, praktinį mokymosi patyrimą.*

---

**Atsakomybės atsisakymas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, kylančius dėl šio vertimo naudojimo.