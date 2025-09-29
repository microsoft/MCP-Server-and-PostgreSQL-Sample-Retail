<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e48814ac77933e8d1d0fd267e1184864",
  "translation_date": "2025-09-29T18:18:40+00:00",
  "source_file": "walkthrough/03-Setup/README.md",
  "language_code": "pl"
}
-->
# Konfiguracja Środowiska

## 🎯 Co Obejmuje Ten Moduł

Ten praktyczny moduł przeprowadzi Cię przez proces konfiguracji kompletnego środowiska deweloperskiego do tworzenia serwerów MCP z integracją PostgreSQL. Skonfigurujesz wszystkie niezbędne narzędzia, wdrożysz zasoby Azure i zweryfikujesz swoje środowisko przed rozpoczęciem implementacji.

## Przegląd

Odpowiednie środowisko deweloperskie jest kluczowe dla sukcesu w tworzeniu serwerów MCP. Ten moduł dostarcza szczegółowych instrukcji dotyczących konfiguracji Docker, usług Azure, narzędzi deweloperskich oraz weryfikacji, czy wszystko działa poprawnie razem.

Po ukończeniu tego modułu będziesz mieć w pełni funkcjonalne środowisko deweloperskie gotowe do budowy serwera MCP dla Zava Retail.

## Cele Nauki

Po ukończeniu tego modułu będziesz w stanie:

- **Zainstalować i skonfigurować** wszystkie wymagane narzędzia deweloperskie
- **Wdrożyć zasoby Azure** potrzebne dla serwera MCP
- **Skonfigurować kontenery Docker** dla PostgreSQL i serwera MCP
- **Zweryfikować** konfigurację środowiska za pomocą testowych połączeń
- **Rozwiązywać problemy** związane z konfiguracją i typowe błędy
- **Zrozumieć** przepływ pracy deweloperskiej i strukturę plików

## 📋 Wymagania Wstępne

Przed rozpoczęciem upewnij się, że posiadasz:

### Wymagana Wiedza
- Podstawowa znajomość wiersza poleceń (Windows Command Prompt/PowerShell)
- Zrozumienie zmiennych środowiskowych
- Znajomość systemu kontroli wersji Git
- Podstawowe pojęcia dotyczące Docker (kontenery, obrazy, woluminy)

### Wymagania Systemowe
- **System operacyjny**: Windows 10/11, macOS lub Linux
- **RAM**: Minimum 8GB (zalecane 16GB)
- **Pamięć**: Co najmniej 10GB wolnego miejsca
- **Sieć**: Połączenie internetowe do pobierania i wdrożenia Azure

### Wymagania dotyczące kont
- **Subskrypcja Azure**: Wystarczy darmowy poziom
- **Konto GitHub**: Do dostępu do repozytorium
- **Konto Docker Hub**: (Opcjonalne) Do publikowania niestandardowych obrazów

## 🛠️ Instalacja Narzędzi

### 1. Instalacja Docker Desktop

Docker zapewnia konteneryzowane środowisko dla naszej konfiguracji deweloperskiej.

#### Instalacja na Windows

1. **Pobierz Docker Desktop**:
   ```cmd
   # Visit https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
   # Or use Windows Package Manager
   winget install Docker.DockerDesktop
   ```

2. **Zainstaluj i skonfiguruj**:
   - Uruchom instalator jako Administrator
   - Włącz integrację WSL 2, gdy zostaniesz o to poproszony
   - Uruchom ponownie komputer po zakończeniu instalacji

3. **Zweryfikuj instalację**:
   ```cmd
   docker --version
   docker-compose --version
   ```

#### Instalacja na macOS

1. **Pobierz i zainstaluj**:
   ```bash
   # Download from https://desktop.docker.com/mac/stable/Docker.dmg
   # Or use Homebrew
   brew install --cask docker
   ```

2. **Uruchom Docker Desktop**:
   - Otwórz Docker Desktop z folderu Aplikacje
   - Ukończ początkowy kreator konfiguracji

3. **Zweryfikuj instalację**:
   ```bash
   docker --version
   docker-compose --version
   ```

#### Instalacja na Linux

1. **Zainstaluj Docker Engine**:
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker $USER
   
   # Log out and back in for group changes to take effect
   ```

2. **Zainstaluj Docker Compose**:
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

### 2. Instalacja Azure CLI

Azure CLI umożliwia wdrażanie i zarządzanie zasobami Azure.

#### Instalacja na Windows

```cmd
# Using Windows Package Manager
winget install Microsoft.AzureCLI

# Or download MSI from: https://aka.ms/installazurecliwindows
```

#### Instalacja na macOS

```bash
# Using Homebrew
brew install azure-cli

# Or using installer
curl -L https://aka.ms/InstallAzureCli | bash
```

#### Instalacja na Linux

```bash
# Ubuntu/Debian
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# RHEL/CentOS
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install azure-cli
```

#### Weryfikacja i uwierzytelnienie

```bash
# Check installation
az version

# Login to Azure
az login

# Set default subscription (if you have multiple)
az account list --output table
az account set --subscription "Your-Subscription-Name"
```

### 3. Instalacja Git

Git jest wymagany do klonowania repozytorium i kontroli wersji.

#### Windows

```cmd
# Using Windows Package Manager
winget install Git.Git

# Or download from: https://git-scm.com/download/win
```

#### macOS

```bash
# Git is usually pre-installed, but you can update via Homebrew
brew install git
```

#### Linux

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install git

# RHEL/CentOS
sudo dnf install git
```

### 4. Instalacja VS Code

Visual Studio Code zapewnia zintegrowane środowisko deweloperskie z obsługą MCP.

#### Instalacja

```cmd
# Windows
winget install Microsoft.VisualStudioCode

# macOS
brew install --cask visual-studio-code

# Linux (Ubuntu/Debian)
sudo snap install code --classic
```

#### Wymagane rozszerzenia

Zainstaluj te rozszerzenia VS Code:

```bash
# Install via command line
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-json
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.azure-account
```

Lub zainstaluj przez VS Code:
1. Otwórz VS Code
2. Przejdź do Rozszerzeń (Ctrl+Shift+X)
3. Zainstaluj:
   - **Python** (Microsoft)
   - **Docker** (Microsoft)
   - **Azure Account** (Microsoft)
   - **JSON** (Microsoft)

### 5. Instalacja Python

Python 3.8+ jest wymagany do rozwoju serwera MCP.

#### Windows

```cmd
# Using Windows Package Manager
winget install Python.Python.3.11

# Or download from: https://www.python.org/downloads/
```

#### macOS

```bash
# Using Homebrew
brew install python@3.11
```

#### Linux

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install python3.11 python3.11-pip python3.11-venv

# RHEL/CentOS
sudo dnf install python3.11 python3.11-pip
```

#### Weryfikacja instalacji

```bash
python --version  # Should show Python 3.11.x
pip --version      # Should show pip version
```

## 🚀 Konfiguracja Projektu

### 1. Klonowanie Repozytorium

```bash
# Clone the main repository
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git

# Navigate to the project directory
cd MCP-Server-and-PostgreSQL-Sample-Retail

# Verify repository structure
ls -la
```

### 2. Utworzenie Wirtualnego Środowiska Python

```bash
# Create virtual environment
python -m venv mcp-env

# Activate virtual environment
# Windows
mcp-env\Scripts\activate

# macOS/Linux
source mcp-env/bin/activate

# Upgrade pip
python -m pip install --upgrade pip
```

### 3. Instalacja Zależności Python

```bash
# Install development dependencies
pip install -r requirements.lock.txt

# Verify key packages
pip list | grep fastmcp
pip list | grep asyncpg
pip list | grep azure
```

## ☁️ Wdrożenie Zasobów Azure

### 1. Zrozumienie Wymagań Zasobów

Nasz serwer MCP wymaga następujących zasobów Azure:

| **Zasób** | **Cel** | **Szacowany Koszt** |
|-----------|---------|--------------------|
| **Azure AI Foundry** | Hosting i zarządzanie modelami AI | $10-50/miesiąc |
| **OpenAI Deployment** | Model tekstowy (text-embedding-3-small) | $5-20/miesiąc |
| **Application Insights** | Monitorowanie i telemetria | $5-15/miesiąc |
| **Resource Group** | Organizacja zasobów | Bezpłatne |

### 2. Wdrożenie Zasobów Azure

#### Opcja A: Automatyczne Wdrożenie (Zalecane)

```bash
# Navigate to infrastructure directory
cd infra

# Windows - PowerShell
./deploy.ps1

# macOS/Linux - Bash
./deploy.sh
```

Skrypt wdrożeniowy:
1. Utworzy unikalną grupę zasobów
2. Wdroży zasoby Azure AI Foundry
3. Wdroży model text-embedding-3-small
4. Skonfiguruje Application Insights
5. Utworzy głównego użytkownika usługi do uwierzytelnienia
6. Wygeneruje plik `.env` z konfiguracją

#### Opcja B: Ręczne Wdrożenie

Jeśli preferujesz ręczną kontrolę lub skrypt automatyczny zawiedzie:

```bash
# Set variables
RESOURCE_GROUP="rg-zava-mcp-$(date +%s)"
LOCATION="westus2"
AI_PROJECT_NAME="zava-ai-project"

# Create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Deploy main template
az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file main.bicep \
  --parameters location=$LOCATION \
  --parameters resourcePrefix="zava-mcp"
```

### 3. Weryfikacja Wdrożenia Azure

```bash
# Check resource group
az group show --name $RESOURCE_GROUP --output table

# List deployed resources
az resource list --resource-group $RESOURCE_GROUP --output table

# Test AI service
az cognitiveservices account show \
  --name "your-ai-service-name" \
  --resource-group $RESOURCE_GROUP
```

### 4. Konfiguracja Zmiennych Środowiskowych

Po wdrożeniu powinieneś mieć plik `.env`. Zweryfikuj, czy zawiera:

```bash
# .env file contents
PROJECT_ENDPOINT=https://your-project.cognitiveservices.azure.com/
AZURE_OPENAI_ENDPOINT=https://your-openai.openai.azure.com/
EMBEDDING_MODEL_DEPLOYMENT_NAME=text-embedding-3-small
AZURE_CLIENT_ID=your-client-id
AZURE_CLIENT_SECRET=your-client-secret
AZURE_TENANT_ID=your-tenant-id
APPLICATIONINSIGHTS_CONNECTION_STRING=InstrumentationKey=your-key;...

# Database configuration (for development)
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=zava
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your-secure-password
```

## 🐳 Konfiguracja Środowiska Docker

### 1. Zrozumienie Kompozycji Docker

Nasze środowisko deweloperskie korzysta z Docker Compose:

```yaml
# docker-compose.yml overview
version: '3.8'
services:
  postgres:
    image: pgvector/pgvector:pg17
    environment:
      POSTGRES_DB: zava
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD:-secure_password}
    ports:
      - "5432:5432"
    volumes:
      - ./data:/backup_data:ro
      - ./docker-init:/docker-entrypoint-initdb.d:ro
    
  mcp_server:
    build: .
    depends_on:
      postgres:
        condition: service_healthy
    ports:
      - "8000:8000"
    env_file:
      - .env
```

### 2. Uruchomienie Środowiska Deweloperskiego

```bash
# Ensure you're in the project root directory
cd /path/to/MCP-Server-and-PostgreSQL-Sample-Retail

# Start the services
docker-compose up -d

# Check service status
docker-compose ps

# View logs
docker-compose logs -f
```

### 3. Weryfikacja Konfiguracji Bazy Danych

```bash
# Connect to PostgreSQL container
docker-compose exec postgres psql -U postgres -d zava

# Check database structure
\dt retail.*

# Verify sample data
SELECT COUNT(*) FROM retail.stores;
SELECT COUNT(*) FROM retail.products;
SELECT COUNT(*) FROM retail.orders;

# Exit PostgreSQL
\q
```

### 4. Testowanie Serwera MCP

```bash
# Check MCP server health
curl http://localhost:8000/health

# Test basic MCP endpoint
curl -X POST http://localhost:8000/mcp \
  -H "Content-Type: application/json" \
  -H "x-rls-user-id: 00000000-0000-0000-0000-000000000000" \
  -d '{"method": "tools/list", "params": {}}'
```

## 🔧 Konfiguracja VS Code

### 1. Konfiguracja Integracji MCP

Utwórz konfigurację MCP w VS Code:

```json
// .vscode/mcp.json
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
        }
    },
    "inputs": []
}
```

### 2. Konfiguracja Środowiska Python

```json
// .vscode/settings.json
{
    "python.defaultInterpreterPath": "./mcp-env/bin/python",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.formatting.provider": "black",
    "python.testing.pytestEnabled": true,
    "python.testing.pytestArgs": ["tests"],
    "files.exclude": {
        "**/__pycache__": true,
        "**/.pytest_cache": true,
        "**/mcp-env": true
    }
}
```

### 3. Testowanie Integracji VS Code

1. **Otwórz projekt w VS Code**:
   ```bash
   code .
   ```

2. **Otwórz AI Chat**:
   - Naciśnij `Ctrl+Shift+P` (Windows/Linux) lub `Cmd+Shift+P` (macOS)
   - Wpisz "AI Chat" i wybierz "AI Chat: Open Chat"

3. **Testowanie Połączenia z Serwerem MCP**:
   - W AI Chat wpisz `#zava` i wybierz jeden z skonfigurowanych serwerów
   - Zapytaj: "Jakie tabele są dostępne w bazie danych?"
   - Powinieneś otrzymać odpowiedź z listą tabel w bazie danych detalicznej

## ✅ Walidacja Środowiska

### 1. Kompleksowa Weryfikacja Systemu

Uruchom ten skrypt walidacyjny, aby zweryfikować konfigurację:

```bash
# Create validation script
cat > validate_setup.py << 'EOF'
#!/usr/bin/env python3
"""
Environment validation script for MCP Server setup.
"""
import asyncio
import os
import sys
import subprocess
import requests
import asyncpg
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient

async def validate_environment():
    """Comprehensive environment validation."""
    results = {}
    
    # Check Python version
    python_version = sys.version_info
    results['python'] = {
        'status': 'pass' if python_version >= (3, 8) else 'fail',
        'version': f"{python_version.major}.{python_version.minor}.{python_version.micro}",
        'required': '3.8+'
    }
    
    # Check required packages
    required_packages = ['fastmcp', 'asyncpg', 'azure-ai-projects']
    for package in required_packages:
        try:
            __import__(package)
            results[f'package_{package}'] = {'status': 'pass'}
        except ImportError:
            results[f'package_{package}'] = {'status': 'fail', 'error': 'Not installed'}
    
    # Check Docker
    try:
        result = subprocess.run(['docker', '--version'], capture_output=True, text=True)
        results['docker'] = {
            'status': 'pass' if result.returncode == 0 else 'fail',
            'version': result.stdout.strip() if result.returncode == 0 else 'Not available'
        }
    except FileNotFoundError:
        results['docker'] = {'status': 'fail', 'error': 'Docker not found'}
    
    # Check Azure CLI
    try:
        result = subprocess.run(['az', '--version'], capture_output=True, text=True)
        results['azure_cli'] = {
            'status': 'pass' if result.returncode == 0 else 'fail',
            'version': result.stdout.split('\n')[0] if result.returncode == 0 else 'Not available'
        }
    except FileNotFoundError:
        results['azure_cli'] = {'status': 'fail', 'error': 'Azure CLI not found'}
    
    # Check environment variables
    required_env_vars = [
        'PROJECT_ENDPOINT',
        'AZURE_OPENAI_ENDPOINT',
        'EMBEDDING_MODEL_DEPLOYMENT_NAME',
        'AZURE_CLIENT_ID',
        'AZURE_CLIENT_SECRET',
        'AZURE_TENANT_ID'
    ]
    
    for var in required_env_vars:
        value = os.getenv(var)
        results[f'env_{var}'] = {
            'status': 'pass' if value else 'fail',
            'value': '***' if value and 'SECRET' in var else value
        }
    
    # Check database connection
    try:
        conn = await asyncpg.connect(
            host=os.getenv('POSTGRES_HOST', 'localhost'),
            port=int(os.getenv('POSTGRES_PORT', 5432)),
            database=os.getenv('POSTGRES_DB', 'zava'),
            user=os.getenv('POSTGRES_USER', 'postgres'),
            password=os.getenv('POSTGRES_PASSWORD', 'secure_password')
        )
        
        # Test query
        result = await conn.fetchval('SELECT COUNT(*) FROM retail.stores')
        await conn.close()
        
        results['database'] = {
            'status': 'pass',
            'store_count': result
        }
    except Exception as e:
        results['database'] = {
            'status': 'fail',
            'error': str(e)
        }
    
    # Check MCP server
    try:
        response = requests.get('http://localhost:8000/health', timeout=5)
        results['mcp_server'] = {
            'status': 'pass' if response.status_code == 200 else 'fail',
            'response': response.json() if response.status_code == 200 else response.text
        }
    except Exception as e:
        results['mcp_server'] = {
            'status': 'fail',
            'error': str(e)
        }
    
    # Check Azure AI service
    try:
        credential = DefaultAzureCredential()
        project_client = AIProjectClient(
            endpoint=os.getenv('PROJECT_ENDPOINT'),
            credential=credential
        )
        
        # This will fail if credentials are invalid
        results['azure_ai'] = {'status': 'pass'}
        
    except Exception as e:
        results['azure_ai'] = {
            'status': 'fail',
            'error': str(e)
        }
    
    return results

def print_results(results):
    """Print formatted validation results."""
    print("🔍 Environment Validation Results\n")
    print("=" * 50)
    
    passed = 0
    failed = 0
    
    for component, result in results.items():
        status = result.get('status', 'unknown')
        if status == 'pass':
            print(f"✅ {component}: PASS")
            passed += 1
        else:
            print(f"❌ {component}: FAIL")
            if 'error' in result:
                print(f"   Error: {result['error']}")
            failed += 1
    
    print("\n" + "=" * 50)
    print(f"Summary: {passed} passed, {failed} failed")
    
    if failed > 0:
        print("\n❗ Please fix the failed components before proceeding.")
        return False
    else:
        print("\n🎉 All validations passed! Your environment is ready.")
        return True

if __name__ == "__main__":
    asyncio.run(main())

async def main():
    results = await validate_environment()
    success = print_results(results)
    sys.exit(0 if success else 1)

EOF

# Run validation
python validate_setup.py
```

### 2. Lista Kontrolna Walidacji Manualnej

**✅ Podstawowe Narzędzia**
- [ ] Zainstalowany i uruchomiony Docker w wersji 20.10+
- [ ] Zainstalowany i uwierzytelniony Azure CLI w wersji 2.40+
- [ ] Zainstalowany Python 3.8+ z pip
- [ ] Zainstalowany Git w wersji 2.30+
- [ ] VS Code z wymaganymi rozszerzeniami

**✅ Zasoby Azure**
- [ ] Utworzona grupa zasobów
- [ ] Wdrożony projekt AI Foundry
- [ ] Wdrożony model text-embedding-3-small
- [ ] Skonfigurowane Application Insights
- [ ] Utworzony główny użytkownik usługi z odpowiednimi uprawnieniami

**✅ Konfiguracja Środowiska**
- [ ] Utworzony plik `.env` z wszystkimi wymaganymi zmiennymi
- [ ] Działające poświadczenia Azure (test z `az account show`)
- [ ] Działający i dostępny kontener PostgreSQL
- [ ] Załadowane dane przykładowe w bazie danych

**✅ Integracja VS Code**
- [ ] Skonfigurowany plik `.vscode/mcp.json`
- [ ] Interpreter Python ustawiony na wirtualne środowisko
- [ ] Serwery MCP widoczne w AI Chat
- [ ] Możliwość wykonywania zapytań testowych przez AI Chat

## 🛠️ Rozwiązywanie Typowych Problemów

### Problemy z Docker

**Problem**: Kontenery Docker nie uruchamiają się
```bash
# Check Docker service status
docker info

# Check available resources
docker system df

# Clean up if needed
docker system prune -f

# Restart Docker Desktop (Windows/macOS)
# Or restart Docker service (Linux)
sudo systemctl restart docker
```

**Problem**: Połączenie z PostgreSQL nie powiodło się
```bash
# Check container logs
docker-compose logs postgres

# Verify container is healthy
docker-compose ps

# Test direct connection
docker-compose exec postgres psql -U postgres -d zava -c "SELECT 1;"
```

### Problemy z Wdrożeniem Azure

**Problem**: Wdrożenie Azure nie powiodło się
```bash
# Check Azure CLI authentication
az account show

# Verify subscription permissions
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Check resource provider registration
az provider register --namespace Microsoft.CognitiveServices
az provider register --namespace Microsoft.Insights
```

**Problem**: Uwierzytelnienie usługi AI nie powiodło się
```bash
# Test service principal
az login --service-principal \
  --username $AZURE_CLIENT_ID \
  --password $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID

# Verify AI service deployment
az cognitiveservices account list --query "[].{Name:name,Kind:kind,Location:location}"
```

### Problemy ze Środowiskiem Python

**Problem**: Instalacja pakietów nie powiodła się
```bash
# Upgrade pip and setuptools
python -m pip install --upgrade pip setuptools wheel

# Clear pip cache
pip cache purge

# Install packages one by one to identify issues
pip install fastmcp
pip install asyncpg
pip install azure-ai-projects
```

**Problem**: VS Code nie może znaleźć interpretera Python
```bash
# Show Python interpreter paths
which python  # macOS/Linux
where python  # Windows

# Activate virtual environment first
source mcp-env/bin/activate  # macOS/Linux
mcp-env\Scripts\activate     # Windows

# Then open VS Code
code .
```

## 🎯 Kluczowe Wnioski

Po ukończeniu tego modułu powinieneś mieć:

✅ **Kompletne Środowisko Deweloperskie**: Wszystkie narzędzia zainstalowane i skonfigurowane  
✅ **Wdrożone Zasoby Azure**: Usługi AI i infrastruktura wspierająca  
✅ **Działające Środowisko Docker**: Kontenery PostgreSQL i serwera MCP  
✅ **Integracja VS Code**: Skonfigurowane i dostępne serwery MCP  
✅ **Zweryfikowaną Konfigurację**: Wszystkie komponenty przetestowane i działające razem  
✅ **Wiedzę o Rozwiązywaniu Problemów**: Typowe problemy i ich rozwiązania  

## 🚀 Co Dalej

Z gotowym środowiskiem przejdź do **[Modułu 04: Projektowanie Bazy Danych i Schemat](../04-Database/README.md)**, aby:

- Szczegółowo poznać schemat bazy danych detalicznej
- Zrozumieć modelowanie danych dla wielu najemców
- Dowiedzieć się o implementacji zabezpieczeń na poziomie wierszy
- Pracować z przykładowymi danymi detalicznymi

## 📚 Dodatkowe Zasoby

### Narzędzia Deweloperskie
- [Dokumentacja Docker](https://docs.docker.com/) - Kompletny przewodnik po Docker
- [Referencje Azure CLI](https://docs.microsoft.com/cli/azure/) - Polecenia Azure CLI
- [Dokumentacja VS Code](https://code.visualstudio.com/docs) - Konfiguracja edytora i rozszerzenia

### Usługi Azure
- [Dokumentacja Azure AI Foundry](https://docs.microsoft.com/azure/ai-foundry/) - Konfiguracja usług AI
- [Usługa Azure OpenAI](https://docs.microsoft.com/azure/cognitive-services/openai/) - Wdrożenie modeli AI
- [Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) - Konfiguracja monitorowania

### Rozwój Python
- [Wirtualne Środowiska Python](https://docs.python.org/3/tutorial/venv.html) - Zarządzanie środowiskami
- [Dokumentacja AsyncIO](https://docs.python.org/3/library/asyncio.html) - Wzorce programowania asynchronicznego
- [Dokumentacja FastAPI](https://fastapi.tiangolo.com/) - Wzorce frameworka webowego

---

**Dalej**: Gotowe środowisko? Kontynuuj z [Modułem 04: Projektowanie Bazy Danych i Schemat](../04-Database/README.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.