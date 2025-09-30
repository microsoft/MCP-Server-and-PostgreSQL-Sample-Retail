<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:42+00:00",
  "source_file": "azd/README.md",
  "language_code": "sw"
}
-->
# Azure Developer CLI (azd) Mwongozo wa Haraka

## 🚀 Tumia Azure Developer CLI kwa Uwekaji

Mradi huu sasa unakubaliana kikamilifu na Azure Developer CLI (azd) kwa uwekaji wa kiotomatiki wa miundombinu na programu ya seva ya MCP.

### Mahitaji ya Awali

1. **Sakinisha Azure Developer CLI**:
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

2. **Ingia kwenye Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Uwekaji kwa Amri Moja

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

### 🔧 Mtiririko wa Maendeleo

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

### 📦 Nini Kinachowekwa

#### **Miundombinu**
- Kikundi cha Rasilimali
- Workspace ya Log Analytics  
- Application Insights
- Huduma za Azure AI (na mifano ya OpenAI)
- Mazingira ya Programu ya Kontena

#### **Programu**
- Seva ya MCP (Programu ya Kontena)
- Ufuatiliaji wa afya umewezeshwa
- Vigezo vya mazingira vimewekwa
- Ushirikiano wa Application Insights

### 🌍 Vigezo vya Mazingira

Baada ya uwekaji, vigezo hivi vinapatikana kiotomatiki:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Ufuatiliaji na Usimamizi

- **Azure Portal**: Tazama rasilimali zote katika kikundi chako cha rasilimali
- **Application Insights**: Fuatilia utendaji wa programu na kumbukumbu
- **Container Apps**: Tazama kumbukumbu za programu na vipimo
- **AI Studio**: Simamia uwekaji wa mifano ya OpenAI

### 📋 Utatuzi wa Matatizo

#### **Masuala ya Kawaida**

1. **Eneo halikubaliki**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Kiwango cha rasilimali kimezidi**:
   - Angalia mipaka ya usajili wako kwenye Azure Portal
   - Jaribu eneo tofauti

3. **Masuala ya uthibitishaji**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Tazama kumbukumbu za uwekaji**:
   ```bash
   azd show --output json
   ```

### 🔄 Njia Mbadala: Uwekaji wa Kawaida

Ikiwa unapendelea uwekaji wa kawaida, bado unaweza kutumia miundombinu katika folda ya `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Jifunze Zaidi

- [Nyaraka za Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Nyaraka za Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Nyaraka za Huduma za Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.