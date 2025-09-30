<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:27:01+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "el"
}
-->
# Πρότυπα Υποδομής

Αυτός ο φάκελος περιέχει τα πρότυπα ανάπτυξης υποδομής για το έργο MCP Retail Analytics.

## 📁 Επισκόπηση Αρχείων

| Αρχείο | Περιγραφή | Περίπτωση Χρήσης |
|--------|-----------|------------------|
| `azuredeploy.json` | **Πρότυπο ARM** - Πλήρης ανάπτυξη σε επίπεδο συνδρομής | Συνιστάται για όλες τις αναπτύξεις |
| `azuredeploy.parameters.json` | **Παράμετροι ARM** - Στατικές τιμές διαμόρφωσης | Χρησιμοποιείται με το `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Οδηγός ανάπτυξης ARM** - Αναλυτικές οδηγίες | Πλήρης τεκμηρίωση ανάπτυξης |
| `README.md` | **Αυτό το αρχείο** - Επισκόπηση υποδομής | Γρήγορη αναφορά |

## 🚀 Επιλογές Ανάπτυξης

### Επιλογή 1: Azure CLI (Συνιστάται)
Πλήρης ανάπτυξη με δημιουργία ομάδας πόρων:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Επιλογή 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Επιλογή 3: Azure Portal
1. Μεταβείτε στο [Azure Portal](https://portal.azure.com)
2. Αναζητήστε "Deploy a custom template"
3. Ανεβάστε το `azuredeploy.json`
4. Διαμορφώστε τις παραμέτρους και αναπτύξτε

## 🏗️ Στοιχεία Υποδομής

Το πρότυπο ARM αναπτύσσει την παρακάτω υποδομή:

- **Ομάδα Πόρων**: Κοντέινερ για όλους τους πόρους με συνεπή ονοματοδοσία
- **Log Analytics Workspace**: Κεντρική καταγραφή και παρακολούθηση (διατήρηση 30 ημερών)
- **Application Insights**: Παρακολούθηση απόδοσης εφαρμογών ενσωματωμένη με το Log Analytics
- **Azure AI Services**: Κόμβος πολλαπλών υπηρεσιών AI (επίπεδο S0) με διαχειριζόμενη ταυτότητα
- **Μοντέλα OpenAI**:
  - `gpt-4o-mini` (χωρητικότητα 120) - Μοντέλο συνομιλίας και ολοκλήρωσης
  - `text-embedding-3-small` (χωρητικότητα 50) - Ενσωματώσεις κειμένου για σημασιολογική αναζήτηση

## 🔧 Διαμόρφωση Προτύπου

### Παράμετροι
Το πρότυπο ARM δέχεται τις παρακάτω παραμετροποιήσιμες παραμέτρους:

| Παράμετρος | Προεπιλογή | Περιγραφή |
|------------|------------|-----------|
| `resourcePrefix` | `mcpretail` | Πρόθεμα για όλα τα ονόματα πόρων |
| `location` | `westus2` | Περιοχή Azure για ανάπτυξη |
| `uniqueSuffix` | Αυτόματα παραγόμενο | Μοναδικός αναγνωριστικός κωδικός 4 χαρακτήρων |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Όνομα προβολής |
| `gptModelCapacity` | `120` | Χωρητικότητα μοντέλου GPT |
| `embeddingModelCapacity` | `50` | Χωρητικότητα μοντέλου ενσωμάτωσης |

### Συμβάσεις Ονοματοδοσίας Πόρων
Όλοι οι πόροι ακολουθούν το μοτίβο: `{type}-{resourcePrefix}-{uniqueSuffix}`

Παραδείγματα:
- Ομάδα Πόρων: `rg-mcpretail-demo`
- Υπηρεσία AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Επικύρωση Προτύπου

### Επικύρωση πριν την Ανάπτυξη
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Έλεγχος Κατάστασης Ανάπτυξης
```bash
az deployment sub list --output table
```

## 💰 Εκτίμηση Κόστους

Εκτιμώμενο μηνιαίο κόστος για φόρτο εργασίας ανάπτυξης:

| Υπηρεσία | Διαμόρφωση | Εκτ. Κόστος/Μήνα |
|----------|------------|------------------|
| Azure AI Services | Επίπεδο S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Βασική παρακολούθηση | $5-15 |
| Log Analytics | 1GB/μήνα | $2-5 |
| **Σύνολο** | | **$42-115** |

## 📚 Πρόσθετοι Πόροι

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Αναλυτικός οδηγός ανάπτυξης με αντιμετώπιση προβλημάτων
- [Τεκμηρίωση Προτύπων ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Τεκμηρίωση Υπηρεσιών Azure AI](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Αποτελέσματα επικύρωσης αρχείων

## 🆘 Γρήγορη Αντιμετώπιση Προβλημάτων

### Συνήθη Προβλήματα
- **Πιστοποίηση**: Εκτελέστε `az login` για πιστοποίηση
- **Όρια Ποσοστώσεων**: Ελέγξτε τη διαθεσιμότητα μοντέλων OpenAI στην επιλεγμένη περιοχή
- **Συγκρούσεις Ονομάτων**: Χρησιμοποιήστε διαφορετική παράμετρο `uniqueSuffix`
- **Δικαιώματα**: Βεβαιωθείτε ότι ο λογαριασμός έχει ρόλο Contributor στη συνδρομή

### Λήψη Βοήθειας
- Δείτε το [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) για αναλυτική αντιμετώπιση προβλημάτων
- Ελέγξτε τα αρχεία καταγραφής ανάπτυξης στο Azure Portal
- Επισκεφθείτε τα [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Για πλήρη ρύθμιση του έργου, δείτε το [κύριο README](../../README.md) ή τον [οδηγό έργου](../../walkthrough/README.md).

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.