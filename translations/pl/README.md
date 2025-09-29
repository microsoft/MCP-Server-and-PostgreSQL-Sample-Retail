<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fa4d35e300f7fa5c533131b9eab27e1b",
  "translation_date": "2025-09-29T18:05:52+00:00",
  "source_file": "README.md",
  "language_code": "pl"
}
-->
# MCP Server i PostgreSQL - Przykład Analizy Sprzedaży Detalicznej

## Nauka MCP z integracją baz danych poprzez praktyczne przykłady

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Dołącz do Discorda Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Postępuj zgodnie z poniższymi krokami, aby rozpocząć korzystanie z tych zasobów:

1. **Forkuj repozytorium**: Kliknij [tutaj, aby forknąć](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Sklonuj repozytorium**: `git clone https://github.com/TWOJA-NAZWA-UŻYTKOWNIKA/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Dołącz do Discorda Azure AI Foundry**: [Spotkaj się z ekspertami i innymi programistami](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Obsługa wielu języków

#### Obsługiwane przez GitHub Action (Automatyczne i zawsze aktualne)

[Francuski](../fr/README.md) | [Hiszpański](../es/README.md) | [Niemiecki](../de/README.md) | [Rosyjski](../ru/README.md) | [Arabski](../ar/README.md) | [Perski (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chiński (uproszczony)](../zh/README.md) | [Chiński (tradycyjny, Makau)](../mo/README.md) | [Chiński (tradycyjny, Hongkong)](../hk/README.md) | [Chiński (tradycyjny, Tajwan)](../tw/README.md) | [Japoński](../ja/README.md) | [Koreański](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalski](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Portugalski (Portugalia)](../pt/README.md) | [Portugalski (Brazylia)](../br/README.md) | [Włoski](../it/README.md) | [Polski](./README.md) | [Turecki](../tr/README.md) | [Grecki](../el/README.md) | [Tajski](../th/README.md) | [Szwedzki](../sv/README.md) | [Duński](../da/README.md) | [Norweski](../no/README.md) | [Fiński](../fi/README.md) | [Holenderski](../nl/README.md) | [Hebrajski](../he/README.md) | [Wietnamski](../vi/README.md) | [Indonezyjski](../id/README.md) | [Malajski](../ms/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Suahili](../sw/README.md) | [Węgierski](../hu/README.md) | [Czeski](../cs/README.md) | [Słowacki](../sk/README.md) | [Rumuński](../ro/README.md) | [Bułgarski](../bg/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Chorwacki](../hr/README.md) | [Słoweński](../sl/README.md) | [Ukraiński](../uk/README.md) | [Birmański (Myanmar)](../my/README.md)

**Jeśli chcesz, aby obsługiwane były dodatkowe języki, lista dostępnych języków znajduje się [tutaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Wprowadzenie

Ten przykład pokazuje, jak zbudować i wdrożyć kompleksowy **serwer Model Context Protocol (MCP)**, który umożliwia asystentom AI bezpieczny i inteligentny dostęp do danych sprzedaży detalicznej za pomocą PostgreSQL. Projekt prezentuje funkcje na poziomie przedsiębiorstwa, takie jak **Row Level Security (RLS)**, **wyszukiwanie semantyczne** oraz **integracja z Azure AI** w scenariuszach analizy sprzedaży detalicznej.

**Kluczowe zastosowania:**
- **Analiza sprzedaży wspierana przez AI**: Umożliwienie asystentom AI zapytań i analizy danych sprzedaży detalicznej za pomocą języka naturalnego
- **Bezpieczny dostęp dla wielu najemców**: Implementacja Row Level Security, gdzie różni kierownicy sklepów mają dostęp tylko do danych swojego sklepu
- **Semantyczne wyszukiwanie produktów**: Prezentacja wyszukiwania produktów wspieranego przez AI za pomocą osadzania tekstu
- **Integracja na poziomie przedsiębiorstwa**: Pokazanie, jak zintegrować serwery MCP z usługami Azure i bazami danych PostgreSQL

**Idealne dla:**
- Programistów uczących się budowy serwerów MCP z integracją baz danych
- Inżynierów danych wdrażających bezpieczne rozwiązania analityczne dla wielu najemców
- Twórców aplikacji AI pracujących z danymi detalicznymi lub e-commerce
- Każdego, kto interesuje się łączeniem asystentów AI z bazami danych na poziomie przedsiębiorstwa

## Dołącz do społeczności Discord Azure AI Foundry
Podziel się swoimi doświadczeniami z MCP i spotkaj się z ekspertami oraz zespołami produktowymi

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)

# Serwer MCP do analizy sprzedaży

Serwer Model Context Protocol (MCP), który zapewnia kompleksowy dostęp do bazy danych sprzedaży klientów dla Zava Retail DIY Business. Ten serwer umożliwia asystentom AI zapytania i analizę danych sprzedaży detalicznej poprzez bezpieczny, świadomy schematu interfejs.

## 📚 Kompletny przewodnik wdrożeniowy

Aby uzyskać szczegółowy opis, jak zbudować to rozwiązanie i wdrożyć podobne serwery MCP, zobacz nasz kompleksowy **[Przewodnik po przykładzie](Sample_Walkthrough.md)**. Ten przewodnik zawiera:

- **Dogłębna analiza architektury**: Analiza komponentów i wzorców projektowych
- **Budowa krok po kroku**: Od konfiguracji projektu po wdrożenie
- **Rozbiórka kodu**: Szczegółowe wyjaśnienie implementacji serwera MCP
- **Zaawansowane funkcje**: Row Level Security, wyszukiwanie semantyczne i monitorowanie
- **Najlepsze praktyki**: Wytyczne dotyczące bezpieczeństwa, wydajności i rozwoju
- **Rozwiązywanie problemów**: Typowe problemy i ich rozwiązania

Idealne dla programistów, którzy chcą zrozumieć szczegóły implementacji i budować podobne rozwiązania.

## 🤖 Co to jest MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** to otwarty standard, który umożliwia asystentom AI bezpieczny dostęp do zewnętrznych źródeł danych i narzędzi w czasie rzeczywistym. Można go traktować jako most, który pozwala modelom AI łączyć się z bazami danych, API, systemami plików i innymi zasobami, zachowując jednocześnie bezpieczeństwo i kontrolę.

### Kluczowe korzyści:
- **Dostęp do danych w czasie rzeczywistym**: Asystenci AI mogą zapytania do baz danych i API na żywo
- **Bezpieczna integracja**: Kontrolowany dostęp z uwierzytelnianiem i uprawnieniami  
- **Rozszerzalność narzędzi**: Dodawanie niestandardowych funkcji do asystentów AI
- **Standaryzowany protokół**: Działa na różnych platformach i narzędziach AI

### Nowy w MCP?

Jeśli dopiero zaczynasz przygodę z Model Context Protocol, zalecamy rozpoczęcie od kompleksowych zasobów dla początkujących od Microsoftu:

**📖 [Przewodnik MCP dla początkujących](https://aka.ms/mcp-for-beginners)**

Ten zasób oferuje:
- Wprowadzenie do koncepcji i architektury MCP
- Samouczki krok po kroku dotyczące budowy pierwszego serwera MCP
- Najlepsze praktyki w rozwoju MCP
- Przykłady integracji z popularnymi platformami AI
- Zasoby społecznościowe i wsparcie

Po opanowaniu podstaw, wróć tutaj, aby zgłębić zaawansowaną implementację analizy sprzedaży detalicznej!

## 📚 Kompletny przewodnik edukacyjny: /walkthrough

To repozytorium zawiera kompletny **12-modułowy przewodnik edukacyjny**, który rozkłada ten przykład serwera MCP dla sprzedaży detalicznej na przystępne, krok po kroku lekcje. Przewodnik przekształca ten działający przykład w kompleksowy zasób edukacyjny, idealny dla programistów, którzy chcą zrozumieć, jak budować gotowe do produkcji serwery MCP z integracją baz danych.

### Czego się nauczysz

Przewodnik obejmuje wszystko, od podstawowych koncepcji MCP po zaawansowane wdrożenie produkcyjne, w tym:

- **Podstawy MCP**: Zrozumienie Model Context Protocol i jego zastosowań w rzeczywistości
- **Integracja baz danych**: Implementacja bezpiecznego połączenia PostgreSQL z Row Level Security
- **Funkcje wspierane przez AI**: Dodawanie możliwości wyszukiwania semantycznego za pomocą osadzania Azure OpenAI
- **Implementacja bezpieczeństwa**: Uwierzytelnianie na poziomie przedsiębiorstwa, autoryzacja i izolacja danych
- **Rozwój narzędzi**: Tworzenie zaawansowanych narzędzi MCP do analizy danych i inteligencji biznesowej
- **Testowanie i debugowanie**: Kompleksowe strategie testowania i techniki debugowania
- **Integracja z VS Code**: Konfiguracja AI Chat do zapytań do bazy danych w języku naturalnym
- **Wdrożenie produkcyjne**: Konteneryzacja, skalowanie i strategie wdrożenia w chmurze
- **Monitorowanie i obserwowalność**: Application Insights, logowanie i monitorowanie wydajności

### Przegląd ścieżki edukacyjnej

Przewodnik podąża za progresywną strukturą edukacyjną zaprojektowaną dla programistów o różnym poziomie umiejętności:

| Moduł | Obszar tematyczny | Opis | Szacowany czas |
|-------|-------------------|------|----------------|
| **[00-Wprowadzenie](walkthrough/00-Introduction/README.md)** | Podstawy | Koncepcje MCP, studium przypadku Zava Retail, przegląd architektury | 30 minut |
| **[01-Architektura](walkthrough/01-Architecture/README.md)** | Wzorce projektowe | Architektura techniczna, projekt warstwowy, komponenty systemu | 45 minut |
| **[02-Bezpieczeństwo](walkthrough/02-Security/README.md)** | Bezpieczeństwo przedsiębiorstwa | Uwierzytelnianie Azure, Row Level Security, izolacja dla wielu najemców | 60 minut |
| **[03-Konfiguracja](walkthrough/03-Setup/README.md)** | Środowisko | Konfiguracja Dockera, Azure CLI, konfiguracja projektu, walidacja | 45 minut |
| **[04-Baza danych](walkthrough/04-Database/README.md)** | Warstwa danych | Schemat PostgreSQL, pgvector, polityki RLS, dane przykładowe | 60 minut |
| **[05-Serwer MCP](walkthrough/05-MCP-Server/README.md)** | Implementacja rdzenia | Framework FastMCP, integracja z bazą danych, zarządzanie połączeniami | 90 minut |
| **[06-Narzędzia](walkthrough/06-Tools/README.md)** | Rozwój narzędzi | Tworzenie narzędzi MCP, walidacja zapytań, funkcje inteligencji biznesowej | 75 minut |
| **[07-Wyszukiwanie semantyczne](walkthrough/07-Semantic-Search/README.md)** | Integracja AI | Osadzanie Azure OpenAI, wyszukiwanie wektorowe, strategie wyszukiwania hybrydowego | 60 minut |
| **[08-Testowanie](walkthrough/08-Testing/README.md)** | Zapewnienie jakości | Testy jednostkowe, testy integracyjne, testy wydajności, debugowanie | 75 minut |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Doświadczenie programistyczne | Konfiguracja VS Code, integracja AI Chat, przepływy debugowania | 45 minut |
| **[10-Wdrożenie](walkthrough/10-Deployment/README.md)** | Gotowość produkcyjna | Konteneryzacja, Azure Container Apps, pipeline CI/CD, skalowanie | 90 minut |
| **[11-Monitorowanie](walkthrough/11-Monitoring/README.md)** | Obserwowalność | Application Insights, logowanie strukturalne, metryki wydajności | 60 minut |
| **[12-Najlepsze praktyki](walkthrough/12-Best-Practices/README.md)** | Doskonałość produkcyjna | Wzmocnienie bezpieczeństwa, optymalizacja wydajności, wzorce przedsiębiorstwa | 45 minut |

**Całkowity czas nauki**: ~12-15 godzin kompleksowej nauki praktycznej

### 🎯 Jak korzystać z przewodnika

**Dla początkujących**:
1. Zacznij od [Modułu 00: Wprowadzenie](walkthrough/00-Introduction/README.md), aby zrozumieć podstawy MCP
2. Postępuj zgodnie z modułami w kolejności, aby uzyskać pełne doświadczenie edukacyjne
3. Każdy moduł buduje na poprzednich koncepcjach i zawiera ćwiczenia praktyczne

**Dla doświadczonych programistów**:
1. Przejrzyj [Główny przegląd przewodnika](walkthrough/README.md), aby zapoznać się z podsumowaniem modułów
2. Przejdź do konkretnych modułów, które Cię interesują (np. Moduł 07 dotyczący integracji AI)
3. Używaj poszczególnych modułów jako materiału referencyjnego dla własnych projektów

**Dla wdrożenia produkcyjnego**:
1. Skup się na Modułach 02 (Bezpieczeństwo), 10 (Wdrożenie) i 11 (Monitorowanie)
2. Przejrzyj Moduł 12 (Najlepsze praktyki) dla wytycznych na poziomie przedsiębiorstwa
3. Używaj przykładów kodu jako gotowych szablonów produkcyjnych

### 🚀 Opcje szybkiego startu

**Opcja 1: Kompletny plan nauki** (zalecane dla początkujących)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opcja 2: Praktyczna implementacja** (rozpocznij od razu budowę)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opcja 3: Skupienie na produkcji** (wdrożenie na poziomie przedsiębiorstwa)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Wymagania wstępne do nauki

**Zalecane przygotowanie**:
- Podstawowa znajomość programowania w Pythonie
- Znajomość REST API i baz danych
- Ogólne zrozumienie koncepcji AI/ML
- Podstawowa wiedza o pracy z wierszem poleceń i Dockerem

**Nie wymagane (ale pomocne)**:
- Doświadczenie z MCP (omawiamy od podstaw)
- Znajomość chmury Azure (zapewniamy szczegółowe instrukcje)
- Zaawansowana wiedza o PostgreSQL (wyjaśniamy w razie potrzeby)

### 💡 Wskazówki do nauki

1. **Praktyczne podejście**: Każdy moduł zawiera przykłady kodu, które można uruchomić i modyfikować
2. **Stopniowa złożoność**: Koncepcje są budowane od prostych do zaawansowanych
3. **Kontekst rzeczywisty**: Wszystkie przykłady opierają się na realistycznych scenariuszach biznesowych w handlu detalicznym
4. **Gotowość produkcyjna**: Przykłady kodu są zaprojektowane do rzeczywistego użycia w produkcji
5. **Wsparcie społeczności**: Dołącz do naszej [społeczności na Discordzie](https://discord.com/invite/ByRwuEEgH4) w celu uzyskania pomocy i dyskusji

### 🔗 Powiązane zasoby

- **[MCP dla początkujących](https://aka.ms/mcp-for-beginners)**: Podstawowe materiały do nauki
- **[Przykładowy przegląd](Sample_Walkthrough.md)**: Ogólny przegląd techniczny
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Platforma chmurowa używana w przykładach
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework MCP w Pythonie

**Gotowy do rozpoczęcia nauki?** Zacznij od **[Modułu 00: Wprowadzenie](walkthrough/00-Introduction/README.md)** lub przejrzyj **[kompletny przegląd](walkthrough/README.md)**.

## Wymagania

1. Zainstalowany Docker Desktop
2. Zainstalowany Git
3. **Azure CLI**: Zainstaluj i uwierzytelnij się za pomocą Azure CLI
4. Dostęp do modelu OpenAI `text-embedding-3-small` oraz opcjonalnie modelu `gpt-4o-mini`.

## Rozpoczęcie pracy

Otwórz okno terminala i wykonaj następujące polecenia:

1. Uwierzytelnij się za pomocą Azure CLI

    ```bash
    az login
    ```

2. Sklonuj repozytorium

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Przejdź do katalogu projektu

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Wdrażanie zasobów Azure

Uruchom poniższe skrypty, aby zautomatyzować wdrażanie zasobów Azure potrzebnych do serwera MCP.

Skrypty wdrożeniowe automatycznie wdrożą model `text-embedding-3-small`. Podczas wdrażania będziesz mieć możliwość dodania modelu `gpt-4o-mini`. Zauważ, że `gpt-4o-mini` **nie jest wymagany** dla tego projektu i jest uwzględniony jedynie w celu potencjalnych przyszłych ulepszeń.

**Wybierz skrypt dla swojej platformy:**

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

## Uruchamianie serwera MCP

Najłatwiejszym sposobem uruchomienia pełnego stosu (PostgreSQL + serwer MCP) jest użycie Docker Compose:

### Uruchomienie stosu

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

## Użycie

Zakładamy, że będziesz korzystać z wbudowanego wsparcia serwera MCP w VS Code.

1. Otwórz projekt w VS Code. W terminalu uruchom:

    ```bash
    code .
    ```

2. Uruchom jeden lub więcej serwerów MCP, korzystając z konfiguracji w pliku `.vscode/mcp.json`. Plik zawiera cztery różne konfiguracje serwera, z których każda reprezentuje rolę kierownika sklepu:

   - Każda konfiguracja używa unikalnego identyfikatora użytkownika RLS (Row Level Security)
   - Te identyfikatory użytkowników symulują różne tożsamości kierowników sklepów uzyskujących dostęp do bazy danych
   - System RLS ogranicza dostęp do danych na podstawie przypisanego sklepu kierownika
   - Odzwierciedla to rzeczywiste scenariusze, w których kierownicy sklepów logują się za pomocą różnych kont Entra ID

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

### Otwórz AI Chat w VS Code

1. Otwórz tryb AI Chat w VS Code
2. Wpisz **#zava** i wybierz jeden z uruchomionych serwerów MCP
3. Zadawaj pytania dotyczące danych sprzedaży - Zobacz przykładowe zapytania poniżej

### Przykładowe zapytania

1. Pokaż 20 najlepszych produktów według przychodów ze sprzedaży
1. Pokaż sprzedaż według sklepu
1. Jak wyglądała sprzedaż w ostatnim kwartale według kategorii?
1. Jakie produkty sprzedajemy, które są podobne do "pojemników na farbę"?

## Funkcje

- **Dostęp do schematów wielu tabel**: Pobieraj schematy dla wielu tabel bazy danych w jednym żądaniu
- **Bezpieczne wykonywanie zapytań**: Wykonuj zapytania PostgreSQL z obsługą Row Level Security (RLS)
- **Dane w czasie rzeczywistym**: Uzyskaj dostęp do aktualnych danych sprzedaży, zapasów i klientów
- **Narzędzia daty/czasu**: Pobierz aktualne znaczniki czasu UTC do analizy wrażliwej na czas
- **Elastyczne wdrożenie**: Obsługuje tryb serwera HTTP

## Obsługiwane tabele

Serwer zapewnia dostęp do następujących tabel bazy danych handlu detalicznego:

- `retail.customers` - Informacje o klientach i profile
- `retail.stores` - Lokalizacje sklepów i szczegóły
- `retail.categories` - Kategorie produktów i hierarchie
- `retail.product_types` - Klasyfikacje typów produktów
- `retail.products` - Katalog produktów i specyfikacje
- `retail.orders` - Zamówienia klientów i transakcje
- `retail.order_items` - Indywidualne pozycje w zamówieniach
- `retail.inventory` - Aktualne poziomy zapasów i dane magazynowe

## Dostępne narzędzia

### `get_multiple_table_schemas`

Pobierz schematy bazy danych dla wielu tabel w jednym żądaniu.

**Parametry:**

- `table_names` (list[str]): Lista prawidłowych nazw tabel z powyższych obsługiwanych tabel

**Zwraca:** Połączone ciągi schematów dla żądanych tabel

### `execute_sales_query`

Wykonaj zapytania PostgreSQL w bazie danych sprzedaży z obsługą Row Level Security.

**Parametry:**

- `postgresql_query` (str): Poprawnie sformułowane zapytanie PostgreSQL

**Zwraca:** Wyniki zapytania sformatowane jako ciąg znaków (ograniczone do 20 wierszy dla czytelności)

**Najlepsze praktyki:**

- Zawsze najpierw pobieraj schematy tabel
- Używaj dokładnych nazw kolumn ze schematów
- Łącz powiązane tabele dla kompleksowej analizy
- Agreguj wyniki, gdy to konieczne
- Ogranicz wyjście dla czytelności

### `get_current_utc_date`

Pobierz aktualną datę i czas UTC w formacie ISO.

**Zwraca:** Aktualna data/czas UTC w formacie ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Wykonaj semantyczne wyszukiwanie produktów na podstawie zapytań użytkownika.

**Zwraca:** Lista produktów pasujących do kryteriów wyszukiwania

**Parametry:**

- `query` (str): Ciąg zapytania wyszukiwania

**Zwraca:** Lista produktów pasujących do kryteriów wyszukiwania

## Funkcje bezpieczeństwa

### Row Level Security (RLS)

Serwer implementuje Row Level Security, aby zapewnić, że użytkownicy mają dostęp tylko do danych, do których są uprawnieni:

- **Tryb HTTP**: Używa nagłówka `x-rls-user-id` do identyfikacji użytkownika żądającego

- **Domyślne ustawienie**: Używa UUID zastępczego, gdy nie podano identyfikatora użytkownika

#### Unikalne identyfikatory użytkowników RLS dla sklepów

Każda lokalizacja sklepu Zava Retail ma unikalny identyfikator użytkownika RLS, który określa, do których danych użytkownik ma dostęp:

| Lokalizacja sklepu | Identyfikator użytkownika RLS | Opis |
|--------------------|-------------------------------|------|
| **Globalny dostęp** | `00000000-0000-0000-0000-000000000000` | Domyślne ustawienie - dostęp do wszystkich sklepów |
| **Seattle** | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Dane sklepu Zava Retail w Seattle |
| **Bellevue** | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Dane sklepu Zava Retail w Bellevue |
| **Tacoma** | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Dane sklepu Zava Retail w Tacoma |
| **Spokane** | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Dane sklepu Zava Retail w Spokane |
| **Everett** | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Dane sklepu Zava Retail w Everett |
| **Redmond** | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Dane sklepu Zava Retail w Redmond |
| **Kirkland** | `9c8b7a65-4321-fed0-9876-543210fedcba` | Dane sklepu Zava Retail w Kirkland |
| **Online** | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Dane sklepu Zava Retail online |

#### Implementacja RLS

Gdy użytkownik łączy się z identyfikatorem użytkownika RLS konkretnego sklepu, widzi tylko:

- Klientów powiązanych z tym sklepem
- Zamówienia złożone w tej lokalizacji sklepu
- Dane zapasów dla tego konkretnego sklepu
- Metryki sprzedaży i wydajności specyficzne dla sklepu

Zapewnia to izolację danych między różnymi lokalizacjami sklepów przy jednoczesnym utrzymaniu jednolitego schematu bazy danych.

## Architektura

### Kontekst aplikacji

Serwer używa zarządzanego kontekstu aplikacji z:

- **Pula połączeń z bazą danych**: Efektywne zarządzanie połączeniami w trybie HTTP
- **Zarządzanie cyklem życia**: Odpowiednie czyszczenie zasobów podczas zamykania
- **Bezpieczeństwo typów**: Silnie typowany kontekst z dataclass `AppContext`

### Kontekst żądania

- **Ekstrakcja nagłówków**: Bezpieczne parsowanie nagłówków w celu identyfikacji użytkownika
- **Integracja RLS**: Automatyczne rozwiązywanie identyfikatora użytkownika z kontekstu żądania
- **Obsługa błędów**: Kompleksowa obsługa błędów z przyjaznymi dla użytkownika komunikatami

## Integracja z bazą danych

Serwer integruje się z bazą danych PostgreSQL za pomocą klasy `PostgreSQLSchemaProvider`:

- **Pula połączeń**: Używa asynchronicznych pul połączeń dla skalowalności
- **Metadane schematu**: Zapewnia szczegółowe informacje o schemacie tabel
- **Wykonywanie zapytań**: Bezpieczne wykonywanie zapytań z obsługą RLS
- **Zarządzanie zasobami**: Automatyczne czyszczenie zasobów bazy danych

## Obsługa błędów

Serwer implementuje solidną obsługę błędów:

- **Walidacja tabel**: Zapewnia dostęp tylko do prawidłowych nazw tabel
- **Walidacja zapytań**: Waliduje zapytania PostgreSQL przed ich wykonaniem
- **Zarządzanie zasobami**: Odpowiednie czyszczenie nawet w przypadku błędów
- **Przyjazne komunikaty**: Jasne komunikaty o błędach ułatwiające rozwiązywanie problemów

## Rozważania dotyczące bezpieczeństwa

1. **Row Level Security**: Wszystkie zapytania respektują zasady RLS na podstawie tożsamości użytkownika
2. **Izolacja danych sklepu**: Identyfikator użytkownika RLS każdego sklepu zapewnia dostęp tylko do danych tego sklepu
3. **Walidacja wejścia**: Nazwy tabel i zapytania są walidowane przed wykonaniem
4. **Limity zasobów**: Wyniki zapytań są ograniczone, aby zapobiec nadmiernemu wykorzystaniu zasobów
5. **Bezpieczeństwo połączeń**: Używa bezpiecznych praktyk połączeń z bazą danych
6. **Weryfikacja tożsamości użytkownika**: Zawsze upewnij się, że używany jest poprawny identyfikator użytkownika RLS dla zamierzonej lokalizacji sklepu

### Ważne uwagi dotyczące bezpieczeństwa

- **Nigdy nie używaj identyfikatorów użytkowników RLS produkcyjnych w środowiskach deweloperskich**
- **Zawsze sprawdzaj, czy identyfikator użytkownika RLS odpowiada zamierzonemu sklepowi przed wykonaniem zapytań**
- **Domyślny UUID (`00000000-0000-0000-0000-000000000000`) zapewnia ograniczony dostęp**
- **Każdy kierownik sklepu powinien mieć dostęp tylko do identyfikatora użytkownika RLS swojego sklepu**

## Rozwój

### Struktura projektu

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Kluczowe komponenty

- **Serwer FastMCP**: Nowoczesna implementacja serwera MCP z obsługą asynchroniczną
- **Dostawca PostgreSQL**: Warstwa abstrakcji bazy danych z obsługą RLS
- **Zarządzanie kontekstem**: Bezpieczne typowo zarządzanie kontekstem aplikacji i żądań
- **Rejestracja narzędzi**: Deklaratywna rejestracja narzędzi z walidacją Pydantic

## Wkład w rozwój

Podczas wnoszenia wkładu do tego serwera:

1. Upewnij się, że wszystkie zapytania do bazy danych respektują Row Level Security
2. Dodaj odpowiednią obsługę błędów dla nowych narzędzi
3. Zaktualizuj ten README o nowe funkcje lub zmiany
4. Przetestuj tryb serwera HTTP
5. Waliduj parametry wejściowe i zapewnij jasne komunikaty o błędach

## [Licencja](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ten serwer MCP umożliwia bezpieczny i efektywny dostęp do danych sprzedaży Zava Retail w celu analizy i wniosków wspieranych przez AI.*

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.