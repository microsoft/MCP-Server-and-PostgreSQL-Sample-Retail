<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T20:41:00+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "tr"
}
-->
# 🚀 PostgreSQL ile MCP Sunucusu - Tam Öğrenme Rehberi

## 🧠 MCP Veritabanı Entegrasyonu Öğrenme Yolunun Genel Bakışı

Bu kapsamlı öğrenme rehberi, veritabanlarıyla entegre üretime hazır **Model Context Protocol (MCP) sunucuları** oluşturmayı, perakende analitiği uygulaması üzerinden öğretir. **Satır Düzeyinde Güvenlik (RLS)**, **anlamsal arama**, **Azure AI entegrasyonu** ve **çok kiracılı veri erişimi** gibi kurumsal düzeydeki kalıpları öğreneceksiniz.

İster bir backend geliştirici, ister bir AI mühendisi veya veri mimarı olun, bu rehber gerçek dünya örnekleri ve uygulamalı alıştırmalarla yapılandırılmış bir öğrenme sunar.

## 🔗 Resmi MCP Kaynakları

- 📘 [MCP Belgeleri](https://modelcontextprotocol.io/) – Detaylı eğitimler ve kullanıcı kılavuzları
- 📜 [MCP Spesifikasyonu](https://modelcontextprotocol.io/docs/) – Protokol mimarisi ve teknik referanslar
- 🧑‍💻 [MCP GitHub Deposu](https://github.com/modelcontextprotocol) – Açık kaynak SDK'lar, araçlar ve kod örnekleri
- 🌐 [MCP Topluluğu](https://github.com/orgs/modelcontextprotocol/discussions) – Tartışmalara katılın ve topluluğa katkıda bulunun
- 📚 [Yeni Başlayanlar için MCP](https://aka.ms/mcp-for-beginners) – MCP'ye yeniyseniz buradan başlayın

## 🧭 MCP Veritabanı Entegrasyonu Öğrenme Yolu

### 📚 Tam Öğrenme Yapısı

| Modül | Konu | Açıklama | Bağlantı |
|-------|------|----------|----------|
| **Modül 1-3: Temeller** | | | |
| 00 | [MCP Veritabanı Entegrasyonuna Giriş](./00-Introduction/README.md) | MCP'nin veritabanı entegrasyonu ve perakende analitiği kullanım senaryosuna genel bakış | [Buradan Başlayın](./00-Introduction/README.md) |
| 01 | [Temel Mimari Kavramlar](./01-Architecture/README.md) | MCP sunucu mimarisi, veritabanı katmanları ve güvenlik kalıplarını anlama | [Öğren](./01-Architecture/README.md) |
| 02 | [Güvenlik ve Çok Kiracılılık](./02-Security/README.md) | Satır Düzeyinde Güvenlik, kimlik doğrulama ve çok kiracılı veri erişimi | [Öğren](./02-Security/README.md) |
| 03 | [Ortam Kurulumu](./03-Setup/README.md) | Geliştirme ortamı, Docker, Azure kaynaklarının kurulumu | [Kurulum](./03-Setup/README.md) |
| **Modül 4-6: MCP Sunucusunu İnşa Etmek** | | | |
| 04 | [Veritabanı Tasarımı ve Şeması](./04-Database/README.md) | PostgreSQL kurulumu, perakende şema tasarımı ve örnek veri | [İnşa Et](./04-Database/README.md) |
| 05 | [MCP Sunucu Uygulaması](./05-MCP-Server/README.md) | Veritabanı entegrasyonu ile FastMCP sunucusunu oluşturma | [İnşa Et](./05-MCP-Server/README.md) |
| 06 | [Araç Geliştirme](./06-Tools/README.md) | Veritabanı sorgu araçları ve şema inceleme oluşturma | [İnşa Et](./06-Tools/README.md) |
| **Modül 7-9: Gelişmiş Özellikler** | | | |
| 07 | [Anlamsal Arama Entegrasyonu](./07-Semantic-Search/README.md) | Azure OpenAI ve pgvector ile vektör gömme uygulaması | [Geliştir](./07-Semantic-Search/README.md) |
| 08 | [Test ve Hata Ayıklama](./08-Testing/README.md) | Test stratejileri, hata ayıklama araçları ve doğrulama yaklaşımları | [Test Et](./08-Testing/README.md) |
| 09 | [VS Code Entegrasyonu](./09-VS-Code/README.md) | VS Code MCP entegrasyonu ve AI Chat kullanımı yapılandırma | [Entegre Et](./09-VS-Code/README.md) |
| **Modül 10-12: Üretim ve En İyi Uygulamalar** | | | |
| 10 | [Dağıtım Stratejileri](./10-Deployment/README.md) | Docker dağıtımı, Azure Container Apps ve ölçeklendirme dikkate alınması gerekenler | [Dağıt](./10-Deployment/README.md) |
| 11 | [İzleme ve Görünürlük](./11-Monitoring/README.md) | Application Insights, günlük kaydı, performans izleme | [İzle](./11-Monitoring/README.md) |
| 12 | [En İyi Uygulamalar ve Optimizasyon](./12-Best-Practices/README.md) | Performans optimizasyonu, güvenlik güçlendirme ve üretim ipuçları | [Optimize Et](./12-Best-Practices/README.md) |

### 💻 Neler İnşa Edeceksiniz?

Bu öğrenme yolunun sonunda, aşağıdaki özelliklere sahip tam bir **Zava Perakende Analitiği MCP Sunucusu** oluşturmuş olacaksınız:

- **Çok tablolalı perakende veritabanı**: müşteri siparişleri, ürünler ve envanter
- **Satır Düzeyinde Güvenlik**: mağaza bazlı veri izolasyonu
- **Anlamsal ürün arama**: Azure OpenAI gömmeleri ile
- **VS Code AI Chat entegrasyonu**: doğal dil sorguları için
- **Üretime hazır dağıtım**: Docker ve Azure ile
- **Kapsamlı izleme**: Application Insights ile

## 🎯 Öğrenme İçin Ön Koşullar

Bu öğrenme yolundan en iyi şekilde yararlanmak için aşağıdaki bilgilere sahip olmalısınız:

- **Programlama Deneyimi**: Python (tercih edilen) veya benzer dillerle aşinalık
- **Veritabanı Bilgisi**: SQL ve ilişkisel veritabanları hakkında temel bilgi
- **API Kavramları**: REST API'ler ve HTTP kavramlarını anlama
- **Geliştirme Araçları**: Komut satırı, Git ve kod editörleri ile deneyim
- **Bulut Temelleri**: (Opsiyonel) Azure veya benzer bulut platformları hakkında temel bilgi
- **Docker Aşinalığı**: (Opsiyonel) Konteynerleştirme kavramlarını anlama

### Gerekli Araçlar

- **Docker Desktop** - PostgreSQL ve MCP sunucusunu çalıştırmak için
- **Azure CLI** - Bulut kaynaklarını dağıtmak için
- **VS Code** - Geliştirme ve MCP entegrasyonu için
- **Git** - Sürüm kontrolü için
- **Python 3.8+** - MCP sunucu geliştirme için

## 📚 Çalışma Rehberi ve Kaynaklar

Bu öğrenme yolu, etkili bir şekilde gezinmenize yardımcı olacak kapsamlı kaynaklar içerir:

### Çalışma Rehberi

Her modül şunları içerir:
- **Net öğrenme hedefleri** - Neler başaracağınızı
- **Adım adım talimatlar** - Detaylı uygulama rehberleri
- **Kod örnekleri** - Açıklamalı çalışan örnekler
- **Alıştırmalar** - Uygulamalı pratik fırsatları
- **Sorun giderme rehberleri** - Yaygın sorunlar ve çözümleri
- **Ek kaynaklar** - Daha fazla okuma ve keşif

### Ön Koşul Kontrolü

Her modüle başlamadan önce şunları bulacaksınız:
- **Gerekli bilgi** - Önceden bilmeniz gerekenler
- **Kurulum doğrulama** - Ortamınızı nasıl doğrulayacağınız
- **Zaman tahminleri** - Tamamlama için beklenen süre
- **Öğrenme çıktıları** - Tamamladıktan sonra neler öğreneceğiniz

### Önerilen Öğrenme Yolları

Deneyim seviyenize göre yolunuzu seçin:

#### 🟢 **Başlangıç Yolu** (MCP'ye Yeni)
1. Önce [Yeni Başlayanlar için MCP](https://aka.ms/mcp-for-beginners) ile başlayın
2. Temelleri anlamak için modüller 00-03'ü tamamlayın
3. Uygulamalı inşa için modüller 04-06'yı takip edin
4. Pratik kullanım için modüller 07-09'u deneyin

#### 🟡 **Orta Seviye Yolu** (Biraz MCP Deneyimi)
1. Veritabanı odaklı kavramlar için modüller 00-01'i gözden geçirin
2. Uygulama için modüller 02-06'ya odaklanın
3. Gelişmiş özellikler için modüller 07-12'ye derinlemesine dalın

#### 🔴 **İleri Seviye Yolu** (MCP'de Deneyimli)
1. Bağlam için modüller 00-03'ü hızlıca gözden geçirin
2. Veritabanı entegrasyonu için modüller 04-09'a odaklanın
3. Üretim dağıtımı için modüller 10-12'ye yoğunlaşın

## 🛠️ Bu Öğrenme Yolunu Etkili Kullanma

### Sıralı Öğrenme (Önerilen)

Kapsamlı bir anlayış için modülleri sırayla çalışın:

1. **Genel bakışı okuyun** - Neler öğreneceğinizi anlayın
2. **Ön koşulları kontrol edin** - Gerekli bilgiye sahip olduğunuzdan emin olun
3. **Adım adım rehberleri takip edin** - Öğrenirken uygulayın
4. **Alıştırmaları tamamlayın** - Anlayışınızı pekiştirin
5. **Ana noktaları gözden geçirin** - Öğrenme çıktılarınızı sağlamlaştırın

### Hedefe Yönelik Öğrenme

Belirli becerilere ihtiyacınız varsa:

- **Veritabanı Entegrasyonu**: Modüller 04-06'ya odaklanın
- **Güvenlik Uygulaması**: Modüller 02, 08, 12'ye yoğunlaşın
- **AI/Anlamsal Arama**: Modül 07'ye derinlemesine dalın
- **Üretim Dağıtımı**: Modüller 10-12'yi çalışın

### Uygulamalı Pratik

Her modül şunları içerir:
- **Çalışan kod örnekleri** - Kopyalayın, değiştirin ve deneyin
- **Gerçek dünya senaryoları** - Pratik perakende analitiği kullanım senaryoları
- **Aşamalı karmaşıklık** - Basitten gelişmişe doğru inşa etme
- **Doğrulama adımları** - Uygulamanızın çalıştığını doğrulayın

## 🌟 Topluluk ve Destek

### Yardım Alın

- **Azure AI Discord**: [Uzman desteği için katılın](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Sorunları**: [Sorun bildirin veya sorular sorun](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **MCP Topluluğu**: [Daha geniş MCP tartışmalarına katılın](https://github.com/orgs/modelcontextprotocol/discussions)

### Katkıda Bulunun

Bu öğrenme yolunu geliştirmek için katkılarınızı bekliyoruz:
- **Hataları veya yazım hatalarını düzeltin** - Pull request gönderin
- **Örnekler ekleyin** - Uygulamalarınızı paylaşın
- **Belgeleri geliştirin** - Başkalarının öğrenmesine yardımcı olun
- **Sorunları bildirin** - Problemleri çözmemize yardımcı olun

## 📜 Lisans Bilgileri

Bu öğrenme içeriği MIT Lisansı altında lisanslanmıştır. Şartlar ve koşullar için [LICENSE](../../../LICENSE) dosyasına bakın.

## 🚀 Başlamaya Hazır mısınız?

**[Modül 00: MCP Veritabanı Entegrasyonuna Giriş](./00-Introduction/README.md)** ile yolculuğunuza başlayın.

---

*Bu kapsamlı, uygulamalı öğrenme deneyimiyle veritabanı entegrasyonu içeren üretime hazır MCP sunucuları oluşturmayı öğrenin.*

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.