<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T20:39:59+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "br"
}
-->
# 🚀 Servidor MCP com PostgreSQL - Guia Completo de Aprendizado

## 🧠 Visão Geral do Caminho de Aprendizado de Integração de Banco de Dados MCP

Este guia abrangente ensina como construir **servidores Model Context Protocol (MCP)** prontos para produção que se integram a bancos de dados, por meio de uma implementação prática de análise de varejo. Você aprenderá padrões de nível empresarial, incluindo **Segurança em Nível de Linha (RLS)**, **busca semântica**, **integração com Azure AI** e **acesso a dados multi-tenant**.

Seja você um desenvolvedor backend, engenheiro de IA ou arquiteto de dados, este guia oferece aprendizado estruturado com exemplos do mundo real e exercícios práticos.

## 🔗 Recursos Oficiais do MCP

- 📘 [Documentação do MCP](https://modelcontextprotocol.io/) – Tutoriais detalhados e guias do usuário
- 📜 [Especificação do MCP](https://modelcontextprotocol.io/docs/) – Arquitetura do protocolo e referências técnicas
- 🧑‍💻 [Repositório GitHub do MCP](https://github.com/modelcontextprotocol) – SDKs de código aberto, ferramentas e exemplos de código
- 🌐 [Comunidade MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Participe de discussões e contribua para a comunidade
- 📚 [MCP para Iniciantes](https://aka.ms/mcp-for-beginners) – Comece aqui se você é novo no MCP

## 🧭 Caminho de Aprendizado de Integração de Banco de Dados MCP

### 📚 Estrutura Completa de Aprendizado

| Módulo | Tópico | Descrição | Link |
|--------|-------|-------------|------|
| **Módulos 1-3: Fundamentos** | | | |
| 00 | [Introdução à Integração de Banco de Dados MCP](./00-Introduction/README.md) | Visão geral do MCP com integração de banco de dados e caso de uso de análise de varejo | [Comece Aqui](./00-Introduction/README.md) |
| 01 | [Conceitos de Arquitetura Central](./01-Architecture/README.md) | Compreendendo a arquitetura do servidor MCP, camadas de banco de dados e padrões de segurança | [Aprenda](./01-Architecture/README.md) |
| 02 | [Segurança e Multi-Tenancy](./02-Security/README.md) | Segurança em Nível de Linha, autenticação e acesso a dados multi-tenant | [Aprenda](./02-Security/README.md) |
| 03 | [Configuração do Ambiente](./03-Setup/README.md) | Configurando o ambiente de desenvolvimento, Docker, recursos do Azure | [Configurar](./03-Setup/README.md) |
| **Módulos 4-6: Construindo o Servidor MCP** | | | |
| 04 | [Design e Esquema de Banco de Dados](./04-Database/README.md) | Configuração do PostgreSQL, design de esquema de varejo e dados de exemplo | [Construir](./04-Database/README.md) |
| 05 | [Implementação do Servidor MCP](./05-MCP-Server/README.md) | Construindo o servidor FastMCP com integração de banco de dados | [Construir](./05-MCP-Server/README.md) |
| 06 | [Desenvolvimento de Ferramentas](./06-Tools/README.md) | Criando ferramentas de consulta de banco de dados e introspecção de esquema | [Construir](./06-Tools/README.md) |
| **Módulos 7-9: Recursos Avançados** | | | |
| 07 | [Integração de Busca Semântica](./07-Semantic-Search/README.md) | Implementando embeddings vetoriais com Azure OpenAI e pgvector | [Avançar](./07-Semantic-Search/README.md) |
| 08 | [Testes e Depuração](./08-Testing/README.md) | Estratégias de teste, ferramentas de depuração e abordagens de validação | [Testar](./08-Testing/README.md) |
| 09 | [Integração com VS Code](./09-VS-Code/README.md) | Configurando integração do MCP com VS Code e uso de Chat de IA | [Integrar](./09-VS-Code/README.md) |
| **Módulos 10-12: Produção e Melhores Práticas** | | | |
| 10 | [Estratégias de Implantação](./10-Deployment/README.md) | Implantação com Docker, Azure Container Apps e considerações de escalabilidade | [Implantar](./10-Deployment/README.md) |
| 11 | [Monitoramento e Observabilidade](./11-Monitoring/README.md) | Application Insights, logging, monitoramento de desempenho | [Monitorar](./11-Monitoring/README.md) |
| 12 | [Melhores Práticas e Otimização](./12-Best-Practices/README.md) | Otimização de desempenho, reforço de segurança e dicas para produção | [Otimizar](./12-Best-Practices/README.md) |

### 💻 O Que Você Vai Construir

Ao final deste caminho de aprendizado, você terá construído um completo **Servidor MCP de Análise de Varejo Zava**, com:

- **Banco de dados de varejo multi-tabelas** com pedidos de clientes, produtos e inventário
- **Segurança em Nível de Linha** para isolamento de dados por loja
- **Busca semântica de produtos** usando embeddings do Azure OpenAI
- **Integração com Chat de IA no VS Code** para consultas em linguagem natural
- **Implantação pronta para produção** com Docker e Azure
- **Monitoramento abrangente** com Application Insights

## 🎯 Pré-requisitos para Aprendizado

Para aproveitar ao máximo este caminho de aprendizado, você deve ter:

- **Experiência em Programação**: Familiaridade com Python (preferido) ou linguagens similares
- **Conhecimento de Banco de Dados**: Entendimento básico de SQL e bancos de dados relacionais
- **Conceitos de API**: Compreensão de APIs REST e conceitos de HTTP
- **Ferramentas de Desenvolvimento**: Experiência com linha de comando, Git e editores de código
- **Noções de Nuvem**: (Opcional) Conhecimento básico de Azure ou plataformas de nuvem similares
- **Familiaridade com Docker**: (Opcional) Entendimento de conceitos de containerização

### Ferramentas Necessárias

- **Docker Desktop** - Para executar PostgreSQL e o servidor MCP
- **Azure CLI** - Para implantação de recursos na nuvem
- **VS Code** - Para desenvolvimento e integração com MCP
- **Git** - Para controle de versão
- **Python 3.8+** - Para desenvolvimento do servidor MCP

## 📚 Guia de Estudo e Recursos

Este caminho de aprendizado inclui recursos abrangentes para ajudá-lo a navegar de forma eficaz:

### Guia de Estudo

Cada módulo inclui:
- **Objetivos claros de aprendizado** - O que você vai alcançar
- **Instruções passo a passo** - Guias detalhados de implementação
- **Exemplos de código** - Exemplos funcionais com explicações
- **Exercícios** - Oportunidades de prática prática
- **Guias de solução de problemas** - Problemas comuns e soluções
- **Recursos adicionais** - Leituras e explorações complementares

### Verificação de Pré-requisitos

Antes de iniciar cada módulo, você encontrará:
- **Conhecimento necessário** - O que você deve saber previamente
- **Validação de configuração** - Como verificar seu ambiente
- **Estimativas de tempo** - Tempo esperado para conclusão
- **Resultados de aprendizado** - O que você saberá após a conclusão

### Caminhos de Aprendizado Recomendados

Escolha seu caminho com base no seu nível de experiência:

#### 🟢 **Caminho para Iniciantes** (Novo no MCP)
1. Comece com [MCP para Iniciantes](https://aka.ms/mcp-for-beginners) primeiro
2. Complete os módulos 00-03 para entender os fundamentos
3. Siga os módulos 04-06 para construção prática
4. Experimente os módulos 07-09 para uso prático

#### 🟡 **Caminho Intermediário** (Alguma experiência com MCP)
1. Revise os módulos 00-01 para conceitos específicos de banco de dados
2. Foque nos módulos 02-06 para implementação
3. Aprofunde-se nos módulos 07-12 para recursos avançados

#### 🔴 **Caminho Avançado** (Experiente com MCP)
1. Passe rapidamente pelos módulos 00-03 para contexto
2. Foque nos módulos 04-09 para integração de banco de dados
3. Concentre-se nos módulos 10-12 para implantação em produção

## 🛠️ Como Usar Este Caminho de Aprendizado de Forma Eficaz

### Aprendizado Sequencial (Recomendado)

Trabalhe nos módulos em ordem para uma compreensão completa:

1. **Leia a visão geral** - Entenda o que você vai aprender
2. **Verifique os pré-requisitos** - Certifique-se de ter o conhecimento necessário
3. **Siga os guias passo a passo** - Implemente enquanto aprende
4. **Complete os exercícios** - Reforce sua compreensão
5. **Revise os principais pontos** - Solidifique os resultados do aprendizado

### Aprendizado Direcionado

Se você precisa de habilidades específicas:

- **Integração de Banco de Dados**: Foque nos módulos 04-06
- **Implementação de Segurança**: Concentre-se nos módulos 02, 08, 12
- **IA/Busca Semântica**: Aprofunde-se no módulo 07
- **Implantação em Produção**: Estude os módulos 10-12

### Prática Prática

Cada módulo inclui:
- **Exemplos de código funcionais** - Copie, modifique e experimente
- **Cenários do mundo real** - Casos práticos de análise de varejo
- **Complexidade progressiva** - Construção do simples ao avançado
- **Passos de validação** - Verifique se sua implementação funciona

## 🌟 Comunidade e Suporte

### Obtenha Ajuda

- **Discord do Azure AI**: [Participe para suporte especializado](https://discord.com/invite/ByRwuEEgH4)
- **Issues no GitHub**: [Relate problemas ou faça perguntas](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Comunidade MCP**: [Participe de discussões mais amplas sobre MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Contribua

Contribuições para melhorar este caminho de aprendizado são bem-vindas:
- **Corrija bugs ou erros** - Envie pull requests
- **Adicione exemplos** - Compartilhe suas implementações
- **Melhore a documentação** - Ajude outros a aprender
- **Relate problemas** - Ajude-nos a corrigir problemas

## 📜 Informações de Licença

Este conteúdo de aprendizado está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](../../../LICENSE) para termos e condições.

## 🚀 Pronto para Começar?

Inicie sua jornada com **[Módulo 00: Introdução à Integração de Banco de Dados MCP](./00-Introduction/README.md)**

---

*Domine a construção de servidores MCP prontos para produção com integração de banco de dados por meio desta experiência prática e abrangente.*

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.