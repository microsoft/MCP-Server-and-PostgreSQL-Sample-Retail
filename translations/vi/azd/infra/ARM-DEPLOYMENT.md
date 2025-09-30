<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:13:16+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "vi"
}
-->
# Hướng dẫn triển khai ARM Template

Tài liệu này cung cấp hướng dẫn triển khai hạ tầng MCP Retail Analytics bằng ARM template.

## 📋 Tổng quan

ARM template `azuredeploy.json` cung cấp một triển khai hoàn chỉnh bao gồm:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 Các tùy chọn triển khai

### Tùy chọn 1: Triển khai bằng Azure CLI

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

### Tùy chọn 2: Triển khai bằng PowerShell

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

### Tùy chọn 3: Azure Portal

1. Truy cập [Azure Portal](https://portal.azure.com)
2. Tìm kiếm "Deploy a custom template"
3. Nhấp vào "Build your own template in the editor"
4. Sao chép và dán nội dung của `azuredeploy.json`
5. Nhấp vào "Save" sau đó "Review + create"
6. Điền các tham số cần thiết và triển khai

## 🔧 Các tham số của template

| Tham số | Loại | Mặc định | Mô tả |
|---------|------|----------|-------|
| `resourcePrefix` | string | `mcpretail` | Tiền tố cho tên tài nguyên |
| `location` | string | `westus2` | Vùng Azure để triển khai |
| `uniqueSuffix` | string | Tự động tạo | Định danh duy nhất gồm 4 ký tự |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Tên hiển thị cho dự án AI |
| `aiProjectDescription` | string | Mô tả dự án | Mô tả hiển thị trong Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Dung lượng token cho mô hình GPT |
| `embeddingModelCapacity` | int | `50` | Dung lượng token cho mô hình embedding |
| `tags` | object | Thẻ mặc định | Thẻ tài nguyên để quản lý |

## 📤 Kết quả của template

Template cung cấp các kết quả sau:

| Kết quả | Mô tả |
|---------|-------|
| `subscriptionId` | ID đăng ký Azure |
| `resourceGroupName` | Tên nhóm tài nguyên đã tạo |
| `aiFoundryName` | Tên dịch vụ Azure AI Foundry |
| `foundryEndpoint` | URL endpoint của dịch vụ AI |
| `foundryAccountKey` | Khóa truy cập dịch vụ AI |
| `deployedModels` | Mảng các mô hình OpenAI đã triển khai |
| `applicationInsightsConnectionString` | Chuỗi kết nối Application Insights |
| `logAnalyticsWorkspaceName` | Tên workspace Log Analytics |

## 🔍 Lệnh xác minh

Sau khi triển khai, xác minh tài nguyên:

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

Dự án này cung cấp cả template ARM và Bicep:

### ARM Template (`azuredeploy.json`)
- ✅ Định dạng gốc của Azure Resource Manager
- ✅ Hoạt động ở mọi nơi ARM được hỗ trợ
- ✅ Không cần công cụ bổ sung
- ❌ Cú pháp JSON dài dòng hơn
- ❌ Khó đọc và duy trì

### Bicep Template (`main.bicep`)
- ✅ Cú pháp hiện đại, dễ hiểu
- ✅ Công cụ hỗ trợ tốt hơn và IntelliSense
- ✅ Dễ đọc và duy trì hơn
- ✅ Xác thực tại thời điểm biên dịch
- ❌ Yêu cầu Bicep CLI
- ❌ Bước xây dựng bổ sung

**Khuyến nghị**: Sử dụng template Bicep (`main.bicep`) cho phát triển và template ARM (`azuredeploy.json`) cho các trường hợp yêu cầu JSON ARM thuần túy.

## 🔧 Tùy chỉnh

### Thêm tài nguyên tùy chỉnh

Để thêm tài nguyên mới vào ARM template:

1. Thêm định nghĩa tài nguyên vào mảng `resources` của template lồng ghép
2. Thêm các tham số mới vào phần `parameters`
3. Thêm các kết quả tương ứng nếu cần
4. Cập nhật file tham số với giá trị mặc định

### Ví dụ: Thêm Storage Account

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

## 🐛 Xử lý sự cố

### Các vấn đề thường gặp

#### 1. Lỗi xác thực template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Xung đột tên tài nguyên
- Đảm bảo `uniqueSuffix` thực sự là duy nhất
- Sử dụng hàm `uniqueString()` để tự động tạo
- Kiểm tra các tài nguyên hiện có trong vùng mục tiêu

#### 3. Giới hạn quota
- Xác minh tính khả dụng của mô hình OpenAI trong vùng mục tiêu
- Kiểm tra quota đăng ký cho các dịch vụ AI
- Cân nhắc sử dụng các vùng khác nếu đạt giới hạn

#### 4. Vấn đề quyền hạn
- Đảm bảo tài khoản có vai trò Contributor trên đăng ký
- Kiểm tra đăng ký đã được kích hoạt cho các dịch vụ AI
- Xác minh đăng ký nhà cung cấp tài nguyên

### Lệnh gỡ lỗi

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

## 🔐 Các lưu ý về bảo mật

### Kiểm soát truy cập
- Dịch vụ AI sử dụng managed identity để truy cập an toàn
- Nhóm tài nguyên cung cấp ranh giới cho RBAC
- Application Insights có các kiểm soát truy cập riêng biệt

### Bảo mật mạng
- Truy cập mạng công cộng được bật mặc định
- Cân nhắc sử dụng private endpoints cho môi trường sản xuất
- ACL mạng có thể được cấu hình để tăng cường bảo mật

### Quản lý khóa
- Khóa dịch vụ AI được tự động tạo
- Sử dụng Azure Key Vault cho các bí mật trong môi trường sản xuất
- Thường xuyên xoay vòng khóa để đảm bảo an toàn

## 📚 Các bước tiếp theo

Sau khi triển khai thành công:

1. **Cấu hình biến môi trường**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Khởi động MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Kiểm tra tích hợp**:
   - Mở VS Code với dự án
   - Cấu hình các máy chủ MCP trong `.vscode/mcp.json`
   - Kiểm tra AI Chat với các truy vấn dữ liệu bán lẻ

4. **Giám sát hiệu suất**:
   - Xem các chỉ số trong Application Insights
   - Kiểm tra nhật ký trong Log Analytics workspace
   - Thiết lập cảnh báo cho các sự kiện quan trọng

---

Để biết thêm thông tin, xem [README chính](../README.md) hoặc [hướng dẫn QUICKSTART](../QUICKSTART.md).

---

**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với các thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.