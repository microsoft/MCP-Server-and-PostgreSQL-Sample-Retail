<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:18:58+00:00",
  "source_file": "azd/README.md",
  "language_code": "fr"
}
-->
# Azure Developer CLI (azd) Guide de démarrage rapide

## 🚀 Déployer avec Azure Developer CLI

Ce projet est désormais entièrement compatible avec Azure Developer CLI (azd) pour le déploiement automatisé de l'infrastructure et de l'application serveur MCP.

### Prérequis

1. **Installer Azure Developer CLI** :
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

2. **Se connecter à Azure** :
   ```bash
   az login
   azd auth login
   ```

### 🎯 Déploiement en une commande

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

### 🔧 Flux de travail de développement

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

### 📦 Ce qui est déployé

#### **Infrastructure**
- Groupe de ressources
- Espace de travail Log Analytics  
- Application Insights
- Services Azure AI (avec modèles OpenAI)
- Environnement d'application conteneurisée

#### **Application**
- Serveur MCP (Application conteneurisée)
- Surveillance de la santé activée
- Variables d'environnement configurées
- Intégration avec Application Insights

### 🌍 Variables d'environnement

Après le déploiement, ces variables sont automatiquement disponibles :

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Surveillance et gestion

- **Portail Azure** : Consultez toutes les ressources dans votre groupe de ressources
- **Application Insights** : Surveillez les performances et les journaux de l'application
- **Applications conteneurisées** : Consultez les journaux et les métriques de l'application
- **AI Studio** : Gérez les déploiements de modèles OpenAI

### 📋 Résolution des problèmes

#### **Problèmes courants**

1. **Emplacement non pris en charge** :
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Quotas de ressources dépassés** :
   - Vérifiez les limites de votre abonnement dans le portail Azure
   - Essayez une autre région

3. **Problèmes d'authentification** :
   ```bash
   azd auth login --use-device-code
   ```

4. **Consultez les journaux de déploiement** :
   ```bash
   azd show --output json
   ```

### 🔄 Alternative : Déploiement manuel

Si vous préférez un déploiement manuel, vous pouvez toujours utiliser l'infrastructure dans le dossier `/infra` :

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 En savoir plus

- [Documentation Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentation Applications conteneurisées](https://docs.microsoft.com/azure/container-apps/)
- [Documentation Services Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.