<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:12:54+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "he"
}
-->
# הוראות פריסה של תבנית ARM

מסמך זה מספק הוראות לפריסת תשתית MCP Retail Analytics באמצעות תבנית ARM.

## 📋 סקירה כללית

תבנית `azuredeploy.json` של ARM מספקת פריסה מלאה של:
- קבוצת משאבים ב-Azure  
- Log Analytics Workspace  
- Application Insights  
- שירותי Azure AI (Foundry)  
- פריסות מודלים של OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 אפשרויות פריסה

### אפשרות 1: פריסה באמצעות Azure CLI

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

### אפשרות 2: פריסה באמצעות PowerShell

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

### אפשרות 3: פורטל Azure

1. נווט ל-[פורטל Azure](https://portal.azure.com)  
2. חפש "Deploy a custom template"  
3. לחץ על "Build your own template in the editor"  
4. העתק והדבק את תוכן הקובץ `azuredeploy.json`  
5. לחץ על "Save" ואז "Review + create"  
6. מלא את הפרמטרים הנדרשים ופרוס  

## 🔧 פרמטרים של התבנית

| פרמטר | סוג | ברירת מחדל | תיאור |
|--------|-----|------------|--------|
| `resourcePrefix` | string | `mcpretail` | קידומת לשמות המשאבים |
| `location` | string | `westus2` | אזור Azure לפריסה |
| `uniqueSuffix` | string | נוצר אוטומטית | מזהה ייחודי בן 4 תווים |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | שם תצוגה לפרויקט AI |
| `aiProjectDescription` | string | תיאור הפרויקט | תיאור שמוצג ב-Azure AI Foundry |
| `gptModelCapacity` | int | `120` | קיבולת טוקנים למודל GPT |
| `embeddingModelCapacity` | int | `50` | קיבולת טוקנים למודל embedding |
| `tags` | object | תגיות ברירת מחדל | תגיות משאבים לניהול |

## 📤 פלטי התבנית

התבנית מספקת את הפלטים הבאים:

| פלט | תיאור |
|-----|-------|
| `subscriptionId` | מזהה המנוי ב-Azure |
| `resourceGroupName` | שם קבוצת המשאבים שנוצרה |
| `aiFoundryName` | שם שירות Azure AI Foundry |
| `foundryEndpoint` | כתובת URL של נקודת הקצה של שירות AI |
| `foundryAccountKey` | מפתח גישה לשירות AI |
| `deployedModels` | מערך של מודלים של OpenAI שנפרסו |
| `applicationInsightsConnectionString` | מחרוזת חיבור ל-Application Insights |
| `logAnalyticsWorkspaceName` | שם Log Analytics Workspace |

## 🔍 פקודות אימות

לאחר הפריסה, אימת את המשאבים:

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

## 🆚 ARM לעומת Bicep

הפרויקט מספק תבניות ARM ו-Bicep:

### תבנית ARM (`azuredeploy.json`)
- ✅ פורמט מקורי של Azure Resource Manager  
- ✅ עובד בכל מקום שבו ARM נתמך  
- ✅ לא נדרש כלי נוסף  
- ❌ תחביר JSON מפורט יותר  
- ❌ קשה יותר לקריאה ולתחזוקה  

### תבנית Bicep (`main.bicep`)
- ✅ תחביר מודרני ונקי  
- ✅ כלי עזר ו-IntelliSense טובים יותר  
- ✅ קל יותר לקריאה ולתחזוקה  
- ✅ אימות בזמן קומפילציה  
- ❌ דורש CLI של Bicep  
- ❌ שלב בנייה נוסף  

**המלצה**: השתמש בתבניות Bicep (`main.bicep`) לפיתוח ובתבנית ARM (`azuredeploy.json`) לתרחישים הדורשים JSON טהור של ARM.

## 🔧 התאמה אישית

### הוספת משאבים מותאמים אישית

כדי להוסיף משאבים נוספים לתבנית ARM:

1. הוסף את הגדרת המשאב למערך `resources` בתבנית המקוננת  
2. הוסף פרמטרים חדשים לקטע `parameters`  
3. הוסף פלטים מתאימים אם נדרש  
4. עדכן את קובץ הפרמטרים עם ערכי ברירת מחדל  

### דוגמה: הוספת חשבון אחסון

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

## 🐛 פתרון בעיות

### בעיות נפוצות

#### 1. שגיאות אימות תבנית
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. קונפליקטים בשמות משאבים
- ודא ש-`uniqueSuffix` ייחודי באמת  
- השתמש בפונקציה `uniqueString()` ליצירה אוטומטית  
- בדוק משאבים קיימים באזור היעד  

#### 3. מגבלות מכסה
- בדוק זמינות מודלים של OpenAI באזור היעד  
- בדוק מכסות מנוי לשירותי AI  
- שקול להשתמש באזורים שונים אם המכסות הושגו  

#### 4. בעיות הרשאה
- ודא שלחשבון יש תפקיד Contributor במנוי  
- בדוק שהמנוי מופעל לשירותי AI  
- אמת רישום ספקי משאבים  

### פקודות דיבוג

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

## 🔐 שיקולי אבטחה

### בקרת גישה
- שירות AI משתמש בזהות מנוהלת לגישה מאובטחת  
- קבוצת המשאבים מספקת גבול ל-RBAC  
- ל-Application Insights יש בקרות גישה נפרדות  

### אבטחת רשת
- גישה לרשת ציבורית מופעלת כברירת מחדל  
- שקול נקודות קצה פרטיות לסביבת ייצור  
- ניתן להגדיר ACLs רשת לאבטחה נוספת  

### ניהול מפתחות
- מפתחות שירות AI נוצרים אוטומטית  
- השתמש ב-Azure Key Vault לסודות בסביבת ייצור  
- סובב מפתחות באופן קבוע לשמירה על אבטחה  

## 📚 צעדים הבאים

לאחר פריסה מוצלחת:

1. **הגדר משתני סביבה**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **הפעל שרת MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **בדוק אינטגרציה**:
   - פתח את VS Code עם הפרויקט  
   - הגדר שרתי MCP בקובץ `.vscode/mcp.json`  
   - בדוק AI Chat עם שאילתות נתוני קמעונאות  

4. **נטר ביצועים**:
   - צפה במדדים ב-Application Insights  
   - בדוק לוגים ב-Log Analytics Workspace  
   - הגדר התראות לאירועים חשובים  

---

למידע נוסף, ראה את [README הראשי](../README.md) או את [מדריך QUICKSTART](../QUICKSTART.md).

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. אנו לא נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.