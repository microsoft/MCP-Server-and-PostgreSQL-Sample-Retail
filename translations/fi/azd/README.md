<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:24:29+00:00",
  "source_file": "azd/README.md",
  "language_code": "fi"
}
-->
# Azure Developer CLI (azd) Pikaopas

## 🚀 Käyttöönotto Azure Developer CLI:llä

Tämä projekti on nyt täysin yhteensopiva Azure Developer CLI:n (azd) kanssa, mikä mahdollistaa infrastruktuurin ja MCP-palvelinsovelluksen automatisoidun käyttöönoton.

### Esivaatimukset

1. **Asenna Azure Developer CLI**:
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **Kirjaudu sisään Azureen**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Käyttöönotto yhdellä komennolla

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 Kehitystyön kulku

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 Mitä otetaan käyttöön

#### **Infrastruktuuri**
- Resurssiryhmä
- Log Analytics -työtila  
- Application Insights
- Azure AI -palvelut (OpenAI-mallit)
- Container App -ympäristö

#### **Sovellus**
- MCP-palvelin (Container App)
- Terveydentilan seuranta käytössä
- Ympäristömuuttujat määritetty
- Application Insights -integraatio

### 🌍 Ympäristömuuttujat

Käyttöönoton jälkeen nämä muuttujat ovat automaattisesti käytettävissä:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Seuranta ja hallinta

- **Azure Portal**: Näytä kaikki resurssit resurssiryhmässäsi
- **Application Insights**: Seuraa sovelluksen suorituskykyä ja lokitietoja
- **Container Apps**: Näytä sovelluksen lokit ja mittarit
- **AI Studio**: Hallitse OpenAI-mallien käyttöönottoja

### 📋 Vianmääritys

#### **Yleiset ongelmat**

1. **Sijainti ei tuettu**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Resurssikiintiöt ylitetty**:
   - Tarkista tilauksesi rajat Azure Portalissa
   - Kokeile eri aluetta

3. **Todennusongelmat**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Näytä käyttöönoton lokit**:
   ```bash
   azd show --output json
   ```

### 🔄 Vaihtoehto: Manuaalinen käyttöönotto

Jos haluat mieluummin tehdä käyttöönoton manuaalisesti, voit silti käyttää `/infra`-kansion infrastruktuuria:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Lisätietoja

- [Azure Developer CLI -dokumentaatio](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps -dokumentaatio](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI -palveluiden dokumentaatio](https://docs.microsoft.com/azure/ai-services/)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.