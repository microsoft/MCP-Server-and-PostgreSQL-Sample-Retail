<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T22:11:23+00:00",
  "source_file": "README.md",
  "language_code": "he"
}
-->
# MCP Server ודוגמה ל-PostgreSQL - ניתוח מכירות קמעונאיות

## למדו על MCP עם שילוב מסדי נתונים באמצעות דוגמאות מעשיות

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)  
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)  
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)  
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)  

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)  

עקבו אחר השלבים הבאים כדי להתחיל להשתמש במשאבים אלו:

1. **פיצול הריפוזיטורי**: לחצו [כאן לפיצול](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)  
2. **שכפול הריפוזיטורי**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`  
3. **הצטרפו ל-Discord של Azure AI Foundry**: [פגשו מומחים ומפתחים נוספים](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 תמיכה רב-לשונית

#### נתמך באמצעות GitHub Action (אוטומטי ותמיד מעודכן)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](./README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**אם תרצו להוסיף שפות נוספות, רשימת השפות הנתמכות נמצאת [כאן](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## מבוא

דוגמה זו מדגימה כיצד לבנות ולפרוס **שרת Model Context Protocol (MCP)** שמספק לעוזרים מבוססי AI גישה חכמה ומאובטחת לנתוני מכירות קמעונאיות באמצעות PostgreSQL. הפרויקט מציג תכונות ברמה ארגונית כמו **אבטחת רמות שורה (RLS)**, **יכולות חיפוש סמנטי**, ו**אינטגרציה עם Azure AI** עבור תרחישי ניתוח קמעונאות בעולם האמיתי.

**שימושים מרכזיים:**
- **ניתוח מכירות מבוסס AI**: אפשרו לעוזרים מבוססי AI לשאול ולנתח נתוני מכירות קמעונאיות בשפה טבעית  
- **גישה מאובטחת רב-שוכנים**: הדגימו יישום אבטחת רמות שורה שבו מנהלי חנויות שונים יכולים לגשת רק לנתוני החנות שלהם  
- **חיפוש סמנטי למוצרים**: הציגו גילוי מוצרים משופר באמצעות טקסט מוטמע  
- **אינטגרציה ארגונית**: הדגימו כיצד לשלב שרתי MCP עם שירותי Azure ומסדי נתונים PostgreSQL  

**מתאים ל:**
- מפתחים הלומדים לבנות שרתי MCP עם שילוב מסדי נתונים  
- מהנדסי נתונים המיישמים פתרונות ניתוח מאובטחים רב-שוכנים  
- מפתחי אפליקציות AI העובדים עם נתוני קמעונאות או מסחר אלקטרוני  
- כל מי שמעוניין לשלב עוזרים מבוססי AI עם מסדי נתונים ארגוניים  

## הצטרפו לקהילת Discord של Azure AI Foundry  
שתפו את חוויותיכם עם MCP ופגשו מומחים וקבוצות מוצר  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

# שרת MCP לניתוח מכירות  

שרת Model Context Protocol (MCP) המספק גישה מקיפה למסד נתוני מכירות לקוחות עבור עסק Zava Retail DIY. שרת זה מאפשר לעוזרים מבוססי AI לשאול ולנתח נתוני מכירות קמעונאיות באמצעות ממשק מאובטח ומודע לסכמות.  

## 📚 מדריך יישום מלא  

לניתוח מפורט של איך הפתרון הזה נבנה ואיך ליישם שרתי MCP דומים, עיינו במדריך **[Sample Walkthrough](Sample_Walkthrough.md)**. מדריך זה מספק:  

- **ניתוח ארכיטקטורה**: ניתוח רכיבים ודפוסי עיצוב  
- **בניית שלב-אחר-שלב**: מהגדרת הפרויקט ועד לפריסה  
- **פירוט קוד**: הסבר מפורט על יישום שרת MCP  
- **תכונות מתקדמות**: אבטחת רמות שורה, חיפוש סמנטי ומעקב  
- **שיטות עבודה מומלצות**: אבטחה, ביצועים והנחיות פיתוח  
- **פתרון בעיות**: בעיות נפוצות ופתרונות  

מתאים למפתחים שרוצים להבין את פרטי היישום ולבנות פתרונות דומים.  

## 🤖 מהו MCP (Model Context Protocol)?  

**Model Context Protocol (MCP)** הוא תקן פתוח שמאפשר לעוזרים מבוססי AI לגשת בצורה מאובטחת למקורות נתונים וכלים חיצוניים בזמן אמת. חשבו עליו כגשר שמאפשר למודלים AI להתחבר למסדי נתונים, APIs, מערכות קבצים ומשאבים אחרים תוך שמירה על אבטחה ושליטה.  

### יתרונות מרכזיים:  
- **גישה לנתונים בזמן אמת**: עוזרים מבוססי AI יכולים לשאול מסדי נתונים ו-APIs חיים  
- **אינטגרציה מאובטחת**: גישה מבוקרת עם אימות והרשאות  
- **הרחבת כלים**: הוספת יכולות מותאמות אישית לעוזרים מבוססי AI  
- **פרוטוקול סטנדרטי**: עובד עם פלטפורמות וכלי AI שונים  

### חדש ב-MCP?  

אם אתם חדשים ב-Model Context Protocol, אנו ממליצים להתחיל עם משאבי המתחילים המקיפים של Microsoft:  

**📖 [מדריך MCP למתחילים](https://aka.ms/mcp-for-beginners)**  

משאב זה מספק:  
- מבוא למושגי MCP וארכיטקטורה  
- מדריכים שלב-אחר-שלב לבניית שרת MCP ראשון  
- שיטות עבודה מומלצות לפיתוח MCP  
- דוגמאות אינטגרציה עם פלטפורמות AI פופולריות  
- משאבי קהילה ותמיכה  

לאחר שתבינו את הבסיס, חזרו לכאן כדי לחקור את יישום ניתוח הקמעונאות המתקדם הזה!  

## 📚 מדריך למידה מקיף: /walkthrough  

ריפוזיטורי זה כולל **מדריך למידה בן 12 מודולים** שמפרק את דוגמת שרת MCP הקמעונאי הזה לשיעורים מעשיים, שלב-אחר-שלב. המדריך הופך את הדוגמה העובדת הזו למשאב חינוכי מקיף, מושלם למפתחים שרוצים להבין כיצד לבנות שרתי MCP מוכנים לייצור עם שילוב מסדי נתונים.  

### מה תלמדו  

המדריך מכסה הכל, ממושגי MCP בסיסיים ועד לפריסה מתקדמת בייצור, כולל:  

- **יסודות MCP**: הבנת Model Context Protocol ויישומיו בעולם האמיתי  
- **שילוב מסדי נתונים**: יישום חיבור מאובטח ל-PostgreSQL עם אבטחת רמות שורה  
- **תכונות משופרות AI**: הוספת יכולות חיפוש סמנטי עם הטמעות Azure OpenAI  
- **יישום אבטחה**: אימות, הרשאה ובידוד נתונים ברמה ארגונית  
- **פיתוח כלים**: בניית כלים מתוחכמים לניתוח נתונים ומודיעין עסקי  
- **בדיקות וניפוי שגיאות**: אסטרטגיות בדיקה מקיפות וטכניקות ניפוי שגיאות  
- **אינטגרציה עם VS Code**: הגדרת AI Chat לשאילתות מסדי נתונים בשפה טבעית  
- **פריסה בייצור**: קונטיינריזציה, סקיילינג ואסטרטגיות פריסה בענן  
- **מעקב ותצפיות**: Application Insights, לוגים ומעקב ביצועים  

### סקירת מסלול הלמידה  

המדריך עוקב אחר מבנה למידה מתקדם המיועד למפתחים בכל רמות המיומנות:  

| מודול | תחום מיקוד | תיאור | הערכת זמן |  
|-------|------------|--------|-----------|  
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | יסודות | מושגי MCP, מחקר מקרה Zava Retail, סקירת ארכיטקטורה | 30 דקות |  
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | דפוסי עיצוב | ארכיטקטורה טכנית, עיצוב שכבות, רכיבי מערכת | 45 דקות |  
| **[02-Security](walkthrough/02-Security/README.md)** | אבטחה ארגונית | אימות Azure, אבטחת רמות שורה, בידוד רב-שוכנים | 60 דקות |  
| **[03-Setup](walkthrough/03-Setup/README.md)** | סביבה | הגדרת Docker, Azure CLI, תצורת פרויקט, אימות | 45 דקות |  
| **[04-Database](walkthrough/04-Database/README.md)** | שכבת נתונים | סכמת PostgreSQL, pgvector, מדיניות RLS, נתוני דוגמה | 60 דקות |  
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | יישום ליבה | מסגרת FastMCP, שילוב מסדי נתונים, ניהול חיבורים | 90 דקות |  
| **[06-Tools](walkthrough/06-Tools/README.md)** | פיתוח כלים | יצירת כלי MCP, אימות שאילתות, תכונות מודיעין עסקי | 75 דקות |  
| **[07-Semantic-Search](walkthrough/07-Semantic-Search/README.md)** | אינטגרציית AI | הטמעות Azure OpenAI, חיפוש וקטורי, אסטרטגיות חיפוש היברידיות | 60 דקות |  
| **[08-Testing](walkthrough/08-Testing/README.md)** | הבטחת איכות | בדיקות יחידה, בדיקות אינטגרציה, בדיקות ביצועים, ניפוי שגיאות | 75 דקות |  
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | חוויית פיתוח | תצורת VS Code, אינטגרציית AI Chat, תהליכי ניפוי שגיאות | 45 דקות |  
| **[10-Deployment](walkthrough/10-Deployment/README.md)** | מוכנות לייצור | קונטיינריזציה, Azure Container Apps, צינורות CI/CD, סקיילינג | 90 דקות |  
| **[11-Monitoring](walkthrough/11-Monitoring/README.md)** | תצפיות | Application Insights, לוגים מובנים, מדדי ביצועים | 60 דקות |  
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | מצוינות בייצור | חיזוק אבטחה, אופטימיזציית ביצועים, דפוסים ארגוניים | 45 דקות |  

**זמן למידה כולל**: ~12-15 שעות של למידה מעשית מקיפה  

### 🎯 כיצד להשתמש במדריך  

**למתחילים**:  
1. התחילו עם [מודול 00: מבוא](walkthrough/00-Introduction/README.md) כדי להבין את יסודות MCP  
2. עקבו אחר המודולים בסדר רציף לחוויית למידה מלאה  
3. כל מודול בונה על מושגים קודמים וכולל תרגילים מעשיים  

**למפתחים מנוסים**:  
1. עיינו ב[סקירת המדריך הראשי](walkthrough/README.md) לסיכום מודולים מלא  
2. עברו ישירות למודולים שמעניינים אתכם (לדוגמה, מודול 07 לאינטגרציית AI)  
3. השתמשו במודולים בודדים כחומר עזר לפרויקטים שלכם  

**ליישום בייצור**:  
1. התמקדו במודולים 02 (אבטחה), 10 (פריסה) ו-11 (מעקב)  
2. עיינו במודול 12 (שיטות עבודה מומלצות) להנחיות ארגוניות  
3. השתמשו בדוגמאות הקוד כתבניות מוכנות לייצור  

### 🚀 אפשרויות התחלה מהירה  

**אפשרות 1: מסלול למידה מלא** (מומלץ למתחילים)  
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```
  
**אפשרות 2: יישום מעשי** (התחילו מיד בבנייה)  
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```
  
**אפשרות 3: מיקוד בייצור** (פריסה ארגונית)  
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```
  
### 📋 דרישות מקדימות ללמידה

**רקע מומלץ**:
- ניסיון בסיסי בתכנות ב-Python
- היכרות עם REST APIs ומאגרי נתונים
- הבנה כללית של מושגים בתחום AI/ML
- ידע בסיסי בשורת הפקודה וב-Docker

**לא חובה (אבל מועיל)**:
- ניסיון קודם עם MCP (אנחנו מכסים את זה מההתחלה)
- ניסיון בענן Azure (אנחנו מספקים הדרכה שלב אחר שלב)
- ידע מתקדם ב-PostgreSQL (אנחנו מסבירים את המושגים לפי הצורך)

### 💡 טיפים ללמידה

1. **גישה מעשית**: כל מודול כולל דוגמאות קוד שניתן להריץ ולשנות
2. **מורכבות מתקדמת**: המושגים נבנים בהדרגה מפשוט למתקדם
3. **הקשר מעשי**: כל הדוגמאות משתמשות בתרחישים עסקיים מציאותיים בתחום הקמעונאות
4. **מוכן לייצור**: דוגמאות הקוד מיועדות לשימוש בפועל בסביבת ייצור
5. **תמיכה קהילתית**: הצטרפו לקהילת [Discord שלנו](https://discord.com/invite/ByRwuEEgH4) לקבלת עזרה ודיונים

### 🔗 משאבים קשורים

- **[MCP למתחילים](https://aka.ms/mcp-for-beginners)**: קריאה רקע חיונית
- **[סקירה לדוגמה](Sample_Walkthrough.md)**: סקירה טכנית ברמה גבוהה
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: פלטפורמת ענן המשמשת בדוגמאות
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: מסגרת MCP ב-Python

**מוכנים להתחיל ללמוד?** התחילו עם **[מודול 00: מבוא](walkthrough/00-Introduction/README.md)** או חקרו את **[סקירת ההדרכה המלאה](walkthrough/README.md)**.

## דרישות מקדימות

1. התקנת Docker Desktop
2. התקנת Git
3. **Azure CLI**: התקינו ואמתו את עצמכם עם Azure CLI
4. גישה למודל OpenAI `text-embedding-3-small` ובאופן אופציונלי למודל `gpt-4o-mini`.

## התחלת עבודה

פתחו חלון טרמינל והריצו את הפקודות הבאות:

1. אימות עם Azure CLI

    ```bash
    az login
    ```

2. שיבוט המאגר

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. מעבר לתיקיית הפרויקט

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### פריסת משאבי Azure

הריצו את הסקריפטים הבאים כדי לבצע אוטומציה של פריסת משאבי Azure הנדרשים לשרת MCP.

סקריפטי הפריסה יפרסו באופן אוטומטי את מודל `text-embedding-3-small`. במהלך הפריסה, תהיה לכם אפשרות לכלול גם את מודל `gpt-4o-mini`. שימו לב שמודל `gpt-4o-mini` **אינו נדרש** לפרויקט זה והוא נכלל רק לשיפורים עתידיים אפשריים.

**בחרו את הסקריפט המתאים לפלטפורמה שלכם:**

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

## הפעלת שרת MCP

הדרך הקלה ביותר להפעיל את כל הסטאק (PostgreSQL + שרת MCP) היא באמצעות Docker Compose:

### הפעלת הסטאק

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

## שימוש

ההנחיות הבאות מניחות שתשתמשו בתמיכה המובנית של שרת MCP ב-VS Code.

1. פתחו את הפרויקט ב-VS Code. מהטרמינל, הריצו:

    ```bash
    code .
    ```

2. הפעילו שרת MCP אחד או יותר באמצעות התצורות ב-`.vscode/mcp.json`. הקובץ מכיל ארבע תצורות שרת שונות, שכל אחת מייצגת תפקיד מנהל חנות שונה:

   - כל תצורה משתמשת ב-RLS (Row Level Security) עם מזהה משתמש ייחודי
   - מזהי המשתמשים הללו מדמים זהויות שונות של מנהלי חנויות הניגשים למאגר הנתונים
   - מערכת RLS מגבילה את הגישה לנתונים בהתאם לחנות שהוקצתה למנהל
   - הדבר מדמה תרחישים מציאותיים שבהם מנהלי חנויות מתחברים עם חשבונות Entra ID שונים

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

### פתיחת AI Chat ב-VS Code

1. פתחו מצב AI Chat ב-VS Code
2. הקלידו **#zava** ובחרו אחד משרתי MCP שהפעלתם
3. שאלו שאלות על נתוני המכירות - ראו דוגמאות לשאילתות למטה

### דוגמאות לשאילתות

1. הצג את 20 המוצרים המובילים לפי הכנסות ממכירות
1. הצג מכירות לפי חנות
1. מה היו מכירות הרבעון האחרון לפי קטגוריה?
1. אילו מוצרים אנחנו מוכרים שדומים ל"כלי אחסון לצבע"

## תכונות

- **גישה לסכמות של טבלאות מרובות**: שליפת סכמות של טבלאות מרובות במאגר נתונים בבקשה אחת
- **ביצוע שאילתות מאובטח**: ביצוע שאילתות PostgreSQL עם תמיכה ב-RLS
- **נתונים בזמן אמת**: גישה לנתוני מכירות, מלאי ולקוחות עדכניים
- **כלי תאריך/זמן**: קבלת חותמות זמן UTC עדכניות לניתוחים רגישים לזמן
- **פריסה גמישה**: תומך במצב שרת HTTP

## טבלאות נתמכות

השרת מספק גישה לטבלאות מאגר הנתונים הקמעונאי הבאות:

- `retail.customers` - מידע ופרופילים של לקוחות
- `retail.stores` - מיקומי חנויות ופרטים
- `retail.categories` - קטגוריות מוצרים והיררכיות
- `retail.product_types` - סיווגי סוגי מוצרים
- `retail.products` - קטלוג מוצרים ומפרטים
- `retail.orders` - הזמנות ועסקאות של לקוחות
- `retail.order_items` - פריטים בודדים בתוך הזמנות
- `retail.inventory` - רמות מלאי נוכחיות ונתוני מלאי

## כלים זמינים

### `get_multiple_table_schemas`

שליפת סכמות של טבלאות מרובות בבקשה אחת.

**פרמטרים:**

- `table_names` (list[str]): רשימת שמות טבלאות תקפים מתוך הטבלאות הנתמכות לעיל

**תוצאות:** מחרוזות סכמות משולבות עבור הטבלאות המבוקשות

### `execute_sales_query`

ביצוע שאילתות PostgreSQL מול מאגר נתוני המכירות עם תמיכה ב-RLS.

**פרמטרים:**

- `postgresql_query` (str): שאילתת PostgreSQL תקינה

**תוצאות:** תוצאות השאילתה בפורמט מחרוזת (מוגבלות ל-20 שורות לנוחות קריאה)

**שיטות עבודה מומלצות:**

- תמיד שלפו סכמות טבלאות תחילה
- השתמשו בשמות עמודות מדויקים מתוך הסכמות
- חברו טבלאות קשורות לניתוח מקיף
- בצעו אגרגציה של תוצאות לפי הצורך
- הגבילו את הפלט לנוחות קריאה

### `get_current_utc_date`

קבלת תאריך ושעה נוכחיים ב-UTC בפורמט ISO.

**תוצאות:** תאריך/שעה נוכחיים ב-UTC בפורמט ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

ביצוע חיפוש סמנטי למוצרים על בסיס שאילתות משתמש.

**תוצאות:** רשימת מוצרים התואמים לקריטריוני החיפוש

**פרמטרים:**

- `query` (str): מחרוזת שאילתת החיפוש

**תוצאות:** רשימת מוצרים התואמים לקריטריוני החיפוש

## תכונות אבטחה

### Row Level Security (RLS)

השרת מיישם אבטחת רמת שורה כדי להבטיח שמשתמשים ייגשו רק לנתונים שהם מורשים לראות:

- **מצב HTTP**: משתמש בכותרת `x-rls-user-id` לזיהוי המשתמש המבקש

- **ברירת מחדל**: משתמש ב-UUID placeholder כאשר לא מסופק מזהה משתמש

#### מזהי משתמש RLS ספציפיים לחנות

לכל מיקום חנות של Zava Retail יש מזהה משתמש RLS ייחודי הקובע אילו נתונים המשתמש יכול לגשת אליהם:

| מיקום חנות | מזהה משתמש RLS | תיאור |
|------------|-----------------|--------|
| **גישה גלובלית** | `00000000-0000-0000-0000-000000000000` | ברירת מחדל - גישה לכל החנויות |
| **סיאטל** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | נתוני חנות Zava Retail סיאטל |
| **בלוויו** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | נתוני חנות Zava Retail בלוויו |
| **טקומה** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | נתוני חנות Zava Retail טקומה |
| **ספוקיין** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | נתוני חנות Zava Retail ספוקיין |
| **אוורט** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | נתוני חנות Zava Retail אוורט |
| **רדמונד** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | נתוני חנות Zava Retail רדמונד |
| **קירקלנד** | `9c8b7a65-4321-fed0-9876-543210fedcba` | נתוני חנות Zava Retail קירקלנד |
| **אונליין** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | נתוני חנות Zava Retail אונליין |

#### יישום RLS

כאשר משתמש מתחבר עם מזהה משתמש RLS ספציפי לחנות, הוא יראה רק:

- לקוחות הקשורים לחנות זו
- הזמנות שבוצעו במיקום החנות הזו
- נתוני מלאי עבור החנות הספציפית הזו
- מדדי מכירות וביצועים ספציפיים לחנות

זה מבטיח בידוד נתונים בין מיקומי חנויות שונים תוך שמירה על סכמת מאגר נתונים אחידה.

## ארכיטקטורה

### הקשר יישום

השרת משתמש בהקשר יישום מנוהל עם:

- **מאגר חיבורי מאגר נתונים**: ניהול חיבורים יעיל למצב HTTP
- **ניהול מחזור חיים**: ניקוי משאבים נכון בעת כיבוי
- **בטיחות סוגים**: הקשר מוקלד חזק עם מחלקת `AppContext`

### הקשר בקשה

- **חילוץ כותרות**: ניתוח כותרות מאובטח לזיהוי משתמש
- **אינטגרציית RLS**: פתרון מזהה משתמש אוטומטי מהקשר הבקשה
- **טיפול בשגיאות**: טיפול מקיף בשגיאות עם הודעות ידידותיות למשתמש

## אינטגרציה עם מאגר נתונים

השרת משתלב עם מאגר נתונים PostgreSQL דרך מחלקת `PostgreSQLSchemaProvider`:

- **מאגר חיבורים**: משתמש במאגרי חיבורים אסינכרוניים לצורך יכולת הרחבה
- **מטא-נתוני סכמות**: מספק מידע מפורט על סכמות טבלאות
- **ביצוע שאילתות**: ביצוע שאילתות מאובטח עם תמיכה ב-RLS
- **ניהול משאבים**: ניקוי אוטומטי של משאבי מאגר נתונים

## טיפול בשגיאות

השרת מיישם טיפול בשגיאות חזק:

- **אימות טבלאות**: מבטיח שרק שמות טבלאות תקפים נגישים
- **אימות שאילתות**: מאמת שאילתות PostgreSQL לפני ביצוע
- **ניהול משאבים**: ניקוי נכון גם במהלך שגיאות
- **הודעות ידידותיות למשתמש**: הודעות שגיאה ברורות לצורך פתרון בעיות

## שיקולי אבטחה

1. **אבטחת רמת שורה**: כל השאילתות מכבדות מדיניות RLS בהתבסס על זהות המשתמש
2. **בידוד נתוני חנויות**: מזהה משתמש RLS של כל חנות מבטיח גישה רק לנתוני החנות הזו
3. **אימות קלט**: שמות טבלאות ושאילתות מאומתים לפני ביצוע
4. **מגבלות משאבים**: תוצאות שאילתות מוגבלות כדי למנוע שימוש יתר במשאבים
5. **אבטחת חיבורים**: משתמש בשיטות חיבור מאגר נתונים מאובטחות
6. **אימות זהות משתמש**: תמיד ודאו שמזהה משתמש RLS נכון משמש עבור החנות המיועדת

### הערות אבטחה חשובות

- **לעולם אל תשתמשו במזהי משתמש RLS של ייצור בסביבות פיתוח**
- **תמיד ודאו שמזהה משתמש RLS תואם לחנות המיועדת לפני ביצוע שאילתות**
- **UUID ברירת המחדל (`00000000-0000-0000-0000-000000000000`) מספק גישה מוגבלת**
- **כל מנהל חנות צריך לגשת רק למזהה משתמש RLS של החנות שלו**

## פיתוח

### מבנה הפרויקט

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### רכיבים מרכזיים

- **שרת FastMCP**: יישום שרת MCP מודרני עם תמיכה אסינכרונית
- **ספק PostgreSQL**: שכבת הפשטת מאגר נתונים עם תמיכה ב-RLS
- **ניהול הקשר**: טיפול בהקשר יישום ובקשה מוקלדים
- **רישום כלים**: רישום כלים דקלרטיבי עם אימות Pydantic

## תרומה

בעת תרומה לשרת זה:

1. ודאו שכל שאילתות מאגר הנתונים מכבדות את אבטחת רמת השורה
2. הוסיפו טיפול בשגיאות מתאים לכלים חדשים
3. עדכנו את README זה עם כל תכונה או שינוי חדש
4. בדקו את מצב שרת HTTP
5. אמתו פרמטרי קלט וספקו הודעות שגיאה ברורות

## [רישיון](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*שרת MCP זה מאפשר גישה מאובטחת ויעילה לנתוני מכירות של Zava Retail לצורך ניתוח ותובנות מבוססי AI.*

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.