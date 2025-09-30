<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:23:32+00:00",
  "source_file": "azd/README.md",
  "language_code": "el"
}
-->
# Γρήγορη Έναρξη Azure Developer CLI (azd)

## 🚀 Ανάπτυξη με το Azure Developer CLI

Αυτό το έργο είναι πλέον πλήρως συμβατό με το Azure Developer CLI (azd) για αυτοματοποιημένη ανάπτυξη τόσο της υποδομής όσο και της εφαρμογής MCP server.

### Προαπαιτούμενα

1. **Εγκατάσταση του Azure Developer CLI**:
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

2. **Σύνδεση στο Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Ανάπτυξη με μία εντολή

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

### 🔧 Ροή Εργασίας Ανάπτυξης

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

### 📦 Τι Αναπτύσσεται

#### **Υποδομή**
- Ομάδα Πόρων
- Χώρος Εργασίας Log Analytics  
- Application Insights
- Υπηρεσίες Azure AI (με μοντέλα OpenAI)
- Περιβάλλον Container App

#### **Εφαρμογή**
- MCP Server (Container App)
- Ενεργοποιημένη παρακολούθηση υγείας
- Διαμορφωμένες μεταβλητές περιβάλλοντος
- Ενσωμάτωση Application Insights

### 🌍 Μεταβλητές Περιβάλλοντος

Μετά την ανάπτυξη, αυτές οι μεταβλητές είναι διαθέσιμες αυτόματα:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Παρακολούθηση & Διαχείριση

- **Azure Portal**: Δείτε όλους τους πόρους στην ομάδα πόρων σας
- **Application Insights**: Παρακολουθήστε την απόδοση και τα αρχεία καταγραφής της εφαρμογής
- **Container Apps**: Δείτε αρχεία καταγραφής και μετρήσεις της εφαρμογής
- **AI Studio**: Διαχειριστείτε τις αναπτύξεις μοντέλων OpenAI

### 📋 Επίλυση Προβλημάτων

#### **Συνηθισμένα Προβλήματα**

1. **Μη υποστηριζόμενη τοποθεσία**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Υπέρβαση ποσοστώσεων πόρων**:
   - Ελέγξτε τα όρια της συνδρομής σας στο Azure Portal
   - Δοκιμάστε μια διαφορετική περιοχή

3. **Προβλήματα αυθεντικοποίησης**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Προβολή αρχείων καταγραφής ανάπτυξης**:
   ```bash
   azd show --output json
   ```

### 🔄 Εναλλακτική: Χειροκίνητη Ανάπτυξη

Εάν προτιμάτε τη χειροκίνητη ανάπτυξη, μπορείτε να χρησιμοποιήσετε την υποδομή στον φάκελο `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Μάθετε Περισσότερα

- [Τεκμηρίωση Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Τεκμηρίωση Container Apps](https://docs.microsoft.com/azure/container-apps/)
- [Τεκμηρίωση Υπηρεσιών Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.