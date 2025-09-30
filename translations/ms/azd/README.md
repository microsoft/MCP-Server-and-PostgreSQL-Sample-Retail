<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:22+00:00",
  "source_file": "azd/README.md",
  "language_code": "ms"
}
-->
# Azure Developer CLI (azd) Pengenalan Ringkas

## 🚀 Lakukan Penerapan dengan Azure Developer CLI

Projek ini kini serasi sepenuhnya dengan Azure Developer CLI (azd) untuk penerapan automatik bagi infrastruktur dan aplikasi pelayan MCP.

### Prasyarat

1. **Pasang Azure Developer CLI**:
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

2. **Log masuk ke Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Penerapan Satu Perintah

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

### 🔧 Aliran Kerja Pembangunan

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
- Kumpulan Sumber
- Log Analytics Workspace  
- Application Insights
- Perkhidmatan Azure AI (dengan model OpenAI)
- Persekitaran Aplikasi Kontena

#### **Aplikasi**
- Pelayan MCP (Aplikasi Kontena)
- Pemantauan kesihatan diaktifkan
- Pembolehubah persekitaran dikonfigurasi
- Integrasi Application Insights

### 🌍 Pembolehubah Persekitaran

Selepas penerapan, pembolehubah ini tersedia secara automatik:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Pemantauan & Pengurusan

- **Portal Azure**: Lihat semua sumber dalam kumpulan sumber anda
- **Application Insights**: Pantau prestasi aplikasi dan log
- **Aplikasi Kontena**: Lihat log dan metrik aplikasi
- **AI Studio**: Urus penerapan model OpenAI

### 📋 Penyelesaian Masalah

#### **Isu Biasa**

1. **Lokasi tidak disokong**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Kuota sumber melebihi**:
   - Semak had langganan anda di Portal Azure
   - Cuba kawasan lain

3. **Isu pengesahan**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Lihat log penerapan**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternatif: Penerapan Manual

Jika anda lebih suka penerapan manual, anda masih boleh menggunakan infrastruktur dalam folder `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Ketahui Lebih Lanjut

- [Dokumentasi Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Aplikasi Kontena](https://docs.microsoft.com/azure/container-apps/)
- [Dokumentasi Perkhidmatan Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.