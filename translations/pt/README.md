<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T17:32:51+00:00",
  "source_file": "README.md",
  "language_code": "pt"
}
-->
# MCP Server e Exemplo PostgreSQL - Análise de Vendas no Retalho

## Aprenda MCP com Integração de Base de Dados através de Exemplos Práticos

[![Contribuidores no GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Problemas no GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Pedidos de Pull no GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Bem-vindos](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Junte-se ao Discord do Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Siga estes passos para começar a usar estes recursos:

1. **Faça um Fork do Repositório**: Clique [aqui para fazer fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone o Repositório**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Junte-se ao Discord do Azure AI Foundry**: [Conheça especialistas e outros programadores](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Suporte Multilingue

#### Suportado via GitHub Action (Automatizado e Sempre Atualizado)

[Francês](../fr/README.md) | [Espanhol](../es/README.md) | [Alemão](../de/README.md) | [Russo](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinês (Simplificado)](../zh/README.md) | [Chinês (Tradicional, Macau)](../mo/README.md) | [Chinês (Tradicional, Hong Kong)](../hk/README.md) | [Chinês (Tradicional, Taiwan)](../tw/README.md) | [Japonês](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Português (Portugal)](./README.md) | [Português (Brasil)](../br/README.md) | [Italiano](../it/README.md) | [Polaco](../pl/README.md) | [Turco](../tr/README.md) | [Grego](../el/README.md) | [Tailandês](../th/README.md) | [Sueco](../sv/README.md) | [Dinamarquês](../da/README.md) | [Norueguês](../no/README.md) | [Finlandês](../fi/README.md) | [Holandês](../nl/README.md) | [Hebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonésio](../id/README.md) | [Malaio](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Húngaro](../hu/README.md) | [Checo](../cs/README.md) | [Eslovaco](../sk/README.md) | [Romeno](../ro/README.md) | [Búlgaro](../bg/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmanês (Myanmar)](../my/README.md)

**Se desejar suporte para idiomas adicionais, os idiomas disponíveis estão listados [aqui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introdução

Este exemplo demonstra como construir e implementar um **servidor Model Context Protocol (MCP)** abrangente que fornece aos assistentes de IA acesso seguro e inteligente a dados de vendas no retalho através do PostgreSQL. O projeto apresenta funcionalidades de nível empresarial, incluindo **Segurança ao Nível de Linhas (RLS)**, **capacidades de pesquisa semântica** e **integração com Azure AI** para cenários reais de análise de vendas no retalho.

**Principais Casos de Uso:**
- **Análise de Vendas Potenciada por IA**: Permitir que assistentes de IA consultem e analisem dados de vendas no retalho através de linguagem natural
- **Acesso Seguro Multi-tenant**: Demonstrar a implementação de Segurança ao Nível de Linhas onde diferentes gestores de loja só podem aceder aos dados da sua loja
- **Pesquisa Semântica de Produtos**: Apresentar descoberta de produtos potenciada por IA usando embeddings de texto
- **Integração Empresarial**: Ilustrar como integrar servidores MCP com serviços Azure e bases de dados PostgreSQL

**Perfeito para:**
- Programadores que querem aprender a construir servidores MCP com integração de base de dados
- Engenheiros de dados que implementam soluções de análise multi-tenant seguras
- Desenvolvedores de aplicações de IA que trabalham com dados de retalho ou e-commerce
- Qualquer pessoa interessada em combinar assistentes de IA com bases de dados empresariais

## Junte-se à Comunidade Discord do Azure AI Foundry
Partilhe as suas experiências com MCP e conheça especialistas e grupos de produtos

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Servidor MCP de Análise de Vendas

Um servidor Model Context Protocol (MCP) que fornece acesso abrangente à base de dados de vendas de clientes para o negócio Zava Retail DIY. Este servidor permite que assistentes de IA consultem e analisem dados de vendas no retalho através de uma interface segura e consciente do esquema.

## 📚 Guia de Implementação Completo

Para uma análise detalhada de como esta solução é construída e como implementar servidores MCP semelhantes, veja o nosso **[Guia de Exemplo](Sample_Walkthrough.md)**. Este guia fornece:

- **Análise de Arquitetura**: Componentes e padrões de design
- **Construção Passo-a-Passo**: Desde a configuração do projeto até à implementação
- **Explicação do Código**: Detalhes sobre a implementação do servidor MCP
- **Funcionalidades Avançadas**: Segurança ao Nível de Linhas, pesquisa semântica e monitorização
- **Melhores Práticas**: Diretrizes de segurança, desempenho e desenvolvimento
- **Resolução de Problemas**: Questões comuns e soluções

Perfeito para programadores que querem entender os detalhes da implementação e construir soluções semelhantes.

## 🤖 O que é MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** é um padrão aberto que permite que assistentes de IA acedam de forma segura a fontes de dados externas e ferramentas em tempo real. Pense nele como uma ponte que permite que modelos de IA se conectem a bases de dados, APIs, sistemas de ficheiros e outros recursos, mantendo a segurança e o controlo.

### Benefícios Principais:
- **Acesso a Dados em Tempo Real**: Assistentes de IA podem consultar bases de dados e APIs ao vivo
- **Integração Segura**: Acesso controlado com autenticação e permissões  
- **Extensibilidade de Ferramentas**: Adicione capacidades personalizadas aos assistentes de IA
- **Protocolo Padronizado**: Funciona em diferentes plataformas e ferramentas de IA

### Novo no MCP?

Se está a começar com o Model Context Protocol, recomendamos os recursos introdutórios abrangentes da Microsoft:

**📖 [Guia MCP para Iniciantes](https://aka.ms/mcp-for-beginners)**

Este recurso fornece:
- Introdução aos conceitos e arquitetura do MCP
- Tutoriais passo-a-passo para construir o seu primeiro servidor MCP
- Melhores práticas para desenvolvimento MCP
- Exemplos de integração com plataformas de IA populares
- Recursos comunitários e suporte

Depois de entender os fundamentos, volte aqui para explorar esta implementação avançada de análise de vendas no retalho!

## 📚 Guia de Aprendizagem Abrangente: /walkthrough

Este repositório inclui um **guia de aprendizagem com 12 módulos** que decompõe este exemplo de servidor MCP para retalho em lições passo-a-passo. O walkthrough transforma este exemplo funcional num recurso educacional abrangente, perfeito para programadores que querem entender como construir servidores MCP prontos para produção com integração de base de dados.

### O que Vai Aprender

O walkthrough cobre tudo, desde conceitos básicos de MCP até implementação avançada em produção, incluindo:

- **Fundamentos do MCP**: Compreender o Model Context Protocol e as suas aplicações no mundo real
- **Integração de Base de Dados**: Implementar conectividade segura com PostgreSQL usando Segurança ao Nível de Linhas
- **Funcionalidades Potenciadas por IA**: Adicionar capacidades de pesquisa semântica com embeddings do Azure OpenAI
- **Implementação de Segurança**: Autenticação, autorização e isolamento de dados de nível empresarial
- **Desenvolvimento de Ferramentas**: Construir ferramentas MCP sofisticadas para análise de dados e inteligência empresarial
- **Testes e Depuração**: Estratégias de teste abrangentes e técnicas de depuração
- **Integração com VS Code**: Configurar Chat de IA para consultas de base de dados em linguagem natural
- **Implementação em Produção**: Containerização, escalabilidade e estratégias de implementação na cloud
- **Monitorização e Observabilidade**: Application Insights, registo estruturado e monitorização de desempenho

### Visão Geral do Caminho de Aprendizagem

O walkthrough segue uma estrutura de aprendizagem progressiva, projetada para programadores de todos os níveis de habilidade:

| Módulo | Área de Foco | Descrição | Estimativa de Tempo |
|--------|--------------|-----------|---------------------|
| **[00-Introdução](walkthrough/00-Introduction/README.md)** | Fundamentos | Conceitos MCP, estudo de caso Zava Retail, visão geral da arquitetura | 30 minutos |
| **[01-Arquitetura](walkthrough/01-Architecture/README.md)** | Padrões de Design | Arquitetura técnica, design em camadas, componentes do sistema | 45 minutos |
| **[02-Segurança](walkthrough/02-Security/README.md)** | Segurança Empresarial | Autenticação Azure, Segurança ao Nível de Linhas, isolamento multi-tenant | 60 minutos |
| **[03-Configuração](walkthrough/03-Setup/README.md)** | Ambiente | Configuração Docker, Azure CLI, configuração do projeto, validação | 45 minutos |
| **[04-Base de Dados](walkthrough/04-Database/README.md)** | Camada de Dados | Esquema PostgreSQL, pgvector, políticas RLS, dados de exemplo | 60 minutos |
| **[05-Servidor MCP](walkthrough/05-MCP-Server/README.md)** | Implementação Central | Framework FastMCP, integração de base de dados, gestão de conexões | 90 minutos |
| **[06-Ferramentas](walkthrough/06-Tools/README.md)** | Desenvolvimento de Ferramentas | Criação de ferramentas MCP, validação de consultas, funcionalidades de inteligência empresarial | 75 minutos |
| **[07-Pesquisa Semântica](walkthrough/07-Semantic-Search/README.md)** | Integração com IA | Embeddings do Azure OpenAI, pesquisa vetorial, estratégias de pesquisa híbrida | 60 minutos |
| **[08-Testes](walkthrough/08-Testing/README.md)** | Garantia de Qualidade | Testes unitários, testes de integração, testes de desempenho, depuração | 75 minutos |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiência de Desenvolvimento | Configuração do VS Code, integração com Chat de IA, fluxos de trabalho de depuração | 45 minutos |
| **[10-Implementação](walkthrough/10-Deployment/README.md)** | Pronto para Produção | Containerização, Azure Container Apps, pipelines CI/CD, escalabilidade | 90 minutos |
| **[11-Monitorização](walkthrough/11-Monitoring/README.md)** | Observabilidade | Application Insights, registo estruturado, métricas de desempenho | 60 minutos |
| **[12-Melhores Práticas](walkthrough/12-Best-Practices/README.md)** | Excelência em Produção | Reforço de segurança, otimização de desempenho, padrões empresariais | 45 minutos |

**Tempo Total de Aprendizagem**: ~12-15 horas de aprendizagem prática abrangente

### 🎯 Como Usar o Walkthrough

**Para Iniciantes**:
1. Comece com o [Módulo 00: Introdução](walkthrough/00-Introduction/README.md) para entender os fundamentos do MCP
2. Siga os módulos sequencialmente para uma experiência de aprendizagem completa
3. Cada módulo constrói conceitos anteriores e inclui exercícios práticos

**Para Programadores Experientes**:
1. Revise a [Visão Geral do Walkthrough](walkthrough/README.md) para um resumo completo dos módulos
2. Salte para módulos específicos que lhe interessem (ex.: Módulo 07 para integração com IA)
3. Use os módulos individuais como material de referência para os seus próprios projetos

**Para Implementação em Produção**:
1. Foque nos Módulos 02 (Segurança), 10 (Implementação) e 11 (Monitorização)
2. Revise o Módulo 12 (Melhores Práticas) para diretrizes empresariais
3. Use os exemplos de código como templates prontos para produção

### 🚀 Opções de Início Rápido

**Opção 1: Caminho de Aprendizagem Completo** (Recomendado para iniciantes)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opção 2: Implementação Prática** (Comece diretamente a construir)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opção 3: Foco em Produção** (Implementação empresarial)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Pré-requisitos de Aprendizagem

**Antecedentes Recomendados**:
- Experiência básica em programação Python
- Familiaridade com APIs REST e bases de dados
- Compreensão geral de conceitos de IA/ML
- Conhecimentos básicos de linha de comandos e Docker

**Não Necessário (mas útil)**:
- Experiência prévia com MCP (cobrimos tudo desde o início)
- Experiência com Azure Cloud (fornecemos orientação passo a passo)
- Conhecimentos avançados de PostgreSQL (explicamos os conceitos conforme necessário)

### 💡 Dicas de Aprendizagem

1. **Abordagem Prática**: Cada módulo inclui exemplos de código que pode executar e modificar
2. **Complexidade Progressiva**: Os conceitos evoluem gradualmente de simples para avançados
3. **Contexto Realista**: Todos os exemplos utilizam cenários realistas de negócios de retalho
4. **Pronto para Produção**: Os exemplos de código são projetados para uso em produção real
5. **Suporte da Comunidade**: Junte-se à nossa [comunidade no Discord](https://discord.com/invite/ByRwuEEgH4) para ajuda e discussões

### 🔗 Recursos Relacionados

- **[MCP para Iniciantes](https://aka.ms/mcp-for-beginners)**: Leitura essencial para contexto inicial
- **[Exemplo de Passo a Passo](Sample_Walkthrough.md)**: Visão geral técnica de alto nível
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Plataforma cloud utilizada nos exemplos
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework de implementação MCP em Python

**Pronto para começar a aprender?** Inicie com **[Módulo 00: Introdução](walkthrough/00-Introduction/README.md)** ou explore a **[visão geral completa do passo a passo](walkthrough/README.md)**.

## Pré-requisitos

1. Docker Desktop instalado
2. Git instalado
3. **Azure CLI**: Instale e autentique-se com o Azure CLI
4. Acesso ao modelo OpenAI `text-embedding-3-small` e, opcionalmente, ao modelo `gpt-4o-mini`.

## Começando

Abra uma janela de terminal e execute os seguintes comandos:

1. Autentique-se com o Azure CLI

    ```bash
    az login
    ```

2. Clone o repositório

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navegue até o diretório do projeto

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Implantar Recursos do Azure

Execute os seguintes scripts para automatizar a implantação dos recursos do Azure necessários para o servidor MCP.

Os scripts de implantação irão automaticamente implantar o modelo `text-embedding-3-small`. Durante a implantação, terá a opção de incluir também o modelo `gpt-4o-mini`. Note que o `gpt-4o-mini` **não é necessário** para este projeto e está incluído apenas para possíveis melhorias futuras.

**Escolha o script para a sua plataforma:**

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

## Executar o Servidor MCP

A maneira mais fácil de executar a stack completa (PostgreSQL + Servidor MCP) é utilizando o Docker Compose:

### Iniciar a Stack

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

## Utilização

O seguinte assume que utilizará o suporte integrado do servidor MCP no VS Code.

1. Abra o projeto no VS Code. No terminal, execute:

    ```bash
    code .
    ```

2. Inicie um ou mais servidores MCP utilizando as configurações em `.vscode/mcp.json`. O ficheiro contém quatro configurações diferentes de servidor, cada uma representando um papel de gestor de loja diferente:

   - Cada configuração utiliza um ID de utilizador RLS (Row Level Security) único
   - Estes IDs de utilizador simulam diferentes identidades de gestores de loja que acedem à base de dados
   - O sistema RLS restringe o acesso aos dados com base na loja atribuída ao gestor
   - Isto imita cenários reais onde gestores de loja iniciam sessão com diferentes contas Entra ID

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

### Abrir o Chat de IA no VS Code

1. Abra o modo de Chat de IA no VS Code
2. Escreva **#zava** e selecione um dos servidores MCP que iniciou
3. Faça perguntas sobre os dados de vendas - Veja exemplos de consultas abaixo

### Exemplos de Consultas

1. Mostrar os 20 produtos principais por receita de vendas
1. Mostrar vendas por loja
1. Quais foram as vendas do último trimestre por categoria?
1. Que produtos vendemos que são semelhantes a "recipientes para tinta"?

## Funcionalidades

- **Acesso a Esquemas Multi-tabela**: Recupere esquemas de múltiplas tabelas da base de dados numa única solicitação
- **Execução Segura de Consultas**: Execute consultas PostgreSQL com suporte a Row Level Security (RLS)
- **Dados em Tempo Real**: Aceda a dados atuais de vendas, inventário e clientes
- **Utilitários de Data/Hora**: Obtenha timestamps UTC atuais para análises sensíveis ao tempo
- **Implantação Flexível**: Suporta modo de servidor HTTP

## Tabelas Suportadas

O servidor fornece acesso às seguintes tabelas da base de dados de retalho:

- `retail.customers` - Informações e perfis de clientes
- `retail.stores` - Localizações e detalhes das lojas
- `retail.categories` - Categorias de produtos e hierarquias
- `retail.product_types` - Classificações de tipos de produtos
- `retail.products` - Catálogo e especificações de produtos
- `retail.orders` - Pedidos e transações de clientes
- `retail.order_items` - Itens individuais dentro dos pedidos
- `retail.inventory` - Níveis de inventário e dados de stock atuais

## Ferramentas Disponíveis

### `get_multiple_table_schemas`

Recupere esquemas de base de dados para múltiplas tabelas numa única solicitação.

**Parâmetros:**

- `table_names` (list[str]): Lista de nomes de tabelas válidas das tabelas suportadas acima

**Retorno:** Strings de esquema concatenadas para as tabelas solicitadas

### `execute_sales_query`

Execute consultas PostgreSQL na base de dados de vendas com suporte a Row Level Security.

**Parâmetros:**

- `postgresql_query` (str): Uma consulta PostgreSQL bem formada

**Retorno:** Resultados da consulta formatados como uma string (limitados a 20 linhas para legibilidade)

**Melhores Práticas:**

- Sempre recupere os esquemas das tabelas primeiro
- Utilize nomes de colunas exatos dos esquemas
- Junte tabelas relacionadas para análises abrangentes
- Agregue resultados quando apropriado
- Limite a saída para legibilidade

### `get_current_utc_date`

Obtenha a data e hora UTC atual no formato ISO.

**Retorno:** Data/hora UTC atual no formato ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Realize uma pesquisa semântica de produtos com base em consultas do utilizador.

**Retorno:** Uma lista de produtos que correspondem aos critérios de pesquisa

**Parâmetros:**

- `query` (str): A string de consulta de pesquisa

**Retorno:** Uma lista de produtos que correspondem aos critérios de pesquisa

## Funcionalidades de Segurança

### Row Level Security (RLS)

O servidor implementa Row Level Security para garantir que os utilizadores acedem apenas aos dados que estão autorizados a visualizar:

- **Modo HTTP**: Utiliza o cabeçalho `x-rls-user-id` para identificar o utilizador solicitante

- **Fallback Padrão**: Utiliza um UUID de substituição quando nenhum ID de utilizador é fornecido

#### IDs de Utilizador RLS Específicos por Loja

Cada localização da loja Zava Retail tem um ID de utilizador RLS único que determina quais dados o utilizador pode aceder:

| Localização da Loja | ID de Utilizador RLS | Descrição |
|---------------------|----------------------|-----------|
| **Acesso Global** | `00000000-0000-0000-0000-000000000000` | Substituição padrão - acesso a todas as lojas |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Dados da loja Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Dados da loja Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Dados da loja Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Dados da loja Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Dados da loja Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Dados da loja Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Dados da loja Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Dados da loja Zava Retail Online |

#### Implementação de RLS

Quando um utilizador se conecta com o ID de Utilizador RLS de uma loja específica, ele verá apenas:

- Clientes associados a essa loja
- Pedidos realizados nessa localização da loja
- Dados de inventário para essa loja específica
- Métricas de vendas e desempenho específicas da loja

Isso garante o isolamento de dados entre diferentes localizações de lojas enquanto mantém um esquema de base de dados unificado.

## Arquitetura

### Contexto da Aplicação

O servidor utiliza um contexto de aplicação gerido com:

- **Pool de Conexão à Base de Dados**: Gestão eficiente de conexões para o modo HTTP
- **Gestão de Ciclo de Vida**: Limpeza adequada de recursos no encerramento
- **Segurança de Tipos**: Contexto fortemente tipado com a dataclass `AppContext`

### Contexto de Solicitação

- **Extração de Cabeçalhos**: Análise segura de cabeçalhos para identificação do utilizador
- **Integração RLS**: Resolução automática do ID de utilizador a partir do contexto da solicitação
- **Gestão de Erros**: Gestão abrangente de erros com mensagens amigáveis ao utilizador

## Integração com Base de Dados

O servidor integra-se com uma base de dados PostgreSQL através da classe `PostgreSQLSchemaProvider`:

- **Pooling de Conexões**: Utiliza pools de conexão assíncronos para escalabilidade
- **Metadados de Esquema**: Fornece informações detalhadas sobre esquemas de tabelas
- **Execução de Consultas**: Execução segura de consultas com suporte a RLS
- **Gestão de Recursos**: Limpeza automática de recursos da base de dados

## Gestão de Erros

O servidor implementa uma gestão robusta de erros:

- **Validação de Tabelas**: Garante que apenas nomes de tabelas válidos são acedidos
- **Validação de Consultas**: Valida consultas PostgreSQL antes da execução
- **Gestão de Recursos**: Limpeza adequada mesmo durante erros
- **Mensagens Amigáveis**: Mensagens de erro claras para resolução de problemas

## Considerações de Segurança

1. **Row Level Security**: Todas as consultas respeitam políticas RLS com base na identidade do utilizador
2. **Isolamento de Dados de Loja**: O ID de Utilizador RLS de cada loja garante acesso apenas aos dados dessa loja
3. **Validação de Entrada**: Nomes de tabelas e consultas são validados antes da execução
4. **Limites de Recursos**: Resultados de consultas são limitados para evitar uso excessivo de recursos
5. **Segurança de Conexão**: Utiliza práticas seguras de conexão à base de dados
6. **Verificação de Identidade do Utilizador**: Sempre garanta que o ID de Utilizador RLS correto é utilizado para a loja pretendida

### Notas Importantes de Segurança

- **Nunca utilize IDs de Utilizador RLS de produção em ambientes de desenvolvimento**
- **Sempre verifique se o ID de Utilizador RLS corresponde à loja pretendida antes de executar consultas**
- **O UUID padrão (`00000000-0000-0000-0000-000000000000`) fornece acesso limitado**
- **Cada gestor de loja deve ter acesso apenas ao ID de Utilizador RLS da sua loja**

## Desenvolvimento

### Estrutura do Projeto

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Componentes Principais

- **Servidor FastMCP**: Implementação moderna de servidor MCP com suporte assíncrono
- **Provedor PostgreSQL**: Camada de abstração da base de dados com suporte a RLS
- **Gestão de Contexto**: Gestão de contexto de aplicação e solicitação com segurança de tipos
- **Registo de Ferramentas**: Registo declarativo de ferramentas com validação Pydantic

## Contribuindo

Ao contribuir para este servidor:

1. Certifique-se de que todas as consultas à base de dados respeitam Row Level Security
2. Adicione gestão de erros adequada para novas ferramentas
3. Atualize este README com quaisquer novas funcionalidades ou alterações
4. Teste o modo de servidor HTTP
5. Valide os parâmetros de entrada e forneça mensagens de erro claras

## [Licença](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Este servidor MCP permite acesso seguro e eficiente aos dados de vendas da Zava Retail para análises e insights impulsionados por IA.*

---

**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.