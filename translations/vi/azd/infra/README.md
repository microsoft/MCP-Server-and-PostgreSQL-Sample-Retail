<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:29:43+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "vi"
}
-->
# Mẫu Hạ Tầng

Thư mục này chứa các mẫu triển khai hạ tầng cho dự án MCP Retail Analytics.

## 📁 Tổng Quan Tệp

| Tệp | Mô Tả | Trường Hợp Sử Dụng |
|------|-------------|----------|
| `azuredeploy.json` | **Mẫu ARM** - Triển khai toàn bộ phạm vi đăng ký | Khuyến nghị cho tất cả các triển khai |
| `azuredeploy.parameters.json` | **Tham số ARM** - Giá trị cấu hình tĩnh | Sử dụng với `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Hướng dẫn triển khai ARM** - Hướng dẫn chi tiết | Tài liệu triển khai đầy đủ |
| `README.md` | **Tệp này** - Tổng quan hạ tầng | Tham khảo nhanh |

## 🚀 Các Tùy Chọn Triển Khai

### Tùy Chọn 1: Azure CLI (Khuyến nghị)
Triển khai hoàn chỉnh với việc tạo nhóm tài nguyên:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Tùy Chọn 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Tùy Chọn 3: Azure Portal
1. Truy cập [Azure Portal](https://portal.azure.com)
2. Tìm kiếm "Deploy a custom template"
3. Tải lên `azuredeploy.json`
4. Cấu hình tham số và triển khai

## 🏗️ Các Thành Phần Hạ Tầng

Mẫu ARM triển khai các thành phần hạ tầng sau:

- **Nhóm Tài Nguyên**: Bộ chứa cho tất cả tài nguyên với tên gọi nhất quán
- **Log Analytics Workspace**: Trung tâm ghi nhật ký và giám sát (lưu trữ 30 ngày)
- **Application Insights**: Giám sát hiệu suất ứng dụng tích hợp với Log Analytics
- **Azure AI Services**: Trung tâm AI đa dịch vụ (tier S0) với danh tính được quản lý
- **Mô Hình OpenAI**:
  - `gpt-4o-mini` (120 dung lượng) - Mô hình trò chuyện và hoàn thành
  - `text-embedding-3-small` (50 dung lượng) - Nhúng văn bản cho tìm kiếm ngữ nghĩa

## 🔧 Cấu Hình Mẫu

### Tham Số
Mẫu ARM chấp nhận các tham số tùy chỉnh sau:

| Tham Số | Mặc Định | Mô Tả |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Tiền tố cho tất cả tên tài nguyên |
| `location` | `westus2` | Vùng Azure để triển khai |
| `uniqueSuffix` | Tự động tạo | Định danh duy nhất gồm 4 ký tự |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Tên hiển thị |
| `gptModelCapacity` | `120` | Dung lượng token của mô hình GPT |
| `embeddingModelCapacity` | `50` | Dung lượng token của mô hình nhúng |

### Quy Ước Đặt Tên Tài Nguyên
Tất cả tài nguyên tuân theo mẫu: `{type}-{resourcePrefix}-{uniqueSuffix}`

Ví dụ:
- Nhóm Tài Nguyên: `rg-mcpretail-demo`
- Dịch Vụ AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Xác Thực Mẫu

### Xác Thực Trước Khi Triển Khai
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Kiểm Tra Trạng Thái Triển Khai
```bash
az deployment sub list --output table
```

## 💰 Ước Tính Chi Phí

Ước tính chi phí hàng tháng cho khối lượng công việc phát triển:

| Dịch Vụ | Cấu Hình | Ước Tính Chi Phí/Tháng |
|---------|---------------|-----------------|
| Azure AI Services | Tier S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K token | $15-30 |
| OpenAI Embeddings | 50K token | $5-15 |
| Application Insights | Giám sát cơ bản | $5-15 |
| Log Analytics | 1GB/tháng | $2-5 |
| **Tổng** | | **$42-115** |

## 📚 Tài Nguyên Bổ Sung

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Hướng dẫn triển khai chi tiết với cách khắc phục sự cố
- [Tài Liệu Mẫu ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Tài Liệu Dịch Vụ Azure AI](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Kết quả xác thực tệp

## 🆘 Khắc Phục Sự Cố Nhanh

### Các Vấn Đề Thường Gặp
- **Xác Thực**: Chạy `az login` để xác thực
- **Giới Hạn Hạn Ngạch**: Kiểm tra tính khả dụng của mô hình OpenAI trong vùng mục tiêu
- **Xung Đột Tên**: Sử dụng tham số `uniqueSuffix` khác
- **Quyền Hạn**: Đảm bảo tài khoản có vai trò Contributor trên đăng ký

### Nhận Hỗ Trợ
- Xem [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) để khắc phục sự cố chi tiết
- Kiểm tra nhật ký triển khai trong Azure Portal
- Truy cập [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Để thiết lập dự án đầy đủ, xem [README chính](../../README.md) hoặc [hướng dẫn dự án](../../walkthrough/README.md).

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.