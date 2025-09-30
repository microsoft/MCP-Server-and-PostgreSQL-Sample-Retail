<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:13+00:00",
  "source_file": "azd/README.md",
  "language_code": "id"
}
-->
# Azure Developer CLI (azd) Panduan Cepat

## 🚀 Deploy dengan Azure Developer CLI

Proyek ini sekarang sepenuhnya kompatibel dengan Azure Developer CLI (azd) untuk penerapan otomatis baik infrastruktur maupun aplikasi server MCP.

### Prasyarat

1. **Instal Azure Developer CLI**:
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

2. **Login ke Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Penerapan dengan Satu Perintah

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

### 🔧 Alur Kerja Pengembangan

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

### 📦 Apa yang Diterapkan

#### **Infrastruktur**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (dengan model OpenAI)
- Container App Environment

#### **Aplikasi**
- Server MCP (Container App)
- Pemantauan kesehatan diaktifkan
- Variabel lingkungan dikonfigurasi
- Integrasi Application Insights

### 🌍 Variabel Lingkungan

Setelah penerapan, variabel-variabel ini akan tersedia secara otomatis:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Pemantauan & Pengelolaan

- **Azure Portal**: Lihat semua sumber daya dalam resource group Anda
- **Application Insights**: Pantau kinerja aplikasi dan log
- **Container Apps**: Lihat log dan metrik aplikasi
- **AI Studio**: Kelola penerapan model OpenAI

### 📋 Pemecahan Masalah

#### **Masalah Umum**

1. **Lokasi tidak didukung**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Kuota sumber daya terlampaui**:
   - Periksa batas langganan Anda di Azure Portal
   - Coba gunakan wilayah yang berbeda

3. **Masalah autentikasi**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Lihat log penerapan**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatif: Penerapan Manual

Jika Anda lebih memilih penerapan manual, Anda tetap dapat menggunakan infrastruktur di folder `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Pelajari Lebih Lanjut

- [Dokumentasi Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentasi Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.