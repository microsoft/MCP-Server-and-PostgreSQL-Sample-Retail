<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:23:18+00:00",
  "source_file": "azd/README.md",
  "language_code": "tr"
}
-->
# Azure Developer CLI (azd) Hızlı Başlangıç

## 🚀 Azure Developer CLI ile Dağıtım

Bu proje, hem altyapının hem de MCP sunucu uygulamasının otomatik dağıtımı için artık Azure Developer CLI (azd) ile tamamen uyumludur.

### Gereksinimler

1. **Azure Developer CLI'yi Yükleyin**:
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

2. **Azure'a Giriş Yapın**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Tek Komutla Dağıtım

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

### 🔧 Geliştirme İş Akışı

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

### 📦 Neler Dağıtılır?

#### **Altyapı**
- Kaynak Grubu
- Log Analytics Çalışma Alanı  
- Application Insights
- Azure AI Hizmetleri (OpenAI modelleriyle)
- Container App Ortamı

#### **Uygulama**
- MCP Sunucusu (Container App)
- Sağlık izleme etkin
- Ortam değişkenleri yapılandırılmış
- Application Insights entegrasyonu

### 🌍 Ortam Değişkenleri

Dağıtımdan sonra, bu değişkenler otomatik olarak kullanılabilir hale gelir:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 İzleme ve Yönetim

- **Azure Portal**: Kaynak grubunuzdaki tüm kaynakları görüntüleyin
- **Application Insights**: Uygulama performansını ve günlüklerini izleyin
- **Container Apps**: Uygulama günlüklerini ve metriklerini görüntüleyin
- **AI Studio**: OpenAI model dağıtımlarını yönetin

### 📋 Sorun Giderme

#### **Yaygın Sorunlar**

1. **Desteklenmeyen konum**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Kaynak kotası aşıldı**:
   - Azure Portal'da abonelik limitlerinizi kontrol edin
   - Farklı bir bölgeyi deneyin

3. **Kimlik doğrulama sorunları**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Dağıtım günlüklerini görüntüleyin**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatif: Manuel Dağıtım

Manuel dağıtımı tercih ederseniz, `/infra` klasöründeki altyapıyı kullanabilirsiniz:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Daha Fazla Bilgi Edinin

- [Azure Developer CLI Belgeleri](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Belgeleri](https://docs.microsoft.com/azure/container-apps/)
- [Azure AI Hizmetleri Belgeleri](https://docs.microsoft.com/azure/ai-services/)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.