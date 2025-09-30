<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:42:23+00:00",
  "source_file": "README.md",
  "language_code": "br"
}
-->
# Exemplo de Servidor MCP e PostgreSQL - Análise de Vendas no Varejo

## Aprenda MCP com Integração de Banco de Dados por Meio de Exemplos Práticos

[![Contribuidores do GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Problemas no GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Pull Requests no GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Bem-vindos](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Junte-se ao Discord do Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Siga estas etapas para começar a usar esses recursos:

1. **Faça um Fork do Repositório**: Clique [aqui para fazer o fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clone o Repositório**: `git clone https://github.com/SEU-USUÁRIO/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Junte-se ao Discord do Azure AI Foundry**: [Conecte-se com especialistas e outros desenvolvedores](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Suporte Multilíngue

#### Suporte via GitHub Action (Automatizado e Sempre Atualizado)

[Francês](../fr/README.md) | [Espanhol](../es/README.md) | [Alemão](../de/README.md) | [Russo](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinês (Simplificado)](../zh/README.md) | [Chinês (Tradicional, Macau)](../mo/README.md) | [Chinês (Tradicional, Hong Kong)](../hk/README.md) | [Chinês (Tradicional, Taiwan)](../tw/README.md) | [Japonês](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalês](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Português (Portugal)](../pt/README.md) | [Português (Brasil)](./README.md) | [Italiano](../it/README.md) | [Polonês](../pl/README.md) | [Turco](../tr/README.md) | [Grego](../el/README.md) | [Tailandês](../th/README.md) | [Sueco](../sv/README.md) | [Dinamarquês](../da/README.md) | [Norueguês](../no/README.md) | [Finlandês](../fi/README.md) | [Holandês](../nl/README.md) | [Hebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonésio](../id/README.md) | [Malaio](../ms/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Suaíli](../sw/README.md) | [Húngaro](../hu/README.md) | [Tcheco](../cs/README.md) | [Eslovaco](../sk/README.md) | [Romeno](../ro/README.md) | [Búlgaro](../bg/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmanês (Myanmar)](../my/README.md)

**Se você deseja suporte para idiomas adicionais, consulte a lista [aqui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introdução

Este exemplo demonstra como construir e implantar um **servidor Model Context Protocol (MCP)** abrangente que fornece aos assistentes de IA acesso seguro e inteligente a dados de vendas no varejo por meio do PostgreSQL. O projeto apresenta recursos de nível empresarial, incluindo **Segurança em Nível de Linha (RLS)**, **capacidades de busca semântica** e **integração com Azure AI** para cenários reais de análise de varejo.

**Principais Casos de Uso:**
- **Análise de Vendas com IA**: Permitir que assistentes de IA consultem e analisem dados de vendas no varejo usando linguagem natural
- **Acesso Seguro Multi-Tenant**: Demonstrar a implementação de Segurança em Nível de Linha, onde diferentes gerentes de loja podem acessar apenas os dados de suas respectivas lojas
- **Busca Semântica de Produtos**: Apresentar descoberta de produtos aprimorada por IA usando embeddings de texto
- **Integração Empresarial**: Ilustrar como integrar servidores MCP com serviços Azure e bancos de dados PostgreSQL

**Ideal para:**
- Desenvolvedores aprendendo a construir servidores MCP com integração de banco de dados
- Engenheiros de dados implementando soluções seguras de análise multi-tenant
- Desenvolvedores de aplicações de IA que trabalham com dados de varejo ou e-commerce
- Qualquer pessoa interessada em combinar assistentes de IA com bancos de dados empresariais

## Junte-se à Comunidade do Discord do Azure AI Foundry
Compartilhe suas experiências com MCP e conecte-se com especialistas e grupos de produtos

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Servidor MCP de Análise de Vendas

Um servidor Model Context Protocol (MCP) que fornece acesso abrangente ao banco de dados de vendas de clientes para o negócio de bricolagem Zava Retail. Este servidor permite que assistentes de IA consultem e analisem dados de vendas no varejo por meio de uma interface segura e ciente do esquema.

## 📚 Guia Completo de Implementação

Para uma análise detalhada de como esta solução é construída e como implementar servidores MCP semelhantes, consulte nosso **[Guia de Passo a Passo](Sample_Walkthrough.md)**. Este guia fornece:

- **Análise de Arquitetura**: Componentes e padrões de design
- **Construção Passo a Passo**: Desde a configuração do projeto até a implantação
- **Detalhamento do Código**: Explicação detalhada da implementação do servidor MCP
- **Recursos Avançados**: Segurança em Nível de Linha, busca semântica e monitoramento
- **Melhores Práticas**: Diretrizes de segurança, desempenho e desenvolvimento
- **Solução de Problemas**: Problemas comuns e suas soluções

Ideal para desenvolvedores que desejam entender os detalhes da implementação e construir soluções semelhantes.

## 🤖 O que é MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** é um padrão aberto que permite que assistentes de IA acessem com segurança fontes de dados externas e ferramentas em tempo real. Pense nele como uma ponte que conecta modelos de IA a bancos de dados, APIs, sistemas de arquivos e outros recursos, mantendo segurança e controle.

### Benefícios Principais:
- **Acesso a Dados em Tempo Real**: Assistentes de IA podem consultar bancos de dados e APIs ao vivo
- **Integração Segura**: Acesso controlado com autenticação e permissões  
- **Extensibilidade de Ferramentas**: Adicione capacidades personalizadas aos assistentes de IA
- **Protocolo Padronizado**: Funciona em diferentes plataformas e ferramentas de IA

### Novo no MCP?

Se você é novo no Model Context Protocol, recomendamos começar com os recursos abrangentes para iniciantes da Microsoft:

**📖 [Guia para Iniciantes em MCP](https://aka.ms/mcp-for-beginners)**

Este recurso fornece:
- Introdução aos conceitos e arquitetura do MCP
- Tutoriais passo a passo para construir seu primeiro servidor MCP
- Melhores práticas para desenvolvimento com MCP
- Exemplos de integração com plataformas de IA populares
- Recursos e suporte da comunidade

Depois de entender o básico, volte aqui para explorar esta implementação avançada de análise de varejo!

## 📚 Guia de Aprendizado Abrangente: /walkthrough

Este repositório inclui um **guia de aprendizado completo com 12 módulos** que decompõe este exemplo de servidor MCP para varejo em lições práticas e passo a passo. O guia transforma este exemplo funcional em um recurso educacional abrangente, perfeito para desenvolvedores que desejam entender como construir servidores MCP prontos para produção com integração de banco de dados.

### O Que Você Vai Aprender

O guia cobre desde conceitos básicos de MCP até implantação avançada em produção, incluindo:

- **Fundamentos do MCP**: Compreensão do Model Context Protocol e suas aplicações no mundo real
- **Integração com Banco de Dados**: Implementação de conectividade segura com PostgreSQL e Segurança em Nível de Linha
- **Recursos Aprimorados por IA**: Adição de capacidades de busca semântica com embeddings do Azure OpenAI
- **Implementação de Segurança**: Autenticação, autorização e isolamento de dados de nível empresarial
- **Desenvolvimento de Ferramentas**: Construção de ferramentas MCP sofisticadas para análise de dados e inteligência de negócios
- **Testes e Depuração**: Estratégias abrangentes de testes e técnicas de depuração
- **Integração com VS Code**: Configuração do AI Chat para consultas de banco de dados em linguagem natural
- **Implantação em Produção**: Estratégias de containerização, escalabilidade e implantação na nuvem
- **Monitoramento e Observabilidade**: Application Insights, logging e monitoramento de desempenho

### Visão Geral do Caminho de Aprendizado

O guia segue uma estrutura de aprendizado progressiva projetada para desenvolvedores de todos os níveis de habilidade:

| Módulo | Área de Foco | Descrição | Tempo Estimado |
|--------|--------------|-----------|----------------|
| **[00-Introdução](walkthrough/00-Introduction/README.md)** | Fundamentos | Conceitos de MCP, estudo de caso Zava Retail, visão geral da arquitetura | 30 minutos |
| **[01-Arquitetura](walkthrough/01-Architecture/README.md)** | Padrões de Design | Arquitetura técnica, design em camadas, componentes do sistema | 45 minutos |
| **[02-Segurança](walkthrough/02-Security/README.md)** | Segurança Empresarial | Autenticação no Azure, Segurança em Nível de Linha, isolamento multi-tenant | 60 minutos |
| **[03-Configuração](walkthrough/03-Setup/README.md)** | Ambiente | Configuração do Docker, Azure CLI, validação do projeto | 45 minutos |
| **[04-Banco de Dados](walkthrough/04-Database/README.md)** | Camada de Dados | Esquema do PostgreSQL, pgvector, políticas de RLS, dados de exemplo | 60 minutos |
| **[05-Servidor MCP](walkthrough/05-MCP-Server/README.md)** | Implementação Principal | Framework FastMCP, integração com banco de dados, gerenciamento de conexões | 90 minutos |
| **[06-Ferramentas](walkthrough/06-Tools/README.md)** | Desenvolvimento de Ferramentas | Criação de ferramentas MCP, validação de consultas, recursos de BI | 75 minutos |
| **[07-Busca Semântica](walkthrough/07-Semantic-Search/README.md)** | Integração com IA | Embeddings do Azure OpenAI, busca vetorial, estratégias híbridas | 60 minutos |
| **[08-Testes](walkthrough/08-Testing/README.md)** | Garantia de Qualidade | Testes unitários, de integração, de desempenho e depuração | 75 minutos |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiência de Desenvolvimento | Configuração do VS Code, integração com AI Chat, fluxos de depuração | 45 minutos |
| **[10-Implantação](walkthrough/10-Deployment/README.md)** | Pronto para Produção | Containerização, Azure Container Apps, pipelines CI/CD, escalabilidade | 90 minutos |
| **[11-Monitoramento](walkthrough/11-Monitoring/README.md)** | Observabilidade | Application Insights, logging estruturado, métricas de desempenho | 60 minutos |
| **[12-Melhores Práticas](walkthrough/12-Best-Practices/README.md)** | Excelência em Produção | Reforço de segurança, otimização de desempenho, padrões empresariais | 45 minutos |

**Tempo Total de Aprendizado**: ~12-15 horas de aprendizado prático abrangente

### 🎯 Como Usar o Guia

**Para Iniciantes**:
1. Comece com o [Módulo 00: Introdução](walkthrough/00-Introduction/README.md) para entender os fundamentos do MCP
2. Siga os módulos sequencialmente para uma experiência completa de aprendizado
3. Cada módulo constrói conceitos anteriores e inclui exercícios práticos

**Para Desenvolvedores Experientes**:
1. Revise a [Visão Geral do Guia](walkthrough/README.md) para um resumo completo dos módulos
2. Pule para módulos específicos que lhe interessem (por exemplo, Módulo 07 para integração com IA)
3. Use os módulos individuais como material de referência para seus próprios projetos

**Para Implementação em Produção**:
1. Foque nos Módulos 02 (Segurança), 10 (Implantação) e 11 (Monitoramento)
2. Revise o Módulo 12 (Melhores Práticas) para diretrizes empresariais
3. Use os exemplos de código como modelos prontos para produção

### 🚀 Opções de Início Rápido

**Opção 1: Caminho de Aprendizado Completo** (Recomendado para iniciantes)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opção 2: Implementação Prática** (Comece a construir imediatamente)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opção 3: Foco em Produção** (Implantação empresarial)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Pré-requisitos de Aprendizado

**Conhecimentos Recomendados**:
- Experiência básica em programação Python
- Familiaridade com APIs REST e bancos de dados
- Entendimento geral de conceitos de IA/ML
- Conhecimento básico de linha de comando e Docker

**Não Necessário (mas útil)**:
- Experiência prévia com MCP (cobrimos isso do zero)
- Experiência com Azure Cloud (fornecemos orientações passo a passo)
- Conhecimento avançado de PostgreSQL (explicamos os conceitos conforme necessário)

### 💡 Dicas de Aprendizado

1. **Abordagem Prática**: Cada módulo inclui exemplos de código que você pode executar e modificar
2. **Complexidade Progressiva**: Os conceitos evoluem gradualmente de simples para avançados
3. **Contexto Real**: Todos os exemplos utilizam cenários realistas de negócios de varejo
4. **Pronto para Produção**: Os exemplos de código são projetados para uso real em produção
5. **Suporte da Comunidade**: Junte-se à nossa [comunidade no Discord](https://discord.com/invite/ByRwuEEgH4) para ajuda e discussões

### 🔗 Recursos Relacionados

- **[MCP para Iniciantes](https://aka.ms/mcp-for-beginners)**: Leitura essencial para introdução
- **[Exemplo de Passo a Passo](Sample_Walkthrough.md)**: Visão técnica de alto nível
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Plataforma de nuvem usada nos exemplos
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework de implementação MCP em Python

**Pronto para começar a aprender?** Inicie com **[Módulo 00: Introdução](walkthrough/00-Introduction/README.md)** ou explore a **[visão geral completa do passo a passo](walkthrough/README.md)**.

## Pré-requisitos

1. Docker Desktop instalado
2. Git instalado
3. **Azure CLI**: Instale e autentique com o Azure CLI
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

Os scripts de implantação irão automaticamente implantar o modelo `text-embedding-3-small`. Durante a implantação, você terá a opção de incluir também o modelo `gpt-4o-mini`. Note que o modelo `gpt-4o-mini` **não é necessário** para este projeto e está incluído apenas para possíveis melhorias futuras.

**Escolha o script para sua plataforma:**

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

## Executando o Servidor MCP

A maneira mais fácil de executar a pilha completa (PostgreSQL + Servidor MCP) é usando Docker Compose:

### Iniciar a Pilha

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

## Uso

O seguinte pressupõe que você usará o suporte integrado ao servidor MCP no VS Code.

1. Abra o projeto no VS Code. No terminal, execute:

    ```bash
    code .
    ```

2. Inicie um ou mais servidores MCP usando as configurações em `.vscode/mcp.json`. O arquivo contém quatro configurações diferentes de servidor, cada uma representando um papel diferente de gerente de loja:

   - Cada configuração usa um ID de usuário RLS (Row Level Security) exclusivo
   - Esses IDs de usuário simulam diferentes identidades de gerentes de loja acessando o banco de dados
   - O sistema RLS restringe o acesso aos dados com base na loja atribuída ao gerente
   - Isso imita cenários reais onde gerentes de loja fazem login com diferentes contas Entra ID

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

### Abrir Chat de IA no VS Code

1. Abra o modo de Chat de IA no VS Code
2. Digite **#zava** e selecione um dos servidores MCP que você iniciou
3. Faça perguntas sobre os dados de vendas - Veja exemplos de consultas abaixo

### Exemplos de Consultas

1. Mostrar os 20 principais produtos por receita de vendas
1. Mostrar vendas por loja
1. Quais foram as vendas do último trimestre por categoria?
1. Quais produtos vendemos que são semelhantes a "recipientes para tinta"?

## Funcionalidades

- **Acesso a Esquemas Multi-Tabela**: Recupere esquemas de várias tabelas do banco de dados em uma única solicitação
- **Execução Segura de Consultas**: Execute consultas PostgreSQL com suporte a Row Level Security (RLS)
- **Dados em Tempo Real**: Acesse dados atuais de vendas, inventário e clientes
- **Utilitários de Data/Hora**: Obtenha timestamps UTC atuais para análises sensíveis ao tempo
- **Implantação Flexível**: Suporta modo de servidor HTTP

## Tabelas Suportadas

O servidor fornece acesso às seguintes tabelas do banco de dados de varejo:

- `retail.customers` - Informações e perfis de clientes
- `retail.stores` - Localizações e detalhes das lojas
- `retail.categories` - Categorias de produtos e hierarquias
- `retail.product_types` - Classificações de tipos de produtos
- `retail.products` - Catálogo de produtos e especificações
- `retail.orders` - Pedidos e transações de clientes
- `retail.order_items` - Itens individuais dentro dos pedidos
- `retail.inventory` - Níveis de inventário atuais e dados de estoque

## Ferramentas Disponíveis

### `get_multiple_table_schemas`

Recupere esquemas de banco de dados para várias tabelas em uma única solicitação.

**Parâmetros:**

- `table_names` (list[str]): Lista de nomes de tabelas válidos das tabelas suportadas acima

**Retorno:** Strings de esquema concatenadas para as tabelas solicitadas

### `execute_sales_query`

Execute consultas PostgreSQL no banco de dados de vendas com suporte a Row Level Security.

**Parâmetros:**

- `postgresql_query` (str): Uma consulta PostgreSQL bem formada

**Retorno:** Resultados da consulta formatados como uma string (limitados a 20 linhas para legibilidade)

**Melhores Práticas:**

- Sempre recupere os esquemas das tabelas primeiro
- Use nomes de colunas exatos dos esquemas
- Junte tabelas relacionadas para análises abrangentes
- Agregue resultados quando apropriado
- Limite a saída para legibilidade

### `get_current_utc_date`

Obtenha a data e hora UTC atual no formato ISO.

**Retorno:** Data/hora UTC atual no formato ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Realize uma busca semântica por produtos com base em consultas do usuário.

**Retorno:** Uma lista de produtos que correspondem aos critérios de busca

**Parâmetros:**

- `query` (str): A string de consulta de busca

**Retorno:** Uma lista de produtos que correspondem aos critérios de busca

## Funcionalidades de Segurança

### Row Level Security (RLS)

O servidor implementa Row Level Security para garantir que os usuários acessem apenas os dados que estão autorizados a visualizar:

- **Modo HTTP**: Usa o cabeçalho `x-rls-user-id` para identificar o usuário solicitante

- **Fallback Padrão**: Usa UUID de placeholder quando nenhum ID de usuário é fornecido

#### IDs de Usuário RLS Específicos por Loja

Cada localização de loja da Zava Retail tem um ID de usuário RLS exclusivo que determina quais dados o usuário pode acessar:

| Localização da Loja | ID de Usuário RLS | Descrição |
|---------------------|-------------------|-----------|
| **Acesso Global** | `00000000-0000-0000-0000-000000000000` | Fallback padrão - acesso a todas as lojas |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Dados da loja Zava Retail Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Dados da loja Zava Retail Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Dados da loja Zava Retail Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Dados da loja Zava Retail Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Dados da loja Zava Retail Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Dados da loja Zava Retail Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Dados da loja Zava Retail Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Dados da loja Zava Retail Online |

#### Implementação de RLS

Quando um usuário se conecta com o ID de Usuário RLS de uma loja específica, ele verá apenas:

- Clientes associados àquela loja
- Pedidos realizados na localização daquela loja
- Dados de inventário para aquela loja específica
- Métricas de vendas e desempenho específicas da loja

Isso garante isolamento de dados entre diferentes localizações de lojas enquanto mantém um esquema de banco de dados unificado.

## Arquitetura

### Contexto da Aplicação

O servidor utiliza um contexto de aplicação gerenciado com:

- **Pool de Conexão ao Banco de Dados**: Gerenciamento eficiente de conexões para o modo HTTP
- **Gerenciamento de Ciclo de Vida**: Limpeza adequada de recursos no encerramento
- **Segurança de Tipos**: Contexto fortemente tipado com a classe `AppContext`

### Contexto de Solicitação

- **Extração de Cabeçalhos**: Análise segura de cabeçalhos para identificação do usuário
- **Integração RLS**: Resolução automática de ID de usuário a partir do contexto da solicitação
- **Tratamento de Erros**: Tratamento abrangente de erros com mensagens amigáveis ao usuário

## Integração com Banco de Dados

O servidor integra-se com um banco de dados PostgreSQL por meio da classe `PostgreSQLSchemaProvider`:

- **Pooling de Conexões**: Usa pools de conexão assíncronos para escalabilidade
- **Metadados de Esquema**: Fornece informações detalhadas sobre esquemas de tabelas
- **Execução de Consultas**: Execução segura de consultas com suporte a RLS
- **Gerenciamento de Recursos**: Limpeza automática de recursos do banco de dados

## Tratamento de Erros

O servidor implementa um tratamento robusto de erros:

- **Validação de Tabelas**: Garante que apenas nomes de tabelas válidos sejam acessados
- **Validação de Consultas**: Valida consultas PostgreSQL antes da execução
- **Gerenciamento de Recursos**: Limpeza adequada mesmo durante erros
- **Mensagens Amigáveis**: Mensagens de erro claras para solução de problemas

## Considerações de Segurança

1. **Row Level Security**: Todas as consultas respeitam políticas de RLS com base na identidade do usuário
2. **Isolamento de Dados de Loja**: O ID de Usuário RLS de cada loja garante acesso apenas aos dados daquela loja
3. **Validação de Entrada**: Nomes de tabelas e consultas são validados antes da execução
4. **Limites de Recursos**: Resultados de consultas são limitados para evitar uso excessivo de recursos
5. **Segurança de Conexão**: Usa práticas seguras de conexão ao banco de dados
6. **Verificação de Identidade do Usuário**: Sempre garanta que o ID de Usuário RLS correto seja usado para a loja pretendida

### Notas Importantes de Segurança

- **Nunca use IDs de Usuário RLS de produção em ambientes de desenvolvimento**
- **Sempre verifique se o ID de Usuário RLS corresponde à loja pretendida antes de executar consultas**
- **O UUID padrão (`00000000-0000-0000-0000-000000000000`) fornece acesso limitado**
- **Cada gerente de loja deve ter acesso apenas ao ID de Usuário RLS de sua loja**

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
- **Provedor PostgreSQL**: Camada de abstração de banco de dados com suporte a RLS
- **Gerenciamento de Contexto**: Manipulação de contexto de aplicação e solicitação com segurança de tipos
- **Registro de Ferramentas**: Registro declarativo de ferramentas com validação Pydantic

## Contribuindo

Ao contribuir para este servidor:

1. Certifique-se de que todas as consultas ao banco de dados respeitem Row Level Security
2. Adicione tratamento de erros adequado para novas ferramentas
3. Atualize este README com quaisquer novos recursos ou alterações
4. Teste o modo de servidor HTTP
5. Valide os parâmetros de entrada e forneça mensagens de erro claras

## [Licença](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Este servidor MCP permite acesso seguro e eficiente aos dados de vendas da Zava Retail para análises e insights impulsionados por IA.*

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.