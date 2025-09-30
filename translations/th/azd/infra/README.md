<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:27:24+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "th"
}
-->
# เทมเพลตโครงสร้างพื้นฐาน

โฟลเดอร์นี้ประกอบด้วยเทมเพลตการปรับใช้โครงสร้างพื้นฐานสำหรับโครงการ MCP Retail Analytics

## 📁 ภาพรวมไฟล์

| ไฟล์ | คำอธิบาย | กรณีการใช้งาน |
|------|-------------|----------|
| `azuredeploy.json` | **ARM template** - การปรับใช้แบบครอบคลุมระดับ subscription | แนะนำสำหรับการปรับใช้ทั้งหมด |
| `azuredeploy.parameters.json` | **ARM parameters** - ค่าการกำหนดค่าคงที่ | ใช้ร่วมกับ `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **คู่มือการปรับใช้ ARM** - คำแนะนำโดยละเอียด | เอกสารการปรับใช้อย่างสมบูรณ์ |
| `README.md` | **ไฟล์นี้** - ภาพรวมโครงสร้างพื้นฐาน | อ้างอิงอย่างรวดเร็ว |

## 🚀 ตัวเลือกการปรับใช้

### ตัวเลือกที่ 1: Azure CLI (แนะนำ)
การปรับใช้อย่างสมบูรณ์พร้อมการสร้าง resource group:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### ตัวเลือกที่ 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### ตัวเลือกที่ 3: Azure Portal
1. ไปที่ [Azure Portal](https://portal.azure.com)
2. ค้นหา "Deploy a custom template"
3. อัปโหลด `azuredeploy.json`
4. กำหนดค่าพารามิเตอร์และปรับใช้

## 🏗️ ส่วนประกอบโครงสร้างพื้นฐาน

ARM template จะปรับใช้โครงสร้างพื้นฐานดังต่อไปนี้:

- **Resource Group**: คอนเทนเนอร์สำหรับทรัพยากรทั้งหมดที่มีการตั้งชื่อที่สอดคล้องกัน
- **Log Analytics Workspace**: การบันทึกและการตรวจสอบแบบรวมศูนย์ (การเก็บรักษา 30 วัน)
- **Application Insights**: การตรวจสอบประสิทธิภาพแอปพลิเคชันที่รวมเข้ากับ Log Analytics
- **Azure AI Services**: ศูนย์รวมบริการ AI หลายบริการ (ระดับ S0) พร้อม managed identity
- **OpenAI Models**:
  - `gpt-4o-mini` (ความจุ 120) - โมเดลแชทและการเติมข้อความ
  - `text-embedding-3-small` (ความจุ 50) - การฝังข้อความสำหรับการค้นหาเชิงความหมาย

## 🔧 การกำหนดค่าเทมเพลต

### พารามิเตอร์
ARM template รองรับพารามิเตอร์ที่ปรับแต่งได้ดังต่อไปนี้:

| พารามิเตอร์ | ค่าเริ่มต้น | คำอธิบาย |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | คำขึ้นต้นสำหรับชื่อทรัพยากรทั้งหมด |
| `location` | `westus2` | ภูมิภาค Azure สำหรับการปรับใช้ |
| `uniqueSuffix` | สร้างอัตโนมัติ | ตัวระบุเฉพาะ 4 ตัวอักษร |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | ชื่อที่แสดง |
| `gptModelCapacity` | `120` | ความจุโทเค็นของโมเดล GPT |
| `embeddingModelCapacity` | `50` | ความจุโทเค็นของโมเดลฝังข้อความ |

### การตั้งชื่อทรัพยากร
ทรัพยากรทั้งหมดจะใช้รูปแบบ: `{type}-{resourcePrefix}-{uniqueSuffix}`

ตัวอย่าง:
- Resource Group: `rg-mcpretail-demo`
- AI Service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 การตรวจสอบเทมเพลต

### ตรวจสอบก่อนการปรับใช้
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### ตรวจสอบสถานะการปรับใช้
```bash
az deployment sub list --output table
```

## 💰 การประมาณค่าใช้จ่าย

ค่าใช้จ่ายรายเดือนโดยประมาณสำหรับการทำงานในสภาพแวดล้อมการพัฒนา:

| บริการ | การกำหนดค่า | ค่าใช้จ่าย/เดือนโดยประมาณ |
|---------|---------------|-----------------|
| Azure AI Services | ระดับ S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K โทเค็น | $15-30 |
| OpenAI Embeddings | 50K โทเค็น | $5-15 |
| Application Insights | การตรวจสอบพื้นฐาน | $5-15 |
| Log Analytics | 1GB/เดือน | $2-5 |
| **รวม** | | **$42-115** |

## 📚 แหล่งข้อมูลเพิ่มเติม

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - คู่มือการปรับใช้อย่างละเอียดพร้อมการแก้ไขปัญหา
- [เอกสาร ARM Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [เอกสาร Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - ผลการตรวจสอบไฟล์

## 🆘 การแก้ไขปัญหาอย่างรวดเร็ว

### ปัญหาที่พบบ่อย
- **การตรวจสอบสิทธิ์**: รัน `az login` เพื่อเข้าสู่ระบบ
- **ข้อจำกัดโควตา**: ตรวจสอบความพร้อมใช้งานของโมเดล OpenAI ในภูมิภาคเป้าหมาย
- **ความขัดแย้งในการตั้งชื่อ**: ใช้พารามิเตอร์ `uniqueSuffix` ที่แตกต่างกัน
- **สิทธิ์**: ตรวจสอบให้แน่ใจว่าบัญชีมีบทบาท Contributor ใน subscription

### ขอความช่วยเหลือ
- ดู [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) สำหรับการแก้ไขปัญหาโดยละเอียด
- ตรวจสอบบันทึกการปรับใช้ใน Azure Portal
- เยี่ยมชม [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

สำหรับการตั้งค่าโครงการอย่างสมบูรณ์ ดู [README หลัก](../../README.md) หรือ [การแนะนำโครงการ](../../walkthrough/README.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้