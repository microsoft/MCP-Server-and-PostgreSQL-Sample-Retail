<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:23:07+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ko"
}
-->
# 인프라 템플릿

이 폴더는 MCP Retail Analytics 프로젝트를 위한 인프라 배포 템플릿을 포함하고 있습니다.

## 📁 파일 개요

| 파일 | 설명 | 사용 사례 |
|------|-------------|----------|
| `azuredeploy.json` | **ARM 템플릿** - 구독 범위 전체 배포 | 모든 배포에 권장 |
| `azuredeploy.parameters.json` | **ARM 매개변수** - 정적 구성 값 | `azuredeploy.json`과 함께 사용 |
| `ARM-DEPLOYMENT.md` | **ARM 배포 가이드** - 상세한 지침 | 전체 배포 문서 |
| `README.md` | **이 파일** - 인프라 개요 | 간단한 참고 자료 |

## 🚀 배포 옵션

### 옵션 1: Azure CLI (권장)
리소스 그룹 생성과 함께 전체 배포:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### 옵션 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### 옵션 3: Azure Portal
1. [Azure Portal](https://portal.azure.com)로 이동
2. "Deploy a custom template" 검색
3. `azuredeploy.json` 업로드
4. 매개변수 구성 후 배포

## 🏗️ 인프라 구성 요소

ARM 템플릿은 다음 인프라를 배포합니다:

- **리소스 그룹**: 일관된 이름을 가진 모든 리소스를 위한 컨테이너
- **Log Analytics Workspace**: 중앙 로그 및 모니터링 (30일 보존)
- **Application Insights**: Log Analytics와 통합된 애플리케이션 성능 모니터링
- **Azure AI Services**: 관리 ID를 포함한 다중 서비스 AI 허브 (S0 등급)
- **OpenAI 모델**:
  - `gpt-4o-mini` (120 용량) - 채팅 및 완료 모델
  - `text-embedding-3-small` (50 용량) - 의미 검색을 위한 텍스트 임베딩

## 🔧 템플릿 구성

### 매개변수
ARM 템플릿은 다음과 같은 사용자 정의 가능한 매개변수를 허용합니다:

| 매개변수 | 기본값 | 설명 |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | 모든 리소스 이름의 접두사 |
| `location` | `westus2` | 배포를 위한 Azure 지역 |
| `uniqueSuffix` | 자동 생성 | 4자리 고유 식별자 |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | 표시 이름 |
| `gptModelCapacity` | `120` | GPT 모델 토큰 용량 |
| `embeddingModelCapacity` | `50` | 임베딩 모델 용량 |

### 리소스 이름 규칙
모든 리소스는 `{type}-{resourcePrefix}-{uniqueSuffix}` 패턴을 따릅니다.

예시:
- 리소스 그룹: `rg-mcpretail-demo`
- AI 서비스: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 템플릿 검증

### 배포 전 검증
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### 배포 상태 확인
```bash
az deployment sub list --output table
```

## 💰 비용 추정

개발 워크로드에 대한 월별 예상 비용:

| 서비스 | 구성 | 월별 예상 비용 |
|---------|---------------|-----------------|
| Azure AI Services | S0 등급 | $15-50 |
| OpenAI GPT-4o-mini | 120K 토큰 | $15-30 |
| OpenAI 임베딩 | 50K 토큰 | $5-15 |
| Application Insights | 기본 모니터링 | $5-15 |
| Log Analytics | 월 1GB | $2-5 |
| **합계** | | **$42-115** |

## 📚 추가 자료

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - 문제 해결을 포함한 상세 배포 가이드
- [ARM 템플릿 문서](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services 문서](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - 파일 검증 결과

## 🆘 빠른 문제 해결

### 일반적인 문제
- **인증**: `az login`을 실행하여 인증
- **할당량 제한**: 대상 지역에서 OpenAI 모델 가용성을 확인
- **이름 충돌**: 다른 `uniqueSuffix` 매개변수를 사용
- **권한**: 계정이 구독에 대한 Contributor 역할을 가지고 있는지 확인

### 도움 받기
- 상세한 문제 해결은 [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md)를 참조
- Azure Portal에서 배포 로그 확인
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) 방문

---

프로젝트 전체 설정은 [메인 README](../../README.md) 또는 [프로젝트 워크스루](../../walkthrough/README.md)를 참조하세요.

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.