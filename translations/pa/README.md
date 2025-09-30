<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:39:22+00:00",
  "source_file": "README.md",
  "language_code": "pa"
}
-->
# MCP ਸਰਵਰ ਅਤੇ PostgreSQL ਨਮੂਨਾ - ਰਿਟੇਲ ਵਿਕਰੀ ਵਿਸ਼ਲੇਸ਼ਣ

## ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ MCP ਸਿੱਖੋ ਹੱਥ-ਅਨੁਭਵ ਉਦਾਹਰਣਾਂ ਰਾਹੀਂ

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Join Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

ਇਹ ਸਰੋਤਾਂ ਦੀ ਵਰਤੋਂ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਕਦਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ:

1. **ਰੇਪੋਜ਼ਟਰੀ ਫੋਰਕ ਕਰੋ**: [ਇਥੇ ਫੋਰਕ ਕਰਨ ਲਈ ਕਲਿਕ ਕਰੋ](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **ਰੇਪੋਜ਼ਟਰੀ ਕਲੋਨ ਕਰੋ**: `git clone https://github.com/YOUR-USERNAME/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Azure AI Foundry Discord ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ**: [ਮਾਹਿਰਾਂ ਅਤੇ ਵਿਕਾਸਕਾਰਾਂ ਨਾਲ ਮਿਲੋ](https://discord.com/invite/ByRwuEEgH4)

### 🌐 ਬਹੁ-ਭਾਸ਼ਾ ਸਹਾਇਤਾ

#### GitHub Action ਰਾਹੀਂ ਸਹਾਇਤਾਪ੍ਰਾਪਤ (ਆਟੋਮੈਟਿਕ ਅਤੇ ਹਮੇਸ਼ਾ ਅਪ-ਟੂ-ਡੇਟ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](./README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**ਜੇ ਤੁਸੀਂ ਹੋਰ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ ਅਨੁਵਾਦ ਕਰਵਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ, ਸਹਾਇਤਾਪ੍ਰਾਪਤ ਭਾਸ਼ਾਵਾਂ ਦੀ ਸੂਚੀ [ਇਥੇ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ਉਪਲਬਧ ਹੈ।**

## ਜਾਣ ਪਛਾਣ

ਇਹ ਨਮੂਨਾ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ **Model Context Protocol (MCP) ਸਰਵਰ** ਕਿਵੇਂ ਬਣਾਉਣਾ ਅਤੇ ਡਿਪਲੌਇ ਕਰਨਾ ਹੈ ਜੋ PostgreSQL ਰਾਹੀਂ ਰਿਟੇਲ ਵਿਕਰੀ ਡਾਟਾ ਤੱਕ AI ਸਹਾਇਕਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਅਤੇ ਸਮਰਥ ਪਹੁੰਚ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ। ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ **Row Level Security (RLS)**, **semantic search capabilities**, ਅਤੇ **Azure AI integration** ਵਰਗੀਆਂ ਫੀਚਰਾਂ ਨੂੰ ਰਿਟੇਲ ਵਿਸ਼ਲੇਸ਼ਣ ਦੇ ਹਕੀਕਤੀ ਸਥਿਤੀਆਂ ਲਈ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ ਹੈ।

**ਮੁੱਖ ਵਰਤੋਂ ਦੇ ਕੇਸ:**
- **AI-ਚਲਿਤ ਵਿਕਰੀ ਵਿਸ਼ਲੇਸ਼ਣ**: AI ਸਹਾਇਕਾਂ ਨੂੰ ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਰਾਹੀਂ ਰਿਟੇਲ ਵਿਕਰੀ ਡਾਟਾ ਦੀ ਪੁੱਛਗਿੱਛ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨ ਦੇ ਯੋਗ ਬਣਾਓ
- **ਸੁਰੱਖਿਅਤ ਮਲਟੀ-ਟੈਨੈਂਟ ਪਹੁੰਚ**: Row Level Security ਦੇ ਲਾਗੂ ਕਰਨ ਦੀ ਪ੍ਰਦਰਸ਼ਨਾ ਜਿੱਥੇ ਵੱਖ-ਵੱਖ ਸਟੋਰ ਮੈਨੇਜਰ ਸਿਰਫ ਆਪਣੇ ਸਟੋਰ ਦਾ ਡਾਟਾ ਹੀ ਦੇਖ ਸਕਦੇ ਹਨ
- **ਸੈਮੈਂਟਿਕ ਉਤਪਾਦ ਖੋਜ**: ਟੈਕਸਟ ਐਮਬੈਡਿੰਗ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI-ਵਧਾਈ ਉਤਪਾਦ ਖੋਜ ਦਿਖਾਓ
- **ਐਂਟਰਪ੍ਰਾਈਜ਼ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: MCP ਸਰਵਰਾਂ ਨੂੰ Azure ਸੇਵਾਵਾਂ ਅਤੇ PostgreSQL ਡਾਟਾਬੇਸਾਂ ਨਾਲ ਜੋੜਨ ਦਾ ਪ੍ਰਦਰਸ਼ਨ

**ਇਹ ਕਿਸ ਲਈ ਬਿਹਤਰ ਹੈ:**
- ਵਿਕਾਸਕਾਰ ਜੋ ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ MCP ਸਰਵਰ ਬਣਾਉਣਾ ਸਿੱਖ ਰਹੇ ਹਨ
- ਡਾਟਾ ਇੰਜੀਨੀਅਰ ਜੋ ਸੁਰੱਖਿਅਤ ਮਲਟੀ-ਟੈਨੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ ਹੱਲ ਲਾਗੂ ਕਰ ਰਹੇ ਹਨ
- AI ਐਪਲੀਕੇਸ਼ਨ ਵਿਕਾਸਕਾਰ ਜੋ ਰਿਟੇਲ ਜਾਂ ਈ-ਕਾਮਰਸ ਡਾਟਾ ਨਾਲ ਕੰਮ ਕਰ ਰਹੇ ਹਨ
- ਕੋਈ ਵੀ ਜੋ AI ਸਹਾਇਕਾਂ ਨੂੰ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਡਾਟਾਬੇਸਾਂ ਨਾਲ ਜੋੜਨ ਵਿੱਚ ਦਿਲਚਸਪੀ ਰੱਖਦਾ ਹੈ

## Azure AI Foundry Discord ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ
MCP ਦੇ ਆਪਣੇ ਅਨੁਭਵ ਸਾਂਝੇ ਕਰੋ ਅਤੇ ਮਾਹਿਰਾਂ ਅਤੇ ਪ੍ਰੋਡਕਟ ਗਰੁੱਪਾਂ ਨਾਲ ਮਿਲੋ

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# ਵਿਕਰੀ ਵਿਸ਼ਲੇਸ਼ਣ MCP ਸਰਵਰ

ਇੱਕ Model Context Protocol (MCP) ਸਰਵਰ ਜੋ Zava Retail DIY Business ਲਈ ਗਾਹਕ ਵਿਕਰੀ ਡਾਟਾਬੇਸ ਤੱਕ ਵਿਸਤ੍ਰਿਤ ਪਹੁੰਚ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ। ਇਹ ਸਰਵਰ AI ਸਹਾਇਕਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ, ਸਕੀਮਾ-ਅਵੇਅਰ ਇੰਟਰਫੇਸ ਰਾਹੀਂ ਰਿਟੇਲ ਵਿਕਰੀ ਡਾਟਾ ਦੀ ਪੁੱਛਗਿੱਛ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰਨ ਦੇ ਯੋਗ ਬਣਾਉਂਦਾ ਹੈ।

## 📚 ਪੂਰੀ ਲਾਗੂ ਕਰਨ ਦੀ ਗਾਈਡ

ਇਸ ਹੱਲ ਨੂੰ ਕਿਵੇਂ ਬਣਾਇਆ ਗਿਆ ਹੈ ਅਤੇ ਇਸੇ ਤਰ੍ਹਾਂ ਦੇ MCP ਸਰਵਰਾਂ ਨੂੰ ਲਾਗੂ ਕਰਨ ਦੇ ਤਰੀਕੇ ਦੀ ਵਿਸਤ੍ਰਿਤ ਵਿਵਰਣ ਲਈ, ਸਾਡੀ **[Sample Walkthrough](Sample_Walkthrough.md)** ਵੇਖੋ। ਇਹ ਗਾਈਡ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ:

- **ਆਰਕੀਟੈਕਚਰ ਡੀਪ ਡਾਈਵ**: ਕੰਪੋਨੈਂਟ ਵਿਸ਼ਲੇਸ਼ਣ ਅਤੇ ਡਿਜ਼ਾਈਨ ਪੈਟਰਨ
- **ਕਦਮ-ਦਰ-ਕਦਮ ਬਣਾਉਣਾ**: ਪ੍ਰੋਜੈਕਟ ਸੈਟਅਪ ਤੋਂ ਡਿਪਲੌਇਮੈਂਟ ਤੱਕ
- **ਕੋਡ ਵਿਸ਼ਲੇਸ਼ਣ**: MCP ਸਰਵਰ ਲਾਗੂ ਕਰਨ ਦੀ ਵਿਸਤ੍ਰਿਤ ਵਿਆਖਿਆ
- **ਉੱਨਤ ਫੀਚਰ**: Row Level Security, ਸੈਮੈਂਟਿਕ ਖੋਜ, ਅਤੇ ਮਾਨੀਟਰਿੰਗ
- **ਸਰੋਤਾਂ ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ**: ਸੁਰੱਖਿਆ, ਪ੍ਰਦਰਸ਼ਨ, ਅਤੇ ਵਿਕਾਸ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼
- **ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ**: ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ

ਇਹ ਵਿਕਾਸਕਾਰਾਂ ਲਈ ਬਿਹਤਰ ਹੈ ਜੋ ਲਾਗੂ ਕਰਨ ਦੇ ਵਿਸਤ੍ਰਿਤ ਵੇਰਵੇ ਨੂੰ ਸਮਝਣਾ ਚਾਹੁੰਦੇ ਹਨ ਅਤੇ ਇਸੇ ਤਰ੍ਹਾਂ ਦੇ ਹੱਲ ਬਣਾਉਣਾ ਚਾਹੁੰਦੇ ਹਨ।

## 🤖 MCP (Model Context Protocol) ਕੀ ਹੈ?

**Model Context Protocol (MCP)** ਇੱਕ ਖੁੱਲ੍ਹਾ ਮਿਆਰ ਹੈ ਜੋ AI ਸਹਾਇਕਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਬਾਹਰੀ ਡਾਟਾ ਸਰੋਤਾਂ ਅਤੇ ਟੂਲਾਂ ਤੱਕ ਰੀਅਲ-ਟਾਈਮ ਪਹੁੰਚ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ। ਇਹ ਇੱਕ ਪੁਲ ਵਾਂਗ ਕੰਮ ਕਰਦਾ ਹੈ ਜੋ AI ਮਾਡਲਾਂ ਨੂੰ ਡਾਟਾਬੇਸਾਂ, APIs, ਫਾਈਲ ਸਿਸਟਮਾਂ, ਅਤੇ ਹੋਰ ਸਰੋਤਾਂ ਨਾਲ ਜੋੜਨ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ ਜਦੋਂ ਕਿ ਸੁਰੱਖਿਆ ਅਤੇ ਨਿਯੰਤਰਣ ਨੂੰ ਬਰਕਰਾਰ ਰੱਖਦਾ ਹੈ।

### ਮੁੱਖ ਫਾਇਦੇ:
- **ਰੀਅਲ-ਟਾਈਮ ਡਾਟਾ ਪਹੁੰਚ**: AI ਸਹਾਇਕ ਜੀਵੰਤ ਡਾਟਾਬੇਸਾਂ ਅਤੇ APIs ਦੀ ਪੁੱਛਗਿੱਛ ਕਰ ਸਕਦੇ ਹਨ
- **ਸੁਰੱਖਿਅਤ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀਆਂ ਨਾਲ ਨਿਯੰਤਰਿਤ ਪਹੁੰਚ  
- **ਟੂਲ ਵਧਾਉਣਯੋਗਤਾ**: AI ਸਹਾਇਕਾਂ ਵਿੱਚ ਕਸਟਮ ਸਮਰੱਥਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ
- **ਮਿਆਰੀਕ੍ਰਿਤ ਪ੍ਰੋਟੋਕੋਲ**: ਵੱਖ-ਵੱਖ AI ਪਲੇਟਫਾਰਮਾਂ ਅਤੇ ਟੂਲਾਂ ਵਿੱਚ ਕੰਮ ਕਰਦਾ ਹੈ

### MCP ਵਿੱਚ ਨਵੇਂ ਹੋ?

ਜੇ ਤੁਸੀਂ Model Context Protocol ਵਿੱਚ ਨਵੇਂ ਹੋ, ਤਾਂ ਅਸੀਂ Microsoft ਦੇ ਵਿਸਤ੍ਰਿਤ ਸ਼ੁਰੂਆਤੀ ਸਰੋਤਾਂ ਨਾਲ ਸ਼ੁਰੂ ਕਰਨ ਦੀ ਸਿਫਾਰਸ਼ ਕਰਦੇ ਹਾਂ:

**📖 [MCP ਸ਼ੁਰੂਆਤੀ ਗਾਈਡ](https://aka.ms/mcp-for-beginners)**

ਇਹ ਸਰੋਤ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:
- MCP ਸੰਕਲਪ ਅਤੇ ਆਰਕੀਟੈਕਚਰ ਦਾ ਪਰੀਚੇ
- ਆਪਣਾ ਪਹਿਲਾ MCP ਸਰਵਰ ਬਣਾਉਣ ਲਈ ਕਦਮ-ਦਰ-ਕਦਮ ਟਿਊਟੋਰਿਅਲ
- MCP ਵਿਕਾਸ ਲਈ ਸਰੋਤਾਂ ਦੀਆਂ ਸਿਫਾਰਸ਼ਾਂ
- ਪ੍ਰਸਿੱਧ AI ਪਲੇਟਫਾਰਮਾਂ ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਉਦਾਹਰਣ
- ਕਮਿਊਨਿਟੀ ਸਰੋਤ ਅਤੇ ਸਹਾਇਤਾ

ਜਦੋਂ ਤੁਸੀਂ ਬੁਨਿਆਦੀਆਂ ਸਮਝ ਲੈਂਦੇ ਹੋ, ਤਾਂ ਇੱਥੇ ਵਾਪਸ ਆਓ ਅਤੇ ਇਸ ਉੱਨਤ ਰਿਟੇਲ ਵਿਸ਼ਲੇਸ਼ਣ ਲਾਗੂ ਕਰਨ ਦੀ ਖੋਜ ਕਰੋ!

## 📚 ਵਿਸਤ੍ਰਿਤ ਸਿੱਖਣ ਦੀ ਗਾਈਡ: /walkthrough

ਇਹ ਰੇਪੋਜ਼ਟਰੀ ਇੱਕ ਪੂਰੀ **12-ਮਾਡਿਊਲ ਸਿੱਖਣ ਦੀ ਗਾਈਡ** ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ ਜੋ ਇਸ MCP ਰਿਟੇਲ ਸਰਵਰ ਨਮੂਨੇ ਨੂੰ ਹੱਥ-ਅਨੁਭਵ, ਕਦਮ-ਦਰ-ਕਦਮ ਪਾਠਾਂ ਵਿੱਚ ਤਬਦੀਲ ਕਰਦੀ ਹੈ। ਇਹ ਗਾਈਡ ਇਸ ਕੰਮ ਕਰਨ ਵਾਲੇ ਉਦਾਹਰਣ ਨੂੰ ਇੱਕ ਵਿਸਤ੍ਰਿਤ ਸਿੱਖਣ ਸਰੋਤ ਵਿੱਚ ਬਦਲ ਦਿੰਦੀ ਹੈ ਜੋ ਵਿਕਾਸਕਾਰਾਂ ਲਈ ਬਿਹਤਰ ਹੈ ਜੋ ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਉਤਪਾਦਨ-ਤਿਆਰ MCP ਸਰਵਰ ਬਣਾਉਣ ਦਾ ਜ਼ਿਆਦਾ ਸਮਝਣਾ ਚਾਹੁੰਦੇ ਹਨ।

### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

ਇਹ ਗਾਈਡ ਬੁਨਿਆਦੀ MCP ਸੰਕਲਪਾਂ ਤੋਂ ਲੈ ਕੇ ਉੱਨਤ ਉਤਪਾਦਨ ਡਿਪਲੌਇਮੈਂਟ ਤੱਕ ਸਭ ਕੁਝ ਕਵਰ ਕਰਦੀ ਹੈ, ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:

- **MCP ਬੁਨਿਆਦੀਆਂ**: Model Context Protocol ਅਤੇ ਇਸ ਦੇ ਹਕੀਕਤੀ ਵਰਤੋਂ ਦੇ ਕੇਸਾਂ ਨੂੰ ਸਮਝਣਾ
- **ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: Row Level Security ਨਾਲ ਸੁਰੱਖਿਅਤ PostgreSQL ਕਨੈਕਟਿਵਿਟੀ ਲਾਗੂ ਕਰਨਾ
- **AI-ਵਧਾਈ ਫੀਚਰ**: Azure OpenAI ਐਮਬੈਡਿੰਗ ਨਾਲ ਸੈਮੈਂਟਿਕ ਖੋਜ ਸਮਰੱਥਾਵਾਂ ਸ਼ਾਮਲ ਕਰਨਾ
- **ਸੁਰੱਖਿਆ ਲਾਗੂ ਕਰਨਾ**: ਐਂਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ ਪ੍ਰਮਾਣਿਕਤਾ, ਅਧਿਕਾਰ, ਅਤੇ ਡਾਟਾ ਅਲੱਗਾਵ
- **ਟੂਲ ਵਿਕਾਸ**: ਡਾਟਾ ਵਿਸ਼ਲੇਸ਼ਣ ਅਤੇ ਕਾਰੋਬਾਰੀ ਬੁੱਧੀਮਤਾ ਲਈ ਉੱਨਤ MCP ਟੂਲ ਬਣਾਉਣਾ
- **ਟੈਸਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ**: ਵਿਸਤ੍ਰਿਤ ਟੈਸਟਿੰਗ ਰਣਨੀਤੀਆਂ ਅਤੇ ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ
- **VS Code ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: ਕੁਦਰਤੀ ਭਾਸ਼ਾ ਡਾਟਾਬੇਸ ਪੁੱਛਗਿੱਛ ਲਈ AI ਚੈਟ ਕਨਫਿਗਰ ਕਰਨਾ
- **ਉਤਪਾਦਨ ਡਿਪਲੌਇਮੈਂਟ**: ਕੰਟੇਨਰਾਈਜ਼ੇਸ਼ਨ, ਸਕੇਲਿੰਗ, ਅਤੇ ਕਲਾਉਡ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ
- **ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟਾਵਲਤਾ**: ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ, ਲੌਗਿੰਗ, ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਮਾਨੀਟਰਿੰਗ

### ਸਿੱਖਣ ਪਾਠ ਦਾ ਢਾਂਚਾ

ਇਹ ਗਾਈਡ ਇੱਕ ਪ੍ਰਗਤੀਸ਼ੀਲ ਸਿੱਖਣ ਢਾਂਚੇ ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ ਜੋ ਹਰ ਪੱਧਰ ਦੇ ਵਿਕਾਸਕਾਰਾਂ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤੀ ਗਈ ਹੈ:

| ਮਾਡਿਊਲ | ਫੋਕਸ ਖੇਤਰ | ਵੇਰਵਾ | ਸਮਾਂ ਅਨੁਮਾਨ |
|--------|------------|-------------|---------------|
| **[00-Introduction](walkthrough/00-Introduction/README.md)** | ਬੁਨਿਆਦ | MCP ਸੰਕਲਪ, Zava Retail ਕੇਸ ਸਟਡੀ, ਆਰਕੀਟੈਕਚਰ ਝਲਕ | 30 ਮਿੰਟ |
| **[01-Architecture](walkthrough/01-Architecture/README.md)** | ਡਿਜ਼ਾਈਨ ਪੈਟਰਨ | ਤਕਨੀਕੀ ਆਰਕੀਟੈਕਚਰ, ਲੇਅਰਡ ਡਿਜ਼ਾਈਨ, ਸਿਸਟਮ ਕੰਪੋਨੈਂਟ | 45 ਮਿੰਟ |
| **[02-Security](walkthrough/02-Security/README.md)** | ਐਂਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ | Azure ਪ੍ਰਮਾਣਿਕਤਾ, Row Level Security, ਮਲਟੀ-ਟੈਨੈਂਟ ਅਲੱਗਾਵ | 60 ਮਿੰਟ |
| **[03-Setup](walkthrough/03-Setup/README.md)** | ਵਾਤਾਵਰਣ | Docker ਸੈਟਅਪ, Azure CLI, ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ, ਵੈਰੀਫਿਕੇਸ਼ਨ | 45 ਮਿੰਟ |
| **[04-Database](walkthrough/04-Database/README.md)** | ਡਾਟਾ ਲੇਅਰ | PostgreSQL ਸਕੀਮਾ, pgvector, RLS ਨੀਤੀਆਂ, ਨਮੂਨਾ ਡਾਟਾ | 60 ਮਿੰਟ |
| **[05-MCP-Server](walkthrough/05-MCP-Server/README.md)** | ਕੋਰ ਲਾਗੂ ਕਰਨਾ | FastM
### 📋 ਸਿੱਖਣ ਲਈ ਪੂਰਵ ਸ਼ਰਤਾਂ

**ਸੁਝਾਏ ਗਏ ਪਿਛੋਕੜ**:
- ਬੁਨਿਆਦੀ Python ਪ੍ਰੋਗਰਾਮਿੰਗ ਦਾ ਤਜਰਬਾ
- REST APIs ਅਤੇ ਡਾਟਾਬੇਸ ਨਾਲ ਜਾਣੂ
- AI/ML ਸੰਕਲਪਾਂ ਦੀ ਆਮ ਸਮਝ
- ਬੁਨਿਆਦੀ ਕਮਾਂਡ-ਲਾਈਨ ਅਤੇ Docker ਦਾ ਗਿਆਨ

**ਲਾਜ਼ਮੀ ਨਹੀਂ (ਪਰ ਮਦਦਗਾਰ)**:
- ਪਹਿਲਾਂ MCP ਦਾ ਤਜਰਬਾ (ਅਸੀਂ ਇਹ ਸ਼ੁਰੂ ਤੋਂ ਸਿਖਾਉਂਦੇ ਹਾਂ)
- Azure ਕਲਾਉਡ ਦਾ ਤਜਰਬਾ (ਅਸੀਂ ਕਦਮ-ਦਰ-ਕਦਮ ਮਦਦ ਦਿੰਦੇ ਹਾਂ)
- ਉੱਚ PostgreSQL ਦਾ ਗਿਆਨ (ਅਸੀਂ ਜ਼ਰੂਰਤ ਅਨੁਸਾਰ ਸਮਝਾਉਂਦੇ ਹਾਂ)

### 💡 ਸਿੱਖਣ ਦੇ ਸੁਝਾਅ

1. **ਹੱਥ-ਵਰਤੋਂ ਪਹੁੰਚ**: ਹਰ ਮੋਡੀਊਲ ਵਿੱਚ ਕੰਮ ਕਰਨ ਵਾਲੇ ਕੋਡ ਉਦਾਹਰਨਾਂ ਸ਼ਾਮਲ ਹਨ ਜੋ ਤੁਸੀਂ ਚਲਾ ਅਤੇ ਸੋਧ ਸਕਦੇ ਹੋ
2. **ਤਰੱਕੀਸ਼ੀਲ ਜਟਿਲਤਾ**: ਸੰਕਲਪ ਸਧਾਰਨ ਤੋਂ ਉੱਚੇ ਪੱਧਰ ਤੱਕ ਧੀਰੇ-ਧੀਰੇ ਬਣਦੇ ਹਨ
3. **ਅਸਲ ਦੁਨੀਆ ਦਾ ਸੰਦਰਭ**: ਸਾਰੇ ਉਦਾਹਰਨ ਵਾਸਤਵਿਕ ਰਿਟੇਲ ਕਾਰੋਬਾਰ ਦੇ ਸੰਦਰਭਾਂ 'ਤੇ ਆਧਾਰਿਤ ਹਨ
4. **ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਤਿਆਰ**: ਕੋਡ ਉਦਾਹਰਨਾਂ ਅਸਲ ਪ੍ਰੋਡਕਸ਼ਨ ਵਰਤੋਂ ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤੇ ਗਏ ਹਨ
5. **ਕਮਿਊਨਿਟੀ ਸਹਾਇਤਾ**: ਸਾਡੀ [Discord ਕਮਿਊਨਿਟੀ](https://discord.com/invite/ByRwuEEgH4) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ ਮਦਦ ਅਤੇ ਚਰਚਾ ਲਈ

### 🔗 ਸੰਬੰਧਿਤ ਸਰੋਤ

- **[MCP ਸ਼ੁਰੂਆਤੀ ਲਈ](https://aka.ms/mcp-for-beginners)**: ਮੂਲ ਪਿਛੋਕੜ ਪੜ੍ਹਾਈ
- **[ਸੈਂਪਲ ਵਾਕਥਰੂ](Sample_Walkthrough.md)**: ਉੱਚ ਪੱਧਰੀ ਤਕਨੀਕੀ ਝਲਕ
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: ਉਦਾਹਰਨਾਂ ਵਿੱਚ ਵਰਤਿਆ ਕਲਾਉਡ ਪਲੇਟਫਾਰਮ
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Python MCP ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ ਫਰੇਮਵਰਕ

**ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?** **[Module 00: Introduction](walkthrough/00-Introduction/README.md)** ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਜਾਂ **[ਪੂਰਾ ਵਾਕਥਰੂ ਝਲਕ](walkthrough/README.md)** ਦੀ ਖੋਜ ਕਰੋ।

## ਪੂਰਵ ਸ਼ਰਤਾਂ

1. Docker Desktop ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
2. Git ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
3. **Azure CLI**: Azure CLI ਨਾਲ ਇੰਸਟਾਲ ਅਤੇ ਪ੍ਰਮਾਣਿਤ ਕਰੋ
4. OpenAI `text-embedding-3-small` ਮਾਡਲ ਅਤੇ ਵਿਕਲਪਕ ਤੌਰ 'ਤੇ `gpt-4o-mini` ਮਾਡਲ ਤੱਕ ਪਹੁੰਚ

## ਸ਼ੁਰੂਆਤ

ਟਰਮੀਨਲ ਵਿੰਡੋ ਖੋਲ੍ਹੋ ਅਤੇ ਹੇਠਾਂ ਦਿੱਤੇ ਕਮਾਂਡ ਚਲਾਓ:

1. Azure CLI ਨਾਲ ਪ੍ਰਮਾਣਿਤ ਕਰੋ

    ```bash
    az login
    ```

2. ਰਿਪੋਜ਼ਟਰੀ ਕਲੋਨ ਕਰੋ

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. ਪ੍ਰੋਜੈਕਟ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਜਾਓ

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Azure ਸਰੋਤਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ

MCP ਸਰਵਰ ਲਈ ਲੋੜੀਂਦੇ Azure ਸਰੋਤਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਲਈ ਹੇਠਾਂ ਦਿੱਤੇ ਸਕ੍ਰਿਪਟ ਚਲਾਓ।

ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ `text-embedding-3-small` ਮਾਡਲ ਨੂੰ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਡਿਪਲੌਇ ਕਰਦੇ ਹਨ। ਡਿਪਲੌਇਮੈਂਟ ਦੌਰਾਨ, ਤੁਹਾਨੂੰ `gpt-4o-mini` ਮਾਡਲ ਸ਼ਾਮਲ ਕਰਨ ਦਾ ਵਿਕਲਪ ਮਿਲੇਗਾ। ਧਿਆਨ ਦਿਓ ਕਿ `gpt-4o-mini` ਇਸ ਪ੍ਰੋਜੈਕਟ ਲਈ **ਲਾਜ਼ਮੀ ਨਹੀਂ** ਹੈ ਅਤੇ ਸਿਰਫ਼ ਸੰਭਾਵਿਤ ਭਵਿੱਖ ਦੇ ਸੁਧਾਰਾਂ ਲਈ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ ਹੈ।

**ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਲਈ ਸਕ੍ਰਿਪਟ ਚੁਣੋ:**

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

## MCP ਸਰਵਰ ਚਲਾਉਣਾ

ਪੂਰੇ ਸਟੈਕ (PostgreSQL + MCP Server) ਨੂੰ ਚਲਾਉਣ ਦਾ ਸਭ ਤੋਂ ਆਸਾਨ ਤਰੀਕਾ Docker Compose ਵਰਤਣਾ ਹੈ:

### ਸਟੈਕ ਸ਼ੁਰੂ ਕਰੋ

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

## ਵਰਤੋਂ

ਹੇਠਾਂ ਦਿੱਤਾ ਗਿਆ ਮੰਨਦਾ ਹੈ ਕਿ ਤੁਸੀਂ VS Code ਵਿੱਚ ਬਣੇ MCP ਸਰਵਰ ਸਹਾਇਤਾ ਦੀ ਵਰਤੋਂ ਕਰ ਰਹੇ ਹੋ।

1. ਪ੍ਰੋਜੈਕਟ ਨੂੰ VS Code ਵਿੱਚ ਖੋਲ੍ਹੋ। ਟਰਮੀਨਲ ਤੋਂ ਚਲਾਓ:

    ```bash
    code .
    ```

2. `.vscode/mcp.json` ਵਿੱਚ ਕਨਫਿਗਰੇਸ਼ਨ ਵਰਤ ਕੇ ਇੱਕ ਜਾਂ ਵੱਧ MCP ਸਰਵਰ ਸ਼ੁਰੂ ਕਰੋ। ਫਾਈਲ ਵਿੱਚ ਚਾਰ ਵੱਖ-ਵੱਖ ਸਰਵਰ ਕਨਫਿਗਰੇਸ਼ਨ ਹਨ, ਜੋ ਹਰ ਇੱਕ ਸਟੋਰ ਮੈਨੇਜਰ ਦੀ ਭੂਮਿਕਾ ਨੂੰ ਦਰਸਾਉਂਦੇ ਹਨ:

   - ਹਰ ਕਨਫਿਗਰੇਸ਼ਨ ਇੱਕ ਵਿਲੱਖਣ RLS (Row Level Security) ਯੂਜ਼ਰ ID ਵਰਤਦਾ ਹੈ
   - ਇਹ ਯੂਜ਼ਰ IDs ਵੱਖ-ਵੱਖ ਸਟੋਰ ਮੈਨੇਜਰ ਦੀਆਂ ਪਹਿਚਾਣਾਂ ਨੂੰ ਡਾਟਾਬੇਸ ਤੱਕ ਪਹੁੰਚ ਕਰਨ ਲਈ ਨਕਲ ਕਰਦੇ ਹਨ
   - RLS ਸਿਸਟਮ ਮੈਨੇਜਰ ਦੇ ਨਿਰਧਾਰਤ ਸਟੋਰ ਦੇ ਅਧਾਰ 'ਤੇ ਡਾਟਾ ਪਹੁੰਚ ਨੂੰ ਸੀਮਿਤ ਕਰਦਾ ਹੈ
   - ਇਹ ਅਸਲ ਦੁਨੀਆ ਦੇ ਸੰਦਰਭਾਂ ਨੂੰ ਨਕਲ ਕਰਦਾ ਹੈ ਜਿੱਥੇ ਸਟੋਰ ਮੈਨੇਜਰ ਵੱਖ-ਵੱਖ Entra ID ਖਾਤਿਆਂ ਨਾਲ ਸਾਈਨ ਇਨ ਕਰਦੇ ਹਨ

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

### VS Code AI ਚੈਟ ਖੋਲ੍ਹੋ

1. VS Code ਵਿੱਚ AI ਚੈਟ ਮੋਡ ਖੋਲ੍ਹੋ
2. **#zava** ਟਾਈਪ ਕਰੋ ਅਤੇ ਤੁਹਾਡੇ ਦੁਆਰਾ ਸ਼ੁਰੂ ਕੀਤੇ MCP ਸਰਵਰਾਂ ਵਿੱਚੋਂ ਇੱਕ ਚੁਣੋ
3. ਵਿਕਰੀ ਡਾਟਾ ਬਾਰੇ ਸਵਾਲ ਪੁੱਛੋ - ਹੇਠਾਂ ਦਿੱਤੇ ਸੈਂਪਲ ਕਵੈਰੀਜ਼ ਵੇਖੋ

### ਸੈਂਪਲ ਕਵੈਰੀਜ਼

1. ਵਿਕਰੀ ਰੈਵਨਿਊ ਦੇ ਅਧਾਰ 'ਤੇ ਸਿਖਰ ਦੇ 20 ਉਤਪਾਦ ਦਿਖਾਓ
1. ਸਟੋਰ ਦੁਆਰਾ ਵਿਕਰੀ ਦਿਖਾਓ
1. ਪਿਛਲੇ ਤਿਮਾਹੀ ਦੀਆਂ ਸ਼੍ਰੇਣੀ ਦੁਆਰਾ ਵਿਕਰੀ ਕੀ ਸੀ?
1. "ਪੇਂਟ ਲਈ ਕੰਟੇਨਰ" ਦੇ ਸਮਾਨ ਉਤਪਾਦ ਜੋ ਅਸੀਂ ਵੇਚਦੇ ਹਾਂ ਉਹ ਕੀ ਹਨ?

## ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ

- **ਮਲਟੀ-ਟੇਬਲ ਸਕੀਮਾ ਪਹੁੰਚ**: ਇੱਕ ਹੀ ਬੇਨਤੀ ਵਿੱਚ ਕਈ ਡਾਟਾਬੇਸ ਟੇਬਲਾਂ ਲਈ ਸਕੀਮਾਂ ਪ੍ਰਾਪਤ ਕਰੋ
- **ਸੁਰੱਖਿਅਤ ਕਵੈਰੀ ਐਗਜ਼ਿਕਿਊਸ਼ਨ**: Row Level Security (RLS) ਸਹਾਇਤਾ ਨਾਲ PostgreSQL ਕਵੈਰੀਜ਼ ਚਲਾਓ
- **ਰਿਅਲ-ਟਾਈਮ ਡਾਟਾ**: ਮੌਜੂਦਾ ਵਿਕਰੀ, ਸਟਾਕ ਅਤੇ ਗਾਹਕ ਡਾਟਾ ਤੱਕ ਪਹੁੰਚ
- **ਮਿਤੀ/ਸਮਾਂ ਯੂਟਿਲਿਟੀਜ਼**: ਸਮੇਂ-ਸੰਵੇਦਨਸ਼ੀਲ ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ ਮੌਜੂਦਾ UTC ਟਾਈਮਸਟੈਂਪ ਪ੍ਰਾਪਤ ਕਰੋ
- **ਲਚਕਦਾਰ ਡਿਪਲੌਇਮੈਂਟ**: HTTP ਸਰਵਰ ਮੋਡ ਦਾ ਸਮਰਥਨ

## ਸਮਰਥਿਤ ਟੇਬਲਾਂ

ਸਰਵਰ ਹੇਠਾਂ ਦਿੱਤੀਆਂ ਰਿਟੇਲ ਡਾਟਾਬੇਸ ਟੇਬਲਾਂ ਤੱਕ ਪਹੁੰਚ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- `retail.customers` - ਗਾਹਕ ਜਾਣਕਾਰੀ ਅਤੇ ਪ੍ਰੋਫਾਈਲ
- `retail.stores` - ਸਟੋਰ ਦੇ ਸਥਾਨ ਅਤੇ ਵੇਰਵੇ
- `retail.categories` - ਉਤਪਾਦ ਸ਼੍ਰੇਣੀਆਂ ਅਤੇ ਹਾਇਰਾਰਕੀ
- `retail.product_types` - ਉਤਪਾਦ ਕਿਸਮ ਵਰਗੀਕਰਨ
- `retail.products` - ਉਤਪਾਦ ਕੈਟਾਲੌਗ ਅਤੇ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- `retail.orders` - ਗਾਹਕ ਦੇ ਆਰਡਰ ਅਤੇ ਲੈਣ-ਦੇਣ
- `retail.order_items` - ਆਰਡਰ ਵਿੱਚ ਵਿਅਕਤੀਗਤ ਆਈਟਮ
- `retail.inventory` - ਮੌਜੂਦਾ ਸਟਾਕ ਪੱਧਰ ਅਤੇ ਸਟਾਕ ਡਾਟਾ

## ਉਪਲਬਧ ਟੂਲ

### `get_multiple_table_schemas`

ਇੱਕ ਹੀ ਬੇਨਤੀ ਵਿੱਚ ਕਈ ਟੇਬਲਾਂ ਲਈ ਡਾਟਾਬੇਸ ਸਕੀਮਾਂ ਪ੍ਰਾਪਤ ਕਰੋ।

**ਪੈਰਾਮੀਟਰ**:

- `table_names` (list[str]): ਉਪਰੋਕਤ ਸਮਰਥਿਤ ਟੇਬਲਾਂ ਵਿੱਚੋਂ ਵੈਧ ਟੇਬਲ ਨਾਮਾਂ ਦੀ ਸੂਚੀ

**ਵਾਪਸੀ:** ਬੇਨਤੀ ਕੀਤੀਆਂ ਟੇਬਲਾਂ ਲਈ ਸਕੀਮਾ ਸਤਰਾਂ ਨੂੰ ਜੋੜਿਆ ਗਿਆ

### `execute_sales_query`

PostgreSQL ਕਵੈਰੀਜ਼ ਨੂੰ Row Level Security ਨਾਲ ਵਿਕਰੀ ਡਾਟਾਬੇਸ 'ਤੇ ਚਲਾਓ।

**ਪੈਰਾਮੀਟਰ**:

- `postgresql_query` (str): ਇੱਕ ਵਧੀਆ ਬਣਿਆ PostgreSQL ਕਵੈਰੀ

**ਵਾਪਸੀ:** ਸਤਰਾਂ ਦੇ ਰੂਪ ਵਿੱਚ ਫਾਰਮੈਟ ਕੀਤੇ ਕਵੈਰੀ ਨਤੀਜੇ (ਪੜ੍ਹਨਯੋਗਤਾ ਲਈ 20 ਸਤਰਾਂ ਤੱਕ ਸੀਮਿਤ)

**ਸਰਵੋਤਮ ਅਭਿਆਸ**:

- ਹਮੇਸ਼ਾ ਪਹਿਲਾਂ ਟੇਬਲ ਸਕੀਮਾਂ ਪ੍ਰਾਪਤ ਕਰੋ
- ਸਕੀਮਾਂ ਤੋਂ ਸਹੀ ਕਾਲਮ ਨਾਮ ਵਰਤੋ
- ਵਿਸ਼ਲੇਸ਼ਣ ਲਈ ਸੰਪੂਰਨ ਨਤੀਜੇ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਸੰਬੰਧਿਤ ਟੇਬਲਾਂ ਨੂੰ ਜੋੜੋ
- ਜਿੱਥੇ ਜ਼ਰੂਰੀ ਹੋਵੇ, ਨਤੀਜਿਆਂ ਨੂੰ ਇਕੱਠਾ ਕਰੋ
- ਪੜ੍ਹਨਯੋਗਤਾ ਲਈ ਆਉਟਪੁੱਟ ਨੂੰ ਸੀਮਿਤ ਕਰੋ

### `get_current_utc_date`

ISO ਫਾਰਮੈਟ ਵਿੱਚ ਮੌਜੂਦਾ UTC ਮਿਤੀ ਅਤੇ ਸਮਾਂ ਪ੍ਰਾਪਤ ਕਰੋ।

**ਵਾਪਸੀ:** ਮੌਜੂਦਾ UTC ਮਿਤੀ/ਸਮਾਂ ISO ਫਾਰਮੈਟ ਵਿੱਚ (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

ਗਾਹਕ ਦੀਆਂ ਬੇਨਤੀਆਂ ਦੇ ਅਧਾਰ 'ਤੇ ਉਤਪਾਦਾਂ ਲਈ ਸੈਮੈਂਟਿਕ ਖੋਜ ਕਰੋ।

**ਵਾਪਸੀ:** ਖੋਜ ਮਾਪਦੰਡਾਂ ਨੂੰ ਮਿਲਦੇ ਉਤਪਾਦਾਂ ਦੀ ਸੂਚੀ

**ਪੈਰਾਮੀਟਰ**:

- `query` (str): ਖੋਜ ਬੇਨਤੀ ਸਤਰ

**ਵਾਪਸੀ:** ਖੋਜ ਮਾਪਦੰਡਾਂ ਨੂੰ ਮਿਲਦੇ ਉਤਪਾਦਾਂ ਦੀ ਸੂਚੀ

## ਸੁਰੱਖਿਆ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ

### Row Level Security (RLS)

ਸਰਵਰ ਇਹ ਯਕੀਨੀ ਬਣਾਉਣ ਲਈ Row Level Security ਨੂੰ ਲਾਗੂ ਕਰਦਾ ਹੈ ਕਿ ਯੂਜ਼ਰ ਸਿਰਫ਼ ਉਹ ਡਾਟਾ ਤੱਕ ਪਹੁੰਚ ਕਰਦੇ ਹਨ ਜਿਸ ਲਈ ਉਹ ਅਧਿਕਾਰਤ ਹਨ:

- **HTTP ਮੋਡ**: ਬੇਨਤੀ ਕਰਨ ਵਾਲੇ ਯੂਜ਼ਰ ਦੀ ਪਹਿਚਾਣ ਕਰਨ ਲਈ `x-rls-user-id` ਹੈਡਰ ਵਰਤਦਾ ਹੈ

- **ਡਿਫਾਲਟ ਫਾਲਬੈਕ**: ਜਦੋਂ ਕੋਈ ਯੂਜ਼ਰ ID ਪ੍ਰਦਾਨ ਨਹੀਂ ਕੀਤੀ ਜਾਂਦੀ, ਤਦ ਪਲੇਸਹੋਲਡਰ UUID ਵਰਤਦਾ ਹੈ

#### ਸਟੋਰ-ਵਿਸ਼ੇਸ਼ RLS ਯੂਜ਼ਰ IDs

ਹਰ Zava Retail ਸਟੋਰ ਸਥਾਨ ਦਾ ਇੱਕ ਵਿਲੱਖਣ RLS ਯੂਜ਼ਰ ID ਹੁੰਦਾ ਹੈ ਜੋ ਇਹ ਨਿਰਧਾਰਤ ਕਰਦਾ ਹੈ ਕਿ ਯੂਜ਼ਰ ਕਿਹੜਾ ਡਾਟਾ ਤੱਕ ਪਹੁੰਚ ਕਰ ਸਕਦਾ ਹੈ:

| ਸਟੋਰ ਸਥਾਨ | RLS ਯੂਜ਼ਰ ID | ਵੇਰਵਾ |
|---------------|-------------|-------------|
| **ਗਲੋਬਲ ਪਹੁੰਚ** | `00000000-0000-0000-0000-000000000000` | ਡਿਫਾਲਟ ਫਾਲਬੈਕ - ਸਾਰੇ ਸਟੋਰ ਪਹੁੰਚ |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Zava Retail Seattle ਸਟੋਰ ਡਾਟਾ |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Zava Retail Bellevue ਸਟੋਰ ਡਾਟਾ |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Zava Retail Tacoma ਸਟੋਰ ਡਾਟਾ |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Zava Retail Spokane ਸਟੋਰ ਡਾਟਾ |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Zava Retail Everett ਸਟੋਰ ਡਾਟਾ |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Zava Retail Redmond ਸਟੋਰ ਡਾਟਾ |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Zava Retail Kirkland ਸਟੋਰ ਡਾਟਾ |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Zava Retail Online ਸਟੋਰ ਡਾਟਾ |

#### RLS ਲਾਗੂ ਕਰਨਾ

ਜਦੋਂ ਕੋਈ ਯੂਜ਼ਰ ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਸਟੋਰ ਦੇ RLS ਯੂਜ਼ਰ ID ਨਾਲ ਕਨੈਕਟ ਕਰਦਾ ਹੈ, ਉਹ ਸਿਰਫ਼ ਇਹ ਡਾਟਾ ਵੇਖੇਗਾ:

- ਉਸ ਸਟੋਰ ਨਾਲ ਸੰਬੰਧਿਤ ਗਾਹਕ
- ਉਸ ਸਟੋਰ ਸਥਾਨ 'ਤੇ ਕੀਤੇ ਆਰਡਰ
- ਉਸ ਵਿਸ਼ੇਸ਼ ਸਟੋਰ ਲਈ ਸਟਾਕ ਡਾਟਾ
- ਸਟੋਰ-ਵਿਸ਼ੇਸ਼ ਵਿਕਰੀ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਮਾਪਦੰਡ

ਇਹ ਵੱਖ-ਵੱਖ ਸਟੋਰ ਸਥਾਨਾਂ ਦੇ ਵਿਚਕਾਰ ਡਾਟਾ ਨੂੰ ਅਲੱਗ ਕਰਦਾ ਹੈ ਜਦੋਂ ਕਿ ਇੱਕਜੁਟ ਡਾਟਾਬੇਸ ਸਕੀਮਾ ਨੂੰ ਬਣਾਈ ਰੱਖਦਾ ਹੈ।

## ਆਰਕੀਟੈਕਚਰ

### ਐਪਲੀਕੇਸ਼ਨ ਸੰਦਰਭ

ਸਰਵਰ ਇੱਕ ਪ੍ਰਬੰਧਿਤ ਐਪਲੀਕੇਸ਼ਨ ਸੰਦਰਭ ਵਰਤਦਾ ਹੈ:

- **ਡਾਟਾਬੇਸ ਕਨੈਕਸ਼ਨ ਪੂਲ**: HTTP ਮੋਡ ਲਈ ਕੁਸ਼ਲ ਕਨੈਕਸ਼ਨ ਪ੍ਰਬੰਧਨ
- **ਲਾਈਫਸਾਈਕਲ ਪ੍ਰਬੰਧਨ**: ਸ਼ਟਡਾਊਨ 'ਤੇ ਸਹੀ ਸਰੋਤ ਸਾਫ਼ ਕਰਨਾ
- **ਟਾਈਪ ਸੇਫਟੀ**: `AppContext` ਡਾਟਾਕਲਾਸ ਨਾਲ ਮਜ਼ਬੂਤੀ ਨਾਲ ਟਾਈਪ ਕੀਤਾ ਸੰਦਰਭ

### ਬੇਨਤੀ ਸੰਦਰਭ

- **ਹੈਡਰ ਐਕਸਟ੍ਰੈਕਸ਼ਨ**: ਯੂਜ਼ਰ ਪਹਿਚਾਣ ਲਈ ਸੁਰੱਖਿਅਤ ਹੈਡਰ ਪਾਰਸਿੰਗ
- **RLS ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: ਬੇਨਤੀ ਸੰਦਰਭ ਤੋਂ ਆਟੋਮੈਟਿਕ ਯੂਜ਼ਰ ID ਰਿਜ਼ੋਲੂਸ਼ਨ
- **ਐਰਰ ਹੈਂਡਲਿੰਗ**: ਯੂਜ਼ਰ-ਫ੍ਰੈਂਡਲੀ ਸੁਨੇਹਿਆਂ ਨਾਲ ਵਿਸਤ੍ਰਿਤ ਐਰਰ ਹੈਂਡਲਿੰਗ

## ਡਾਟਾਬੇਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

ਸਰਵਰ `PostgreSQLSchemaProvider` ਕਲਾਸ ਰਾਹੀਂ PostgreSQL ਡਾਟਾਬੇਸ ਨਾਲ ਇੰਟੀਗ੍ਰੇਟ ਕਰਦਾ ਹੈ:

- **ਕਨੈਕਸ਼ਨ ਪੂਲਿੰਗ**: ਸਕੇਲਬਿਲਿਟੀ ਲਈ async ਕਨੈਕਸ਼ਨ ਪੂਲ ਵਰਤਦਾ ਹੈ
- **ਸਕੀਮਾ ਮੈਟਾਡੇਟਾ**: ਵਿਸਤ੍ਰਿਤ ਟੇਬਲ ਸਕੀਮਾ ਜਾਣਕਾਰੀ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ
- **ਕਵੈਰੀ ਐਗਜ਼ਿਕਿਊਸ਼ਨ

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚੱਜੇਪਣ ਹੋ ਸਕਦੇ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤ ਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।