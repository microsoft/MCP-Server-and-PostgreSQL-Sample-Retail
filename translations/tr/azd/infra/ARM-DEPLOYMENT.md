<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:09:55+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "tr"
}
-->
# ARM Şablonu Dağıtım Talimatları

Bu belge, MCP Retail Analytics altyapısını ARM şablonu kullanarak dağıtmak için talimatlar sağlar.

## 📋 Genel Bakış

`azuredeploy.json` ARM şablonu aşağıdaki bileşenlerin tam dağıtımını sağlar:
- Azure Kaynak Grubu
- Log Analytics Çalışma Alanı  
- Application Insights
- Azure AI Hizmetleri (Foundry)
- OpenAI Model Dağıtımları (GPT-4o-mini, text-embedding-3-small)

## 🚀 Dağıtım Seçenekleri

### Seçenek 1: Azure CLI ile Dağıtım

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

### Seçenek 2: PowerShell ile Dağıtım

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

### Seçenek 3: Azure Portal

1. [Azure Portal](https://portal.azure.com) adresine gidin
2. "Özel bir şablon dağıt" araması yapın
3. "Editörde kendi şablonunuzu oluşturun" seçeneğine tıklayın
4. `azuredeploy.json` içeriğini kopyalayıp yapıştırın
5. "Kaydet" ardından "Gözden geçir + oluştur" seçeneğine tıklayın
6. Gerekli parametreleri doldurun ve dağıtımı gerçekleştirin

## 🔧 Şablon Parametreleri

| Parametre | Tür | Varsayılan | Açıklama |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Kaynak adları için ön ek |
| `location` | string | `westus2` | Dağıtım için Azure bölgesi |
| `uniqueSuffix` | string | Otomatik oluşturulmuş | 4 karakterlik benzersiz tanımlayıcı |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | AI projesi için görünen ad |
| `aiProjectDescription` | string | Proje açıklaması | Azure AI Foundry'de gösterilen açıklama |
| `gptModelCapacity` | int | `120` | GPT modelinin token kapasitesi |
| `embeddingModelCapacity` | int | `50` | Embedding modelinin token kapasitesi |
| `tags` | object | Varsayılan etiketler | Yönetim için kaynak etiketleri |

## 📤 Şablon Çıktıları

Şablon aşağıdaki çıktıları sağlar:

| Çıktı | Açıklama |
|--------|-------------|
| `subscriptionId` | Azure abonelik kimliği |
| `resourceGroupName` | Oluşturulan kaynak grubunun adı |
| `aiFoundryName` | Azure AI Foundry hizmet adı |
| `foundryEndpoint` | AI hizmeti uç nokta URL'si |
| `foundryAccountKey` | AI hizmeti erişim anahtarı |
| `deployedModels` | Dağıtılan OpenAI modellerinin dizisi |
| `applicationInsightsConnectionString` | Application Insights bağlantı dizesi |
| `logAnalyticsWorkspaceName` | Log Analytics çalışma alanı adı |

## 🔍 Doğrulama Komutları

Dağıtımdan sonra kaynakları doğrulayın:

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

Bu proje hem ARM hem de Bicep şablonları sağlar:

### ARM Şablonu (`azuredeploy.json`)
- ✅ Yerel Azure Resource Manager formatı
- ✅ ARM'nin desteklendiği her yerde çalışır
- ✅ Ek araç gerektirmez
- ❌ Daha ayrıntılı JSON sözdizimi
- ❌ Okuması ve bakımı daha zor

### Bicep Şablonu (`main.bicep`)
- ✅ Modern, temiz sözdizimi
- ✅ Daha iyi araçlar ve IntelliSense
- ✅ Okuması ve bakımı daha kolay
- ✅ Derleme zamanı doğrulama
- ❌ Bicep CLI gerektirir
- ❌ Ek bir derleme adımı gerektirir

**Öneri**: Geliştirme için Bicep şablonlarını (`main.bicep`), saf ARM JSON gerektiren senaryolar için ARM şablonunu (`azuredeploy.json`) kullanın.

## 🔧 Özelleştirme

### Özel Kaynaklar Eklemek

ARM şablonuna ek kaynaklar eklemek için:

1. Kaynak tanımını iç içe geçmiş şablonun `resources` dizisine ekleyin
2. Yeni parametreleri `parameters` bölümüne ekleyin
3. Gerekirse ilgili çıktıları ekleyin
4. Parametreler dosyasını varsayılan değerlerle güncelleyin

### Örnek: Depolama Hesabı Eklemek

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

## 🐛 Sorun Giderme

### Yaygın Sorunlar

#### 1. Şablon Doğrulama Hataları
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Kaynak Adı Çakışmaları
- `uniqueSuffix`'in gerçekten benzersiz olduğundan emin olun
- Otomatik oluşturma için `uniqueString()` fonksiyonunu kullanın
- Hedef bölgede mevcut kaynakları kontrol edin

#### 3. Kota Sınırları
- Hedef bölgede OpenAI modelinin kullanılabilirliğini doğrulayın
- AI hizmetleri için abonelik kotalarını kontrol edin
- Sınırlar aşılırsa farklı bölgeleri kullanmayı düşünün

#### 4. İzin Sorunları
- Hesabın abonelikte Katkıda Bulunan rolüne sahip olduğundan emin olun
- Aboneliğin AI hizmetleri için etkinleştirildiğini kontrol edin
- Kaynak sağlayıcı kayıtlarını doğrulayın

### Hata Ayıklama Komutları

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

## 🔐 Güvenlik Hususları

### Erişim Kontrolü
- AI hizmeti güvenli erişim için yönetilen kimlik kullanır
- Kaynak grubu RBAC için sınır sağlar
- Application Insights ayrı erişim kontrollerine sahiptir

### Ağ Güvenliği
- Varsayılan olarak genel ağ erişimi etkin
- Üretim için özel uç noktaları düşünün
- Ek güvenlik için ağ ACL'leri yapılandırılabilir

### Anahtar Yönetimi
- AI hizmeti anahtarları otomatik olarak oluşturulur
- Üretim sırları için Azure Key Vault kullanın
- Güvenlik için anahtarları düzenli olarak döndürün

## 📚 Sonraki Adımlar

Başarılı bir dağıtımdan sonra:

1. **Ortam Değişkenlerini Yapılandırın**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **MCP Sunucusunu Başlatın**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Entegrasyonu Test Edin**:
   - Projeyi VS Code'da açın
   - `.vscode/mcp.json` dosyasında MCP sunucularını yapılandırın
   - Perakende veri sorguları ile AI Sohbeti test edin

4. **Performansı İzleyin**:
   - Application Insights'ta metrikleri görüntüleyin
   - Log Analytics çalışma alanında günlükleri kontrol edin
   - Önemli olaylar için uyarılar ayarlayın

---

Daha fazla bilgi için [ana README](../README.md) veya [QUICKSTART rehberi](../QUICKSTART.md) belgelerine bakın.

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.