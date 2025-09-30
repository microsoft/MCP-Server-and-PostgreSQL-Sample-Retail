<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:32:22+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ro"
}
-->
# Șabloane de Infrastructură

Acest folder conține șabloanele de implementare a infrastructurii pentru proiectul MCP Retail Analytics.

## 📁 Prezentare Generală a Fișierelor

| Fișier | Descriere | Utilizare |
|--------|-----------|-----------|
| `azuredeploy.json` | **Șablon ARM** - Implementare completă la nivel de abonament | Recomandat pentru toate implementările |
| `azuredeploy.parameters.json` | **Parametri ARM** - Valori de configurare statice | Utilizat împreună cu `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Ghid de implementare ARM** - Instrucțiuni detaliate | Documentație completă pentru implementare |
| `README.md` | **Acest fișier** - Prezentare generală a infrastructurii | Referință rapidă |

## 🚀 Opțiuni de Implementare

### Opțiunea 1: Azure CLI (Recomandată)
Implementare completă cu crearea grupului de resurse:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opțiunea 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opțiunea 3: Portalul Azure
1. Accesați [Portalul Azure](https://portal.azure.com)
2. Căutați "Deploy a custom template"
3. Încărcați `azuredeploy.json`
4. Configurați parametrii și implementați

## 🏗️ Componentele Infrastructurii

Șablonul ARM implementează următoarele componente de infrastructură:

- **Grup de Resurse**: Container pentru toate resursele cu denumire consistentă
- **Log Analytics Workspace**: Centralizare pentru loguri și monitorizare (retenție de 30 de zile)
- **Application Insights**: Monitorizare performanță aplicații integrată cu Log Analytics
- **Servicii Azure AI**: Hub AI multi-servicii (nivel S0) cu identitate gestionată
- **Modele OpenAI**:
  - `gpt-4o-mini` (capacitate 120) - Model de chat și completare
  - `text-embedding-3-small` (capacitate 50) - Încorporări text pentru căutare semantică

## 🔧 Configurarea Șablonului

### Parametri
Șablonul ARM acceptă următorii parametri personalizabili:

| Parametru | Valoare Implicită | Descriere |
|-----------|-------------------|-----------|
| `resourcePrefix` | `mcpretail` | Prefix pentru toate denumirile resurselor |
| `location` | `westus2` | Regiunea Azure pentru implementare |
| `uniqueSuffix` | Generat automat | Identificator unic de 4 caractere |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nume afișat |
| `gptModelCapacity` | `120` | Capacitatea modelului GPT (în token-uri) |
| `embeddingModelCapacity` | `50` | Capacitatea modelului de încorporare |

### Convenția de Denumire a Resurselor
Toate resursele urmează modelul: `{type}-{resourcePrefix}-{uniqueSuffix}`

Exemple:
- Grup de Resurse: `rg-mcpretail-demo`
- Serviciu AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validarea Șablonului

### Validare înainte de Implementare
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Verificarea Stării Implementării
```bash
az deployment sub list --output table
```

## 💰 Estimarea Costurilor

Costuri lunare estimate pentru sarcini de lucru de dezvoltare:

| Serviciu | Configurație | Cost Estimat/Lună |
|----------|--------------|-------------------|
| Servicii Azure AI | Nivel S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K token-uri | $15-30 |
| OpenAI Embeddings | 50K token-uri | $5-15 |
| Application Insights | Monitorizare de bază | $5-15 |
| Log Analytics | 1GB/lună | $2-5 |
| **Total** | | **$42-115** |

## 📚 Resurse Suplimentare

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Ghid detaliat de implementare cu soluții pentru probleme
- [Documentația Șabloanelor ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Documentația Serviciilor Azure AI](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Rezultatele validării fișierelor

## 🆘 Soluționare Rapidă a Problemelor

### Probleme Frecvente
- **Autentificare**: Rulați `az login` pentru autentificare
- **Limite de cotă**: Verificați disponibilitatea modelului OpenAI în regiunea țintă
- **Conflicte de denumire**: Utilizați un parametru `uniqueSuffix` diferit
- **Permisiuni**: Asigurați-vă că contul are rolul de Contributor pe abonament

### Obțineți Ajutor
- Consultați [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) pentru soluții detaliate
- Verificați logurile de implementare în Portalul Azure
- Vizitați [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Pentru configurarea completă a proiectului, consultați [README principal](../../README.md) sau [ghidul proiectului](../../walkthrough/README.md).

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.