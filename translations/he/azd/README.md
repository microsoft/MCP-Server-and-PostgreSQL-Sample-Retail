<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:24:53+00:00",
  "source_file": "azd/README.md",
  "language_code": "he"
}
-->
# התחלה מהירה עם Azure Developer CLI (azd)

## 🚀 פריסה עם Azure Developer CLI

הפרויקט הזה תואם באופן מלא ל-Azure Developer CLI (azd) לצורך פריסה אוטומטית של התשתית ושל אפליקציית שרת MCP.

### דרישות מקדימות

1. **התקן את Azure Developer CLI**:
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

2. **התחבר ל-Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 פריסה בפקודה אחת

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

### 🔧 תהליך עבודה לפיתוח

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

### 📦 מה נפרס

#### **תשתית**
- קבוצת משאבים
- Log Analytics Workspace  
- Application Insights
- שירותי Azure AI (עם מודלים של OpenAI)
- סביבה לאפליקציות מבוססות קונטיינר

#### **אפליקציה**
- שרת MCP (אפליקציה מבוססת קונטיינר)
- ניטור בריאות מופעל
- משתני סביבה מוגדרים
- אינטגרציה עם Application Insights

### 🌍 משתני סביבה

לאחר הפריסה, משתנים אלו זמינים באופן אוטומטי:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 ניטור וניהול

- **Azure Portal**: צפייה בכל המשאבים בקבוצת המשאבים שלך
- **Application Insights**: ניטור ביצועי האפליקציה ולוגים
- **Container Apps**: צפייה בלוגים ובמדדים של האפליקציה
- **AI Studio**: ניהול פריסות מודלים של OpenAI

### 📋 פתרון בעיות

#### **בעיות נפוצות**

1. **מיקום לא נתמך**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **חריגה ממכסת משאבים**:
   - בדוק את מגבלות המנוי שלך ב-Azure Portal
   - נסה אזור אחר

3. **בעיות אימות**:
   ```bash
   azd auth login --use-device-code
   ```

4. **צפייה בלוגים של פריסה**:
   ```bash
   azd show --output json
   ```

### 🔄 חלופה: פריסה ידנית

אם אתה מעדיף פריסה ידנית, עדיין ניתן להשתמש בתשתית שבתיקיית `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 למידע נוסף

- [תיעוד Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [תיעוד אפליקציות מבוססות קונטיינר](https://docs.microsoft.com/azure/container-apps/)
- [תיעוד שירותי Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עשויים להכיל שגיאות או אי דיוקים. המסמך המקורי בשפתו המקורית צריך להיחשב כמקור סמכותי. עבור מידע קריטי, מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו נושאים באחריות לאי הבנות או לפרשנויות שגויות הנובעות משימוש בתרגום זה.