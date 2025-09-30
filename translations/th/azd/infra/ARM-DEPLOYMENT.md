<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:10:45+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "th"
}
-->
# คำแนะนำการปรับใช้ ARM Template

เอกสารนี้ให้คำแนะนำสำหรับการปรับใช้โครงสร้างพื้นฐาน MCP Retail Analytics โดยใช้ ARM template

## 📋 ภาพรวม

ARM template `azuredeploy.json` ให้การปรับใช้อย่างครบถ้วนของ:
- Azure Resource Group
- Log Analytics Workspace  
- Application Insights
- Azure AI Services (Foundry)
- OpenAI Model Deployments (GPT-4o-mini, text-embedding-3-small)

## 🚀 ตัวเลือกการปรับใช้

### ตัวเลือกที่ 1: การปรับใช้ด้วย Azure CLI

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

### ตัวเลือกที่ 2: การปรับใช้ด้วย PowerShell

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

### ตัวเลือกที่ 3: Azure Portal

1. ไปที่ [Azure Portal](https://portal.azure.com)
2. ค้นหา "Deploy a custom template"
3. คลิก "Build your own template in the editor"
4. คัดลอกและวางเนื้อหาของ `azuredeploy.json`
5. คลิก "Save" แล้ว "Review + create"
6. กรอกพารามิเตอร์ที่จำเป็นและปรับใช้

## 🔧 พารามิเตอร์ของ Template

| พารามิเตอร์ | ประเภท | ค่าเริ่มต้น | คำอธิบาย |
|--------------|--------|-------------|-----------|
| `resourcePrefix` | string | `mcpretail` | คำขึ้นต้นสำหรับชื่อทรัพยากร |
| `location` | string | `westus2` | ภูมิภาค Azure สำหรับการปรับใช้ |
| `uniqueSuffix` | string | สร้างอัตโนมัติ | ตัวระบุที่ไม่ซ้ำกัน 4 ตัวอักษร |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | ชื่อที่แสดงสำหรับโครงการ AI |
| `aiProjectDescription` | string | คำอธิบายโครงการ | คำอธิบายที่แสดงใน Azure AI Foundry |
| `gptModelCapacity` | int | `120` | ความจุโทเค็นสำหรับโมเดล GPT |
| `embeddingModelCapacity` | int | `50` | ความจุโทเค็นสำหรับโมเดล embedding |
| `tags` | object | แท็กเริ่มต้น | แท็กทรัพยากรสำหรับการกำกับดูแล |

## 📤 ผลลัพธ์ของ Template

Template ให้ผลลัพธ์ดังต่อไปนี้:

| ผลลัพธ์ | คำอธิบาย |
|---------|-----------|
| `subscriptionId` | Azure subscription ID |
| `resourceGroupName` | ชื่อ resource group ที่สร้างขึ้น |
| `aiFoundryName` | ชื่อบริการ Azure AI Foundry |
| `foundryEndpoint` | URL endpoint ของบริการ AI |
| `foundryAccountKey` | คีย์การเข้าถึงบริการ AI |
| `deployedModels` | อาร์เรย์ของโมเดล OpenAI ที่ปรับใช้แล้ว |
| `applicationInsightsConnectionString` | สตริงการเชื่อมต่อ Application Insights |
| `logAnalyticsWorkspaceName` | ชื่อ Log Analytics workspace |

## 🔍 คำสั่งตรวจสอบ

หลังการปรับใช้ ให้ตรวจสอบทรัพยากร:

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

โครงการนี้มีทั้ง ARM และ Bicep templates:

### ARM Template (`azuredeploy.json`)
- ✅ รูปแบบ Native Azure Resource Manager
- ✅ ใช้งานได้ทุกที่ที่ ARM รองรับ
- ✅ ไม่ต้องใช้เครื่องมือเพิ่มเติม
- ❌ ไวยากรณ์ JSON ที่ยาวและซับซ้อน
- ❌ อ่านและดูแลรักษายากกว่า

### Bicep Template (`main.bicep`)
- ✅ ไวยากรณ์ที่ทันสมัยและสะอาด
- ✅ เครื่องมือและ IntelliSense ที่ดีกว่า
- ✅ อ่านและดูแลรักษาง่ายกว่า
- ✅ การตรวจสอบความถูกต้องในขั้นตอนการคอมไพล์
- ❌ ต้องใช้ Bicep CLI
- ❌ มีขั้นตอนการสร้างเพิ่มเติม

**คำแนะนำ**: ใช้ Bicep templates (`main.bicep`) สำหรับการพัฒนา และ ARM template (`azuredeploy.json`) สำหรับสถานการณ์ที่ต้องการ JSON ARM แบบดั้งเดิม

## 🔧 การปรับแต่ง

### การเพิ่มทรัพยากรที่กำหนดเอง

เพื่อเพิ่มทรัพยากรเพิ่มเติมใน ARM template:

1. เพิ่มคำจำกัดความของทรัพยากรในอาร์เรย์ `resources` ของ template ที่ซ้อนกัน
2. เพิ่มพารามิเตอร์ใหม่ในส่วน `parameters`
3. เพิ่มผลลัพธ์ที่เกี่ยวข้องหากจำเป็น
4. อัปเดตไฟล์พารามิเตอร์ด้วยค่าเริ่มต้น

### ตัวอย่าง: การเพิ่ม Storage Account

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

## 🐛 การแก้ไขปัญหา

### ปัญหาทั่วไป

#### 1. ข้อผิดพลาดในการตรวจสอบ Template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. ความขัดแย้งของชื่อทรัพยากร
- ตรวจสอบให้แน่ใจว่า `uniqueSuffix` ไม่ซ้ำกันจริง
- ใช้ฟังก์ชัน `uniqueString()` สำหรับการสร้างอัตโนมัติ
- ตรวจสอบทรัพยากรที่มีอยู่ในภูมิภาคเป้าหมาย

#### 3. ข้อจำกัดโควต้า
- ตรวจสอบความพร้อมใช้งานของโมเดล OpenAI ในภูมิภาคเป้าหมาย
- ตรวจสอบโควต้าการสมัครสมาชิกสำหรับบริการ AI
- พิจารณาใช้ภูมิภาคอื่นหากถึงข้อจำกัด

#### 4. ปัญหาสิทธิ์
- ตรวจสอบให้แน่ใจว่าบัญชีมีบทบาท Contributor ใน subscription
- ตรวจสอบว่า subscription เปิดใช้งานสำหรับบริการ AI
- ตรวจสอบการลงทะเบียนผู้ให้บริการทรัพยากร

### คำสั่งดีบัก

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

## 🔐 การพิจารณาด้านความปลอดภัย

### การควบคุมการเข้าถึง
- บริการ AI ใช้ managed identity เพื่อการเข้าถึงที่ปลอดภัย
- Resource group ให้ขอบเขตสำหรับ RBAC
- Application Insights มีการควบคุมการเข้าถึงแยกต่างหาก

### ความปลอดภัยเครือข่าย
- การเข้าถึงเครือข่ายสาธารณะเปิดใช้งานโดยค่าเริ่มต้น
- พิจารณาใช้ private endpoints สำหรับการผลิต
- สามารถกำหนดค่า Network ACLs เพื่อความปลอดภัยเพิ่มเติม

### การจัดการคีย์
- คีย์บริการ AI ถูกสร้างขึ้นโดยอัตโนมัติ
- ใช้ Azure Key Vault สำหรับความลับในสภาพแวดล้อมการผลิต
- หมุนเวียนคีย์เป็นประจำเพื่อความปลอดภัย

## 📚 ขั้นตอนถัดไป

หลังการปรับใช้สำเร็จ:

1. **กำหนดค่าตัวแปรสภาพแวดล้อม**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **เริ่ม MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **ทดสอบการผสานรวม**:
   - เปิด VS Code พร้อมโครงการ
   - กำหนดค่า MCP servers ใน `.vscode/mcp.json`
   - ทดสอบ AI Chat ด้วยคำถามข้อมูลการค้าปลีก

4. **ตรวจสอบประสิทธิภาพ**:
   - ดูเมตริกใน Application Insights
   - ตรวจสอบบันทึกใน Log Analytics workspace
   - ตั้งค่าการแจ้งเตือนสำหรับเหตุการณ์สำคัญ

---

สำหรับข้อมูลเพิ่มเติม ดู [README หลัก](../README.md) หรือ [คู่มือ QUICKSTART](../QUICKSTART.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้