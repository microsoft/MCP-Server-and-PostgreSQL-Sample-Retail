<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:51:34+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# ตัวอย่าง MCP Server และ PostgreSQL - การวิเคราะห์ยอดขายปลีก

## เรียนรู้ MCP พร้อมการผสานฐานข้อมูลผ่านตัวอย่างปฏิบัติจริง

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นใช้งานทรัพยากรนี้:

1. **Fork Repository**: คลิก [ที่นี่เพื่อ Fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone Repository**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **เข้าร่วม Azure AI Foundry Discord**: [พบปะผู้เชี่ยวชาญและนักพัฒนาคนอื่นๆ](https://discord.com/invite/ByRwuEEgH4)

### 🌐 รองรับหลายภาษา

#### รองรับผ่าน GitHub Action (อัปเดตอัตโนมัติและทันสมัยเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**หากคุณต้องการให้รองรับภาษาเพิ่มเติม รายการภาษาที่รองรับมีอยู่ [ที่นี่](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## บทนำ

ตัวอย่างนี้แสดงให้เห็นถึงวิธีการสร้างและปรับใช้ **Model Context Protocol (MCP) server** ที่ให้ผู้ช่วย AI เข้าถึงข้อมูลยอดขายปลีกผ่าน PostgreSQL ได้อย่างปลอดภัยและชาญฉลาด โครงการนี้นำเสนอคุณสมบัติระดับองค์กร เช่น **Row Level Security (RLS)**, **ความสามารถในการค้นหาเชิงความหมาย**, และ **การผสาน Azure AI** สำหรับการวิเคราะห์ข้อมูลยอดขายในสถานการณ์จริง

**กรณีการใช้งานหลัก:**
- **การวิเคราะห์ยอดขายด้วย AI**: ช่วยให้ผู้ช่วย AI สามารถสอบถามและวิเคราะห์ข้อมูลยอดขายปลีกด้วยภาษาธรรมชาติ
- **การเข้าถึงข้อมูลแบบ Multi-Tenant อย่างปลอดภัย**: แสดงการใช้งาน Row Level Security ที่ผู้จัดการร้านแต่ละคนสามารถเข้าถึงข้อมูลเฉพาะร้านของตนเอง
- **การค้นหาสินค้าเชิงความหมาย**: แสดงการค้นหาสินค้าที่ปรับปรุงด้วย AI โดยใช้การฝังข้อความ
- **การผสานระดับองค์กร**: แสดงวิธีการผสาน MCP server กับบริการ Azure และฐานข้อมูล PostgreSQL

**เหมาะสำหรับ:**
- นักพัฒนาที่ต้องการเรียนรู้การสร้าง MCP server พร้อมการผสานฐานข้อมูล
- วิศวกรข้อมูลที่ต้องการสร้างโซลูชันการวิเคราะห์แบบ Multi-Tenant ที่ปลอดภัย
- นักพัฒนาแอปพลิเคชัน AI ที่ทำงานกับข้อมูลยอดขายปลีกหรืออีคอมเมิร์ซ
- ผู้ที่สนใจการผสานผู้ช่วย AI กับฐานข้อมูลระดับองค์กร

## เข้าร่วมชุมชน Azure AI Foundry Discord
แบ่งปันประสบการณ์ MCP ของคุณและพบปะผู้เชี่ยวชาญและกลุ่มผลิตภัณฑ์

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server สำหรับการวิเคราะห์ยอดขาย

Model Context Protocol (MCP) server ที่ให้การเข้าถึงฐานข้อมูลยอดขายลูกค้าแบบครบวงจรสำหรับธุรกิจ Zava Retail DIY Server นี้ช่วยให้ผู้ช่วย AI สามารถสอบถามและวิเคราะห์ข้อมูลยอดขายปลีกผ่านอินเทอร์เฟซที่ปลอดภัยและเข้าใจโครงสร้างข้อมูล

## 📚 คู่มือการใช้งานแบบครบวงจร

สำหรับคำอธิบายโดยละเอียดเกี่ยวกับวิธีการสร้างโซลูชันนี้และวิธีการปรับใช้ MCP server ที่คล้ายกัน โปรดดู **[ตัวอย่างการใช้งาน](Sample_Walkthrough.md)** คู่มือนี้ประกอบด้วย:

- **การวิเคราะห์สถาปัตยกรรม**: การวิเคราะห์ส่วนประกอบและรูปแบบการออกแบบ
- **การสร้างทีละขั้นตอน**: ตั้งแต่การตั้งค่าโครงการจนถึงการปรับใช้
- **การอธิบายโค้ด**: คำอธิบายโดยละเอียดเกี่ยวกับการใช้งาน MCP server
- **คุณสมบัติขั้นสูง**: Row Level Security, การค้นหาเชิงความหมาย, และการตรวจสอบ
- **แนวทางปฏิบัติที่ดีที่สุด**: ความปลอดภัย, ประสิทธิภาพ, และแนวทางการพัฒนา
- **การแก้ไขปัญหา**: ปัญหาที่พบบ่อยและวิธีแก้ไข

เหมาะสำหรับนักพัฒนาที่ต้องการเข้าใจรายละเอียดการใช้งานและสร้างโซลูชันที่คล้ายกัน

## 🤖 MCP (Model Context Protocol) คืออะไร?

**Model Context Protocol (MCP)** เป็นมาตรฐานเปิดที่ช่วยให้ผู้ช่วย AI สามารถเข้าถึงแหล่งข้อมูลภายนอกและเครื่องมือในแบบเรียลไทม์ได้อย่างปลอดภัย คิดว่าเป็นสะพานที่ช่วยให้โมเดล AI เชื่อมต่อกับฐานข้อมูล, API, ระบบไฟล์, และทรัพยากรอื่นๆ ในขณะที่ยังคงรักษาความปลอดภัยและการควบคุม

### ประโยชน์หลัก:
- **การเข้าถึงข้อมูลแบบเรียลไทม์**: ผู้ช่วย AI สามารถสอบถามฐานข้อมูลและ API แบบสด
- **การผสานที่ปลอดภัย**: การเข้าถึงที่ควบคุมด้วยการยืนยันตัวตนและสิทธิ์
- **ความสามารถในการขยายเครื่องมือ**: เพิ่มความสามารถเฉพาะให้กับผู้ช่วย AI
- **โปรโตคอลมาตรฐาน**: ใช้งานได้กับแพลตฟอร์มและเครื่องมือ AI ต่างๆ

### ใหม่กับ MCP?

หากคุณยังใหม่กับ Model Context Protocol เราขอแนะนำให้เริ่มต้นด้วยทรัพยากรสำหรับผู้เริ่มต้นของ Microsoft:

**📖 [คู่มือ MCP สำหรับผู้เริ่มต้น](https://aka.ms/mcp-for-beginners)**

ทรัพยากรนี้ประกอบด้วย:
- บทนำเกี่ยวกับแนวคิดและสถาปัตยกรรม MCP
- บทเรียนทีละขั้นตอนสำหรับการสร้าง MCP server แรกของคุณ
- แนวทางปฏิบัติที่ดีที่สุดสำหรับการพัฒนา MCP
- ตัวอย่างการผสานกับแพลตฟอร์ม AI ยอดนิยม
- ทรัพยากรและการสนับสนุนจากชุมชน

เมื่อคุณเข้าใจพื้นฐานแล้ว กลับมาที่นี่เพื่อสำรวจการใช้งานการวิเคราะห์ยอดขายปลีกขั้นสูงนี้!

## 📚 คู่มือการเรียนรู้แบบครบวงจร: /walkthrough

Repository นี้ประกอบด้วย **การเรียนรู้แบบ 12 โมดูล** ที่แยกตัวอย่าง MCP server สำหรับการขายปลีกนี้ออกเป็นบทเรียนทีละขั้นตอนที่เข้าใจง่าย การเรียนรู้นี้เปลี่ยนตัวอย่างการทำงานนี้ให้เป็นทรัพยากรการศึกษาที่สมบูรณ์แบบสำหรับนักพัฒนาที่ต้องการเข้าใจวิธีการสร้าง MCP server พร้อมการผสานฐานข้อมูลที่พร้อมใช้งานจริง

### สิ่งที่คุณจะได้เรียนรู้

การเรียนรู้ครอบคลุมทุกอย่างตั้งแต่แนวคิดพื้นฐานของ MCP ไปจนถึงการปรับใช้ในระดับการผลิตขั้นสูง รวมถึง:

- **พื้นฐาน MCP**: ทำความเข้าใจ Model Context Protocol และการใช้งานในโลกจริง
- **การผสานฐานข้อมูล**: การเชื่อมต่อ PostgreSQL อย่างปลอดภัยด้วย Row Level Security
- **คุณสมบัติที่เพิ่มด้วย AI**: การเพิ่มความสามารถในการค้นหาเชิงความหมายด้วย Azure OpenAI embeddings
- **การใช้งานด้านความปลอดภัย**: การยืนยันตัวตน, การอนุญาต, และการแยกข้อมูลระดับองค์กร
- **การพัฒนาเครื่องมือ**: การสร้างเครื่องมือ MCP สำหรับการวิเคราะห์ข้อมูลและข่าวกรองธุรกิจ
- **การทดสอบและการแก้ไขข้อบกพร่อง**: กลยุทธ์การทดสอบและเทคนิคการแก้ไขข้อบกพร่องที่ครอบคลุม
- **การผสาน VS Code**: การตั้งค่า AI Chat สำหรับการสอบถามฐานข้อมูลด้วยภาษาธรรมชาติ
- **การปรับใช้ในระดับการผลิต**: การใช้คอนเทนเนอร์, การปรับขนาด, และกลยุทธ์การปรับใช้บนคลาวด์
- **การตรวจสอบและการสังเกตการณ์**: Application Insights, การบันทึก, และการตรวจสอบประสิทธิภาพ

### ภาพรวมเส้นทางการเรียนรู้

การเรียนรู้มีโครงสร้างแบบก้าวหน้า ออกแบบมาสำหรับนักพัฒนาทุกระดับทักษะ:

| โมดูล | หัวข้อ | คำอธิบาย | เวลาที่ใช้โดยประมาณ |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | พื้นฐาน | แนวคิด MCP, กรณีศึกษา Zava Retail, ภาพรวมสถาปัตยกรรม | 30 นาที |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | รูปแบบการออกแบบ | สถาปัตยกรรมทางเทคนิค, การออกแบบแบบเลเยอร์, ส่วนประกอบของระบบ | 45 นาที |
| **[02-Security](walkthrough/02-Security/README.md)** | ความปลอดภัยระดับองค์กร | การยืนยันตัวตน Azure, Row Level Security, การแยก Multi-Tenant | 60 นาที |
| **[03-Setup](walkthrough/03-Setup/README.md)** | สภาพแวดล้อม | การตั้งค่า Docker, Azure CLI, การกำหนดค่าโครงการ, การตรวจสอบ | 45 นาที |
| **[04-Database](walkthrough/04-Database/README.md)** | ชั้นข้อมูล | PostgreSQL schema, pgvector, นโยบาย RLS, ข้อมูลตัวอย่าง | 60 นาที |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | การใช้งานหลัก | FastMCP framework, การผสานฐานข้อมูล, การจัดการการเชื่อมต่อ | 90 นาที |
| **[06-Tools](walkthrough/06-Tools/README.md)** | การพัฒนาเครื่องมือ | การสร้างเครื่องมือ MCP, การตรวจสอบคำถาม, คุณสมบัติข่าวกรองธุรกิจ | 75 นาที |
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | การผสาน AI | Azure OpenAI embeddings, การค้นหาเวกเตอร์, กลยุทธ์การค้นหาแบบไฮบริด | 60 นาที |
| **[08-Testing](walkthrough/08-Testing/README.md)** | การประกันคุณภาพ | การทดสอบหน่วย, การทดสอบการผสาน, การทดสอบประสิทธิภาพ, การแก้ไขข้อบกพร่อง | 75 นาที |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | ประสบการณ์การพัฒนา | การตั้งค่า VS Code, การผสาน AI Chat, เวิร์กโฟลว์การแก้ไขข้อบกพร่อง | 45 นาที |
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | พร้อมใช้งานจริง | การใช้คอนเทนเนอร์, Azure Container Apps, CI/CD pipelines, การปรับขนาด | 90 นาที |
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | การสังเกตการณ์ | Application Insights, การบันทึกแบบมีโครงสร้าง, เมตริกประสิทธิภาพ | 60 นาที |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | ความเป็นเลิศในการผลิต | การเพิ่มความปลอดภัย, การเพิ่มประสิทธิภาพ, รูปแบบระดับองค์กร | 45 นาที |

**เวลาการเรียนรู้ทั้งหมด**: ~12-15 ชั่วโมงของการเรียนรู้แบบลงมือปฏิบัติจริง

### 🎯 วิธีการใช้ Walkthrough

**สำหรับผู้เริ่มต้น**:
1. เริ่มต้นที่ [โมดูล 00: Introduction](walkthrough/00-Introduction/README.md) เพื่อทำความเข้าใจพื้นฐาน MCP
2. ทำตามโมดูลตามลำดับเพื่อประสบการณ์การเรียนรู้ที่ครบถ้วน
3. แต่ละโมดูลสร้างขึ้นจากแนวคิดก่อนหน้าและมีแบบฝึกหัดปฏิบัติ

**สำหรับนักพัฒนาที่มีประสบการณ์**:
1. ตรวจสอบ [ภาพรวม Walkthrough หลัก](walkthrough/README.md) เพื่อสรุปโมดูลทั้งหมด
2. ข้ามไปยังโมดูลที่คุณสนใจ (เช่น โมดูล 07 สำหรับการผสาน AI)
3. ใช้โมดูลแต่ละโมดูลเป็นเอกสารอ้างอิงสำหรับโครงการของคุณเอง

**สำหรับการใช้งานในระดับการผลิต**:
1. เน้นที่โมดูล 02 (Security), 10 (Deployment), และ 11 (Monitoring)
2. ตรวจสอบโมดูล 12 (Best Practices) สำหรับแนวทางระดับองค์กร
3. ใช้ตัวอย่างโค้ดเป็นแม่แบบที่พร้อมใช้งานจริง

### 🚀 ตัวเลือกเริ่มต้นอย่างรวดเร็ว

**ตัวเลือก 1: เส้นทางการเรียนรู้แบบครบถ้วน** (แนะนำสำหรับผู้เริ่มต้น)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**ตัวเลือก 2: การใช้งานแบบลงมือปฏิบัติ** (เริ่มต้นสร้างทันที)
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
- มีประสบการณ์พื้นฐานในการเขียนโปรแกรม Python
- คุ้นเคยกับ REST APIs และฐานข้อมูล
- มีความเข้าใจทั่วไปเกี่ยวกับแนวคิด AI/ML
- มีความรู้พื้นฐานเกี่ยวกับการใช้งาน Command-line และ Docker

**ไม่จำเป็น (แต่มีประโยชน์)**:
- มีประสบการณ์กับ MCP มาก่อน (เราจะสอนตั้งแต่เริ่มต้น)
- มีประสบการณ์กับ Azure Cloud (เรามีคำแนะนำทีละขั้นตอน)
- มีความรู้ขั้นสูงเกี่ยวกับ PostgreSQL (เราจะอธิบายเมื่อจำเป็น)

### 💡 เคล็ดลับการเรียนรู้

1. **การเรียนรู้แบบลงมือทำ**: แต่ละโมดูลมีตัวอย่างโค้ดที่สามารถรันและปรับแต่งได้
2. **ความซับซ้อนที่เพิ่มขึ้นทีละขั้น**: แนวคิดจะถูกสร้างขึ้นจากง่ายไปซับซ้อน
3. **บริบทในโลกจริง**: ตัวอย่างทั้งหมดใช้สถานการณ์ธุรกิจค้าปลีกที่สมจริง
4. **พร้อมใช้งานในโปรดักชัน**: ตัวอย่างโค้ดออกแบบมาเพื่อการใช้งานจริง
5. **การสนับสนุนจากชุมชน**: เข้าร่วม [ชุมชน Discord](https://discord.com/invite/ByRwuEEgH4) ของเราเพื่อขอความช่วยเหลือและพูดคุย

### 🔗 แหล่งข้อมูลที่เกี่ยวข้อง

- **[MCP สำหรับผู้เริ่มต้น](https://aka.ms/mcp-for-beginners)**: การอ่านพื้นฐานที่จำเป็น
- **[ตัวอย่างการทำงาน](Sample_Walkthrough.md)**: ภาพรวมทางเทคนิคในระดับสูง
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: แพลตฟอร์มคลาวด์ที่ใช้ในตัวอย่าง
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: เฟรมเวิร์ก MCP ที่พัฒนาด้วย Python

**พร้อมเริ่มเรียนรู้หรือยัง?** เริ่มต้นด้วย **[โมดูล 00: บทนำ](walkthrough/00-Introduction/README.md)** หรือสำรวจ **[ภาพรวมการทำงานทั้งหมด](walkthrough/README.md)**

## ข้อกำหนดเบื้องต้น

1. ติดตั้ง Docker Desktop
2. ติดตั้ง Git
3. **Azure CLI**: ติดตั้งและยืนยันตัวตนด้วย Azure CLI
4. เข้าถึงโมเดล OpenAI `text-embedding-3-small` และ (ถ้ามี) โมเดล `gpt-4o-mini`

## เริ่มต้นใช้งาน

เปิดหน้าต่างเทอร์มินัลและรันคำสั่งต่อไปนี้:

1. ยืนยันตัวตนด้วย Azure CLI

    ```bash
    az login
    ```

2. โคลน repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. ไปยังไดเรกทอรีโปรเจกต์

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### การปรับใช้ทรัพยากร Azure

รันสคริปต์ต่อไปนี้เพื่อปรับใช้ทรัพยากร Azure ที่จำเป็นสำหรับเซิร์ฟเวอร์ MCP โดยอัตโนมัติ

สคริปต์การปรับใช้จะติดตั้งโมเดล `text-embedding-3-small` โดยอัตโนมัติ ในระหว่างการปรับใช้ คุณสามารถเลือกที่จะรวมโมเดล `gpt-4o-mini` ได้ด้วย โปรดทราบว่า `gpt-4o-mini` **ไม่จำเป็น** สำหรับโปรเจกต์นี้และรวมไว้เพื่อการพัฒนาต่อในอนาคต

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

วิธีที่ง่ายที่สุดในการรันสแต็กทั้งหมด (PostgreSQL + MCP Server) คือการใช้ Docker Compose:

### เริ่มต้นสแต็ก

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

ต่อไปนี้สมมติว่าคุณจะใช้การสนับสนุนเซิร์ฟเวอร์ MCP ที่มีอยู่ใน VS Code

1. เปิดโปรเจกต์ใน VS Code จากเทอร์มินัล รัน:

    ```bash
    code .
    ```

2. เริ่มเซิร์ฟเวอร์ MCP หนึ่งตัวหรือมากกว่าด้วยการตั้งค่าใน `.vscode/mcp.json` ไฟล์นี้มีการตั้งค่าเซิร์ฟเวอร์สี่แบบที่แสดงถึงบทบาทของผู้จัดการร้านที่แตกต่างกัน:

   - การตั้งค่าแต่ละแบบใช้ RLS (Row Level Security) user ID ที่ไม่ซ้ำกัน
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

1. แสดง 20 สินค้าที่มียอดขายสูงสุดตามรายได้
2. แสดงยอดขายตามร้านค้า
3. ยอดขายในไตรมาสที่แล้วแบ่งตามหมวดหมู่คืออะไร?
4. สินค้าใดที่เราขายที่คล้ายกับ "ภาชนะสำหรับสี"

## คุณสมบัติ

- **การเข้าถึงหลายตาราง**: ดึงข้อมูล schema ของหลายตารางในคำขอเดียว
- **การรันคำสั่ง SQL อย่างปลอดภัย**: รันคำสั่ง PostgreSQL พร้อมการสนับสนุน RLS
- **ข้อมูลเรียลไทม์**: เข้าถึงข้อมูลการขาย สินค้าคงคลัง และลูกค้าในปัจจุบัน
- **เครื่องมือจัดการวันที่/เวลา**: รับ timestamp UTC ปัจจุบันสำหรับการวิเคราะห์ที่อ่อนไหวต่อเวลา
- **การปรับใช้ที่ยืดหยุ่น**: รองรับโหมด HTTP server

## ตารางที่รองรับ

เซิร์ฟเวอร์ให้การเข้าถึงตารางฐานข้อมูลค้าปลีกดังต่อไปนี้:

- `retail.customers` - ข้อมูลและโปรไฟล์ลูกค้า
- `retail.stores` - ตำแหน่งและรายละเอียดของร้านค้า
- `retail.categories` - หมวดหมู่สินค้าและลำดับชั้น
- `retail.product_types` - การจัดประเภทประเภทสินค้า
- `retail.products` - แคตตาล็อกสินค้าและข้อมูลจำเพาะ
- `retail.orders` - คำสั่งซื้อและธุรกรรมของลูกค้า
- `retail.order_items` - รายการสินค้าในคำสั่งซื้อ
- `retail.inventory` - ระดับสินค้าคงคลังและข้อมูลสต็อก

## เครื่องมือที่มีให้

### `get_multiple_table_schemas`

ดึง schema ของฐานข้อมูลสำหรับหลายตารางในคำขอเดียว

**พารามิเตอร์:**

- `table_names` (list[str]): รายชื่อของชื่อตารางที่ถูกต้องจากตารางที่รองรับด้านบน

**ผลลัพธ์:** สตริง schema ที่รวมกันสำหรับตารางที่ร้องขอ

### `execute_sales_query`

รันคำสั่ง PostgreSQL กับฐานข้อมูลการขายพร้อมการสนับสนุน Row Level Security

**พารามิเตอร์:**

- `postgresql_query` (str): คำสั่ง PostgreSQL ที่ถูกต้อง

**ผลลัพธ์:** ผลลัพธ์ของคำสั่งในรูปแบบสตริง (จำกัดที่ 20 แถวเพื่อให้อ่านง่าย)

**แนวทางปฏิบัติที่ดีที่สุด:**

- ดึง schema ของตารางก่อนเสมอ
- ใช้ชื่อคอลัมน์ที่ถูกต้องจาก schema
- เชื่อมโยงตารางที่เกี่ยวข้องเพื่อการวิเคราะห์ที่ครอบคลุม
- รวมผลลัพธ์เมื่อเหมาะสม
- จำกัดผลลัพธ์เพื่อให้อ่านง่าย

### `get_current_utc_date`

รับวันที่และเวลาปัจจุบันในรูปแบบ ISO

**ผลลัพธ์:** วันที่/เวลาปัจจุบันในรูปแบบ ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

ค้นหาสินค้าโดยใช้การค้นหาเชิงความหมายตามคำค้นหาของผู้ใช้

**ผลลัพธ์:** รายการสินค้าที่ตรงกับเกณฑ์การค้นหา

**พารามิเตอร์:**

- `query` (str): สตริงคำค้นหา

**ผลลัพธ์:** รายการสินค้าที่ตรงกับเกณฑ์การค้นหา

## คุณสมบัติด้านความปลอดภัย

### Row Level Security (RLS)

เซิร์ฟเวอร์ใช้ Row Level Security เพื่อให้แน่ใจว่าผู้ใช้เข้าถึงเฉพาะข้อมูลที่พวกเขาได้รับอนุญาตให้ดู:

- **โหมด HTTP**: ใช้ header `x-rls-user-id` เพื่อระบุผู้ใช้ที่ร้องขอ
- **ค่าเริ่มต้น**: ใช้ UUID placeholder เมื่อไม่มี user ID

#### RLS User ID เฉพาะร้านค้า

แต่ละสาขาของ Zava Retail มี RLS User ID เฉพาะที่กำหนดว่าผู้ใช้สามารถเข้าถึงข้อมูลใดได้:

| สาขา | RLS User ID | คำอธิบาย |
|---------------|-------------|-------------|
| **การเข้าถึงทั่วโลก** | `00000000-0000-0000-0000-000000000000` | ค่าเริ่มต้น - เข้าถึงทุกสาขา |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | ข้อมูลสาขา Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | ข้อมูลสาขา Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | ข้อมูลสาขา Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | ข้อมูลสาขา Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | ข้อมูลสาขา Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | ข้อมูลสาขา Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | ข้อมูลสาขา Kirkland |
| **ออนไลน์** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | ข้อมูลร้านค้าออนไลน์ |

#### การใช้งาน RLS

เมื่อผู้ใช้เชื่อมต่อด้วย RLS User ID ของสาขาเฉพาะ พวกเขาจะเห็นเฉพาะ:

- ลูกค้าที่เกี่ยวข้องกับสาขานั้น
- คำสั่งซื้อที่ทำในสาขานั้น
- ข้อมูลสินค้าคงคลังสำหรับสาขานั้น
- เมตริกการขายและประสิทธิภาพเฉพาะสาขา

สิ่งนี้ช่วยให้ข้อมูลของแต่ละสาขาแยกออกจากกันในขณะที่ยังคงใช้ schema ฐานข้อมูลเดียวกัน

## สถาปัตยกรรม

### บริบทของแอปพลิเคชัน

เซิร์ฟเวอร์ใช้บริบทแอปพลิเคชันที่จัดการด้วย:

- **Database Connection Pool**: การจัดการการเชื่อมต่อที่มีประสิทธิภาพสำหรับโหมด HTTP
- **Lifecycle Management**: การทำความสะอาดทรัพยากรอย่างเหมาะสมเมื่อปิดระบบ
- **Type Safety**: บริบทที่มีการพิมพ์อย่างเข้มงวดด้วย dataclass `AppContext`

### บริบทของคำขอ

- **Header Extraction**: การแยก header อย่างปลอดภัยเพื่อระบุผู้ใช้
- **RLS Integration**: การแก้ไข user ID อัตโนมัติจากบริบทของคำขอ
- **Error Handling**: การจัดการข้อผิดพลาดอย่างครอบคลุมพร้อมข้อความที่เข้าใจง่าย

## การผสานรวมฐานข้อมูล

เซิร์ฟเวอร์ผสานรวมกับฐานข้อมูล PostgreSQL ผ่านคลาส `PostgreSQLSchemaProvider`:

- **Connection Pooling**: ใช้ async connection pool เพื่อรองรับการขยายตัว
- **Schema Metadata**: ให้ข้อมูล schema ตารางโดยละเอียด
- **Query Execution**: การรันคำสั่งอย่างปลอดภัยพร้อมการสนับสนุน RLS
- **Resource Management**: การทำความสะอาดทรัพยากรฐานข้อมูลโดยอัตโนมัติ

## การจัดการข้อผิดพลาด

เซิร์ฟเวอร์มีการจัดการข้อผิดพลาดที่แข็งแกร่ง:

- **Table Validation**: ตรวจสอบให้แน่ใจว่าเข้าถึงเฉพาะชื่อตารางที่ถูกต้อง
- **Query Validation**: ตรวจสอบคำสั่ง PostgreSQL ก่อนการรัน
- **Resource Management**: การทำความสะอาดอย่างเหมาะสมแม้ในระหว่างข้อผิดพลาด
- **User-Friendly Messages**: ข้อความข้อผิดพลาดที่ชัดเจนสำหรับการแก้ไขปัญหา

## การพิจารณาด้านความปลอดภัย

1. **Row Level Security**: คำสั่งทั้งหมดเคารพนโยบาย RLS ตามตัวตนของผู้ใช้
2. **การแยกข้อมูลร้านค้า**: RLS User ID ของแต่ละร้านช่วยให้เข้าถึงเฉพาะข้อมูลของร้านนั้น
3. **การตรวจสอบอินพุต**: ชื่อตารางและคำสั่งได้รับการตรวจสอบก่อนการรัน
4. **ข้อจำกัดทรัพยากร**: จำกัดผลลัพธ์ของคำสั่งเพื่อป้องกันการใช้ทรัพยากรมากเกินไป
5. **ความปลอดภัยของการเชื่อมต่อ**: ใช้แนวทางปฏิบัติที่ปลอดภัยในการเชื่อมต่อฐานข้อมูล
6. **การยืนยันตัวตนผู้ใช้**: ตรวจสอบให้แน่ใจเสมอว่าใช้ RLS User ID ที่ถูกต้องสำหรับร้านค้าที่ตั้งใจ

### หมายเหตุด้านความปลอดภัยที่สำคัญ

- **อย่าใช้ RLS User ID สำหรับโปรดักชันในสภาพแวดล้อมการพัฒนา**
- **ตรวจสอบเสมอว่า RLS User ID ตรงกับร้านค้าที่ตั้งใจก่อนรันคำสั่ง**
- **UUID เริ่มต้น (`00000000-0000-0000-0000-000000000000`) ให้การเข้าถึงที่จำกัด**
- **ผู้จัดการร้านแต่ละคนควรเข้าถึงเฉพาะ RLS User ID ของร้านตนเอง**

## การพัฒนา

### โครงสร้างโปรเจกต์

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### ส่วนประกอบสำคัญ

- **FastMCP Server**: การใช้งานเซิร์ฟเวอร์ MCP สมัยใหม่พร้อมการสนับสนุน async
- **PostgreSQL Provider**: เลเยอร์นามธรรมของฐานข้อมูลพร้อมการสนับสนุน RLS
- **Context Management**: การจัดการบริบทของแอปพลิเคชันและคำขอที่ปลอดภัย
- **Tool Registration**: การลงทะเบียนเครื่องมือแบบประกาศด้วยการตรวจสอบ Pydantic

## การมีส่วนร่วม

เมื่อมีส่วนร่วมในเซิร์ฟเวอร์นี้:

1. ตรวจสอบให้แน่ใจว่าคำสั่งฐานข้อมูลทั้งหมดเคารพ Row Level Security
2. เพิ่มการจัดการข้อผิดพลาดที่เหมาะสมสำหรับเครื่องมือใหม่
3. อัปเดต README นี้ด้วยคุณสมบัติหรือการเปลี่ยนแปลงใหม่
4. ทดสอบโหมด HTTP server
5. ตรวจสอบพารามิเตอร์อินพุตและให้ข้อความข้อผิดพลาดที่ชัดเจน

## [ลิขสิทธิ์](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*เซิร์ฟเวอร์ MCP นี้ช่วยให้เข้าถึงข้อมูลการขายของ Zava Retail ได้อย่างปลอดภัยและมีประสิทธิภาพสำหรับการวิเคราะห์และการให้ข้อมูลเชิงลึกด้วย AI*

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้