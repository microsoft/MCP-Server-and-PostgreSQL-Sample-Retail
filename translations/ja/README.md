<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T16:53:51+00:00",
  "source_file": "README.md",
  "language_code": "ja"
}
-->
# MCPサーバーとPostgreSQLサンプル - 小売売上分析

## データベース統合を学ぶ実践的なMCP例

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

以下の手順に従って、これらのリソースを活用してください：

1. **リポジトリをフォーク**: [こちらをクリックしてフォーク](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **リポジトリをクローン**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discordに参加**: [専門家や開発者と交流](https://discord.com/invite/ByRwuEEgH4)

### 🌐 多言語対応

#### GitHub Actionによるサポート (自動更新)

[フランス語](../fr/README.md) | [スペイン語](../es/README.md) | [ドイツ語](../de/README.md) | [ロシア語](../ru/README.md) | [アラビア語](../ar/README.md) | [ペルシャ語 (ファルシ)](../fa/README.md) | [ウルドゥー語](../ur/README.md) | [中国語 (簡体字)](../zh/README.md) | [中国語 (繁体字, マカオ)](../mo/README.md) | [中国語 (繁体字, 香港)](../hk/README.md) | [中国語 (繁体字, 台湾)](../tw/README.md) | [日本語](./README.md) | [韓国語](../ko/README.md) | [ヒンディー語](../hi/README.md) | [ベンガル語](../bn/README.md) | [マラーティー語](../mr/README.md) | [ネパール語](../ne/README.md) | [パンジャブ語 (グルムキー)](../pa/README.md) | [ポルトガル語 (ポルトガル)](../pt/README.md) | [ポルトガル語 (ブラジル)](../br/README.md) | [イタリア語](../it/README.md) | [ポーランド語](../pl/README.md) | [トルコ語](../tr/README.md) | [ギリシャ語](../el/README.md) | [タイ語](../th/README.md) | [スウェーデン語](../sv/README.md) | [デンマーク語](../da/README.md) | [ノルウェー語](../no/README.md) | [フィンランド語](../fi/README.md) | [オランダ語](../nl/README.md) | [ヘブライ語](../he/README.md) | [ベトナム語](../vi/README.md) | [インドネシア語](../id/README.md) | [マレー語](../ms/README.md) | [タガログ語 (フィリピン)](../tl/README.md) | [スワヒリ語](../sw/README.md) | [ハンガリー語](../hu/README.md) | [チェコ語](../cs/README.md) | [スロバキア語](../sk/README.md) | [ルーマニア語](../ro/README.md) | [ブルガリア語](../bg/README.md) | [セルビア語 (キリル文字)](../sr/README.md) | [クロアチア語](../hr/README.md) | [スロベニア語](../sl/README.md) | [ウクライナ語](../uk/README.md) | [ビルマ語 (ミャンマー)](../my/README.md)

**追加の翻訳を希望する場合は、サポートされている言語のリストを[こちら](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)で確認できます。**

## はじめに

このサンプルでは、PostgreSQLを通じて小売売上データに安全かつインテリジェントにアクセスできるAIアシスタントを提供する包括的な**Model Context Protocol (MCP)サーバー**の構築とデプロイ方法を示します。このプロジェクトは、**行レベルセキュリティ (RLS)**、**セマンティック検索機能**、および**Azure AI統合**などのエンタープライズ向け機能を実際の小売分析シナリオで活用する方法を紹介します。

**主なユースケース:**
- **AIによる売上分析**: AIアシスタントが自然言語で小売売上データをクエリし分析できるようにする
- **安全なマルチテナントアクセス**: 各店舗の管理者が自分の店舗データのみアクセスできる行レベルセキュリティの実装を示す
- **セマンティック商品検索**: テキスト埋め込みを使用したAI強化型の商品検索を紹介
- **エンタープライズ統合**: MCPサーバーをAzureサービスやPostgreSQLデータベースと統合する方法を説明

**対象者:**
- データベース統合を伴うMCPサーバー構築を学びたい開発者
- 安全なマルチテナント分析ソリューションを実装するデータエンジニア
- 小売やeコマースデータを扱うAIアプリケーション開発者
- AIアシスタントとエンタープライズデータベースを組み合わせたい方

## Azure AI Foundry Discordコミュニティに参加しよう
MCPの経験を共有し、専門家や製品グループと交流しましょう

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# 売上分析MCPサーバー

Zava Retail DIYビジネス向けの包括的な顧客売上データベースアクセスを提供するModel Context Protocol (MCP)サーバーです。このサーバーは、AIアシスタントが安全でスキーマ対応のインターフェースを通じて小売売上データをクエリし分析できるようにします。

## 📚 完全な実装ガイド

このソリューションの構築方法や類似のMCPサーバーを実装する方法について詳しくは、包括的な**[サンプルウォークスルー](Sample_Walkthrough.md)**をご覧ください。このガイドでは以下を提供します：

- **アーキテクチャの詳細**: コンポーネント分析と設計パターン
- **ステップバイステップの構築**: プロジェクトセットアップからデプロイまで
- **コードの詳細**: MCPサーバー実装の詳細な説明
- **高度な機能**: 行レベルセキュリティ、セマンティック検索、モニタリング
- **ベストプラクティス**: セキュリティ、パフォーマンス、開発ガイドライン
- **トラブルシューティング**: よくある問題とその解決策

このガイドは、実装の詳細を理解し、類似のソリューションを構築したい開発者に最適です。

## 🤖 MCP (Model Context Protocol)とは？

**Model Context Protocol (MCP)**は、AIアシスタントが外部データソースやツールにリアルタイムで安全にアクセスできるようにするオープンスタンダードです。データベース、API、ファイルシステムなどのリソースに接続しながら、セキュリティと制御を維持する橋渡しのような役割を果たします。

### 主なメリット:
- **リアルタイムデータアクセス**: AIアシスタントがライブデータベースやAPIをクエリ可能
- **安全な統合**: 認証と権限による制御されたアクセス
- **ツールの拡張性**: AIアシスタントにカスタム機能を追加可能
- **標準化されたプロトコル**: 異なるAIプラットフォームやツールで利用可能

### MCP初心者向け

Model Context Protocolに初めて触れる方は、Microsoftの包括的な初心者向けリソースをお勧めします：

**📖 [MCP初心者ガイド](https://aka.ms/mcp-for-beginners)**

このリソースでは以下を提供します：
- MCPの概念とアーキテクチャの紹介
- 初めてのMCPサーバー構築のステップバイステップチュートリアル
- MCP開発のベストプラクティス
- 人気のAIプラットフォームとの統合例
- コミュニティリソースとサポート

基本を理解したら、この高度な小売分析実装を探索してください！

## 📚 包括的な学習ガイド: /walkthrough

このリポジトリには、MCP小売サーバーサンプルを分解し、ステップバイステップのレッスンに変換した**12モジュールの学習ウォークスルー**が含まれています。このウォークスルーは、実際の例を包括的な教育リソースに変換し、データベース統合を伴う実用的なMCPサーバーを構築したい開発者に最適です。

### 学べる内容

ウォークスルーでは、基本的なMCP概念から高度な本番デプロイまでを網羅しています：

- **MCPの基本**: Model Context Protocolの理解とその実際の応用
- **データベース統合**: 行レベルセキュリティを備えた安全なPostgreSQL接続の実装
- **AI強化機能**: Azure OpenAI埋め込みを使用したセマンティック検索機能の追加
- **セキュリティ実装**: エンタープライズグレードの認証、認可、データ分離
- **ツール開発**: データ分析やビジネスインテリジェンス向けの高度なMCPツールの構築
- **テストとデバッグ**: 包括的なテスト戦略とデバッグ技術
- **VS Code統合**: 自然言語データベースクエリのためのAIチャット設定
- **本番デプロイ**: コンテナ化、スケーリング、クラウドデプロイ戦略
- **モニタリングと可観測性**: Application Insights、ログ記録、パフォーマンスモニタリング

### 学習パス概要

ウォークスルーは、初心者から上級者までの開発者向けに設計された進行的な学習構造を採用しています：

| モジュール | フォーカスエリア | 説明 | 推定時間 |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | 基礎 | MCPの概念、Zava Retailのケーススタディ、アーキテクチャ概要 | 30分 |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | 設計パターン | 技術アーキテクチャ、レイヤードデザイン、システムコンポーネント | 45分 |
| **[02-Security](walkthrough/02-Security/README.md)** | エンタープライズセキュリティ | Azure認証、行レベルセキュリティ、マルチテナント分離 | 60分 |
| **[03-Setup](walkthrough/03-Setup/README.md)** | 環境 | Dockerセットアップ、Azure CLI、プロジェクト構成、検証 | 45分 |
| **[04-Database](walkthrough/04-Database/README.md)** | データ層 | PostgreSQLスキーマ、pgvector、RLSポリシー、サンプルデータ | 60分 |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | コア実装 | FastMCPフレームワーク、データベース統合、接続管理 | 90分 |
| **[06-Tools](walkthrough/06-Tools/README.md)** | ツール開発 | MCPツールの作成、クエリ検証、ビジネスインテリジェンス機能 | 75分 |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | AI統合 | Azure OpenAI埋め込み、ベクトル検索、ハイブリッド検索戦略 | 60分 |
| **[08-Testing](walkthrough/08-Testing/README.md)** | 品質保証 | 単体テスト、統合テスト、パフォーマンステスト、デバッグ | 75分 |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | 開発体験 | VS Code設定、AIチャット統合、デバッグワークフロー | 45分 |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | 本番対応 | コンテナ化、Azure Container Apps、CI/CDパイプライン、スケーリング | 90分 |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | 可観測性 | Application Insights、構造化ログ記録、パフォーマンス指標 | 60分 |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | 本番の優秀性 | セキュリティ強化、パフォーマンス最適化、エンタープライズパターン | 45分 |

**総学習時間**: 約12～15時間の包括的な実践学習

### 🎯 ウォークスルーの活用方法

**初心者向け**:
1. [モジュール00: Introduction](walkthrough/00-Introduction/README.md)から始めてMCPの基本を理解
2. モジュールを順番に進めて完全な学習体験を得る
3. 各モジュールは前の概念を基に構築され、実践的な演習を含む

**経験豊富な開発者向け**:
1. [メインウォークスルー概要](walkthrough/README.md)を確認してモジュールの要約を把握
2. 興味のある特定のモジュールにジャンプ (例: モジュール07のAI統合)
3. 個々のモジュールを自身のプロジェクトの参考資料として使用

**本番実装向け**:
1. モジュール02 (セキュリティ)、10 (デプロイ)、11 (モニタリング)に注力
2. モジュール12 (ベストプラクティス)をエンタープライズガイドラインとして確認
3. コード例を本番対応のテンプレートとして使用

### 🚀 クイックスタートオプション

**オプション1: 完全な学習パス** (初心者に推奨)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**オプション2: 実践的な実装** (すぐに構築を開始)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**オプション3: 本番対応** (エンタープライズデプロイ)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 学習の前提条件

**推奨される背景知識**:
- 基本的なPythonプログラミング経験
- REST APIとデータベースの基礎知識
- AI/MLの基本概念の理解
- 基本的なコマンドライン操作とDockerの知識

**必須ではないが役立つ知識**:
- MCPの事前経験（ゼロから学べる内容を提供）
- Azureクラウドの経験（ステップバイステップのガイドを提供）
- 高度なPostgreSQLの知識（必要に応じて概念を説明）

### 💡 学習のコツ

1. **実践的アプローチ**: 各モジュールには実行可能なコード例が含まれており、変更して試すことができます
2. **段階的な複雑化**: 概念はシンプルなものから高度なものへと徐々に構築されます
3. **実世界の文脈**: すべての例は現実的な小売業のビジネスシナリオを使用しています
4. **実運用対応**: コード例は実際の運用で使用できるよう設計されています
5. **コミュニティサポート**: [Discordコミュニティ](https://discord.com/invite/ByRwuEEgH4)に参加して、助けを求めたり議論したりできます

### 🔗 関連リソース

- **[MCP初心者向け](https://aka.ms/mcp-for-beginners)**: 基本的な背景知識
- **[サンプルウォークスルー](Sample_Walkthrough.md)**: 高レベルの技術概要
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: 例で使用されるクラウドプラットフォーム
- **[FastMCPフレームワーク](https://github.com/jlowin/fastmcp)**: PythonによるMCP実装フレームワーク

**学習を始める準備はできましたか？** **[モジュール00: はじめに](walkthrough/00-Introduction/README.md)** から始めるか、**[完全なウォークスルー概要](walkthrough/README.md)** を探索してください。

## 前提条件

1. Docker Desktopのインストール
2. Gitのインストール
3. **Azure CLI**: Azure CLIをインストールして認証
4. OpenAIの`text-embedding-3-small`モデルへのアクセス、必要に応じて`gpt-4o-mini`モデル

## 始め方

ターミナルウィンドウを開き、以下のコマンドを実行してください:

1. Azure CLIで認証

    ```bash
    az login
    ```

2. リポジトリをクローン

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. プロジェクトディレクトリに移動

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azureリソースのデプロイ

MCPサーバーに必要なAzureリソースを自動的にデプロイするスクリプトを実行します。

デプロイスクリプトは`text-embedding-3-small`モデルを自動的にデプロイします。デプロイ中に、オプションで`gpt-4o-mini`モデルを含めることもできます。ただし、`gpt-4o-mini`はこのプロジェクトには**必須ではありません**。将来的な拡張のために含まれています。

**プラットフォームに応じたスクリプトを選択してください:**

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

## MCPサーバーの実行

PostgreSQLとMCPサーバーを含む完全なスタックを実行する最も簡単な方法は、Docker Composeを使用することです。

### スタックの起動

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

## 使用方法

以下は、組み込みのVS Code MCPサーバーサポートを使用することを前提としています。

1. プロジェクトをVS Codeで開き、ターミナルから以下を実行:

    ```bash
    code .
    ```

2. `.vscode/mcp.json`内の設定を使用して、1つ以上のMCPサーバーを起動します。このファイルには、異なる店舗管理者の役割を表す4つのサーバー設定が含まれています:

   - 各設定は固有のRLS（行レベルセキュリティ）ユーザーIDを使用します
   - これらのユーザーIDは、異なる店舗管理者がデータベースにアクセスする際のアイデンティティをシミュレートします
   - RLSシステムは、管理者に割り当てられた店舗に基づいてデータアクセスを制限します
   - これは、店舗管理者が異なるEntra IDアカウントでサインインする実世界のシナリオを模倣しています

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

### VS Code AIチャットを開く

1. VS CodeでAIチャットモードを開きます
2. **#zava**と入力し、起動したMCPサーバーの1つを選択します
3. 売上データについて質問してください - 以下のサンプルクエリを参照

### サンプルクエリ

1. 売上収益で上位20の商品を表示
1. 店舗ごとの売上を表示
1. 前四半期のカテゴリ別売上は？
1. 「ペイント用コンテナ」に似た商品は何を販売していますか？

## 機能

- **複数テーブルスキーマアクセス**: 単一のリクエストで複数のデータベーステーブルのスキーマを取得
- **安全なクエリ実行**: 行レベルセキュリティ（RLS）対応のPostgreSQLクエリを実行
- **リアルタイムデータ**: 現在の売上、在庫、顧客データにアクセス
- **日付/時間ユーティリティ**: 時間に敏感な分析のための現在のUTCタイムスタンプを取得
- **柔軟なデプロイ**: HTTPサーバーモードをサポート

## 対応テーブル

サーバーは以下の小売データベーステーブルへのアクセスを提供します:

- `retail.customers` - 顧客情報とプロフィール
- `retail.stores` - 店舗の所在地と詳細
- `retail.categories` - 商品カテゴリと階層
- `retail.product_types` - 商品タイプの分類
- `retail.products` - 商品カタログと仕様
- `retail.orders` - 顧客注文と取引
- `retail.order_items` - 注文内の個別アイテム
- `retail.inventory` - 現在の在庫レベルと在庫データ

## 利用可能なツール

### `get_multiple_table_schemas`

複数のテーブルのデータベーススキーマを単一のリクエストで取得します。

**パラメータ:**

- `table_names` (list[str]): 上記の対応テーブルから有効なテーブル名のリスト

**戻り値:** リクエストされたテーブルのスキーマ文字列を連結したもの

### `execute_sales_query`

行レベルセキュリティ対応のPostgreSQLクエリを売上データベースに対して実行します。

**パラメータ:**

- `postgresql_query` (str): 正しい形式のPostgreSQLクエリ

**戻り値:** 読みやすさのために20行に制限されたクエリ結果の文字列形式

**ベストプラクティス:**

- まずテーブルスキーマを取得する
- スキーマから正確な列名を使用する
- 関連するテーブルを結合して包括的な分析を行う
- 適切に集計する
- 読みやすさのために出力を制限する

### `get_current_utc_date`

現在のUTC日付と時刻をISO形式で取得します。

**戻り値:** ISO形式（YYYY-MM-DDTHH:MM:SS.fffffZ）の現在のUTC日付/時刻

### `semantic_search_products`

ユーザーのクエリに基づいて商品をセマンティック検索します。

**戻り値:** 検索条件に一致する商品のリスト

**パラメータ:**

- `query` (str): 検索クエリ文字列

**戻り値:** 検索条件に一致する商品のリスト

## セキュリティ機能

### 行レベルセキュリティ (RLS)

サーバーは行レベルセキュリティを実装しており、ユーザーが許可されたデータのみをアクセスできるようにします:

- **HTTPモード**: リクエストユーザーを識別するために`x-rls-user-id`ヘッダーを使用
- **デフォルトフォールバック**: ユーザーIDが提供されない場合はプレースホルダーUUIDを使用

#### 店舗固有のRLSユーザーID

各Zava Retail店舗には、ユーザーがアクセスできるデータを決定する固有のRLSユーザーIDがあります:

| 店舗所在地 | RLSユーザーID | 説明 |
|---------------|-------------|-------------|
| **グローバルアクセス** | `00000000-0000-0000-0000-000000000000` | デフォルトフォールバック - 全店舗アクセス |
| **シアトル** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retailシアトル店舗データ |
| **ベルビュー** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retailベルビュー店舗データ |
| **タコマ** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retailタコマ店舗データ |
| **スポケーン** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retailスポケーン店舗データ |
| **エバレット** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retailエバレット店舗データ |
| **レドモンド** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retailレドモンド店舗データ |
| **カークランド** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retailカークランド店舗データ |
| **オンライン** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retailオンライン店舗データ |

#### RLSの実装

特定の店舗のRLSユーザーIDで接続すると、以下のみが表示されます:

- その店舗に関連する顧客
- その店舗で行われた注文
- その店舗の在庫データ
- 店舗固有の売上とパフォーマンス指標

これにより、異なる店舗間でデータが分離され、統一されたデータベーススキーマが維持されます。

## アーキテクチャ

### アプリケーションコンテキスト

サーバーは以下を備えた管理されたアプリケーションコンテキストを使用します:

- **データベース接続プール**: HTTPモードの効率的な接続管理
- **ライフサイクル管理**: シャットダウン時の適切なリソースクリーンアップ
- **型安全性**: `AppContext`データクラスを使用した強く型付けされたコンテキスト

### リクエストコンテキスト

- **ヘッダー抽出**: ユーザー識別のための安全なヘッダー解析
- **RLS統合**: リクエストコンテキストからの自動ユーザーID解決
- **エラーハンドリング**: ユーザーに優しいメッセージを含む包括的なエラーハンドリング

## データベース統合

サーバーは`PostgreSQLSchemaProvider`クラスを通じてPostgreSQLデータベースと統合します:

- **接続プール**: スケーラビリティのための非同期接続プールを使用
- **スキーマメタデータ**: 詳細なテーブルスキーマ情報を提供
- **クエリ実行**: RLS対応の安全なクエリ実行
- **リソース管理**: データベースリソースの自動クリーンアップ

## エラーハンドリング

サーバーは堅牢なエラーハンドリングを実装しています:

- **テーブル検証**: 有効なテーブル名のみがアクセスされることを保証
- **クエリ検証**: 実行前にPostgreSQLクエリを検証
- **リソース管理**: エラー発生時でも適切にクリーンアップ
- **ユーザーに優しいメッセージ**: トラブルシューティングのための明確なエラーメッセージ

## セキュリティ考慮事項

1. **行レベルセキュリティ**: すべてのクエリはユーザーのアイデンティティに基づくRLSポリシーを尊重
2. **店舗データの分離**: 各店舗のRLSユーザーIDはその店舗のデータのみへのアクセスを保証
3. **入力検証**: テーブル名とクエリは実行前に検証
4. **リソース制限**: 過剰なリソース使用を防ぐためにクエリ結果を制限
5. **接続セキュリティ**: 安全なデータベース接続プラクティスを使用
6. **ユーザーアイデンティティの検証**: 常に正しいRLSユーザーIDが意図した店舗に使用されていることを確認

### 重要なセキュリティ注意事項

- **開発環境で本番用RLSユーザーIDを使用しないでください**
- **クエリを実行する前にRLSユーザーIDが意図した店舗に一致していることを常に確認してください**
- **デフォルトUUID (`00000000-0000-0000-0000-000000000000`) は限定的なアクセスを提供します**
- **各店舗管理者は自店舗のRLSユーザーIDのみアクセス可能であるべきです**

## 開発

### プロジェクト構造

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### 主要コンポーネント

- **FastMCPサーバー**: 非同期サポートを備えた最新のMCPサーバー実装
- **PostgreSQLプロバイダー**: RLS対応のデータベース抽象化レイヤー
- **コンテキスト管理**: 型安全なアプリケーションおよびリクエストコンテキストの処理
- **ツール登録**: Pydantic検証を使用した宣言的ツール登録

## コントリビューション

このサーバーに貢献する際は:

1. すべてのデータベースクエリが行レベルセキュリティを尊重することを確認
2. 新しいツールに適切なエラーハンドリングを追加
3. 新機能や変更があればこのREADMEを更新
4. HTTPサーバーモードをテスト
5. 入力パラメータを検証し、明確なエラーメッセージを提供

## [ライセンス](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*このMCPサーバーは、AIを活用した分析とインサイトのためにZava Retailの売上データへの安全で効率的なアクセスを可能にします。*

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源とみなしてください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解について、当方は責任を負いません。