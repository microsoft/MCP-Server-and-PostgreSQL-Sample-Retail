<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:02:13+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "fr"
}
-->
# Instructions de déploiement du modèle ARM

Ce document fournit des instructions pour déployer l'infrastructure MCP Retail Analytics à l'aide du modèle ARM.

## 📋 Vue d'ensemble

Le modèle ARM `azuredeploy.json` permet un déploiement complet de :
- Groupe de ressources Azure
- Espace de travail Log Analytics  
- Application Insights
- Services Azure AI (Foundry)
- Déploiements de modèles OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Options de déploiement

### Option 1 : Déploiement via Azure CLI

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

### Option 2 : Déploiement via PowerShell

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

### Option 3 : Portail Azure

1. Accédez au [Portail Azure](https://portal.azure.com)
2. Recherchez "Déployer un modèle personnalisé"
3. Cliquez sur "Créer votre propre modèle dans l'éditeur"
4. Copiez et collez le contenu de `azuredeploy.json`
5. Cliquez sur "Enregistrer" puis "Vérifier + créer"
6. Remplissez les paramètres requis et déployez

## 🔧 Paramètres du modèle

| Paramètre | Type | Valeur par défaut | Description |
|-----------|------|-------------------|-------------|
| `resourcePrefix` | string | `mcpretail` | Préfixe pour les noms des ressources |
| `location` | string | `westus2` | Région Azure pour le déploiement |
| `uniqueSuffix` | string | Généré automatiquement | Identifiant unique de 4 caractères |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nom affiché pour le projet AI |
| `aiProjectDescription` | string | Description du projet | Description affichée dans Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Capacité en tokens pour le modèle GPT |
| `embeddingModelCapacity` | int | `50` | Capacité en tokens pour le modèle d'intégration |
| `tags` | object | Tags par défaut | Tags de ressources pour la gouvernance |

## 📤 Résultats du modèle

Le modèle fournit les résultats suivants :

| Résultat | Description |
|----------|-------------|
| `subscriptionId` | ID de l'abonnement Azure |
| `resourceGroupName` | Nom du groupe de ressources créé |
| `aiFoundryName` | Nom du service Azure AI Foundry |
| `foundryEndpoint` | URL du point de terminaison du service AI |
| `foundryAccountKey` | Clé d'accès au service AI |
| `deployedModels` | Tableau des modèles OpenAI déployés |
| `applicationInsightsConnectionString` | Chaîne de connexion Application Insights |
| `logAnalyticsWorkspaceName` | Nom de l'espace de travail Log Analytics |

## 🔍 Commandes de vérification

Après le déploiement, vérifiez les ressources :

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

Ce projet propose des modèles ARM et Bicep :

### Modèle ARM (`azuredeploy.json`)
- ✅ Format natif Azure Resource Manager
- ✅ Fonctionne partout où ARM est pris en charge
- ✅ Aucun outil supplémentaire requis
- ❌ Syntaxe JSON plus verbeuse
- ❌ Plus difficile à lire et à maintenir

### Modèle Bicep (`main.bicep`)
- ✅ Syntaxe moderne et épurée
- ✅ Meilleurs outils et IntelliSense
- ✅ Plus facile à lire et à maintenir
- ✅ Validation à la compilation
- ❌ Nécessite le CLI Bicep
- ❌ Étape de compilation supplémentaire

**Recommandation** : Utilisez les modèles Bicep (`main.bicep`) pour le développement et le modèle ARM (`azuredeploy.json`) pour les scénarios nécessitant du JSON ARM pur.

## 🔧 Personnalisation

### Ajout de ressources personnalisées

Pour ajouter des ressources supplémentaires au modèle ARM :

1. Ajoutez la définition de la ressource au tableau `resources` du modèle imbriqué
2. Ajoutez les nouveaux paramètres à la section `parameters`
3. Ajoutez les résultats correspondants si nécessaire
4. Mettez à jour le fichier de paramètres avec des valeurs par défaut

### Exemple : Ajout d'un compte de stockage

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

## 🐛 Résolution des problèmes

### Problèmes courants

#### 1. Erreurs de validation du modèle
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Conflits de noms de ressources
- Assurez-vous que `uniqueSuffix` est réellement unique
- Utilisez la fonction `uniqueString()` pour une génération automatique
- Vérifiez les ressources existantes dans la région cible

#### 3. Limites de quotas
- Vérifiez la disponibilité des modèles OpenAI dans la région cible
- Consultez les quotas d'abonnement pour les services AI
- Envisagez d'utiliser d'autres régions si les limites sont atteintes

#### 4. Problèmes de permissions
- Assurez-vous que le compte dispose du rôle de Contributeur sur l'abonnement
- Vérifiez que l'abonnement est activé pour les services AI
- Vérifiez l'enregistrement des fournisseurs de ressources

### Commandes de débogage

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

## 🔐 Considérations de sécurité

### Contrôle d'accès
- Le service AI utilise une identité managée pour un accès sécurisé
- Le groupe de ressources fournit une limite pour le RBAC
- Application Insights dispose de contrôles d'accès séparés

### Sécurité réseau
- L'accès réseau public est activé par défaut
- Envisagez des points de terminaison privés pour la production
- Les ACL réseau peuvent être configurées pour une sécurité supplémentaire

### Gestion des clés
- Les clés du service AI sont générées automatiquement
- Utilisez Azure Key Vault pour les secrets en production
- Faites tourner les clés régulièrement pour plus de sécurité

## 📚 Prochaines étapes

Après un déploiement réussi :

1. **Configurer les variables d'environnement** :
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Démarrer le serveur MCP** :
   ```bash
   cd .. && docker compose up -d
   ```

3. **Tester l'intégration** :
   - Ouvrez VS Code avec le projet
   - Configurez les serveurs MCP dans `.vscode/mcp.json`
   - Testez le chat AI avec des requêtes de données retail

4. **Surveiller les performances** :
   - Consultez les métriques dans Application Insights
   - Vérifiez les journaux dans l'espace de travail Log Analytics
   - Configurez des alertes pour les événements importants

---

Pour plus d'informations, consultez le [README principal](../README.md) ou le guide [QUICKSTART](../QUICKSTART.md).

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.