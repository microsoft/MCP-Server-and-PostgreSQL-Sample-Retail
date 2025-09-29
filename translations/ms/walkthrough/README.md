<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T22:46:18+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "ms"
}
-->
# 🚀 Pelayan MCP dengan PostgreSQL - Panduan Pembelajaran Lengkap

## 🧠 Gambaran Keseluruhan Laluan Pembelajaran Integrasi Pangkalan Data MCP

Panduan pembelajaran yang komprehensif ini mengajar anda cara membina **pelayan Model Context Protocol (MCP)** yang bersedia untuk pengeluaran dengan integrasi pangkalan data melalui pelaksanaan analitik runcit yang praktikal. Anda akan mempelajari corak peringkat perusahaan termasuk **Row Level Security (RLS)**, **carian semantik**, **integrasi Azure AI**, dan **akses data multi-penyewa**.

Sama ada anda seorang pembangun backend, jurutera AI, atau arkitek data, panduan ini menyediakan pembelajaran yang terstruktur dengan contoh dunia sebenar dan latihan praktikal.

## 🔗 Sumber Rasmi MCP

- 📘 [Dokumentasi MCP](https://modelcontextprotocol.io/) – Tutorial terperinci dan panduan pengguna
- 📜 [Spesifikasi MCP](https://modelcontextprotocol.io/docs/) – Rujukan teknikal dan seni bina protokol
- 🧑‍💻 [Repositori GitHub MCP](https://github.com/modelcontextprotocol) – SDK sumber terbuka, alat, dan contoh kod
- 🌐 [Komuniti MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Sertai perbincangan dan sumbang kepada komuniti
- 📚 [MCP untuk Pemula](https://aka.ms/mcp-for-beginners) – Mulakan di sini jika anda baru dengan MCP

## 🧭 Laluan Pembelajaran Integrasi Pangkalan Data MCP

### 📚 Struktur Pembelajaran Lengkap

| Modul | Topik | Penerangan | Pautan |
|-------|-------|------------|--------|
| **Modul 1-3: Asas** | | | |
| 00 | [Pengenalan kepada Integrasi Pangkalan Data MCP](./00-Introduction/README.md) | Gambaran keseluruhan MCP dengan integrasi pangkalan data dan kes penggunaan analitik runcit | [Mulakan Di Sini](./00-Introduction/README.md) |
| 01 | [Konsep Seni Bina Teras](./01-Architecture/README.md) | Memahami seni bina pelayan MCP, lapisan pangkalan data, dan corak keselamatan | [Belajar](./01-Architecture/README.md) |
| 02 | [Keselamatan dan Multi-Penyewa](./02-Security/README.md) | Row Level Security, pengesahan, dan akses data multi-penyewa | [Belajar](./02-Security/README.md) |
| 03 | [Persediaan Persekitaran](./03-Setup/README.md) | Menyediakan persekitaran pembangunan, Docker, sumber Azure | [Persediaan](./03-Setup/README.md) |
| **Modul 4-6: Membina Pelayan MCP** | | | |
| 04 | [Reka Bentuk Pangkalan Data dan Skema](./04-Database/README.md) | Persediaan PostgreSQL, reka bentuk skema runcit, dan data sampel | [Bina](./04-Database/README.md) |
| 05 | [Pelaksanaan Pelayan MCP](./05-MCP-Server/README.md) | Membina pelayan FastMCP dengan integrasi pangkalan data | [Bina](./05-MCP-Server/README.md) |
| 06 | [Pembangunan Alat](./06-Tools/README.md) | Mencipta alat pertanyaan pangkalan data dan introspeksi skema | [Bina](./06-Tools/README.md) |
| **Modul 7-9: Ciri Lanjutan** | | | |
| 07 | [Integrasi Carian Semantik](./07-Semantic-Search/README.md) | Melaksanakan embedding vektor dengan Azure OpenAI dan pgvector | [Lanjutkan](./07-Semantic-Search/README.md) |
| 08 | [Pengujian dan Penyahpepijatan](./08-Testing/README.md) | Strategi pengujian, alat penyahpepijatan, dan pendekatan pengesahan | [Uji](./08-Testing/README.md) |
| 09 | [Integrasi VS Code](./09-VS-Code/README.md) | Mengkonfigurasi integrasi MCP VS Code dan penggunaan AI Chat | [Integrasi](./09-VS-Code/README.md) |
| **Modul 10-12: Pengeluaran dan Amalan Terbaik** | | | |
| 10 | [Strategi Penghantaran](./10-Deployment/README.md) | Penghantaran Docker, Azure Container Apps, dan pertimbangan penskalaan | [Hantar](./10-Deployment/README.md) |
| 11 | [Pemantauan dan Pemerhatian](./11-Monitoring/README.md) | Application Insights, logging, pemantauan prestasi | [Pantau](./11-Monitoring/README.md) |
| 12 | [Amalan Terbaik dan Pengoptimuman](./12-Best-Practices/README.md) | Pengoptimuman prestasi, pengukuhan keselamatan, dan tip pengeluaran | [Optimumkan](./12-Best-Practices/README.md) |

### 💻 Apa yang Akan Anda Bina

Pada akhir laluan pembelajaran ini, anda akan membina **Pelayan MCP Analitik Runcit Zava** yang lengkap dengan ciri-ciri berikut:

- **Pangkalan data runcit multi-jadual** dengan pesanan pelanggan, produk, dan inventori
- **Row Level Security** untuk pengasingan data berdasarkan kedai
- **Carian produk semantik** menggunakan embedding Azure OpenAI
- **Integrasi AI Chat VS Code** untuk pertanyaan bahasa semula jadi
- **Penghantaran bersedia untuk pengeluaran** dengan Docker dan Azure
- **Pemantauan komprehensif** dengan Application Insights

## 🎯 Prasyarat untuk Pembelajaran

Untuk mendapatkan manfaat maksimum daripada laluan pembelajaran ini, anda seharusnya mempunyai:

- **Pengalaman Pengaturcaraan**: Kefahaman tentang Python (disyorkan) atau bahasa serupa
- **Pengetahuan Pangkalan Data**: Pemahaman asas tentang SQL dan pangkalan data relasi
- **Konsep API**: Pemahaman tentang REST API dan konsep HTTP
- **Alat Pembangunan**: Pengalaman dengan command line, Git, dan editor kod
- **Asas Awan**: (Pilihan) Pengetahuan asas tentang Azure atau platform awan serupa
- **Familiariti Docker**: (Pilihan) Pemahaman tentang konsep kontainerisasi

### Alat yang Diperlukan

- **Docker Desktop** - Untuk menjalankan PostgreSQL dan pelayan MCP
- **Azure CLI** - Untuk penghantaran sumber awan
- **VS Code** - Untuk pembangunan dan integrasi MCP
- **Git** - Untuk kawalan versi
- **Python 3.8+** - Untuk pembangunan pelayan MCP

## 📚 Panduan Pembelajaran & Sumber

Laluan pembelajaran ini termasuk sumber komprehensif untuk membantu anda menavigasi dengan berkesan:

### Panduan Pembelajaran

Setiap modul termasuk:
- **Objektif pembelajaran yang jelas** - Apa yang akan anda capai
- **Arahan langkah demi langkah** - Panduan pelaksanaan terperinci
- **Contoh kod** - Sampel kerja dengan penjelasan
- **Latihan** - Peluang latihan praktikal
- **Panduan penyelesaian masalah** - Isu biasa dan penyelesaian
- **Sumber tambahan** - Bacaan dan penerokaan lanjut

### Semakan Prasyarat

Sebelum memulakan setiap modul, anda akan menemui:
- **Pengetahuan yang diperlukan** - Apa yang perlu anda tahu sebelumnya
- **Pengesahan persediaan** - Cara mengesahkan persekitaran anda
- **Anggaran masa** - Jangka masa penyelesaian yang dijangka
- **Hasil pembelajaran** - Apa yang akan anda tahu selepas selesai

### Laluan Pembelajaran yang Disyorkan

Pilih laluan anda berdasarkan tahap pengalaman anda:

#### 🟢 **Laluan Pemula** (Baru dengan MCP)
1. Mulakan dengan [MCP untuk Pemula](https://aka.ms/mcp-for-beginners) terlebih dahulu
2. Lengkapkan modul 00-03 untuk memahami asas
3. Ikuti modul 04-06 untuk pembinaan praktikal
4. Cuba modul 07-09 untuk penggunaan praktikal

#### 🟡 **Laluan Pertengahan** (Ada Pengalaman MCP)
1. Semak modul 00-01 untuk konsep khusus pangkalan data
2. Fokus pada modul 02-06 untuk pelaksanaan
3. Selami modul 07-12 untuk ciri lanjutan

#### 🔴 **Laluan Lanjutan** (Berpengalaman dengan MCP)
1. Imbas modul 00-03 untuk konteks
2. Fokus pada modul 04-09 untuk integrasi pangkalan data
3. Tumpukan pada modul 10-12 untuk penghantaran pengeluaran

## 🛠️ Cara Menggunakan Laluan Pembelajaran Ini dengan Berkesan

### Pembelajaran Berurutan (Disyorkan)

Ikuti modul secara berurutan untuk pemahaman yang menyeluruh:

1. **Baca gambaran keseluruhan** - Fahami apa yang akan anda pelajari
2. **Semak prasyarat** - Pastikan anda mempunyai pengetahuan yang diperlukan
3. **Ikuti panduan langkah demi langkah** - Laksanakan sambil belajar
4. **Lengkapkan latihan** - Kukuhkan pemahaman anda
5. **Semak perkara utama** - Mantapkan hasil pembelajaran

### Pembelajaran Tertumpu

Jika anda memerlukan kemahiran tertentu:

- **Integrasi Pangkalan Data**: Fokus pada modul 04-06
- **Pelaksanaan Keselamatan**: Tumpukan pada modul 02, 08, 12
- **AI/Carian Semantik**: Selami modul 07
- **Penghantaran Pengeluaran**: Kajian modul 10-12

### Latihan Praktikal

Setiap modul termasuk:
- **Contoh kod kerja** - Salin, ubah suai, dan eksperimen
- **Senario dunia sebenar** - Kes penggunaan analitik runcit praktikal
- **Kerumitan progresif** - Membina dari asas kepada lanjutan
- **Langkah pengesahan** - Sahkan pelaksanaan anda berfungsi

## 🌟 Komuniti dan Sokongan

### Dapatkan Bantuan

- **Discord Azure AI**: [Sertai untuk sokongan pakar](https://discord.com/invite/ByRwuEEgH4)
- **Isu GitHub**: [Laporkan masalah atau ajukan soalan](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Komuniti MCP**: [Sertai perbincangan MCP yang lebih luas](https://github.com/orgs/modelcontextprotocol/discussions)

### Sumbangan

Kami mengalu-alukan sumbangan untuk meningkatkan laluan pembelajaran ini:
- **Betulkan pepijat atau kesilapan** - Hantar pull request
- **Tambah contoh** - Kongsi pelaksanaan anda
- **Perbaiki dokumentasi** - Bantu orang lain belajar
- **Laporkan isu** - Bantu kami menyelesaikan masalah

## 📜 Maklumat Lesen

Kandungan pembelajaran ini dilesenkan di bawah Lesen MIT. Lihat fail [LICENSE](../../../LICENSE) untuk terma dan syarat.

## 🚀 Sedia untuk Bermula?

Mulakan perjalanan anda dengan **[Modul 00: Pengenalan kepada Integrasi Pangkalan Data MCP](./00-Introduction/README.md)**

---

*Kuasi pembinaan pelayan MCP bersedia untuk pengeluaran dengan integrasi pangkalan data melalui pengalaman pembelajaran yang komprehensif dan praktikal ini.*

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.