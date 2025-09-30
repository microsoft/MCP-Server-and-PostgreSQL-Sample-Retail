<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e48814ac77933e8d1d0fd267e1184864",
  "translation_date": "2025-09-30T07:12:54+00:00",
  "source_file": "walkthrough/03-Setup/README.md",
  "language_code": "hr"
}
-->
# Postavljanje okruženja

## 🎯 Što pokriva ovaj modul

Ovaj praktični modul vodi vas kroz postavljanje kompletnog razvojnog okruženja za izradu MCP servera s integracijom PostgreSQL-a. Konfigurirat ćete sve potrebne alate, implementirati Azure resurse i provjeriti postavke prije nego što krenete s implementacijom.

## Pregled

Pravilno razvojno okruženje ključno je za uspješan razvoj MCP servera. Ovaj modul pruža detaljne upute za postavljanje Dockera, Azure usluga, razvojnih alata i provjeru da sve ispravno funkcionira zajedno.

Na kraju ovog modula imat ćete potpuno funkcionalno razvojno okruženje spremno za izradu Zava Retail MCP servera.

## Ciljevi učenja

Na kraju ovog modula moći ćete:

- **Instalirati i konfigurirati** sve potrebne razvojne alate
- **Implementirati Azure resurse** potrebne za MCP server
- **Postaviti Docker kontejnere** za PostgreSQL i MCP server
- **Provjeriti** postavke okruženja testnim vezama
- **Rješavati probleme** uobičajenih postavki i konfiguracija
- **Razumjeti** tijek razvoja i strukturu datoteka

## 📋 Provjera preduvjeta

Prije početka, osigurajte da imate:

### Potrebno znanje
- Osnovno korištenje naredbenog retka (Windows Command Prompt/PowerShell)
- Razumijevanje varijabli okruženja
- Poznavanje Git verzioniranja
- Osnovni koncepti Dockera (kontejneri, slike, volumeni)

### Sistemski zahtjevi
- **Operativni sustav**: Windows 10/11, macOS ili Linux
- **RAM**: Minimalno 8GB (preporučeno 16GB)
- **Pohrana**: Najmanje 10GB slobodnog prostora
- **Mreža**: Internetska veza za preuzimanja i implementaciju na Azure

### Zahtjevi za račune
- **Azure pretplata**: Besplatni plan je dovoljan
- **GitHub račun**: Za pristup repozitoriju
- **Docker Hub račun**: (Opcionalno) Za objavljivanje prilagođenih slika

## 🛠️ Instalacija alata

### 1. Instalirajte Docker Desktop

Docker pruža okruženje s kontejnerima za naš razvojni sustav.

#### Instalacija na Windowsu

1. **Preuzmite Docker Desktop**:
   ```cmd
   # Visit https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
   # Or use Windows Package Manager
   winget install Docker.DockerDesktop
   ```

2. **Instalirajte i konfigurirajte**:
   - Pokrenite instalacijski program kao administrator
   - Omogućite integraciju s WSL 2 kada se to zatraži
   - Ponovno pokrenite računalo nakon završetka instalacije

3. **Provjerite instalaciju**:
   ```cmd
   docker --version
   docker-compose --version
   ```

#### Instalacija na macOS-u

1. **Preuzmite i instalirajte**:
   ```bash
   # Download from https://desktop.docker.com/mac/stable/Docker.dmg
   # Or use Homebrew
   brew install --cask docker
   ```

2. **Pokrenite Docker Desktop**:
   - Pokrenite Docker Desktop iz aplikacija
   - Dovršite početni čarobnjak za postavljanje

3. **Provjerite instalaciju**:
   ```bash
   docker --version
   docker-compose --version
   ```

#### Instalacija na Linuxu

1. **Instalirajte Docker Engine**:
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker $USER
   
   # Log out and back in for group changes to take effect
   ```

2. **Instalirajte Docker Compose**:
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

### 2. Instalirajte Azure CLI

Azure CLI omogućuje implementaciju i upravljanje Azure resursima.

#### Instalacija na Windowsu

```cmd
# Using Windows Package Manager
winget install Microsoft.AzureCLI

# Or download MSI from: https://aka.ms/installazurecliwindows
```

#### Instalacija na macOS-u

```bash
# Using Homebrew
brew install azure-cli

# Or using installer
curl -L https://aka.ms/InstallAzureCli | bash
```

#### Instalacija na Linuxu

```bash
# Ubuntu/Debian
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# RHEL/CentOS
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install azure-cli
```

#### Provjera i autentifikacija

```bash
# Check installation
az version

# Login to Azure
az login

# Set default subscription (if you have multiple)
az account list --output table
az account set --subscription "Your-Subscription-Name"
```

### 3. Instalirajte Git

Git je potreban za kloniranje repozitorija i verzioniranje.

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

### 4. Instalirajte VS Code

Visual Studio Code pruža integrirano razvojno okruženje s podrškom za MCP.

#### Instalacija

```cmd
# Windows
winget install Microsoft.VisualStudioCode

# macOS
brew install --cask visual-studio-code

# Linux (Ubuntu/Debian)
sudo snap install code --classic
```

#### Potrebni dodaci

Instalirajte ove dodatke za VS Code:

```bash
# Install via command line
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-json
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.azure-account
```

Ili instalirajte putem VS Code-a:
1. Otvorite VS Code
2. Idite na Dodaci (Ctrl+Shift+X)
3. Instalirajte:
   - **Python** (Microsoft)
   - **Docker** (Microsoft)
   - **Azure Account** (Microsoft)
   - **JSON** (Microsoft)

### 5. Instalirajte Python

Python 3.8+ potreban je za razvoj MCP servera.

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

#### Provjera instalacije

```bash
python --version  # Should show Python 3.11.x
pip --version      # Should show pip version
```

## 🚀 Postavljanje projekta

### 1. Klonirajte repozitorij

```bash
# Clone the main repository
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git

# Navigate to the project directory
cd MCP-Server-and-PostgreSQL-Sample-Retail

# Verify repository structure
ls -la
```

### 2. Kreirajte Python virtualno okruženje

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

### 3. Instalirajte Python ovisnosti

```bash
# Install development dependencies
pip install -r requirements.lock.txt

# Verify key packages
pip list | grep fastmcp
pip list | grep asyncpg
pip list | grep azure
```

## ☁️ Implementacija Azure resursa

### 1. Razumijevanje zahtjeva za resurse

Naš MCP server zahtijeva ove Azure resurse:

| **Resurs** | **Svrha** | **Procijenjeni trošak** |
|------------|-----------|-------------------------|
| **Azure AI Foundry** | Hosting i upravljanje AI modelima | $10-50/mjesečno |
| **OpenAI implementacija** | Model za tekstualno ugrađivanje (text-embedding-3-small) | $5-20/mjesečno |
| **Application Insights** | Praćenje i telemetrija | $5-15/mjesečno |
| **Resource Group** | Organizacija resursa | Besplatno |

### 2. Implementirajte Azure resurse

#### Opcija A: Automatska implementacija (preporučeno)

```bash
# Navigate to infrastructure directory
cd infra

# Windows - PowerShell
./deploy.ps1

# macOS/Linux - Bash
./deploy.sh
```

Skripta za implementaciju će:
1. Kreirati jedinstvenu grupu resursa
2. Implementirati Azure AI Foundry resurse
3. Implementirati model text-embedding-3-small
4. Konfigurirati Application Insights
5. Kreirati servisni principal za autentifikaciju
6. Generirati `.env` datoteku s konfiguracijom

#### Opcija B: Ručna implementacija

Ako preferirate ručnu kontrolu ili automatska skripta ne uspije:

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

### 3. Provjerite implementaciju na Azureu

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

### 4. Konfigurirajte varijable okruženja

Nakon implementacije trebali biste imati `.env` datoteku. Provjerite sadrži li:

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

## 🐳 Postavljanje Docker okruženja

### 1. Razumijevanje Docker kompozicije

Naše razvojno okruženje koristi Docker Compose:

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

### 2. Pokrenite razvojno okruženje

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

### 3. Provjerite postavke baze podataka

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

### 4. Testirajte MCP server

```bash
# Check MCP server health
curl http://localhost:8000/health

# Test basic MCP endpoint
curl -X POST http://localhost:8000/mcp \
  -H "Content-Type: application/json" \
  -H "x-rls-user-id: 00000000-0000-0000-0000-000000000000" \
  -d '{"method": "tools/list", "params": {}}'
```

## 🔧 Konfiguracija VS Code-a

### 1. Konfigurirajte MCP integraciju

Kreirajte VS Code MCP konfiguraciju:

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

### 2. Konfigurirajte Python okruženje

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

### 3. Testirajte integraciju VS Code-a

1. **Otvorite projekt u VS Code-u**:
   ```bash
   code .
   ```

2. **Otvorite AI Chat**:
   - Pritisnite `Ctrl+Shift+P` (Windows/Linux) ili `Cmd+Shift+P` (macOS)
   - Upišite "AI Chat" i odaberite "AI Chat: Open Chat"

3. **Testirajte vezu s MCP serverom**:
   - U AI Chatu upišite `#zava` i odaberite jedan od konfiguriranih servera
   - Pitajte: "Koje tablice su dostupne u bazi podataka?"
   - Trebali biste dobiti odgovor s popisom tablica maloprodajne baze podataka

## ✅ Validacija okruženja

### 1. Sveobuhvatna provjera sustava

Pokrenite ovu skriptu za validaciju postavki:

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

### 2. Ručna provjera

**✅ Osnovni alati**
- [ ] Instaliran i pokrenut Docker verzije 20.10+
- [ ] Instaliran i autentificiran Azure CLI verzije 2.40+
- [ ] Instaliran Python 3.8+ s pip-om
- [ ] Instaliran Git verzije 2.30+
- [ ] Instaliran VS Code s potrebnim dodacima

**✅ Azure resursi**
- [ ] Uspješno kreirana grupa resursa
- [ ] Implementiran AI Foundry projekt
- [ ] Implementiran OpenAI model text-embedding-3-small
- [ ] Konfiguriran Application Insights
- [ ] Kreiran servisni principal s odgovarajućim dozvolama

**✅ Konfiguracija okruženja**
- [ ] Kreirana `.env` datoteka sa svim potrebnim varijablama
- [ ] Azure vjerodajnice rade (testirajte s `az account show`)
- [ ] PostgreSQL kontejner pokrenut i dostupan
- [ ] Učitan uzorak podataka u bazu

**✅ Integracija VS Code-a**
- [ ] Konfiguriran `.vscode/mcp.json`
- [ ] Python interpreter postavljen na virtualno okruženje
- [ ] MCP serveri se pojavljuju u AI Chatu
- [ ] Moguće izvršiti testne upite putem AI Chata

## 🛠️ Rješavanje uobičajenih problema

### Problemi s Dockerom

**Problem**: Docker kontejneri se ne pokreću
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

**Problem**: Veza s PostgreSQL-om ne uspijeva
```bash
# Check container logs
docker-compose logs postgres

# Verify container is healthy
docker-compose ps

# Test direct connection
docker-compose exec postgres psql -U postgres -d zava -c "SELECT 1;"
```

### Problemi s implementacijom na Azureu

**Problem**: Implementacija na Azureu ne uspijeva
```bash
# Check Azure CLI authentication
az account show

# Verify subscription permissions
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Check resource provider registration
az provider register --namespace Microsoft.CognitiveServices
az provider register --namespace Microsoft.Insights
```

**Problem**: Autentifikacija AI usluge ne uspijeva
```bash
# Test service principal
az login --service-principal \
  --username $AZURE_CLIENT_ID \
  --password $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID

# Verify AI service deployment
az cognitiveservices account list --query "[].{Name:name,Kind:kind,Location:location}"
```

### Problemi s Python okruženjem

**Problem**: Instalacija paketa ne uspijeva
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

**Problem**: VS Code ne može pronaći Python interpreter
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

## 🎯 Ključni zaključci

Nakon završetka ovog modula trebali biste imati:

✅ **Kompletno razvojno okruženje**: Svi alati instalirani i konfigurirani  
✅ **Implementirani Azure resursi**: AI usluge i prateća infrastruktura  
✅ **Pokrenuto Docker okruženje**: PostgreSQL i MCP server kontejneri  
✅ **Integracija s VS Code-om**: MCP serveri konfigurirani i dostupni  
✅ **Validirane postavke**: Svi dijelovi testirani i rade zajedno  
✅ **Znanje o rješavanju problema**: Uobičajeni problemi i rješenja  

## 🚀 Što dalje

S vašim okruženjem spremnim, nastavite na **[Modul 04: Dizajn baze podataka i shema](../04-Database/README.md)** kako biste:

- Detaljno istražili shemu maloprodajne baze podataka
- Razumjeli modeliranje podataka za više korisnika
- Naučili o implementaciji sigurnosti na razini redaka
- Radili s uzorcima maloprodajnih podataka

## 📚 Dodatni resursi

### Razvojni alati
- [Docker dokumentacija](https://docs.docker.com/) - Kompletna referenca za Docker
- [Azure CLI referenca](https://docs.microsoft.com/cli/azure/) - Azure CLI naredbe
- [VS Code dokumentacija](https://code.visualstudio.com/docs) - Konfiguracija urednika i dodaci

### Azure usluge
- [Azure AI Foundry dokumentacija](https://docs.microsoft.com/azure/ai-foundry/) - Konfiguracija AI usluga
- [Azure OpenAI usluga](https://docs.microsoft.com/azure/cognitive-services/openai/) - Implementacija AI modela
- [Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) - Postavljanje praćenja

### Python razvoj
- [Python virtualna okruženja](https://docs.python.org/3/tutorial/venv.html) - Upravljanje okruženjima
- [AsyncIO dokumentacija](https://docs.python.org/3/library/asyncio.html) - Obrasci za asinkrono programiranje
- [FastAPI dokumentacija](https://fastapi.tiangolo.com/) - Obrasci za web okvire

---

**Dalje**: Okruženje spremno? Nastavite s [Modulom 04: Dizajn baze podataka i shema](../04-Database/README.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.