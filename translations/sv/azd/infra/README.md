<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:27:45+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "sv"
}
-->
# Infrastrukturmallar

Den här mappen innehåller mallar för infrastrukturdistribution för MCP Retail Analytics-projektet.

## 📁 Filöversikt

| Fil | Beskrivning | Användningsområde |
|------|-------------|-------------------|
| `azuredeploy.json` | **ARM-mall** - Komplett distribution på prenumerationsnivå | Rekommenderas för alla distributioner |
| `azuredeploy.parameters.json` | **ARM-parametrar** - Statisk konfigurationsdata | Används med `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM-distributionsguide** - Detaljerade instruktioner | Komplett dokumentation för distribution |
| `README.md` | **Den här filen** - Översikt över infrastrukturen | Snabbreferens |

## 🚀 Distributionsalternativ

### Alternativ 1: Azure CLI (Rekommenderas)
Komplett distribution med skapande av resursgrupp:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Alternativ 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Alternativ 3: Azure Portal
1. Gå till [Azure Portal](https://portal.azure.com)
2. Sök efter "Deploy a custom template"
3. Ladda upp `azuredeploy.json`
4. Konfigurera parametrar och distribuera

## 🏗️ Infrastrukturkomponenter

ARM-mallen distribuerar följande infrastruktur:

- **Resursgrupp**: Behållare för alla resurser med konsekvent namngivning
- **Log Analytics Workspace**: Central loggning och övervakning (30 dagars retention)
- **Application Insights**: Övervakning av applikationsprestanda integrerat med Log Analytics
- **Azure AI Services**: Multi-service AI-hubb (S0-nivå) med hanterad identitet
- **OpenAI-modeller**:
  - `gpt-4o-mini` (120 kapacitet) - Chat- och kompletteringsmodell
  - `text-embedding-3-small` (50 kapacitet) - Textinbäddningar för semantisk sökning

## 🔧 Mallkonfiguration

### Parametrar
ARM-mallen accepterar följande anpassningsbara parametrar:

| Parameter | Standardvärde | Beskrivning |
|-----------|---------------|-------------|
| `resourcePrefix` | `mcpretail` | Prefix för alla resursnamn |
| `location` | `westus2` | Azure-region för distribution |
| `uniqueSuffix` | Auto-genererat | 4-teckens unik identifierare |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Visningsnamn |
| `gptModelCapacity` | `120` | GPT-modellens tokenkapacitet |
| `embeddingModelCapacity` | `50` | Kapacitet för inbäddningsmodell |

### Namngivningskonvention för resurser
Alla resurser följer mönstret: `{type}-{resourcePrefix}-{uniqueSuffix}`

Exempel:
- Resursgrupp: `rg-mcpretail-demo`
- AI-tjänst: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Mallvalidering

### Validera innan distribution
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Kontrollera distributionsstatus
```bash
az deployment sub list --output table
```


## 💰 Kostnadsberäkning

Beräknade månadskostnader för utvecklingsarbetsbelastning:

| Tjänst | Konfiguration | Beräknad kostnad/månad |
|--------|---------------|------------------------|
| Azure AI Services | S0-nivå | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Grundläggande övervakning | $5-15 |
| Log Analytics | 1GB/månad | $2-5 |
| **Totalt** | | **$42-115** |

## 📚 Ytterligare resurser

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detaljerad distributionsguide med felsökning
- [ARM-malldokumentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services-dokumentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultat av filvalidering

## 🆘 Snabb felsökning

### Vanliga problem
- **Autentisering**: Kör `az login` för att autentisera
- **Kvotgränser**: Kontrollera tillgänglighet för OpenAI-modeller i målregionen
- **Namngivningskonflikter**: Använd en annan parameter för `uniqueSuffix`
- **Behörigheter**: Säkerställ att kontot har Contributor-roll på prenumerationen

### Få hjälp
- Se [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) för detaljerad felsökning
- Kontrollera distributionsloggar i Azure Portal
- Besök [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

För komplett projektuppsättning, se [huvud-README](../../README.md) eller [projektgenomgång](../../walkthrough/README.md).

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.