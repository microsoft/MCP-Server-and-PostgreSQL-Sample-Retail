<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:09:32+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "pl"
}
-->
# Instrukcje wdrożenia szablonu ARM

Ten dokument zawiera instrukcje dotyczące wdrożenia infrastruktury MCP Retail Analytics za pomocą szablonu ARM.

## 📋 Przegląd

Szablon ARM `azuredeploy.json` umożliwia pełne wdrożenie:
- Grupy zasobów Azure
- Log Analytics Workspace  
- Application Insights
- Usług Azure AI (Foundry)
- Wdrożeń modeli OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opcje wdrożenia

### Opcja 1: Wdrożenie za pomocą Azure CLI

```bash
# Set variables
LOCATION="westus2"
RESOURCE_PREFIX="mcpretail"
UNIQUE_SUFFIX="demo"

# Deploy at subscription level
az deployment sub create \
  --location $LOCATION \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=$RESOURCE_PREFIX uniqueSuffix=$UNIQUE_SUFFIX
```

### Opcja 2: Wdrożenie za pomocą PowerShell

```powershell
# Set variables
$Location = "westus2"
$ResourcePrefix = "mcpretail"
$UniqueSuffix = "demo"

# Deploy at subscription level
New-AzSubscriptionDeployment `
  -Location $Location `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix $ResourcePrefix `
  -uniqueSuffix $UniqueSuffix
```

### Opcja 3: Portal Azure

1. Przejdź do [Portalu Azure](https://portal.azure.com)
2. Wyszukaj "Deploy a custom template"
3. Kliknij "Build your own template in the editor"
4. Skopiuj i wklej zawartość pliku `azuredeploy.json`
5. Kliknij "Save", a następnie "Review + create"
6. Wypełnij wymagane parametry i wdroż

## 🔧 Parametry szablonu

| Parametr | Typ | Domyślny | Opis |
|----------|-----|----------|------|
| `resourcePrefix` | string | `mcpretail` | Prefiks nazw zasobów |
| `location` | string | `westus2` | Region Azure dla wdrożenia |
| `uniqueSuffix` | string | Automatycznie generowany | 4-znakowy unikalny identyfikator |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Wyświetlana nazwa projektu AI |
| `aiProjectDescription` | string | Opis projektu | Opis widoczny w Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Pojemność tokenów dla modelu GPT |
| `embeddingModelCapacity` | int | `50` | Pojemność tokenów dla modelu embedding |
| `tags` | object | Domyślne tagi | Tagi zasobów dla zarządzania |

## 📤 Wyniki szablonu

Szablon generuje następujące wyniki:

| Wynik | Opis |
|-------|------|
| `subscriptionId` | ID subskrypcji Azure |
| `resourceGroupName` | Nazwa utworzonej grupy zasobów |
| `aiFoundryName` | Nazwa usługi Azure AI Foundry |
| `foundryEndpoint` | URL punktu końcowego usługi AI |
| `foundryAccountKey` | Klucz dostępu do usługi AI |
| `deployedModels` | Tablica wdrożonych modeli OpenAI |
| `applicationInsightsConnectionString` | Connection string dla Application Insights |
| `logAnalyticsWorkspaceName` | Nazwa Log Analytics Workspace |

## 🔍 Polecenia weryfikacyjne

Po wdrożeniu zweryfikuj zasoby:

```bash
# List resources in the created resource group
az resource list --resource-group rg-mcpretail-demo --output table

# Check AI service status
az cognitiveservices account show \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo

# List deployed models
az cognitiveservices account deployment list \
  --name fdy-mcpretail-demo \
  --resource-group rg-mcpretail-demo
```

## 🆚 ARM vs Bicep

Ten projekt oferuje zarówno szablony ARM, jak i Bicep:

### Szablon ARM (`azuredeploy.json`)
- ✅ Natywny format Azure Resource Manager
- ✅ Działa wszędzie tam, gdzie obsługiwany jest ARM
- ✅ Nie wymaga dodatkowych narzędzi
- ❌ Bardziej rozbudowana składnia JSON
- ❌ Trudniejszy w odczycie i utrzymaniu

### Szablon Bicep (`main.bicep`)
- ✅ Nowoczesna, przejrzysta składnia
- ✅ Lepsze narzędzia i IntelliSense
- ✅ Łatwiejszy w odczycie i utrzymaniu
- ✅ Walidacja podczas kompilacji
- ❌ Wymaga Bicep CLI
- ❌ Dodatkowy krok kompilacji

**Rekomendacja**: Używaj szablonów Bicep (`main.bicep`) podczas rozwoju, a szablonu ARM (`azuredeploy.json`) w scenariuszach wymagających czystego JSON ARM.

## 🔧 Dostosowanie

### Dodawanie własnych zasobów

Aby dodać dodatkowe zasoby do szablonu ARM:

1. Dodaj definicję zasobu do tablicy `resources` w zagnieżdżonym szablonie
2. Dodaj nowe parametry do sekcji `parameters`
3. Dodaj odpowiednie wyniki, jeśli są potrzebne
4. Zaktualizuj plik parametrów o wartości domyślne

### Przykład: Dodanie konta Storage

```json
{
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2023-01-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": {
    "name": "Standard_LRS"
  },
  "kind": "StorageV2",
  "properties": {
    "accessTier": "Hot"
  },
  "tags": "[parameters('tags')]"
}
```

## 🐛 Rozwiązywanie problemów

### Typowe problemy

#### 1. Błędy walidacji szablonu
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Konflikty nazw zasobów
- Upewnij się, że `uniqueSuffix` jest rzeczywiście unikalny
- Użyj funkcji `uniqueString()` do automatycznego generowania
- Sprawdź istniejące zasoby w docelowym regionie

#### 3. Limity kwot
- Zweryfikuj dostępność modelu OpenAI w docelowym regionie
- Sprawdź limity subskrypcji dla usług AI
- Rozważ użycie innych regionów, jeśli limity zostały osiągnięte

#### 4. Problemy z uprawnieniami
- Upewnij się, że konto ma rolę Contributor w subskrypcji
- Sprawdź, czy subskrypcja jest włączona dla usług AI
- Zweryfikuj rejestracje dostawców zasobów

### Polecenia debugowania

```bash
# Check deployment status
az deployment sub show \
  --name <deployment-name> \
  --query "properties.provisioningState"

# View deployment details
az deployment sub list --output table

# Check activity logs
az monitor activity-log list \
  --resource-group rg-mcpretail-demo \
  --max-events 50
```

## 🔐 Rozważania dotyczące bezpieczeństwa

### Kontrola dostępu
- Usługa AI używa zarządzanej tożsamości dla bezpiecznego dostępu
- Grupa zasobów zapewnia granicę dla RBAC
- Application Insights ma oddzielne mechanizmy kontroli dostępu

### Bezpieczeństwo sieci
- Dostęp do sieci publicznej jest domyślnie włączony
- Rozważ użycie prywatnych punktów końcowych w środowisku produkcyjnym
- ACL sieciowe mogą być skonfigurowane dla dodatkowego bezpieczeństwa

### Zarządzanie kluczami
- Klucze usługi AI są generowane automatycznie
- Używaj Azure Key Vault dla tajemnic w środowisku produkcyjnym
- Regularnie rotuj klucze dla bezpieczeństwa

## 📚 Kolejne kroki

Po pomyślnym wdrożeniu:

1. **Skonfiguruj zmienne środowiskowe**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Uruchom serwer MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Przetestuj integrację**:
   - Otwórz VS Code z projektem
   - Skonfiguruj serwery MCP w `.vscode/mcp.json`
   - Przetestuj AI Chat za pomocą zapytań o dane detaliczne

4. **Monitoruj wydajność**:
   - Przeglądaj metryki w Application Insights
   - Sprawdzaj logi w Log Analytics Workspace
   - Ustaw alerty dla ważnych zdarzeń

---

Więcej informacji znajdziesz w [głównym README](../README.md) lub [przewodniku QUICKSTART](../QUICKSTART.md).

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.