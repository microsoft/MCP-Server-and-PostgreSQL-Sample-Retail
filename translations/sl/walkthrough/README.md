<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T07:43:30+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "sl"
}
-->
# 🚀 MCP strežnik s PostgreSQL - Celovit učni vodič

## 🧠 Pregled učne poti za integracijo MCP podatkovne baze

Ta celovit učni vodič vas nauči, kako zgraditi produkcijsko pripravljene **Model Context Protocol (MCP) strežnike**, ki se povezujejo s podatkovnimi bazami prek praktične implementacije analitike v maloprodaji. Spoznali boste vzorce na ravni podjetja, vključno z **varnostjo na ravni vrstic (RLS)**, **semantičnim iskanjem**, **integracijo Azure AI** in **dostopom do podatkov za več najemnikov**.

Ne glede na to, ali ste razvijalec zaledja, inženir umetne inteligence ali podatkovni arhitekt, vam ta vodič ponuja strukturirano učenje z resničnimi primeri in praktičnimi vajami.

## 🔗 Uradni MCP viri

- 📘 [MCP dokumentacija](https://modelcontextprotocol.io/) – Podrobni vodiči in uporabniški priročniki
- 📜 [MCP specifikacija](https://modelcontextprotocol.io/docs/) – Arhitektura protokola in tehnične reference
- 🧑‍💻 [MCP GitHub repozitorij](https://github.com/modelcontextprotocol) – SDK-ji, orodja in vzorčne kode odprtega vira
- 🌐 [MCP skupnost](https://github.com/orgs/modelcontextprotocol/discussions) – Pridružite se razpravam in prispevajte k skupnosti
- 📚 [MCP za začetnike](https://aka.ms/mcp-for-beginners) – Začnite tukaj, če ste novi v MCP

## 🧭 Učna pot za integracijo MCP podatkovne baze

### 📚 Celovita struktura učenja

| Modul | Tema | Opis | Povezava |
|-------|------|------|----------|
| **Moduli 1-3: Osnove** | | | |
| 00 | [Uvod v integracijo MCP podatkovne baze](./00-Introduction/README.md) | Pregled MCP z integracijo podatkovne baze in primer uporabe analitike v maloprodaji | [Začni tukaj](./00-Introduction/README.md) |
| 01 | [Osnovni koncepti arhitekture](./01-Architecture/README.md) | Razumevanje arhitekture MCP strežnika, podatkovnih slojev in varnostnih vzorcev | [Nauči se](./01-Architecture/README.md) |
| 02 | [Varnost in večnajemništvo](./02-Security/README.md) | Varnost na ravni vrstic, avtentikacija in dostop do podatkov za več najemnikov | [Nauči se](./02-Security/README.md) |
| 03 | [Priprava okolja](./03-Setup/README.md) | Nastavitev razvojnega okolja, Docker, Azure viri | [Nastavi](./03-Setup/README.md) |
| **Moduli 4-6: Gradnja MCP strežnika** | | | |
| 04 | [Oblikovanje podatkovne baze in sheme](./04-Database/README.md) | Nastavitev PostgreSQL, oblikovanje sheme za maloprodajo in vzorčni podatki | [Zgradi](./04-Database/README.md) |
| 05 | [Implementacija MCP strežnika](./05-MCP-Server/README.md) | Gradnja FastMCP strežnika z integracijo podatkovne baze | [Zgradi](./05-MCP-Server/README.md) |
| 06 | [Razvoj orodij](./06-Tools/README.md) | Ustvarjanje orodij za poizvedbe podatkovne baze in introspekcijo sheme | [Zgradi](./06-Tools/README.md) |
| **Moduli 7-9: Napredne funkcije** | | | |
| 07 | [Integracija semantičnega iskanja](./07-Semantic-Search/README.md) | Implementacija vektorskih vgrajevanj z Azure OpenAI in pgvector | [Napreduj](./07-Semantic-Search/README.md) |
| 08 | [Testiranje in odpravljanje napak](./08-Testing/README.md) | Strategije testiranja, orodja za odpravljanje napak in pristopi za validacijo | [Testiraj](./08-Testing/README.md) |
| 09 | [Integracija z VS Code](./09-VS-Code/README.md) | Konfiguracija VS Code za MCP integracijo in uporabo AI klepeta | [Integriraj](./09-VS-Code/README.md) |
| **Moduli 10-12: Produkcija in najboljše prakse** | | | |
| 10 | [Strategije uvajanja](./10-Deployment/README.md) | Uvajanje z Dockerjem, Azure Container Apps in premisleki o skaliranju | [Uvedi](./10-Deployment/README.md) |
| 11 | [Nadzor in opazovanje](./11-Monitoring/README.md) | Application Insights, beleženje, nadzor zmogljivosti | [Nadzoruj](./11-Monitoring/README.md) |
| 12 | [Najboljše prakse in optimizacija](./12-Best-Practices/README.md) | Optimizacija zmogljivosti, utrjevanje varnosti in nasveti za produkcijo | [Optimiziraj](./12-Best-Practices/README.md) |

### 💻 Kaj boste zgradili

Do konca te učne poti boste zgradili popoln **Zava Retail Analytics MCP strežnik**, ki vključuje:

- **Podatkovno bazo za maloprodajo z več tabelami** s podatki o naročilih strank, izdelkih in zalogi
- **Varnost na ravni vrstic** za izolacijo podatkov po trgovinah
- **Semantično iskanje izdelkov** z uporabo Azure OpenAI vgrajevanj
- **Integracijo AI klepeta v VS Code** za poizvedbe v naravnem jeziku
- **Produkcijsko pripravljeno uvajanje** z Dockerjem in Azure
- **Celovit nadzor** z Application Insights

## 🎯 Predpogoji za učenje

Da bi kar najbolje izkoristili to učno pot, bi morali imeti:

- **Izkušnje s programiranjem**: Poznavanje Python (priporočeno) ali podobnih jezikov
- **Znanje o podatkovnih bazah**: Osnovno razumevanje SQL in relacijskih podatkovnih baz
- **Koncepti API-jev**: Razumevanje REST API-jev in HTTP konceptov
- **Razvojna orodja**: Izkušnje z ukazno vrstico, Gitom in urejevalniki kode
- **Osnove oblaka**: (Neobvezno) Osnovno znanje o Azure ali podobnih oblačnih platformah
- **Poznavanje Dockerja**: (Neobvezno) Razumevanje konceptov kontejnerizacije

### Potrebna orodja

- **Docker Desktop** - Za poganjanje PostgreSQL in MCP strežnika
- **Azure CLI** - Za uvajanje oblačnih virov
- **VS Code** - Za razvoj in MCP integracijo
- **Git** - Za nadzor različic
- **Python 3.8+** - Za razvoj MCP strežnika

## 📚 Učni vodič in viri

Ta učna pot vključuje celovite vire, ki vam pomagajo pri učinkovitem navigiranju:

### Učni vodič

Vsak modul vključuje:
- **Jasne učne cilje** - Kaj boste dosegli
- **Navodila po korakih** - Podrobni vodiči za implementacijo
- **Primeri kode** - Delujoči vzorci z razlagami
- **Vaje** - Priložnosti za praktično vadbo
- **Vodiči za odpravljanje težav** - Pogoste težave in rešitve
- **Dodatni viri** - Nadaljnje branje in raziskovanje

### Preverjanje predpogojev

Pred začetkom vsakega modula boste našli:
- **Potrebno znanje** - Kaj bi morali vedeti vnaprej
- **Validacija nastavitev** - Kako preveriti svoje okolje
- **Časovne ocene** - Predviden čas za dokončanje
- **Rezultati učenja** - Kaj boste znali po zaključku

### Priporočene učne poti

Izberite svojo pot glede na raven izkušenj:

#### 🟢 **Pot za začetnike** (Novi v MCP)
1. Najprej začnite z [MCP za začetnike](https://aka.ms/mcp-for-beginners)
2. Dokončajte module 00-03 za razumevanje osnov
3. Sledite modulom 04-06 za praktično gradnjo
4. Preizkusite module 07-09 za praktično uporabo

#### 🟡 **Pot za srednje izkušene** (Nekaj izkušenj z MCP)
1. Preglejte module 00-01 za koncept podatkovnih baz
2. Osredotočite se na module 02-06 za implementacijo
3. Poglobite se v module 07-12 za napredne funkcije

#### 🔴 **Pot za izkušene** (Izkušeni z MCP)
1. Preletite module 00-03 za kontekst
2. Osredotočite se na module 04-09 za integracijo podatkovne baze
3. Osredotočite se na module 10-12 za uvajanje v produkcijo

## 🛠️ Kako učinkovito uporabljati to učno pot

### Sekvenčno učenje (priporočeno)

Sledite modulom po vrsti za celovito razumevanje:

1. **Preberite pregled** - Razumite, kaj boste naučili
2. **Preverite predpogoje** - Poskrbite, da imate potrebno znanje
3. **Sledite navodilom po korakih** - Implementirajte med učenjem
4. **Dokončajte vaje** - Okrepite svoje razumevanje
5. **Preglejte ključne točke** - Utrdite rezultate učenja

### Ciljno učenje

Če potrebujete specifične veščine:

- **Integracija podatkovne baze**: Osredotočite se na module 04-06
- **Implementacija varnosti**: Osredotočite se na module 02, 08, 12
- **AI/Semantično iskanje**: Poglobite se v modul 07
- **Uvajanje v produkcijo**: Preučite module 10-12

### Praktična vadba

Vsak modul vključuje:
- **Delujoče primere kode** - Kopirajte, prilagodite in eksperimentirajte
- **Resnične scenarije** - Praktični primeri uporabe analitike v maloprodaji
- **Postopno kompleksnost** - Gradnja od enostavnega do naprednega
- **Koraki za validacijo** - Preverite, ali vaša implementacija deluje

## 🌟 Skupnost in podpora

### Pridobite pomoč

- **Azure AI Discord**: [Pridružite se za strokovno podporo](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Prijavite težave ali postavite vprašanja](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP skupnost**: [Pridružite se širšim MCP razpravam](https://github.com/orgs/modelcontextprotocol/discussions)

### Prispevajte

Veseli smo prispevkov za izboljšanje te učne poti:
- **Popravite napake ali tipkarske napake** - Pošljite pull requeste
- **Dodajte primere** - Delite svoje implementacije
- **Izboljšajte dokumentacijo** - Pomagajte drugim pri učenju
- **Prijavite težave** - Pomagajte nam odpraviti težave

## 📜 Informacije o licenci

Ta učna vsebina je licencirana pod MIT licenco. Oglejte si datoteko [LICENSE](../../../LICENSE) za pogoje in določila.

## 🚀 Pripravljeni na začetek?

Začnite svojo pot z **[Modul 00: Uvod v integracijo MCP podatkovne baze](./00-Introduction/README.md)**

---

*Obvladajte gradnjo produkcijsko pripravljenih MCP strežnikov z integracijo podatkovne baze prek te celovite, praktične učne izkušnje.*

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni prevod s strani človeka. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.