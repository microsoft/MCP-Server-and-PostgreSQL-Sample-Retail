<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T21:51:29+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "fi"
}
-->
# 🚀 MCP-palvelin PostgreSQL:llä - Täydellinen oppimisopas

## 🧠 Yleiskatsaus MCP-tietokantaintegraation oppimispolkuun

Tämä kattava oppimisopas opettaa sinulle, kuinka rakentaa tuotantovalmiita **Model Context Protocol (MCP) -palvelimia**, jotka integroituvat tietokantoihin käytännön vähittäiskaupan analytiikan toteutuksen kautta. Opit yritystason malleja, kuten **rivikohtainen tietoturva (RLS)**, **semanttinen haku**, **Azure AI -integraatio** ja **monivuokraajapohjainen datan käyttö**.

Olitpa sitten taustakehittäjä, tekoälyinsinööri tai data-arkkitehti, tämä opas tarjoaa jäsenneltyä oppimista todellisten esimerkkien ja käytännön harjoitusten avulla.

## 🔗 Viralliset MCP-resurssit

- 📘 [MCP-dokumentaatio](https://modelcontextprotocol.io/) – Yksityiskohtaiset opetusohjelmat ja käyttäjäoppaat
- 📜 [MCP-määrittely](https://modelcontextprotocol.io/docs/) – Protokollan arkkitehtuuri ja tekniset viitteet
- 🧑‍💻 [MCP GitHub-repositorio](https://github.com/modelcontextprotocol) – Avoimen lähdekoodin SDK:t, työkalut ja koodiesimerkit
- 🌐 [MCP-yhteisö](https://github.com/orgs/modelcontextprotocol/discussions) – Osallistu keskusteluihin ja anna panoksesi yhteisölle
- 📚 [MCP aloittelijoille](https://aka.ms/mcp-for-beginners) – Aloita tästä, jos olet uusi MCP:n parissa

## 🧭 MCP-tietokantaintegraation oppimispolku

### 📚 Täydellinen oppimisrakenne

| Moduuli | Aihe | Kuvaus | Linkki |
|---------|------|--------|--------|
| **Moduuli 1-3: Perusteet** | | | |
| 00 | [Johdatus MCP-tietokantaintegraatioon](./00-Introduction/README.md) | Yleiskatsaus MCP:stä tietokantaintegraation ja vähittäiskaupan analytiikan käyttötapauksen kanssa | [Aloita tästä](./00-Introduction/README.md) |
| 01 | [Keskeiset arkkitehtuurikäsitteet](./01-Architecture/README.md) | MCP-palvelimen arkkitehtuurin, tietokantakerrosten ja tietoturvamallien ymmärtäminen | [Opi](./01-Architecture/README.md) |
| 02 | [Tietoturva ja monivuokraus](./02-Security/README.md) | Rivikohtainen tietoturva, autentikointi ja monivuokraajapohjainen datan käyttö | [Opi](./02-Security/README.md) |
| 03 | [Ympäristön asennus](./03-Setup/README.md) | Kehitysympäristön, Dockerin ja Azure-resurssien asennus | [Asenna](./03-Setup/README.md) |
| **Moduuli 4-6: MCP-palvelimen rakentaminen** | | | |
| 04 | [Tietokannan suunnittelu ja skeema](./04-Database/README.md) | PostgreSQL:n asennus, vähittäiskaupan skeemasuunnittelu ja esimerkkidata | [Rakenna](./04-Database/README.md) |
| 05 | [MCP-palvelimen toteutus](./05-MCP-Server/README.md) | FastMCP-palvelimen rakentaminen tietokantaintegraatiolla | [Rakenna](./05-MCP-Server/README.md) |
| 06 | [Työkalujen kehitys](./06-Tools/README.md) | Tietokantakyselytyökalujen ja skeemainspektion luominen | [Rakenna](./06-Tools/README.md) |
| **Moduuli 7-9: Edistyneet ominaisuudet** | | | |
| 07 | [Semanttisen haun integraatio](./07-Semantic-Search/README.md) | Vektorijäsennysten toteutus Azure OpenAI:lla ja pgvectorilla | [Edisty](./07-Semantic-Search/README.md) |
| 08 | [Testaus ja virheenkorjaus](./08-Testing/README.md) | Testausstrategiat, virheenkorjaustyökalut ja validointimenetelmät | [Testaa](./08-Testing/README.md) |
| 09 | [VS Code -integraatio](./09-VS-Code/README.md) | VS Code MCP -integraation ja AI Chatin käytön konfigurointi | [Integroi](./09-VS-Code/README.md) |
| **Moduuli 10-12: Tuotanto ja parhaat käytännöt** | | | |
| 10 | [Julkaisustrategiat](./10-Deployment/README.md) | Docker-julkaisu, Azure Container Apps ja skaalausnäkökohdat | [Julkaise](./10-Deployment/README.md) |
| 11 | [Seuranta ja havainnointi](./11-Monitoring/README.md) | Application Insights, lokitus, suorituskyvyn seuranta | [Seuraa](./11-Monitoring/README.md) |
| 12 | [Parhaat käytännöt ja optimointi](./12-Best-Practices/README.md) | Suorituskyvyn optimointi, tietoturvan vahvistaminen ja tuotantovinkit | [Optimoi](./12-Best-Practices/README.md) |

### 💻 Mitä tulet rakentamaan

Oppimispolun lopussa olet rakentanut täydellisen **Zava Retail Analytics MCP -palvelimen**, joka sisältää:

- **Monitauluisen vähittäiskaupan tietokannan**, jossa on asiakastilauksia, tuotteita ja varastoja
- **Rivikohtaisen tietoturvan** myymäläkohtaisen datan eristämiseen
- **Semanttisen tuotehaun** Azure OpenAI:n jäsennysten avulla
- **VS Code AI Chat -integraation** luonnollisen kielen kyselyihin
- **Tuotantovalmiin julkaisun** Dockerilla ja Azurella
- **Kattavan seurannan** Application Insightsilla

## 🎯 Oppimisen edellytykset

Saadaksesi parhaan hyödyn oppimispolusta, sinulla tulisi olla:

- **Ohjelmointikokemus**: Pythonin (suositeltu) tai vastaavan kielen tuntemus
- **Tietokantatieto**: Perustiedot SQL:stä ja relaatiotietokannoista
- **API-käsitteet**: REST API:en ja HTTP-käsitteiden ymmärtäminen
- **Kehitystyökalut**: Kokemusta komentorivistä, Gitistä ja koodieditoreista
- **Pilvipohjatiedot**: (Valinnainen) Perustiedot Azuresta tai vastaavista pilvialustoista
- **Dockerin tuntemus**: (Valinnainen) Konttiteknologian käsitteiden ymmärtäminen

### Tarvittavat työkalut

- **Docker Desktop** - PostgreSQL:n ja MCP-palvelimen ajamiseen
- **Azure CLI** - Pilviresurssien julkaisuun
- **VS Code** - Kehitykseen ja MCP-integraatioon
- **Git** - Versionhallintaan
- **Python 3.8+** - MCP-palvelimen kehitykseen

## 📚 Opas ja resurssit

Tämä oppimispolku sisältää kattavat resurssit, jotka auttavat sinua navigoimaan tehokkaasti:

### Opas

Jokainen moduuli sisältää:
- **Selkeät oppimistavoitteet** - Mitä saavutetaan
- **Askel askeleelta ohjeet** - Yksityiskohtaiset toteutusohjeet
- **Koodiesimerkit** - Toimivia esimerkkejä selityksineen
- **Harjoituksia** - Käytännön harjoittelumahdollisuuksia
- **Vianetsintäoppaat** - Yleiset ongelmat ja ratkaisut
- **Lisäresurssit** - Lisälukemista ja tutkimista

### Edellytysten tarkistus

Ennen jokaista moduulia löydät:
- **Vaadittu tieto** - Mitä sinun tulisi tietää etukäteen
- **Asennuksen validointi** - Kuinka varmistaa ympäristösi toimivuus
- **Aika-arviot** - Odotettu suorittamisaika
- **Oppimistulokset** - Mitä tiedät moduulin jälkeen

### Suositellut oppimispolut

Valitse polku kokemustasosi mukaan:

#### 🟢 **Aloittelijapolku** (Uusi MCP:n parissa)
1. Aloita [MCP aloittelijoille](https://aka.ms/mcp-for-beginners)
2. Suorita moduulit 00-03 perusteiden ymmärtämiseksi
3. Seuraa moduuleja 04-06 käytännön rakentamiseen
4. Kokeile moduuleja 07-09 käytännön käyttöön

#### 🟡 **Keskitasopolku** (Jonkin verran MCP-kokemusta)
1. Tarkista moduulit 00-01 tietokantakohtaisista käsitteistä
2. Keskity moduuleihin 02-06 toteutukseen
3. Syvenny moduuleihin 07-12 edistyneisiin ominaisuuksiin

#### 🔴 **Edistyneempi polku** (Kokenut MCP:n parissa)
1. Silmäile moduulit 00-03 kontekstin vuoksi
2. Keskity moduuleihin 04-09 tietokantaintegraatioon
3. Paneudu moduuleihin 10-12 tuotantojulkaisuun

## 🛠️ Kuinka käyttää oppimispolkua tehokkaasti

### Järjestelmällinen oppiminen (suositeltu)

Käy moduulit läpi järjestyksessä saadaksesi kattavan ymmärryksen:

1. **Lue yleiskatsaus** - Ymmärrä, mitä opit
2. **Tarkista edellytykset** - Varmista tarvittava tieto
3. **Seuraa askel askeleelta ohjeita** - Toteuta oppimisen aikana
4. **Tee harjoituksia** - Vahvista ymmärrystäsi
5. **Käy läpi keskeiset asiat** - Vakiinnuta oppimistulokset

### Kohdennettu oppiminen

Jos tarvitset tiettyjä taitoja:

- **Tietokantaintegraatio**: Keskity moduuleihin 04-06
- **Tietoturvan toteutus**: Paneudu moduuleihin 02, 08, 12
- **AI/Semanttinen haku**: Syvenny moduuliin 07
- **Tuotantojulkaisu**: Tutki moduuleja 10-12

### Käytännön harjoittelu

Jokainen moduuli sisältää:
- **Toimivia koodiesimerkkejä** - Kopioi, muokkaa ja kokeile
- **Todellisia skenaarioita** - Käytännön vähittäiskaupan analytiikan käyttötapauksia
- **Progressiivista monimutkaisuutta** - Rakentaminen yksinkertaisesta edistyneeseen
- **Validointivaiheita** - Varmista toteutuksesi toimivuus

## 🌟 Yhteisö ja tuki

### Hanki apua

- **Azure AI Discord**: [Liity asiantuntijatukeen](https://discord.com/invite/ByRwuEEgH4)
- **GitHub-ongelmat**: [Ilmoita ongelmista tai kysy kysymyksiä](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP-yhteisö**: [Osallistu laajempiin MCP-keskusteluihin](https://github.com/orgs/modelcontextprotocol/discussions)

### Anna panoksesi

Otamme mielellämme vastaan parannusehdotuksia oppimispolkuun:
- **Korjaa virheitä tai kirjoitusvirheitä** - Lähetä pull requesteja
- **Lisää esimerkkejä** - Jaa toteutuksesi
- **Paranna dokumentaatiota** - Auta muita oppimaan
- **Ilmoita ongelmista** - Auta meitä korjaamaan ongelmia

## 📜 Lisenssitiedot

Tämä oppimissisältö on lisensoitu MIT-lisenssillä. Katso [LICENSE](../../../LICENSE) tiedosto ehtoihin ja käyttöehtoihin.

## 🚀 Valmis aloittamaan?

Aloita matkasi **[Moduuli 00: Johdatus MCP-tietokantaintegraatioon](./00-Introduction/README.md)**

---

*Hallitse tuotantovalmiiden MCP-palvelimien rakentaminen tietokantaintegraatiolla tämän kattavan, käytännönläheisen oppimiskokemuksen avulla.*

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.