<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e48814ac77933e8d1d0fd267e1184864",
  "translation_date": "2025-09-30T06:01:23+00:00",
  "source_file": "walkthrough/03-Setup/README.md",
  "language_code": "sw"
}
-->
# Usanidi wa Mazingira

## 🎯 Kile Moduli Hii Inashughulikia

Moduli hii ya vitendo inakuongoza jinsi ya kusanidi mazingira kamili ya maendeleo kwa ajili ya kujenga seva za MCP zenye muunganisho wa PostgreSQL. Utasanidi zana zote muhimu, kupeleka rasilimali za Azure, na kuthibitisha usanidi wako kabla ya kuendelea na utekelezaji.

## Muhtasari

Mazingira sahihi ya maendeleo ni muhimu kwa mafanikio ya maendeleo ya seva za MCP. Moduli hii inatoa maelekezo ya hatua kwa hatua ya kusanidi Docker, huduma za Azure, zana za maendeleo, na kuthibitisha kuwa kila kitu kinafanya kazi kwa usahihi pamoja.

Mwisho wa moduli hii, utakuwa na mazingira kamili ya maendeleo tayari kwa ajili ya kujenga seva ya Zava Retail MCP.

## Malengo ya Kujifunza

Mwisho wa moduli hii, utaweza:

- **Kusakinisha na kusanidi** zana zote za maendeleo zinazohitajika
- **Kuweka rasilimali za Azure** zinazohitajika kwa seva ya MCP
- **Kusanidi kontena za Docker** kwa PostgreSQL na seva ya MCP
- **Kuthibitisha** usanidi wa mazingira yako kwa miunganisho ya majaribio
- **Kutatua matatizo** ya kawaida ya usanidi na masuala ya usanidi
- **Kuelewa** mtiririko wa maendeleo na muundo wa faili

## 📋 Ukaguzi wa Mahitaji ya Awali

Kabla ya kuanza, hakikisha una:

### Maarifa Yanayohitajika
- Matumizi ya msingi ya mstari wa amri (Windows Command Prompt/PowerShell)
- Uelewa wa vigezo vya mazingira
- Uzoefu wa Git kwa udhibiti wa toleo
- Dhana za msingi za Docker (kontena, picha, hifadhi)

### Mahitaji ya Mfumo
- **Mfumo wa Uendeshaji**: Windows 10/11, macOS, au Linux
- **RAM**: Angalau 8GB (16GB inapendekezwa)
- **Hifadhi**: Angalau 10GB ya nafasi ya bure
- **Mtandao**: Muunganisho wa intaneti kwa upakuaji na upelekaji wa Azure

### Mahitaji ya Akaunti
- **Usajili wa Azure**: Kiwango cha bure kinatosha
- **Akaunti ya GitHub**: Kwa ufikiaji wa hifadhi
- **Akaunti ya Docker Hub**: (Hiari) Kwa kuchapisha picha maalum

## 🛠️ Usakinishaji wa Zana

### 1. Sakinisha Docker Desktop

Docker hutoa mazingira ya kontena kwa usanidi wetu wa maendeleo.

#### Usakinishaji wa Windows

1. **Pakua Docker Desktop**:
   ```cmd
   # Visit https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
   # Or use Windows Package Manager
   winget install Docker.DockerDesktop
   ```

2. **Sakinisha na Sanidi**:
   - Endesha kisakinishi kama Msimamizi
   - Washa ushirikiano wa WSL 2 unapoulizwa
   - Washa upya kompyuta yako baada ya usakinishaji kukamilika

3. **Thibitisha Usakinishaji**:
   ```cmd
   docker --version
   docker-compose --version
   ```

#### Usakinishaji wa macOS

1. **Pakua na Sakinisha**:
   ```bash
   # Download from https://desktop.docker.com/mac/stable/Docker.dmg
   # Or use Homebrew
   brew install --cask docker
   ```

2. **Anzisha Docker Desktop**:
   - Fungua Docker Desktop kutoka Programu
   - Kamilisha mwongozo wa usanidi wa awali

3. **Thibitisha Usakinishaji**:
   ```bash
   docker --version
   docker-compose --version
   ```

#### Usakinishaji wa Linux

1. **Sakinisha Docker Engine**:
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker $USER
   
   # Log out and back in for group changes to take effect
   ```

2. **Sakinisha Docker Compose**:
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

### 2. Sakinisha Azure CLI

Azure CLI inawezesha upelekaji na usimamizi wa rasilimali za Azure.

#### Usakinishaji wa Windows

```cmd
# Using Windows Package Manager
winget install Microsoft.AzureCLI

# Or download MSI from: https://aka.ms/installazurecliwindows
```

#### Usakinishaji wa macOS

```bash
# Using Homebrew
brew install azure-cli

# Or using installer
curl -L https://aka.ms/InstallAzureCli | bash
```

#### Usakinishaji wa Linux

```bash
# Ubuntu/Debian
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# RHEL/CentOS
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install azure-cli
```

#### Thibitisha na Uthibitishe

```bash
# Check installation
az version

# Login to Azure
az login

# Set default subscription (if you have multiple)
az account list --output table
az account set --subscription "Your-Subscription-Name"
```

### 3. Sakinisha Git

Git inahitajika kwa kunakili hifadhi na udhibiti wa toleo.

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

### 4. Sakinisha VS Code

Visual Studio Code hutoa mazingira ya maendeleo yaliyounganishwa na msaada wa MCP.

#### Usakinishaji

```cmd
# Windows
winget install Microsoft.VisualStudioCode

# macOS
brew install --cask visual-studio-code

# Linux (Ubuntu/Debian)
sudo snap install code --classic
```

#### Viendelezi Vinavyohitajika

Sakinisha viendelezi hivi vya VS Code:

```bash
# Install via command line
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-json
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.azure-account
```

Au sakinisha kupitia VS Code:
1. Fungua VS Code
2. Nenda kwa Viendelezi (Ctrl+Shift+X)
3. Sakinisha:
   - **Python** (Microsoft)
   - **Docker** (Microsoft)
   - **Azure Account** (Microsoft)
   - **JSON** (Microsoft)

### 5. Sakinisha Python

Python 3.8+ inahitajika kwa maendeleo ya seva ya MCP.

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

#### Thibitisha Usakinishaji

```bash
python --version  # Should show Python 3.11.x
pip --version      # Should show pip version
```

## 🚀 Usanidi wa Mradi

### 1. Nakili Hifadhi

```bash
# Clone the main repository
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git

# Navigate to the project directory
cd MCP-Server-and-PostgreSQL-Sample-Retail

# Verify repository structure
ls -la
```

### 2. Unda Mazingira ya Kawaida ya Python

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

### 3. Sakinisha Mahitaji ya Python

```bash
# Install development dependencies
pip install -r requirements.lock.txt

# Verify key packages
pip list | grep fastmcp
pip list | grep asyncpg
pip list | grep azure
```

## ☁️ Upelekaji wa Rasilimali za Azure

### 1. Elewa Mahitaji ya Rasilimali

Seva yetu ya MCP inahitaji rasilimali hizi za Azure:

| **Rasilimali** | **Madhumuni** | **Gharama Inayokadiriwa** |
|----------------|---------------|--------------------------|
| **Azure AI Foundry** | Kuhifadhi na kusimamia modeli za AI | $10-50/mwezi |
| **Upelekaji wa OpenAI** | Modeli ya maandishi (text-embedding-3-small) | $5-20/mwezi |
| **Application Insights** | Ufuatiliaji na telemetry | $5-15/mwezi |
| **Resource Group** | Mpangilio wa rasilimali | Bure |

### 2. Peleka Rasilimali za Azure

#### Chaguo A: Upelekaji wa Kiotomatiki (Inapendekezwa)

```bash
# Navigate to infrastructure directory
cd infra

# Windows - PowerShell
./deploy.ps1

# macOS/Linux - Bash
./deploy.sh
```

Skripti ya upelekaji itafanya:
1. Unda kikundi cha rasilimali cha kipekee
2. Peleka rasilimali za Azure AI Foundry
3. Peleka modeli ya text-embedding-3-small
4. Sanidi Application Insights
5. Unda msimamizi wa huduma kwa uthibitishaji
6. Tengeneza faili `.env` yenye usanidi

#### Chaguo B: Upelekaji wa Kawaida

Ikiwa unapendelea udhibiti wa mikono au skripti ya kiotomatiki inashindwa:

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

### 3. Thibitisha Upelekaji wa Azure

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

### 4. Sanidi Vigezo vya Mazingira

Baada ya upelekaji, unapaswa kuwa na faili `.env`. Thibitisha kuwa ina:

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

## 🐳 Usanidi wa Mazingira ya Docker

### 1. Elewa Muundo wa Docker

Mazingira yetu ya maendeleo yanatumia Docker Compose:

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

### 2. Anzisha Mazingira ya Maendeleo

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

### 3. Thibitisha Usanidi wa Hifadhidata

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

### 4. Jaribu Seva ya MCP

```bash
# Check MCP server health
curl http://localhost:8000/health

# Test basic MCP endpoint
curl -X POST http://localhost:8000/mcp \
  -H "Content-Type: application/json" \
  -H "x-rls-user-id: 00000000-0000-0000-0000-000000000000" \
  -d '{"method": "tools/list", "params": {}}'
```

## 🔧 Usanidi wa VS Code

### 1. Sanidi Muunganisho wa MCP

Unda usanidi wa MCP katika VS Code:

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

### 2. Sanidi Mazingira ya Python

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

### 3. Jaribu Muunganisho wa VS Code

1. **Fungua mradi katika VS Code**:
   ```bash
   code .
   ```

2. **Fungua AI Chat**:
   - Bonyeza `Ctrl+Shift+P` (Windows/Linux) au `Cmd+Shift+P` (macOS)
   - Andika "AI Chat" na chagua "AI Chat: Open Chat"

3. **Jaribu Muunganisho wa Seva ya MCP**:
   - Katika AI Chat, andika `#zava` na chagua mojawapo ya seva zilizosanidiwa
   - Uliza: "Ni meza gani zinapatikana katika hifadhidata?"
   - Unapaswa kupokea majibu yanayoonyesha meza za hifadhidata ya rejareja

## ✅ Uthibitishaji wa Mazingira

### 1. Ukaguzi wa Mfumo wa Kina

Endesha skripti hii ya uthibitishaji ili kuthibitisha usanidi wako:

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

### 2. Orodha ya Ukaguzi wa Uthibitishaji wa Kawaida

**✅ Zana za Msingi**
- [ ] Toleo la Docker 20.10+ limesakinishwa na linafanya kazi
- [ ] Azure CLI 2.40+ limesakinishwa na kuthibitishwa
- [ ] Python 3.8+ na pip vimesakinishwa
- [ ] Git 2.30+ limesakinishwa
- [ ] VS Code na viendelezi vinavyohitajika

**✅ Rasilimali za Azure**
- [ ] Kikundi cha rasilimali kimeundwa kwa mafanikio
- [ ] Mradi wa AI Foundry umepelekwa
- [ ] Modeli ya text-embedding-3-small ya OpenAI imepelekwa
- [ ] Application Insights imesanidiwa
- [ ] Msimamizi wa huduma umeundwa na ruhusa sahihi

**✅ Usanidi wa Mazingira**
- [ ] Faili `.env` imeundwa na vigezo vyote vinavyohitajika
- [ ] Hati za Azure zinafanya kazi (jaribu na `az account show`)
- [ ] Kontena la PostgreSQL linafanya kazi na linaweza kufikiwa
- [ ] Data ya mfano imepakizwa katika hifadhidata

**✅ Muunganisho wa VS Code**
- [ ] `.vscode/mcp.json` imesanidiwa
- [ ] Interpreter ya Python imewekwa kwa mazingira ya kawaida
- [ ] Seva za MCP zinaonekana katika AI Chat
- [ ] Unaweza kutekeleza maswali ya majaribio kupitia AI Chat

## 🛠️ Kutatua Masuala ya Kawaida

### Masuala ya Docker

**Tatizo**: Kontena za Docker hazianzi
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

**Tatizo**: Muunganisho wa PostgreSQL unashindwa
```bash
# Check container logs
docker-compose logs postgres

# Verify container is healthy
docker-compose ps

# Test direct connection
docker-compose exec postgres psql -U postgres -d zava -c "SELECT 1;"
```

### Masuala ya Upelekaji wa Azure

**Tatizo**: Upelekaji wa Azure unashindwa
```bash
# Check Azure CLI authentication
az account show

# Verify subscription permissions
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Check resource provider registration
az provider register --namespace Microsoft.CognitiveServices
az provider register --namespace Microsoft.Insights
```

**Tatizo**: Uthibitishaji wa huduma ya AI unashindwa
```bash
# Test service principal
az login --service-principal \
  --username $AZURE_CLIENT_ID \
  --password $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID

# Verify AI service deployment
az cognitiveservices account list --query "[].{Name:name,Kind:kind,Location:location}"
```

### Masuala ya Mazingira ya Python

**Tatizo**: Usakinishaji wa kifurushi unashindwa
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

**Tatizo**: VS Code haiwezi kupata interpreter ya Python
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

## 🎯 Mambo Muhimu ya Kujifunza

Baada ya kukamilisha moduli hii, unapaswa kuwa na:

✅ **Mazingira Kamili ya Maendeleo**: Zana zote zimesakinishwa na kusanidiwa  
✅ **Rasilimali za Azure Zimepelekwa**: Huduma za AI na miundombinu inayosaidia  
✅ **Mazingira ya Docker Yanayofanya Kazi**: Kontena za PostgreSQL na seva ya MCP  
✅ **Muunganisho wa VS Code**: Seva za MCP zimesanidiwa na zinaweza kufikiwa  
✅ **Usanidi Uliothibitishwa**: Vipengele vyote vimejaribiwa na vinafanya kazi pamoja  
✅ **Maarifa ya Kutatua Tatizo**: Masuala ya kawaida na suluhisho zake  

## 🚀 Nini Kinachofuata

Kwa mazingira yako tayari, endelea na **[Moduli 04: Ubunifu wa Hifadhidata na Muundo](../04-Database/README.md)** ili:

- Kuchunguza muundo wa hifadhidata ya rejareja kwa undani
- Kuelewa uundaji wa data wa wateja wengi
- Kujifunza kuhusu utekelezaji wa Usalama wa Kiwango cha Safu
- Kufanya kazi na data ya mfano ya rejareja

## 📚 Rasilimali za Ziada

### Zana za Maendeleo
- [Hati za Docker](https://docs.docker.com/) - Marejeleo kamili ya Docker
- [Marejeleo ya Azure CLI](https://docs.microsoft.com/cli/azure/) - Amri za Azure CLI
- [Hati za VS Code](https://code.visualstudio.com/docs) - Usanidi wa mhariri na viendelezi

### Huduma za Azure
- [Hati za Azure AI Foundry](https://docs.microsoft.com/azure/ai-foundry/) - Usanidi wa huduma za AI
- [Huduma ya Azure OpenAI](https://docs.microsoft.com/azure/cognitive-services/openai/) - Upelekaji wa modeli za AI
- [Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) - Usanidi wa ufuatiliaji

### Maendeleo ya Python
- [Mazingira ya Kawaida ya Python](https://docs.python.org/3/tutorial/venv.html) - Usimamizi wa mazingira
- [Hati za AsyncIO](https://docs.python.org/3/library/asyncio.html) - Mifumo ya programu ya Async
- [Hati za FastAPI](https://fastapi.tiangolo.com/) - Mifumo ya programu ya wavuti

---

**Inayofuata**: Mazingira yako yako tayari? Endelea na [Moduli 04: Ubunifu wa Hifadhidata na Muundo](../04-Database/README.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.