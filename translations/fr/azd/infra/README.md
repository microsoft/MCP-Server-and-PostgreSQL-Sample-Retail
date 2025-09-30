<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:19:25+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "fr"
}
-->
# Modèles d'Infrastructure

Ce dossier contient les modèles de déploiement d'infrastructure pour le projet MCP Retail Analytics.

## 📁 Aperçu des fichiers

| Fichier | Description | Cas d'utilisation |
|---------|-------------|--------------------|
| `azuredeploy.json` | **Modèle ARM** - Déploiement complet au niveau de l'abonnement | Recommandé pour tous les déploiements |
| `azuredeploy.parameters.json` | **Paramètres ARM** - Valeurs de configuration statiques | Utilisé avec `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Guide de déploiement ARM** - Instructions détaillées | Documentation complète du déploiement |
| `README.md` | **Ce fichier** - Vue d'ensemble de l'infrastructure | Référence rapide |

## 🚀 Options de déploiement

### Option 1 : Azure CLI (Recommandé)
Déploiement complet avec création de groupe de ressources :
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Option 2 : PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Option 3 : Portail Azure
1. Accédez au [Portail Azure](https://portal.azure.com)
2. Recherchez "Déployer un modèle personnalisé"
3. Téléchargez `azuredeploy.json`
4. Configurez les paramètres et déployez

## 🏗️ Composants de l'infrastructure

Le modèle ARM déploie les composants d'infrastructure suivants :

- **Groupe de ressources** : Conteneur pour toutes les ressources avec une nomenclature cohérente
- **Espace de travail Log Analytics** : Journalisation et surveillance centralisées (rétention de 30 jours)
- **Application Insights** : Surveillance des performances des applications intégrée à Log Analytics
- **Services Azure AI** : Hub multi-services d'IA (niveau S0) avec identité managée
- **Modèles OpenAI** :
  - `gpt-4o-mini` (capacité de 120) - Modèle de chat et de complétion
  - `text-embedding-3-small` (capacité de 50) - Modèle d'embeddings pour la recherche sémantique

## 🔧 Configuration du modèle

### Paramètres
Le modèle ARM accepte les paramètres personnalisables suivants :

| Paramètre | Valeur par défaut | Description |
|-----------|-------------------|-------------|
| `resourcePrefix` | `mcpretail` | Préfixe pour tous les noms de ressources |
| `location` | `westus2` | Région Azure pour le déploiement |
| `uniqueSuffix` | Généré automatiquement | Identifiant unique de 4 caractères |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nom affiché |
| `gptModelCapacity` | `120` | Capacité en tokens du modèle GPT |
| `embeddingModelCapacity` | `50` | Capacité en tokens du modèle d'embeddings |

### Convention de nommage des ressources
Toutes les ressources suivent le modèle : `{type}-{resourcePrefix}-{uniqueSuffix}`

Exemples :
- Groupe de ressources : `rg-mcpretail-demo`
- Service AI : `fdy-mcpretail-demo`
- Application Insights : `appi-mcpretail-demo`

## 🔍 Validation du modèle

### Valider avant le déploiement
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Vérifier le statut du déploiement
```bash
az deployment sub list --output table
```

## 💰 Estimation des coûts

Coûts mensuels estimés pour une charge de travail de développement :

| Service | Configuration | Coût estimé/mois |
|---------|---------------|------------------|
| Services Azure AI | Niveau S0 | 15-50 $ |
| OpenAI GPT-4o-mini | 120K tokens | 15-30 $ |
| OpenAI Embeddings | 50K tokens | 5-15 $ |
| Application Insights | Surveillance de base | 5-15 $ |
| Log Analytics | 1 Go/mois | 2-5 $ |
| **Total** | | **42-115 $** |

## 📚 Ressources supplémentaires

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Guide de déploiement détaillé avec dépannage
- [Documentation des modèles ARM](https://docs.microsoft.com/fr-fr/azure/azure-resource-manager/templates/)
- [Documentation des services Azure AI](https://docs.microsoft.com/fr-fr/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Résultats de validation des fichiers

## 🆘 Dépannage rapide

### Problèmes courants
- **Authentification** : Exécutez `az login` pour vous authentifier
- **Limites de quota** : Vérifiez la disponibilité des modèles OpenAI dans la région cible
- **Conflits de nommage** : Utilisez un paramètre `uniqueSuffix` différent
- **Permissions** : Assurez-vous que le compte dispose du rôle de Contributeur sur l'abonnement

### Obtenir de l'aide
- Consultez [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) pour un dépannage détaillé
- Vérifiez les journaux de déploiement dans le Portail Azure
- Visitez [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Pour la configuration complète du projet, consultez le [README principal](../../README.md) ou le [guide du projet](../../walkthrough/README.md).

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, une traduction humaine professionnelle est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.