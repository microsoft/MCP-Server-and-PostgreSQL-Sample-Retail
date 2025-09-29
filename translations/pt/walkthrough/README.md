<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T17:39:27+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "pt"
}
-->
# 🚀 Servidor MCP com PostgreSQL - Guia Completo de Aprendizagem

## 🧠 Visão Geral do Percurso de Aprendizagem de Integração de Base de Dados MCP

Este guia abrangente ensina como construir **servidores Model Context Protocol (MCP)** prontos para produção, integrados com bases de dados, através de uma implementação prática de análise de retalho. Aprenderá padrões de nível empresarial, incluindo **Segurança ao Nível da Linha (RLS)**, **pesquisa semântica**, **integração com Azure AI** e **acesso a dados multi-inquilino**.

Seja programador backend, engenheiro de IA ou arquiteto de dados, este guia oferece uma aprendizagem estruturada com exemplos do mundo real e exercícios práticos.

## 🔗 Recursos Oficiais do MCP

- 📘 [Documentação do MCP](https://modelcontextprotocol.io/) – Tutoriais detalhados e guias de utilizador
- 📜 [Especificação do MCP](https://modelcontextprotocol.io/docs/) – Arquitetura do protocolo e referências técnicas
- 🧑‍💻 [Repositório GitHub do MCP](https://github.com/modelcontextprotocol) – SDKs de código aberto, ferramentas e exemplos de código
- 🌐 [Comunidade MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Participe em discussões e contribua para a comunidade
- 📚 [MCP para Iniciantes](https://aka.ms/mcp-for-beginners) – Comece aqui se for novo no MCP

## 🧭 Percurso de Aprendizagem de Integração de Base de Dados MCP

### 📚 Estrutura Completa de Aprendizagem

| Módulo | Tópico | Descrição | Link |
|--------|--------|-----------|------|
| **Módulos 1-3: Fundamentos** | | | |
| 00 | [Introdução à Integração de Base de Dados MCP](./00-Introduction/README.md) | Visão geral do MCP com integração de base de dados e caso de uso de análise de retalho | [Começar Aqui](./00-Introduction/README.md) |
| 01 | [Conceitos de Arquitetura Base](./01-Architecture/README.md) | Compreensão da arquitetura do servidor MCP, camadas de base de dados e padrões de segurança | [Aprender](./01-Architecture/README.md) |
| 02 | [Segurança e Multi-Inquilino](./02-Security/README.md) | Segurança ao Nível da Linha, autenticação e acesso a dados multi-inquilino | [Aprender](./02-Security/README.md) |
| 03 | [Configuração do Ambiente](./03-Setup/README.md) | Configuração do ambiente de desenvolvimento, Docker, recursos Azure | [Configurar](./03-Setup/README.md) |
| **Módulos 4-6: Construção do Servidor MCP** | | | |
| 04 | [Design e Esquema da Base de Dados](./04-Database/README.md) | Configuração do PostgreSQL, design do esquema de retalho e dados de exemplo | [Construir](./04-Database/README.md) |
| 05 | [Implementação do Servidor MCP](./05-MCP-Server/README.md) | Construção do servidor FastMCP com integração de base de dados | [Construir](./05-MCP-Server/README.md) |
| 06 | [Desenvolvimento de Ferramentas](./06-Tools/README.md) | Criação de ferramentas de consulta de base de dados e introspeção de esquema | [Construir](./06-Tools/README.md) |
| **Módulos 7-9: Funcionalidades Avançadas** | | | |
| 07 | [Integração de Pesquisa Semântica](./07-Semantic-Search/README.md) | Implementação de embeddings vetoriais com Azure OpenAI e pgvector | [Avançar](./07-Semantic-Search/README.md) |
| 08 | [Testes e Depuração](./08-Testing/README.md) | Estratégias de teste, ferramentas de depuração e abordagens de validação | [Testar](./08-Testing/README.md) |
| 09 | [Integração com VS Code](./09-VS-Code/README.md) | Configuração da integração do MCP com VS Code e utilização de Chat AI | [Integrar](./09-VS-Code/README.md) |
| **Módulos 10-12: Produção e Melhores Práticas** | | | |
| 10 | [Estratégias de Implementação](./10-Deployment/README.md) | Implementação com Docker, Azure Container Apps e considerações de escalabilidade | [Implementar](./10-Deployment/README.md) |
| 11 | [Monitorização e Observabilidade](./11-Monitoring/README.md) | Application Insights, registo de logs, monitorização de desempenho | [Monitorizar](./11-Monitoring/README.md) |
| 12 | [Melhores Práticas e Otimização](./12-Best-Practices/README.md) | Otimização de desempenho, reforço de segurança e dicas para produção | [Otimizar](./12-Best-Practices/README.md) |

### 💻 O Que Vai Construir

No final deste percurso de aprendizagem, terá construído um **Servidor MCP de Análise de Retalho Zava** completo, com:

- **Base de dados de retalho multi-tabelas** com encomendas de clientes, produtos e inventário
- **Segurança ao Nível da Linha** para isolamento de dados por loja
- **Pesquisa semântica de produtos** usando embeddings do Azure OpenAI
- **Integração com Chat AI no VS Code** para consultas em linguagem natural
- **Implementação pronta para produção** com Docker e Azure
- **Monitorização abrangente** com Application Insights

## 🎯 Pré-requisitos para Aprendizagem

Para tirar o máximo proveito deste percurso de aprendizagem, deve ter:

- **Experiência em Programação**: Familiaridade com Python (preferencial) ou linguagens semelhantes
- **Conhecimento de Bases de Dados**: Compreensão básica de SQL e bases de dados relacionais
- **Conceitos de API**: Entendimento de APIs REST e conceitos HTTP
- **Ferramentas de Desenvolvimento**: Experiência com linha de comandos, Git e editores de código
- **Noções de Cloud**: (Opcional) Conhecimento básico de Azure ou plataformas cloud semelhantes
- **Familiaridade com Docker**: (Opcional) Compreensão de conceitos de containerização

### Ferramentas Necessárias

- **Docker Desktop** - Para executar PostgreSQL e o servidor MCP
- **Azure CLI** - Para implementação de recursos na cloud
- **VS Code** - Para desenvolvimento e integração com MCP
- **Git** - Para controlo de versões
- **Python 3.8+** - Para desenvolvimento do servidor MCP

## 📚 Guia de Estudo e Recursos

Este percurso de aprendizagem inclui recursos abrangentes para o ajudar a navegar de forma eficaz:

### Guia de Estudo

Cada módulo inclui:
- **Objetivos de aprendizagem claros** - O que irá alcançar
- **Instruções passo a passo** - Guias detalhados de implementação
- **Exemplos de código** - Exemplos funcionais com explicações
- **Exercícios** - Oportunidades práticas de aprendizagem
- **Guias de resolução de problemas** - Problemas comuns e soluções
- **Recursos adicionais** - Leituras e explorações complementares

### Verificação de Pré-requisitos

Antes de começar cada módulo, encontrará:
- **Conhecimentos necessários** - O que deve saber previamente
- **Validação da configuração** - Como verificar o seu ambiente
- **Estimativas de tempo** - Tempo esperado para conclusão
- **Resultados de aprendizagem** - O que saberá após a conclusão

### Percursos de Aprendizagem Recomendados

Escolha o seu percurso com base no seu nível de experiência:

#### 🟢 **Percurso para Iniciantes** (Novo no MCP)
1. Comece com [MCP para Iniciantes](https://aka.ms/mcp-for-beginners)
2. Complete os módulos 00-03 para compreender os fundamentos
3. Siga os módulos 04-06 para prática prática
4. Experimente os módulos 07-09 para uso prático

#### 🟡 **Percurso Intermédio** (Alguma Experiência com MCP)
1. Revise os módulos 00-01 para conceitos específicos de base de dados
2. Foque-se nos módulos 02-06 para implementação
3. Aprofunde-se nos módulos 07-12 para funcionalidades avançadas

#### 🔴 **Percurso Avançado** (Experiente com MCP)
1. Passe rapidamente pelos módulos 00-03 para contexto
2. Foque-se nos módulos 04-09 para integração de base de dados
3. Concentre-se nos módulos 10-12 para implementação em produção

## 🛠️ Como Usar Este Percurso de Aprendizagem de Forma Eficaz

### Aprendizagem Sequencial (Recomendada)

Siga os módulos na ordem para uma compreensão abrangente:

1. **Leia a visão geral** - Entenda o que irá aprender
2. **Verifique os pré-requisitos** - Certifique-se de que tem o conhecimento necessário
3. **Siga os guias passo a passo** - Implemente enquanto aprende
4. **Complete os exercícios** - Reforce a sua compreensão
5. **Revise os pontos principais** - Solidifique os resultados da aprendizagem

### Aprendizagem Direcionada

Se precisar de competências específicas:

- **Integração de Base de Dados**: Foque-se nos módulos 04-06
- **Implementação de Segurança**: Concentre-se nos módulos 02, 08, 12
- **IA/Pesquisa Semântica**: Aprofunde-se no módulo 07
- **Implementação em Produção**: Estude os módulos 10-12

### Prática Prática

Cada módulo inclui:
- **Exemplos de código funcionais** - Copie, modifique e experimente
- **Cenários do mundo real** - Casos práticos de análise de retalho
- **Complexidade progressiva** - Construção de simples para avançado
- **Passos de validação** - Verifique se a sua implementação funciona

## 🌟 Comunidade e Suporte

### Obtenha Ajuda

- **Discord do Azure AI**: [Junte-se para suporte especializado](https://discord.com/invite/ByRwuEEgH4)
- **GitHub Issues**: [Reporte problemas ou faça perguntas](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Comunidade MCP**: [Participe em discussões mais amplas sobre MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Contribua

Aceitamos contribuições para melhorar este percurso de aprendizagem:
- **Corrija erros ou gralhas** - Submeta pull requests
- **Adicione exemplos** - Partilhe as suas implementações
- **Melhore a documentação** - Ajude outros a aprender
- **Reporte problemas** - Ajude-nos a corrigir problemas

## 📜 Informações de Licença

Este conteúdo de aprendizagem está licenciado sob a Licença MIT. Consulte o ficheiro [LICENSE](../../../LICENSE) para os termos e condições.

## 🚀 Pronto para Começar?

Inicie a sua jornada com **[Módulo 00: Introdução à Integração de Base de Dados MCP](./00-Introduction/README.md)**

---

*Domine a construção de servidores MCP prontos para produção com integração de base de dados através desta experiência prática e abrangente.*

---

**Aviso**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.