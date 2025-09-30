<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:29:24+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "he"
}
-->
# תבניות תשתית

תיקייה זו מכילה את תבניות הפריסה של התשתית עבור פרויקט MCP Retail Analytics.

## 📁 סקירת קבצים

| קובץ | תיאור | שימוש |
|------|-------------|----------|
| `azuredeploy.json` | **תבנית ARM** - פריסה מלאה ברמת המנוי | מומלץ לכל הפריסות |
| `azuredeploy.parameters.json` | **פרמטרים של ARM** - ערכי תצורה סטטיים | בשימוש עם `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **מדריך פריסת ARM** - הוראות מפורטות | תיעוד מלא של הפריסה |
| `README.md` | **הקובץ הזה** - סקירת תשתית | עזר מהיר |

## 🚀 אפשרויות פריסה

### אפשרות 1: Azure CLI (מומלץ)
פריסה מלאה עם יצירת קבוצת משאבים:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### אפשרות 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### אפשרות 3: פורטל Azure
1. נווט ל-[פורטל Azure](https://portal.azure.com)
2. חפש "Deploy a custom template"
3. העלה את `azuredeploy.json`
4. הגדר פרמטרים ופרוס

## 🏗️ רכיבי תשתית

תבנית ARM מפריסה את רכיבי התשתית הבאים:

- **קבוצת משאבים**: מיכל לכל המשאבים עם שמות עקביים
- **Log Analytics Workspace**: רישום וניטור מרכזי (שמירה ל-30 יום)
- **Application Insights**: ניטור ביצועי אפליקציות משולב עם Log Analytics
- **Azure AI Services**: מרכז שירותי AI מרובים (רמת S0) עם זהות מנוהלת
- **מודלים של OpenAI**:
  - `gpt-4o-mini` (קיבולת 120) - מודל שיחה והשלמה
  - `text-embedding-3-small` (קיבולת 50) - הטמעות טקסט לחיפוש סמנטי

## 🔧 תצורת תבנית

### פרמטרים
תבנית ARM מקבלת את הפרמטרים הניתנים להתאמה הבאים:

| פרמטר | ברירת מחדל | תיאור |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | קידומת לכל שמות המשאבים |
| `location` | `westus2` | אזור Azure לפריסה |
| `uniqueSuffix` | נוצר אוטומטית | מזהה ייחודי בן 4 תווים |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | שם תצוגה |
| `gptModelCapacity` | `120` | קיבולת אסימונים של מודל GPT |
| `embeddingModelCapacity` | `50` | קיבולת אסימונים של מודל הטמעות |

### מוסכמת שמות משאבים
כל המשאבים עוקבים אחר התבנית: `{type}-{resourcePrefix}-{uniqueSuffix}`

דוגמאות:
- קבוצת משאבים: `rg-mcpretail-demo`
- שירות AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 אימות תבנית

### אימות לפני פריסה
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### בדיקת סטטוס פריסה
```bash
az deployment sub list --output table
```

## 💰 הערכת עלויות

הערכה חודשית לעלויות עומס עבודה בפיתוח:

| שירות | תצורה | עלות משוערת/חודש |
|---------|---------------|-----------------|
| Azure AI Services | רמת S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K אסימונים | $15-30 |
| OpenAI Embeddings | 50K אסימונים | $5-15 |
| Application Insights | ניטור בסיסי | $5-15 |
| Log Analytics | 1GB/חודש | $2-5 |
| **סה"כ** | | **$42-115** |

## 📚 משאבים נוספים

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - מדריך פריסה מפורט עם פתרון בעיות
- [תיעוד תבניות ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [תיעוד שירותי Azure AI](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - תוצאות אימות קבצים

## 🆘 פתרון בעיות מהיר

### בעיות נפוצות
- **אימות**: הרץ `az login` כדי לאמת
- **מגבלות מכסה**: בדוק זמינות מודלים של OpenAI באזור היעד
- **קונפליקטים בשמות**: השתמש בפרמטר `uniqueSuffix` שונה
- **הרשאות**: ודא שלחשבון יש תפקיד Contributor במנוי

### קבלת עזרה
- ראה [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) לפתרון בעיות מפורט
- בדוק יומני פריסה בפורטל Azure
- בקר ב-[GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

להגדרת פרויקט מלאה, ראה את [README הראשי](../../README.md) או [מדריך הפרויקט](../../walkthrough/README.md).

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.