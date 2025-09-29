<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "97010eabfa337292929c7113924b0bd6",
  "translation_date": "2025-09-29T18:12:24+00:00",
  "source_file": "walkthrough/README.md",
  "language_code": "pl"
}
-->
# 🚀 MCP Server z PostgreSQL - Kompletny Przewodnik Edukacyjny

## 🧠 Przegląd Ścieżki Nauki Integracji Bazy Danych MCP

Ten kompleksowy przewodnik edukacyjny nauczy Cię, jak budować gotowe do produkcji **serwery Model Context Protocol (MCP)**, które integrują się z bazami danych poprzez praktyczną implementację analityki detalicznej. Poznasz wzorce na poziomie korporacyjnym, takie jak **Row Level Security (RLS)**, **wyszukiwanie semantyczne**, **integracja z Azure AI** oraz **dostęp do danych dla wielu najemców**.

Niezależnie od tego, czy jesteś programistą backendowym, inżynierem AI czy architektem danych, ten przewodnik oferuje uporządkowaną naukę z przykładami z życia wziętymi i ćwiczeniami praktycznymi.

## 🔗 Oficjalne Zasoby MCP

- 📘 [Dokumentacja MCP](https://modelcontextprotocol.io/) – Szczegółowe samouczki i przewodniki użytkownika
- 📜 [Specyfikacja MCP](https://modelcontextprotocol.io/docs/) – Architektura protokołu i odniesienia techniczne
- 🧑‍💻 [Repozytorium MCP na GitHub](https://github.com/modelcontextprotocol) – Open-source SDK, narzędzia i przykłady kodu
- 🌐 [Społeczność MCP](https://github.com/orgs/modelcontextprotocol/discussions) – Dołącz do dyskusji i wnieś swój wkład
- 📚 [MCP dla Początkujących](https://aka.ms/mcp-for-beginners) – Zacznij tutaj, jeśli jesteś nowy w MCP

## 🧭 Ścieżka Nauki Integracji Bazy Danych MCP

### 📚 Kompletny Plan Nauki

| Moduł | Temat | Opis | Link |
|-------|-------|------|------|
| **Moduły 1-3: Podstawy** | | | |
| 00 | [Wprowadzenie do Integracji Bazy Danych MCP](./00-Introduction/README.md) | Przegląd MCP z integracją bazy danych i przypadkiem użycia analityki detalicznej | [Rozpocznij tutaj](./00-Introduction/README.md) |
| 01 | [Podstawowe Koncepcje Architektury](./01-Architecture/README.md) | Zrozumienie architektury serwera MCP, warstw bazy danych i wzorców bezpieczeństwa | [Dowiedz się więcej](./01-Architecture/README.md) |
| 02 | [Bezpieczeństwo i Wielu Najemców](./02-Security/README.md) | Row Level Security, uwierzytelnianie i dostęp do danych dla wielu najemców | [Dowiedz się więcej](./02-Security/README.md) |
| 03 | [Konfiguracja Środowiska](./03-Setup/README.md) | Konfiguracja środowiska deweloperskiego, Docker, zasoby Azure | [Konfiguruj](./03-Setup/README.md) |
| **Moduły 4-6: Budowanie Serwera MCP** | | | |
| 04 | [Projektowanie Bazy Danych i Schemat](./04-Database/README.md) | Konfiguracja PostgreSQL, projektowanie schematu detalicznego i dane przykładowe | [Buduj](./04-Database/README.md) |
| 05 | [Implementacja Serwera MCP](./05-MCP-Server/README.md) | Budowanie serwera FastMCP z integracją bazy danych | [Buduj](./05-MCP-Server/README.md) |
| 06 | [Rozwój Narzędzi](./06-Tools/README.md) | Tworzenie narzędzi zapytań do bazy danych i introspekcji schematu | [Buduj](./06-Tools/README.md) |
| **Moduły 7-9: Zaawansowane Funkcje** | | | |
| 07 | [Integracja Wyszukiwania Semantycznego](./07-Semantic-Search/README.md) | Implementacja osadzania wektorów z Azure OpenAI i pgvector | [Rozwijaj](./07-Semantic-Search/README.md) |
| 08 | [Testowanie i Debugowanie](./08-Testing/README.md) | Strategie testowania, narzędzia debugowania i podejścia do walidacji | [Testuj](./08-Testing/README.md) |
| 09 | [Integracja z VS Code](./09-VS-Code/README.md) | Konfiguracja integracji MCP z VS Code i użycie AI Chat | [Integruj](./09-VS-Code/README.md) |
| **Moduły 10-12: Produkcja i Najlepsze Praktyki** | | | |
| 10 | [Strategie Wdrażania](./10-Deployment/README.md) | Wdrażanie za pomocą Dockera, Azure Container Apps i rozważania dotyczące skalowania | [Wdrażaj](./10-Deployment/README.md) |
| 11 | [Monitorowanie i Obserwowalność](./11-Monitoring/README.md) | Application Insights, logowanie, monitorowanie wydajności | [Monitoruj](./11-Monitoring/README.md) |
| 12 | [Najlepsze Praktyki i Optymalizacja](./12-Best-Practices/README.md) | Optymalizacja wydajności, wzmacnianie bezpieczeństwa i wskazówki produkcyjne | [Optymalizuj](./12-Best-Practices/README.md) |

### 💻 Co Zbudujesz

Na końcu tej ścieżki nauki zbudujesz kompletny **Serwer MCP Zava Retail Analytics**, który będzie zawierał:

- **Wielotabelową bazę danych detaliczną** z zamówieniami klientów, produktami i zapasami
- **Row Level Security** dla izolacji danych na poziomie sklepu
- **Semantyczne wyszukiwanie produktów** z użyciem osadzeń Azure OpenAI
- **Integrację AI Chat w VS Code** dla zapytań w języku naturalnym
- **Gotowe do produkcji wdrożenie** z Dockerem i Azure
- **Kompleksowe monitorowanie** z Application Insights

## 🎯 Wymagania Wstępne

Aby w pełni skorzystać z tej ścieżki nauki, powinieneś posiadać:

- **Doświadczenie w programowaniu**: Znajomość Pythona (preferowane) lub podobnych języków
- **Wiedzę o bazach danych**: Podstawowe zrozumienie SQL i relacyjnych baz danych
- **Koncepcje API**: Zrozumienie REST API i koncepcji HTTP
- **Narzędzia deweloperskie**: Doświadczenie z wierszem poleceń, Git i edytorami kodu
- **Podstawy chmury**: (Opcjonalnie) Podstawowa wiedza o Azure lub podobnych platformach chmurowych
- **Znajomość Dockera**: (Opcjonalnie) Zrozumienie koncepcji konteneryzacji

### Wymagane Narzędzia

- **Docker Desktop** - Do uruchamiania PostgreSQL i serwera MCP
- **Azure CLI** - Do wdrażania zasobów w chmurze
- **VS Code** - Do rozwoju i integracji MCP
- **Git** - Do kontroli wersji
- **Python 3.8+** - Do rozwoju serwera MCP

## 📚 Przewodnik Edukacyjny i Zasoby

Ta ścieżka nauki zawiera kompleksowe zasoby, które pomogą Ci efektywnie się uczyć:

### Przewodnik Edukacyjny

Każdy moduł zawiera:
- **Jasne cele nauki** - Co osiągniesz
- **Instrukcje krok po kroku** - Szczegółowe przewodniki implementacji
- **Przykłady kodu** - Działające próbki z wyjaśnieniami
- **Ćwiczenia** - Możliwości praktyki
- **Przewodniki rozwiązywania problemów** - Typowe problemy i rozwiązania
- **Dodatkowe zasoby** - Dalsza lektura i eksploracja

### Sprawdzenie Wymagań Wstępnych

Przed rozpoczęciem każdego modułu znajdziesz:
- **Wymaganą wiedzę** - Co powinieneś wiedzieć wcześniej
- **Walidację konfiguracji** - Jak zweryfikować swoje środowisko
- **Szacowany czas** - Oczekiwany czas ukończenia
- **Efekty nauki** - Co będziesz wiedział po ukończeniu

### Rekomendowane Ścieżki Nauki

Wybierz swoją ścieżkę w zależności od poziomu doświadczenia:

#### 🟢 **Ścieżka dla Początkujących** (Nowi w MCP)
1. Zacznij od [MCP dla Początkujących](https://aka.ms/mcp-for-beginners)
2. Ukończ moduły 00-03, aby zrozumieć podstawy
3. Przejdź przez moduły 04-06, aby zdobyć praktyczne umiejętności
4. Wypróbuj moduły 07-09 dla praktycznego zastosowania

#### 🟡 **Ścieżka Średniozaawansowana** (Nieco doświadczenia z MCP)
1. Przejrzyj moduły 00-01 dla koncepcji specyficznych dla bazy danych
2. Skup się na modułach 02-06 dla implementacji
3. Zgłęb moduły 07-12 dla zaawansowanych funkcji

#### 🔴 **Ścieżka Zaawansowana** (Doświadczeni w MCP)
1. Przejrzyj moduły 00-03 dla kontekstu
2. Skup się na modułach 04-09 dla integracji bazy danych
3. Skoncentruj się na modułach 10-12 dla wdrożenia produkcyjnego

## 🛠️ Jak Efektywnie Korzystać z Tej Ścieżki Nauki

### Nauka Sekwencyjna (Rekomendowana)

Pracuj przez moduły w kolejności dla kompleksowego zrozumienia:

1. **Przeczytaj przegląd** - Zrozum, czego się nauczysz
2. **Sprawdź wymagania wstępne** - Upewnij się, że masz wymaganą wiedzę
3. **Postępuj zgodnie z przewodnikami krok po kroku** - Implementuj podczas nauki
4. **Ukończ ćwiczenia** - Wzmocnij swoje zrozumienie
5. **Przejrzyj kluczowe wnioski** - Utrwal efekty nauki

### Nauka Ukierunkowana

Jeśli potrzebujesz konkretnych umiejętności:

- **Integracja Bazy Danych**: Skup się na modułach 04-06
- **Implementacja Bezpieczeństwa**: Skoncentruj się na modułach 02, 08, 12
- **AI/Wyszukiwanie Semantyczne**: Zgłęb moduł 07
- **Wdrożenie Produkcyjne**: Przestudiuj moduły 10-12

### Praktyka Hands-on

Każdy moduł zawiera:
- **Działające przykłady kodu** - Kopiuj, modyfikuj i eksperymentuj
- **Scenariusze z życia wzięte** - Praktyczne przypadki użycia analityki detalicznej
- **Stopniową złożoność** - Budowanie od prostych do zaawansowanych
- **Kroki walidacji** - Zweryfikuj, czy Twoja implementacja działa

## 🌟 Społeczność i Wsparcie

### Uzyskaj Pomoc

- **Discord Azure AI**: [Dołącz, aby uzyskać wsparcie ekspertów](https://discord.com/invite/ByRwuEEgH4)
- **Problemy na GitHub**: [Zgłaszaj problemy lub zadawaj pytania](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
- **Społeczność MCP**: [Dołącz do szerszych dyskusji MCP](https://github.com/orgs/modelcontextprotocol/discussions)

### Wnieś Wkład

Zapraszamy do współtworzenia tej ścieżki nauki:
- **Popraw błędy lub literówki** - Przesyłaj pull requesty
- **Dodaj przykłady** - Podziel się swoimi implementacjami
- **Popraw dokumentację** - Pomóż innym się uczyć
- **Zgłaszaj problemy** - Pomóż nam rozwiązywać problemy

## 📜 Informacje o Licencji

Treści edukacyjne są licencjonowane na podstawie licencji MIT. Zobacz plik [LICENSE](../../../LICENSE) dla warunków i zasad.

## 🚀 Gotowy, aby Zacząć?

Rozpocznij swoją podróż od **[Modułu 00: Wprowadzenie do Integracji Bazy Danych MCP](./00-Introduction/README.md)**

---

*Opanuj budowanie gotowych do produkcji serwerów MCP z integracją bazy danych dzięki tej kompleksowej, praktycznej ścieżce nauki.*

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.