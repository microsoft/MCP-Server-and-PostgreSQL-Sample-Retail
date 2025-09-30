<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:32:03+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "sk"
}
-->
# Šablóny infraštruktúry

Tento priečinok obsahuje šablóny na nasadenie infraštruktúry pre projekt MCP Retail Analytics.

## 📁 Prehľad súborov

| Súbor | Popis | Použitie |
|-------|-------|----------|
| `azuredeploy.json` | **ARM šablóna** - Kompletné nasadenie na úrovni predplatného | Odporúčané pre všetky nasadenia |
| `azuredeploy.parameters.json` | **ARM parametre** - Statické konfiguračné hodnoty | Používa sa s `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Príručka nasadenia ARM** - Podrobné pokyny | Kompletná dokumentácia nasadenia |
| `README.md` | **Tento súbor** - Prehľad infraštruktúry | Rýchly odkaz |

## 🚀 Možnosti nasadenia

### Možnosť 1: Azure CLI (Odporúčané)
Kompletné nasadenie s vytvorením skupiny zdrojov:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Možnosť 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Možnosť 3: Azure Portal
1. Prejdite na [Azure Portal](https://portal.azure.com)
2. Vyhľadajte "Deploy a custom template"
3. Nahrajte `azuredeploy.json`
4. Nakonfigurujte parametre a nasadte

## 🏗️ Komponenty infraštruktúry

ARM šablóna nasadzuje nasledujúcu infraštruktúru:

- **Skupina zdrojov**: Kontajner pre všetky zdroje s konzistentným názvoslovím
- **Log Analytics Workspace**: Centrálne logovanie a monitorovanie (30-dňová retencia)
- **Application Insights**: Monitorovanie výkonu aplikácií integrované s Log Analytics
- **Azure AI Services**: Viacslužbové AI centrum (S0 tier) s riadenou identitou
- **OpenAI modely**:
  - `gpt-4o-mini` (kapacita 120) - Model pre chat a dokončovanie
  - `text-embedding-3-small` (kapacita 50) - Textové vkladanie pre sémantické vyhľadávanie

## 🔧 Konfigurácia šablóny

### Parametre
ARM šablóna akceptuje nasledujúce prispôsobiteľné parametre:

| Parameter | Predvolená hodnota | Popis |
|-----------|--------------------|-------|
| `resourcePrefix` | `mcpretail` | Predpona pre názvy všetkých zdrojov |
| `location` | `westus2` | Azure región pre nasadenie |
| `uniqueSuffix` | Automaticky generované | 4-znakový unikátny identifikátor |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Zobrazovaný názov |
| `gptModelCapacity` | `120` | Kapacita tokenov GPT modelu |
| `embeddingModelCapacity` | `50` | Kapacita tokenov modelu pre vkladanie |

### Konvencia názvoslovia zdrojov
Všetky zdroje nasledujú vzor: `{type}-{resourcePrefix}-{uniqueSuffix}`

Príklady:
- Skupina zdrojov: `rg-mcpretail-demo`
- AI služba: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validácia šablóny

### Validácia pred nasadením
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Kontrola stavu nasadenia
```bash
az deployment sub list --output table
```

## 💰 Odhad nákladov

Odhadované mesačné náklady na vývojovú záťaž:

| Služba | Konfigurácia | Odhadované náklady/mesiac |
|--------|--------------|--------------------------|
| Azure AI Services | S0 tier | $15-50 |
| OpenAI GPT-4o-mini | 120K tokenov | $15-30 |
| OpenAI Embeddings | 50K tokenov | $5-15 |
| Application Insights | Základné monitorovanie | $5-15 |
| Log Analytics | 1GB/mesiac | $2-5 |
| **Celkom** | | **$42-115** |

## 📚 Ďalšie zdroje

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Podrobná príručka nasadenia s riešením problémov
- [Dokumentácia ARM šablón](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentácia Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Výsledky validácie súborov

## 🆘 Rýchle riešenie problémov

### Bežné problémy
- **Autentifikácia**: Spustite `az login` na autentifikáciu
- **Kvótové limity**: Skontrolujte dostupnosť OpenAI modelov v cieľovom regióne
- **Konflikty názvov**: Použite iný parameter `uniqueSuffix`
- **Oprávnenia**: Uistite sa, že účet má rolu Contributor na predplatnom

### Získajte pomoc
- Pozrite si [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) pre podrobné riešenie problémov
- Skontrolujte logy nasadenia v Azure Portal
- Navštívte [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Pre kompletné nastavenie projektu si pozrite [hlavný README](../../README.md) alebo [prehliadku projektu](../../walkthrough/README.md).

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.