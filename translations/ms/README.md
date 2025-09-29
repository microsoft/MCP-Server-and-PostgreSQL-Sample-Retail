<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T22:40:49+00:00",
  "source_file": "README.md",
  "language_code": "ms"
}
-->
# Contoh Pelayan MCP dan PostgreSQL - Analisis Jualan Runcit

## Belajar MCP dengan Integrasi Pangkalan Data melalui Contoh Praktikal

[![Penyumbang GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Isu GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Permintaan Tarik GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Sertai Discord Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Ikuti langkah-langkah ini untuk mula menggunakan sumber ini:

1. **Fork Repositori**: Klik [di sini untuk fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repositori**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Sertai Discord Azure AI Foundry**: [Berhubung dengan pakar dan pembangun lain](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Sokongan Pelbagai Bahasa

#### Disokong melalui GitHub Action (Automatik & Sentiasa Terkini)

[Perancis](../fr/README.md) | [Sepanyol](../es/README.md) | [Jerman](../de/README.md) | [Rusia](../ru/README.md) | [Arab](../ar/README.md) | [Parsi (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Cina (Ringkas)](../zh/README.md) | [Cina (Tradisional, Macau)](../mo/README.md) | [Cina (Tradisional, Hong Kong)](../hk/README.md) | [Cina (Tradisional, Taiwan)](../tw/README.md) | [Jepun](../ja/README.md) | [Korea](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugis (Portugal)](../pt/README.md) | [Portugis (Brazil)](../br/README.md) | [Itali](../it/README.md) | [Poland](../pl/README.md) | [Turki](../tr/README.md) | [Yunani](../el/README.md) | [Thai](../th/README.md) | [Sweden](../sv/README.md) | [Denmark](../da/README.md) | [Norway](../no/README.md) | [Finland](../fi/README.md) | [Belanda](../nl/README.md) | [Ibrani](../he/README.md) | [Vietnam](../vi/README.md) | [Indonesia](../id/README.md) | [Melayu](./README.md) | [Tagalog (Filipina)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungary](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romania](../ro/README.md) | [Bulgaria](../bg/README.md) | [Serbia (Cyrillic)](../sr/README.md) | [Croatia](../hr/README.md) | [Slovenia](../sl/README.md) | [Ukraine](../uk/README.md) | [Burma (Myanmar)](../my/README.md)

**Jika anda ingin menambah sokongan bahasa lain, senarai bahasa yang disokong boleh didapati [di sini](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Pengenalan

Contoh ini menunjukkan cara membina dan melancarkan **pelayan Model Context Protocol (MCP)** yang menyediakan pembantu AI akses pintar dan selamat kepada data jualan runcit melalui PostgreSQL. Projek ini mempamerkan ciri-ciri peringkat perusahaan termasuk **Row Level Security (RLS)**, **keupayaan carian semantik**, dan **integrasi Azure AI** untuk senario analitik runcit dunia sebenar.

**Kes Penggunaan Utama:**
- **Analitik Jualan Berkuasa AI**: Membolehkan pembantu AI membuat pertanyaan dan menganalisis data jualan runcit melalui bahasa semula jadi
- **Akses Multi-Tenant Selamat**: Menunjukkan pelaksanaan Row Level Security di mana pengurus kedai yang berbeza hanya boleh mengakses data kedai mereka
- **Carian Produk Semantik**: Memperlihatkan penemuan produk yang dipertingkatkan AI menggunakan teks embedding
- **Integrasi Perusahaan**: Menunjukkan cara mengintegrasikan pelayan MCP dengan perkhidmatan Azure dan pangkalan data PostgreSQL

**Sesuai untuk:**
- Pembangun yang ingin belajar membina pelayan MCP dengan integrasi pangkalan data
- Jurutera data yang melaksanakan penyelesaian analitik multi-tenant yang selamat
- Pembangun aplikasi AI yang bekerja dengan data runcit atau e-dagang
- Sesiapa yang berminat menggabungkan pembantu AI dengan pangkalan data perusahaan

## Sertai Komuniti Discord Azure AI Foundry
Kongsi pengalaman anda tentang MCP dan berhubung dengan pakar serta kumpulan produk

[![Discord Azure AI](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Pelayan MCP Analisis Jualan

Pelayan Model Context Protocol (MCP) yang menyediakan akses pangkalan data jualan pelanggan yang komprehensif untuk Perniagaan DIY Zava Retail. Pelayan ini membolehkan pembantu AI membuat pertanyaan dan menganalisis data jualan runcit melalui antara muka yang selamat dan sedar skema.

## 📚 Panduan Pelaksanaan Lengkap

Untuk penjelasan terperinci tentang cara penyelesaian ini dibina dan cara melaksanakan pelayan MCP yang serupa, lihat **[Panduan Contoh](Sample_Walkthrough.md)** kami yang komprehensif. Panduan ini menyediakan:

- **Penyelaman Mendalam Seni Bina**: Analisis komponen dan corak reka bentuk
- **Langkah Demi Langkah Membina**: Dari persediaan projek hingga pelancaran
- **Penjelasan Kod**: Penjelasan terperinci tentang pelaksanaan pelayan MCP
- **Ciri Lanjutan**: Row Level Security, carian semantik, dan pemantauan
- **Amalan Terbaik**: Garis panduan keselamatan, prestasi, dan pembangunan
- **Penyelesaian Masalah**: Isu biasa dan penyelesaian

Sesuai untuk pembangun yang ingin memahami butiran pelaksanaan dan membina penyelesaian serupa.

## 🤖 Apa itu MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** adalah standard terbuka yang membolehkan pembantu AI mengakses sumber data dan alat luaran dengan selamat dalam masa nyata. Ia berfungsi sebagai jambatan yang membolehkan model AI berhubung dengan pangkalan data, API, sistem fail, dan sumber lain sambil mengekalkan keselamatan dan kawalan.

### Manfaat Utama:
- **Akses Data Masa Nyata**: Pembantu AI boleh membuat pertanyaan kepada pangkalan data dan API secara langsung
- **Integrasi Selamat**: Akses terkawal dengan pengesahan dan kebenaran  
- **Kebolehlanjutan Alat**: Tambah keupayaan tersuai kepada pembantu AI
- **Protokol Standard**: Berfungsi merentasi platform dan alat AI yang berbeza

### Baru dengan MCP?

Jika anda baru dengan Model Context Protocol, kami mengesyorkan bermula dengan sumber pemula Microsoft yang komprehensif:

**📖 [Panduan MCP untuk Pemula](https://aka.ms/mcp-for-beginners)**

Sumber ini menyediakan:
- Pengenalan kepada konsep dan seni bina MCP
- Tutorial langkah demi langkah untuk membina pelayan MCP pertama anda
- Amalan terbaik untuk pembangunan MCP
- Contoh integrasi dengan platform AI popular
- Sumber komuniti dan sokongan

Setelah anda memahami asasnya, kembali ke sini untuk meneroka pelaksanaan analitik runcit lanjutan ini!

## 📚 Panduan Pembelajaran Komprehensif: /walkthrough

Repositori ini termasuk **panduan pembelajaran 12 modul lengkap** yang memecahkan contoh pelayan MCP runcit ini kepada pelajaran langkah demi langkah yang mudah difahami. Panduan ini mengubah contoh kerja ini menjadi sumber pendidikan komprehensif yang sesuai untuk pembangun yang ingin memahami cara membina pelayan MCP bersedia untuk pengeluaran dengan integrasi pangkalan data.

### Apa yang Akan Anda Pelajari

Panduan ini merangkumi segalanya dari konsep asas MCP hingga pelancaran pengeluaran lanjutan, termasuk:

- **Asas MCP**: Memahami Model Context Protocol dan aplikasinya dalam dunia sebenar
- **Integrasi Pangkalan Data**: Melaksanakan sambungan PostgreSQL yang selamat dengan Row Level Security
- **Ciri Dipertingkatkan AI**: Menambah keupayaan carian semantik dengan embedding Azure OpenAI
- **Pelaksanaan Keselamatan**: Pengesahan, kebenaran, dan pengasingan data peringkat perusahaan
- **Pembangunan Alat**: Membina alat MCP yang canggih untuk analisis data dan kecerdasan perniagaan
- **Ujian & Penyahpepijatan**: Strategi ujian komprehensif dan teknik penyahpepijatan
- **Integrasi VS Code**: Konfigurasi AI Chat untuk pertanyaan pangkalan data bahasa semula jadi
- **Pelancaran Pengeluaran**: Strategi kontainerisasi, penskalaan, dan pelancaran awan
- **Pemantauan & Pemerhatian**: Application Insights, logging, dan pemantauan prestasi

### Gambaran Keseluruhan Laluan Pembelajaran

Panduan ini mengikuti struktur pembelajaran progresif yang direka untuk pembangun dari semua tahap kemahiran:

| Modul | Kawasan Fokus | Penerangan | Anggaran Masa |
|-------|---------------|------------|---------------|
| **[00-Pengenalan](walkthrough/00-Introduction/README.md)** | Asas | Konsep MCP, kajian kes Zava Retail, gambaran seni bina | 30 minit |
| **[01-Seni Bina](walkthrough/01-Architecture/README.md)** | Corak Reka Bentuk | Seni bina teknikal, reka bentuk berlapis, komponen sistem | 45 minit |
| **[02-Keselamatan](walkthrough/02-Security/README.md)** | Keselamatan Perusahaan | Pengesahan Azure, Row Level Security, pengasingan multi-tenant | 60 minit |
| **[03-Persediaan](walkthrough/03-Setup/README.md)** | Persekitaran | Persediaan Docker, Azure CLI, konfigurasi projek, pengesahan | 45 minit |
| **[04-Pangkalan Data](walkthrough/04-Database/README.md)** | Lapisan Data | Skema PostgreSQL, pgvector, polisi RLS, data contoh | 60 minit |
| **[05-Pelayan MCP](walkthrough/05-MCP-Server/README.md)** | Pelaksanaan Teras | Rangka kerja FastMCP, integrasi pangkalan data, pengurusan sambungan | 90 minit |
| **[06-Alat](walkthrough/06-Tools/README.md)** | Pembangunan Alat | Penciptaan alat MCP, pengesahan pertanyaan, ciri kecerdasan perniagaan | 75 minit |
| **[07-Carian Semantik](walkthrough/07-Semantic-Search/README.md)** | Integrasi AI | Embedding Azure OpenAI, carian vektor, strategi carian hibrid | 60 minit |
| **[08-Ujian](walkthrough/08-Testing/README.md)** | Jaminan Kualiti | Ujian unit, ujian integrasi, ujian prestasi, penyahpepijatan | 75 minit |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Pengalaman Pembangunan | Konfigurasi VS Code, integrasi AI Chat, aliran kerja penyahpepijatan | 45 minit |
| **[10-Pelancaran](walkthrough/10-Deployment/README.md)** | Sedia Pengeluaran | Kontainerisasi, Azure Container Apps, pipeline CI/CD, penskalaan | 90 minit |
| **[11-Pemantauan](walkthrough/11-Monitoring/README.md)** | Pemerhatian | Application Insights, logging berstruktur, metrik prestasi | 60 minit |
| **[12-Amalan Terbaik](walkthrough/12-Best-Practices/README.md)** | Kecemerlangan Pengeluaran | Pengukuhan keselamatan, pengoptimuman prestasi, corak perusahaan | 45 minit |

**Jumlah Masa Pembelajaran**: ~12-15 jam pembelajaran praktikal yang komprehensif

### 🎯 Cara Menggunakan Panduan

**Untuk Pemula**:
1. Mulakan dengan [Modul 00: Pengenalan](walkthrough/00-Introduction/README.md) untuk memahami asas MCP
2. Ikuti modul secara berurutan untuk pengalaman pembelajaran lengkap
3. Setiap modul membina konsep sebelumnya dan termasuk latihan praktikal

**Untuk Pembangun Berpengalaman**:
1. Semak [Gambaran Keseluruhan Panduan Utama](walkthrough/README.md) untuk ringkasan modul lengkap
2. Lompat ke modul tertentu yang menarik minat anda (contohnya, Modul 07 untuk integrasi AI)
3. Gunakan modul individu sebagai bahan rujukan untuk projek anda sendiri

**Untuk Pelaksanaan Pengeluaran**:
1. Fokus pada Modul 02 (Keselamatan), 10 (Pelancaran), dan 11 (Pemantauan)
2. Semak Modul 12 (Amalan Terbaik) untuk garis panduan perusahaan
3. Gunakan contoh kod sebagai templat sedia pengeluaran

### 🚀 Pilihan Permulaan Pantas

**Pilihan 1: Laluan Pembelajaran Lengkap** (Disyorkan untuk pemula)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Pilihan 2: Pelaksanaan Praktikal** (Terus mula membina)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Pilihan 3: Fokus Pengeluaran** (Pelancaran perusahaan)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Prasyarat Pembelajaran

**Latar Belakang Disyorkan**:
- Pengalaman asas dalam pengaturcaraan Python
- Kefahaman tentang REST API dan pangkalan data
- Pemahaman umum tentang konsep AI/ML
- Pengetahuan asas tentang baris perintah dan Docker

**Tidak Diperlukan (tetapi berguna)**:
- Pengalaman MCP sebelumnya (kami akan menerangkan dari awal)
- Pengalaman dengan Azure cloud (kami menyediakan panduan langkah demi langkah)
- Pengetahuan lanjutan tentang PostgreSQL (kami akan menerangkan konsep yang diperlukan)

### 💡 Petua Pembelajaran

1. **Pendekatan Praktikal**: Setiap modul mengandungi contoh kod yang boleh dijalankan dan diubah suai
2. **Kerumitan Secara Berperingkat**: Konsep dibina secara beransur-ansur daripada mudah kepada kompleks
3. **Konteks Dunia Sebenar**: Semua contoh menggunakan senario perniagaan runcit yang realistik
4. **Sedia untuk Pengeluaran**: Contoh kod direka untuk digunakan dalam pengeluaran sebenar
5. **Sokongan Komuniti**: Sertai [komuniti Discord kami](https://discord.com/invite/ByRwuEEgH4) untuk bantuan dan perbincangan

### 🔗 Sumber Berkaitan

- **[MCP untuk Pemula](https://aka.ms/mcp-for-beginners)**: Bacaan latar belakang penting
- **[Panduan Contoh](Sample_Walkthrough.md)**: Gambaran teknikal peringkat tinggi
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Platform cloud yang digunakan dalam contoh
- **[Kerangka FastMCP](https://github.com/jlowin/fastmcp)**: Kerangka pelaksanaan MCP Python

**Sedia untuk mula belajar?** Mulakan dengan **[Modul 00: Pengenalan](walkthrough/00-Introduction/README.md)** atau terokai **[gambaran keseluruhan panduan lengkap](walkthrough/README.md)**.

## Prasyarat

1. Docker Desktop dipasang
2. Git dipasang
3. **Azure CLI**: Pasang dan sahkan dengan Azure CLI
4. Akses kepada model OpenAI `text-embedding-3-small` dan secara opsional model `gpt-4o-mini`.

## Memulakan

Buka tetingkap terminal dan jalankan arahan berikut:

1. Sahkan dengan Azure CLI

    ```bash
    az login
    ```

2. Klon repositori

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigasi ke direktori projek

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Menyebarkan Sumber Azure

Jalankan skrip berikut untuk mengautomasi penyebaran sumber Azure yang diperlukan untuk pelayan MCP.

Skrip penyebaran akan secara automatik menyebarkan model `text-embedding-3-small`. Semasa penyebaran, anda akan mempunyai pilihan untuk turut menyertakan model `gpt-4o-mini`. Perlu diingat bahawa `gpt-4o-mini` **tidak diperlukan** untuk projek ini dan hanya disertakan untuk peningkatan masa depan yang berpotensi.

**Pilih skrip untuk platform anda:**

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

## Menjalankan Pelayan MCP

Cara paling mudah untuk menjalankan keseluruhan stack (PostgreSQL + Pelayan MCP) adalah menggunakan Docker Compose:

### Mulakan Stack

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

## Penggunaan

Berikut mengandaikan anda akan menggunakan sokongan pelayan MCP terbina dalam VS Code.

1. Buka projek dalam VS Code. Dari terminal, jalankan:

    ```bash
    code .
    ```

2. Mulakan satu atau lebih pelayan MCP menggunakan konfigurasi dalam `.vscode/mcp.json`. Fail ini mengandungi empat konfigurasi pelayan yang berbeza, masing-masing mewakili peranan pengurus kedai yang berbeza:

   - Setiap konfigurasi menggunakan ID pengguna RLS (Row Level Security) yang unik
   - ID pengguna ini mensimulasikan identiti pengurus kedai yang berbeza mengakses pangkalan data
   - Sistem RLS mengehadkan akses data berdasarkan kedai yang ditugaskan kepada pengurus
   - Ini meniru senario dunia sebenar di mana pengurus kedai log masuk dengan akaun Entra ID yang berbeza

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

### Buka AI Chat VS Code

1. Buka mod AI Chat dalam VS Code
2. Taip **#zava** dan pilih salah satu pelayan MCP yang anda mulakan
3. Ajukan soalan tentang data jualan - Lihat contoh pertanyaan di bawah

### Contoh Pertanyaan

1. Tunjukkan 20 produk teratas berdasarkan hasil jualan
1. Tunjukkan jualan mengikut kedai
1. Apakah jualan suku tahun lepas mengikut kategori?
1. Apakah produk yang kami jual yang serupa dengan "bekas untuk cat"

## Ciri-ciri

- **Akses Skema Multi-Jadual**: Dapatkan skema untuk beberapa jadual pangkalan data dalam satu permintaan
- **Pelaksanaan Pertanyaan Selamat**: Jalankan pertanyaan PostgreSQL dengan sokongan Row Level Security (RLS)
- **Data Masa Nyata**: Akses data jualan, inventori, dan pelanggan semasa
- **Utiliti Tarikh/Masa**: Dapatkan cap masa UTC semasa untuk analisis sensitif masa
- **Penyebaran Fleksibel**: Menyokong mod pelayan HTTP

## Jadual yang Disokong

Pelayan menyediakan akses kepada jadual pangkalan data runcit berikut:

- `retail.customers` - Maklumat dan profil pelanggan
- `retail.stores` - Lokasi dan butiran kedai
- `retail.categories` - Kategori produk dan hierarki
- `retail.product_types` - Pengelasan jenis produk
- `retail.products` - Katalog produk dan spesifikasi
- `retail.orders` - Pesanan pelanggan dan transaksi
- `retail.order_items` - Item individu dalam pesanan
- `retail.inventory` - Tahap inventori semasa dan data stok

## Alat yang Tersedia

### `get_multiple_table_schemas`

Dapatkan skema pangkalan data untuk beberapa jadual dalam satu permintaan.

**Parameter:**

- `table_names` (list[str]): Senarai nama jadual yang sah daripada jadual yang disokong di atas

**Pulangan:** Rentetan skema yang digabungkan untuk jadual yang diminta

### `execute_sales_query`

Jalankan pertanyaan PostgreSQL terhadap pangkalan data jualan dengan Row Level Security.

**Parameter:**

- `postgresql_query` (str): Pertanyaan PostgreSQL yang dibentuk dengan baik

**Pulangan:** Hasil pertanyaan yang diformatkan sebagai rentetan (dihadkan kepada 20 baris untuk kemudahan pembacaan)

**Amalan Terbaik:**

- Sentiasa dapatkan skema jadual terlebih dahulu
- Gunakan nama lajur yang tepat daripada skema
- Gabungkan jadual berkaitan untuk analisis yang komprehensif
- Agregatkan hasil apabila sesuai
- Hadkan output untuk kemudahan pembacaan

### `get_current_utc_date`

Dapatkan tarikh dan masa UTC semasa dalam format ISO.

**Pulangan:** Tarikh/masa UTC semasa dalam format ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Lakukan carian semantik untuk produk berdasarkan pertanyaan pengguna.

**Pulangan:** Senarai produk yang sepadan dengan kriteria carian

**Parameter:**

- `query` (str): Rentetan pertanyaan carian

**Pulangan:** Senarai produk yang sepadan dengan kriteria carian

## Ciri Keselamatan

### Row Level Security (RLS)

Pelayan melaksanakan Row Level Security untuk memastikan pengguna hanya mengakses data yang mereka diberi kuasa untuk melihat:

- **Mod HTTP**: Menggunakan header `x-rls-user-id` untuk mengenal pasti pengguna yang membuat permintaan

- **Fallback Lalai**: Menggunakan UUID placeholder apabila tiada ID pengguna disediakan

#### ID Pengguna RLS Khusus Kedai

Setiap lokasi kedai Zava Retail mempunyai ID pengguna RLS yang unik yang menentukan data mana yang boleh diakses oleh pengguna:

| Lokasi Kedai | ID Pengguna RLS | Penerangan |
|---------------|-------------|-------------|
| **Akses Global** | `00000000-0000-0000-0000-000000000000` | Fallback lalai - akses semua kedai |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Data kedai Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Data kedai Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Data kedai Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Data kedai Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Data kedai Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Data kedai Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Data kedai Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Data kedai Zava Retail Online |

#### Pelaksanaan RLS

Apabila pengguna menyambung dengan ID Pengguna RLS kedai tertentu, mereka hanya akan melihat:

- Pelanggan yang dikaitkan dengan kedai tersebut
- Pesanan yang dibuat di lokasi kedai tersebut
- Data inventori untuk kedai tertentu
- Metrik jualan dan prestasi khusus kedai

Ini memastikan pengasingan data antara lokasi kedai yang berbeza sambil mengekalkan skema pangkalan data yang bersatu.

## Seni Bina

### Konteks Aplikasi

Pelayan menggunakan konteks aplikasi terurus dengan:

- **Kolam Sambungan Pangkalan Data**: Pengurusan sambungan yang cekap untuk mod HTTP
- **Pengurusan Kitaran Hayat**: Pembersihan sumber yang betul semasa penutupan
- **Keselamatan Jenis**: Konteks yang ditaip dengan kuat dengan dataclass `AppContext`

### Konteks Permintaan

- **Ekstraksi Header**: Penguraian header yang selamat untuk pengenalan pengguna
- **Integrasi RLS**: Resolusi ID pengguna automatik daripada konteks permintaan
- **Pengendalian Ralat**: Pengendalian ralat yang komprehensif dengan mesej mesra pengguna

## Integrasi Pangkalan Data

Pelayan berintegrasi dengan pangkalan data PostgreSQL melalui kelas `PostgreSQLSchemaProvider`:

- **Kolam Sambungan**: Menggunakan kolam sambungan async untuk skalabiliti
- **Metadata Skema**: Menyediakan maklumat skema jadual yang terperinci
- **Pelaksanaan Pertanyaan**: Pelaksanaan pertanyaan yang selamat dengan sokongan RLS
- **Pengurusan Sumber**: Pembersihan sumber pangkalan data secara automatik

## Pengendalian Ralat

Pelayan melaksanakan pengendalian ralat yang kukuh:

- **Pengesahan Jadual**: Memastikan hanya nama jadual yang sah diakses
- **Pengesahan Pertanyaan**: Memastikan pertanyaan PostgreSQL sah sebelum pelaksanaan
- **Pengurusan Sumber**: Pembersihan yang betul walaupun semasa ralat
- **Mesej Mesra Pengguna**: Mesej ralat yang jelas untuk penyelesaian masalah

## Pertimbangan Keselamatan

1. **Row Level Security**: Semua pertanyaan menghormati polisi RLS berdasarkan identiti pengguna
2. **Pengasingan Data Kedai**: ID Pengguna RLS setiap kedai memastikan akses hanya kepada data kedai tersebut
3. **Pengesahan Input**: Nama jadual dan pertanyaan disahkan sebelum pelaksanaan
4. **Had Sumber**: Hasil pertanyaan dihadkan untuk mencegah penggunaan sumber yang berlebihan
5. **Keselamatan Sambungan**: Menggunakan amalan sambungan pangkalan data yang selamat
6. **Pengesahan Identiti Pengguna**: Sentiasa pastikan ID Pengguna RLS yang betul digunakan untuk lokasi kedai yang dimaksudkan

### Nota Keselamatan Penting

- **Jangan gunakan ID Pengguna RLS pengeluaran dalam persekitaran pembangunan**
- **Sentiasa pastikan ID Pengguna RLS sepadan dengan kedai yang dimaksudkan sebelum menjalankan pertanyaan**
- **UUID lalai (`00000000-0000-0000-0000-000000000000`) menyediakan akses terhad**
- **Setiap pengurus kedai hanya boleh mengakses ID Pengguna RLS kedai mereka**

## Pembangunan

### Struktur Projek

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Komponen Utama

- **Pelayan FastMCP**: Pelaksanaan pelayan MCP moden dengan sokongan async
- **Penyedia PostgreSQL**: Lapisan abstraksi pangkalan data dengan sokongan RLS
- **Pengurusan Konteks**: Pengendalian konteks aplikasi dan permintaan yang ditaip dengan selamat
- **Pendaftaran Alat**: Pendaftaran alat secara deklaratif dengan pengesahan Pydantic

## Menyumbang

Apabila menyumbang kepada pelayan ini:

1. Pastikan semua pertanyaan pangkalan data menghormati Row Level Security
2. Tambahkan pengendalian ralat yang betul untuk alat baru
3. Kemas kini README ini dengan sebarang ciri atau perubahan baru
4. Uji mod pelayan HTTP
5. Sahkan parameter input dan sediakan mesej ralat yang jelas

## [Lesen](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Pelayan MCP ini membolehkan akses yang selamat dan cekap kepada data jualan Zava Retail untuk analisis dan wawasan yang dikuasakan oleh AI.*

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.