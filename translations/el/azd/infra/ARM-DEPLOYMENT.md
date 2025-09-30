<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:10:14+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "el"
}
-->
# Οδηγίες Ανάπτυξης ARM Template

Αυτό το έγγραφο παρέχει οδηγίες για την ανάπτυξη της υποδομής MCP Retail Analytics χρησιμοποιώντας το ARM template.

## 📋 Επισκόπηση

Το `azuredeploy.json` ARM template παρέχει μια πλήρη ανάπτυξη των εξής:
- Ομάδα Πόρων Azure
- Log Analytics Workspace  
- Application Insights
- Υπηρεσίες Azure AI (Foundry)
- Αναπτύξεις Μοντέλων OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Επιλογές Ανάπτυξης

### Επιλογή 1: Ανάπτυξη μέσω Azure CLI

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

### Επιλογή 2: Ανάπτυξη μέσω PowerShell

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

### Επιλογή 3: Azure Portal

1. Μεταβείτε στο [Azure Portal](https://portal.azure.com)
2. Αναζητήστε "Deploy a custom template"
3. Κάντε κλικ στο "Build your own template in the editor"
4. Αντιγράψτε και επικολλήστε το περιεχόμενο του `azuredeploy.json`
5. Κάντε κλικ στο "Save" και στη συνέχεια στο "Review + create"
6. Συμπληρώστε τις απαιτούμενες παραμέτρους και αναπτύξτε

## 🔧 Παράμετροι Template

| Παράμετρος | Τύπος | Προεπιλογή | Περιγραφή |
|------------|-------|------------|-----------|
| `resourcePrefix` | string | `mcpretail` | Πρόθεμα για τα ονόματα των πόρων |
| `location` | string | `westus2` | Περιοχή Azure για την ανάπτυξη |
| `uniqueSuffix` | string | Αυτόματη δημιουργία | Μοναδικό αναγνωριστικό 4 χαρακτήρων |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Όνομα εμφάνισης για το AI project |
| `aiProjectDescription` | string | Περιγραφή έργου | Περιγραφή που εμφανίζεται στο Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Χωρητικότητα token για το μοντέλο GPT |
| `embeddingModelCapacity` | int | `50` | Χωρητικότητα token για το μοντέλο embedding |
| `tags` | object | Προεπιλεγμένα tags | Ετικέτες πόρων για διακυβέρνηση |

## 📤 Έξοδοι Template

Το template παρέχει τις εξής εξόδους:

| Έξοδος | Περιγραφή |
|--------|-----------|
| `subscriptionId` | ID συνδρομής Azure |
| `resourceGroupName` | Όνομα της δημιουργηθείσας ομάδας πόρων |
| `aiFoundryName` | Όνομα υπηρεσίας Azure AI Foundry |
| `foundryEndpoint` | URL τελικού σημείου της υπηρεσίας AI |
| `foundryAccountKey` | Κλειδί πρόσβασης στην υπηρεσία AI |
| `deployedModels` | Πίνακας αναπτυγμένων μοντέλων OpenAI |
| `applicationInsightsConnectionString` | Σύνδεσμος σύνδεσης Application Insights |
| `logAnalyticsWorkspaceName` | Όνομα του Log Analytics workspace |

## 🔍 Εντολές Επαλήθευσης

Μετά την ανάπτυξη, επαληθεύστε τους πόρους:

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

Αυτό το έργο παρέχει τόσο ARM όσο και Bicep templates:

### ARM Template (`azuredeploy.json`)
- ✅ Γηγενής μορφή Azure Resource Manager
- ✅ Λειτουργεί παντού όπου υποστηρίζεται το ARM
- ✅ Δεν απαιτείται πρόσθετο εργαλείο
- ❌ Πιο εκτενής σύνταξη JSON
- ❌ Δυσκολότερη ανάγνωση και συντήρηση

### Bicep Template (`main.bicep`)
- ✅ Σύγχρονη, καθαρή σύνταξη
- ✅ Καλύτερα εργαλεία και IntelliSense
- ✅ Ευκολότερη ανάγνωση και συντήρηση
- ✅ Επικύρωση κατά τη μεταγλώττιση
- ❌ Απαιτεί Bicep CLI
- ❌ Πρόσθετο βήμα μεταγλώττισης

**Σύσταση**: Χρησιμοποιήστε τα Bicep templates (`main.bicep`) για ανάπτυξη και το ARM template (`azuredeploy.json`) για σενάρια που απαιτούν καθαρό JSON ARM.

## 🔧 Προσαρμογή

### Προσθήκη Προσαρμοσμένων Πόρων

Για να προσθέσετε επιπλέον πόρους στο ARM template:

1. Προσθέστε τον ορισμό του πόρου στον πίνακα `resources` του nested template
2. Προσθέστε τυχόν νέες παραμέτρους στην ενότητα `parameters`
3. Προσθέστε αντίστοιχες εξόδους αν χρειάζεται
4. Ενημερώστε το αρχείο παραμέτρων με προεπιλεγμένες τιμές

### Παράδειγμα: Προσθήκη Storage Account

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

## 🐛 Αντιμετώπιση Προβλημάτων

### Συνήθη Προβλήματα

#### 1. Σφάλματα Επικύρωσης Template
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Συγκρούσεις Ονομάτων Πόρων
- Βεβαιωθείτε ότι το `uniqueSuffix` είναι πραγματικά μοναδικό
- Χρησιμοποιήστε τη συνάρτηση `uniqueString()` για αυτόματη δημιουργία
- Ελέγξτε τους υπάρχοντες πόρους στην επιλεγμένη περιοχή

#### 3. Όρια Ποσοστώσεων
- Επαληθεύστε τη διαθεσιμότητα μοντέλων OpenAI στην επιλεγμένη περιοχή
- Ελέγξτε τις ποσοστώσεις συνδρομής για τις υπηρεσίες AI
- Εξετάστε τη χρήση διαφορετικών περιοχών αν έχουν εξαντληθεί τα όρια

#### 4. Ζητήματα Δικαιωμάτων
- Βεβαιωθείτε ότι ο λογαριασμός έχει ρόλο Contributor στη συνδρομή
- Ελέγξτε αν η συνδρομή είναι ενεργοποιημένη για υπηρεσίες AI
- Επαληθεύστε τις εγγραφές παρόχων πόρων

### Εντολές Εντοπισμού Σφαλμάτων

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

## 🔐 Σκέψεις Ασφαλείας

### Έλεγχος Πρόσβασης
- Η υπηρεσία AI χρησιμοποιεί διαχειριζόμενη ταυτότητα για ασφαλή πρόσβαση
- Η ομάδα πόρων παρέχει όρια για RBAC
- Το Application Insights έχει ξεχωριστούς ελέγχους πρόσβασης

### Ασφάλεια Δικτύου
- Η δημόσια πρόσβαση στο δίκτυο είναι ενεργοποιημένη από προεπιλογή
- Εξετάστε τη χρήση ιδιωτικών τελικών σημείων για παραγωγή
- Τα ACL δικτύου μπορούν να διαμορφωθούν για πρόσθετη ασφάλεια

### Διαχείριση Κλειδιών
- Τα κλειδιά υπηρεσίας AI δημιουργούνται αυτόματα
- Χρησιμοποιήστε το Azure Key Vault για μυστικά παραγωγής
- Περιστρέψτε τα κλειδιά τακτικά για ασφάλεια

## 📚 Επόμενα Βήματα

Μετά την επιτυχή ανάπτυξη:

1. **Διαμορφώστε Μεταβλητές Περιβάλλοντος**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Ξεκινήστε τον MCP Server**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Δοκιμάστε την Ενσωμάτωση**:
   - Ανοίξτε το VS Code με το έργο
   - Διαμορφώστε τους MCP servers στο `.vscode/mcp.json`
   - Δοκιμάστε το AI Chat με ερωτήματα δεδομένων λιανικής

4. **Παρακολουθήστε την Απόδοση**:
   - Δείτε μετρήσεις στο Application Insights
   - Ελέγξτε τα logs στο Log Analytics workspace
   - Ρυθμίστε ειδοποιήσεις για σημαντικά συμβάντα

---

Για περισσότερες πληροφορίες, δείτε το [κύριο README](../README.md) ή τον [ΟΔΗΓΟ ΓΡΗΓΟΡΗΣ ΕΚΚΙΝΗΣΗΣ](../QUICKSTART.md).

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.