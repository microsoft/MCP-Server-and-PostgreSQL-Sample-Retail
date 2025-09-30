<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:05:52+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ja"
}
-->
# ARM テンプレートデプロイ手順

このドキュメントでは、ARM テンプレートを使用して MCP Retail Analytics インフラストラクチャをデプロイする手順を説明します。

## 📋 概要

`azuredeploy.json` ARM テンプレートは以下を完全にデプロイします:
- Azure リソースグループ
- Log Analytics ワークスペース  
- Application Insights
- Azure AI サービス (Foundry)
- OpenAI モデルデプロイメント (GPT-4o-mini, text-embedding-3-small)

## 🚀 デプロイオプション

### オプション 1: Azure CLI デプロイ

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

### オプション 2: PowerShell デプロイ

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

### オプション 3: Azure ポータル

1. [Azure ポータル](https://portal.azure.com) に移動します
2. 「カスタムテンプレートのデプロイ」を検索します
3. 「エディターで独自のテンプレートを作成」をクリックします
4. `azuredeploy.json` の内容をコピーして貼り付けます
5. 「保存」をクリックし、「レビュー + 作成」を選択します
6. 必要なパラメーターを入力してデプロイします

## 🔧 テンプレートパラメーター

| パラメーター | 型 | デフォルト値 | 説明 |
|-------------|------|-------------|-------------|
| `resourcePrefix` | string | `mcpretail` | リソース名のプレフィックス |
| `location` | string | `westus2` | デプロイする Azure リージョン |
| `uniqueSuffix` | string | 自動生成 | 4文字のユニーク識別子 |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI プロジェクトの表示名 |
| `aiProjectDescription` | string | プロジェクトの説明 | Azure AI Foundry に表示される説明 |
| `gptModelCapacity` | int | `120` | GPT モデルのトークン容量 |
| `embeddingModelCapacity` | int | `50` | 埋め込みモデルのトークン容量 |
| `tags` | object | デフォルトタグ | ガバナンス用のリソースタグ |

## 📤 テンプレート出力

テンプレートは以下の出力を提供します:

| 出力 | 説明 |
|------|-------------|
| `subscriptionId` | Azure サブスクリプション ID |
| `resourceGroupName` | 作成されたリソースグループ名 |
| `aiFoundryName` | Azure AI Foundry サービス名 |
| `foundryEndpoint` | AI サービスのエンドポイント URL |
| `foundryAccountKey` | AI サービスのアクセスキー |
| `deployedModels` | デプロイされた OpenAI モデルの配列 |
| `applicationInsightsConnectionString` | Application Insights の接続文字列 |
| `logAnalyticsWorkspaceName` | Log Analytics ワークスペース名 |

## 🔍 検証コマンド

デプロイ後、リソースを検証します:

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

このプロジェクトでは、ARM テンプレートと Bicep テンプレートの両方を提供しています:

### ARM テンプレート (`azuredeploy.json`)
- ✅ Azure Resource Manager のネイティブ形式
- ✅ ARM がサポートされているすべての環境で動作
- ✅ 追加ツール不要
- ❌ JSON の記述が冗長
- ❌ 読み取りや保守が難しい

### Bicep テンプレート (`main.bicep`)
- ✅ モダンで簡潔な構文
- ✅ 優れたツールと IntelliSense
- ✅ 読み取りや保守が容易
- ✅ コンパイル時の検証
- ❌ Bicep CLI が必要
- ❌ 追加のビルドステップが必要

**推奨**: 開発には Bicep テンプレート (`main.bicep`) を使用し、純粋な ARM JSON が必要なシナリオでは ARM テンプレート (`azuredeploy.json`) を使用してください。

## 🔧 カスタマイズ

### カスタムリソースの追加

ARM テンプレートに追加のリソースを追加するには:

1. ネストされたテンプレートの `resources` 配列にリソース定義を追加します
2. 新しいパラメーターを `parameters` セクションに追加します
3. 必要に応じて対応する出力を追加します
4. パラメーターファイルにデフォルト値を更新します

### 例: ストレージアカウントの追加

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

## 🐛 トラブルシューティング

### よくある問題

#### 1. テンプレート検証エラー
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. リソース名の競合
- `uniqueSuffix` が本当にユニークであることを確認してください
- 自動生成には `uniqueString()` 関数を使用してください
- 対象リージョン内の既存リソースを確認してください

#### 3. クォータ制限
- 対象リージョンで OpenAI モデルが利用可能か確認してください
- AI サービスのサブスクリプションクォータを確認してください
- 制限がある場合は別のリージョンを検討してください

#### 4. 権限の問題
- アカウントがサブスクリプションで Contributor ロールを持っていることを確認してください
- サブスクリプションが AI サービスを有効にしていることを確認してください
- リソースプロバイダーの登録を確認してください

### デバッグコマンド

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

## 🔐 セキュリティに関する考慮事項

### アクセス制御
- AI サービスは安全なアクセスのためにマネージド ID を使用します
- リソースグループは RBAC の境界を提供します
- Application Insights は別個のアクセス制御を持っています

### ネットワークセキュリティ
- デフォルトでパブリックネットワークアクセスが有効
- 本番環境ではプライベートエンドポイントを検討してください
- 追加のセキュリティのためにネットワーク ACL を設定できます

### キー管理
- AI サービスキーは自動生成されます
- 本番環境の秘密情報には Azure Key Vault を使用してください
- セキュリティのためにキーを定期的にローテーションしてください

## 📚 次のステップ

デプロイが成功した後:

1. **環境変数を設定**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP サーバーを起動**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **統合テスト**:
   - プロジェクトを VS Code で開きます
   - `.vscode/mcp.json` に MCP サーバーを設定します
   - 小売データクエリを使用して AI チャットをテストします

4. **パフォーマンスを監視**:
   - Application Insights でメトリクスを確認します
   - Log Analytics ワークスペースでログを確認します
   - 重要なイベントのアラートを設定します

---

詳細については、[メイン README](../README.md) または [QUICKSTART ガイド](../QUICKSTART.md) を参照してください。

---

**免責事項**:  
この文書は、AI翻訳サービス[Co-op Translator](https://github.com/Azure/co-op-translator)を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があることをご承知ください。元の言語で記載された文書が正式な情報源とみなされるべきです。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。