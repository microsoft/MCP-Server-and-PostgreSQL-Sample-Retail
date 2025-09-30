<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:25:03+00:00",
  "source_file": "azd/README.md",
  "language_code": "vi"
}
-->
# Azure Developer CLI (azd) Bắt Đầu Nhanh

## 🚀 Triển khai với Azure Developer CLI

Dự án này hiện đã hoàn toàn tương thích với Azure Developer CLI (azd) để triển khai tự động cả hạ tầng và ứng dụng máy chủ MCP.

### Yêu cầu trước

1. **Cài đặt Azure Developer CLI**:
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

2. **Đăng nhập vào Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Triển khai chỉ với một lệnh

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

### 🔧 Quy trình phát triển

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

### 📦 Những gì được triển khai

#### **Hạ tầng**
- Nhóm tài nguyên
- Không gian làm việc Log Analytics  
- Application Insights
- Dịch vụ AI của Azure (với các mô hình OpenAI)
- Môi trường ứng dụng Container

#### **Ứng dụng**
- Máy chủ MCP (Ứng dụng Container)
- Giám sát sức khỏe được kích hoạt
- Biến môi trường được cấu hình
- Tích hợp Application Insights

### 🌍 Biến môi trường

Sau khi triển khai, các biến này sẽ tự động khả dụng:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Giám sát & Quản lý

- **Azure Portal**: Xem tất cả tài nguyên trong nhóm tài nguyên của bạn
- **Application Insights**: Giám sát hiệu suất và nhật ký ứng dụng
- **Container Apps**: Xem nhật ký và số liệu ứng dụng
- **AI Studio**: Quản lý triển khai mô hình OpenAI

### 📋 Xử lý sự cố

#### **Các vấn đề thường gặp**

1. **Vị trí không được hỗ trợ**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Vượt quá hạn mức tài nguyên**:
   - Kiểm tra giới hạn đăng ký của bạn trong Azure Portal
   - Thử một khu vực khác

3. **Vấn đề xác thực**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Xem nhật ký triển khai**:
   ```bash
   azd show --output json
   ```

### 🔄 Lựa chọn khác: Triển khai thủ công

Nếu bạn muốn triển khai thủ công, bạn vẫn có thể sử dụng hạ tầng trong thư mục `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Tìm hiểu thêm

- [Tài liệu Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Tài liệu Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Tài liệu Dịch vụ AI của Azure](https://docs.microsoft.com/azure/ai-services/)

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.