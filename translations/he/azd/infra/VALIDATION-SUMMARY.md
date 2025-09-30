<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "20ed201aa472e9936f4e0c5144626011",
  "translation_date": "2025-09-30T12:57:32+00:00",
  "source_file": "azd/infra/VALIDATION-SUMMARY.md",
  "language_code": "he"
}
-->
# אימות תשתית Azure Developer CLI (azd)

## ✅ **סטטוס נוכחי: מוכן ל-azd**

התיקייה `azd\infra` כעת **תואמת לחלוטין** לפריסה באמצעות Azure Developer CLI. כל הקבצים הנדרשים נוצרו והוגדרו.

### 📁 **מבנה azd מלא**
```
azd/
├── azure.yaml                       ✅ Main azd configuration
├── infra/
│   ├── main.bicep                   ✅ Subscription-scoped Bicep template
│   ├── main.parameters.json         ✅ Parameters with azd variables
│   ├── modules/
│   │   ├── main-resources.bicep     ✅ Core infrastructure module
│   │   └── container-app-environment.bicep ✅ Container Apps environment
│   ├── azuredeploy.json            📄 Legacy ARM template (backup)
│   ├── azuredeploy.parameters.json  📄 Legacy parameters (backup)
│   ├── ARM-DEPLOYMENT.md           📄 ARM deployment documentation
│   ├── README.md                   📄 Infrastructure overview
│   └── VALIDATION-SUMMARY.md       📝 This file
```

### ✅ **רכיבי Azure Developer CLI**

#### 1. `azure.yaml` ✅ **מוכן**
- **מיקום**: `azd/azure.yaml`
- **מטרה**: קובץ הקונפיגורציה הראשי של azd
- **סטטוס**: ✅ נוצר והוגדר
- **מאפיינים**:
  - הגדרת שירות לשרת MCP
  - תצורת אירוח Container App
  - מיפוי משתני סביבה
  - Hooks לפריסה לניהול מחזור חיים

#### 2. **תשתית Bicep** ✅ **מוכן**
- **תבנית ראשית**: `main.bicep` (ברמת המנוי)
- **פרמטרים**: `main.parameters.json` עם משתני azd
- **מודולים**: ארכיטקטורת Bicep מודולרית
- **סטטוס**: ✅ פריסת תשתית מלאה

#### 3. **תצורת שירות** ✅ **מוכן**
- **שרת MCP**: פריסת Container App מוכנה
- **Docker**: קובץ Dockerfile קיים ומוגדר
- **משתני סביבה**: אינטגרציה עם Azure AI Services
- **ניטור**: Application Insights מחובר

### 🚀 **מוכן לפריסה עם azd**

כעת ניתן לפרוס באמצעות Azure Developer CLI:

```bash
# Initialize azd environment (first time only)
cd azd
azd env new <environment-name>

# Set required parameters
azd env set AZURE_LOCATION westus2

# Deploy infrastructure and application
azd up
```

### 🎯 **משאבים שייפרסו**

הפריסה עם azd תיצור:

#### **תשתית** 
- ✅ קבוצת משאבים (`rg-<env-name>`)
- ✅ Log Analytics Workspace
- ✅ Application Insights
- ✅ Azure AI Services (Foundry)
- ✅ פריסות מודלים של OpenAI:
  - GPT-4o-mini
  - text-embedding-3-small
- ✅ סביבה ל-Container App

#### **אפליקציה**
- ✅ שרת MCP (Container App)
- ✅ בדיקות בריאות מופעלות
- ✅ ניטור מחובר
- ✅ משתני סביבה מוגדרים

### 📊 **azd לעומת פריסה ידנית**

| מאפיין | azd `/azd` | ידני `/infra` |
|---------|------------|-----------------|
| **סטטוס** | ✅ מוכן ומלא | ✅ עובד |
| **תבנית** | מודולי Bicep | מודולי Bicep |
| **פריסה** | אוטומציה `azd up` | סקריפטים ידניים |
| **סביבה** | משתני סביבה אוטומטיים | הגדרה ידנית |
| **שירותים** | Container Apps | תשתית בלבד |
| **תצורה** | מלאה עם שירותים | ממוקדת בתשתית |

### 🛠️ **משתני סביבה**

azd יגדיר אוטומטית את משתני הפלט הבאים:

```bash
AZURE_RESOURCE_GROUP=rg-<env-name>
AZURE_LOCATION=<location>
AZURE_OPENAI_ENDPOINT=<foundry-endpoint>
AZURE_OPENAI_API_KEY=<foundry-key>
AZURE_OPENAI_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME=text-embedding-3-small
APPLICATIONINSIGHTS_CONNECTION_STRING=<insights-connection>
```

### 🚨 **סיכום אימות**

- **azure.yaml**: ✅ נוצר והוגדר
- **תבניות Bicep**: ✅ ארכיטקטורה מודולרית מלאה
- **קובץ פרמטרים**: ✅ משתנים תואמי azd
- **הגדרת שירות**: ✅ Container App מוכן
- **תצורת Docker**: ✅ שימוש בקובץ Dockerfile קיים
- **משתני סביבה**: ✅ אינטגרציה עם Azure AI Services
- **מוכן ל-azd**: ✅ **כן - תואם לחלוטין**

**המלצה**: השתמשו ב-`azd up` לפריסה אוטומטית מלאה הכוללת גם תשתית וגם שירותי אפליקציה.

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס AI [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או פירושים שגויים הנובעים משימוש בתרגום זה.