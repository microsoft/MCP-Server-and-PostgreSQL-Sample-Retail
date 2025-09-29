<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T22:12:43+00:00",
  "source_file": "README.md",
  "language_code": "vi"
}
-->
# MCP Server và Ví dụ PostgreSQL - Phân Tích Doanh Số Bán Lẻ

## Học MCP với Tích Hợp Cơ Sở Dữ Liệu qua Các Ví Dụ Thực Hành

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Tham gia Discord Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Làm theo các bước sau để bắt đầu sử dụng tài nguyên này:

1. **Fork Repository**: Nhấn [vào đây để fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Tham gia Discord Azure AI Foundry**: [Gặp gỡ chuyên gia và các nhà phát triển khác](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Hỗ Trợ Đa Ngôn Ngữ

#### Được hỗ trợ qua GitHub Action (Tự động & Luôn cập nhật)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](./README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Nếu bạn muốn hỗ trợ thêm các ngôn ngữ khác, danh sách ngôn ngữ được hỗ trợ có tại [đây](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Giới Thiệu

Ví dụ này minh họa cách xây dựng và triển khai một **máy chủ Model Context Protocol (MCP)** toàn diện, cung cấp cho các trợ lý AI quyền truy cập an toàn và thông minh vào dữ liệu doanh số bán lẻ thông qua PostgreSQL. Dự án này trình bày các tính năng cấp doanh nghiệp bao gồm **Row Level Security (RLS)**, **khả năng tìm kiếm ngữ nghĩa**, và **tích hợp Azure AI** cho các tình huống phân tích bán lẻ thực tế.

**Các trường hợp sử dụng chính:**
- **Phân tích doanh số bán hàng dựa trên AI**: Cho phép trợ lý AI truy vấn và phân tích dữ liệu bán lẻ thông qua ngôn ngữ tự nhiên
- **Truy cập an toàn đa người dùng**: Minh họa việc triển khai Row Level Security, nơi các quản lý cửa hàng chỉ có thể truy cập dữ liệu của cửa hàng mình
- **Tìm kiếm sản phẩm ngữ nghĩa**: Trình bày khả năng khám phá sản phẩm được cải tiến bằng AI sử dụng các embedding văn bản
- **Tích hợp doanh nghiệp**: Minh họa cách tích hợp máy chủ MCP với các dịch vụ Azure và cơ sở dữ liệu PostgreSQL

**Hoàn hảo cho:**
- Các nhà phát triển học cách xây dựng máy chủ MCP với tích hợp cơ sở dữ liệu
- Kỹ sư dữ liệu triển khai các giải pháp phân tích an toàn đa người dùng
- Nhà phát triển ứng dụng AI làm việc với dữ liệu bán lẻ hoặc thương mại điện tử
- Bất kỳ ai quan tâm đến việc kết hợp trợ lý AI với cơ sở dữ liệu doanh nghiệp

## Tham gia Cộng Đồng Discord Azure AI Foundry
Chia sẻ kinh nghiệm về MCP và gặp gỡ các chuyên gia cùng nhóm sản phẩm

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Máy Chủ MCP Phân Tích Doanh Số

Một máy chủ Model Context Protocol (MCP) cung cấp quyền truy cập toàn diện vào cơ sở dữ liệu doanh số khách hàng cho doanh nghiệp Zava Retail DIY. Máy chủ này cho phép các trợ lý AI truy vấn và phân tích dữ liệu bán lẻ thông qua giao diện an toàn và nhận thức về schema.

## 📚 Hướng Dẫn Triển Khai Hoàn Chỉnh

Để có cái nhìn chi tiết về cách xây dựng giải pháp này và cách triển khai các máy chủ MCP tương tự, hãy xem hướng dẫn **[Sample Walkthrough](Sample_Walkthrough.md)**. Hướng dẫn này cung cấp:

- **Phân Tích Kiến Trúc**: Phân tích thành phần và mẫu thiết kế
- **Xây Dựng Từng Bước**: Từ thiết lập dự án đến triển khai
- **Phân Tích Mã**: Giải thích chi tiết về triển khai máy chủ MCP
- **Các Tính Năng Nâng Cao**: Row Level Security, tìm kiếm ngữ nghĩa, và giám sát
- **Thực Hành Tốt Nhất**: Hướng dẫn về bảo mật, hiệu suất, và phát triển
- **Khắc Phục Sự Cố**: Các vấn đề thường gặp và giải pháp

Hoàn hảo cho các nhà phát triển muốn hiểu chi tiết triển khai và xây dựng các giải pháp tương tự.

## 🤖 MCP (Model Context Protocol) là gì?

**Model Context Protocol (MCP)** là một tiêu chuẩn mở cho phép các trợ lý AI truy cập an toàn vào các nguồn dữ liệu và công cụ bên ngoài trong thời gian thực. Hãy nghĩ về nó như một cầu nối cho phép các mô hình AI kết nối với cơ sở dữ liệu, API, hệ thống tệp, và các tài nguyên khác trong khi vẫn duy trì bảo mật và kiểm soát.

### Lợi Ích Chính:
- **Truy Cập Dữ Liệu Thời Gian Thực**: Các trợ lý AI có thể truy vấn cơ sở dữ liệu và API trực tiếp
- **Tích Hợp An Toàn**: Truy cập được kiểm soát với xác thực và quyền hạn  
- **Mở Rộng Công Cụ**: Thêm các khả năng tùy chỉnh cho trợ lý AI
- **Tiêu Chuẩn Hóa**: Hoạt động trên các nền tảng và công cụ AI khác nhau

### Mới với MCP?

Nếu bạn mới làm quen với Model Context Protocol, chúng tôi khuyến nghị bắt đầu với tài nguyên dành cho người mới của Microsoft:

**📖 [Hướng Dẫn MCP cho Người Mới](https://aka.ms/mcp-for-beginners)**

Tài nguyên này cung cấp:
- Giới thiệu về các khái niệm và kiến trúc MCP
- Hướng dẫn từng bước để xây dựng máy chủ MCP đầu tiên của bạn
- Thực hành tốt nhất cho phát triển MCP
- Ví dụ tích hợp với các nền tảng AI phổ biến
- Tài nguyên cộng đồng và hỗ trợ

Sau khi hiểu các khái niệm cơ bản, quay lại đây để khám phá triển khai phân tích bán lẻ nâng cao này!

## 📚 Hướng Dẫn Học Toàn Diện: /walkthrough

Repository này bao gồm một **hướng dẫn học 12 module** hoàn chỉnh, phân tích mẫu máy chủ MCP bán lẻ này thành các bài học từng bước dễ hiểu. Hướng dẫn này biến ví dụ hoạt động này thành một tài nguyên giáo dục toàn diện, hoàn hảo cho các nhà phát triển muốn hiểu cách xây dựng máy chủ MCP sẵn sàng sản xuất với tích hợp cơ sở dữ liệu.

### Những Gì Bạn Sẽ Học

Hướng dẫn này bao gồm mọi thứ từ các khái niệm MCP cơ bản đến triển khai sản xuất nâng cao, bao gồm:

- **Nguyên Tắc MCP**: Hiểu Model Context Protocol và các ứng dụng thực tế của nó
- **Tích Hợp Cơ Sở Dữ Liệu**: Triển khai kết nối PostgreSQL an toàn với Row Level Security
- **Tính Năng Nâng Cao AI**: Thêm khả năng tìm kiếm ngữ nghĩa với embedding Azure OpenAI
- **Triển Khai Bảo Mật**: Xác thực, ủy quyền, và cô lập dữ liệu cấp doanh nghiệp
- **Phát Triển Công Cụ**: Xây dựng các công cụ MCP tinh vi cho phân tích dữ liệu và thông tin kinh doanh
- **Kiểm Tra & Gỡ Lỗi**: Chiến lược kiểm tra toàn diện và kỹ thuật gỡ lỗi
- **Tích Hợp VS Code**: Cấu hình AI Chat để truy vấn cơ sở dữ liệu bằng ngôn ngữ tự nhiên
- **Triển Khai Sản Xuất**: Container hóa, mở rộng, và chiến lược triển khai trên đám mây
- **Giám Sát & Quan Sát**: Application Insights, ghi nhật ký, và giám sát hiệu suất

### Tổng Quan Lộ Trình Học

Hướng dẫn này theo cấu trúc học tiến bộ được thiết kế cho các nhà phát triển ở mọi cấp độ kỹ năng:

| Module | Khu Vực Tập Trung | Mô Tả | Ước Tính Thời Gian |
|--------|-------------------|-------|--------------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Nền Tảng | Khái niệm MCP, nghiên cứu trường hợp Zava Retail, tổng quan kiến trúc | 30 phút |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Mẫu Thiết Kế | Kiến trúc kỹ thuật, thiết kế phân lớp, các thành phần hệ thống | 45 phút |
| **[02-Security](walkthrough/02-Security/README.md)** | Bảo Mật Doanh Nghiệp | Xác thực Azure, Row Level Security, cô lập đa người dùng | 60 phút |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Môi Trường | Thiết lập Docker, Azure CLI, cấu hình dự án, xác thực | 45 phút |
| **[04-Database](walkthrough/04-Database/README.md)** | Lớp Dữ Liệu | Schema PostgreSQL, pgvector, chính sách RLS, dữ liệu mẫu | 60 phút |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Triển Khai Cốt Lõi | Framework FastMCP, tích hợp cơ sở dữ liệu, quản lý kết nối | 90 phút |
| **[06-Tools](walkthrough/06-Tools/README.md)** | Phát Triển Công Cụ | Tạo công cụ MCP, xác thực truy vấn, tính năng thông tin kinh doanh | 75 phút |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | Tích Hợp AI | Embedding Azure OpenAI, tìm kiếm vector, chiến lược tìm kiếm kết hợp | 60 phút |
| **[08-Testing](walkthrough/08-Testing/README.md)** | Đảm Bảo Chất Lượng | Kiểm tra đơn vị, kiểm tra tích hợp, kiểm tra hiệu suất, gỡ lỗi | 75 phút |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Trải Nghiệm Phát Triển | Cấu hình VS Code, tích hợp AI Chat, quy trình gỡ lỗi | 45 phút |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | Sẵn Sàng Sản Xuất | Container hóa, Azure Container Apps, CI/CD pipelines, mở rộng | 90 phút |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | Quan Sát | Application Insights, ghi nhật ký có cấu trúc, chỉ số hiệu suất | 60 phút |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Xuất Sắc Trong Sản Xuất | Tăng cường bảo mật, tối ưu hóa hiệu suất, mẫu doanh nghiệp | 45 phút |

**Tổng Thời Gian Học**: ~12-15 giờ học thực hành toàn diện

### 🎯 Cách Sử Dụng Hướng Dẫn

**Dành Cho Người Mới**:
1. Bắt đầu với [Module 00: Introduction](walkthrough/00-Introduction/README.md) để hiểu các nguyên tắc MCP
2. Làm theo các module theo thứ tự để có trải nghiệm học tập hoàn chỉnh
3. Mỗi module xây dựng dựa trên các khái niệm trước đó và bao gồm các bài tập thực hành

**Dành Cho Nhà Phát Triển Có Kinh Nghiệm**:
1. Xem [Tổng Quan Hướng Dẫn Chính](walkthrough/README.md) để có tóm tắt module đầy đủ
2. Chuyển đến các module cụ thể mà bạn quan tâm (ví dụ: Module 07 về tích hợp AI)
3. Sử dụng các module riêng lẻ làm tài liệu tham khảo cho dự án của bạn

**Dành Cho Triển Khai Sản Xuất**:
1. Tập trung vào Module 02 (Bảo Mật), 10 (Triển Khai), và 11 (Quan Sát)
2. Xem lại Module 12 (Thực Hành Tốt Nhất) để có hướng dẫn doanh nghiệp
3. Sử dụng các ví dụ mã làm mẫu sẵn sàng sản xuất

### 🚀 Tùy Chọn Bắt Đầu Nhanh

**Tùy Chọn 1: Lộ Trình Học Hoàn Chỉnh** (Khuyến nghị cho người mới)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Tùy Chọn 2: Triển Khai Thực Hành** (Bắt đầu ngay vào xây dựng)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Tùy Chọn 3: Tập Trung Sản Xuất** (Triển khai doanh nghiệp)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Yêu cầu trước khi học

**Kiến thức nền tảng khuyến nghị**:
- Kinh nghiệm lập trình Python cơ bản
- Hiểu biết về REST APIs và cơ sở dữ liệu
- Kiến thức tổng quan về AI/ML
- Kiến thức cơ bản về dòng lệnh và Docker

**Không bắt buộc (nhưng hữu ích)**:
- Kinh nghiệm MCP trước đây (chúng tôi sẽ hướng dẫn từ đầu)
- Kinh nghiệm sử dụng Azure cloud (chúng tôi cung cấp hướng dẫn từng bước)
- Kiến thức PostgreSQL nâng cao (chúng tôi sẽ giải thích khi cần)

### 💡 Mẹo học tập

1. **Học qua thực hành**: Mỗi module đều có ví dụ mã nguồn bạn có thể chạy và chỉnh sửa
2. **Tăng dần độ phức tạp**: Các khái niệm được xây dựng từ đơn giản đến nâng cao
3. **Ngữ cảnh thực tế**: Tất cả các ví dụ đều sử dụng các tình huống kinh doanh bán lẻ thực tế
4. **Sẵn sàng cho sản xuất**: Các ví dụ mã nguồn được thiết kế để sử dụng trong môi trường sản xuất thực tế
5. **Hỗ trợ cộng đồng**: Tham gia cộng đồng [Discord của chúng tôi](https://discord.com/invite/ByRwuEEgH4) để nhận hỗ trợ và thảo luận

### 🔗 Tài nguyên liên quan

- **[MCP cho người mới bắt đầu](https://aka.ms/mcp-for-beginners)**: Tài liệu nền tảng cần thiết
- **[Hướng dẫn mẫu](Sample_Walkthrough.md)**: Tổng quan kỹ thuật cấp cao
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Nền tảng đám mây được sử dụng trong các ví dụ
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework MCP Python

**Sẵn sàng bắt đầu học chưa?** Bắt đầu với **[Module 00: Giới thiệu](walkthrough/00-Introduction/README.md)** hoặc khám phá **[tổng quan hướng dẫn đầy đủ](walkthrough/README.md)**.

## Yêu cầu

1. Đã cài đặt Docker Desktop
2. Đã cài đặt Git
3. **Azure CLI**: Cài đặt và xác thực với Azure CLI
4. Truy cập vào mô hình OpenAI `text-embedding-3-small` và tùy chọn mô hình `gpt-4o-mini`.

## Bắt đầu

Mở cửa sổ terminal và chạy các lệnh sau:

1. Xác thực với Azure CLI

    ```bash
    az login
    ```

2. Clone repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Điều hướng đến thư mục dự án

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Triển khai tài nguyên Azure

Chạy các script sau để tự động triển khai các tài nguyên Azure cần thiết cho máy chủ MCP.

Các script triển khai sẽ tự động triển khai mô hình `text-embedding-3-small`. Trong quá trình triển khai, bạn sẽ có tùy chọn bao gồm cả mô hình `gpt-4o-mini`. Lưu ý rằng `gpt-4o-mini` **không bắt buộc** cho dự án này và chỉ được bao gồm để phục vụ các cải tiến tiềm năng trong tương lai.

**Chọn script phù hợp với nền tảng của bạn:**

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

## Chạy máy chủ MCP

Cách dễ nhất để chạy toàn bộ stack (PostgreSQL + MCP Server) là sử dụng Docker Compose:

### Khởi động stack

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

## Sử dụng

Các bước sau giả định rằng bạn sẽ sử dụng hỗ trợ máy chủ MCP tích hợp trong VS Code.

1. Mở dự án trong VS Code. Từ terminal, chạy:

    ```bash
    code .
    ```

2. Khởi động một hoặc nhiều máy chủ MCP sử dụng các cấu hình trong `.vscode/mcp.json`. File này chứa bốn cấu hình máy chủ khác nhau, mỗi cấu hình đại diện cho một vai trò quản lý cửa hàng khác nhau:

   - Mỗi cấu hình sử dụng một ID người dùng RLS (Row Level Security) duy nhất
   - Các ID người dùng này mô phỏng các danh tính quản lý cửa hàng khác nhau truy cập cơ sở dữ liệu
   - Hệ thống RLS hạn chế quyền truy cập dữ liệu dựa trên cửa hàng được chỉ định cho người quản lý
   - Điều này mô phỏng các tình huống thực tế nơi các quản lý cửa hàng đăng nhập bằng các tài khoản Entra ID khác nhau

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

### Mở AI Chat trong VS Code

1. Mở chế độ AI Chat trong VS Code
2. Gõ **#zava** và chọn một trong các máy chủ MCP bạn đã khởi động
3. Đặt câu hỏi về dữ liệu bán hàng - Xem các truy vấn mẫu bên dưới

### Truy vấn mẫu

1. Hiển thị 20 sản phẩm hàng đầu theo doanh thu bán hàng
1. Hiển thị doanh số theo cửa hàng
1. Doanh số theo danh mục trong quý trước là bao nhiêu?
1. Những sản phẩm nào chúng tôi bán tương tự như "hộp đựng sơn"

## Tính năng

- **Truy cập nhiều bảng**: Truy xuất schema cho nhiều bảng cơ sở dữ liệu trong một yêu cầu
- **Thực thi truy vấn an toàn**: Thực thi truy vấn PostgreSQL với hỗ trợ Row Level Security (RLS)
- **Dữ liệu thời gian thực**: Truy cập dữ liệu bán hàng, tồn kho và khách hàng hiện tại
- **Tiện ích ngày/giờ**: Lấy dấu thời gian UTC hiện tại cho phân tích nhạy cảm thời gian
- **Triển khai linh hoạt**: Hỗ trợ chế độ máy chủ HTTP

## Các bảng được hỗ trợ

Máy chủ cung cấp quyền truy cập vào các bảng cơ sở dữ liệu bán lẻ sau:

- `retail.customers` - Thông tin và hồ sơ khách hàng
- `retail.stores` - Vị trí và chi tiết cửa hàng
- `retail.categories` - Danh mục sản phẩm và hệ thống phân cấp
- `retail.product_types` - Phân loại loại sản phẩm
- `retail.products` - Danh mục sản phẩm và thông số kỹ thuật
- `retail.orders` - Đơn hàng và giao dịch của khách hàng
- `retail.order_items` - Các mặt hàng riêng lẻ trong đơn hàng
- `retail.inventory` - Mức tồn kho hiện tại và dữ liệu hàng hóa

## Công cụ có sẵn

### `get_multiple_table_schemas`

Truy xuất schema cơ sở dữ liệu cho nhiều bảng trong một yêu cầu.

**Tham số:**

- `table_names` (list[str]): Danh sách tên bảng hợp lệ từ các bảng được hỗ trợ ở trên

**Trả về:** Chuỗi schema được nối cho các bảng yêu cầu

### `execute_sales_query`

Thực thi truy vấn PostgreSQL trên cơ sở dữ liệu bán hàng với hỗ trợ Row Level Security.

**Tham số:**

- `postgresql_query` (str): Một truy vấn PostgreSQL được định dạng đúng

**Trả về:** Kết quả truy vấn được định dạng dưới dạng chuỗi (giới hạn 20 hàng để dễ đọc)

**Thực hành tốt nhất:**

- Luôn lấy schema bảng trước
- Sử dụng tên cột chính xác từ schema
- Kết hợp các bảng liên quan để phân tích toàn diện
- Tổng hợp kết quả khi thích hợp
- Giới hạn đầu ra để dễ đọc

### `get_current_utc_date`

Lấy ngày và giờ UTC hiện tại theo định dạng ISO.

**Trả về:** Ngày/giờ UTC hiện tại theo định dạng ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Thực hiện tìm kiếm ngữ nghĩa cho sản phẩm dựa trên truy vấn của người dùng.

**Trả về:** Danh sách sản phẩm phù hợp với tiêu chí tìm kiếm

**Tham số:**

- `query` (str): Chuỗi truy vấn tìm kiếm

**Trả về:** Danh sách sản phẩm phù hợp với tiêu chí tìm kiếm

## Tính năng bảo mật

### Row Level Security (RLS)

Máy chủ triển khai Row Level Security để đảm bảo người dùng chỉ truy cập dữ liệu mà họ được phép xem:

- **Chế độ HTTP**: Sử dụng header `x-rls-user-id` để xác định người dùng yêu cầu

- **Mặc định**: Sử dụng UUID placeholder khi không cung cấp ID người dùng

#### ID người dùng RLS theo cửa hàng

Mỗi địa điểm cửa hàng Zava Retail có một ID người dùng RLS duy nhất xác định dữ liệu mà người dùng có thể truy cập:

| Địa điểm cửa hàng | ID người dùng RLS | Mô tả |
|------------------|-------------------|-------|
| **Truy cập toàn cầu** | `00000000-0000-0000-0000-000000000000` | Mặc định - truy cập tất cả các cửa hàng |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Dữ liệu cửa hàng Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Dữ liệu cửa hàng Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Dữ liệu cửa hàng Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Dữ liệu cửa hàng Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Dữ liệu cửa hàng Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Dữ liệu cửa hàng Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Dữ liệu cửa hàng Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Dữ liệu cửa hàng Zava Retail Online |

#### Triển khai RLS

Khi người dùng kết nối với ID người dùng RLS của một cửa hàng cụ thể, họ chỉ thấy:

- Khách hàng liên quan đến cửa hàng đó
- Đơn hàng được đặt tại địa điểm cửa hàng đó
- Dữ liệu tồn kho cho cửa hàng cụ thể đó
- Các chỉ số bán hàng và hiệu suất riêng của cửa hàng

Điều này đảm bảo sự cô lập dữ liệu giữa các địa điểm cửa hàng khác nhau trong khi vẫn duy trì một schema cơ sở dữ liệu thống nhất.

## Kiến trúc

### Ngữ cảnh ứng dụng

Máy chủ sử dụng ngữ cảnh ứng dụng được quản lý với:

- **Pool kết nối cơ sở dữ liệu**: Quản lý kết nối hiệu quả cho chế độ HTTP
- **Quản lý vòng đời**: Dọn dẹp tài nguyên đúng cách khi tắt máy
- **An toàn kiểu dữ liệu**: Ngữ cảnh được định kiểu mạnh mẽ với dataclass `AppContext`

### Ngữ cảnh yêu cầu

- **Trích xuất header**: Phân tích header an toàn để xác định người dùng
- **Tích hợp RLS**: Tự động giải quyết ID người dùng từ ngữ cảnh yêu cầu
- **Xử lý lỗi**: Xử lý lỗi toàn diện với thông báo thân thiện với người dùng

## Tích hợp cơ sở dữ liệu

Máy chủ tích hợp với cơ sở dữ liệu PostgreSQL thông qua lớp `PostgreSQLSchemaProvider`:

- **Pool kết nối**: Sử dụng pool kết nối async để mở rộng quy mô
- **Metadata schema**: Cung cấp thông tin chi tiết về schema bảng
- **Thực thi truy vấn**: Thực thi truy vấn an toàn với hỗ trợ RLS
- **Quản lý tài nguyên**: Dọn dẹp tài nguyên cơ sở dữ liệu tự động

## Xử lý lỗi

Máy chủ triển khai xử lý lỗi mạnh mẽ:

- **Xác thực bảng**: Đảm bảo chỉ truy cập tên bảng hợp lệ
- **Xác thực truy vấn**: Xác thực truy vấn PostgreSQL trước khi thực thi
- **Quản lý tài nguyên**: Dọn dẹp đúng cách ngay cả khi xảy ra lỗi
- **Thông báo thân thiện**: Thông báo lỗi rõ ràng để khắc phục sự cố

## Cân nhắc bảo mật

1. **Row Level Security**: Tất cả các truy vấn tuân thủ chính sách RLS dựa trên danh tính người dùng
2. **Cô lập dữ liệu cửa hàng**: ID người dùng RLS của mỗi cửa hàng đảm bảo chỉ truy cập dữ liệu của cửa hàng đó
3. **Xác thực đầu vào**: Tên bảng và truy vấn được xác thực trước khi thực thi
4. **Giới hạn tài nguyên**: Kết quả truy vấn được giới hạn để ngăn chặn sử dụng tài nguyên quá mức
5. **Bảo mật kết nối**: Sử dụng các thực hành kết nối cơ sở dữ liệu an toàn
6. **Xác minh danh tính người dùng**: Luôn đảm bảo ID người dùng RLS chính xác được sử dụng cho địa điểm cửa hàng dự định

### Lưu ý bảo mật quan trọng

- **Không bao giờ sử dụng ID người dùng RLS sản xuất trong môi trường phát triển**
- **Luôn xác minh ID người dùng RLS khớp với cửa hàng dự định trước khi chạy truy vấn**
- **UUID mặc định (`00000000-0000-0000-0000-000000000000`) cung cấp quyền truy cập hạn chế**
- **Mỗi quản lý cửa hàng chỉ nên có quyền truy cập vào ID người dùng RLS của cửa hàng mình**

## Phát triển

### Cấu trúc dự án

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Thành phần chính

- **Máy chủ FastMCP**: Triển khai máy chủ MCP hiện đại với hỗ trợ async
- **PostgreSQL Provider**: Lớp trừu tượng cơ sở dữ liệu với hỗ trợ RLS
- **Quản lý ngữ cảnh**: Xử lý ngữ cảnh ứng dụng và yêu cầu an toàn kiểu dữ liệu
- **Đăng ký công cụ**: Đăng ký công cụ khai báo với xác thực Pydantic

## Đóng góp

Khi đóng góp cho máy chủ này:

1. Đảm bảo tất cả các truy vấn cơ sở dữ liệu tuân thủ Row Level Security
2. Thêm xử lý lỗi đúng cách cho các công cụ mới
3. Cập nhật README này với bất kỳ tính năng hoặc thay đổi mới nào
4. Kiểm tra chế độ máy chủ HTTP
5. Xác thực tham số đầu vào và cung cấp thông báo lỗi rõ ràng

## [Giấy phép](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Máy chủ MCP này cho phép truy cập an toàn, hiệu quả vào dữ liệu bán hàng của Zava Retail để phân tích và cung cấp thông tin chi tiết dựa trên AI.*

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.