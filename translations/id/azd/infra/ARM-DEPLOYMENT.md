<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:13:39+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "id"
}
-->
# Instruksi Penerapan Template ARM

Dokumen ini memberikan panduan untuk menerapkan infrastruktur MCP Retail Analytics menggunakan template ARM.

## 📋 Ikhtisar

Template ARM `azuredeploy.json` menyediakan penerapan lengkap untuk:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opsi Penerapan

### Opsi 1: Penerapan dengan Azure CLI

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

### Opsi 2: Penerapan dengan PowerShell

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

### Opsi 3: Azure Portal

1. Buka [Azure Portal](https://portal.azure.com)
2. Cari "Deploy a custom template"
3. Klik "Build your own template in the editor"
4. Salin dan tempel isi dari `azuredeploy.json`
5. Klik "Save" lalu "Review + create"
6. Isi parameter yang diperlukan dan lakukan penerapan

## 🔧 Parameter Template

| Parameter | Tipe | Default | Deskripsi |
|-----------|------|---------|-------------|
| `resourcePrefix` | string | `mcpretail` | Awalan untuk nama sumber daya |
| `location` | string | `westus2` | Wilayah Azure untuk penerapan |
| `uniqueSuffix` | string | Auto-generated | Identifikasi unik 4 karakter |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nama tampilan untuk proyek AI |
| `aiProjectDescription` | string | Deskripsi proyek | Deskripsi yang ditampilkan di Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapasitas token untuk model GPT |
| `embeddingModelCapacity` | int | `50` | Kapasitas token untuk model embedding |
| `tags` | object | Tag default | Tag sumber daya untuk tata kelola |

## 📤 Output Template

Template ini menyediakan output berikut:

| Output | Deskripsi |
|--------|-------------|
| `subscriptionId` | ID langganan Azure |
| `resourceGroupName` | Nama resource group yang dibuat |
| `aiFoundryName` | Nama layanan Azure AI Foundry |
| `foundryEndpoint` | URL endpoint layanan AI |
| `foundryAccountKey` | Kunci akses layanan AI |
| `deployedModels` | Array model OpenAI yang diterapkan |
| `applicationInsightsConnectionString` | String koneksi Application Insights |
| `logAnalyticsWorkspaceName` | Nama workspace Log Analytics |

## 🔍 Perintah Verifikasi

Setelah penerapan, verifikasi sumber daya:

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

Proyek ini menyediakan template ARM dan Bicep:

### Template ARM (`azuredeploy.json`)
- ✅ Format asli Azure Resource Manager
- ✅ Berfungsi di semua tempat yang mendukung ARM
- ✅ Tidak memerlukan alat tambahan
- ❌ Sintaks JSON lebih panjang
- ❌ Lebih sulit dibaca dan dipelihara

### Template Bicep (`main.bicep`)
- ✅ Sintaks modern dan bersih
- ✅ Alat dan IntelliSense yang lebih baik
- ✅ Lebih mudah dibaca dan dipelihara
- ✅ Validasi saat kompilasi
- ❌ Memerlukan Bicep CLI
- ❌ Langkah build tambahan

**Rekomendasi**: Gunakan template Bicep (`main.bicep`) untuk pengembangan dan template ARM (`azuredeploy.json`) untuk skenario yang memerlukan format JSON ARM murni.

## 🔧 Kustomisasi

### Menambahkan Sumber Daya Kustom

Untuk menambahkan sumber daya tambahan ke template ARM:

1. Tambahkan definisi sumber daya ke array `resources` dalam template bersarang
2. Tambahkan parameter baru ke bagian `parameters`
3. Tambahkan output yang sesuai jika diperlukan
4. Perbarui file parameter dengan nilai default

### Contoh: Menambahkan Storage Account

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

## 🐛 Pemecahan Masalah

### Masalah Umum

#### 1. Kesalahan Validasi Template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflik Nama Sumber Daya
- Pastikan `uniqueSuffix` benar-benar unik
- Gunakan fungsi `uniqueString()` untuk generasi otomatis
- Periksa sumber daya yang ada di wilayah target

#### 3. Batas Kuota
- Verifikasi ketersediaan model OpenAI di wilayah target
- Periksa kuota langganan untuk layanan AI
- Pertimbangkan menggunakan wilayah lain jika batas tercapai

#### 4. Masalah Izin
- Pastikan akun memiliki peran Contributor pada langganan
- Periksa apakah langganan diaktifkan untuk layanan AI
- Verifikasi pendaftaran penyedia sumber daya

### Perintah Debugging

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

## 🔐 Pertimbangan Keamanan

### Kontrol Akses
- Layanan AI menggunakan identitas terkelola untuk akses aman
- Resource group menyediakan batasan untuk RBAC
- Application Insights memiliki kontrol akses terpisah

### Keamanan Jaringan
- Akses jaringan publik diaktifkan secara default
- Pertimbangkan endpoint privat untuk produksi
- ACL jaringan dapat dikonfigurasi untuk keamanan tambahan

### Manajemen Kunci
- Kunci layanan AI dibuat secara otomatis
- Gunakan Azure Key Vault untuk rahasia produksi
- Rotasi kunci secara berkala untuk keamanan

## 📚 Langkah Selanjutnya

Setelah penerapan berhasil:

1. **Konfigurasi Variabel Lingkungan**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Mulai Server MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Uji Integrasi**:
   - Buka VS Code dengan proyek
   - Konfigurasi server MCP di `.vscode/mcp.json`
   - Uji AI Chat dengan kueri data retail

4. **Pantau Performa**:
   - Lihat metrik di Application Insights
   - Periksa log di Log Analytics workspace
   - Atur peringatan untuk kejadian penting

---

Untuk informasi lebih lanjut, lihat [README utama](../README.md) atau panduan [QUICKSTART](../QUICKSTART.md).

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang timbul dari penggunaan terjemahan ini.