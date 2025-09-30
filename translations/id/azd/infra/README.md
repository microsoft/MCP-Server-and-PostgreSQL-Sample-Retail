<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:30:03+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "id"
}
-->
# Template Infrastruktur

Folder ini berisi template untuk penerapan infrastruktur proyek MCP Retail Analytics.

## 📁 Gambaran File

| File | Deskripsi | Penggunaan |
|------|-----------|------------|
| `azuredeploy.json` | **Template ARM** - Penerapan skala langganan lengkap | Direkomendasikan untuk semua penerapan |
| `azuredeploy.parameters.json` | **Parameter ARM** - Nilai konfigurasi statis | Digunakan bersama `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Panduan penerapan ARM** - Instruksi terperinci | Dokumentasi penerapan lengkap |
| `README.md` | **File ini** - Gambaran infrastruktur | Referensi cepat |

## 🚀 Opsi Penerapan

### Opsi 1: Azure CLI (Direkomendasikan)
Penerapan lengkap dengan pembuatan grup sumber daya:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opsi 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opsi 3: Portal Azure
1. Buka [Portal Azure](https://portal.azure.com)
2. Cari "Deploy a custom template"
3. Unggah `azuredeploy.json`
4. Konfigurasikan parameter dan terapkan

## 🏗️ Komponen Infrastruktur

Template ARM ini menerapkan infrastruktur berikut:

- **Resource Group**: Wadah untuk semua sumber daya dengan penamaan yang konsisten
- **Log Analytics Workspace**: Pusat logging dan pemantauan (retensi 30 hari)
- **Application Insights**: Pemantauan kinerja aplikasi yang terintegrasi dengan Log Analytics
- **Azure AI Services**: Pusat layanan AI multi-layanan (tingkat S0) dengan identitas terkelola
- **Model OpenAI**:
  - `gpt-4o-mini` (kapasitas 120) - Model chat dan penyelesaian
  - `text-embedding-3-small` (kapasitas 50) - Embedding teks untuk pencarian semantik

## 🔧 Konfigurasi Template

### Parameter
Template ARM menerima parameter yang dapat disesuaikan berikut:

| Parameter | Default | Deskripsi |
|-----------|---------|-----------|
| `resourcePrefix` | `mcpretail` | Awalan untuk semua nama sumber daya |
| `location` | `westus2` | Wilayah Azure untuk penerapan |
| `uniqueSuffix` | Auto-generated | Identifikasi unik 4 karakter |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nama tampilan |
| `gptModelCapacity` | `120` | Kapasitas token model GPT |
| `embeddingModelCapacity` | `50` | Kapasitas model embedding |

### Konvensi Penamaan Sumber Daya
Semua sumber daya mengikuti pola: `{type}-{resourcePrefix}-{uniqueSuffix}`

Contoh:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validasi Template

### Validasi Sebelum Penerapan
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Periksa Status Penerapan
```bash
az deployment sub list --output table
```

## 💰 Estimasi Biaya

Estimasi biaya bulanan untuk beban kerja pengembangan:

| Layanan | Konfigurasi | Est. Biaya/Bulan |
|---------|-------------|------------------|
| Azure AI Services | Tingkat S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI Embeddings | 50K token | $5-15 |
| Application Insights | Pemantauan dasar | $5-15 |
| Log Analytics | 1GB/bulan | $2-5 |
| **Total** | | **$42-115** |

## 📚 Sumber Daya Tambahan

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Panduan penerapan terperinci dengan pemecahan masalah
- [Dokumentasi Template ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentasi Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Hasil validasi file

## 🆘 Pemecahan Masalah Cepat

### Masalah Umum
- **Autentikasi**: Jalankan `az login` untuk autentikasi
- **Batas Kuota**: Periksa ketersediaan model OpenAI di wilayah target
- **Konflik Penamaan**: Gunakan parameter `uniqueSuffix` yang berbeda
- **Izin**: Pastikan akun memiliki peran Contributor pada langganan

### Dapatkan Bantuan
- Lihat [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) untuk pemecahan masalah terperinci
- Periksa log penerapan di Portal Azure
- Kunjungi [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Untuk pengaturan proyek lengkap, lihat [README utama](../../README.md) atau [panduan proyek](../../walkthrough/README.md).

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.