<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:22:45+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ja"
}
-->
# インフラテンプレート

このフォルダーには、MCP Retail Analyticsプロジェクトのインフラ展開テンプレートが含まれています。

## 📁 ファイル概要

| ファイル | 説明 | 使用ケース |
|----------|------|------------|
| `azuredeploy.json` | **ARMテンプレート** - サブスクリプション全体の展開 | すべての展開に推奨 |
| `azuredeploy.parameters.json` | **ARMパラメーター** - 静的な構成値 | `azuredeploy.json`と併用 |
| `ARM-DEPLOYMENT.md` | **ARM展開ガイド** - 詳細な手順 | 完全な展開ドキュメント |
| `README.md` | **このファイル** - インフラ概要 | クイックリファレンス |

## 🚀 展開オプション

### オプション1: Azure CLI (推奨)
リソースグループ作成を含む完全な展開:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### オプション2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### オプション3: Azureポータル
1. [Azureポータル](https://portal.azure.com)に移動
2. 「カスタムテンプレートを展開」を検索
3. `azuredeploy.json`をアップロード
4. パラメーターを設定して展開

## 🏗️ インフラコンポーネント

ARMテンプレートは以下のインフラを展開します:

- **リソースグループ**: 一貫した命名規則を持つすべてのリソースのコンテナ
- **Log Analytics Workspace**: 中央ログとモニタリング (30日間の保持期間)
- **Application Insights**: Log Analyticsと統合されたアプリケーションパフォーマンスモニタリング
- **Azure AI Services**: 管理されたIDを持つマルチサービスAIハブ (S0ティア)
- **OpenAIモデル**:
  - `gpt-4o-mini` (120キャパシティ) - チャットと補完モデル
  - `text-embedding-3-small` (50キャパシティ) - セマンティック検索用のテキスト埋め込み

## 🔧 テンプレート構成

### パラメーター
ARMテンプレートは以下のカスタマイズ可能なパラメーターを受け付けます:

| パラメーター | デフォルト | 説明 |
|-------------|-----------|------|
| `resourcePrefix` | `mcpretail` | すべてのリソース名の接頭辞 |
| `location` | `westus2` | 展開するAzureリージョン |
| `uniqueSuffix` | 自動生成 | 4文字のユニーク識別子 |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | 表示名 |
| `gptModelCapacity` | `120` | GPTモデルのトークンキャパシティ |
| `embeddingModelCapacity` | `50` | 埋め込みモデルのキャパシティ |

### リソース命名規則
すべてのリソースは以下のパターンに従います: `{type}-{resourcePrefix}-{uniqueSuffix}`

例:
- リソースグループ: `rg-mcpretail-demo`
- AIサービス: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 テンプレート検証

### 展開前の検証
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### 展開状況の確認
```bash
az deployment sub list --output table
```


## 💰 コスト見積もり

開発ワークロードの推定月額コスト:

| サービス | 構成 | 推定月額コスト |
|----------|------|----------------|
| Azure AI Services | S0ティア | $15-50 |
| OpenAI GPT-4o-mini | 120Kトークン | $15-30 |
| OpenAI埋め込み | 50Kトークン | $5-15 |
| Application Insights | 基本モニタリング | $5-15 |
| Log Analytics | 1GB/月 | $2-5 |
| **合計** | | **$42-115** |

## 📚 追加リソース

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - トラブルシューティングを含む詳細な展開ガイド
- [ARMテンプレートドキュメント](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Servicesドキュメント](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - ファイル検証結果

## 🆘 クイックトラブルシューティング

### よくある問題
- **認証**: `az login`を実行して認証
- **クォータ制限**: 対象リージョンでのOpenAIモデルの利用可能性を確認
- **命名の競合**: 別の`uniqueSuffix`パラメーターを使用
- **権限**: サブスクリプションでContributorロールを持つアカウントを確認

### ヘルプを得る
- 詳細なトラブルシューティングについては[ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md)を参照
- Azureポータルで展開ログを確認
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)を訪問

---

プロジェクトの完全なセットアップについては、[メインREADME](../../README.md)または[プロジェクトウォークスルー](../../walkthrough/README.md)を参照してください。

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてお考えください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。