<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:21:14+00:00",
  "source_file": "azd/README.md",
  "language_code": "ko"
}
-->
# Azure Developer CLI (azd) 빠른 시작

## 🚀 Azure Developer CLI로 배포하기

이 프로젝트는 이제 Azure Developer CLI (azd)와 완벽히 호환되어 인프라와 MCP 서버 애플리케이션을 자동으로 배포할 수 있습니다.

### 사전 준비 사항

1. **Azure Developer CLI 설치**:
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

2. **Azure에 로그인**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 한 번의 명령으로 배포하기

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

### 🔧 개발 워크플로우

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

### 📦 배포되는 항목

#### **인프라**
- 리소스 그룹
- Log Analytics 작업 공간  
- Application Insights
- Azure AI 서비스 (OpenAI 모델 포함)
- 컨테이너 앱 환경

#### **애플리케이션**
- MCP 서버 (컨테이너 앱)
- 상태 모니터링 활성화
- 환경 변수 구성 완료
- Application Insights 통합

### 🌍 환경 변수

배포 후, 다음 변수들이 자동으로 사용 가능합니다:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 모니터링 및 관리

- **Azure Portal**: 리소스 그룹 내 모든 리소스 보기
- **Application Insights**: 애플리케이션 성능 및 로그 모니터링
- **Container Apps**: 애플리케이션 로그 및 메트릭 보기
- **AI Studio**: OpenAI 모델 배포 관리

### 📋 문제 해결

#### **일반적인 문제**

1. **지원되지 않는 위치**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **리소스 할당량 초과**:
   - Azure Portal에서 구독 제한 확인
   - 다른 지역을 시도해 보세요

3. **인증 문제**:
   ```bash
   azd auth login --use-device-code
   ```

4. **배포 로그 보기**:
   ```bash
   azd show --output json
   ```

### 🔄 대안: 수동 배포

수동 배포를 선호하는 경우, `/infra` 폴더의 인프라를 사용할 수 있습니다:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 추가 학습

- [Azure Developer CLI 문서](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps 문서](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Services 문서](https://docs.microsoft.com/azure/ai-services/)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.