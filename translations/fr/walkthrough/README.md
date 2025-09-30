<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T16:59:41+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "fr"
}
-->
# 🚀 Serveur MCP avec PostgreSQL - Guide d'apprentissage complet

## 🧠 Aperçu du parcours d'apprentissage de l'intégration de bases de données MCP

Ce guide d'apprentissage complet vous enseigne comment créer des **serveurs Model Context Protocol (MCP)** prêts pour la production, intégrés à des bases de données, à travers une mise en œuvre pratique d'analytique de vente au détail. Vous apprendrez des modèles de niveau entreprise, notamment la **sécurité au niveau des lignes (RLS)**, la **recherche sémantique**, l'**intégration Azure AI**, et l'**accès aux données multi-locataires**.

Que vous soyez développeur backend, ingénieur en IA ou architecte de données, ce guide offre un apprentissage structuré avec des exemples concrets et des exercices pratiques.

## 🔗 Ressources officielles MCP

- 📘 [Documentation MCP](https://modelcontextprotocol.io/) – Tutoriels détaillés et guides utilisateur
- 📜 [Spécification MCP](https://modelcontextprotocol.io/docs/) – Architecture du protocole et références techniques
- 🧑‍💻 [Répertoire GitHub MCP](https://github.com/modelcontextprotocol) – SDKs open-source, outils et exemples de code
- 🌐 [Communauté MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Participez aux discussions et contribuez à la communauté
- 📚 [MCP pour débutants](https://aka.ms/mcp-for-beginners) – Commencez ici si vous êtes nouveau dans MCP

## 🧭 Parcours d'apprentissage de l'intégration de bases de données MCP

### 📚 Structure complète d'apprentissage

| Module | Sujet | Description | Lien |
|--------|-------|-------------|------|
| **Module 1-3 : Fondamentaux** | | | |
| 00 | [Introduction à l'intégration de bases de données MCP](./00-Introduction/README.md) | Aperçu de MCP avec intégration de bases de données et cas d'utilisation en analytique de vente au détail | [Commencer ici](./00-Introduction/README.md) |
| 01 | [Concepts d'architecture de base](./01-Architecture/README.md) | Comprendre l'architecture du serveur MCP, les couches de base de données et les modèles de sécurité | [Apprendre](./01-Architecture/README.md) |
| 02 | [Sécurité et multi-locataires](./02-Security/README.md) | Sécurité au niveau des lignes, authentification et accès aux données multi-locataires | [Apprendre](./02-Security/README.md) |
| 03 | [Configuration de l'environnement](./03-Setup/README.md) | Configuration de l'environnement de développement, Docker, ressources Azure | [Configurer](./03-Setup/README.md) |
| **Module 4-6 : Construction du serveur MCP** | | | |
| 04 | [Conception et schéma de base de données](./04-Database/README.md) | Configuration PostgreSQL, conception du schéma de vente au détail et données d'exemple | [Construire](./04-Database/README.md) |
| 05 | [Implémentation du serveur MCP](./05-MCP-Server/README.md) | Création du serveur FastMCP avec intégration de base de données | [Construire](./05-MCP-Server/README.md) |
| 06 | [Développement d'outils](./06-Tools/README.md) | Création d'outils de requête de base de données et introspection de schéma | [Construire](./06-Tools/README.md) |
| **Module 7-9 : Fonctionnalités avancées** | | | |
| 07 | [Intégration de recherche sémantique](./07-Semantic-Search/README.md) | Implémentation d'embeddings vectoriels avec Azure OpenAI et pgvector | [Approfondir](./07-Semantic-Search/README.md) |
| 08 | [Tests et débogage](./08-Testing/README.md) | Stratégies de test, outils de débogage et approches de validation | [Tester](./08-Testing/README.md) |
| 09 | [Intégration VS Code](./09-VS-Code/README.md) | Configuration de l'intégration MCP dans VS Code et utilisation de l'IA Chat | [Intégrer](./09-VS-Code/README.md) |
| **Module 10-12 : Production et bonnes pratiques** | | | |
| 10 | [Stratégies de déploiement](./10-Deployment/README.md) | Déploiement Docker, Azure Container Apps et considérations de mise à l'échelle | [Déployer](./10-Deployment/README.md) |
| 11 | [Surveillance et observabilité](./11-Monitoring/README.md) | Application Insights, journalisation, surveillance des performances | [Surveiller](./11-Monitoring/README.md) |
| 12 | [Bonnes pratiques et optimisation](./12-Best-Practices/README.md) | Optimisation des performances, renforcement de la sécurité et conseils pour la production | [Optimiser](./12-Best-Practices/README.md) |

### 💻 Ce que vous allez construire

À la fin de ce parcours d'apprentissage, vous aurez construit un **serveur MCP Zava Retail Analytics** complet comprenant :

- **Base de données multi-tables** avec commandes clients, produits et inventaire
- **Sécurité au niveau des lignes** pour l'isolation des données par magasin
- **Recherche sémantique de produits** utilisant les embeddings Azure OpenAI
- **Intégration AI Chat dans VS Code** pour des requêtes en langage naturel
- **Déploiement prêt pour la production** avec Docker et Azure
- **Surveillance complète** avec Application Insights

## 🎯 Prérequis pour l'apprentissage

Pour tirer le meilleur parti de ce parcours d'apprentissage, vous devriez avoir :

- **Expérience en programmation** : Familiarité avec Python (préféré) ou des langages similaires
- **Connaissances en bases de données** : Compréhension de base du SQL et des bases de données relationnelles
- **Concepts d'API** : Compréhension des API REST et des concepts HTTP
- **Outils de développement** : Expérience avec la ligne de commande, Git et les éditeurs de code
- **Bases du cloud** : (Optionnel) Connaissances de base sur Azure ou des plateformes cloud similaires
- **Familiarité avec Docker** : (Optionnel) Compréhension des concepts de conteneurisation

### Outils requis

- **Docker Desktop** - Pour exécuter PostgreSQL et le serveur MCP
- **Azure CLI** - Pour le déploiement des ressources cloud
- **VS Code** - Pour le développement et l'intégration MCP
- **Git** - Pour le contrôle de version
- **Python 3.8+** - Pour le développement du serveur MCP

## 📚 Guide d'étude et ressources

Ce parcours d'apprentissage inclut des ressources complètes pour vous aider à naviguer efficacement :

### Guide d'étude

Chaque module inclut :
- **Objectifs d'apprentissage clairs** - Ce que vous allez accomplir
- **Instructions étape par étape** - Guides d'implémentation détaillés
- **Exemples de code** - Exemples fonctionnels avec explications
- **Exercices** - Opportunités de pratique concrète
- **Guides de dépannage** - Problèmes courants et solutions
- **Ressources supplémentaires** - Lectures et explorations complémentaires

### Vérification des prérequis

Avant de commencer chaque module, vous trouverez :
- **Connaissances requises** - Ce que vous devez savoir au préalable
- **Validation de la configuration** - Comment vérifier votre environnement
- **Estimations de temps** - Temps prévu pour terminer
- **Résultats d'apprentissage** - Ce que vous saurez après avoir terminé

### Parcours d'apprentissage recommandés

Choisissez votre parcours en fonction de votre niveau d'expérience :

#### 🟢 **Parcours débutant** (Nouveau dans MCP)
1. Commencez par [MCP pour débutants](https://aka.ms/mcp-for-beginners)
2. Complétez les modules 00-03 pour comprendre les bases
3. Suivez les modules 04-06 pour une construction pratique
4. Essayez les modules 07-09 pour une utilisation concrète

#### 🟡 **Parcours intermédiaire** (Quelques connaissances en MCP)
1. Revoyez les modules 00-01 pour les concepts spécifiques aux bases de données
2. Concentrez-vous sur les modules 02-06 pour l'implémentation
3. Approfondissez les modules 07-12 pour les fonctionnalités avancées

#### 🔴 **Parcours avancé** (Expérimenté avec MCP)
1. Parcourez rapidement les modules 00-03 pour le contexte
2. Concentrez-vous sur les modules 04-09 pour l'intégration de bases de données
3. Mettez l'accent sur les modules 10-12 pour le déploiement en production

## 🛠️ Comment utiliser ce parcours d'apprentissage efficacement

### Apprentissage séquentiel (recommandé)

Suivez les modules dans l'ordre pour une compréhension complète :

1. **Lisez l'aperçu** - Comprenez ce que vous allez apprendre
2. **Vérifiez les prérequis** - Assurez-vous d'avoir les connaissances nécessaires
3. **Suivez les guides étape par étape** - Implémentez au fur et à mesure
4. **Complétez les exercices** - Renforcez votre compréhension
5. **Revoyez les points clés** - Solidifiez les résultats d'apprentissage

### Apprentissage ciblé

Si vous avez besoin de compétences spécifiques :

- **Intégration de bases de données** : Concentrez-vous sur les modules 04-06
- **Implémentation de la sécurité** : Concentrez-vous sur les modules 02, 08, 12
- **IA/Recherche sémantique** : Approfondissez le module 07
- **Déploiement en production** : Étudiez les modules 10-12

### Pratique concrète

Chaque module inclut :
- **Exemples de code fonctionnels** - Copiez, modifiez et expérimentez
- **Scénarios réels** - Cas d'utilisation pratiques en analytique de vente au détail
- **Complexité progressive** - De simple à avancé
- **Étapes de validation** - Vérifiez que votre implémentation fonctionne

## 🌟 Communauté et support

### Obtenez de l'aide

- **Discord Azure AI** : [Rejoignez pour un support expert](https://discord.com/invite/ByRwuEEgH4)
- **Problèmes GitHub** : [Signalez des problèmes ou posez des questions](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Communauté MCP** : [Participez aux discussions MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Contribuez

Nous accueillons les contributions pour améliorer ce parcours d'apprentissage :
- **Corrigez les bugs ou fautes** - Soumettez des pull requests
- **Ajoutez des exemples** - Partagez vos implémentations
- **Améliorez la documentation** - Aidez les autres à apprendre
- **Signalez des problèmes** - Aidez-nous à résoudre les problèmes

## 📜 Informations sur la licence

Ce contenu d'apprentissage est sous licence MIT. Consultez le fichier [LICENSE](../../../LICENSE) pour les termes et conditions.

## 🚀 Prêt à commencer ?

Commencez votre parcours avec **[Module 00 : Introduction à l'intégration de bases de données MCP](./00-Introduction/README.md)**

---

*Maîtrisez la création de serveurs MCP prêts pour la production avec intégration de bases de données grâce à cette expérience d'apprentissage complète et pratique.*

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.