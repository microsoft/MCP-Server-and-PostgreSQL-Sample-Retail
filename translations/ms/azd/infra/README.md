<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:30:25+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ms"
}
-->
# Templat Infrastruktur

Folder ini mengandungi templat untuk pelaksanaan infrastruktur bagi projek MCP Retail Analytics.

## 📁 Gambaran Fail

| Fail | Penerangan | Kegunaan |
|------|-------------|----------|
| `azuredeploy.json` | **Templat ARM** - Pelaksanaan skop langganan lengkap | Disyorkan untuk semua pelaksanaan |
| `azuredeploy.parameters.json` | **Parameter ARM** - Nilai konfigurasi statik | Digunakan bersama `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Panduan pelaksanaan ARM** - Arahan terperinci | Dokumentasi pelaksanaan lengkap |
| `README.md` | **Fail ini** - Gambaran keseluruhan infrastruktur | Rujukan ringkas |

## 🚀 Pilihan Pelaksanaan

### Pilihan 1: Azure CLI (Disyorkan)
Pelaksanaan lengkap dengan penciptaan kumpulan sumber:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Pilihan 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Pilihan 3: Portal Azure
1. Pergi ke [Portal Azure](https://portal.azure.com)
2. Cari "Deploy a custom template"
3. Muat naik `azuredeploy.json`
4. Konfigurasikan parameter dan laksanakan

## 🏗️ Komponen Infrastruktur

Templat ARM melaksanakan infrastruktur berikut:

- **Kumpulan Sumber**: Kontainer untuk semua sumber dengan penamaan yang konsisten
- **Log Analytics Workspace**: Pemantauan dan log pusat (pengekalan 30 hari)
- **Application Insights**: Pemantauan prestasi aplikasi yang diintegrasikan dengan Log Analytics
- **Azure AI Services**: Hab AI pelbagai perkhidmatan (tier S0) dengan identiti terurus
- **Model OpenAI**:
  - `gpt-4o-mini` (kapasiti 120) - Model chat dan penyelesaian
  - `text-embedding-3-small` (kapasiti 50) - Embedding teks untuk carian semantik

## 🔧 Konfigurasi Templat

### Parameter
Templat ARM menerima parameter yang boleh disesuaikan berikut:

| Parameter | Lalai | Penerangan |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Awalan untuk semua nama sumber |
| `location` | `westus2` | Wilayah Azure untuk pelaksanaan |
| `uniqueSuffix` | Auto-dijana | Pengecam unik 4 aksara |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nama paparan |
| `gptModelCapacity` | `120` | Kapasiti token model GPT |
| `embeddingModelCapacity` | `50` | Kapasiti token model embedding |

### Konvensyen Penamaan Sumber
Semua sumber mengikuti pola: `{type}-{resourcePrefix}-{uniqueSuffix}`

Contoh:
- Kumpulan Sumber: `rg-mcpretail-demo`
- Perkhidmatan AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Pengesahan Templat

### Sahkan Sebelum Pelaksanaan
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Periksa Status Pelaksanaan
```bash
az deployment sub list --output table
```

## 💰 Anggaran Kos

Anggaran kos bulanan untuk beban kerja pembangunan:

| Perkhidmatan | Konfigurasi | Anggaran Kos/Bulan |
|--------------|-------------|--------------------|
| Azure AI Services | Tier S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI Embeddings | 50K token | $5-15 |
| Application Insights | Pemantauan asas | $5-15 |
| Log Analytics | 1GB/bulan | $2-5 |
| **Jumlah** | | **$42-115** |

## 📚 Sumber Tambahan

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Panduan pelaksanaan terperinci dengan penyelesaian masalah
- [Dokumentasi Templat ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentasi Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Hasil pengesahan fail

## 🆘 Penyelesaian Masalah Pantas

### Isu Biasa
- **Pengesahan**: Jalankan `az login` untuk pengesahan
- **Had Kuota**: Periksa ketersediaan model OpenAI di wilayah sasaran
- **Konflik Penamaan**: Gunakan parameter `uniqueSuffix` yang berbeza
- **Kebenaran**: Pastikan akaun mempunyai peranan Contributor pada langganan

### Dapatkan Bantuan
- Lihat [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) untuk penyelesaian masalah terperinci
- Periksa log pelaksanaan di Portal Azure
- Lawati [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Untuk persediaan projek lengkap, lihat [README utama](../../README.md) atau [panduan projek](../../walkthrough/README.md).

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.