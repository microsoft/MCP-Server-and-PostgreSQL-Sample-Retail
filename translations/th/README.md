<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T21:12:21+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# ตัวอย่าง MCP Server และ PostgreSQL - การวิเคราะห์ยอดขายปลีก

## เรียนรู้ MCP พร้อมการเชื่อมต่อฐานข้อมูลผ่านตัวอย่างการใช้งานจริง

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นใช้งานทรัพยากรเหล่านี้:

1. **Fork Repository**: คลิก [ที่นี่เพื่อ fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **เข้าร่วม Azure AI Foundry Discord**: [พบปะผู้เชี่ยวชาญและนักพัฒนาคนอื่นๆ](https://discord.com/invite/ByRwuEEgH4)

### 🌐 รองรับหลายภาษา

#### รองรับผ่าน GitHub Action (อัตโนมัติและอัปเดตเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**หากคุณต้องการให้รองรับภาษาเพิ่มเติม รายการภาษาที่รองรับมีอยู่ [ที่นี่](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## บทนำ

ตัวอย่างนี้แสดงให้เห็นวิธีการสร้างและปรับใช้ **Model Context Protocol (MCP) server** ที่ให้ผู้ช่วย AI เข้าถึงข้อมูลยอดขายปลีกผ่าน PostgreSQL อย่างปลอดภัยและชาญฉลาด โครงการนี้นำเสนอฟีเจอร์ระดับองค์กร เช่น **Row Level Security (RLS)**, **ความสามารถในการค้นหาเชิงความหมาย**, และ **การผสานรวม Azure AI** สำหรับการวิเคราะห์ยอดขายปลีกในสถานการณ์จริง

**กรณีการใช้งานหลัก:**
- **การวิเคราะห์ยอดขายด้วย AI**: ให้ผู้ช่วย AI สอบถามและวิเคราะห์ข้อมูลยอดขายปลีกผ่านภาษาธรรมชาติ
- **การเข้าถึงแบบหลายผู้เช่าอย่างปลอดภัย**: แสดงการใช้งาน Row Level Security ที่ผู้จัดการร้านแต่ละคนสามารถเข้าถึงข้อมูลเฉพาะร้านของตน
- **การค้นหาสินค้าเชิงความหมาย**: แสดงการค้นหาสินค้าที่ปรับปรุงด้วย AI โดยใช้ text embeddings
- **การผสานรวมระดับองค์กร**: แสดงวิธีการผสาน MCP server กับบริการ Azure และฐานข้อมูล PostgreSQL

**เหมาะสำหรับ:**
- นักพัฒนาที่เรียนรู้การสร้าง MCP server พร้อมการเชื่อมต่อฐานข้อมูล
- วิศวกรข้อมูลที่ต้องการสร้างโซลูชันการวิเคราะห์แบบหลายผู้เช่าอย่างปลอดภัย
- นักพัฒนาแอปพลิเคชัน AI ที่ทำงานกับข้อมูลปลีกหรืออีคอมเมิร์ซ
- ผู้ที่สนใจการรวมผู้ช่วย AI กับฐานข้อมูลระดับองค์กร

## เข้าร่วมชุมชน Azure AI Foundry Discord
แบ่งปันประสบการณ์ของคุณเกี่ยวกับ MCP และพบปะผู้เชี่ยวชาญและกลุ่มผลิตภัณฑ์

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# MCP Server สำหรับการวิเคราะห์ยอดขาย

Model Context Protocol (MCP) server ที่ให้การเข้าถึงฐานข้อมูลยอดขายลูกค้าอย่างครอบคลุมสำหรับธุรกิจ Zava Retail DIY Server นี้ช่วยให้ผู้ช่วย AI สอบถามและวิเคราะห์ข้อมูลยอดขายปลีกผ่านอินเทอร์เฟซที่ปลอดภัยและรับรู้โครงสร้าง

## 📚 คู่มือการใช้งานแบบสมบูรณ์

สำหรับการวิเคราะห์เชิงลึกเกี่ยวกับวิธีการสร้างโซลูชันนี้และวิธีการปรับใช้ MCP server ที่คล้ายกัน ดูคู่มือ **[Sample Walkthrough](Sample_Walkthrough.md)** ที่ครอบคลุมของเรา คู่มือนี้ให้:

- **การวิเคราะห์สถาปัตยกรรม**: การวิเคราะห์ส่วนประกอบและรูปแบบการออกแบบ
- **การสร้างทีละขั้นตอน**: ตั้งแต่การตั้งค่าโครงการจนถึงการปรับใช้
- **การอธิบายโค้ด**: คำอธิบายโดยละเอียดเกี่ยวกับการใช้งาน MCP server
- **ฟีเจอร์ขั้นสูง**: Row Level Security, การค้นหาเชิงความหมาย, และการตรวจสอบ
- **แนวทางปฏิบัติที่ดีที่สุด**: แนวทางด้านความปลอดภัย, ประสิทธิภาพ, และการพัฒนา
- **การแก้ไขปัญหา**: ปัญหาทั่วไปและวิธีแก้ไข

เหมาะสำหรับนักพัฒนาที่ต้องการเข้าใจรายละเอียดการใช้งานและสร้างโซลูชันที่คล้ายกัน

## 🤖 MCP (Model Context Protocol) คืออะไร?

**Model Context Protocol (MCP)** เป็นมาตรฐานเปิดที่ช่วยให้ผู้ช่วย AI เข้าถึงแหล่งข้อมูลและเครื่องมือภายนอกได้อย่างปลอดภัยในเวลาจริง คิดว่าเป็นสะพานที่ช่วยให้โมเดล AI เชื่อมต่อกับฐานข้อมูล, API, ระบบไฟล์, และทรัพยากรอื่นๆ โดยยังคงรักษาความปลอดภัยและการควบคุม

### ประโยชน์หลัก:
- **การเข้าถึงข้อมูลแบบเรียลไทม์**: ผู้ช่วย AI สามารถสอบถามฐานข้อมูลและ API แบบสด
- **การผสานรวมที่ปลอดภัย**: การเข้าถึงที่ควบคุมด้วยการตรวจสอบสิทธิ์และการอนุญาต
- **การขยายเครื่องมือ**: เพิ่มความสามารถที่กำหนดเองให้กับผู้ช่วย AI
- **โปรโตคอลมาตรฐาน**: ใช้งานได้กับแพลตฟอร์มและเครื่องมือ AI ต่างๆ

### ใหม่กับ MCP?

หากคุณยังใหม่กับ Model Context Protocol เราแนะนำให้เริ่มต้นด้วยทรัพยากรสำหรับผู้เริ่มต้นของ Microsoft:

**📖 [คู่มือ MCP สำหรับผู้เริ่มต้น](https://aka.ms/mcp-for-beginners)**

ทรัพยากรนี้ให้:
- บทนำเกี่ยวกับแนวคิดและสถาปัตยกรรม MCP
- บทเรียนทีละขั้นตอนสำหรับการสร้าง MCP server แรกของคุณ
- แนวทางปฏิบัติที่ดีที่สุดสำหรับการพัฒนา MCP
- ตัวอย่างการผสานรวมกับแพลตฟอร์ม AI ยอดนิยม
- ทรัพยากรและการสนับสนุนจากชุมชน

เมื่อคุณเข้าใจพื้นฐานแล้ว กลับมาที่นี่เพื่อสำรวจการใช้งานการวิเคราะห์ยอดขายปลีกขั้นสูงนี้!

## 📚 คู่มือการเรียนรู้แบบครอบคลุม: /walkthrough

Repository นี้รวม **การเรียนรู้แบบ walkthrough 12 โมดูล** ที่แยกตัวอย่าง MCP server สำหรับการขายปลีกนี้ออกเป็นบทเรียนทีละขั้นตอนที่เข้าใจง่าย Walkthrough นี้เปลี่ยนตัวอย่างการทำงานนี้ให้เป็นทรัพยากรการศึกษาที่ครอบคลุม เหมาะสำหรับนักพัฒนาที่ต้องการเรียนรู้วิธีการสร้าง MCP server ที่พร้อมใช้งานจริงพร้อมการเชื่อมต่อฐานข้อมูล

### สิ่งที่คุณจะได้เรียนรู้

Walkthrough ครอบคลุมทุกอย่างตั้งแต่แนวคิดพื้นฐานของ MCP ไปจนถึงการปรับใช้ในระดับการผลิต รวมถึง:

- **พื้นฐาน MCP**: ทำความเข้าใจ Model Context Protocol และการใช้งานในโลกจริง
- **การเชื่อมต่อฐานข้อมูล**: การใช้งานการเชื่อมต่อ PostgreSQL อย่างปลอดภัยด้วย Row Level Security
- **ฟีเจอร์ที่ปรับปรุงด้วย AI**: การเพิ่มความสามารถในการค้นหาเชิงความหมายด้วย Azure OpenAI embeddings
- **การใช้งานด้านความปลอดภัย**: การตรวจสอบสิทธิ์, การอนุญาต, และการแยกข้อมูลระดับองค์กร
- **การพัฒนาเครื่องมือ**: การสร้างเครื่องมือ MCP ที่ซับซ้อนสำหรับการวิเคราะห์ข้อมูลและข่าวกรองธุรกิจ
- **การทดสอบและการแก้ไขข้อบกพร่อง**: กลยุทธ์การทดสอบที่ครอบคลุมและเทคนิคการแก้ไขข้อบกพร่อง
- **การผสานรวมกับ VS Code**: การตั้งค่า AI Chat สำหรับการสอบถามฐานข้อมูลด้วยภาษาธรรมชาติ
- **การปรับใช้ในระดับการผลิต**: การทำ containerization, การปรับขนาด, และกลยุทธ์การปรับใช้บนคลาวด์
- **การตรวจสอบและการสังเกตการณ์**: Application Insights, การบันทึก, และการตรวจสอบประสิทธิภาพ

### ภาพรวมเส้นทางการเรียนรู้

Walkthrough ใช้โครงสร้างการเรียนรู้แบบก้าวหน้า ออกแบบมาสำหรับนักพัฒนาทุกระดับทักษะ:

| โมดูล | พื้นที่โฟกัส | คำอธิบาย | เวลาที่ใช้ |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | พื้นฐาน | แนวคิด MCP, กรณีศึกษา Zava Retail, ภาพรวมสถาปัตยกรรม | 30 นาที |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | รูปแบบการออกแบบ | สถาปัตยกรรมทางเทคนิค, การออกแบบแบบเลเยอร์, ส่วนประกอบของระบบ | 45 นาที |
| **[02-Security](walkthrough/02-Security/README.md)** | ความปลอดภัยระดับองค์กร | การตรวจสอบสิทธิ์ Azure, Row Level Security, การแยกหลายผู้เช่า | 60 นาที |
| **[03-Setup](walkthrough/03-Setup/README.md)** | สภาพแวดล้อม | การตั้งค่า Docker, Azure CLI, การกำหนดค่าโครงการ, การตรวจสอบ | 45 นาที |
| **[04-Database](walkthrough/04-Database/README.md)** | ชั้นข้อมูล | PostgreSQL schema, pgvector, นโยบาย RLS, ข้อมูลตัวอย่าง | 60 นาที |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | การใช้งานหลัก | FastMCP framework, การเชื่อมต่อฐานข้อมูล, การจัดการการเชื่อมต่อ | 90 นาที |
| **[06-Tools](walkthrough/06-Tools/README.md)** | การพัฒนาเครื่องมือ | การสร้างเครื่องมือ MCP, การตรวจสอบคำถาม, ฟีเจอร์ข่าวกรองธุรกิจ | 75 นาที |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | การผสานรวม AI | Azure OpenAI embeddings, การค้นหาแบบเวกเตอร์, กลยุทธ์การค้นหาแบบไฮบริด | 60 นาที |
| **[08-Testing](walkthrough/08-Testing/README.md)** | การประกันคุณภาพ | การทดสอบหน่วย, การทดสอบการผสานรวม, การทดสอบประสิทธิภาพ, การแก้ไขข้อบกพร่อง | 75 นาที |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ประสบการณ์การพัฒนา | การตั้งค่า VS Code, การผสาน AI Chat, การทำงานแก้ไขข้อบกพร่อง | 45 นาที |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | พร้อมใช้งานจริง | การทำ containerization, Azure Container Apps, CI/CD pipelines, การปรับขนาด | 90 นาที |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | การสังเกตการณ์ | Application Insights, การบันทึกแบบมีโครงสร้าง, เมตริกประสิทธิภาพ | 60 นาที |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | ความเป็นเลิศในการผลิต | การเพิ่มความปลอดภัย, การปรับปรุงประสิทธิภาพ, รูปแบบระดับองค์กร | 45 นาที |

**เวลาการเรียนรู้ทั้งหมด**: ~12-15 ชั่วโมงของการเรียนรู้แบบลงมือทำที่ครอบคลุม

### 🎯 วิธีการใช้ Walkthrough

**สำหรับผู้เริ่มต้น**:
1. เริ่มต้นที่ [Module 00: Introduction](walkthrough/00-Introduction/README.md) เพื่อทำความเข้าใจพื้นฐาน MCP
2. ทำตามโมดูลตามลำดับเพื่อประสบการณ์การเรียนรู้ที่สมบูรณ์
3. แต่ละโมดูลสร้างขึ้นจากแนวคิดก่อนหน้าและรวมถึงการฝึกปฏิบัติจริง

**สำหรับนักพัฒนาที่มีประสบการณ์**:
1. ตรวจสอบ [ภาพรวม Walkthrough หลัก](walkthrough/README.md) เพื่อสรุปโมดูลทั้งหมด
2. ข้ามไปยังโมดูลเฉพาะที่คุณสนใจ (เช่น Module 07 สำหรับการผสานรวม AI)
3. ใช้แต่ละโมดูลเป็นเอกสารอ้างอิงสำหรับโครงการของคุณเอง

**สำหรับการใช้งานในระดับการผลิต**:
1. เน้นที่ Module 02 (Security), 10 (Deployment), และ 11 (Monitoring)
2. ตรวจสอบ Module 12 (Best Practices) สำหรับแนวทางระดับองค์กร
3. ใช้ตัวอย่างโค้ดเป็นแม่แบบที่พร้อมใช้งานจริง

### 🚀 ตัวเลือกเริ่มต้นอย่างรวดเร็ว

**ตัวเลือก 1: เส้นทางการเรียนรู้แบบสมบูรณ์** (แนะนำสำหรับผู้เริ่มต้น)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**ตัวเลือก 2: การใช้งานแบบลงมือทำ** (เริ่มต้นสร้างทันที)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**ตัวเลือก 3: เน้นการผลิต** (การปรับใช้ระดับองค์กร)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 ข้อกำหนดเบื้องต้นในการเรียนรู้

**พื้นฐานที่แนะนำ**:
- มีประสบการณ์การเขียนโปรแกรม Python เบื้องต้น
- คุ้นเคยกับ REST APIs และฐานข้อมูล
- มีความเข้าใจทั่วไปเกี่ยวกับแนวคิด AI/ML
- มีความรู้พื้นฐานเกี่ยวกับการใช้งาน Command-line และ Docker

**ไม่จำเป็น (แต่มีประโยชน์)**:
- มีประสบการณ์ MCP มาก่อน (เราสอนตั้งแต่เริ่มต้น)
- มีประสบการณ์ใช้งาน Azure Cloud (เรามีคำแนะนำทีละขั้นตอน)
- มีความรู้ PostgreSQL ขั้นสูง (เราจะอธิบายแนวคิดตามความจำเป็น)

### 💡 เคล็ดลับการเรียนรู้

1. **เรียนรู้ผ่านการลงมือทำ**: แต่ละโมดูลมีตัวอย่างโค้ดที่สามารถรันและปรับแต่งได้
2. **ความซับซ้อนที่เพิ่มขึ้น**: แนวคิดจะถูกสร้างขึ้นอย่างค่อยเป็นค่อยไปจากง่ายไปซับซ้อน
3. **บริบทในโลกจริง**: ตัวอย่างทั้งหมดใช้สถานการณ์ธุรกิจค้าปลีกที่สมจริง
4. **พร้อมใช้งานในระบบจริง**: ตัวอย่างโค้ดถูกออกแบบมาเพื่อใช้งานในระบบจริง
5. **การสนับสนุนจากชุมชน**: เข้าร่วม [ชุมชน Discord](https://discord.com/invite/ByRwuEEgH4) ของเราเพื่อรับความช่วยเหลือและพูดคุย

### 🔗 แหล่งข้อมูลที่เกี่ยวข้อง

- **[MCP สำหรับผู้เริ่มต้น](https://aka.ms/mcp-for-beginners)**: การอ่านพื้นฐานที่จำเป็น
- **[ตัวอย่างการทำงาน](Sample_Walkthrough.md)**: ภาพรวมทางเทคนิคระดับสูง
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: แพลตฟอร์มคลาวด์ที่ใช้ในตัวอย่าง
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: เฟรมเวิร์ก MCP บน Python

**พร้อมเริ่มเรียนรู้หรือยัง?** เริ่มต้นด้วย **[โมดูล 00: บทนำ](walkthrough/00-Introduction/README.md)** หรือสำรวจ **[ภาพรวมการทำงานทั้งหมด](walkthrough/README.md)**

## ข้อกำหนดเบื้องต้น

1. ติดตั้ง Docker Desktop
2. ติดตั้ง Git
3. **Azure CLI**: ติดตั้งและยืนยันตัวตนด้วย Azure CLI
4. เข้าถึงโมเดล OpenAI `text-embedding-3-small` และอาจเลือกใช้โมเดล `gpt-4o-mini`

## เริ่มต้นใช้งาน

เปิดหน้าต่าง Terminal และรันคำสั่งต่อไปนี้:

1. ยืนยันตัวตนด้วย Azure CLI

    ```bash
    az login
    ```

2. โคลน Repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. ไปยังไดเรกทอรีโปรเจกต์

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### การปรับใช้ทรัพยากร Azure

รันสคริปต์ต่อไปนี้เพื่อปรับใช้ทรัพยากร Azure ที่จำเป็นสำหรับเซิร์ฟเวอร์ MCP โดยอัตโนมัติ

สคริปต์การปรับใช้จะปรับใช้โมเดล `text-embedding-3-small` โดยอัตโนมัติ ในระหว่างการปรับใช้ คุณสามารถเลือกที่จะรวมโมเดล `gpt-4o-mini` ได้ด้วย โปรดทราบว่า `gpt-4o-mini` **ไม่จำเป็น** สำหรับโปรเจกต์นี้และรวมไว้เพื่อการปรับปรุงในอนาคตเท่านั้น

**เลือกสคริปต์สำหรับแพลตฟอร์มของคุณ:**

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

## การรันเซิร์ฟเวอร์ MCP

วิธีที่ง่ายที่สุดในการรัน Stack ทั้งหมด (PostgreSQL + MCP Server) คือการใช้ Docker Compose:

### เริ่มต้น Stack

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

## การใช้งาน

ต่อไปนี้สมมติว่าคุณจะใช้การสนับสนุนเซิร์ฟเวอร์ MCP ในตัวของ VS Code

1. เปิดโปรเจกต์ใน VS Code จาก Terminal รัน:

    ```bash
    code .
    ```

2. เริ่มเซิร์ฟเวอร์ MCP หนึ่งตัวหรือมากกว่าด้วยการตั้งค่าที่อยู่ใน `.vscode/mcp.json` ไฟล์นี้มีการตั้งค่าเซิร์ฟเวอร์สี่แบบที่แสดงถึงบทบาทผู้จัดการร้านที่แตกต่างกัน:

   - การตั้งค่าแต่ละแบบใช้ RLS (Row Level Security) User ID ที่ไม่ซ้ำกัน
   - User ID เหล่านี้จำลองตัวตนของผู้จัดการร้านที่เข้าถึงฐานข้อมูล
   - ระบบ RLS จำกัดการเข้าถึงข้อมูลตามร้านที่ผู้จัดการได้รับมอบหมาย
   - สิ่งนี้เลียนแบบสถานการณ์จริงที่ผู้จัดการร้านลงชื่อเข้าใช้ด้วยบัญชี Entra ID ที่แตกต่างกัน

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

### เปิด AI Chat ใน VS Code

1. เปิดโหมด AI Chat ใน VS Code
2. พิมพ์ **#zava** และเลือกหนึ่งในเซิร์ฟเวอร์ MCP ที่คุณเริ่มต้น
3. ถามคำถามเกี่ยวกับข้อมูลการขาย - ดูตัวอย่างคำถามด้านล่าง

### ตัวอย่างคำถาม

1. แสดง 20 ผลิตภัณฑ์ที่มียอดขายสูงสุดตามรายได้
2. แสดงยอดขายตามร้านค้า
3. ยอดขายไตรมาสล่าสุดแบ่งตามหมวดหมู่คืออะไร?
4. ผลิตภัณฑ์ที่เราขายที่คล้ายกับ "ภาชนะสำหรับสี" มีอะไรบ้าง?

## คุณสมบัติ

- **การเข้าถึง Schema หลายตาราง**: ดึง Schema สำหรับหลายตารางฐานข้อมูลในคำขอเดียว
- **การดำเนินการ Query อย่างปลอดภัย**: รัน Query PostgreSQL พร้อมการสนับสนุน Row Level Security (RLS)
- **ข้อมูลเรียลไทม์**: เข้าถึงข้อมูลการขาย สินค้าคงคลัง และข้อมูลลูกค้าในปัจจุบัน
- **เครื่องมือวันที่/เวลา**: รับ Timestamp UTC ปัจจุบันสำหรับการวิเคราะห์ที่อ่อนไหวต่อเวลา
- **การปรับใช้ที่ยืดหยุ่น**: รองรับโหมดเซิร์ฟเวอร์ HTTP

## ตารางที่รองรับ

เซิร์ฟเวอร์ให้การเข้าถึงตารางฐานข้อมูลค้าปลีกดังต่อไปนี้:

- `retail.customers` - ข้อมูลและโปรไฟล์ลูกค้า
- `retail.stores` - ตำแหน่งและรายละเอียดร้านค้า
- `retail.categories` - หมวดหมู่ผลิตภัณฑ์และลำดับชั้น
- `retail.product_types` - การจัดประเภทประเภทผลิตภัณฑ์
- `retail.products` - แคตตาล็อกผลิตภัณฑ์และข้อมูลจำเพาะ
- `retail.orders` - คำสั่งซื้อและธุรกรรมของลูกค้า
- `retail.order_items` - รายการแต่ละรายการในคำสั่งซื้อ
- `retail.inventory` - ระดับสินค้าคงคลังและข้อมูลสต็อกปัจจุบัน

## เครื่องมือที่มีให้

### `get_multiple_table_schemas`

ดึง Schema ฐานข้อมูลสำหรับหลายตารางในคำขอเดียว

**พารามิเตอร์**:

- `table_names` (list[str]): รายชื่อชื่อของตารางที่ถูกต้องจากตารางที่รองรับด้านบน

**ผลลัพธ์**: สตริง Schema ที่รวมกันสำหรับตารางที่ร้องขอ

### `execute_sales_query`

รัน Query PostgreSQL กับฐานข้อมูลการขายพร้อมการสนับสนุน Row Level Security

**พารามิเตอร์**:

- `postgresql_query` (str): Query PostgreSQL ที่เขียนอย่างถูกต้อง

**ผลลัพธ์**: ผลลัพธ์ Query ที่จัดรูปแบบเป็นสตริง (จำกัด 20 แถวเพื่อให้อ่านง่าย)

**แนวทางปฏิบัติที่ดีที่สุด**:

- ดึง Schema ตารางก่อนเสมอ
- ใช้ชื่อคอลัมน์ที่แน่นอนจาก Schema
- เชื่อมโยงตารางที่เกี่ยวข้องเพื่อการวิเคราะห์ที่ครอบคลุม
- รวมผลลัพธ์เมื่อเหมาะสม
- จำกัดผลลัพธ์เพื่อให้อ่านง่าย

### `get_current_utc_date`

รับวันที่และเวลาปัจจุบันในรูปแบบ ISO

**ผลลัพธ์**: วันที่/เวลาปัจจุบันในรูปแบบ ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

ดำเนินการค้นหาความหมายสำหรับผลิตภัณฑ์ตามคำค้นหาของผู้ใช้

**ผลลัพธ์**: รายชื่อผลิตภัณฑ์ที่ตรงกับเกณฑ์การค้นหา

**พารามิเตอร์**:

- `query` (str): สตริงคำค้นหา

**ผลลัพธ์**: รายชื่อผลิตภัณฑ์ที่ตรงกับเกณฑ์การค้นหา

## คุณสมบัติด้านความปลอดภัย

### Row Level Security (RLS)

เซิร์ฟเวอร์ใช้ Row Level Security เพื่อให้แน่ใจว่าผู้ใช้เข้าถึงข้อมูลที่ได้รับอนุญาตเท่านั้น:

- **โหมด HTTP**: ใช้ Header `x-rls-user-id` เพื่อระบุผู้ใช้ที่ร้องขอ
- **ค่าเริ่มต้น**: ใช้ UUID Placeholder เมื่อไม่มี User ID

#### RLS User ID เฉพาะร้านค้า

แต่ละตำแหน่งร้านค้าของ Zava Retail มี RLS User ID เฉพาะที่กำหนดว่าผู้ใช้สามารถเข้าถึงข้อมูลใดได้:

| ตำแหน่งร้านค้า | RLS User ID | คำอธิบาย |
|---------------|-------------|-------------|
| **การเข้าถึงทั่วโลก** | `00000000-0000-0000-0000-000000000000` | ค่าเริ่มต้น - เข้าถึงทุกร้าน |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | ข้อมูลร้าน Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | ข้อมูลร้าน Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | ข้อมูลร้าน Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | ข้อมูลร้าน Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | ข้อมูลร้าน Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | ข้อมูลร้าน Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | ข้อมูลร้าน Zava Retail Kirkland |
| **ออนไลน์** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | ข้อมูลร้าน Zava Retail ออนไลน์ |

#### การใช้งาน RLS

เมื่อผู้ใช้เชื่อมต่อด้วย RLS User ID เฉพาะของร้านค้า พวกเขาจะเห็นเฉพาะ:

- ลูกค้าที่เกี่ยวข้องกับร้านค้านั้น
- คำสั่งซื้อที่ทำที่ตำแหน่งร้านค้านั้น
- ข้อมูลสินค้าคงคลังสำหรับร้านค้านั้น
- เมตริกการขายและประสิทธิภาพเฉพาะร้านค้า

สิ่งนี้ช่วยให้ข้อมูลระหว่างตำแหน่งร้านค้าแยกออกจากกันในขณะที่ยังคงรักษา Schema ฐานข้อมูลที่รวมกัน

## สถาปัตยกรรม

### บริบทแอปพลิเคชัน

เซิร์ฟเวอร์ใช้บริบทแอปพลิเคชันที่จัดการด้วย:

- **Database Connection Pool**: การจัดการการเชื่อมต่อที่มีประสิทธิภาพสำหรับโหมด HTTP
- **Lifecycle Management**: การทำความสะอาดทรัพยากรอย่างเหมาะสมเมื่อปิดระบบ
- **Type Safety**: บริบทที่มีการพิมพ์อย่างเข้มงวดด้วย `AppContext` dataclass

### บริบทคำขอ

- **Header Extraction**: การแยก Header อย่างปลอดภัยเพื่อระบุผู้ใช้
- **RLS Integration**: การแก้ไข User ID อัตโนมัติจากบริบทคำขอ
- **Error Handling**: การจัดการข้อผิดพลาดอย่างครอบคลุมพร้อมข้อความที่เป็นมิตรต่อผู้ใช้

## การรวมฐานข้อมูล

เซิร์ฟเวอร์รวมเข้ากับฐานข้อมูล PostgreSQL ผ่านคลาส `PostgreSQLSchemaProvider`:

- **Connection Pooling**: ใช้ Connection Pool แบบ Async เพื่อความสามารถในการขยาย
- **Schema Metadata**: ให้ข้อมูล Schema ตารางโดยละเอียด
- **Query Execution**: การดำเนินการ Query อย่างปลอดภัยพร้อมการสนับสนุน RLS
- **Resource Management**: การทำความสะอาดทรัพยากรฐานข้อมูลโดยอัตโนมัติ

## การจัดการข้อผิดพลาด

เซิร์ฟเวอร์มีการจัดการข้อผิดพลาดที่แข็งแกร่ง:

- **Table Validation**: ตรวจสอบให้แน่ใจว่าเข้าถึงเฉพาะชื่อของตารางที่ถูกต้อง
- **Query Validation**: ตรวจสอบ Query PostgreSQL ก่อนดำเนินการ
- **Resource Management**: การทำความสะอาดอย่างเหมาะสมแม้ในระหว่างข้อผิดพลาด
- **User-Friendly Messages**: ข้อความข้อผิดพลาดที่ชัดเจนสำหรับการแก้ไขปัญหา

## การพิจารณาด้านความปลอดภัย

1. **Row Level Security**: Query ทั้งหมดเคารพนโยบาย RLS ตามตัวตนของผู้ใช้
2. **การแยกข้อมูลร้านค้า**: RLS User ID ของแต่ละร้านค้าช่วยให้เข้าถึงเฉพาะข้อมูลของร้านค้านั้น
3. **การตรวจสอบ Input**: ชื่อของตารางและ Query จะถูกตรวจสอบก่อนดำเนินการ
4. **ข้อจำกัดทรัพยากร**: ผลลัพธ์ Query ถูกจำกัดเพื่อป้องกันการใช้ทรัพยากรเกิน
5. **ความปลอดภัยของการเชื่อมต่อ**: ใช้แนวทางปฏิบัติการเชื่อมต่อฐานข้อมูลที่ปลอดภัย
6. **การตรวจสอบตัวตนผู้ใช้**: ตรวจสอบให้แน่ใจว่าใช้ RLS User ID ที่ถูกต้องสำหรับตำแหน่งร้านค้าที่ตั้งใจไว้เสมอ

### หมายเหตุด้านความปลอดภัยที่สำคัญ

- **อย่าใช้ RLS User ID สำหรับการผลิตในสภาพแวดล้อมการพัฒนา**
- **ตรวจสอบให้แน่ใจว่า RLS User ID ตรงกับร้านค้าที่ตั้งใจไว้ก่อนรัน Query**
- **UUID ค่าเริ่มต้น (`00000000-0000-0000-0000-000000000000`) ให้การเข้าถึงที่จำกัด**
- **ผู้จัดการร้านแต่ละคนควรเข้าถึงเฉพาะ RLS User ID ของร้านค้าของตน**

## การพัฒนา

### โครงสร้างโปรเจกต์

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### ส่วนประกอบสำคัญ

- **FastMCP Server**: การใช้งานเซิร์ฟเวอร์ MCP สมัยใหม่พร้อมการสนับสนุน Async
- **PostgreSQL Provider**: ชั้นนามธรรมฐานข้อมูลพร้อมการสนับสนุน RLS
- **Context Management**: การจัดการบริบทแอปพลิเคชันและคำขอที่มีการพิมพ์อย่างเข้มงวด
- **Tool Registration**: การลงทะเบียนเครื่องมือแบบ Declarative พร้อมการตรวจสอบ Pydantic

## การมีส่วนร่วม

เมื่อมีส่วนร่วมในเซิร์ฟเวอร์นี้:

1. ตรวจสอบให้แน่ใจว่า Query ฐานข้อมูลทั้งหมดเคารพ Row Level Security
2. เพิ่มการจัดการข้อผิดพลาดที่เหมาะสมสำหรับเครื่องมือใหม่
3. อัปเดต README นี้ด้วยคุณสมบัติหรือการเปลี่ยนแปลงใหม่
4. ทดสอบโหมดเซิร์ฟเวอร์ HTTP
5. ตรวจสอบพารามิเตอร์ Input และให้ข้อความข้อผิดพลาดที่ชัดเจน

## [ใบอนุญาต](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*เซิร์ฟเวอร์ MCP นี้ช่วยให้เข้าถึงข้อมูลการขายของ Zava Retail ได้อย่างปลอดภัยและมีประสิทธิภาพสำหรับการวิเคราะห์และข้อมูลเชิงลึกที่ขับเคลื่อนด้วย AI*

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้