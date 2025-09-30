<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:58:14+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "ms"
}
-->
# Azure Developer CLI (azd) Pengesahan Infrastruktur

## ✅ **Status Semasa: SIAP untuk azd**

Folder `azd\infra` kini **SEPENUHNYA SERASI** dengan penyebaran Azure Developer CLI. Semua fail yang diperlukan telah dicipta dan dikonfigurasi.

### 📁 **Struktur azd Lengkap**
```
azd/
├── azure.yaml                       ✅ Main azd configuration
├── infra/
│   ├── main.bicep                   ✅ Subscription-scoped Bicep template
│   ├── main.parameters.json         ✅ Parameters with azd variables
│   ├── modules/
│   │   ├── main-resources.bicep     ✅ Core infrastructure module
│   │   └── container-app-environment.bicep ✅ Container Apps environment
│   ├── azuredeploy.json            📄 Legacy ARM template (backup)
│   ├── azuredeploy.parameters.json  📄 Legacy parameters (backup)
│   ├── ARM-DEPLOYMENT.md           📄 ARM deployment documentation
│   ├── README.md                   📄 Infrastructure overview
│   └── VALIDATION-SUMMARY.md       📝 This file
```

### ✅ **Komponen Azure Developer CLI**

#### 1. `azure.yaml` ✅ **SIAP**
- **Lokasi**: `azd/azure.yaml`
- **Tujuan**: Fail konfigurasi utama azd
- **Status**: ✅ Dicipta dan dikonfigurasi
- **Ciri-ciri**:
  - Definisi perkhidmatan untuk pelayan MCP
  - Konfigurasi hosting Container App
  - Pemetaan pembolehubah persekitaran
  - Cangkuk penyebaran untuk pengurusan kitaran hayat

#### 2. **Infrastruktur Bicep** ✅ **SIAP**
- **Templat Utama**: `main.bicep` (skop langganan)
- **Parameter**: `main.parameters.json` dengan pembolehubah azd
- **Modul**: Seni bina modular Bicep
- **Status**: ✅ Penyebaran infrastruktur lengkap

#### 3. **Konfigurasi Perkhidmatan** ✅ **SIAP**
- **Pelayan MCP**: Penyebaran Container App sedia
- **Docker**: Dockerfile sedia ada dikonfigurasi
- **Pembolehubah Persekitaran**: Integrasi Azure AI Services
- **Pemantauan**: Application Insights disambungkan

### 🚀 **Penyebaran azd Sedia**

Anda kini boleh menyebarkan menggunakan Azure Developer CLI:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **Sumber yang Disebarkan**

Penyebaran azd akan mencipta:

#### **Infrastruktur** 
- ✅ Resource Group (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ Penyebaran Model OpenAI:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ Persekitaran Container App

#### **Aplikasi**
- ✅ Pelayan MCP (Container App)
- ✅ Pemeriksaan kesihatan diaktifkan
- ✅ Pemantauan disambungkan
- ✅ Pembolehubah persekitaran dikonfigurasi

### 📊 **azd vs Penyebaran Manual**

| Ciri | azd `/azd` | Manual `/infra` |
|------|------------|-----------------|
| **Status** | ✅ Sedia & Lengkap | ✅ Berfungsi |
| **Templat** | Modul Bicep | Modul Bicep |
| **Penyebaran** | Automasi `azd up` | Skrip manual |
| **Persekitaran** | Pembolehubah persekitaran automatik | Persediaan manual |
| **Perkhidmatan** | Container Apps | Infrastruktur sahaja |
| **Konfigurasi** | Lengkap dengan perkhidmatan | Fokus pada infrastruktur |

### 🛠️ **Pembolehubah Persekitaran**

azd akan secara automatik menetapkan pembolehubah output ini:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **Ringkasan Pengesahan**

- **azure.yaml**: ✅ Dicipta dan dikonfigurasi
- **Templat Bicep**: ✅ Seni bina modular lengkap
- **Fail Parameter**: ✅ Pembolehubah serasi azd
- **Definisi Perkhidmatan**: ✅ Container App sedia
- **Konfigurasi Docker**: ✅ Menggunakan Dockerfile sedia ada
- **Pembolehubah Persekitaran**: ✅ Integrasi Azure AI Services
- **Sedia untuk azd**: ✅ **YA - SEPENUHNYA SERASI**

**Cadangan**: Gunakan `azd up` untuk penyebaran automatik lengkap termasuk kedua-dua infrastruktur dan perkhidmatan aplikasi.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.