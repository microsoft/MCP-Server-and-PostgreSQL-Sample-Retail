<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:06:16+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ko"
}
-->
# ARM 템플릿 배포 지침

이 문서는 ARM 템플릿을 사용하여 MCP Retail Analytics 인프라를 배포하는 방법을 제공합니다.

## 📋 개요

`azuredeploy.json` ARM 템플릿은 다음을 완전하게 배포합니다:
- Azure 리소스 그룹
- Log Analytics 워크스페이스  
- Application Insights
- Azure AI 서비스 (Foundry)
- OpenAI 모델 배포 (GPT-4o-mini, text-embedding-3-small)

## 🚀 배포 옵션

### 옵션 1: Azure CLI 배포

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### 옵션 2: PowerShell 배포

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### 옵션 3: Azure 포털

1. [Azure 포털](https://portal.azure.com)로 이동합니다.
2. "Deploy a custom template"를 검색합니다.
3. "Build your own template in the editor"를 클릭합니다.
4. `azuredeploy.json`의 내용을 복사하여 붙여넣습니다.
5. "Save"를 클릭한 후 "Review + create"를 클릭합니다.
6. 필요한 매개변수를 입력하고 배포를 진행합니다.

## 🔧 템플릿 매개변수

| 매개변수 | 유형 | 기본값 | 설명 |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | 리소스 이름의 접두사 |
| `location` | string | `westus2` | 배포를 위한 Azure 지역 |
| `uniqueSuffix` | string | 자동 생성 | 4자리 고유 식별자 |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI 프로젝트의 표시 이름 |
| `aiProjectDescription` | string | 프로젝트 설명 | Azure AI Foundry에 표시되는 설명 |
| `gptModelCapacity` | int | `120` | GPT 모델의 토큰 용량 |
| `embeddingModelCapacity` | int | `50` | 임베딩 모델의 토큰 용량 |
| `tags` | object | 기본 태그 | 거버넌스를 위한 리소스 태그 |

## 📤 템플릿 출력

템플릿은 다음과 같은 출력을 제공합니다:

| 출력 | 설명 |
|--------|-------------|
| `subscriptionId` | Azure 구독 ID |
| `resourceGroupName` | 생성된 리소스 그룹 이름 |
| `aiFoundryName` | Azure AI Foundry 서비스 이름 |
| `foundryEndpoint` | AI 서비스 엔드포인트 URL |
| `foundryAccountKey` | AI 서비스 액세스 키 |
| `deployedModels` | 배포된 OpenAI 모델 배열 |
| `applicationInsightsConnectionString` | Application Insights 연결 문자열 |
| `logAnalyticsWorkspaceName` | Log Analytics 워크스페이스 이름 |

## 🔍 검증 명령어

배포 후 리소스를 검증합니다:

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM vs Bicep

이 프로젝트는 ARM 및 Bicep 템플릿을 모두 제공합니다:

### ARM 템플릿 (`azuredeploy.json`)
- ✅ Azure Resource Manager의 기본 형식
- ✅ ARM이 지원되는 모든 환경에서 작동
- ✅ 추가 도구가 필요 없음
- ❌ 더 복잡한 JSON 문법
- ❌ 읽고 유지 관리하기 어려움

### Bicep 템플릿 (`main.bicep`)
- ✅ 현대적이고 간결한 문법
- ✅ 더 나은 도구 및 IntelliSense 지원
- ✅ 읽고 유지 관리하기 쉬움
- ✅ 컴파일 시 유효성 검사
- ❌ Bicep CLI 필요
- ❌ 추가 빌드 단계 필요

**추천**: 개발에는 Bicep 템플릿(`main.bicep`)을 사용하고, 순수 ARM JSON이 필요한 시나리오에는 ARM 템플릿(`azuredeploy.json`)을 사용하세요.

## 🔧 사용자 정의

### 사용자 정의 리소스 추가

ARM 템플릿에 추가 리소스를 추가하려면:

1. 중첩 템플릿의 `resources` 배열에 리소스 정의를 추가합니다.
2. `parameters` 섹션에 새로운 매개변수를 추가합니다.
3. 필요한 경우 해당 출력을 추가합니다.
4. 매개변수 파일에 기본값을 업데이트합니다.

### 예: 스토리지 계정 추가

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 문제 해결

### 일반적인 문제

#### 1. 템플릿 유효성 검사 오류
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. 리소스 이름 충돌
- `uniqueSuffix`가 진정으로 고유한지 확인하세요.
- 자동 생성을 위해 `uniqueString()` 함수를 사용하세요.
- 대상 지역의 기존 리소스를 확인하세요.

#### 3. 할당량 제한
- 대상 지역에서 OpenAI 모델의 가용성을 확인하세요.
- AI 서비스에 대한 구독 할당량을 확인하세요.
- 제한이 초과된 경우 다른 지역을 고려하세요.

#### 4. 권한 문제
- 계정이 구독에 대한 Contributor 역할을 가지고 있는지 확인하세요.
- 구독이 AI 서비스를 사용할 수 있도록 활성화되었는지 확인하세요.
- 리소스 공급자 등록을 확인하세요.

### 디버깅 명령어

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 보안 고려사항

### 액세스 제어
- AI 서비스는 안전한 액세스를 위해 관리 ID를 사용합니다.
- 리소스 그룹은 RBAC의 경계를 제공합니다.
- Application Insights는 별도의 액세스 제어를 가집니다.

### 네트워크 보안
- 기본적으로 공용 네트워크 액세스가 활성화됩니다.
- 프로덕션 환경에서는 프라이빗 엔드포인트를 고려하세요.
- 추가 보안을 위해 네트워크 ACL을 구성할 수 있습니다.

### 키 관리
- AI 서비스 키는 자동 생성됩니다.
- 프로덕션 비밀 관리를 위해 Azure Key Vault를 사용하세요.
- 보안을 위해 키를 정기적으로 회전하세요.

## 📚 다음 단계

성공적으로 배포한 후:

1. **환경 변수 구성**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP 서버 시작**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **통합 테스트**:
   - 프로젝트를 VS Code에서 엽니다.
   - `.vscode/mcp.json`에서 MCP 서버를 구성합니다.
   - 소매 데이터 쿼리를 사용하여 AI 채팅을 테스트합니다.

4. **성능 모니터링**:
   - Application Insights에서 메트릭을 확인합니다.
   - Log Analytics 워크스페이스에서 로그를 확인합니다.
   - 중요한 이벤트에 대한 알림을 설정합니다.

---

자세한 내용은 [main README](../README.md) 또는 [QUICKSTART guide](../QUICKSTART.md)를 참조하세요.

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.