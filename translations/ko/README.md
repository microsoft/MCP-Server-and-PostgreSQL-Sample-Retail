<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T16:55:18+00:00",
  "source_file": "README.md",
  "language_code": "ko"
}
-->
# MCP 서버와 PostgreSQL 샘플 - 소매 판매 분석

## 데이터베이스 통합을 통한 MCP 학습: 실습 예제

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

다음 단계를 따라 이 리소스를 사용해보세요:

1. **저장소 포크하기**: [여기를 클릭하여 포크](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **저장소 클론하기**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discord 가입하기**: [전문가 및 개발자들과 만나보세요](https://discord.com/invite/ByRwuEEgH4)

### 🌐 다국어 지원

#### GitHub Action을 통해 지원 (자동화 및 항상 최신 상태 유지)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](./README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**추가 번역 언어를 지원받고 싶다면 [여기](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)를 확인하세요**

## 소개

이 샘플은 **Model Context Protocol (MCP) 서버**를 구축하고 배포하는 방법을 보여줍니다. 이 서버는 PostgreSQL을 통해 소매 판매 데이터를 안전하고 지능적으로 AI 어시스턴트가 접근할 수 있도록 합니다. 이 프로젝트는 **행 수준 보안 (RLS)**, **의미 검색 기능**, **Azure AI 통합**과 같은 엔터프라이즈급 기능을 활용하여 실제 소매 분석 시나리오를 제공합니다.

**주요 사용 사례:**
- **AI 기반 판매 분석**: AI 어시스턴트가 자연어를 통해 소매 판매 데이터를 조회하고 분석할 수 있도록 지원
- **안전한 다중 테넌트 접근**: 각 매니저가 자신의 매장 데이터만 접근할 수 있도록 행 수준 보안 구현
- **의미 기반 제품 검색**: 텍스트 임베딩을 활용한 AI 강화 제품 검색
- **엔터프라이즈 통합**: MCP 서버를 Azure 서비스 및 PostgreSQL 데이터베이스와 통합하는 방법 제시

**적합한 대상:**
- 데이터베이스 통합을 포함한 MCP 서버 구축을 배우고자 하는 개발자
- 안전한 다중 테넌트 분석 솔루션을 구현하려는 데이터 엔지니어
- 소매 또는 전자상거래 데이터를 활용하는 AI 애플리케이션 개발자
- AI 어시스턴트와 엔터프라이즈 데이터베이스를 결합하는 데 관심 있는 모든 사람

## Azure AI Foundry Discord 커뮤니티에 참여하세요
MCP 경험을 공유하고 전문가 및 제품 그룹을 만나보세요

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# 판매 분석 MCP 서버

Zava Retail DIY 비즈니스를 위한 고객 판매 데이터베이스 접근을 제공하는 Model Context Protocol (MCP) 서버입니다. 이 서버는 AI 어시스턴트가 안전하고 스키마를 인식하는 인터페이스를 통해 소매 판매 데이터를 조회하고 분석할 수 있도록 지원합니다.

## 📚 완벽한 구현 가이드

이 솔루션이 어떻게 구축되었는지와 유사한 MCP 서버를 구현하는 방법에 대한 자세한 내용을 보려면 **[샘플 워크스루](Sample_Walkthrough.md)**를 참조하세요. 이 가이드는 다음을 제공합니다:

- **아키텍처 심층 분석**: 구성 요소 분석 및 설계 패턴
- **단계별 구축**: 프로젝트 설정부터 배포까지
- **코드 분석**: MCP 서버 구현에 대한 상세 설명
- **고급 기능**: 행 수준 보안, 의미 검색, 모니터링
- **모범 사례**: 보안, 성능, 개발 지침
- **문제 해결**: 일반적인 문제와 해결 방법

유사한 솔루션을 구축하고자 하는 개발자에게 적합합니다.

## 🤖 MCP (Model Context Protocol)란 무엇인가?

**Model Context Protocol (MCP)**는 AI 어시스턴트가 외부 데이터 소스와 도구에 실시간으로 안전하게 접근할 수 있도록 하는 오픈 표준입니다. 이는 AI 모델이 데이터베이스, API, 파일 시스템 및 기타 리소스와 연결할 수 있도록 하는 다리 역할을 하며 보안과 제어를 유지합니다.

### 주요 혜택:
- **실시간 데이터 접근**: AI 어시스턴트가 실시간으로 데이터베이스와 API를 조회 가능
- **안전한 통합**: 인증 및 권한을 통한 접근 제어
- **도구 확장성**: AI 어시스턴트에 맞춤형 기능 추가 가능
- **표준화된 프로토콜**: 다양한 AI 플랫폼과 도구에서 작동

### MCP가 처음이신가요?

Model Context Protocol에 익숙하지 않다면 Microsoft의 포괄적인 초보자 리소스를 시작점으로 삼으세요:

**📖 [MCP 초보자 가이드](https://aka.ms/mcp-for-beginners)**

이 리소스는 다음을 제공합니다:
- MCP 개념 및 아키텍처 소개
- 첫 MCP 서버를 구축하기 위한 단계별 튜토리얼
- MCP 개발 모범 사례
- 인기 있는 AI 플랫폼과의 통합 예제
- 커뮤니티 리소스 및 지원

기본 사항을 이해한 후, 이 고급 소매 분석 구현을 탐색해보세요!

## 📚 포괄적인 학습 가이드: /walkthrough

이 저장소는 이 MCP 소매 서버 샘플을 소화하기 쉬운 단계별 레슨으로 분해한 **12개 모듈 학습 워크스루**를 포함합니다. 워크스루는 이 작동 예제를 포괄적인 교육 리소스로 변환하여 데이터베이스 통합을 포함한 프로덕션 준비 MCP 서버를 구축하려는 개발자에게 적합합니다.

### 학습 내용

워크스루는 기본 MCP 개념부터 고급 프로덕션 배포까지 모든 것을 다룹니다:

- **MCP 기본 사항**: Model Context Protocol 및 실제 응용 프로그램 이해
- **데이터베이스 통합**: 행 수준 보안을 포함한 안전한 PostgreSQL 연결 구현
- **AI 강화 기능**: Azure OpenAI 임베딩을 활용한 의미 검색 기능 추가
- **보안 구현**: 엔터프라이즈급 인증, 권한 부여 및 데이터 분리
- **도구 개발**: 데이터 분석 및 비즈니스 인텔리전스를 위한 정교한 MCP 도구 구축
- **테스트 및 디버깅**: 포괄적인 테스트 전략 및 디버깅 기술
- **VS Code 통합**: 자연어 데이터베이스 쿼리를 위한 AI Chat 구성
- **프로덕션 배포**: 컨테이너화, 확장 및 클라우드 배포 전략
- **모니터링 및 관찰성**: Application Insights, 로깅 및 성능 모니터링

### 학습 경로 개요

워크스루는 모든 수준의 개발자를 위해 설계된 점진적 학습 구조를 따릅니다:

| 모듈 | 초점 영역 | 설명 | 예상 시간 |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | 기초 | MCP 개념, Zava Retail 사례 연구, 아키텍처 개요 | 30분 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | 설계 패턴 | 기술 아키텍처, 계층 설계, 시스템 구성 요소 | 45분 |
| **[02-Security](walkthrough/02-Security/README.md)** | 엔터프라이즈 보안 | Azure 인증, 행 수준 보안, 다중 테넌트 분리 | 60분 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | 환경 | Docker 설정, Azure CLI, 프로젝트 구성, 검증 | 45분 |
| **[04-Database](walkthrough/04-Database/README.md)** | 데이터 계층 | PostgreSQL 스키마, pgvector, RLS 정책, 샘플 데이터 | 60분 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | 핵심 구현 | FastMCP 프레임워크, 데이터베이스 통합, 연결 관리 | 90분 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | 도구 개발 | MCP 도구 생성, 쿼리 검증, 비즈니스 인텔리전스 기능 | 75분 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI 통합 | Azure OpenAI 임베딩, 벡터 검색, 하이브리드 검색 전략 | 60분 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | 품질 보증 | 단위 테스트, 통합 테스트, 성능 테스트, 디버깅 | 75분 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | 개발 경험 | VS Code 구성, AI Chat 통합, 디버깅 워크플로 | 45분 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | 프로덕션 준비 | 컨테이너화, Azure Container Apps, CI/CD 파이프라인, 확장 | 90분 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | 관찰성 | Application Insights, 구조화된 로깅, 성능 메트릭 | 60분 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | 프로덕션 우수성 | 보안 강화, 성능 최적화, 엔터프라이즈 패턴 | 45분 |

**총 학습 시간**: ~12-15시간의 포괄적인 실습 학습

### 🎯 워크스루 활용 방법

**초보자용**:
1. [모듈 00: 소개](walkthrough/00-Introduction/README.md)부터 시작하여 MCP 기본 사항 이해
2. 전체 학습 경험을 위해 모듈을 순차적으로 따라가기
3. 각 모듈은 이전 개념을 기반으로 구축되며 실습을 포함

**경험 많은 개발자용**:
1. [주요 워크스루 개요](walkthrough/README.md)를 검토하여 전체 모듈 요약 확인
2. 관심 있는 특정 모듈로 바로 이동 (예: AI 통합을 위한 모듈 07)
3. 개별 모듈을 자신의 프로젝트 참고 자료로 활용

**프로덕션 구현용**:
1. 모듈 02 (보안), 10 (배포), 11 (모니터링)에 집중
2. 모듈 12 (모범 사례)를 검토하여 엔터프라이즈 지침 확인
3. 코드 예제를 프로덕션 준비 템플릿으로 활용

### 🚀 빠른 시작 옵션

**옵션 1: 전체 학습 경로** (초보자에게 추천)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**옵션 2: 실습 구현** (바로 구축 시작)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**옵션 3: 프로덕션 초점** (엔터프라이즈 배포)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 학습 전 준비 사항

**추천 배경 지식**:
- 기본적인 Python 프로그래밍 경험
- REST API와 데이터베이스에 대한 기본 이해
- AI/ML 개념에 대한 일반적인 이해
- 기본적인 명령줄 및 Docker 지식

**필수는 아니지만 유용한 사항**:
- MCP 경험 (기초부터 다룹니다)
- Azure 클라우드 경험 (단계별 가이드를 제공합니다)
- 고급 PostgreSQL 지식 (필요한 개념을 설명합니다)

### 💡 학습 팁

1. **실습 중심 접근**: 각 모듈에는 실행 및 수정 가능한 코드 예제가 포함되어 있습니다.
2. **점진적 복잡성**: 개념은 간단한 것부터 고급까지 점진적으로 구축됩니다.
3. **실제 사례 기반**: 모든 예제는 현실적인 소매 비즈니스 시나리오를 사용합니다.
4. **실제 운영 준비**: 코드 예제는 실제 운영 환경에서 사용 가능하도록 설계되었습니다.
5. **커뮤니티 지원**: 도움과 토론을 위해 [Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)에 참여하세요.

### 🔗 관련 자료

- **[MCP 초보자용](https://aka.ms/mcp-for-beginners)**: 필수 배경 지식
- **[샘플 워크스루](Sample_Walkthrough.md)**: 기술적 개요
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: 예제에서 사용된 클라우드 플랫폼
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP 구현 프레임워크

**학습을 시작할 준비가 되셨나요?** **[모듈 00: 소개](walkthrough/00-Introduction/README.md)**부터 시작하거나 **[전체 워크스루 개요](walkthrough/README.md)**를 탐색하세요.

## 준비 사항

1. Docker Desktop 설치
2. Git 설치
3. **Azure CLI**: Azure CLI를 설치하고 인증
4. OpenAI `text-embedding-3-small` 모델 및 선택적으로 `gpt-4o-mini` 모델에 대한 액세스

## 시작하기

터미널 창을 열고 다음 명령을 실행하세요:

1. Azure CLI로 인증

    ```bash
    az login
    ```

2. 저장소 클론

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. 프로젝트 디렉터리로 이동

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure 리소스 배포

MCP 서버에 필요한 Azure 리소스를 자동으로 배포하는 스크립트를 실행하세요.

배포 스크립트는 `text-embedding-3-small` 모델을 자동으로 배포합니다. 배포 중에 `gpt-4o-mini` 모델을 포함할지 선택할 수 있습니다. `gpt-4o-mini`는 이 프로젝트에 **필수는 아니며**, 향후 확장을 위해 포함됩니다.

**플랫폼에 맞는 스크립트를 선택하세요:**

#### Windows (PowerShell)

```powershell
# Run from the project root directory
cd infra && ./deploy.ps1
```

#### macOS/Linux (Bash)

```bash
# Run from the project root directory
cd infra && ./deploy.sh
```

## MCP 서버 실행

PostgreSQL과 MCP 서버를 포함한 전체 스택을 실행하는 가장 쉬운 방법은 Docker Compose를 사용하는 것입니다.

### 스택 시작

```bash
# Start PostgreSQL and MCP Server
docker compose up -d

# View logs
docker compose logs -f

# View MCP Server Logs
docker compose logs -f mcp_server

# View the PostgreSQL Logs
docker compose logs -f pg17

# Stop the stack
docker compose down -v
```

## 사용법

다음은 VS Code의 내장 MCP 서버 지원을 사용하는 것을 가정합니다.

1. 프로젝트를 VS Code에서 엽니다. 터미널에서 다음을 실행하세요:

    ```bash
    code .
    ```

2. `.vscode/mcp.json`에 있는 설정을 사용하여 하나 이상의 MCP 서버를 시작합니다. 파일에는 서로 다른 매장 관리자 역할을 나타내는 네 가지 서버 설정이 포함되어 있습니다:

   - 각 설정은 고유한 RLS (Row Level Security) 사용자 ID를 사용합니다.
   - 이러한 사용자 ID는 데이터베이스에 액세스하는 서로 다른 매장 관리자 신원을 시뮬레이션합니다.
   - RLS 시스템은 관리자가 할당된 매장에 따라 데이터 액세스를 제한합니다.
   - 이는 매장 관리자가 서로 다른 Entra ID 계정으로 로그인하는 실제 시나리오를 모방합니다.

    ```json
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
            },
            "zava-sales-analysis-online": {
                "url": "http://127.0.0.1:8000/mcp",
                "type": "http",
                "headers": {"x-rls-user-id": "2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2"}
            }
        },
        "inputs": []
    }
    ```

### VS Code AI 채팅 열기

1. VS Code에서 AI 채팅 모드를 엽니다.
2. **#zava**를 입력하고 시작한 MCP 서버 중 하나를 선택합니다.
3. 판매 데이터에 대한 질문을 합니다 - 아래 샘플 쿼리를 참조하세요.

### 샘플 쿼리

1. 매출 수익 기준 상위 20개 제품을 보여주세요.
1. 매장별 판매를 보여주세요.
1. 지난 분기의 카테고리별 판매는 어땠나요?
1. "페인트 용기"와 유사한 제품은 무엇인가요?

## 기능

- **다중 테이블 스키마 액세스**: 단일 요청으로 여러 데이터베이스 테이블의 스키마를 검색
- **안전한 쿼리 실행**: Row Level Security (RLS) 지원으로 PostgreSQL 쿼리 실행
- **실시간 데이터**: 현재 판매, 재고 및 고객 데이터 액세스
- **날짜/시간 유틸리티**: 시간 민감한 분석을 위한 현재 UTC 타임스탬프 제공
- **유연한 배포**: HTTP 서버 모드 지원

## 지원되는 테이블

서버는 다음 소매 데이터베이스 테이블에 대한 액세스를 제공합니다:

- `retail.customers` - 고객 정보 및 프로필
- `retail.stores` - 매장 위치 및 세부 정보
- `retail.categories` - 제품 카테고리 및 계층 구조
- `retail.product_types` - 제품 유형 분류
- `retail.products` - 제품 카탈로그 및 사양
- `retail.orders` - 고객 주문 및 거래
- `retail.order_items` - 주문 내 개별 항목
- `retail.inventory` - 현재 재고 수준 및 재고 데이터

## 사용 가능한 도구

### `get_multiple_table_schemas`

단일 요청으로 여러 테이블의 데이터베이스 스키마를 검색합니다.

**매개변수**:

- `table_names` (list[str]): 위의 지원되는 테이블에서 유효한 테이블 이름 목록

**반환값**: 요청된 테이블에 대한 스키마 문자열을 연결하여 반환

### `execute_sales_query`

Row Level Security를 지원하는 판매 데이터베이스에 대해 PostgreSQL 쿼리를 실행합니다.

**매개변수**:

- `postgresql_query` (str): 잘 형식화된 PostgreSQL 쿼리

**반환값**: 문자열로 포맷된 쿼리 결과 (가독성을 위해 20행으로 제한)

**최고의 실습**:

- 항상 테이블 스키마를 먼저 가져오세요.
- 스키마에서 정확한 열 이름을 사용하세요.
- 포괄적인 분석을 위해 관련 테이블을 조인하세요.
- 적절할 때 결과를 집계하세요.
- 가독성을 위해 출력 제한

### `get_current_utc_date`

현재 UTC 날짜와 시간을 ISO 형식으로 가져옵니다.

**반환값**: ISO 형식의 현재 UTC 날짜/시간 (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

사용자 쿼리를 기반으로 제품에 대한 의미론적 검색을 수행합니다.

**반환값**: 검색 기준에 맞는 제품 목록

**매개변수**:

- `query` (str): 검색 쿼리 문자열

**반환값**: 검색 기준에 맞는 제품 목록

## 보안 기능

### Row Level Security (RLS)

서버는 사용자가 권한이 있는 데이터만 액세스하도록 Row Level Security를 구현합니다:

- **HTTP 모드**: 요청 사용자 식별을 위해 `x-rls-user-id` 헤더를 사용
- **기본 폴백**: 사용자 ID가 제공되지 않을 경우 플레이스홀더 UUID 사용

#### 매장별 RLS 사용자 ID

각 Zava Retail 매장 위치는 사용자가 액세스할 수 있는 데이터를 결정하는 고유한 RLS 사용자 ID를 가지고 있습니다:

| 매장 위치 | RLS 사용자 ID | 설명 |
|-----------|---------------|------|
| **글로벌 액세스** | `00000000-0000-0000-0000-000000000000` | 기본 폴백 - 모든 매장 액세스 |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle 매장 데이터 |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue 매장 데이터 |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma 매장 데이터 |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane 매장 데이터 |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett 매장 데이터 |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond 매장 데이터 |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland 매장 데이터 |
| **온라인** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail 온라인 매장 데이터 |

#### RLS 구현

사용자가 특정 매장의 RLS 사용자 ID로 연결하면 다음만 볼 수 있습니다:

- 해당 매장과 관련된 고객
- 해당 매장에서 이루어진 주문
- 특정 매장의 재고 데이터
- 매장별 판매 및 성과 지표

이는 서로 다른 매장 위치 간 데이터 분리를 보장하면서 통합된 데이터베이스 스키마를 유지합니다.

## 아키텍처

### 애플리케이션 컨텍스트

서버는 관리되는 애플리케이션 컨텍스트를 사용합니다:

- **데이터베이스 연결 풀**: HTTP 모드에 대한 효율적인 연결 관리
- **수명 주기 관리**: 종료 시 적절한 리소스 정리
- **타입 안전성**: `AppContext` 데이터 클래스와 강력한 타입 컨텍스트

### 요청 컨텍스트

- **헤더 추출**: 사용자 식별을 위한 안전한 헤더 파싱
- **RLS 통합**: 요청 컨텍스트에서 자동 사용자 ID 확인
- **오류 처리**: 사용자 친화적인 메시지를 포함한 포괄적인 오류 처리

## 데이터베이스 통합

서버는 `PostgreSQLSchemaProvider` 클래스를 통해 PostgreSQL 데이터베이스와 통합됩니다:

- **연결 풀링**: 확장성을 위한 비동기 연결 풀 사용
- **스키마 메타데이터**: 상세한 테이블 스키마 정보 제공
- **쿼리 실행**: RLS 지원으로 안전한 쿼리 실행
- **리소스 관리**: 데이터베이스 리소스의 자동 정리

## 오류 처리

서버는 강력한 오류 처리를 구현합니다:

- **테이블 검증**: 유효한 테이블 이름만 액세스하도록 보장
- **쿼리 검증**: 실행 전에 PostgreSQL 쿼리 검증
- **리소스 관리**: 오류 발생 시에도 적절한 정리
- **사용자 친화적인 메시지**: 문제 해결을 위한 명확한 오류 메시지

## 보안 고려 사항

1. **Row Level Security**: 모든 쿼리는 사용자 신원에 따라 RLS 정책을 준수합니다.
2. **매장 데이터 분리**: 각 매장의 RLS 사용자 ID는 해당 매장의 데이터만 액세스하도록 보장합니다.
3. **입력 검증**: 테이블 이름과 쿼리는 실행 전에 검증됩니다.
4. **리소스 제한**: 과도한 리소스 사용을 방지하기 위해 쿼리 결과를 제한합니다.
5. **연결 보안**: 안전한 데이터베이스 연결 관행을 사용합니다.
6. **사용자 신원 확인**: 항상 올바른 RLS 사용자 ID가 의도된 매장에 사용되도록 보장합니다.

### 중요한 보안 주의 사항

- **개발 환경에서 프로덕션 RLS 사용자 ID를 사용하지 마세요**
- **쿼리를 실행하기 전에 RLS 사용자 ID가 의도된 매장과 일치하는지 확인하세요**
- **기본 UUID (`00000000-0000-0000-0000-000000000000`)는 제한된 액세스를 제공합니다**
- **각 매장 관리자는 자신의 매장 RLS 사용자 ID만 액세스해야 합니다**

## 개발

### 프로젝트 구조

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### 주요 구성 요소

- **FastMCP 서버**: 비동기 지원을 갖춘 현대적인 MCP 서버 구현
- **PostgreSQL 제공자**: RLS 지원 데이터베이스 추상화 계층
- **컨텍스트 관리**: 타입 안전 애플리케이션 및 요청 컨텍스트 처리
- **도구 등록**: Pydantic 검증을 통한 선언적 도구 등록

## 기여

이 서버에 기여할 때:

1. 모든 데이터베이스 쿼리가 Row Level Security를 준수하도록 보장하세요.
2. 새로운 도구에 적절한 오류 처리를 추가하세요.
3. 새로운 기능이나 변경 사항이 있을 경우 이 README를 업데이트하세요.
4. HTTP 서버 모드를 테스트하세요.
5. 입력 매개변수를 검증하고 명확한 오류 메시지를 제공하세요.

## [라이선스](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*이 MCP 서버는 AI 기반 분석 및 인사이트를 위한 Zava Retail 판매 데이터에 안전하고 효율적으로 액세스할 수 있도록 합니다.*

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 신뢰할 수 있는 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.