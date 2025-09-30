<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:13:58+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "ms"
}
-->
# Arahan Penerapan Templat ARM

Dokumen ini menyediakan arahan untuk menerapkan infrastruktur MCP Retail Analytics menggunakan templat ARM.

## 📋 Gambaran Umum

Templat ARM `azuredeploy.json` menyediakan penerapan lengkap untuk:
- Kumpulan Sumber Azure
- Ruang Kerja Log Analytics  
- Application Insights
- Perkhidmatan AI Azure (Foundry)
- Penerapan Model OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Pilihan Penerapan

### Pilihan 1: Penerapan Azure CLI

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

### Pilihan 2: Penerapan PowerShell

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

### Pilihan 3: Portal Azure

1. Pergi ke [Portal Azure](https://portal.azure.com)
2. Cari "Deploy a custom template"
3. Klik "Build your own template in the editor"
4. Salin dan tampal kandungan `azuredeploy.json`
5. Klik "Save" kemudian "Review + create"
6. Isi parameter yang diperlukan dan terapkan

## 🔧 Parameter Templat

| Parameter | Jenis | Lalai | Penerangan |
|-----------|-------|-------|------------|
| `resourcePrefix` | string | `mcpretail` | Awalan untuk nama sumber |
| `location` | string | `westus2` | Wilayah Azure untuk penerapan |
| `uniqueSuffix` | string | Auto-generated | Pengecam unik 4 aksara |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nama paparan untuk projek AI |
| `aiProjectDescription` | string | Penerangan projek | Penerangan yang ditunjukkan dalam Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Kapasiti token untuk model GPT |
| `embeddingModelCapacity` | int | `50` | Kapasiti token untuk model embedding |
| `tags` | object | Tag lalai | Tag sumber untuk tadbir urus |

## 📤 Output Templat

Templat ini menyediakan output berikut:

| Output | Penerangan |
|--------|------------|
| `subscriptionId` | ID langganan Azure |
| `resourceGroupName` | Nama kumpulan sumber yang dibuat |
| `aiFoundryName` | Nama perkhidmatan Azure AI Foundry |
| `foundryEndpoint` | URL titik akhir perkhidmatan AI |
| `foundryAccountKey` | Kunci akses perkhidmatan AI |
| `deployedModels` | Array model OpenAI yang diterapkan |
| `applicationInsightsConnectionString` | Rentetan sambungan Application Insights |
| `logAnalyticsWorkspaceName` | Nama ruang kerja Log Analytics |

## 🔍 Perintah Pengesahan

Selepas penerapan, sahkan sumber:

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

Projek ini menyediakan kedua-dua templat ARM dan Bicep:

### Templat ARM (`azuredeploy.json`)
- ✅ Format asli Azure Resource Manager
- ✅ Berfungsi di mana-mana sahaja ARM disokong
- ✅ Tidak memerlukan alat tambahan
- ❌ Sintaks JSON yang lebih panjang
- ❌ Sukar untuk dibaca dan diselenggara

### Templat Bicep (`main.bicep`)
- ✅ Sintaks moden dan bersih
- ✅ Alat dan IntelliSense yang lebih baik
- ✅ Lebih mudah dibaca dan diselenggara
- ✅ Pengesahan semasa kompilasi
- ❌ Memerlukan Bicep CLI
- ❌ Langkah binaan tambahan

**Cadangan**: Gunakan templat Bicep (`main.bicep`) untuk pembangunan dan templat ARM (`azuredeploy.json`) untuk senario yang memerlukan JSON ARM tulen.

## 🔧 Penyesuaian

### Menambah Sumber Tersuai

Untuk menambah sumber tambahan ke templat ARM:

1. Tambahkan definisi sumber ke array `resources` dalam templat bersarang
2. Tambahkan parameter baru ke bahagian `parameters`
3. Tambahkan output yang berkaitan jika diperlukan
4. Kemas kini fail parameter dengan nilai lalai

### Contoh: Menambah Akaun Storan

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

## 🐛 Penyelesaian Masalah

### Isu Biasa

#### 1. Ralat Pengesahan Templat
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflik Nama Sumber
- Pastikan `uniqueSuffix` benar-benar unik
- Gunakan fungsi `uniqueString()` untuk penjanaan automatik
- Periksa sumber yang sedia ada di wilayah sasaran

#### 3. Had Kuota
- Sahkan ketersediaan model OpenAI di wilayah sasaran
- Periksa kuota langganan untuk perkhidmatan AI
- Pertimbangkan menggunakan wilayah lain jika had tercapai

#### 4. Isu Kebenaran
- Pastikan akaun mempunyai peranan Contributor pada langganan
- Periksa bahawa langganan diaktifkan untuk perkhidmatan AI
- Sahkan pendaftaran penyedia sumber

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

## 🔐 Pertimbangan Keselamatan

### Kawalan Akses
- Perkhidmatan AI menggunakan identiti terurus untuk akses selamat
- Kumpulan sumber menyediakan sempadan untuk RBAC
- Application Insights mempunyai kawalan akses berasingan

### Keselamatan Rangkaian
- Akses rangkaian awam diaktifkan secara lalai
- Pertimbangkan titik akhir peribadi untuk pengeluaran
- ACL rangkaian boleh dikonfigurasi untuk keselamatan tambahan

### Pengurusan Kunci
- Kunci perkhidmatan AI dijana secara automatik
- Gunakan Azure Key Vault untuk rahsia pengeluaran
- Putar kunci secara berkala untuk keselamatan

## 📚 Langkah Seterusnya

Selepas penerapan berjaya:

1. **Konfigurasikan Pembolehubah Persekitaran**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Mulakan Pelayan MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Uji Integrasi**:
   - Buka VS Code dengan projek
   - Konfigurasikan pelayan MCP dalam `.vscode/mcp.json`
   - Uji AI Chat dengan pertanyaan data runcit

4. **Pantau Prestasi**:
   - Lihat metrik dalam Application Insights
   - Periksa log dalam ruang kerja Log Analytics
   - Tetapkan amaran untuk acara penting

---

Untuk maklumat lanjut, lihat [README utama](../README.md) atau panduan [QUICKSTART](../QUICKSTART.md).

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.