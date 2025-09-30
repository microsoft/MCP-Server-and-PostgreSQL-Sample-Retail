<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:26:18+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "pl"
}
-->
# Szablony Infrastruktury

Ten folder zawiera szablony wdrożenia infrastruktury dla projektu MCP Retail Analytics.

## 📁 Przegląd Plików

| Plik | Opis | Zastosowanie |
|------|------|--------------|
| `azuredeploy.json` | **Szablon ARM** - Kompleksowe wdrożenie na poziomie subskrypcji | Zalecane dla wszystkich wdrożeń |
| `azuredeploy.parameters.json` | **Parametry ARM** - Statyczne wartości konfiguracyjne | Używane z `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Przewodnik wdrożenia ARM** - Szczegółowe instrukcje | Kompleksowa dokumentacja wdrożenia |
| `README.md` | **Ten plik** - Przegląd infrastruktury | Szybkie odniesienie |

## 🚀 Opcje Wdrożenia

### Opcja 1: Azure CLI (Zalecane)
Kompleksowe wdrożenie z utworzeniem grupy zasobów:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opcja 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opcja 3: Portal Azure
1. Przejdź do [Portalu Azure](https://portal.azure.com)
2. Wyszukaj "Wdrażanie niestandardowego szablonu"
3. Prześlij plik `azuredeploy.json`
4. Skonfiguruj parametry i wdrożenie

## 🏗️ Komponenty Infrastruktury

Szablon ARM wdraża następujące komponenty infrastruktury:

- **Grupa zasobów**: Kontener dla wszystkich zasobów z jednolitą nazwą
- **Log Analytics Workspace**: Centralne logowanie i monitorowanie (retencja 30 dni)
- **Application Insights**: Monitorowanie wydajności aplikacji zintegrowane z Log Analytics
- **Azure AI Services**: Centrum wielousługowe AI (warstwa S0) z zarządzaną tożsamością
- **Modele OpenAI**:
  - `gpt-4o-mini` (pojemność 120) - Model do czatu i uzupełnień
  - `text-embedding-3-small` (pojemność 50) - Wbudowania tekstowe do wyszukiwania semantycznego

## 🔧 Konfiguracja Szablonu

### Parametry
Szablon ARM akceptuje następujące parametry konfiguracyjne:

| Parametr | Domyślna wartość | Opis |
|----------|------------------|------|
| `resourcePrefix` | `mcpretail` | Prefiks dla wszystkich nazw zasobów |
| `location` | `westus2` | Region Azure dla wdrożenia |
| `uniqueSuffix` | Generowany automatycznie | 4-znakowy unikalny identyfikator |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Wyświetlana nazwa |
| `gptModelCapacity` | `120` | Pojemność tokenów modelu GPT |
| `embeddingModelCapacity` | `50` | Pojemność tokenów modelu wbudowań |

### Konwencja Nazewnictwa Zasobów
Wszystkie zasoby stosują wzór: `{type}-{resourcePrefix}-{uniqueSuffix}`

Przykłady:
- Grupa zasobów: `rg-mcpretail-demo`
- Usługa AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Walidacja Szablonu

### Walidacja Przed Wdrożeniem
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Sprawdzenie Statusu Wdrożenia
```bash
az deployment sub list --output table
```

## 💰 Szacowanie Kosztów

Szacowane miesięczne koszty dla środowiska deweloperskiego:

| Usługa | Konfiguracja | Szacowany koszt/miesiąc |
|--------|--------------|-------------------------|
| Azure AI Services | Warstwa S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokenów | $15-30 |
| OpenAI Embeddings | 50K tokenów | $5-15 |
| Application Insights | Podstawowe monitorowanie | $5-15 |
| Log Analytics | 1GB/miesiąc | $2-5 |
| **Razem** | | **$42-115** |

## 📚 Dodatkowe Zasoby

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Szczegółowy przewodnik wdrożenia z rozwiązywaniem problemów
- [Dokumentacja szablonów ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Dokumentacja Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Wyniki walidacji plików

## 🆘 Szybkie Rozwiązywanie Problemów

### Typowe Problemy
- **Autoryzacja**: Uruchom `az login`, aby się uwierzytelnić
- **Limity Kwot**: Sprawdź dostępność modelu OpenAI w docelowym regionie
- **Konflikty Nazw**: Użyj innego parametru `uniqueSuffix`
- **Uprawnienia**: Upewnij się, że konto ma rolę Współautora w subskrypcji

### Uzyskaj Pomoc
- Zobacz [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) w celu szczegółowego rozwiązywania problemów
- Sprawdź logi wdrożenia w Portalu Azure
- Odwiedź [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Aby uzyskać pełną konfigurację projektu, zobacz [główny README](../../README.md) lub [przewodnik po projekcie](../../walkthrough/README.md).

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczeniowej AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.