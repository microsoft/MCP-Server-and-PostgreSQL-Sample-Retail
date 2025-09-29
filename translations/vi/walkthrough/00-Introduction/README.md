<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a903b684f72790625340375b1a033c6",
  "translation_date": "2025-09-29T22:29:41+00:00",
  "source_file": "walkthrough/00-Introduction/README.md",
  "language_code": "vi"
}
-->
# Giới thiệu về Tích hợp Cơ sở Dữ liệu MCP

## 🎯 Nội dung của Module này

Module giới thiệu này cung cấp một cái nhìn tổng quan toàn diện về việc xây dựng các máy chủ Model Context Protocol (MCP) với tích hợp cơ sở dữ liệu. Bạn sẽ hiểu rõ trường hợp kinh doanh, kiến trúc kỹ thuật, và các ứng dụng thực tế thông qua trường hợp phân tích bán lẻ Zava.

## Tổng quan

**Model Context Protocol (MCP)** cho phép các trợ lý AI truy cập và tương tác an toàn với các nguồn dữ liệu bên ngoài trong thời gian thực. Khi kết hợp với tích hợp cơ sở dữ liệu, MCP mở ra những khả năng mạnh mẽ cho các ứng dụng AI dựa trên dữ liệu.

Lộ trình học này hướng dẫn bạn xây dựng các máy chủ MCP sẵn sàng cho sản xuất, kết nối các trợ lý AI với dữ liệu bán hàng bán lẻ thông qua PostgreSQL, triển khai các mẫu doanh nghiệp như Bảo mật Cấp Dòng (Row Level Security), tìm kiếm ngữ nghĩa, và truy cập dữ liệu đa người dùng.

## Mục tiêu học tập

Kết thúc module này, bạn sẽ có thể:

- **Định nghĩa** Model Context Protocol và các lợi ích cốt lõi của nó đối với tích hợp cơ sở dữ liệu
- **Xác định** các thành phần chính của kiến trúc máy chủ MCP với cơ sở dữ liệu
- **Hiểu** trường hợp sử dụng Zava Retail và các yêu cầu kinh doanh của nó
- **Nhận biết** các mẫu doanh nghiệp để truy cập cơ sở dữ liệu an toàn và mở rộng
- **Liệt kê** các công cụ và công nghệ được sử dụng trong lộ trình học này

## 🧭 Thách thức: AI và Dữ liệu Thực tế

### Hạn chế của AI truyền thống

Các trợ lý AI hiện đại rất mạnh mẽ nhưng gặp phải những hạn chế đáng kể khi làm việc với dữ liệu kinh doanh thực tế:

| **Thách thức** | **Mô tả** | **Tác động Kinh doanh** |
|----------------|-----------|-------------------------|
| **Kiến thức Tĩnh** | Các mô hình AI được huấn luyện trên các tập dữ liệu cố định không thể truy cập dữ liệu kinh doanh hiện tại | Thông tin lỗi thời, cơ hội bị bỏ lỡ |
| **Kho Dữ liệu** | Thông tin bị khóa trong cơ sở dữ liệu, API, và hệ thống mà AI không thể truy cập | Phân tích không đầy đủ, quy trình bị phân mảnh |
| **Ràng buộc Bảo mật** | Truy cập trực tiếp vào cơ sở dữ liệu gây ra lo ngại về bảo mật và tuân thủ | Triển khai hạn chế, chuẩn bị dữ liệu thủ công |
| **Truy vấn Phức tạp** | Người dùng kinh doanh cần kiến thức kỹ thuật để trích xuất thông tin từ dữ liệu | Giảm mức độ chấp nhận, quy trình không hiệu quả |

### Giải pháp MCP

Model Context Protocol giải quyết những thách thức này bằng cách cung cấp:

- **Truy cập Dữ liệu Thời gian Thực**: Trợ lý AI truy vấn cơ sở dữ liệu và API trực tiếp
- **Tích hợp An toàn**: Truy cập được kiểm soát với xác thực và quyền hạn
- **Giao diện Ngôn ngữ Tự nhiên**: Người dùng kinh doanh đặt câu hỏi bằng tiếng Anh đơn giản
- **Giao thức Chuẩn hóa**: Hoạt động trên các nền tảng và công cụ AI khác nhau

## 🏪 Gặp gỡ Zava Retail: Nghiên cứu Tình huống Học tập

Trong suốt lộ trình học này, chúng ta sẽ xây dựng một máy chủ MCP cho **Zava Retail**, một chuỗi bán lẻ DIY hư cấu với nhiều địa điểm cửa hàng. Kịch bản thực tế này minh họa việc triển khai MCP cấp doanh nghiệp.

### Bối cảnh Kinh doanh

**Zava Retail** vận hành:
- **8 cửa hàng vật lý** tại bang Washington (Seattle, Bellevue, Tacoma, Spokane, Everett, Redmond, Kirkland)
- **1 cửa hàng trực tuyến** cho bán hàng thương mại điện tử
- **Danh mục sản phẩm đa dạng** bao gồm dụng cụ, phần cứng, vật liệu làm vườn, và vật liệu xây dựng
- **Quản lý nhiều cấp** với quản lý cửa hàng, quản lý khu vực, và giám đốc điều hành

### Yêu cầu Kinh doanh

Các quản lý cửa hàng và giám đốc điều hành cần phân tích AI để:

1. **Phân tích hiệu suất bán hàng** qua các cửa hàng và thời gian
2. **Theo dõi mức tồn kho** và xác định nhu cầu bổ sung hàng
3. **Hiểu hành vi khách hàng** và xu hướng mua sắm
4. **Khám phá thông tin sản phẩm** thông qua tìm kiếm ngữ nghĩa
5. **Tạo báo cáo** bằng các truy vấn ngôn ngữ tự nhiên
6. **Duy trì bảo mật dữ liệu** với kiểm soát truy cập dựa trên vai trò

### Yêu cầu Kỹ thuật

Máy chủ MCP phải cung cấp:

- **Truy cập dữ liệu đa người dùng** nơi quản lý cửa hàng chỉ thấy dữ liệu của cửa hàng mình
- **Truy vấn linh hoạt** hỗ trợ các thao tác SQL phức tạp
- **Tìm kiếm ngữ nghĩa** để khám phá sản phẩm và gợi ý
- **Dữ liệu thời gian thực** phản ánh trạng thái kinh doanh hiện tại
- **Xác thực an toàn** với bảo mật cấp dòng
- **Kiến trúc mở rộng** hỗ trợ nhiều người dùng đồng thời

## 🏗️ Tổng quan Kiến trúc Máy chủ MCP

Máy chủ MCP của chúng ta triển khai một kiến trúc phân lớp được tối ưu hóa cho tích hợp cơ sở dữ liệu:

```
┌─────────────────────────────────────────────────────────────┐
│                    VS Code AI Client                       │
│                  (Natural Language Queries)                │
└─────────────────────┬───────────────────────────────────────┘
                      │ HTTP/SSE
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                     MCP Server                             │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │   Tool Layer    │ │  Security Layer │ │  Config Layer │ │
│  │                 │ │                 │ │               │ │
│  │ • Query Tools   │ │ • RLS Context   │ │ • Environment │ │
│  │ • Schema Tools  │ │ • User Identity │ │ • Connections │ │
│  │ • Search Tools  │ │ • Access Control│ │ • Validation  │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ asyncpg
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                PostgreSQL Database                         │
│  ┌─────────────────┐ ┌─────────────────┐ ┌───────────────┐ │
│  │  Retail Schema  │ │   RLS Policies  │ │   pgvector    │ │
│  │                 │ │                 │ │               │ │
│  │ • Stores        │ │ • Store-based   │ │ • Embeddings  │ │
│  │ • Customers     │ │   Isolation     │ │ • Similarity  │ │
│  │ • Products      │ │ • Role Control  │ │   Search      │ │
│  │ • Orders        │ │ • Audit Logs    │ │               │ │
│  └─────────────────┘ └─────────────────┘ └───────────────┘ │
└─────────────────────┬───────────────────────────────────────┘
                      │ REST API
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                  Azure OpenAI                              │
│               (Text Embeddings)                            │
└─────────────────────────────────────────────────────────────┘
```

### Các Thành phần Chính

#### **1. Lớp Máy chủ MCP**
- **FastMCP Framework**: Triển khai máy chủ MCP hiện đại bằng Python
- **Đăng ký Công cụ**: Định nghĩa công cụ khai báo với độ an toàn kiểu dữ liệu
- **Ngữ cảnh Yêu cầu**: Quản lý danh tính người dùng và phiên làm việc
- **Xử lý Lỗi**: Quản lý lỗi mạnh mẽ và ghi nhật ký

#### **2. Lớp Tích hợp Cơ sở Dữ liệu**
- **Quản lý Kết nối**: Quản lý kết nối asyncpg hiệu quả
- **Nhà cung cấp Schema**: Khám phá schema bảng động
- **Trình thực thi Truy vấn**: Thực thi SQL an toàn với ngữ cảnh RLS
- **Quản lý Giao dịch**: Tuân thủ ACID và xử lý rollback

#### **3. Lớp Bảo mật**
- **Bảo mật Cấp Dòng**: PostgreSQL RLS để cô lập dữ liệu đa người dùng
- **Danh tính Người dùng**: Xác thực và ủy quyền quản lý cửa hàng
- **Kiểm soát Truy cập**: Quyền hạn chi tiết và nhật ký kiểm tra
- **Xác thực Đầu vào**: Ngăn chặn SQL injection và xác thực truy vấn

#### **4. Lớp Tăng cường AI**
- **Tìm kiếm Ngữ nghĩa**: Vector embeddings để khám phá sản phẩm
- **Tích hợp Azure OpenAI**: Tạo embedding văn bản
- **Thuật toán Tương tự**: Tìm kiếm tương tự cosine pgvector
- **Tối ưu hóa Tìm kiếm**: Lập chỉ mục và điều chỉnh hiệu suất

## 🔧 Công nghệ Sử dụng

### Công nghệ Cốt lõi

| **Thành phần** | **Công nghệ** | **Mục đích** |
|----------------|---------------|--------------|
| **Framework MCP** | FastMCP (Python) | Triển khai máy chủ MCP hiện đại |
| **Cơ sở Dữ liệu** | PostgreSQL 17 + pgvector | Dữ liệu quan hệ với tìm kiếm vector |
| **Dịch vụ AI** | Azure OpenAI | Embedding văn bản và mô hình ngôn ngữ |
| **Container hóa** | Docker + Docker Compose | Môi trường phát triển |
| **Nền tảng Đám mây** | Microsoft Azure | Triển khai sản xuất |
| **Tích hợp IDE** | VS Code | Chat AI và quy trình phát triển |

### Công cụ Phát triển

| **Công cụ** | **Mục đích** |
|-------------|--------------|
| **asyncpg** | Driver PostgreSQL hiệu suất cao |
| **Pydantic** | Xác thực và tuần tự hóa dữ liệu |
| **Azure SDK** | Tích hợp dịch vụ đám mây |
| **pytest** | Framework kiểm thử |
| **Docker** | Container hóa và triển khai |

### Ngăn xếp Sản xuất

| **Dịch vụ** | **Tài nguyên Azure** | **Mục đích** |
|-------------|-----------------------|--------------|
| **Cơ sở Dữ liệu** | Azure Database for PostgreSQL | Dịch vụ cơ sở dữ liệu được quản lý |
| **Container** | Azure Container Apps | Lưu trữ container không máy chủ |
| **Dịch vụ AI** | Azure AI Foundry | Mô hình OpenAI và điểm cuối |
| **Giám sát** | Application Insights | Quan sát và chẩn đoán |
| **Bảo mật** | Azure Key Vault | Quản lý bí mật và cấu hình |

## 🎬 Các Kịch bản Sử dụng Thực tế

Hãy khám phá cách các người dùng khác nhau tương tác với máy chủ MCP của chúng ta:

### Kịch bản 1: Đánh giá Hiệu suất Quản lý Cửa hàng

**Người dùng**: Sarah, Quản lý Cửa hàng Seattle  
**Mục tiêu**: Phân tích hiệu suất bán hàng quý trước

**Truy vấn Ngôn ngữ Tự nhiên**:
> "Hiển thị 10 sản phẩm hàng đầu theo doanh thu cho cửa hàng của tôi trong Q4 2024"

**Điều gì xảy ra**:
1. VS Code AI Chat gửi truy vấn đến máy chủ MCP
2. Máy chủ MCP xác định ngữ cảnh cửa hàng của Sarah (Seattle)
3. Chính sách RLS lọc dữ liệu chỉ cho cửa hàng Seattle
4. Truy vấn SQL được tạo và thực thi
5. Kết quả được định dạng và trả về AI Chat
6. AI cung cấp phân tích và thông tin chi tiết

### Kịch bản 2: Khám phá Sản phẩm với Tìm kiếm Ngữ nghĩa

**Người dùng**: Mike, Quản lý Tồn kho  
**Mục tiêu**: Tìm sản phẩm tương tự với yêu cầu của khách hàng

**Truy vấn Ngôn ngữ Tự nhiên**:
> "Chúng tôi bán những sản phẩm nào tương tự với 'kết nối điện chống nước cho sử dụng ngoài trời'?"

**Điều gì xảy ra**:
1. Truy vấn được xử lý bởi công cụ tìm kiếm ngữ nghĩa
2. Azure OpenAI tạo vector embedding
3. pgvector thực hiện tìm kiếm tương tự
4. Các sản phẩm liên quan được xếp hạng theo mức độ phù hợp
5. Kết quả bao gồm chi tiết sản phẩm và tình trạng sẵn có
6. AI gợi ý các lựa chọn thay thế và cơ hội gói sản phẩm

### Kịch bản 3: Phân tích Chéo Cửa hàng

**Người dùng**: Jennifer, Quản lý Khu vực  
**Mục tiêu**: So sánh hiệu suất giữa các cửa hàng

**Truy vấn Ngôn ngữ Tự nhiên**:
> "So sánh doanh số theo danh mục cho tất cả các cửa hàng trong 6 tháng qua"

**Điều gì xảy ra**:
1. Ngữ cảnh RLS được thiết lập cho quyền truy cập của quản lý khu vực
2. Truy vấn phức tạp đa cửa hàng được tạo
3. Dữ liệu được tổng hợp qua các địa điểm cửa hàng
4. Kết quả bao gồm xu hướng và so sánh
5. AI xác định thông tin chi tiết và gợi ý

## 🔒 Phân tích Sâu về Bảo mật và Đa Người dùng

Triển khai của chúng ta ưu tiên bảo mật cấp doanh nghiệp:

### Bảo mật Cấp Dòng (RLS)

PostgreSQL RLS đảm bảo cô lập dữ liệu:

```sql
-- Store managers see only their store's data
CREATE POLICY store_manager_policy ON retail.orders
  FOR ALL TO store_managers
  USING (store_id = get_current_user_store());

-- Regional managers see multiple stores
CREATE POLICY regional_manager_policy ON retail.orders
  FOR ALL TO regional_managers
  USING (store_id = ANY(get_user_store_list()));
```

### Quản lý Danh tính Người dùng

Mỗi kết nối MCP bao gồm:
- **ID Quản lý Cửa hàng**: Định danh duy nhất cho ngữ cảnh RLS
- **Phân công Vai trò**: Quyền hạn và mức độ truy cập
- **Quản lý Phiên**: Token xác thực an toàn
- **Ghi nhật ký Kiểm tra**: Lịch sử truy cập đầy đủ

### Bảo vệ Dữ liệu

Nhiều lớp bảo mật:
- **Mã hóa Kết nối**: TLS cho tất cả kết nối cơ sở dữ liệu
- **Ngăn chặn SQL Injection**: Chỉ sử dụng truy vấn có tham số
- **Xác thực Đầu vào**: Xác thực yêu cầu toàn diện
- **Xử lý Lỗi**: Không có dữ liệu nhạy cảm trong thông báo lỗi

## 🎯 Những Điểm Chính

Sau khi hoàn thành phần giới thiệu này, bạn sẽ hiểu:

✅ **Giá trị của MCP**: Cách MCP kết nối trợ lý AI và dữ liệu thực tế  
✅ **Bối cảnh Kinh doanh**: Các yêu cầu và thách thức của Zava Retail  
✅ **Tổng quan Kiến trúc**: Các thành phần chính và cách chúng tương tác  
✅ **Ngăn xếp Công nghệ**: Các công cụ và framework được sử dụng  
✅ **Mô hình Bảo mật**: Truy cập dữ liệu đa người dùng và bảo vệ  
✅ **Mẫu Sử dụng**: Các kịch bản truy vấn thực tế và quy trình làm việc  

## 🚀 Tiếp theo

Sẵn sàng đi sâu hơn? Tiếp tục với:

**[Module 01: Các Khái niệm Kiến trúc Cốt lõi](../01-Architecture/README.md)**

Tìm hiểu về các mẫu kiến trúc máy chủ MCP, nguyên tắc thiết kế cơ sở dữ liệu, và triển khai kỹ thuật chi tiết hỗ trợ giải pháp phân tích bán lẻ của chúng ta.

## 📚 Tài liệu Tham khảo

### Tài liệu MCP
- [MCP Specification](https://modelcontextprotocol.io/docs/) - Tài liệu chính thức về giao thức
- [MCP for Beginners](https://aka.ms/mcp-for-beginners) - Hướng dẫn học MCP toàn diện
- [FastMCP Documentation](https://github.com/modelcontextprotocol/python-sdk) - Tài liệu SDK Python

### Tích hợp Cơ sở Dữ liệu
- [PostgreSQL Documentation](https://www.postgresql.org/docs/) - Tài liệu tham khảo PostgreSQL đầy đủ
- [pgvector Guide](https://github.com/pgvector/pgvector) - Tài liệu hướng dẫn mở rộng vector
- [Row Level Security](https://www.postgresql.org/docs/current/ddl-rowsecurity.html) - Hướng dẫn RLS PostgreSQL

### Dịch vụ Azure
- [Azure OpenAI Documentation](https://docs.microsoft.com/azure/cognitive-services/openai/) - Tích hợp dịch vụ AI
- [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/) - Dịch vụ cơ sở dữ liệu được quản lý
- [Azure Container Apps](https://docs.microsoft.com/azure/container-apps/) - Container không máy chủ

---

**Lưu ý**: Đây là một bài tập học tập sử dụng dữ liệu bán lẻ hư cấu. Luôn tuân thủ các chính sách quản trị và bảo mật dữ liệu của tổ chức bạn khi triển khai các giải pháp tương tự trong môi trường sản xuất.

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.