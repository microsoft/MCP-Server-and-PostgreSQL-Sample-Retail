<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-30T07:08:02+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "hr"
}
-->
# 🚀 MCP Server s PostgreSQL - Kompletan vodič za učenje

## 🧠 Pregled puta učenja integracije MCP baze podataka

Ovaj sveobuhvatni vodič za učenje pokazuje kako izgraditi **Model Context Protocol (MCP) servere** spremne za produkciju, koji se integriraju s bazama podataka kroz praktičnu implementaciju analitike maloprodaje. Naučit ćete obrasce na razini poduzeća, uključujući **sigurnost na razini redaka (RLS)**, **semantičko pretraživanje**, **integraciju s Azure AI** i **pristup podacima za više korisnika**.

Bez obzira jeste li backend programer, AI inženjer ili arhitekt podataka, ovaj vodič pruža strukturirano učenje s primjerima iz stvarnog svijeta i praktičnim vježbama.

## 🔗 Službeni MCP resursi

- 📘 [MCP Dokumentacija](https://modelcontextprotocol.io/) – Detaljni vodiči i upute za korisnike
- 📜 [MCP Specifikacija](https://modelcontextprotocol.io/docs/) – Arhitektura protokola i tehničke reference
- 🧑‍💻 [MCP GitHub Repozitorij](https://github.com/modelcontextprotocol) – Open-source SDK-ovi, alati i uzorci koda
- 🌐 [MCP Zajednica](https://github.com/orgs/modelcontextprotocol/discussions) – Pridružite se raspravama i doprinesite zajednici
- 📚 [MCP za početnike](https://aka.ms/mcp-for-beginners) – Započnite ovdje ako ste novi u MCP-u

## 🧭 Put učenja integracije MCP baze podataka

### 📚 Kompletna struktura učenja

| Modul | Tema | Opis | Link |
|-------|------|------|------|
| **Moduli 1-3: Osnove** | | | |
| 00 | [Uvod u integraciju MCP baze podataka](./00-Introduction/README.md) | Pregled MCP-a s integracijom baze podataka i slučajem upotrebe analitike maloprodaje | [Započni ovdje](./00-Introduction/README.md) |
| 01 | [Osnovni koncepti arhitekture](./01-Architecture/README.md) | Razumijevanje arhitekture MCP servera, slojeva baze podataka i sigurnosnih obrazaca | [Nauči](./01-Architecture/README.md) |
| 02 | [Sigurnost i višekorisnički pristup](./02-Security/README.md) | Sigurnost na razini redaka, autentifikacija i pristup podacima za više korisnika | [Nauči](./02-Security/README.md) |
| 03 | [Postavljanje okruženja](./03-Setup/README.md) | Postavljanje razvojnog okruženja, Docker-a, Azure resursa | [Postavi](./03-Setup/README.md) |
| **Moduli 4-6: Izgradnja MCP servera** | | | |
| 04 | [Dizajn baze podataka i shema](./04-Database/README.md) | Postavljanje PostgreSQL-a, dizajn sheme maloprodaje i uzorci podataka | [Izgradi](./04-Database/README.md) |
| 05 | [Implementacija MCP servera](./05-MCP-Server/README.md) | Izgradnja FastMCP servera s integracijom baze podataka | [Izgradi](./05-MCP-Server/README.md) |
| 06 | [Razvoj alata](./06-Tools/README.md) | Kreiranje alata za upite baze podataka i introspekciju sheme | [Izgradi](./06-Tools/README.md) |
| **Moduli 7-9: Napredne značajke** | | | |
| 07 | [Integracija semantičkog pretraživanja](./07-Semantic-Search/README.md) | Implementacija vektorskih ugrađivanja s Azure OpenAI i pgvector | [Napreduj](./07-Semantic-Search/README.md) |
| 08 | [Testiranje i otklanjanje grešaka](./08-Testing/README.md) | Strategije testiranja, alati za otklanjanje grešaka i pristupi validaciji | [Testiraj](./08-Testing/README.md) |
| 09 | [Integracija s VS Code](./09-VS-Code/README.md) | Konfiguracija VS Code MCP integracije i korištenje AI Chata | [Integriraj](./09-VS-Code/README.md) |
| **Moduli 10-12: Produkcija i najbolje prakse** | | | |
| 10 | [Strategije implementacije](./10-Deployment/README.md) | Implementacija s Docker-om, Azure Container Apps i razmatranja skaliranja | [Implementiraj](./10-Deployment/README.md) |
| 11 | [Praćenje i preglednost](./11-Monitoring/README.md) | Application Insights, logiranje, praćenje performansi | [Prati](./11-Monitoring/README.md) |
| 12 | [Najbolje prakse i optimizacija](./12-Best-Practices/README.md) | Optimizacija performansi, jačanje sigurnosti i savjeti za produkciju | [Optimiziraj](./12-Best-Practices/README.md) |

### 💻 Što ćete izgraditi

Na kraju ovog puta učenja, izgradit ćete kompletan **Zava Retail Analytics MCP Server** koji uključuje:

- **Višetabelnu maloprodajnu bazu podataka** s narudžbama kupaca, proizvodima i zalihama
- **Sigurnost na razini redaka** za izolaciju podataka po trgovinama
- **Semantičko pretraživanje proizvoda** koristeći Azure OpenAI ugrađivanja
- **Integraciju s VS Code AI Chatom** za upite prirodnim jezikom
- **Implementaciju spremnu za produkciju** s Docker-om i Azure-om
- **Sveobuhvatno praćenje** s Application Insights

## 🎯 Preduvjeti za učenje

Kako biste maksimalno iskoristili ovaj put učenja, trebali biste imati:

- **Iskustvo u programiranju**: Poznavanje Python-a (preporučeno) ili sličnih jezika
- **Znanje o bazama podataka**: Osnovno razumijevanje SQL-a i relacijskih baza podataka
- **Koncepti API-ja**: Razumijevanje REST API-ja i HTTP koncepata
- **Razvojni alati**: Iskustvo s komandnom linijom, Git-om i uređivačima koda
- **Osnove oblaka**: (Opcionalno) Osnovno znanje o Azure-u ili sličnim platformama
- **Poznavanje Docker-a**: (Opcionalno) Razumijevanje koncepta kontejnerizacije

### Potrebni alati

- **Docker Desktop** - Za pokretanje PostgreSQL-a i MCP servera
- **Azure CLI** - Za implementaciju resursa u oblaku
- **VS Code** - Za razvoj i MCP integraciju
- **Git** - Za kontrolu verzija
- **Python 3.8+** - Za razvoj MCP servera

## 📚 Vodič za učenje i resursi

Ovaj put učenja uključuje sveobuhvatne resurse koji će vam pomoći da se učinkovito snađete:

### Vodič za učenje

Svaki modul uključuje:
- **Jasne ciljeve učenja** - Što ćete postići
- **Detaljne upute korak po korak** - Vodiči za implementaciju
- **Primjere koda** - Radni uzorci s objašnjenjima
- **Vježbe** - Prilike za praktično učenje
- **Vodiče za otklanjanje grešaka** - Uobičajeni problemi i rješenja
- **Dodatne resurse** - Daljnje čitanje i istraživanje

### Provjera preduvjeta

Prije početka svakog modula, pronaći ćete:
- **Potrebno znanje** - Što biste trebali znati unaprijed
- **Validaciju postavki** - Kako provjeriti svoje okruženje
- **Procjenu vremena** - Očekivano vrijeme završetka
- **Rezultate učenja** - Što ćete znati nakon završetka

### Preporučeni putevi učenja

Odaberite svoj put na temelju razine iskustva:

#### 🟢 **Put za početnike** (Novi u MCP-u)
1. Započnite s [MCP za početnike](https://aka.ms/mcp-for-beginners)
2. Završite module 00-03 za razumijevanje osnova
3. Slijedite module 04-06 za praktičnu izgradnju
4. Isprobajte module 07-09 za praktičnu primjenu

#### 🟡 **Put za srednje iskusne** (Neko iskustvo s MCP-om)
1. Pregledajte module 00-01 za specifične koncepte baze podataka
2. Fokusirajte se na module 02-06 za implementaciju
3. Produbite znanje kroz module 07-12 za napredne značajke

#### 🔴 **Put za napredne** (Iskusni u MCP-u)
1. Preletite module 00-03 za kontekst
2. Fokusirajte se na module 04-09 za integraciju baze podataka
3. Koncentrirajte se na module 10-12 za implementaciju u produkciju

## 🛠️ Kako učinkovito koristiti ovaj put učenja

### Sekvencijalno učenje (Preporučeno)

Prođite module redom za sveobuhvatno razumijevanje:

1. **Pročitajte pregled** - Razumite što ćete naučiti
2. **Provjerite preduvjete** - Osigurajte da imate potrebno znanje
3. **Slijedite vodiče korak po korak** - Implementirajte dok učite
4. **Završite vježbe** - Učvrstite svoje razumijevanje
5. **Pregledajte ključne zaključke** - Učvrstite rezultate učenja

### Ciljano učenje

Ako trebate specifične vještine:

- **Integracija baze podataka**: Fokusirajte se na module 04-06
- **Implementacija sigurnosti**: Koncentrirajte se na module 02, 08, 12
- **AI/Semantičko pretraživanje**: Produbite znanje u modulu 07
- **Implementacija u produkciju**: Proučite module 10-12

### Praktično učenje

Svaki modul uključuje:
- **Radne primjere koda** - Kopirajte, modificirajte i eksperimentirajte
- **Scenarije iz stvarnog svijeta** - Praktični slučajevi analitike maloprodaje
- **Progresivnu složenost** - Od jednostavnog prema naprednom
- **Korake validacije** - Provjerite da vaša implementacija radi

## 🌟 Zajednica i podrška

### Dobivanje pomoći

- **Azure AI Discord**: [Pridružite se za stručnu podršku](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Prijavite probleme ili postavite pitanja](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Zajednica**: [Pridružite se širim MCP raspravama](https://github.com/orgs/modelcontextprotocol/discussions)

### Doprinos

Pozdravljamo doprinose za poboljšanje ovog puta učenja:
- **Ispravite greške ili tipfelere** - Pošaljite pull requestove
- **Dodajte primjere** - Podijelite svoje implementacije
- **Poboljšajte dokumentaciju** - Pomozite drugima da uče
- **Prijavite probleme** - Pomozite nam da riješimo probleme

## 📜 Informacije o licenci

Ovaj sadržaj za učenje licenciran je pod MIT licencom. Pogledajte [LICENSE](../../../LICENSE) datoteku za uvjete i odredbe.

## 🚀 Spremni za početak?

Započnite svoje putovanje s **[Modulom 00: Uvod u integraciju MCP baze podataka](./00-Introduction/README.md)**

---

*Savladajte izgradnju MCP servera spremnih za produkciju s integracijom baze podataka kroz ovo sveobuhvatno, praktično iskustvo učenja.*

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.