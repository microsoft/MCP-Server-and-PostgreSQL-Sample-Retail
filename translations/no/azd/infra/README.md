<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:28:20+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "no"
}
-->
# Infrastrukturmaler

Denne mappen inneholder maler for infrastrukturutplassering for MCP Retail Analytics-prosjektet.

## 📁 Filoversikt

| Fil | Beskrivelse | Brukstilfelle |
|------|-------------|----------|
| `azuredeploy.json` | **ARM-mal** - Komplett distribusjon på abonnementsnivå | Anbefalt for alle distribusjoner |
| `azuredeploy.parameters.json` | **ARM-parametere** - Statisk konfigurasjonsverdier | Brukes sammen med `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM-distribusjonsveiledning** - Detaljerte instruksjoner | Fullstendig dokumentasjon for distribusjon |
| `README.md` | **Denne filen** - Oversikt over infrastruktur | Rask referanse |

## 🚀 Distribusjonsalternativer

### Alternativ 1: Azure CLI (Anbefalt)
Fullstendig distribusjon med opprettelse av ressursgruppe:
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
1. Gå til [Azure Portal](https://portal.azure.com)
2. Søk etter "Deploy a custom template"
3. Last opp `azuredeploy.json`
4. Konfigurer parametere og distribuer

## 🏗️ Infrastrukturkomponenter

ARM-malen distribuerer følgende infrastruktur:

- **Ressursgruppe**: Beholder for alle ressurser med konsistent navngivning
- **Log Analytics Workspace**: Sentral logging og overvåking (30-dagers oppbevaring)
- **Application Insights**: Overvåking av applikasjonsytelse integrert med Log Analytics
- **Azure AI Services**: Multi-service AI-hub (S0-nivå) med administrert identitet
- **OpenAI-modeller**:
  - `gpt-4o-mini` (120 kapasitet) - Chat- og fullføringsmodell
  - `text-embedding-3-small` (50 kapasitet) - Tekstinnbygging for semantisk søk

## 🔧 Konfigurasjon av mal

### Parametere
ARM-malen aksepterer følgende tilpassbare parametere:

| Parameter | Standardverdi | Beskrivelse |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | Prefiks for alle ressursnavn |
| `location` | `westus2` | Azure-region for distribusjon |
| `uniqueSuffix` | Auto-generert | 4-tegns unik identifikator |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Visningsnavn |
| `gptModelCapacity` | `120` | GPT-modellens tokenkapasitet |
| `embeddingModelCapacity` | `50` | Kapasitet for innbyggingsmodell |

### Navnekonvensjon for ressurser
Alle ressurser følger mønsteret: `{type}-{resourcePrefix}-{uniqueSuffix}`

Eksempler:
- Ressursgruppe: `rg-mcpretail-demo`
- AI-tjeneste: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validering av mal

### Valider før distribusjon
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Sjekk distribusjonsstatus
```bash
az deployment sub list --output table
```

## 💰 Kostnadsestimering

Estimert månedlig kostnad for utviklingsarbeidsbelastning:

| Tjeneste | Konfigurasjon | Est. Kostnad/måned |
|---------|---------------|-----------------|
| Azure AI Services | S0-nivå | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Grunnleggende overvåking | $5-15 |
| Log Analytics | 1GB/måned | $2-5 |
| **Totalt** | | **$42-115** |

## 📚 Tilleggsressurser

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detaljert distribusjonsveiledning med feilsøking
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultater fra filvalidering

## 🆘 Rask feilsøking

### Vanlige problemer
- **Autentisering**: Kjør `az login` for å autentisere
- **Kvotebegrensninger**: Sjekk tilgjengeligheten av OpenAI-modeller i målregionen
- **Navnekonflikter**: Bruk en annen `uniqueSuffix`-parameter
- **Tillatelser**: Sørg for at kontoen har Contributor-rollen på abonnementet

### Få hjelp
- Se [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) for detaljert feilsøking
- Sjekk distribusjonslogger i Azure Portal
- Besøk [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

For komplett prosjektoppsett, se [hoved-README](../../README.md) eller [prosjektgjennomgang](../../walkthrough/README.md).

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.