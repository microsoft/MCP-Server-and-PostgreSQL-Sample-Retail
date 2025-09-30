<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:28:02+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "da"
}
-->
# Infrastruktur Skabeloner

Denne mappe indeholder skabeloner til infrastrukturudrulning for MCP Retail Analytics-projektet.

## 📁 Oversigt over filer

| Fil | Beskrivelse | Anvendelse |
|-----|-------------|------------|
| `azuredeploy.json` | **ARM-skabelon** - Komplet udrulning på abonnementsniveau | Anbefales til alle udrulninger |
| `azuredeploy.parameters.json` | **ARM-parametre** - Statisk konfigurationsværdier | Bruges sammen med `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **ARM-udrulningsvejledning** - Detaljerede instruktioner | Komplet dokumentation for udrulning |
| `README.md` | **Denne fil** - Infrastrukturoversigt | Hurtig reference |

## 🚀 Udrulningsmuligheder

### Mulighed 1: Azure CLI (Anbefalet)
Komplet udrulning med oprettelse af ressourcegruppe:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Mulighed 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Mulighed 3: Azure Portal
1. Gå til [Azure Portal](https://portal.azure.com)
2. Søg efter "Deploy a custom template"
3. Upload `azuredeploy.json`
4. Konfigurer parametre og udrul

## 🏗️ Infrastrukturkomponenter

ARM-skabelonen udruller følgende infrastruktur:

- **Ressourcegruppe**: Beholder for alle ressourcer med ensartet navngivning
- **Log Analytics Workspace**: Central logning og overvågning (30 dages opbevaring)
- **Application Insights**: Overvågning af applikationsydelse integreret med Log Analytics
- **Azure AI Services**: Multi-service AI-hub (S0-niveau) med administreret identitet
- **OpenAI-modeller**:
  - `gpt-4o-mini` (120 kapacitet) - Chat- og kompletteringsmodel
  - `text-embedding-3-small` (50 kapacitet) - Tekstindlejring til semantisk søgning

## 🔧 Skabelonkonfiguration

### Parametre
ARM-skabelonen accepterer følgende tilpasningsparametre:

| Parameter | Standardværdi | Beskrivelse |
|-----------|---------------|-------------|
| `resourcePrefix` | `mcpretail` | Præfiks for alle ressourcenavne |
| `location` | `westus2` | Azure-region for udrulning |
| `uniqueSuffix` | Automatisk genereret | 4-tegns unik identifikator |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Visningsnavn |
| `gptModelCapacity` | `120` | GPT-modellens tokenkapacitet |
| `embeddingModelCapacity` | `50` | Kapacitet for indlejringsmodel |

### Ressource Navngivningskonvention
Alle ressourcer følger mønsteret: `{type}-{resourcePrefix}-{uniqueSuffix}`

Eksempler:
- Ressourcegruppe: `rg-mcpretail-demo`
- AI-tjeneste: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Skabelonvalidering

### Valider før udrulning
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Tjek udrulningsstatus
```bash
az deployment sub list --output table
```

## 💰 Omkostningsestimat

Estimerede månedlige omkostninger for udviklingsarbejde:

| Tjeneste | Konfiguration | Est. omkostning/måned |
|----------|---------------|-----------------------|
| Azure AI Services | S0-niveau | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Grundlæggende overvågning | $5-15 |
| Log Analytics | 1GB/måned | $2-5 |
| **I alt** | | **$42-115** |

## 📚 Yderligere ressourcer

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Detaljeret udrulningsvejledning med fejlfinding
- [ARM Template Documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services Documentation](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultater af filvalidering

## 🆘 Hurtig fejlfinding

### Almindelige problemer
- **Godkendelse**: Kør `az login` for at godkende
- **Kvotebegrænsninger**: Tjek tilgængeligheden af OpenAI-modeller i målregionen
- **Navnekonflikter**: Brug en anden `uniqueSuffix`-parameter
- **Rettigheder**: Sørg for, at kontoen har Contributor-rollen på abonnementet

### Få hjælp
- Se [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) for detaljeret fejlfinding
- Tjek udrulningslogfiler i Azure Portal
- Besøg [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

For komplet projektopsætning, se [hoved README](../../README.md) eller [projektgennemgang](../../walkthrough/README.md).

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.