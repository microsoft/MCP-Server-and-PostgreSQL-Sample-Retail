<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:23:45+00:00",
  "source_file": "azd/README.md",
  "language_code": "th"
}
-->
# Azure Developer CLI (azd) Quick Start

## 🚀 การปรับใช้ด้วย Azure Developer CLI

โปรเจกต์นี้สามารถใช้งานร่วมกับ Azure Developer CLI (azd) ได้อย่างสมบูรณ์ เพื่อการปรับใช้งานโครงสร้างพื้นฐานและแอปพลิเคชัน MCP server แบบอัตโนมัติ

### ข้อกำหนดเบื้องต้น

1. **ติดตั้ง Azure Developer CLI**:
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

2. **เข้าสู่ระบบ Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 การปรับใช้ด้วยคำสั่งเดียว

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

### 🔧 เวิร์กโฟลว์การพัฒนา

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

### 📦 สิ่งที่ถูกปรับใช้

#### **โครงสร้างพื้นฐาน**
- Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (พร้อมโมเดล OpenAI)
- Container App Environment

#### **แอปพลิเคชัน**
- MCP Server (Container App)
- เปิดใช้งานการตรวจสอบสถานะ
- กำหนดค่า Environment variables
- การผสานรวมกับ Application Insights

### 🌍 Environment Variables

หลังการปรับใช้ ตัวแปรเหล่านี้จะถูกตั้งค่าโดยอัตโนมัติ:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 การตรวจสอบและการจัดการ

- **Azure Portal**: ดูทรัพยากรทั้งหมดใน Resource Group ของคุณ
- **Application Insights**: ตรวจสอบประสิทธิภาพและบันทึกของแอปพลิเคชัน
- **Container Apps**: ดูบันทึกและเมตริกของแอปพลิเคชัน
- **AI Studio**: จัดการการปรับใช้โมเดล OpenAI

### 📋 การแก้ไขปัญหา

#### **ปัญหาที่พบบ่อย**

1. **ตำแหน่งที่ตั้งไม่รองรับ**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **เกินโควต้าทรัพยากร**:
   - ตรวจสอบขีดจำกัดการสมัครใช้งานใน Azure Portal
   - ลองใช้ภูมิภาคอื่น

3. **ปัญหาการตรวจสอบสิทธิ์**:
   ```bash
   azd auth login --use-device-code
   ```

4. **ดูบันทึกการปรับใช้**:
   ```bash
   azd show --output json
   ```

### 🔄 ทางเลือก: การปรับใช้แบบแมนนวล

หากคุณต้องการปรับใช้แบบแมนนวล คุณยังสามารถใช้โครงสร้างพื้นฐานในโฟลเดอร์ `/infra` ได้:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 เรียนรู้เพิ่มเติม

- [เอกสาร Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [เอกสาร Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [เอกสาร Azure AI Services](https://docs.microsoft.com/azure/ai-services/)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้