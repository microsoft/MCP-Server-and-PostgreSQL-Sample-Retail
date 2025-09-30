<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:21:02+00:00",
  "source_file": "azd/README.md",
  "language_code": "ja"
}
-->
# Azure Developer CLI (azd) クイックスタート

## 🚀 Azure Developer CLI を使ったデプロイ

このプロジェクトは、インフラストラクチャと MCP サーバーアプリケーションの自動デプロイに対応した Azure Developer CLI (azd) と完全に互換性があります。

### 前提条件

1. **Azure Developer CLI をインストール**:
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

2. **Azure にログイン**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 ワンコマンドでのデプロイ

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

### 🔧 開発ワークフロー

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

### 📦 デプロイされる内容

#### **インフラストラクチャ**
- リソースグループ
- Log Analytics ワークスペース  
- Application Insights
- Azure AI サービス (OpenAI モデルを含む)
- コンテナアプリ環境

#### **アプリケーション**
- MCP サーバー (コンテナアプリ)
- ヘルスモニタリング有効化
- 環境変数の設定済み
- Application Insights 統合

### 🌍 環境変数

デプロイ後、以下の変数が自動的に利用可能になります:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 モニタリングと管理

- **Azure ポータル**: リソースグループ内のすべてのリソースを確認
- **Application Insights**: アプリケーションのパフォーマンスとログを監視
- **コンテナアプリ**: アプリケーションのログとメトリクスを確認
- **AI Studio**: OpenAI モデルのデプロイを管理

### 📋 トラブルシューティング

#### **よくある問題**

1. **ロケーションがサポートされていない**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **リソースクォータが超過している**:
   - Azure ポータルでサブスクリプションの制限を確認
   - 別のリージョンを試す

3. **認証の問題**:
   ```bash
   azd auth login --use-device-code
   ```

4. **デプロイメントログを確認**:
   ```bash
   azd show --output json
   ```

### 🔄 代替案: 手動デプロイ

手動デプロイを希望する場合でも、`/infra` フォルダー内のインフラストラクチャを利用できます:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 詳しく学ぶ

- [Azure Developer CLI ドキュメント](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [コンテナアプリ ドキュメント](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI サービス ドキュメント](https://docs.microsoft.com/azure/ai-services/)

---

**免責事項**:  
この文書は、AI翻訳サービス [Co-op Translator](https://github.com/Azure/co-op-translator) を使用して翻訳されています。正確性を追求しておりますが、自動翻訳には誤りや不正確な部分が含まれる可能性があります。元の言語で記載された文書を正式な情報源としてお考えください。重要な情報については、専門の人間による翻訳を推奨します。この翻訳の使用に起因する誤解や誤解釈について、当方は一切の責任を負いません。