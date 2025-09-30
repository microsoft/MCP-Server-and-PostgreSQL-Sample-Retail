<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:23:07+00:00",
  "source_file": "azd/README.md",
  "language_code": "pl"
}
-->
# Azure Developer CLI (azd) Szybki Start

## 🚀 Wdrażanie z Azure Developer CLI

Ten projekt jest teraz w pełni kompatybilny z Azure Developer CLI (azd) do automatycznego wdrażania zarówno infrastruktury, jak i aplikacji serwera MCP.

### Wymagania wstępne

1. **Zainstaluj Azure Developer CLI**:
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

2. **Zaloguj się do Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Wdrażanie jednym poleceniem

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

### 🔧 Przepływ pracy dla programistów

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

### 📦 Co jest wdrażane

#### **Infrastruktura**
- Grupa zasobów
- Log Analytics Workspace  
- Application Insights
- Usługi Azure AI (z modelami OpenAI)
- Środowisko aplikacji kontenerowych

#### **Aplikacja**
- Serwer MCP (Aplikacja kontenerowa)
- Włączone monitorowanie stanu
- Skonfigurowane zmienne środowiskowe
- Integracja z Application Insights

### 🌍 Zmienne środowiskowe

Po wdrożeniu te zmienne są automatycznie dostępne:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitorowanie i zarządzanie

- **Azure Portal**: Przeglądaj wszystkie zasoby w swojej grupie zasobów
- **Application Insights**: Monitoruj wydajność aplikacji i logi
- **Container Apps**: Przeglądaj logi i metryki aplikacji
- **AI Studio**: Zarządzaj wdrożeniami modeli OpenAI

### 📋 Rozwiązywanie problemów

#### **Typowe problemy**

1. **Lokalizacja nieobsługiwana**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Przekroczone limity zasobów**:
   - Sprawdź limity subskrypcji w Azure Portal
   - Spróbuj użyć innego regionu

3. **Problemy z uwierzytelnianiem**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Przeglądaj logi wdrożenia**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatywa: Ręczne wdrażanie

Jeśli wolisz ręczne wdrażanie, nadal możesz użyć infrastruktury w folderze `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Dowiedz się więcej

- [Dokumentacja Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentacja Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentacja Usług Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.