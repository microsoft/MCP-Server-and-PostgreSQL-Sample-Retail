<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T22:17:39+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "vi"
}
-->
# 🚀 Máy chủ MCP với PostgreSQL - Hướng dẫn học tập hoàn chỉnh

## 🧠 Tổng quan về lộ trình học tích hợp cơ sở dữ liệu MCP

Hướng dẫn học tập toàn diện này sẽ dạy bạn cách xây dựng các **máy chủ Model Context Protocol (MCP)** sẵn sàng cho sản xuất, tích hợp với cơ sở dữ liệu thông qua một ví dụ thực tế về phân tích bán lẻ. Bạn sẽ học các mẫu thiết kế cấp doanh nghiệp bao gồm **Bảo mật cấp hàng (RLS)**, **tìm kiếm ngữ nghĩa**, **tích hợp Azure AI**, và **truy cập dữ liệu đa người thuê**.

Dù bạn là nhà phát triển backend, kỹ sư AI, hay kiến trúc sư dữ liệu, hướng dẫn này cung cấp lộ trình học tập có cấu trúc với các ví dụ thực tế và bài tập thực hành.

## 🔗 Tài nguyên chính thức của MCP

- 📘 [Tài liệu MCP](https://modelcontextprotocol.io/) – Hướng dẫn chi tiết và tài liệu người dùng
- 📜 [Đặc tả MCP](https://modelcontextprotocol.io/docs/) – Kiến trúc giao thức và tài liệu tham khảo kỹ thuật
- 🧑‍💻 [Kho GitHub MCP](https://github.com/modelcontextprotocol) – SDK mã nguồn mở, công cụ và mẫu mã
- 🌐 [Cộng đồng MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Tham gia thảo luận và đóng góp cho cộng đồng
- 📚 [MCP cho người mới bắt đầu](https://aka.ms/mcp-for-beginners) – Bắt đầu từ đây nếu bạn mới làm quen với MCP

## 🧭 Lộ trình học tích hợp cơ sở dữ liệu MCP

### 📚 Cấu trúc học tập hoàn chỉnh

| Module | Chủ đề | Mô tả | Liên kết |
|--------|--------|-------|----------|
| **Module 1-3: Nền tảng** | | | |
| 00 | [Giới thiệu về tích hợp cơ sở dữ liệu MCP](./00-Introduction/README.md) | Tổng quan về MCP với tích hợp cơ sở dữ liệu và trường hợp sử dụng phân tích bán lẻ | [Bắt đầu tại đây](./00-Introduction/README.md) |
| 01 | [Các khái niệm kiến trúc cốt lõi](./01-Architecture/README.md) | Hiểu kiến trúc máy chủ MCP, các lớp cơ sở dữ liệu và mẫu bảo mật | [Tìm hiểu](./01-Architecture/README.md) |
| 02 | [Bảo mật và đa người thuê](./02-Security/README.md) | Bảo mật cấp hàng, xác thực và truy cập dữ liệu đa người thuê | [Tìm hiểu](./02-Security/README.md) |
| 03 | [Thiết lập môi trường](./03-Setup/README.md) | Thiết lập môi trường phát triển, Docker, tài nguyên Azure | [Thiết lập](./03-Setup/README.md) |
| **Module 4-6: Xây dựng máy chủ MCP** | | | |
| 04 | [Thiết kế cơ sở dữ liệu và lược đồ](./04-Database/README.md) | Cài đặt PostgreSQL, thiết kế lược đồ bán lẻ và dữ liệu mẫu | [Xây dựng](./04-Database/README.md) |
| 05 | [Triển khai máy chủ MCP](./05-MCP-Server/README.md) | Xây dựng máy chủ FastMCP với tích hợp cơ sở dữ liệu | [Xây dựng](./05-MCP-Server/README.md) |
| 06 | [Phát triển công cụ](./06-Tools/README.md) | Tạo công cụ truy vấn cơ sở dữ liệu và kiểm tra lược đồ | [Xây dựng](./06-Tools/README.md) |
| **Module 7-9: Các tính năng nâng cao** | | | |
| 07 | [Tích hợp tìm kiếm ngữ nghĩa](./07-Semantic-Search/README.md) | Triển khai vector embeddings với Azure OpenAI và pgvector | [Nâng cao](./07-Semantic-Search/README.md) |
| 08 | [Kiểm thử và gỡ lỗi](./08-Testing/README.md) | Chiến lược kiểm thử, công cụ gỡ lỗi và phương pháp xác thực | [Kiểm thử](./08-Testing/README.md) |
| 09 | [Tích hợp VS Code](./09-VS-Code/README.md) | Cấu hình tích hợp MCP trong VS Code và sử dụng AI Chat | [Tích hợp](./09-VS-Code/README.md) |
| **Module 10-12: Triển khai và thực hành tốt nhất** | | | |
| 10 | [Chiến lược triển khai](./10-Deployment/README.md) | Triển khai Docker, Azure Container Apps và các cân nhắc về mở rộng | [Triển khai](./10-Deployment/README.md) |
| 11 | [Giám sát và quan sát](./11-Monitoring/README.md) | Application Insights, ghi nhật ký, giám sát hiệu suất | [Giám sát](./11-Monitoring/README.md) |
| 12 | [Thực hành tốt nhất và tối ưu hóa](./12-Best-Practices/README.md) | Tối ưu hóa hiệu suất, tăng cường bảo mật và mẹo sản xuất | [Tối ưu hóa](./12-Best-Practices/README.md) |

### 💻 Những gì bạn sẽ xây dựng

Khi hoàn thành lộ trình học này, bạn sẽ xây dựng được một **máy chủ Zava Retail Analytics MCP** hoàn chỉnh với các tính năng:

- **Cơ sở dữ liệu bán lẻ đa bảng** với đơn hàng khách hàng, sản phẩm và hàng tồn kho
- **Bảo mật cấp hàng** để cô lập dữ liệu theo cửa hàng
- **Tìm kiếm sản phẩm ngữ nghĩa** sử dụng Azure OpenAI embeddings
- **Tích hợp AI Chat trong VS Code** để truy vấn ngôn ngữ tự nhiên
- **Triển khai sẵn sàng sản xuất** với Docker và Azure
- **Giám sát toàn diện** với Application Insights

## 🎯 Yêu cầu trước khi học

Để tận dụng tối đa lộ trình học này, bạn nên có:

- **Kinh nghiệm lập trình**: Quen thuộc với Python (ưu tiên) hoặc các ngôn ngữ tương tự
- **Kiến thức cơ sở dữ liệu**: Hiểu biết cơ bản về SQL và cơ sở dữ liệu quan hệ
- **Khái niệm API**: Hiểu về REST APIs và các khái niệm HTTP
- **Công cụ phát triển**: Có kinh nghiệm với dòng lệnh, Git và trình soạn thảo mã
- **Kiến thức cơ bản về đám mây**: (Tùy chọn) Hiểu biết cơ bản về Azure hoặc các nền tảng đám mây tương tự
- **Hiểu biết về Docker**: (Tùy chọn) Hiểu các khái niệm về container hóa

### Công cụ cần thiết

- **Docker Desktop** - Để chạy PostgreSQL và máy chủ MCP
- **Azure CLI** - Để triển khai tài nguyên đám mây
- **VS Code** - Để phát triển và tích hợp MCP
- **Git** - Để kiểm soát phiên bản
- **Python 3.8+** - Để phát triển máy chủ MCP

## 📚 Hướng dẫn học tập & tài nguyên

Lộ trình học này bao gồm các tài nguyên toàn diện để giúp bạn học tập hiệu quả:

### Hướng dẫn học tập

Mỗi module bao gồm:
- **Mục tiêu học tập rõ ràng** - Những gì bạn sẽ đạt được
- **Hướng dẫn từng bước** - Hướng dẫn triển khai chi tiết
- **Ví dụ mã** - Các mẫu mã hoạt động kèm giải thích
- **Bài tập** - Cơ hội thực hành thực tế
- **Hướng dẫn khắc phục sự cố** - Các vấn đề thường gặp và giải pháp
- **Tài nguyên bổ sung** - Đọc thêm và khám phá

### Kiểm tra yêu cầu trước

Trước khi bắt đầu mỗi module, bạn sẽ thấy:
- **Kiến thức cần thiết** - Những gì bạn nên biết trước
- **Xác thực thiết lập** - Cách kiểm tra môi trường của bạn
- **Ước tính thời gian** - Thời gian hoàn thành dự kiến
- **Kết quả học tập** - Những gì bạn sẽ biết sau khi hoàn thành

### Lộ trình học tập được đề xuất

Chọn lộ trình dựa trên mức độ kinh nghiệm của bạn:

#### 🟢 **Lộ trình cho người mới bắt đầu** (Mới làm quen với MCP)
1. Bắt đầu với [MCP cho người mới bắt đầu](https://aka.ms/mcp-for-beginners)
2. Hoàn thành các module 00-03 để hiểu nền tảng
3. Theo dõi các module 04-06 để thực hành xây dựng
4. Thử các module 07-09 để sử dụng thực tế

#### 🟡 **Lộ trình trung cấp** (Có một số kinh nghiệm với MCP)
1. Xem lại các module 00-01 để nắm các khái niệm về cơ sở dữ liệu
2. Tập trung vào các module 02-06 để triển khai
3. Đi sâu vào các module 07-12 để học các tính năng nâng cao

#### 🔴 **Lộ trình nâng cao** (Đã có kinh nghiệm với MCP)
1. Lướt qua các module 00-03 để nắm bối cảnh
2. Tập trung vào các module 04-09 để tích hợp cơ sở dữ liệu
3. Chú trọng các module 10-12 để triển khai sản xuất

## 🛠️ Cách sử dụng lộ trình học này hiệu quả

### Học tuần tự (Khuyến nghị)

Học qua các module theo thứ tự để hiểu toàn diện:

1. **Đọc tổng quan** - Hiểu những gì bạn sẽ học
2. **Kiểm tra yêu cầu trước** - Đảm bảo bạn có kiến thức cần thiết
3. **Làm theo hướng dẫn từng bước** - Triển khai khi bạn học
4. **Hoàn thành bài tập** - Củng cố hiểu biết của bạn
5. **Xem lại các điểm chính** - Củng cố kết quả học tập

### Học tập trung

Nếu bạn cần kỹ năng cụ thể:

- **Tích hợp cơ sở dữ liệu**: Tập trung vào các module 04-06
- **Triển khai bảo mật**: Tập trung vào các module 02, 08, 12
- **AI/Tìm kiếm ngữ nghĩa**: Đi sâu vào module 07
- **Triển khai sản xuất**: Nghiên cứu các module 10-12

### Thực hành thực tế

Mỗi module bao gồm:
- **Ví dụ mã hoạt động** - Sao chép, chỉnh sửa và thử nghiệm
- **Kịch bản thực tế** - Các trường hợp sử dụng phân tích bán lẻ thực tế
- **Độ phức tạp tăng dần** - Xây dựng từ cơ bản đến nâng cao
- **Bước xác thực** - Kiểm tra xem triển khai của bạn có hoạt động không

## 🌟 Cộng đồng và hỗ trợ

### Nhận trợ giúp

- **Azure AI Discord**: [Tham gia để nhận hỗ trợ từ chuyên gia](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Báo cáo vấn đề hoặc đặt câu hỏi](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Cộng đồng MCP**: [Tham gia thảo luận MCP rộng hơn](https://github.com/orgs/modelcontextprotocol/discussions)

### Đóng góp

Chúng tôi hoan nghênh các đóng góp để cải thiện lộ trình học này:
- **Sửa lỗi hoặc lỗi chính tả** - Gửi pull request
- **Thêm ví dụ** - Chia sẻ triển khai của bạn
- **Cải thiện tài liệu** - Giúp người khác học tập
- **Báo cáo vấn đề** - Giúp chúng tôi khắc phục sự cố

## 📜 Thông tin giấy phép

Nội dung học tập này được cấp phép theo Giấy phép MIT. Xem tệp [LICENSE](../../../LICENSE) để biết các điều khoản và điều kiện.

## 🚀 Sẵn sàng bắt đầu?

Bắt đầu hành trình của bạn với **[Module 00: Giới thiệu về tích hợp cơ sở dữ liệu MCP](./00-Introduction/README.md)**

---

*Làm chủ việc xây dựng các máy chủ MCP sẵn sàng sản xuất với tích hợp cơ sở dữ liệu thông qua trải nghiệm học tập thực hành toàn diện này.*

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.