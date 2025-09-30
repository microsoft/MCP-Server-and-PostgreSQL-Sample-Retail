<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T10:03:33+00:00",
  "source_file": "README.md",
  "language_code": "id"
}
-->
# Contoh MCP Server dan PostgreSQL - Analisis Penjualan Ritel

## Pelajari MCP dengan Integrasi Database melalui Contoh Praktis

[![Kontributor GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Masalah GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Permintaan Tarik GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Bergabung dengan Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Ikuti langkah-langkah berikut untuk memulai menggunakan sumber daya ini:

1. **Fork Repositori**: Klik [di sini untuk fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repositori**: `git clone https://github.com/NAMA-PENGGUNA-ANDA/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Bergabung dengan Azure AI Foundry Discord**: [Temui para ahli dan pengembang lainnya](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Dukungan Multi-Bahasa

#### Didukung melalui GitHub Action (Otomatis & Selalu Terbaru)

[Prancis](../fr/README.md) | [Spanyol](../es/README.md) | [Jerman](../de/README.md) | [Rusia](../ru/README.md) | [Arab](../ar/README.md) | [Persia (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Cina (Sederhana)](../zh/README.md) | [Cina (Tradisional, Makau)](../mo/README.md) | [Cina (Tradisional, Hong Kong)](../hk/README.md) | [Cina (Tradisional, Taiwan)](../tw/README.md) | [Jepang](../ja/README.md) | [Korea](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugis (Portugal)](../pt/README.md) | [Portugis (Brasil)](../br/README.md) | [Italia](../it/README.md) | [Polandia](../pl/README.md) | [Turki](../tr/README.md) | [Yunani](../el/README.md) | [Thailand](../th/README.md) | [Swedia](../sv/README.md) | [Denmark](../da/README.md) | [Norwegia](../no/README.md) | [Finlandia](../fi/README.md) | [Belanda](../nl/README.md) | [Ibrani](../he/README.md) | [Vietnam](../vi/README.md) | [Indonesia](./README.md) | [Melayu](../ms/README.md) | [Tagalog (Filipina)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungaria](../hu/README.md) | [Ceko](../cs/README.md) | [Slovakia](../sk/README.md) | [Rumania](../ro/README.md) | [Bulgaria](../bg/README.md) | [Serbia (Kiril)](../sr/README.md) | [Kroasia](../hr/README.md) | [Slovenia](../sl/README.md) | [Ukraina](../uk/README.md) | [Burma (Myanmar)](../my/README.md)

**Jika Anda ingin menambahkan dukungan bahasa lain, daftar bahasa yang didukung tersedia [di sini](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Pendahuluan

Contoh ini menunjukkan cara membangun dan menerapkan **server Model Context Protocol (MCP)** yang menyediakan asisten AI dengan akses aman dan cerdas ke data penjualan ritel melalui PostgreSQL. Proyek ini menampilkan fitur kelas perusahaan termasuk **Row Level Security (RLS)**, **kemampuan pencarian semantik**, dan **integrasi Azure AI** untuk skenario analitik ritel dunia nyata.

**Kasus Penggunaan Utama:**
- **Analitik Penjualan Berbasis AI**: Memungkinkan asisten AI untuk melakukan kueri dan menganalisis data penjualan ritel melalui bahasa alami
- **Akses Multi-Tenant yang Aman**: Menunjukkan implementasi Row Level Security di mana manajer toko hanya dapat mengakses data toko mereka sendiri
- **Pencarian Produk Semantik**: Menampilkan penemuan produk yang ditingkatkan AI menggunakan embedding teks
- **Integrasi Perusahaan**: Mengilustrasikan cara mengintegrasikan server MCP dengan layanan Azure dan database PostgreSQL

**Cocok untuk:**
- Pengembang yang ingin belajar membangun server MCP dengan integrasi database
- Insinyur data yang menerapkan solusi analitik multi-tenant yang aman
- Pengembang aplikasi AI yang bekerja dengan data ritel atau e-commerce
- Siapa pun yang tertarik menggabungkan asisten AI dengan database perusahaan

## Bergabung dengan Komunitas Discord Azure AI Foundry
Bagikan pengalaman Anda tentang MCP dan temui para ahli serta grup produk 

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server untuk Analisis Penjualan

Server Model Context Protocol (MCP) yang menyediakan akses database penjualan pelanggan yang komprehensif untuk Bisnis DIY Zava Retail. Server ini memungkinkan asisten AI untuk melakukan kueri dan menganalisis data penjualan ritel melalui antarmuka yang aman dan sadar skema.

## 📚 Panduan Implementasi Lengkap

Untuk penjelasan rinci tentang cara membangun solusi ini dan menerapkan server MCP serupa, lihat **[Panduan Contoh](Sample_Walkthrough.md)** kami yang komprehensif. Panduan ini mencakup:

- **Pendalaman Arsitektur**: Analisis komponen dan pola desain
- **Langkah-Langkah Pembangunan**: Dari pengaturan proyek hingga penerapan
- **Penjelasan Kode**: Penjelasan rinci tentang implementasi server MCP
- **Fitur Lanjutan**: Row Level Security, pencarian semantik, dan pemantauan
- **Praktik Terbaik**: Pedoman keamanan, kinerja, dan pengembangan
- **Pemecahan Masalah**: Masalah umum dan solusinya

Cocok untuk pengembang yang ingin memahami detail implementasi dan membangun solusi serupa.

## 🤖 Apa itu MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** adalah standar terbuka yang memungkinkan asisten AI untuk mengakses sumber data eksternal dan alat secara aman dalam waktu nyata. Anggap saja sebagai jembatan yang memungkinkan model AI terhubung dengan database, API, sistem file, dan sumber daya lainnya sambil menjaga keamanan dan kontrol.

### Manfaat Utama:
- **Akses Data Waktu Nyata**: Asisten AI dapat melakukan kueri database dan API langsung
- **Integrasi Aman**: Akses terkontrol dengan autentikasi dan izin  
- **Ekstensibilitas Alat**: Menambahkan kemampuan khusus ke asisten AI
- **Protokol Standar**: Bekerja di berbagai platform dan alat AI

### Baru Mengenal MCP?

Jika Anda baru mengenal Model Context Protocol, kami merekomendasikan untuk memulai dengan sumber daya pemula Microsoft yang komprehensif:

**📖 [Panduan MCP untuk Pemula](https://aka.ms/mcp-for-beginners)**

Sumber daya ini mencakup:
- Pengantar konsep dan arsitektur MCP
- Tutorial langkah demi langkah untuk membangun server MCP pertama Anda
- Praktik terbaik untuk pengembangan MCP
- Contoh integrasi dengan platform AI populer
- Sumber daya dan dukungan komunitas

Setelah Anda memahami dasar-dasarnya, kembali ke sini untuk menjelajahi implementasi analitik ritel tingkat lanjut ini!

## 📚 Panduan Pembelajaran Komprehensif: /walkthrough

Repositori ini mencakup **panduan pembelajaran 12 modul lengkap** yang memecah contoh server MCP ritel ini menjadi pelajaran langkah demi langkah yang mudah dipahami. Panduan ini mengubah contoh kerja ini menjadi sumber daya pendidikan yang komprehensif, sempurna untuk pengembang yang ingin memahami cara membangun server MCP siap produksi dengan integrasi database.

### Apa yang Akan Anda Pelajari

Panduan ini mencakup segala hal mulai dari konsep dasar MCP hingga penerapan produksi tingkat lanjut, termasuk:

- **Dasar-Dasar MCP**: Memahami Model Context Protocol dan aplikasinya di dunia nyata
- **Integrasi Database**: Menerapkan konektivitas PostgreSQL yang aman dengan Row Level Security
- **Fitur yang Ditingkatkan AI**: Menambahkan kemampuan pencarian semantik dengan embedding Azure OpenAI
- **Implementasi Keamanan**: Autentikasi, otorisasi, dan isolasi data tingkat perusahaan
- **Pengembangan Alat**: Membangun alat MCP canggih untuk analisis data dan intelijen bisnis
- **Pengujian & Debugging**: Strategi pengujian dan teknik debugging yang komprehensif
- **Integrasi VS Code**: Mengonfigurasi AI Chat untuk kueri database berbasis bahasa alami
- **Penerapan Produksi**: Strategi kontainerisasi, penskalaan, dan penerapan cloud
- **Pemantauan & Observabilitas**: Application Insights, logging, dan pemantauan kinerja

### Ikhtisar Jalur Pembelajaran

Panduan ini mengikuti struktur pembelajaran progresif yang dirancang untuk pengembang dari semua tingkat keahlian:

| Modul | Area Fokus | Deskripsi | Perkiraan Waktu |
|-------|------------|-----------|-----------------|
| **[00-Pendahuluan](walkthrough/00-Introduction/README.md)** | Dasar | Konsep MCP, studi kasus Zava Retail, ikhtisar arsitektur | 30 menit |
| **[01-Arsitektur](walkthrough/01-Architecture/README.md)** | Pola Desain | Arsitektur teknis, desain berlapis, komponen sistem | 45 menit |
| **[02-Keamanan](walkthrough/02-Security/README.md)** | Keamanan Perusahaan | Autentikasi Azure, Row Level Security, isolasi multi-tenant | 60 menit |
| **[03-Pengaturan](walkthrough/03-Setup/README.md)** | Lingkungan | Pengaturan Docker, Azure CLI, konfigurasi proyek, validasi | 45 menit |
| **[04-Database](walkthrough/04-Database/README.md)** | Lapisan Data | Skema PostgreSQL, pgvector, kebijakan RLS, data contoh | 60 menit |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Implementasi Inti | Kerangka kerja FastMCP, integrasi database, manajemen koneksi | 90 menit |
| **[06-Alat](walkthrough/06-Tools/README.md)** | Pengembangan Alat | Pembuatan alat MCP, validasi kueri, fitur intelijen bisnis | 75 menit |
| **[07-Pencarian-Semantik](walkthrough/07-Semantic-Search/README.md)** | Integrasi AI | Embedding Azure OpenAI, pencarian vektor, strategi pencarian hibrida | 60 menit |
| **[08-Pengujian](walkthrough/08-Testing/README.md)** | Jaminan Kualitas | Pengujian unit, pengujian integrasi, pengujian kinerja, debugging | 75 menit |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Pengalaman Pengembangan | Konfigurasi VS Code, integrasi AI Chat, alur kerja debugging | 45 menit |
| **[10-Penerapan](walkthrough/10-Deployment/README.md)** | Siap Produksi | Kontainerisasi, Azure Container Apps, pipeline CI/CD, penskalaan | 90 menit |
| **[11-Pemantauan](walkthrough/11-Monitoring/README.md)** | Observabilitas | Application Insights, logging terstruktur, metrik kinerja | 60 menit |
| **[12-Praktik-Terbaik](walkthrough/12-Best-Practices/README.md)** | Keunggulan Produksi | Penguatan keamanan, optimasi kinerja, pola perusahaan | 45 menit |

**Total Waktu Pembelajaran**: ~12-15 jam pembelajaran praktis yang komprehensif

### 🎯 Cara Menggunakan Panduan

**Untuk Pemula**:
1. Mulailah dengan [Modul 00: Pendahuluan](walkthrough/00-Introduction/README.md) untuk memahami dasar-dasar MCP
2. Ikuti modul secara berurutan untuk pengalaman pembelajaran yang lengkap
3. Setiap modul membangun konsep sebelumnya dan mencakup latihan praktis

**Untuk Pengembang Berpengalaman**:
1. Tinjau [Ikhtisar Panduan Utama](walkthrough/README.md) untuk ringkasan modul lengkap
2. Langsung ke modul tertentu yang menarik minat Anda (misalnya, Modul 07 untuk integrasi AI)
3. Gunakan modul individu sebagai referensi untuk proyek Anda sendiri

**Untuk Implementasi Produksi**:
1. Fokus pada Modul 02 (Keamanan), 10 (Penerapan), dan 11 (Pemantauan)
2. Tinjau Modul 12 (Praktik Terbaik) untuk pedoman perusahaan
3. Gunakan contoh kode sebagai template siap produksi

### 🚀 Opsi Mulai Cepat

**Opsi 1: Jalur Pembelajaran Lengkap** (Direkomendasikan untuk pemula)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opsi 2: Implementasi Praktis** (Langsung membangun)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opsi 3: Fokus Produksi** (Penerapan perusahaan)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Prasyarat Pembelajaran

**Latar Belakang yang Direkomendasikan**:
- Pengalaman dasar pemrograman Python
- Pemahaman tentang REST API dan basis data
- Pemahaman umum tentang konsep AI/ML
- Pengetahuan dasar tentang command-line dan Docker

**Tidak Diperlukan (tetapi membantu)**:
- Pengalaman sebelumnya dengan MCP (kami akan membahas ini dari awal)
- Pengalaman dengan Azure cloud (kami menyediakan panduan langkah demi langkah)
- Pengetahuan lanjutan tentang PostgreSQL (kami akan menjelaskan konsep sesuai kebutuhan)

### 💡 Tips Pembelajaran

1. **Pendekatan Praktis**: Setiap modul mencakup contoh kode yang dapat dijalankan dan dimodifikasi
2. **Kompleksitas Bertahap**: Konsep dibangun secara bertahap dari yang sederhana hingga yang kompleks
3. **Konteks Dunia Nyata**: Semua contoh menggunakan skenario bisnis ritel yang realistis
4. **Siap Produksi**: Contoh kode dirancang untuk penggunaan produksi nyata
5. **Dukungan Komunitas**: Bergabunglah dengan [komunitas Discord kami](https://discord.com/invite/ByRwuEEgH4) untuk bantuan dan diskusi

### 🔗 Sumber Daya Terkait

- **[MCP untuk Pemula](https://aka.ms/mcp-for-beginners)**: Bacaan latar belakang yang penting
- **[Sample Walkthrough](Sample_Walkthrough.md)**: Gambaran teknis tingkat tinggi
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Platform cloud yang digunakan dalam contoh
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Kerangka kerja implementasi MCP Python

**Siap untuk mulai belajar?** Mulailah dengan **[Module 00: Introduction](walkthrough/00-Introduction/README.md)** atau jelajahi **[overview walkthrough lengkap](walkthrough/README.md)**.

## Prasyarat

1. Docker Desktop terinstal
2. Git terinstal
3. **Azure CLI**: Instal dan autentikasi dengan Azure CLI
4. Akses ke model OpenAI `text-embedding-3-small` dan opsional model `gpt-4o-mini`.

## Memulai

Buka jendela terminal dan jalankan perintah berikut:

1. Autentikasi dengan Azure CLI

    ```bash
    az login
    ```

2. Clone repositori

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navigasi ke direktori proyek

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Deploy Sumber Daya Azure

Jalankan skrip berikut untuk mengotomatisasi penyebaran sumber daya Azure yang diperlukan untuk server MCP.

Skrip penyebaran akan secara otomatis menyebarkan model `text-embedding-3-small`. Selama penyebaran, Anda memiliki opsi untuk juga menyertakan model `gpt-4o-mini`. Perlu dicatat bahwa `gpt-4o-mini` **tidak diperlukan** untuk proyek ini dan hanya disertakan untuk kemungkinan peningkatan di masa depan.

**Pilih skrip untuk platform Anda:**

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

## Menjalankan Server MCP

Cara termudah untuk menjalankan stack lengkap (PostgreSQL + Server MCP) adalah menggunakan Docker Compose:

### Mulai Stack

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

Berikut ini mengasumsikan Anda akan menggunakan dukungan server MCP bawaan di VS Code.

1. Buka proyek di VS Code. Dari terminal, jalankan:

    ```bash
    code .
    ```

2. Mulai satu atau lebih server MCP menggunakan konfigurasi di `.vscode/mcp.json`. File ini berisi empat konfigurasi server berbeda, masing-masing mewakili peran manajer toko yang berbeda:

   - Setiap konfigurasi menggunakan ID pengguna RLS (Row Level Security) yang unik
   - ID pengguna ini mensimulasikan identitas manajer toko yang berbeda yang mengakses basis data
   - Sistem RLS membatasi akses data berdasarkan toko yang ditugaskan kepada manajer
   - Ini meniru skenario dunia nyata di mana manajer toko masuk dengan akun Entra ID yang berbeda

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

### Buka AI Chat di VS Code

1. Buka mode AI Chat di VS Code
2. Ketik **#zava** dan pilih salah satu server MCP yang telah Anda mulai
3. Ajukan pertanyaan tentang data penjualan - Lihat contoh kueri di bawah ini

### Contoh Kueri

1. Tampilkan 20 produk teratas berdasarkan pendapatan penjualan
1. Tampilkan penjualan berdasarkan toko
1. Berapa penjualan kuartal terakhir berdasarkan kategori?
1. Produk apa yang kami jual yang mirip dengan "wadah untuk cat"

## Fitur

- **Akses Skema Multi-Tabel**: Mengambil skema untuk beberapa tabel basis data dalam satu permintaan
- **Eksekusi Kueri yang Aman**: Menjalankan kueri PostgreSQL dengan dukungan Row Level Security (RLS)
- **Data Real-Time**: Mengakses data penjualan, inventaris, dan pelanggan saat ini
- **Utilitas Tanggal/Waktu**: Mendapatkan cap waktu UTC saat ini untuk analisis yang sensitif terhadap waktu
- **Penyebaran Fleksibel**: Mendukung mode server HTTP

## Tabel yang Didukung

Server menyediakan akses ke tabel basis data ritel berikut:

- `retail.customers` - Informasi dan profil pelanggan
- `retail.stores` - Lokasi dan detail toko
- `retail.categories` - Kategori produk dan hierarki
- `retail.product_types` - Klasifikasi jenis produk
- `retail.products` - Katalog produk dan spesifikasi
- `retail.orders` - Pesanan pelanggan dan transaksi
- `retail.order_items` - Item individu dalam pesanan
- `retail.inventory` - Tingkat inventaris saat ini dan data stok

## Alat yang Tersedia

### `get_multiple_table_schemas`

Mengambil skema basis data untuk beberapa tabel dalam satu permintaan.

**Parameter:**

- `table_names` (list[str]): Daftar nama tabel yang valid dari tabel yang didukung di atas

**Pengembalian:** String skema yang digabungkan untuk tabel yang diminta

### `execute_sales_query`

Menjalankan kueri PostgreSQL terhadap basis data penjualan dengan Row Level Security.

**Parameter:**

- `postgresql_query` (str): Kueri PostgreSQL yang terstruktur dengan baik

**Pengembalian:** Hasil kueri yang diformat sebagai string (dibatasi hingga 20 baris untuk keterbacaan)

**Praktik Terbaik:**

- Selalu ambil skema tabel terlebih dahulu
- Gunakan nama kolom yang tepat dari skema
- Gabungkan tabel terkait untuk analisis yang komprehensif
- Agregasikan hasil jika diperlukan
- Batasi output untuk keterbacaan

### `get_current_utc_date`

Mendapatkan tanggal dan waktu UTC saat ini dalam format ISO.

**Pengembalian:** Tanggal/waktu UTC saat ini dalam format ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Melakukan pencarian semantik untuk produk berdasarkan kueri pengguna.

**Pengembalian:** Daftar produk yang sesuai dengan kriteria pencarian

**Parameter:**

- `query` (str): String kueri pencarian

**Pengembalian:** Daftar produk yang sesuai dengan kriteria pencarian

## Fitur Keamanan

### Row Level Security (RLS)

Server menerapkan Row Level Security untuk memastikan pengguna hanya mengakses data yang mereka berwenang untuk melihat:

- **Mode HTTP**: Menggunakan header `x-rls-user-id` untuk mengidentifikasi pengguna yang meminta

- **Fallback Default**: Menggunakan UUID placeholder saat tidak ada ID pengguna yang diberikan

#### ID Pengguna RLS Khusus Toko

Setiap lokasi toko Zava Retail memiliki ID pengguna RLS unik yang menentukan data mana yang dapat diakses pengguna:

| Lokasi Toko | ID Pengguna RLS | Deskripsi |
|-------------|-----------------|-----------|
| **Akses Global** | `00000000-0000-0000-0000-000000000000` | Fallback default - akses semua toko |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Data toko Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Data toko Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Data toko Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Data toko Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Data toko Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Data toko Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Data toko Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Data toko Zava Retail Online |

#### Implementasi RLS

Ketika pengguna terhubung dengan ID Pengguna RLS toko tertentu, mereka hanya akan melihat:

- Pelanggan yang terkait dengan toko tersebut
- Pesanan yang dilakukan di lokasi toko tersebut
- Data inventaris untuk toko tertentu
- Metrik penjualan dan kinerja khusus toko

Ini memastikan isolasi data antara lokasi toko yang berbeda sambil mempertahankan skema basis data yang terpadu.

## Arsitektur

### Konteks Aplikasi

Server menggunakan konteks aplikasi yang terkelola dengan:

- **Database Connection Pool**: Manajemen koneksi yang efisien untuk mode HTTP
- **Lifecycle Management**: Pembersihan sumber daya yang tepat saat shutdown
- **Type Safety**: Konteks yang diketik kuat dengan dataclass `AppContext`

### Konteks Permintaan

- **Ekstraksi Header**: Parsing header yang aman untuk identifikasi pengguna
- **Integrasi RLS**: Resolusi ID pengguna otomatis dari konteks permintaan
- **Penanganan Kesalahan**: Penanganan kesalahan yang komprehensif dengan pesan yang ramah pengguna

## Integrasi Basis Data

Server terintegrasi dengan basis data PostgreSQL melalui kelas `PostgreSQLSchemaProvider`:

- **Connection Pooling**: Menggunakan pool koneksi async untuk skalabilitas
- **Metadata Skema**: Menyediakan informasi skema tabel yang terperinci
- **Eksekusi Kueri**: Eksekusi kueri yang aman dengan dukungan RLS
- **Manajemen Sumber Daya**: Pembersihan sumber daya basis data secara otomatis

## Penanganan Kesalahan

Server menerapkan penanganan kesalahan yang kuat:

- **Validasi Tabel**: Memastikan hanya nama tabel yang valid yang diakses
- **Validasi Kueri**: Memvalidasi kueri PostgreSQL sebelum eksekusi
- **Manajemen Sumber Daya**: Pembersihan yang tepat bahkan selama kesalahan
- **Pesan Ramah Pengguna**: Pesan kesalahan yang jelas untuk pemecahan masalah

## Pertimbangan Keamanan

1. **Row Level Security**: Semua kueri menghormati kebijakan RLS berdasarkan identitas pengguna
2. **Isolasi Data Toko**: ID Pengguna RLS setiap toko memastikan akses hanya ke data toko tersebut
3. **Validasi Input**: Nama tabel dan kueri divalidasi sebelum eksekusi
4. **Batas Sumber Daya**: Hasil kueri dibatasi untuk mencegah penggunaan sumber daya yang berlebihan
5. **Keamanan Koneksi**: Menggunakan praktik koneksi basis data yang aman
6. **Verifikasi Identitas Pengguna**: Selalu pastikan ID Pengguna RLS yang benar digunakan untuk lokasi toko yang dimaksud

### Catatan Keamanan Penting

- **Jangan pernah menggunakan ID Pengguna RLS produksi di lingkungan pengembangan**
- **Selalu verifikasi ID Pengguna RLS sesuai dengan toko yang dimaksud sebelum menjalankan kueri**
- **UUID default (`00000000-0000-0000-0000-000000000000`) memberikan akses terbatas**
- **Setiap manajer toko hanya boleh memiliki akses ke ID Pengguna RLS toko mereka**

## Pengembangan

### Struktur Proyek

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Komponen Utama

- **FastMCP Server**: Implementasi server MCP modern dengan dukungan async
- **PostgreSQL Provider**: Lapisan abstraksi basis data dengan dukungan RLS
- **Manajemen Konteks**: Penanganan konteks aplikasi dan permintaan yang diketik aman
- **Registrasi Alat**: Registrasi alat deklaratif dengan validasi Pydantic

## Kontribusi

Saat berkontribusi ke server ini:

1. Pastikan semua kueri basis data menghormati Row Level Security
2. Tambahkan penanganan kesalahan yang tepat untuk alat baru
3. Perbarui README ini dengan fitur atau perubahan baru
4. Uji mode server HTTP
5. Validasi parameter input dan berikan pesan kesalahan yang jelas

## [Lisensi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Server MCP ini memungkinkan akses yang aman dan efisien ke data penjualan Zava Retail untuk analisis dan wawasan yang didukung AI.*

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.