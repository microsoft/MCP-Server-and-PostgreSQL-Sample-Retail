<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T16:52:27+00:00",
  "source_file": "README.md",
  "language_code": "fr"
}
-->
# Exemple de serveur MCP et PostgreSQL - Analyse des ventes au détail

## Apprenez MCP avec l'intégration de bases de données grâce à des exemples pratiques

[![Contributeurs GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Problèmes GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Pull-requests GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Bienvenus](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Rejoignez le Discord Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Suivez ces étapes pour commencer à utiliser ces ressources :

1. **Forkez le dépôt** : Cliquez [ici pour forker](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clonez le dépôt** : `git clone https://github.com/VOTRE-NOM-D'UTILISATEUR/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Rejoignez le Discord Azure AI Foundry** : [Rencontrez des experts et d'autres développeurs](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Support multilingue

#### Pris en charge via GitHub Action (Automatisé et toujours à jour)

[Français](./README.md) | [Espagnol](../es/README.md) | [Allemand](../de/README.md) | [Russe](../ru/README.md) | [Arabe](../ar/README.md) | [Persan (Farsi)](../fa/README.md) | [Ourdou](../ur/README.md) | [Chinois (Simplifié)](../zh/README.md) | [Chinois (Traditionnel, Macao)](../mo/README.md) | [Chinois (Traditionnel, Hong Kong)](../hk/README.md) | [Chinois (Traditionnel, Taïwan)](../tw/README.md) | [Japonais](../ja/README.md) | [Coréen](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portugais (Portugal)](../pt/README.md) | [Portugais (Brésil)](../br/README.md) | [Italien](../it/README.md) | [Polonais](../pl/README.md) | [Turc](../tr/README.md) | [Grec](../el/README.md) | [Thaï](../th/README.md) | [Suédois](../sv/README.md) | [Danois](../da/README.md) | [Norvégien](../no/README.md) | [Finnois](../fi/README.md) | [Néerlandais](../nl/README.md) | [Hébreu](../he/README.md) | [Vietnamien](../vi/README.md) | [Indonésien](../id/README.md) | [Malais](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hongrois](../hu/README.md) | [Tchèque](../cs/README.md) | [Slovaque](../sk/README.md) | [Roumain](../ro/README.md) | [Bulgare](../bg/README.md) | [Serbe (Cyrillique)](../sr/README.md) | [Croate](../hr/README.md) | [Slovène](../sl/README.md) | [Ukrainien](../uk/README.md) | [Birman (Myanmar)](../my/README.md)

**Si vous souhaitez ajouter des langues supplémentaires, les langues prises en charge sont listées [ici](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduction

Cet exemple montre comment construire et déployer un serveur **Model Context Protocol (MCP)** complet qui offre aux assistants IA un accès intelligent et sécurisé aux données de ventes au détail via PostgreSQL. Le projet met en avant des fonctionnalités de niveau entreprise telles que la **sécurité au niveau des lignes (RLS)**, les **capacités de recherche sémantique**, et l'**intégration Azure AI** pour des scénarios d'analyse des ventes au détail.

**Cas d'utilisation clés :**
- **Analyse des ventes alimentée par l'IA** : Permettre aux assistants IA de requêter et analyser les données de ventes au détail en langage naturel
- **Accès sécurisé multi-locataires** : Démonstration de la mise en œuvre de la sécurité au niveau des lignes où différents responsables de magasin ne peuvent accéder qu'aux données de leur magasin
- **Recherche sémantique de produits** : Présentation de la découverte de produits améliorée par l'IA grâce aux embeddings textuels
- **Intégration d'entreprise** : Illustration de l'intégration des serveurs MCP avec les services Azure et les bases de données PostgreSQL

**Idéal pour :**
- Les développeurs apprenant à construire des serveurs MCP avec intégration de bases de données
- Les ingénieurs en données mettant en œuvre des solutions d'analyse sécurisées multi-locataires
- Les développeurs d'applications IA travaillant avec des données de vente au détail ou de commerce électronique
- Toute personne intéressée par la combinaison d'assistants IA avec des bases de données d'entreprise

## Rejoignez la communauté Discord Azure AI Foundry
Partagez vos expériences avec MCP et rencontrez des experts et des groupes de produits

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Serveur MCP d'analyse des ventes

Un serveur Model Context Protocol (MCP) qui offre un accès complet à une base de données de ventes clients pour l'entreprise Zava Retail DIY. Ce serveur permet aux assistants IA de requêter et analyser les données de ventes au détail via une interface sécurisée et consciente du schéma.

## 📚 Guide de mise en œuvre complet

Pour une analyse détaillée de la construction de cette solution et de la mise en œuvre de serveurs MCP similaires, consultez notre **[Guide de l'exemple](Sample_Walkthrough.md)**. Ce guide fournit :

- **Analyse de l'architecture** : Analyse des composants et des modèles de conception
- **Construction étape par étape** : De la configuration du projet au déploiement
- **Explication du code** : Détails sur la mise en œuvre du serveur MCP
- **Fonctionnalités avancées** : Sécurité au niveau des lignes, recherche sémantique et surveillance
- **Bonnes pratiques** : Sécurité, performance et directives de développement
- **Dépannage** : Problèmes courants et solutions

Idéal pour les développeurs souhaitant comprendre les détails de la mise en œuvre et construire des solutions similaires.

## 🤖 Qu'est-ce que MCP (Model Context Protocol) ?

Le **Model Context Protocol (MCP)** est une norme ouverte qui permet aux assistants IA d'accéder en toute sécurité à des sources de données externes et des outils en temps réel. Pensez-y comme un pont permettant aux modèles IA de se connecter à des bases de données, des API, des systèmes de fichiers et d'autres ressources tout en maintenant la sécurité et le contrôle.

### Avantages clés :
- **Accès aux données en temps réel** : Les assistants IA peuvent interroger des bases de données et des API en direct
- **Intégration sécurisée** : Accès contrôlé avec authentification et permissions  
- **Extensibilité des outils** : Ajout de capacités personnalisées aux assistants IA
- **Protocole standardisé** : Fonctionne avec différentes plateformes et outils IA

### Nouveau sur MCP ?

Si vous découvrez le Model Context Protocol, nous vous recommandons de commencer par les ressources pour débutants de Microsoft :

**📖 [Guide MCP pour débutants](https://aka.ms/mcp-for-beginners)**

Cette ressource fournit :
- Introduction aux concepts et à l'architecture MCP
- Tutoriels étape par étape pour construire votre premier serveur MCP
- Bonnes pratiques pour le développement MCP
- Exemples d'intégration avec des plateformes IA populaires
- Ressources communautaires et support

Une fois que vous maîtrisez les bases, revenez ici pour explorer cette mise en œuvre avancée d'analyse des ventes au détail !

## 📚 Guide d'apprentissage complet : /walkthrough

Ce dépôt inclut un **parcours d'apprentissage en 12 modules** qui décompose cet exemple de serveur MCP pour le commerce de détail en leçons digestes et étape par étape. Le parcours transforme cet exemple fonctionnel en une ressource éducative complète, idéale pour les développeurs souhaitant comprendre comment construire des serveurs MCP prêts pour la production avec intégration de bases de données.

### Ce que vous apprendrez

Le parcours couvre tout, des concepts de base MCP au déploiement avancé en production, y compris :

- **Fondamentaux MCP** : Comprendre le Model Context Protocol et ses applications réelles
- **Intégration de bases de données** : Mise en œuvre d'une connectivité PostgreSQL sécurisée avec sécurité au niveau des lignes
- **Fonctionnalités améliorées par l'IA** : Ajout de capacités de recherche sémantique avec les embeddings Azure OpenAI
- **Mise en œuvre de la sécurité** : Authentification, autorisation et isolation des données de niveau entreprise
- **Développement d'outils** : Construction d'outils MCP sophistiqués pour l'analyse des données et l'intelligence d'affaires
- **Tests et débogage** : Stratégies de test complètes et techniques de débogage
- **Intégration VS Code** : Configuration de l'IA Chat pour des requêtes de bases de données en langage naturel
- **Déploiement en production** : Conteneurisation, mise à l'échelle et stratégies de déploiement cloud
- **Surveillance et observabilité** : Application Insights, journalisation et surveillance des performances

### Aperçu du parcours d'apprentissage

Le parcours suit une structure progressive conçue pour les développeurs de tous niveaux :

| Module | Domaine d'intérêt | Description | Estimation de temps |
|--------|-------------------|-------------|---------------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | Fondations | Concepts MCP, étude de cas Zava Retail, aperçu de l'architecture | 30 minutes |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | Modèles de conception | Architecture technique, conception en couches, composants système | 45 minutes |
| **[02-Sécurité](walkthrough/02-Security/README.md)** | Sécurité d'entreprise | Authentification Azure, sécurité au niveau des lignes, isolation multi-locataires | 60 minutes |
| **[03-Configuration](walkthrough/03-Setup/README.md)** | Environnement | Configuration Docker, CLI Azure, configuration du projet, validation | 45 minutes |
| **[04-Base de données](walkthrough/04-Database/README.md)** | Couche de données | Schéma PostgreSQL, pgvector, politiques RLS, données d'exemple | 60 minutes |
| **[05-Serveur MCP](walkthrough/05-MCP-Server/README.md)** | Mise en œuvre principale | Framework FastMCP, intégration de bases de données, gestion des connexions | 90 minutes |
| **[06-Outils](walkthrough/06-Tools/README.md)** | Développement d'outils | Création d'outils MCP, validation des requêtes, fonctionnalités d'intelligence d'affaires | 75 minutes |
| **[07-Recherche sémantique](walkthrough/07-Semantic-Search/README.md)** | Intégration IA | Embeddings Azure OpenAI, recherche vectorielle, stratégies de recherche hybride | 60 minutes |
| **[08-Tests](walkthrough/08-Testing/README.md)** | Assurance qualité | Tests unitaires, tests d'intégration, tests de performance, débogage | 75 minutes |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Expérience de développement | Configuration VS Code, intégration IA Chat, workflows de débogage | 45 minutes |
| **[10-Déploiement](walkthrough/10-Deployment/README.md)** | Prêt pour la production | Conteneurisation, Azure Container Apps, pipelines CI/CD, mise à l'échelle | 90 minutes |
| **[11-Surveillance](walkthrough/11-Monitoring/README.md)** | Observabilité | Application Insights, journalisation structurée, métriques de performance | 60 minutes |
| **[12-Bonnes pratiques](walkthrough/12-Best-Practices/README.md)** | Excellence en production | Renforcement de la sécurité, optimisation des performances, modèles d'entreprise | 45 minutes |

**Temps total d'apprentissage** : ~12-15 heures d'apprentissage pratique complet

### 🎯 Comment utiliser le parcours

**Pour les débutants** :
1. Commencez par [Module 00 : Introduction](walkthrough/00-Introduction/README.md) pour comprendre les fondamentaux MCP
2. Suivez les modules dans l'ordre pour une expérience d'apprentissage complète
3. Chaque module s'appuie sur les concepts précédents et inclut des exercices pratiques

**Pour les développeurs expérimentés** :
1. Consultez le [Résumé principal du parcours](walkthrough/README.md) pour un aperçu des modules
2. Passez directement aux modules qui vous intéressent (par exemple, Module 07 pour l'intégration IA)
3. Utilisez les modules individuels comme matériel de référence pour vos propres projets

**Pour une mise en œuvre en production** :
1. Concentrez-vous sur les Modules 02 (Sécurité), 10 (Déploiement) et 11 (Surveillance)
2. Consultez le Module 12 (Bonnes pratiques) pour des directives d'entreprise
3. Utilisez les exemples de code comme modèles prêts pour la production

### 🚀 Options de démarrage rapide

**Option 1 : Parcours complet** (Recommandé pour les nouveaux)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Option 2 : Mise en œuvre pratique** (Commencez directement à construire)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Option 3 : Focus sur la production** (Déploiement d'entreprise)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Prérequis pour l'apprentissage

**Connaissances recommandées** :
- Expérience de base en programmation Python
- Familiarité avec les API REST et les bases de données
- Compréhension générale des concepts d'IA/ML
- Connaissances de base en ligne de commande et Docker

**Non requis (mais utile)** :
- Expérience préalable avec MCP (nous couvrons cela depuis le début)
- Expérience avec le cloud Azure (nous fournissons des instructions pas à pas)
- Connaissances avancées de PostgreSQL (nous expliquons les concepts au besoin)

### 💡 Conseils pour l'apprentissage

1. **Approche pratique** : Chaque module inclut des exemples de code fonctionnels que vous pouvez exécuter et modifier
2. **Complexité progressive** : Les concepts évoluent graduellement du simple au complexe
3. **Contexte réel** : Tous les exemples utilisent des scénarios réalistes du commerce de détail
4. **Prêt pour la production** : Les exemples de code sont conçus pour une utilisation réelle en production
5. **Support communautaire** : Rejoignez notre [communauté Discord](https://discord.com/invite/ByRwuEEgH4) pour obtenir de l'aide et participer aux discussions

### 🔗 Ressources associées

- **[MCP pour débutants](https://aka.ms/mcp-for-beginners)** : Lecture essentielle pour les bases
- **[Exemple de présentation](Sample_Walkthrough.md)** : Aperçu technique de haut niveau
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)** : Plateforme cloud utilisée dans les exemples
- **[Framework FastMCP](https://github.com/jlowin/fastmcp)** : Framework Python pour l'implémentation MCP

**Prêt à commencer ?** Débutez avec **[Module 00 : Introduction](walkthrough/00-Introduction/README.md)** ou explorez **[l'aperçu complet du guide](walkthrough/README.md)**.

## Prérequis

1. Docker Desktop installé
2. Git installé
3. **Azure CLI** : Installez et authentifiez-vous avec Azure CLI
4. Accès au modèle OpenAI `text-embedding-3-small` et éventuellement au modèle `gpt-4o-mini`.

## Démarrage

Ouvrez une fenêtre de terminal et exécutez les commandes suivantes :

1. Authentifiez-vous avec Azure CLI

    ```bash
    az login
    ```

2. Clonez le dépôt

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Accédez au répertoire du projet

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Déployer les ressources Azure

Exécutez les scripts suivants pour automatiser le déploiement des ressources Azure nécessaires au serveur MCP.

Les scripts de déploiement déploieront automatiquement le modèle `text-embedding-3-small`. Pendant le déploiement, vous aurez la possibilité d'inclure également le modèle `gpt-4o-mini`. Notez que `gpt-4o-mini` **n'est pas requis** pour ce projet et est uniquement inclus pour d'éventuelles améliorations futures.

**Choisissez le script adapté à votre plateforme :**

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

## Exécution du serveur MCP

La manière la plus simple d'exécuter l'ensemble complet (PostgreSQL + serveur MCP) est d'utiliser Docker Compose :

### Démarrer la pile

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

## Utilisation

Les étapes suivantes supposent que vous utiliserez le support intégré du serveur MCP dans VS Code.

1. Ouvrez le projet dans VS Code. Depuis le terminal, exécutez :

    ```bash
    code .
    ```

2. Démarrez un ou plusieurs serveurs MCP en utilisant les configurations dans `.vscode/mcp.json`. Le fichier contient quatre configurations de serveur différentes, chacune représentant un rôle de gestionnaire de magasin distinct :

   - Chaque configuration utilise un ID utilisateur RLS (Row Level Security) unique
   - Ces ID utilisateurs simulent différentes identités de gestionnaires de magasin accédant à la base de données
   - Le système RLS limite l'accès aux données en fonction du magasin assigné au gestionnaire
   - Cela imite des scénarios réels où les gestionnaires de magasin se connectent avec différents comptes Entra ID

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

### Ouvrir le chat AI dans VS Code

1. Activez le mode Chat AI dans VS Code
2. Tapez **#zava** et sélectionnez l'un des serveurs MCP que vous avez démarrés
3. Posez des questions sur les données de ventes - Voir les exemples de requêtes ci-dessous

### Exemples de requêtes

1. Affichez les 20 produits les plus vendus par chiffre d'affaires
1. Affichez les ventes par magasin
1. Quelles ont été les ventes du dernier trimestre par catégorie ?
1. Quels produits vendons-nous qui sont similaires à "conteneurs pour peinture" ?

## Fonctionnalités

- **Accès au schéma multi-tables** : Récupérez les schémas de plusieurs tables de base de données en une seule requête
- **Exécution sécurisée des requêtes** : Exécutez des requêtes PostgreSQL avec prise en charge de la sécurité au niveau des lignes (RLS)
- **Données en temps réel** : Accédez aux données actuelles de ventes, d'inventaire et de clients
- **Utilitaires de date/heure** : Obtenez des horodatages UTC actuels pour les analyses sensibles au temps
- **Déploiement flexible** : Prend en charge le mode serveur HTTP

## Tables prises en charge

Le serveur fournit un accès aux tables de base de données suivantes du commerce de détail :

- `retail.customers` - Informations et profils des clients
- `retail.stores` - Emplacements et détails des magasins
- `retail.categories` - Catégories de produits et hiérarchies
- `retail.product_types` - Classifications des types de produits
- `retail.products` - Catalogue et spécifications des produits
- `retail.orders` - Commandes et transactions des clients
- `retail.order_items` - Articles individuels dans les commandes
- `retail.inventory` - Niveaux d'inventaire actuels et données de stock

## Outils disponibles

### `get_multiple_table_schemas`

Récupérez les schémas de base de données pour plusieurs tables en une seule requête.

**Paramètres :**

- `table_names` (list[str]) : Liste des noms de tables valides parmi les tables prises en charge ci-dessus

**Retourne :** Chaînes de schéma concaténées pour les tables demandées

### `execute_sales_query`

Exécutez des requêtes PostgreSQL sur la base de données de ventes avec prise en charge de la sécurité au niveau des lignes.

**Paramètres :**

- `postgresql_query` (str) : Une requête PostgreSQL bien formée

**Retourne :** Résultats de la requête formatés en chaîne (limités à 20 lignes pour une meilleure lisibilité)

**Bonnes pratiques :**

- Récupérez toujours les schémas de table en premier
- Utilisez les noms de colonnes exacts des schémas
- Joignez les tables liées pour une analyse complète
- Agrégez les résultats lorsque cela est approprié
- Limitez la sortie pour une meilleure lisibilité

### `get_current_utc_date`

Obtenez la date et l'heure UTC actuelles au format ISO.

**Retourne :** Date/heure UTC actuelle au format ISO (AAAA-MM-JJTHH:MM:SS.fffffZ)

### `semantic_search_products`

Effectuez une recherche sémantique de produits basée sur les requêtes des utilisateurs.

**Retourne :** Une liste de produits correspondant aux critères de recherche

**Paramètres :**

- `query` (str) : La chaîne de requête de recherche

**Retourne :** Une liste de produits correspondant aux critères de recherche

## Fonctionnalités de sécurité

### Sécurité au niveau des lignes (RLS)

Le serveur implémente la sécurité au niveau des lignes pour garantir que les utilisateurs accèdent uniquement aux données qu'ils sont autorisés à consulter :

- **Mode HTTP** : Utilise l'en-tête `x-rls-user-id` pour identifier l'utilisateur demandeur

- **Fallback par défaut** : Utilise un UUID de remplacement lorsque aucun ID utilisateur n'est fourni

#### ID utilisateur RLS spécifiques aux magasins

Chaque emplacement de magasin Zava Retail possède un ID utilisateur RLS unique qui détermine les données auxquelles l'utilisateur peut accéder :

| Emplacement du magasin | ID utilisateur RLS | Description |
|------------------------|--------------------|-------------|
| **Accès global** | `00000000-0000-0000-0000-000000000000` | Fallback par défaut - accès à tous les magasins |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Données du magasin Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Données du magasin Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Données du magasin Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Données du magasin Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Données du magasin Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Données du magasin Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Données du magasin Zava Retail Kirkland |
| **En ligne** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Données du magasin Zava Retail en ligne |

#### Implémentation RLS

Lorsqu'un utilisateur se connecte avec l'ID utilisateur RLS d'un magasin spécifique, il ne verra que :

- Les clients associés à ce magasin
- Les commandes passées à cet emplacement de magasin
- Les données d'inventaire pour ce magasin spécifique
- Les métriques de ventes et de performance spécifiques au magasin

Cela garantit l'isolation des données entre les différents emplacements de magasin tout en maintenant un schéma de base de données unifié.

## Architecture

### Contexte de l'application

Le serveur utilise un contexte d'application géré avec :

- **Pool de connexions à la base de données** : Gestion efficace des connexions pour le mode HTTP
- **Gestion du cycle de vie** : Nettoyage approprié des ressources lors de l'arrêt
- **Sécurité des types** : Contexte fortement typé avec la classe `AppContext`

### Contexte de la requête

- **Extraction des en-têtes** : Analyse sécurisée des en-têtes pour l'identification des utilisateurs
- **Intégration RLS** : Résolution automatique de l'ID utilisateur à partir du contexte de la requête
- **Gestion des erreurs** : Gestion complète des erreurs avec des messages conviviaux

## Intégration de la base de données

Le serveur s'intègre à une base de données PostgreSQL via la classe `PostgreSQLSchemaProvider` :

- **Pooling de connexions** : Utilise des pools de connexions asynchrones pour la scalabilité
- **Métadonnées des schémas** : Fournit des informations détaillées sur les schémas de table
- **Exécution des requêtes** : Exécution sécurisée des requêtes avec prise en charge RLS
- **Gestion des ressources** : Nettoyage automatique des ressources de la base de données

## Gestion des erreurs

Le serveur implémente une gestion robuste des erreurs :

- **Validation des tables** : Garantit que seuls les noms de tables valides sont accessibles
- **Validation des requêtes** : Valide les requêtes PostgreSQL avant leur exécution
- **Gestion des ressources** : Nettoyage approprié même en cas d'erreurs
- **Messages conviviaux** : Messages d'erreur clairs pour le dépannage

## Considérations de sécurité

1. **Sécurité au niveau des lignes** : Toutes les requêtes respectent les politiques RLS basées sur l'identité de l'utilisateur
2. **Isolation des données des magasins** : L'ID utilisateur RLS de chaque magasin garantit l'accès uniquement aux données de ce magasin
3. **Validation des entrées** : Les noms de tables et les requêtes sont validés avant l'exécution
4. **Limites de ressources** : Les résultats des requêtes sont limités pour éviter une utilisation excessive des ressources
5. **Sécurité des connexions** : Utilise des pratiques sécurisées de connexion à la base de données
6. **Vérification de l'identité de l'utilisateur** : Assurez-vous toujours que l'ID utilisateur RLS correct est utilisé pour le magasin prévu

### Notes importantes sur la sécurité

- **Ne jamais utiliser les ID utilisateur RLS de production dans les environnements de développement**
- **Toujours vérifier que l'ID utilisateur RLS correspond au magasin prévu avant d'exécuter des requêtes**
- **L'UUID par défaut (`00000000-0000-0000-0000-000000000000`) offre un accès limité**
- **Chaque gestionnaire de magasin ne doit avoir accès qu'à l'ID utilisateur RLS de son magasin**

## Développement

### Structure du projet

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Composants clés

- **Serveur FastMCP** : Implémentation moderne du serveur MCP avec support asynchrone
- **Fournisseur PostgreSQL** : Couche d'abstraction de base de données avec prise en charge RLS
- **Gestion du contexte** : Gestion de contexte d'application et de requête fortement typée
- **Enregistrement des outils** : Enregistrement déclaratif des outils avec validation Pydantic

## Contribution

Lors de la contribution à ce serveur :

1. Assurez-vous que toutes les requêtes de base de données respectent la sécurité au niveau des lignes
2. Ajoutez une gestion des erreurs appropriée pour les nouveaux outils
3. Mettez à jour ce README avec toutes les nouvelles fonctionnalités ou modifications
4. Testez le mode serveur HTTP
5. Validez les paramètres d'entrée et fournissez des messages d'erreur clairs

## [Licence](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ce serveur MCP permet un accès sécurisé et efficace aux données de ventes de Zava Retail pour des analyses et des insights alimentés par l'IA.*

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.