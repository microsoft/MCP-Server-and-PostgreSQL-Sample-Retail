<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:43:48+00:00",
  "source_file": "README.md",
  "language_code": "it"
}
-->
# Esempio di MCP Server e PostgreSQL - Analisi delle Vendite al Dettaglio

## Impara MCP con l'integrazione del database attraverso esempi pratici

[![Contributori GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Problemi GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Pull Request GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Unisciti al Discord di Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Segui questi passaggi per iniziare a utilizzare queste risorse:

1. **Fai un Fork del Repository**: Clicca [qui per fare un fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clona il Repository**: `git clone https://github.com/TUO-NOME-UTENTE/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Unisciti al Discord di Azure AI Foundry**: [Incontra esperti e sviluppatori](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Supporto Multilingue

#### Supportato tramite GitHub Action (Automatizzato e Sempre Aggiornato)

[Francese](../fr/README.md) | [Spagnolo](../es/README.md) | [Tedesco](../de/README.md) | [Russo](../ru/README.md) | [Arabo](../ar/README.md) | [Persiano (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Cinese (Semplificato)](../zh/README.md) | [Cinese (Tradizionale, Macao)](../mo/README.md) | [Cinese (Tradizionale, Hong Kong)](../hk/README.md) | [Cinese (Tradizionale, Taiwan)](../tw/README.md) | [Giapponese](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalese](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portoghese (Portogallo)](../pt/README.md) | [Portoghese (Brasile)](../br/README.md) | [Italiano](./README.md) | [Polacco](../pl/README.md) | [Turco](../tr/README.md) | [Greco](../el/README.md) | [Tailandese](../th/README.md) | [Svedese](../sv/README.md) | [Danese](../da/README.md) | [Norvegese](../no/README.md) | [Finlandese](../fi/README.md) | [Olandese](../nl/README.md) | [Ebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonesiano](../id/README.md) | [Malese](../ms/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungherese](../hu/README.md) | [Ceco](../cs/README.md) | [Slovacco](../sk/README.md) | [Rumeno](../ro/README.md) | [Bulgaro](../bg/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Croato](../hr/README.md) | [Sloveno](../sl/README.md) | [Ucraino](../uk/README.md) | [Birmano (Myanmar)](../my/README.md)

**Se desideri supportare ulteriori lingue, l'elenco delle lingue supportate è disponibile [qui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduzione

Questo esempio dimostra come costruire e distribuire un completo **server Model Context Protocol (MCP)** che fornisce agli assistenti AI un accesso sicuro e intelligente ai dati di vendita al dettaglio tramite PostgreSQL. Il progetto mette in evidenza funzionalità di livello aziendale, tra cui **Row Level Security (RLS)**, **capacità di ricerca semantica** e **integrazione con Azure AI** per scenari di analisi delle vendite reali.

**Casi d'uso principali:**
- **Analisi delle vendite potenziata dall'AI**: Consenti agli assistenti AI di interrogare e analizzare i dati di vendita al dettaglio tramite linguaggio naturale
- **Accesso sicuro multi-tenant**: Dimostra l'implementazione della Row Level Security in cui i diversi gestori di negozio possono accedere solo ai dati del proprio negozio
- **Ricerca semantica dei prodotti**: Mostra la scoperta di prodotti potenziata dall'AI utilizzando embedding testuali
- **Integrazione aziendale**: Illustra come integrare i server MCP con i servizi Azure e i database PostgreSQL

**Perfetto per:**
- Sviluppatori che vogliono imparare a costruire server MCP con integrazione del database
- Data engineer che implementano soluzioni di analisi multi-tenant sicure
- Sviluppatori di applicazioni AI che lavorano con dati di vendita al dettaglio o e-commerce
- Chiunque sia interessato a combinare assistenti AI con database aziendali

## Unisciti alla Community Discord di Azure AI Foundry
Condividi le tue esperienze con MCP e incontra esperti e gruppi di prodotto

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# MCP Server per l'Analisi delle Vendite

Un server Model Context Protocol (MCP) che fornisce un accesso completo al database delle vendite dei clienti per il business Zava Retail DIY. Questo server consente agli assistenti AI di interrogare e analizzare i dati di vendita al dettaglio attraverso un'interfaccia sicura e consapevole dello schema.

## 📚 Guida Completa all'Implementazione

Per una spiegazione dettagliata su come è costruita questa soluzione e su come implementare server MCP simili, consulta la nostra **[Guida all'Esempio](Sample_Walkthrough.md)**. Questa guida fornisce:

- **Approfondimento sull'Architettura**: Analisi dei componenti e modelli di progettazione
- **Costruzione Passo-Passo**: Dalla configurazione del progetto alla distribuzione
- **Analisi del Codice**: Spiegazione dettagliata dell'implementazione del server MCP
- **Funzionalità Avanzate**: Row Level Security, ricerca semantica e monitoraggio
- **Best Practice**: Linee guida per sicurezza, prestazioni e sviluppo
- **Risoluzione dei Problemi**: Problemi comuni e soluzioni

Perfetto per sviluppatori che vogliono comprendere i dettagli dell'implementazione e costruire soluzioni simili.

## 🤖 Cos'è MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** è uno standard aperto che consente agli assistenti AI di accedere in modo sicuro a fonti di dati e strumenti esterni in tempo reale. Pensalo come un ponte che permette ai modelli AI di connettersi con database, API, file system e altre risorse mantenendo sicurezza e controllo.

### Vantaggi principali:
- **Accesso ai Dati in Tempo Reale**: Gli assistenti AI possono interrogare database e API live
- **Integrazione Sicura**: Accesso controllato con autenticazione e permessi  
- **Estensibilità degli Strumenti**: Aggiungi capacità personalizzate agli assistenti AI
- **Protocollo Standardizzato**: Funziona su diverse piattaforme e strumenti AI

### Nuovo a MCP?

Se sei nuovo al Model Context Protocol, ti consigliamo di iniziare con le risorse introduttive di Microsoft:

**📖 [Guida per Principianti a MCP](https://aka.ms/mcp-for-beginners)**

Questa risorsa fornisce:
- Introduzione ai concetti e all'architettura di MCP
- Tutorial passo-passo per costruire il tuo primo server MCP
- Best practice per lo sviluppo MCP
- Esempi di integrazione con piattaforme AI popolari
- Risorse e supporto della community

Una volta compresi i concetti di base, torna qui per esplorare questa implementazione avanzata per l'analisi delle vendite al dettaglio!

## 📚 Guida Completa all'Apprendimento: /walkthrough

Questo repository include un **percorso di apprendimento completo in 12 moduli** che scompone questo esempio di server MCP per il retail in lezioni digeribili e passo-passo. Il walkthrough trasforma questo esempio funzionante in una risorsa educativa completa, perfetta per sviluppatori che vogliono imparare a costruire server MCP pronti per la produzione con integrazione del database.

### Cosa Imparerai

Il walkthrough copre tutto, dai concetti base di MCP alla distribuzione avanzata in produzione, inclusi:

- **Fondamenti di MCP**: Comprendere il Model Context Protocol e le sue applicazioni reali
- **Integrazione del Database**: Implementare una connessione sicura a PostgreSQL con Row Level Security
- **Funzionalità Potenziate dall'AI**: Aggiungere capacità di ricerca semantica con embedding di Azure OpenAI
- **Implementazione della Sicurezza**: Autenticazione, autorizzazione e isolamento dei dati di livello aziendale
- **Sviluppo di Strumenti**: Costruire strumenti MCP sofisticati per analisi dei dati e business intelligence
- **Test e Debugging**: Strategie di test complete e tecniche di debugging
- **Integrazione con VS Code**: Configurare AI Chat per query di database in linguaggio naturale
- **Distribuzione in Produzione**: Containerizzazione, scalabilità e strategie di distribuzione nel cloud
- **Monitoraggio e Osservabilità**: Application Insights, logging e monitoraggio delle prestazioni

### Panoramica del Percorso di Apprendimento

Il walkthrough segue una struttura di apprendimento progressiva progettata per sviluppatori di tutti i livelli di competenza:

| Modulo | Area di Focus | Descrizione | Tempo Stimato |
|--------|---------------|-------------|---------------|
| **[00-Introduzione](walkthrough/00-Introduction/README.md)** | Fondamenti | Concetti di MCP, caso studio Zava Retail, panoramica dell'architettura | 30 minuti |
| **[01-Architettura](walkthrough/01-Architecture/README.md)** | Modelli di Progettazione | Architettura tecnica, design a livelli, componenti del sistema | 45 minuti |
| **[02-Sicurezza](walkthrough/02-Security/README.md)** | Sicurezza Aziendale | Autenticazione Azure, Row Level Security, isolamento multi-tenant | 60 minuti |
| **[03-Setup](walkthrough/03-Setup/README.md)** | Ambiente | Configurazione Docker, Azure CLI, configurazione del progetto, validazione | 45 minuti |
| **[04-Database](walkthrough/04-Database/README.md)** | Livello Dati | Schema PostgreSQL, pgvector, politiche RLS, dati di esempio | 60 minuti |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | Implementazione Core | Framework FastMCP, integrazione database, gestione connessioni | 90 minuti |
| **[06-Strumenti](walkthrough/06-Tools/README.md)** | Sviluppo Strumenti | Creazione di strumenti MCP, validazione query, funzionalità di business intelligence | 75 minuti |
| **[07-Ricerca-Semantica](walkthrough/07-Semantic-Search/README.md)** | Integrazione AI | Embedding di Azure OpenAI, ricerca vettoriale, strategie di ricerca ibrida | 60 minuti |
| **[08-Test](walkthrough/08-Testing/README.md)** | Assicurazione Qualità | Test unitari, test di integrazione, test delle prestazioni, debugging | 75 minuti |
| **[09-VS-Code](walkthrough/09-VS-Code/README.md)** | Esperienza di Sviluppo | Configurazione di VS Code, integrazione AI Chat, flussi di lavoro di debugging | 45 minuti |
| **[10-Distribuzione](walkthrough/10-Deployment/README.md)** | Pronto per la Produzione | Containerizzazione, Azure Container Apps, pipeline CI/CD, scalabilità | 90 minuti |
| **[11-Monitoraggio](walkthrough/11-Monitoring/README.md)** | Osservabilità | Application Insights, logging strutturato, metriche di prestazione | 60 minuti |
| **[12-Best-Practices](walkthrough/12-Best-Practices/README.md)** | Eccellenza in Produzione | Rafforzamento della sicurezza, ottimizzazione delle prestazioni, modelli aziendali | 45 minuti |

**Tempo Totale di Apprendimento**: ~12-15 ore di apprendimento pratico completo

### 🎯 Come Usare il Walkthrough

**Per Principianti**:
1. Inizia con il [Modulo 00: Introduzione](walkthrough/00-Introduction/README.md) per comprendere i fondamenti di MCP
2. Segui i moduli in ordine per un'esperienza di apprendimento completa
3. Ogni modulo si basa sui concetti precedenti e include esercizi pratici

**Per Sviluppatori Esperti**:
1. Consulta la [Panoramica Principale del Walkthrough](walkthrough/README.md) per un riepilogo completo dei moduli
2. Vai direttamente ai moduli che ti interessano (es. Modulo 07 per l'integrazione AI)
3. Usa i singoli moduli come materiale di riferimento per i tuoi progetti

**Per Implementazioni in Produzione**:
1. Concentrati sui Moduli 02 (Sicurezza), 10 (Distribuzione) e 11 (Monitoraggio)
2. Consulta il Modulo 12 (Best Practices) per linee guida aziendali
3. Usa gli esempi di codice come modelli pronti per la produzione

### 🚀 Opzioni di Avvio Rapido

**Opzione 1: Percorso di Apprendimento Completo** (Consigliato per i principianti)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opzione 2: Implementazione Pratica** (Inizia subito a costruire)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opzione 3: Focus sulla Produzione** (Distribuzione aziendale)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Prerequisiti di apprendimento

**Background consigliato**:
- Esperienza di base con la programmazione in Python
- Familiarità con REST API e database
- Comprensione generale dei concetti di AI/ML
- Conoscenze di base della riga di comando e di Docker

**Non richiesto (ma utile)**:
- Esperienza precedente con MCP (lo trattiamo da zero)
- Esperienza con il cloud Azure (forniamo una guida passo-passo)
- Conoscenze avanzate di PostgreSQL (spieghiamo i concetti quando necessario)

### 💡 Consigli per l'apprendimento

1. **Approccio pratico**: Ogni modulo include esempi di codice funzionanti che puoi eseguire e modificare
2. **Complessità progressiva**: I concetti si sviluppano gradualmente da semplici ad avanzati
3. **Contesto reale**: Tutti gli esempi utilizzano scenari realistici di business retail
4. **Pronto per la produzione**: Gli esempi di codice sono progettati per un utilizzo reale in produzione
5. **Supporto della comunità**: Unisciti alla nostra [comunità Discord](https://discord.com/invite/ByRwuEEgH4) per aiuto e discussioni

### 🔗 Risorse correlate

- **[MCP per principianti](https://aka.ms/mcp-for-beginners)**: Lettura essenziale di base
- **[Esempio di walkthrough](Sample_Walkthrough.md)**: Panoramica tecnica ad alto livello
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Piattaforma cloud utilizzata negli esempi
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework Python per l'implementazione MCP

**Pronto per iniziare?** Comincia con **[Modulo 00: Introduzione](walkthrough/00-Introduction/README.md)** o esplora la **[panoramica completa del walkthrough](walkthrough/README.md)**.

## Prerequisiti

1. Docker Desktop installato
2. Git installato
3. **Azure CLI**: Installa e autentica con Azure CLI
4. Accesso al modello OpenAI `text-embedding-3-small` e, opzionalmente, al modello `gpt-4o-mini`.

## Per iniziare

Apri una finestra del terminale ed esegui i seguenti comandi:

1. Autenticati con Azure CLI

    ```bash
    az login
    ```

2. Clona il repository

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Vai alla directory del progetto

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Distribuire risorse Azure

Esegui i seguenti script per automatizzare la distribuzione delle risorse Azure necessarie per il server MCP.

Gli script di distribuzione installeranno automaticamente il modello `text-embedding-3-small`. Durante la distribuzione, avrai l'opzione di includere anche il modello `gpt-4o-mini`. Nota che `gpt-4o-mini` **non è richiesto** per questo progetto ed è incluso solo per eventuali miglioramenti futuri.

**Scegli lo script per la tua piattaforma:**

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

## Esecuzione del server MCP

Il modo più semplice per eseguire l'intero stack (PostgreSQL + Server MCP) è utilizzare Docker Compose:

### Avvia lo stack

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

## Utilizzo

Si presume che utilizzerai il supporto integrato del server MCP in VS Code.

1. Apri il progetto in VS Code. Dal terminale, esegui:

    ```bash
    code .
    ```

2. Avvia uno o più server MCP utilizzando le configurazioni in `.vscode/mcp.json`. Il file contiene quattro diverse configurazioni di server, ciascuna rappresentante un ruolo di manager di negozio diverso:

   - Ogni configurazione utilizza un ID utente RLS (Row Level Security) unico
   - Questi ID utente simulano identità di manager di negozio diversi che accedono al database
   - Il sistema RLS limita l'accesso ai dati in base al negozio assegnato al manager
   - Questo simula scenari reali in cui i manager di negozio accedono con account Entra ID diversi

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

### Apri AI Chat in VS Code

1. Apri la modalità AI Chat in VS Code
2. Digita **#zava** e seleziona uno dei server MCP che hai avviato
3. Fai domande sui dati di vendita - Vedi esempi di query qui sotto

### Esempi di query

1. Mostra i primi 20 prodotti per ricavi di vendita
1. Mostra le vendite per negozio
1. Quali sono state le vendite dell'ultimo trimestre per categoria?
1. Quali prodotti vendiamo simili a "contenitori per vernice"?

## Funzionalità

- **Accesso a schema multi-tabella**: Recupera gli schemi di più tabelle del database in una singola richiesta
- **Esecuzione sicura delle query**: Esegui query PostgreSQL con supporto Row Level Security (RLS)
- **Dati in tempo reale**: Accedi a dati di vendita, inventario e clienti aggiornati
- **Utilità di data/ora**: Ottieni timestamp UTC correnti per analisi sensibili al tempo
- **Distribuzione flessibile**: Supporta la modalità server HTTP

## Tabelle supportate

Il server fornisce accesso alle seguenti tabelle del database retail:

- `retail.customers` - Informazioni e profili dei clienti
- `retail.stores` - Posizioni e dettagli dei negozi
- `retail.categories` - Categorie di prodotti e gerarchie
- `retail.product_types` - Classificazioni dei tipi di prodotto
- `retail.products` - Catalogo e specifiche dei prodotti
- `retail.orders` - Ordini e transazioni dei clienti
- `retail.order_items` - Articoli individuali all'interno degli ordini
- `retail.inventory` - Livelli di inventario e dati di stock attuali

## Strumenti disponibili

### `get_multiple_table_schemas`

Recupera gli schemi del database per più tabelle in una singola richiesta.

**Parametri:**

- `table_names` (list[str]): Elenco di nomi di tabelle validi tra quelli supportati sopra

**Restituisce:** Stringhe di schema concatenate per le tabelle richieste

### `execute_sales_query`

Esegui query PostgreSQL sul database delle vendite con Row Level Security.

**Parametri:**

- `postgresql_query` (str): Una query PostgreSQL ben formata

**Restituisce:** Risultati della query formattati come stringa (limitati a 20 righe per leggibilità)

**Best Practices:**

- Recupera sempre prima gli schemi delle tabelle
- Usa nomi di colonne esatti dagli schemi
- Unisci tabelle correlate per analisi complete
- Aggrega i risultati quando appropriato
- Limita l'output per la leggibilità

### `get_current_utc_date`

Ottieni la data e l'ora UTC corrente in formato ISO.

**Restituisce:** Data/ora UTC corrente in formato ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Esegui una ricerca semantica di prodotti basata su query dell'utente.

**Restituisce:** Un elenco di prodotti che corrispondono ai criteri di ricerca

**Parametri:**

- `query` (str): La stringa di query di ricerca

**Restituisce:** Un elenco di prodotti che corrispondono ai criteri di ricerca

## Funzionalità di sicurezza

### Row Level Security (RLS)

Il server implementa Row Level Security per garantire che gli utenti accedano solo ai dati autorizzati:

- **Modalità HTTP**: Utilizza l'intestazione `x-rls-user-id` per identificare l'utente richiedente

- **Fallback predefinito**: Utilizza un UUID segnaposto quando non viene fornito un ID utente

#### ID utente RLS specifici per negozio

Ogni negozio Zava Retail ha un ID utente RLS unico che determina quali dati l'utente può accedere:

| Posizione negozio | ID utente RLS | Descrizione |
|-------------------|---------------|-------------|
| **Accesso globale** | `00000000-0000-0000-0000-000000000000` | Fallback predefinito - accesso a tutti i negozi |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Dati del negozio Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Dati del negozio Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Dati del negozio Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Dati del negozio Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Dati del negozio Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Dati del negozio Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Dati del negozio Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Dati del negozio Zava Retail Online |

#### Implementazione RLS

Quando un utente si connette con l'ID utente RLS di un negozio specifico, vedrà solo:

- Clienti associati a quel negozio
- Ordini effettuati presso quella sede
- Dati di inventario per quel negozio specifico
- Metriche di vendita e prestazioni specifiche del negozio

Questo garantisce l'isolamento dei dati tra le diverse sedi dei negozi mantenendo uno schema unificato del database.

## Architettura

### Contesto applicativo

Il server utilizza un contesto applicativo gestito con:

- **Pool di connessione al database**: Gestione efficiente delle connessioni per la modalità HTTP
- **Gestione del ciclo di vita**: Pulizia corretta delle risorse alla chiusura
- **Sicurezza dei tipi**: Contesto fortemente tipizzato con la classe `AppContext`

### Contesto della richiesta

- **Estrazione delle intestazioni**: Parsing sicuro delle intestazioni per l'identificazione dell'utente
- **Integrazione RLS**: Risoluzione automatica dell'ID utente dal contesto della richiesta
- **Gestione degli errori**: Gestione completa degli errori con messaggi user-friendly

## Integrazione del database

Il server si integra con un database PostgreSQL tramite la classe `PostgreSQLSchemaProvider`:

- **Pooling delle connessioni**: Utilizza pool di connessioni asincrone per scalabilità
- **Metadati dello schema**: Fornisce informazioni dettagliate sugli schemi delle tabelle
- **Esecuzione delle query**: Esecuzione sicura delle query con supporto RLS
- **Gestione delle risorse**: Pulizia automatica delle risorse del database

## Gestione degli errori

Il server implementa una gestione robusta degli errori:

- **Validazione delle tabelle**: Garantisce l'accesso solo a nomi di tabelle validi
- **Validazione delle query**: Valida le query PostgreSQL prima dell'esecuzione
- **Gestione delle risorse**: Pulizia corretta anche in caso di errori
- **Messaggi user-friendly**: Messaggi di errore chiari per la risoluzione dei problemi

## Considerazioni sulla sicurezza

1. **Row Level Security**: Tutte le query rispettano le politiche RLS basate sull'identità dell'utente
2. **Isolamento dei dati del negozio**: L'ID utente RLS di ogni negozio garantisce l'accesso solo ai dati di quel negozio
3. **Validazione degli input**: I nomi delle tabelle e le query vengono validati prima dell'esecuzione
4. **Limiti delle risorse**: I risultati delle query sono limitati per prevenire un uso eccessivo delle risorse
5. **Sicurezza della connessione**: Utilizza pratiche sicure per la connessione al database
6. **Verifica dell'identità dell'utente**: Assicurati sempre che l'ID utente RLS corretto venga utilizzato per la sede del negozio prevista

### Note importanti sulla sicurezza

- **Non utilizzare mai ID utente RLS di produzione in ambienti di sviluppo**
- **Verifica sempre che l'ID utente RLS corrisponda al negozio previsto prima di eseguire query**
- **L'UUID predefinito (`00000000-0000-0000-0000-000000000000`) fornisce accesso limitato**
- **Ogni manager di negozio dovrebbe avere accesso solo all'ID utente RLS del proprio negozio**

## Sviluppo

### Struttura del progetto

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Componenti principali

- **FastMCP Server**: Implementazione moderna del server MCP con supporto asincrono
- **PostgreSQL Provider**: Livello di astrazione del database con supporto RLS
- **Gestione del contesto**: Gestione del contesto applicativo e delle richieste con sicurezza dei tipi
- **Registrazione degli strumenti**: Registrazione dichiarativa degli strumenti con validazione Pydantic

## Contributi

Quando contribuisci a questo server:

1. Assicurati che tutte le query al database rispettino Row Level Security
2. Aggiungi una gestione degli errori adeguata per i nuovi strumenti
3. Aggiorna questo README con eventuali nuove funzionalità o modifiche
4. Testa la modalità server HTTP
5. Valida i parametri di input e fornisci messaggi di errore chiari

## [Licenza](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Questo server MCP consente un accesso sicuro ed efficiente ai dati di vendita di Zava Retail per analisi e approfondimenti basati sull'intelligenza artificiale.*

---

**Disclaimer (Avvertenza)**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.