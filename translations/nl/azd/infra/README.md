<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:29:06+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "nl"
}
-->
# Infrastructuursjablonen

Deze map bevat de sjablonen voor infrastructuurimplementatie voor het MCP Retail Analytics-project.

## 📁 Bestandenoverzicht

| Bestand | Beschrijving | Gebruiksscenario |
|---------|--------------|------------------|
| `azuredeploy.json` | **ARM-sjabloon** - Volledige implementatie op abonnementsniveau | Aanbevolen voor alle implementaties |
| `azuredeploy.parameters.json` | **ARM-parameters** - Statische configuratiewaarden | Gebruikt met `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM-implementatiehandleiding** - Gedetailleerde instructies | Volledige implementatiedocumentatie |
| `README.md` | **Dit bestand** - Overzicht van de infrastructuur | Snelle referentie |

## 🚀 Implementatieopties

### Optie 1: Azure CLI (Aanbevolen)
Volledige implementatie met aanmaak van resourcegroep:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Optie 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Optie 3: Azure Portal
1. Ga naar [Azure Portal](https://portal.azure.com)
2. Zoek naar "Een aangepaste sjabloon implementeren"
3. Upload `azuredeploy.json`
4. Configureer parameters en implementeer

## 🏗️ Infrastructuurcomponenten

De ARM-sjabloon implementeert de volgende infrastructuur:

- **Resourcegroep**: Container voor alle resources met consistente naamgeving
- **Log Analytics Workspace**: Centrale logging en monitoring (30 dagen retentie)
- **Application Insights**: Monitoring van applicatieprestaties geïntegreerd met Log Analytics
- **Azure AI Services**: Multi-service AI-hub (S0-laag) met beheerde identiteit
- **OpenAI-modellen**:
  - `gpt-4o-mini` (120 capaciteit) - Chat- en voltooiingsmodel
  - `text-embedding-3-small` (50 capaciteit) - Tekstembeddings voor semantisch zoeken

## 🔧 Sjabloonconfiguratie

### Parameters
De ARM-sjabloon accepteert de volgende aanpasbare parameters:

| Parameter | Standaard | Beschrijving |
|-----------|-----------|--------------|
| `resourcePrefix` | `mcpretail` | Voorvoegsel voor alle resourcenamen |
| `location` | `westus2` | Azure-regio voor implementatie |
| `uniqueSuffix` | Automatisch gegenereerd | 4-karakter unieke identificatie |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Weergavenaam |
| `gptModelCapacity` | `120` | GPT-model token capaciteit |
| `embeddingModelCapacity` | `50` | Embedding model capaciteit |

### Naamgevingsconventie voor resources
Alle resources volgen het patroon: `{type}-{resourcePrefix}-{uniqueSuffix}`

Voorbeelden:
- Resourcegroep: `rg-mcpretail-demo`
- AI-service: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validatie van sjabloon

### Valideer vóór implementatie
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Controleer implementatiestatus
```bash
az deployment sub list --output table
```

## 💰 Kostenraming

Geschatte maandelijkse kosten voor ontwikkelwerkbelasting:

| Service | Configuratie | Geschatte kosten/maand |
|---------|--------------|------------------------|
| Azure AI Services | S0-laag | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Basisbewaking | $5-15 |
| Log Analytics | 1GB/maand | $2-5 |
| **Totaal** | | **$42-115** |

## 📚 Aanvullende bronnen

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Gedetailleerde implementatiehandleiding met probleemoplossing
- [ARM-sjabloondocumentatie](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services-documentatie](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Validatieresultaten van bestanden

## 🆘 Snelle probleemoplossing

### Veelvoorkomende problemen
- **Authenticatie**: Voer `az login` uit om te authenticeren
- **Quotalimieten**: Controleer beschikbaarheid van OpenAI-modellen in de doelregio
- **Naamconflicten**: Gebruik een andere `uniqueSuffix`-parameter
- **Machtigingen**: Zorg ervoor dat het account de rol Contributor heeft op het abonnement

### Hulp krijgen
- Zie [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) voor gedetailleerde probleemoplossing
- Controleer implementatielogs in Azure Portal
- Bezoek [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Voor volledige projectopzet, zie de [hoofd README](../../README.md) of [project walkthrough](../../walkthrough/README.md).

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.