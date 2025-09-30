<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:46:39+00:00",
  "source_file": "README.md",
  "language_code": "tr"
}
-->
# MCP Sunucusu ve PostgreSQL Örneği - Perakende Satış Analizi

## Veritabanı Entegrasyonu ile MCP'yi Uygulamalı Örneklerle Öğrenin

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Azure AI Foundry Discord'a Katılın](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Bu kaynakları kullanmaya başlamak için şu adımları izleyin:

1. **Depoyu Çatallayın**: [Buraya tıklayarak çatallayın](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Depoyu Klonlayın**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discord'a Katılın**: [Uzmanlarla ve diğer geliştiricilerle tanışın](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Çok Dilli Destek

#### GitHub Action ile Desteklenir (Otomatik ve Her Zaman Güncel)

[Fransızca](../fr/README.md) | [İspanyolca](../es/README.md) | [Almanca](../de/README.md) | [Rusça](../ru/README.md) | [Arapça](../ar/README.md) | [Farsça](../fa/README.md) | [Urduca](../ur/README.md) | [Çince (Basitleştirilmiş)](../zh/README.md) | [Çince (Geleneksel, Makao)](../mo/README.md) | [Çince (Geleneksel, Hong Kong)](../hk/README.md) | [Çince (Geleneksel, Tayvan)](../tw/README.md) | [Japonca](../ja/README.md) | [Korece](../ko/README.md) | [Hintçe](../hi/README.md) | [Bengalce](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Portekizce (Portekiz)](../pt/README.md) | [Portekizce (Brezilya)](../br/README.md) | [İtalyanca](../it/README.md) | [Lehçe](../pl/README.md) | [Türkçe](./README.md) | [Yunanca](../el/README.md) | [Tayca](../th/README.md) | [İsveççe](../sv/README.md) | [Danca](../da/README.md) | [Norveççe](../no/README.md) | [Fince](../fi/README.md) | [Flemenkçe](../nl/README.md) | [İbranice](../he/README.md) | [Vietnamca](../vi/README.md) | [Endonezce](../id/README.md) | [Malayca](../ms/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Svahili](../sw/README.md) | [Macarca](../hu/README.md) | [Çekçe](../cs/README.md) | [Slovakça](../sk/README.md) | [Romence](../ro/README.md) | [Bulgarca](../bg/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Hırvatça](../hr/README.md) | [Slovence](../sl/README.md) | [Ukraynaca](../uk/README.md) | [Burmaca (Myanmar)](../my/README.md)

**Ek dil çevirileri talep etmek isterseniz, desteklenen diller [burada](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) listelenmiştir.**

## Giriş

Bu örnek, PostgreSQL aracılığıyla perakende satış verilerine güvenli ve akıllı erişim sağlayan kapsamlı bir **Model Context Protocol (MCP) sunucusunun** nasıl oluşturulacağını ve dağıtılacağını göstermektedir. Proje, **Satır Düzeyi Güvenlik (RLS)**, **anlamsal arama yetenekleri** ve **Azure AI entegrasyonu** gibi kurumsal düzeyde özellikleri gerçek dünya perakende analitik senaryolarında sergilemektedir.

**Ana Kullanım Alanları:**
- **AI Destekli Satış Analitiği**: AI asistanlarının doğal dil kullanarak perakende satış verilerini sorgulamasını ve analiz etmesini sağlayın
- **Güvenli Çok Kiracılı Erişim**: Farklı mağaza yöneticilerinin yalnızca kendi mağazalarının verilerine erişebildiği Satır Düzeyi Güvenlik uygulamasını gösterin
- **Anlamsal Ürün Arama**: Metin gömme yöntemleriyle AI destekli ürün keşfini sergileyin
- **Kurumsal Entegrasyon**: MCP sunucularını Azure hizmetleri ve PostgreSQL veritabanlarıyla nasıl entegre edeceğinizi gösterin

**Kimler İçin Uygun:**
- Veritabanı entegrasyonu ile MCP sunucuları oluşturmayı öğrenen geliştiriciler
- Güvenli çok kiracılı analitik çözümleri uygulayan veri mühendisleri
- Perakende veya e-ticaret verileriyle çalışan AI uygulama geliştiricileri
- AI asistanlarını kurumsal veritabanlarıyla birleştirmekle ilgilenen herkes

## Azure AI Foundry Discord Topluluğuna Katılın
MCP deneyimlerinizi paylaşın ve uzmanlarla, ürün gruplarıyla tanışın

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Satış Analizi MCP Sunucusu

Zava Retail DIY İşletmesi için kapsamlı müşteri satış veritabanı erişimi sağlayan bir Model Context Protocol (MCP) sunucusu. Bu sunucu, AI asistanlarının perakende satış verilerini güvenli, şema farkındalığına sahip bir arayüz aracılığıyla sorgulamasını ve analiz etmesini sağlar.

## 📚 Tam Uygulama Kılavuzu

Bu çözümün nasıl oluşturulduğuna ve benzer MCP sunucularının nasıl uygulanacağına dair ayrıntılı bir açıklama için kapsamlı **[Örnek Yürütme Kılavuzu](Sample_Walkthrough.md)**'na bakın. Bu kılavuz şunları sağlar:

- **Mimari Derinlemesine İnceleme**: Bileşen analizi ve tasarım desenleri
- **Adım Adım İnşa**: Proje kurulumundan dağıtıma kadar
- **Kod Açıklaması**: MCP sunucusu uygulamasının ayrıntılı açıklaması
- **Gelişmiş Özellikler**: Satır Düzeyi Güvenlik, anlamsal arama ve izleme
- **En İyi Uygulamalar**: Güvenlik, performans ve geliştirme yönergeleri
- **Sorun Giderme**: Yaygın sorunlar ve çözümleri

Benzer çözümler oluşturmak isteyen geliştiriciler için mükemmel bir kaynak.

## 🤖 MCP (Model Context Protocol) Nedir?

**Model Context Protocol (MCP)**, AI asistanlarının harici veri kaynaklarına ve araçlara gerçek zamanlı olarak güvenli bir şekilde erişmesini sağlayan açık bir standarttır. Bunu, AI modellerinin veritabanları, API'ler, dosya sistemleri ve diğer kaynaklarla güvenlik ve kontrolü koruyarak bağlantı kurmasını sağlayan bir köprü olarak düşünebilirsiniz.

### Temel Avantajlar:
- **Gerçek Zamanlı Veri Erişimi**: AI asistanları canlı veritabanlarını ve API'leri sorgulayabilir
- **Güvenli Entegrasyon**: Kimlik doğrulama ve izinlerle kontrol edilen erişim  
- **Araç Genişletilebilirliği**: AI asistanlarına özel yetenekler ekleyin
- **Standartlaştırılmış Protokol**: Farklı AI platformları ve araçlarıyla çalışır

### MCP'ye Yeni misiniz?

Model Context Protocol'e yeniyseniz, Microsoft'un kapsamlı başlangıç kaynaklarını öneririz:

**📖 [MCP için Başlangıç Kılavuzu](https://aka.ms/mcp-for-beginners)**

Bu kaynak şunları sağlar:
- MCP kavramlarına ve mimarisine giriş
- İlk MCP sunucunuzu oluşturmak için adım adım eğitimler
- MCP geliştirme için en iyi uygulamalar
- Popüler AI platformlarıyla entegrasyon örnekleri
- Topluluk kaynakları ve destek

Temel bilgileri anladıktan sonra, bu gelişmiş perakende analitiği uygulamasını keşfetmek için buraya geri dönün!

## 📚 Kapsamlı Öğrenme Kılavuzu: /walkthrough

Bu depo, bu MCP perakende sunucu örneğini sindirilebilir, adım adım derslere ayıran eksiksiz bir **12 modüllük öğrenme yürütmesi** içerir. Yürütme, bu çalışan örneği, veritabanı entegrasyonu ile üretime hazır MCP sunucuları oluşturmayı öğrenmek isteyen geliştiriciler için kapsamlı bir eğitim kaynağına dönüştürür.

### Öğrenecekleriniz

Yürütme, temel MCP kavramlarından gelişmiş üretim dağıtımına kadar her şeyi kapsar, örneğin:

- **MCP Temelleri**: Model Context Protocol'ü ve gerçek dünya uygulamalarını anlama
- **Veritabanı Entegrasyonu**: Satır Düzeyi Güvenlik ile güvenli PostgreSQL bağlantısı uygulama
- **AI Destekli Özellikler**: Azure OpenAI gömmeleriyle anlamsal arama yetenekleri ekleme
- **Güvenlik Uygulaması**: Kurumsal düzeyde kimlik doğrulama, yetkilendirme ve veri izolasyonu
- **Araç Geliştirme**: Veri analizi ve iş zekası için sofistike MCP araçları oluşturma
- **Test ve Hata Ayıklama**: Kapsamlı test stratejileri ve hata ayıklama teknikleri
- **VS Code Entegrasyonu**: Doğal dil veritabanı sorguları için AI Chat yapılandırması
- **Üretim Dağıtımı**: Konteynerleştirme, ölçekleme ve bulut dağıtım stratejileri
- **İzleme ve Gözlemlenebilirlik**: Application Insights, günlük kaydı ve performans izleme

### Öğrenme Yolu Genel Bakış

Yürütme, her beceri seviyesindeki geliştiriciler için tasarlanmış aşamalı bir öğrenme yapısını takip eder:

| Modül | Odak Alanı | Açıklama | Tahmini Süre |
|--------|------------|-------------|---------------|
| **[00-Giriş](walkthrough/00-Introduction/README.md)** | Temel | MCP kavramları, Zava Retail vaka çalışması, mimari genel bakış | 30 dakika |
| **[01-Mimari](walkthrough/01-Architecture/README.md)** | Tasarım Desenleri | Teknik mimari, katmanlı tasarım, sistem bileşenleri | 45 dakika |
| **[02-Güvenlik](walkthrough/02-Security/README.md)** | Kurumsal Güvenlik | Azure kimlik doğrulama, Satır Düzeyi Güvenlik, çok kiracılı izolasyon | 60 dakika |
| **[03-Kurulum](walkthrough/03-Setup/README.md)** | Ortam | Docker kurulumu, Azure CLI, proje yapılandırması, doğrulama | 45 dakika |
| **[04-Veritabanı](walkthrough/04-Database/README.md)** | Veri Katmanı | PostgreSQL şeması, pgvector, RLS politikaları, örnek veri | 60 dakika |
| **[05-MCP-Sunucu](walkthrough/05-MCP-Server/README.md)** | Çekirdek Uygulama | FastMCP çerçevesi, veritabanı entegrasyonu, bağlantı yönetimi | 90 dakika |
| **[06-Araçlar](walkthrough/06-Tools/README.md)** | Araç Geliştirme | MCP araç oluşturma, sorgu doğrulama, iş zekası özellikleri | 75 dakika |
| **[07-Anlamsal-Arama](walkthrough/07-Semantic-Search/README.md)** | AI Entegrasyonu | Azure OpenAI gömmeleri, vektör arama, hibrit arama stratejileri | 60 dakika |
| **[08-Test](walkthrough/08-Testing/README.md)** | Kalite Güvencesi | Birim testi, entegrasyon testi, performans testi, hata ayıklama | 75 dakika |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Geliştirme Deneyimi | VS Code yapılandırması, AI Chat entegrasyonu, hata ayıklama iş akışları | 45 dakika |
| **[10-Dağıtım](walkthrough/10-Deployment/README.md)** | Üretime Hazır | Konteynerleştirme, Azure Container Apps, CI/CD hatları, ölçekleme | 90 dakika |
| **[11-İzleme](walkthrough/11-Monitoring/README.md)** | Gözlemlenebilirlik | Application Insights, yapılandırılmış günlük kaydı, performans metrikleri | 60 dakika |
| **[12-En İyi Uygulamalar](walkthrough/12-Best-Practices/README.md)** | Üretim Mükemmelliği | Güvenlik sertleştirme, performans optimizasyonu, kurumsal desenler | 45 dakika |

**Toplam Öğrenme Süresi**: ~12-15 saatlik kapsamlı uygulamalı öğrenme

### 🎯 Yürütmeyi Nasıl Kullanabilirsiniz

**Yeni Başlayanlar İçin**:
1. MCP temellerini anlamak için [Modül 00: Giriş](walkthrough/00-Introduction/README.md) ile başlayın
2. Tam bir öğrenme deneyimi için modülleri sırasıyla takip edin
3. Her modül önceki kavramları temel alır ve pratik alıştırmalar içerir

**Deneyimli Geliştiriciler İçin**:
1. [Ana Yürütme Genel Bakışı](walkthrough/README.md)'nı inceleyerek tüm modüllerin özetini görün
2. İlginizi çeken belirli modüllere atlayın (örneğin, Modül 07 AI entegrasyonu için)
3. Kendi projeleriniz için bireysel modülleri referans materyali olarak kullanın

**Üretim Uygulaması İçin**:
1. Modül 02 (Güvenlik), 10 (Dağıtım) ve 11 (İzleme)'ye odaklanın
2. Kurumsal yönergeler için Modül 12 (En İyi Uygulamalar)'ı inceleyin
3. Kod örneklerini üretime hazır şablonlar olarak kullanın

### 🚀 Hızlı Başlangıç Seçenekleri

**Seçenek 1: Tam Öğrenme Yolu** (Yeni başlayanlar için önerilir)  
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```
  
**Seçenek 2: Uygulamalı Uygulama** (Doğrudan inşa etmeye başlayın)  
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```
  
**Seçenek 3: Üretim Odaklı** (Kurumsal dağıtım)  
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```
  
### 📋 Öğrenme Ön Koşulları

**Önerilen Arka Plan Bilgisi**:
- Temel Python programlama deneyimi
- REST API'leri ve veritabanları hakkında bilgi sahibi olmak
- Genel AI/ML kavramlarını anlamak
- Temel komut satırı ve Docker bilgisi

**Gerekli Değil (ama faydalı olabilir)**:
- Daha önce MCP deneyimi (sıfırdan ele alıyoruz)
- Azure bulut deneyimi (adım adım rehberlik sağlıyoruz)
- İleri düzey PostgreSQL bilgisi (gerektiğinde kavramları açıklıyoruz)

### 💡 Öğrenme İpuçları

1. **Uygulamalı Yaklaşım**: Her modül, çalıştırabileceğiniz ve değiştirebileceğiniz kod örnekleri içerir.
2. **Kademeli Zorluk**: Kavramlar basitten karmaşığa doğru kademeli olarak inşa edilir.
3. **Gerçek Dünya Bağlamı**: Tüm örnekler, gerçekçi perakende iş senaryolarını kullanır.
4. **Üretime Hazır**: Kod örnekleri, gerçek üretim kullanımı için tasarlanmıştır.
5. **Topluluk Desteği**: Yardım ve tartışmalar için [Discord topluluğumuza](https://discord.com/invite/ByRwuEEgH4) katılın.

### 🔗 İlgili Kaynaklar

- **[Yeni Başlayanlar için MCP](https://aka.ms/mcp-for-beginners)**: Temel okuma materyali
- **[Örnek Yürütme](Sample_Walkthrough.md)**: Teknik genel bakış
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Örneklerde kullanılan bulut platformu
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP uygulama çerçevesi

**Öğrenmeye hazır mısınız?** **[Modül 00: Giriş](walkthrough/00-Introduction/README.md)** ile başlayabilir veya **[tam yürütme genel bakışını](walkthrough/README.md)** keşfedebilirsiniz.

## Ön Koşullar

1. Docker Desktop yüklü
2. Git yüklü
3. **Azure CLI**: Azure CLI ile kurulum ve kimlik doğrulama
4. OpenAI `text-embedding-3-small` modeli ve isteğe bağlı olarak `gpt-4o-mini` modeline erişim.

## Başlarken

Bir terminal penceresi açın ve aşağıdaki komutları çalıştırın:

1. Azure CLI ile kimlik doğrulama

    ```bash
    az login
    ```

2. Depoyu klonlayın

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Proje dizinine gidin

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure Kaynaklarını Dağıtma

MCP sunucusu için gerekli Azure kaynaklarının dağıtımını otomatikleştirmek için aşağıdaki betikleri çalıştırın.

Dağıtım betikleri, `text-embedding-3-small` modelini otomatik olarak dağıtacaktır. Dağıtım sırasında, isteğe bağlı olarak `gpt-4o-mini` modelini de dahil etme seçeneğiniz olacak. `gpt-4o-mini` modelinin bu proje için **gerekli olmadığını** ve yalnızca gelecekteki olası geliştirmeler için dahil edildiğini unutmayın.

**Platformunuza uygun betiği seçin:**

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

## MCP Sunucusunu Çalıştırma

Tüm yığını (PostgreSQL + MCP Sunucusu) çalıştırmanın en kolay yolu Docker Compose kullanmaktır:

### Yığını Başlat

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

## Kullanım

Aşağıdaki adımlar, yerleşik VS Code MCP sunucu desteğini kullanacağınızı varsayar.

1. Projeyi VS Code'da açın. Terminalden şu komutu çalıştırın:

    ```bash
    code .
    ```

2. `.vscode/mcp.json` dosyasındaki yapılandırmaları kullanarak bir veya daha fazla MCP sunucusunu başlatın. Dosya, farklı mağaza yöneticisi rollerini temsil eden dört farklı sunucu yapılandırması içerir:

   - Her yapılandırma, benzersiz bir RLS (Satır Düzeyi Güvenlik) kullanıcı kimliği kullanır.
   - Bu kullanıcı kimlikleri, farklı mağaza yöneticisi kimliklerinin veritabanına erişimini simüle eder.
   - RLS sistemi, yöneticinin atanmış mağazasına göre veri erişimini sınırlar.
   - Bu, mağaza yöneticilerinin farklı Entra ID hesaplarıyla oturum açtığı gerçek dünya senaryolarını taklit eder.

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

### VS Code AI Sohbetini Açın

1. VS Code'da AI Sohbet modunu açın.
2. **#zava** yazın ve başlattığınız MCP sunucularından birini seçin.
3. Satış verileri hakkında sorular sorun - Aşağıda örnek sorgulara göz atabilirsiniz.

### Örnek Sorgular

1. Satış gelirine göre en iyi 20 ürünü göster
1. Mağazaya göre satışları göster
1. Geçen çeyreğin kategori bazında satışları neydi?
1. "boya kapları"na benzer hangi ürünleri satıyoruz?

## Özellikler

- **Çoklu Tablo Şeması Erişimi**: Tek bir istekte birden fazla veritabanı tablosunun şemalarını alın.
- **Güvenli Sorgu Çalıştırma**: Satır Düzeyi Güvenlik (RLS) desteğiyle PostgreSQL sorguları çalıştırın.
- **Gerçek Zamanlı Veri**: Güncel satış, envanter ve müşteri verilerine erişim.
- **Tarih/Saat Araçları**: Zaman duyarlı analizler için mevcut UTC zaman damgalarını alın.
- **Esnek Dağıtım**: HTTP sunucu modunu destekler.

## Desteklenen Tablolar

Sunucu, aşağıdaki perakende veritabanı tablolarına erişim sağlar:

- `retail.customers` - Müşteri bilgileri ve profilleri
- `retail.stores` - Mağaza konumları ve detayları
- `retail.categories` - Ürün kategorileri ve hiyerarşileri
- `retail.product_types` - Ürün türü sınıflandırmaları
- `retail.products` - Ürün kataloğu ve özellikleri
- `retail.orders` - Müşteri siparişleri ve işlemleri
- `retail.order_items` - Siparişlerdeki bireysel ürünler
- `retail.inventory` - Mevcut envanter seviyeleri ve stok verileri

## Kullanılabilir Araçlar

### `get_multiple_table_schemas`

Birden fazla tablonun veritabanı şemalarını tek bir istekte alın.

**Parametreler:**

- `table_names` (list[str]): Yukarıdaki desteklenen tablolardan geçerli tablo adlarının listesi

**Döndürür:** İstenen tablolar için birleştirilmiş şema dizeleri

### `execute_sales_query`

Satış veritabanına karşı PostgreSQL sorguları çalıştırın (Satır Düzeyi Güvenlik ile).

**Parametreler:**

- `postgresql_query` (str): İyi biçimlendirilmiş bir PostgreSQL sorgusu

**Döndürür:** Sonuçlar, okunabilirlik için sınırlı (20 satır) bir dize olarak döndürülür.

**En İyi Uygulamalar:**

- Önce tablo şemalarını alın.
- Şemalardan tam sütun adlarını kullanın.
- Kapsamlı analiz için ilişkili tabloları birleştirin.
- Uygun olduğunda sonuçları birleştirin.
- Okunabilirlik için çıktıyı sınırlayın.

### `get_current_utc_date`

Mevcut UTC tarih ve saatini ISO formatında alın.

**Döndürür:** Mevcut UTC tarih/saat (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Kullanıcı sorgularına dayalı olarak ürünler için anlamsal bir arama gerçekleştirin.

**Döndürür:** Arama kriterlerine uyan ürünlerin bir listesi

**Parametreler:**

- `query` (str): Arama sorgusu dizesi

**Döndürür:** Arama kriterlerine uyan ürünlerin bir listesi

## Güvenlik Özellikleri

### Satır Düzeyi Güvenlik (RLS)

Sunucu, kullanıcıların yalnızca yetkili oldukları verilere erişmesini sağlamak için Satır Düzeyi Güvenlik uygular:

- **HTTP Modu**: İstek yapan kullanıcıyı tanımlamak için `x-rls-user-id` başlığını kullanır.
- **Varsayılan Yedekleme**: Kullanıcı kimliği sağlanmadığında yer tutucu UUID kullanır.

#### Mağaza Bazlı RLS Kullanıcı Kimlikleri

Her Zava Perakende mağaza konumunun, kullanıcının erişebileceği verileri belirleyen benzersiz bir RLS kullanıcı kimliği vardır:

| Mağaza Konumu | RLS Kullanıcı Kimliği | Açıklama |
|---------------|-----------------------|----------|
| **Genel Erişim** | `00000000-0000-0000-0000-000000000000` | Varsayılan yedekleme - tüm mağazalara erişim |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Perakende Seattle mağaza verileri |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Perakende Bellevue mağaza verileri |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Perakende Tacoma mağaza verileri |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Perakende Spokane mağaza verileri |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Perakende Everett mağaza verileri |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Perakende Redmond mağaza verileri |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Perakende Kirkland mağaza verileri |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Perakende Online mağaza verileri |

#### RLS Uygulaması

Bir kullanıcı belirli bir mağazanın RLS Kullanıcı Kimliği ile bağlandığında, yalnızca şunları görebilir:

- O mağazayla ilişkili müşteriler
- O mağaza konumunda verilen siparişler
- O mağazaya özel envanter verileri
- Mağazaya özel satış ve performans metrikleri

Bu, farklı mağaza konumları arasında veri izolasyonunu sağlarken birleşik bir veritabanı şeması sağlar.

## Mimari

### Uygulama Bağlamı

Sunucu, yönetilen bir uygulama bağlamı kullanır:

- **Veritabanı Bağlantı Havuzu**: HTTP modu için verimli bağlantı yönetimi
- **Yaşam Döngüsü Yönetimi**: Kapatma sırasında kaynakların düzgün temizlenmesi
- **Tür Güvenliği**: `AppContext` veri sınıfı ile güçlü türlendirme

### İstek Bağlamı

- **Başlık Çıkarımı**: Kullanıcı kimliği doğrulaması için güvenli başlık ayrıştırma
- **RLS Entegrasyonu**: İstek bağlamından otomatik kullanıcı kimliği çözümü
- **Hata Yönetimi**: Kullanıcı dostu mesajlarla kapsamlı hata yönetimi

## Veritabanı Entegrasyonu

Sunucu, `PostgreSQLSchemaProvider` sınıfı aracılığıyla bir PostgreSQL veritabanı ile entegre olur:

- **Bağlantı Havuzu**: Ölçeklenebilirlik için asenkron bağlantı havuzları kullanır.
- **Şema Meta Verileri**: Ayrıntılı tablo şeması bilgileri sağlar.
- **Sorgu Çalıştırma**: RLS desteğiyle güvenli sorgu çalıştırma.
- **Kaynak Yönetimi**: Veritabanı kaynaklarının otomatik temizlenmesi.

## Hata Yönetimi

Sunucu, sağlam bir hata yönetimi uygular:

- **Tablo Doğrulama**: Yalnızca geçerli tablo adlarının erişildiğinden emin olur.
- **Sorgu Doğrulama**: PostgreSQL sorgularını çalıştırmadan önce doğrular.
- **Kaynak Yönetimi**: Hatalar sırasında bile düzgün temizleme.
- **Kullanıcı Dostu Mesajlar**: Sorun giderme için net hata mesajları.

## Güvenlik Hususları

1. **Satır Düzeyi Güvenlik**: Tüm sorgular, kullanıcı kimliğine dayalı RLS politikalarına uyar.
2. **Mağaza Verisi İzolasyonu**: Her mağazanın RLS Kullanıcı Kimliği, yalnızca o mağazanın verilerine erişimi sağlar.
3. **Girdi Doğrulama**: Tablo adları ve sorgular çalıştırılmadan önce doğrulanır.
4. **Kaynak Sınırları**: Aşırı kaynak kullanımını önlemek için sorgu sonuçları sınırlıdır.
5. **Bağlantı Güvenliği**: Güvenli veritabanı bağlantı uygulamaları kullanır.
6. **Kullanıcı Kimliği Doğrulama**: Her zaman doğru RLS Kullanıcı Kimliği'nin kullanıldığından emin olun.

### Önemli Güvenlik Notları

- **Üretim RLS Kullanıcı Kimliklerini geliştirme ortamlarında asla kullanmayın.**
- **Her zaman RLS Kullanıcı Kimliği'nin, sorguları çalıştırmadan önce hedef mağazayla eşleştiğini doğrulayın.**
- **Varsayılan UUID (`00000000-0000-0000-0000-000000000000`) sınırlı erişim sağlar.**
- **Her mağaza yöneticisi yalnızca kendi mağazasının RLS Kullanıcı Kimliği'ne erişmelidir.**

## Geliştirme

### Proje Yapısı

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Ana Bileşenler

- **FastMCP Sunucusu**: Asenkron destekli modern MCP sunucu uygulaması
- **PostgreSQL Sağlayıcı**: RLS desteğiyle veritabanı soyutlama katmanı
- **Bağlam Yönetimi**: Tür güvenli uygulama ve istek bağlamı işleme
- **Araç Kaydı**: Pydantic doğrulama ile deklaratif araç kaydı

## Katkıda Bulunma

Bu sunucuya katkıda bulunurken:

1. Tüm veritabanı sorgularının Satır Düzeyi Güvenliğe uygun olduğundan emin olun.
2. Yeni araçlar için uygun hata yönetimi ekleyin.
3. Yeni özellikler veya değişikliklerle bu README'yi güncelleyin.
4. HTTP sunucu modunu test edin.
5. Girdi parametrelerini doğrulayın ve net hata mesajları sağlayın.

## [Lisans](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Bu MCP sunucusu, Zava Perakende satış verilerine yapay zeka destekli analiz ve içgörüler için güvenli ve verimli erişim sağlar.*

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluğu sağlamak için çaba göstersek de, otomatik çeviriler hata veya yanlışlıklar içerebilir. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul edilmez.