<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e48814ac77933e8d1d0fd267e1184864",
  "translation_date": "2025-09-29T16:34:11+00:00",
  "source_file": "walkthrough/03-Setup/README.md",
  "language_code": "tw"
}
-->
# 環境設置

## 🎯 本模組涵蓋內容

本實作模組將引導您完成建立整個開發環境的過程，用於建置與 PostgreSQL 整合的 MCP 伺服器。您將配置所有必要工具、部署 Azure 資源，並在進行實作前驗證您的設置。

## 概述

適當的開發環境對於成功開發 MCP 伺服器至關重要。本模組提供逐步指導，幫助您設置 Docker、Azure 服務、開發工具，並驗證所有元件是否能正確協同工作。

完成本模組後，您將擁有一個完全功能的開發環境，準備好用於建置 Zava Retail MCP 伺服器。

## 學習目標

完成本模組後，您將能夠：

- **安裝並配置**所有必要的開發工具
- **部署 Azure 資源**以支持 MCP 伺服器
- **設置 Docker 容器**以運行 PostgreSQL 和 MCP 伺服器
- **驗證**您的環境設置是否正常運作
- **排除故障**常見的設置問題和配置問題
- **理解**開發工作流程和檔案結構

## 📋 先決條件檢查

在開始之前，請確保您具備以下條件：

### 必要知識
- 基本命令列使用（Windows Command Prompt/PowerShell）
- 環境變數的基本概念
- 熟悉 Git 版本控制
- 基本 Docker 概念（容器、映像檔、卷）

### 系統需求
- **作業系統**：Windows 10/11、macOS 或 Linux
- **記憶體**：至少 8GB（建議 16GB）
- **儲存空間**：至少 10GB 可用空間
- **網路**：下載和部署 Azure 所需的網路連線

### 帳戶需求
- **Azure 訂閱**：免費層即可
- **GitHub 帳戶**：用於存取儲存庫
- **Docker Hub 帳戶**：（可選）用於發布自訂映像檔

## 🛠️ 工具安裝

### 1. 安裝 Docker Desktop

Docker 提供了容器化的開發環境。

#### Windows 安裝

1. **下載 Docker Desktop**：
   ```cmd
   # Visit https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe
   # Or use Windows Package Manager
   winget install Docker.DockerDesktop
   ```

2. **安裝並配置**：
   - 以管理員身份執行安裝程式
   - 在提示時啟用 WSL 2 整合
   - 安裝完成後重新啟動電腦

3. **驗證安裝**：
   ```cmd
   docker --version
   docker-compose --version
   ```

#### macOS 安裝

1. **下載並安裝**：
   ```bash
   # Download from https://desktop.docker.com/mac/stable/Docker.dmg
   # Or use Homebrew
   brew install --cask docker
   ```

2. **啟動 Docker Desktop**：
   - 從應用程式中啟動 Docker Desktop
   - 完成初始設置精靈

3. **驗證安裝**：
   ```bash
   docker --version
   docker-compose --version
   ```

#### Linux 安裝

1. **安裝 Docker Engine**：
   ```bash
   # Ubuntu/Debian
   curl -fsSL https://get.docker.com -o get-docker.sh
   sudo sh get-docker.sh
   sudo usermod -aG docker $USER
   
   # Log out and back in for group changes to take effect
   ```

2. **安裝 Docker Compose**：
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

### 2. 安裝 Azure CLI

Azure CLI 用於部署和管理 Azure 資源。

#### Windows 安裝

```cmd
# Using Windows Package Manager
winget install Microsoft.AzureCLI

# Or download MSI from: https://aka.ms/installazurecliwindows
```

#### macOS 安裝

```bash
# Using Homebrew
brew install azure-cli

# Or using installer
curl -L https://aka.ms/InstallAzureCli | bash
```

#### Linux 安裝

```bash
# Ubuntu/Debian
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# RHEL/CentOS
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install azure-cli
```

#### 驗證並認證

```bash
# Check installation
az version

# Login to Azure
az login

# Set default subscription (if you have multiple)
az account list --output table
az account set --subscription "Your-Subscription-Name"
```

### 3. 安裝 Git

Git 用於克隆儲存庫和版本控制。

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

### 4. 安裝 VS Code

Visual Studio Code 提供了支援 MCP 的整合開發環境。

#### 安裝

```cmd
# Windows
winget install Microsoft.VisualStudioCode

# macOS
brew install --cask visual-studio-code

# Linux (Ubuntu/Debian)
sudo snap install code --classic
```

#### 必要擴展

安裝以下 VS Code 擴展：

```bash
# Install via command line
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-json
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.azure-account
```

或通過 VS Code 安裝：
1. 打開 VS Code
2. 前往擴展（Ctrl+Shift+X）
3. 安裝：
   - **Python**（Microsoft）
   - **Docker**（Microsoft）
   - **Azure Account**（Microsoft）
   - **JSON**（Microsoft）

### 5. 安裝 Python

MCP 伺服器開發需要 Python 3.8+。

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

#### 驗證安裝

```bash
python --version  # Should show Python 3.11.x
pip --version      # Should show pip version
```

## 🚀 專案設置

### 1. 克隆儲存庫

```bash
# Clone the main repository
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git

# Navigate to the project directory
cd MCP-Server-and-PostgreSQL-Sample-Retail

# Verify repository structure
ls -la
```

### 2. 建立 Python 虛擬環境

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

### 3. 安裝 Python 相依性

```bash
# Install development dependencies
pip install -r requirements.lock.txt

# Verify key packages
pip list | grep fastmcp
pip list | grep asyncpg
pip list | grep azure
```

## ☁️ Azure 資源部署

### 1. 理解資源需求

我們的 MCP 伺服器需要以下 Azure 資源：

| **資源** | **用途** | **估計成本** |
|----------|----------|-------------|
| **Azure AI Foundry** | AI 模型託管與管理 | 每月 $10-50 |
| **OpenAI 部署** | 文本嵌入模型（text-embedding-3-small） | 每月 $5-20 |
| **Application Insights** | 監控與遙測 | 每月 $5-15 |
| **資源群組** | 資源組織 | 免費 |

### 2. 部署 Azure 資源

#### 選項 A：自動化部署（推薦）

```bash
# Navigate to infrastructure directory
cd infra

# Windows - PowerShell
./deploy.ps1

# macOS/Linux - Bash
./deploy.sh
```

部署腳本將執行以下操作：
1. 建立唯一的資源群組
2. 部署 Azure AI Foundry 資源
3. 部署 text-embedding-3-small 模型
4. 配置 Application Insights
5. 建立服務主體以進行認證
6. 生成 `.env` 檔案並配置

#### 選項 B：手動部署

如果您偏好手動控制或自動化腳本失敗：

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

### 3. 驗證 Azure 部署

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

### 4. 配置環境變數

部署完成後，您應該擁有一個 `.env` 檔案。確認其中包含：

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

## 🐳 Docker 環境設置

### 1. 理解 Docker 組成

我們的開發環境使用 Docker Compose：

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

### 2. 啟動開發環境

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

### 3. 驗證資料庫設置

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

### 4. 測試 MCP 伺服器

```bash
# Check MCP server health
curl http://localhost:8000/health

# Test basic MCP endpoint
curl -X POST http://localhost:8000/mcp \
  -H "Content-Type: application/json" \
  -H "x-rls-user-id: 00000000-0000-0000-0000-000000000000" \
  -d '{"method": "tools/list", "params": {}}'
```

## 🔧 VS Code 配置

### 1. 配置 MCP 整合

建立 VS Code MCP 配置：

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

### 2. 配置 Python 環境

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

### 3. 測試 VS Code 整合

1. **在 VS Code 中打開專案**：
   ```bash
   code .
   ```

2. **打開 AI 聊天**：
   - 按 `Ctrl+Shift+P`（Windows/Linux）或 `Cmd+Shift+P`（macOS）
   - 輸入 "AI Chat" 並選擇 "AI Chat: Open Chat"

3. **測試 MCP 伺服器連線**：
   - 在 AI 聊天中輸入 `#zava` 並選擇其中一個配置的伺服器
   - 詢問：「資料庫中有哪些表格？」
   - 您應該會收到列出零售資料庫表格的回應

## ✅ 環境驗證

### 1. 全面系統檢查

執行此驗證腳本以確認您的設置：

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

### 2. 手動驗證清單

**✅ 基本工具**
- [ ] Docker 版本 20.10+ 已安裝並運行
- [ ] Azure CLI 2.40+ 已安裝並認證
- [ ] Python 3.8+ 已安裝並包含 pip
- [ ] Git 2.30+ 已安裝
- [ ] VS Code 已安裝必要擴展

**✅ Azure 資源**
- [ ] 資源群組成功建立
- [ ] AI Foundry 專案已部署
- [ ] OpenAI text-embedding-3-small 模型已部署
- [ ] Application Insights 已配置
- [ ] 服務主體已建立並具有適當權限

**✅ 環境配置**
- [ ] `.env` 檔案已建立並包含所有必要變數
- [ ] Azure 認證正常（使用 `az account show` 測試）
- [ ] PostgreSQL 容器正在運行且可存取
- [ ] 資料庫中已載入範例資料

**✅ VS Code 整合**
- [ ] `.vscode/mcp.json` 已配置
- [ ] Python 解譯器設置為虛擬環境
- [ ] MCP 伺服器顯示在 AI 聊天中
- [ ] 能夠通過 AI 聊天執行測試查詢

## 🛠️ 常見問題排除

### Docker 問題

**問題**：Docker 容器無法啟動
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

**問題**：PostgreSQL 連線失敗
```bash
# Check container logs
docker-compose logs postgres

# Verify container is healthy
docker-compose ps

# Test direct connection
docker-compose exec postgres psql -U postgres -d zava -c "SELECT 1;"
```

### Azure 部署問題

**問題**：Azure 部署失敗
```bash
# Check Azure CLI authentication
az account show

# Verify subscription permissions
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Check resource provider registration
az provider register --namespace Microsoft.CognitiveServices
az provider register --namespace Microsoft.Insights
```

**問題**：AI 服務認證失敗
```bash
# Test service principal
az login --service-principal \
  --username $AZURE_CLIENT_ID \
  --password $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID

# Verify AI service deployment
az cognitiveservices account list --query "[].{Name:name,Kind:kind,Location:location}"
```

### Python 環境問題

**問題**：套件安裝失敗
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

**問題**：VS Code 找不到 Python 解譯器
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

## 🎯 關鍵要點

完成本模組後，您應該已完成：

✅ **完整開發環境**：所有工具已安裝並配置  
✅ **Azure 資源部署**：AI 服務和支援基礎設施  
✅ **Docker 環境運行**：PostgreSQL 和 MCP 伺服器容器  
✅ **VS Code 整合**：MCP 伺服器已配置並可存取  
✅ **設置驗證**：所有元件已測試並協同工作  
✅ **故障排除知識**：常見問題及解決方案  

## 🚀 下一步

環境準備完成後，繼續 **[模組 04：資料庫設計與架構](../04-Database/README.md)**：

- 詳細探索零售資料庫架構
- 理解多租戶資料建模
- 學習行級安全性實作
- 使用零售範例資料進行操作

## 📚 其他資源

### 開發工具
- [Docker 文件](https://docs.docker.com/) - 完整的 Docker 參考
- [Azure CLI 參考](https://docs.microsoft.com/cli/azure/) - Azure CLI 命令
- [VS Code 文件](https://code.visualstudio.com/docs) - 編輯器配置與擴展

### Azure 服務
- [Azure AI Foundry 文件](https://docs.microsoft.com/azure/ai-foundry/) - AI 服務配置
- [Azure OpenAI 服務](https://docs.microsoft.com/azure/cognitive-services/openai/) - AI 模型部署
- [Application Insights](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) - 監控設置

### Python 開發
- [Python 虛擬環境](https://docs.python.org/3/tutorial/venv.html) - 環境管理
- [AsyncIO 文件](https://docs.python.org/3/library/asyncio.html) - 非同步程式設計模式
- [FastAPI 文件](https://fastapi.tiangolo.com/) - Web 框架模式

---

**下一步**：環境準備完成？繼續進行 [模組 04：資料庫設計與架構](../04-Database/README.md)

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於關鍵資訊，建議使用專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。