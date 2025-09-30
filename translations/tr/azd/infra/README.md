<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:26:38+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "tr"
}
-->
# Altyapı Şablonları

Bu klasör, MCP Perakende Analitik projesi için altyapı dağıtım şablonlarını içerir.

## 📁 Dosya Genel Bakışı

| Dosya | Açıklama | Kullanım Durumu |
|-------|----------|-----------------|
| `azuredeploy.json` | **ARM şablonu** - Tam abonelik kapsamlı dağıtım | Tüm dağıtımlar için önerilir |
| `azuredeploy.parameters.json` | **ARM parametreleri** - Statik yapılandırma değerleri | `azuredeploy.json` ile birlikte kullanılır |
| `ARM-DEPLOYMENT.md` | **ARM dağıtım kılavuzu** - Ayrıntılı talimatlar | Tam dağıtım dokümantasyonu |
| `README.md` | **Bu dosya** - Altyapı genel bakışı | Hızlı referans |

## 🚀 Dağıtım Seçenekleri

### Seçenek 1: Azure CLI (Önerilen)
Kaynak grubu oluşturma ile tam dağıtım:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Seçenek 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Seçenek 3: Azure Portal
1. [Azure Portal](https://portal.azure.com) adresine gidin
2. "Özel bir şablon dağıt" araması yapın
3. `azuredeploy.json` dosyasını yükleyin
4. Parametreleri yapılandırın ve dağıtımı başlatın

## 🏗️ Altyapı Bileşenleri

ARM şablonu aşağıdaki altyapıyı dağıtır:

- **Kaynak Grubu**: Tutarlı adlandırma ile tüm kaynaklar için konteyner
- **Log Analytics Çalışma Alanı**: Merkezi günlük kaydı ve izleme (30 günlük saklama süresi)
- **Application Insights**: Log Analytics ile entegre uygulama performansı izleme
- **Azure AI Hizmetleri**: Yönetilen kimlik ile çoklu hizmet AI merkezi (S0 katmanı)
- **OpenAI Modelleri**:
  - `gpt-4o-mini` (120 kapasite) - Sohbet ve tamamlama modeli
  - `text-embedding-3-small` (50 kapasite) - Anlamsal arama için metin gömme

## 🔧 Şablon Yapılandırması

### Parametreler
ARM şablonu aşağıdaki özelleştirilebilir parametreleri kabul eder:

| Parametre | Varsayılan | Açıklama |
|-----------|------------|----------|
| `resourcePrefix` | `mcpretail` | Tüm kaynak adları için ön ek |
| `location` | `westus2` | Dağıtım için Azure bölgesi |
| `uniqueSuffix` | Otomatik oluşturulur | 4 karakterlik benzersiz tanımlayıcı |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Görünen ad |
| `gptModelCapacity` | `120` | GPT model token kapasitesi |
| `embeddingModelCapacity` | `50` | Gömme model kapasitesi |

### Kaynak Adlandırma Kuralları
Tüm kaynaklar şu deseni takip eder: `{type}-{resourcePrefix}-{uniqueSuffix}`

Örnekler:
- Kaynak Grubu: `rg-mcpretail-demo`
- AI Hizmeti: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Şablon Doğrulama

### Dağıtımdan Önce Doğrulama
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Dağıtım Durumunu Kontrol Etme
```bash
az deployment sub list --output table
```

## 💰 Maliyet Tahmini

Geliştirme iş yükü için tahmini aylık maliyetler:

| Hizmet | Yapılandırma | Tah. Maliyet/Ay |
|--------|--------------|-----------------|
| Azure AI Hizmetleri | S0 katmanı | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI Gömme | 50K token | $5-15 |
| Application Insights | Temel izleme | $5-15 |
| Log Analytics | 1GB/ay | $2-5 |
| **Toplam** | | **$42-115** |

## 📚 Ek Kaynaklar

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Sorun giderme ile ayrıntılı dağıtım kılavuzu
- [ARM Şablon Dokümantasyonu](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Hizmetleri Dokümantasyonu](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Dosya doğrulama sonuçları

## 🆘 Hızlı Sorun Giderme

### Yaygın Sorunlar
- **Kimlik Doğrulama**: Kimlik doğrulamak için `az login` çalıştırın
- **Kota Sınırları**: Hedef bölgede OpenAI model kullanılabilirliğini kontrol edin
- **Adlandırma Çakışmaları**: Farklı bir `uniqueSuffix` parametresi kullanın
- **İzinler**: Hesabınızın abonelikte Katkıda Bulunan rolüne sahip olduğundan emin olun

### Yardım Alın
- Ayrıntılı sorun giderme için [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) dosyasına bakın
- Azure Portal'daki dağıtım günlüklerini kontrol edin
- [GitHub Sorunları](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) sayfasını ziyaret edin

---

Tam proje kurulumu için [ana README](../../README.md) veya [proje rehberi](../../walkthrough/README.md) dosyasına bakın.

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel bir insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan herhangi bir yanlış anlama veya yanlış yorumlama durumunda sorumluluk kabul edilmez.