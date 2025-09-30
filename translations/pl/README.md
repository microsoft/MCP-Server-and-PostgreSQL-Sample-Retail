<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:45:05+00:00",
  "source_file": "README.md",
  "language_code": "pl"
}
-->
# Przykład MCP Server i PostgreSQL - Analiza Sprzedaży Detalicznej

## Nauka MCP z integracją bazy danych poprzez praktyczne przykłady

[![GitHub contributors](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Dołącz do Azure AI Foundry Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Wykonaj poniższe kroki, aby rozpocząć korzystanie z tych zasobów:

1. **Sforkuj repozytorium**: Kliknij [tutaj, aby sforkować](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Sklonuj repozytorium**: `git clone https://github.com/TWOJA-NAZWA-UŻYTKOWNIKA/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Dołącz do Azure AI Foundry Discord**: [Poznaj ekspertów i innych programistów](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Obsługa wielu języków

#### Obsługiwane przez GitHub Action (Automatyczne i zawsze aktualne)

[Francuski](../fr/README.md) | [Hiszpański](../es/README.md) | [Niemiecki](../de/README.md) | [Rosyjski](../ru/README.md) | [Arabski](../ar/README.md) | [Perski (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chiński (uproszczony)](../zh/README.md) | [Chiński (tradycyjny, Makau)](../mo/README.md) | [Chiński (tradycyjny, Hongkong)](../hk/README.md) | [Chiński (tradycyjny, Tajwan)](../tw/README.md) | [Japoński](../ja/README.md) | [Koreański](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalski](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalski](../ne/README.md) | [Pendżabski (Gurmukhi)](../pa/README.md) | [Portugalski (Portugalia)](../pt/README.md) | [Portugalski (Brazylia)](../br/README.md) | [Włoski](../it/README.md) | [Polski](./README.md) | [Turecki](../tr/README.md) | [Grecki](../el/README.md) | [Tajski](../th/README.md) | [Szwedzki](../sv/README.md) | [Duński](../da/README.md) | [Norweski](../no/README.md) | [Fiński](../fi/README.md) | [Holenderski](../nl/README.md) | [Hebrajski](../he/README.md) | [Wietnamski](../vi/README.md) | [Indonezyjski](../id/README.md) | [Malajski](../ms/README.md) | [Tagalog (Filipiński)](../tl/README.md) | [Suahili](../sw/README.md) | [Węgierski](../hu/README.md) | [Czeski](../cs/README.md) | [Słowacki](../sk/README.md) | [Rumuński](../ro/README.md) | [Bułgarski](../bg/README.md) | [Serbski (cyrylica)](../sr/README.md) | [Chorwacki](../hr/README.md) | [Słoweński](../sl/README.md) | [Ukraiński](../uk/README.md) | [Birmański (Myanmar)](../my/README.md)

**Jeśli chcesz dodać dodatkowe tłumaczenia, obsługiwane języki są wymienione [tutaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Wprowadzenie

Ten przykład pokazuje, jak zbudować i wdrożyć kompleksowy **serwer Model Context Protocol (MCP)**, który zapewnia asystentom AI bezpieczny i inteligentny dostęp do danych sprzedaży detalicznej za pomocą PostgreSQL. Projekt prezentuje funkcje klasy korporacyjnej, takie jak **Row Level Security (RLS)**, **wyszukiwanie semantyczne** oraz **integrację z Azure AI** w rzeczywistych scenariuszach analizy sprzedaży detalicznej.

**Kluczowe przypadki użycia:**
- **Analiza sprzedaży wspierana przez AI**: Umożliwienie asystentom AI zapytań i analizy danych sprzedaży detalicznej w języku naturalnym
- **Bezpieczny dostęp wielodostępowy**: Demonstracja implementacji Row Level Security, gdzie różni menedżerowie sklepów mają dostęp tylko do danych swoich sklepów
- **Semantyczne wyszukiwanie produktów**: Prezentacja ulepszonego wyszukiwania produktów za pomocą osadzeń tekstowych
- **Integracja korporacyjna**: Pokazanie, jak integrować serwery MCP z usługami Azure i bazami danych PostgreSQL

**Idealne dla:**
- Programistów uczących się budowy serwerów MCP z integracją bazy danych
- Inżynierów danych wdrażających bezpieczne rozwiązania analityczne dla wielu najemców
- Twórców aplikacji AI pracujących z danymi detalicznymi lub e-commerce
- Każdego, kto interesuje się łączeniem asystentów AI z bazami danych korporacyjnymi

## Dołącz do społeczności Azure AI Foundry Discord
Podziel się swoimi doświadczeniami z MCP i poznaj ekspertów oraz grupy produktowe

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Serwer MCP do analizy sprzedaży

Serwer Model Context Protocol (MCP), który zapewnia kompleksowy dostęp do bazy danych sprzedaży klientów dla Zava Retail DIY Business. Ten serwer umożliwia asystentom AI zapytania i analizę danych sprzedaży detalicznej za pomocą bezpiecznego, świadomego schematu interfejsu.

## 📚 Kompletny przewodnik wdrożeniowy

Aby uzyskać szczegółowy opis, jak zbudować to rozwiązanie i jak wdrożyć podobne serwery MCP, zobacz nasz kompleksowy **[Przewodnik po przykładzie](Sample_Walkthrough.md)**. Ten przewodnik zawiera:

- **Dogłębną analizę architektury**: Analiza komponentów i wzorców projektowych
- **Krok po kroku**: Od konfiguracji projektu po wdrożenie
- **Analizę kodu**: Szczegółowe wyjaśnienie implementacji serwera MCP
- **Zaawansowane funkcje**: Row Level Security, wyszukiwanie semantyczne i monitorowanie
- **Najlepsze praktyki**: Wskazówki dotyczące bezpieczeństwa, wydajności i rozwoju
- **Rozwiązywanie problemów**: Typowe problemy i ich rozwiązania

Idealne dla programistów, którzy chcą zrozumieć szczegóły implementacji i budować podobne rozwiązania.

## 🤖 Czym jest MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** to otwarty standard, który umożliwia asystentom AI bezpieczny dostęp do zewnętrznych źródeł danych i narzędzi w czasie rzeczywistym. Można go porównać do mostu, który pozwala modelom AI łączyć się z bazami danych, API, systemami plików i innymi zasobami, zachowując jednocześnie bezpieczeństwo i kontrolę.

### Kluczowe korzyści:
- **Dostęp do danych w czasie rzeczywistym**: Asystenci AI mogą zapytaniać na żywo bazy danych i API
- **Bezpieczna integracja**: Kontrolowany dostęp z uwierzytelnianiem i uprawnieniami  
- **Rozszerzalność narzędzi**: Dodawanie niestandardowych funkcji do asystentów AI
- **Ustandaryzowany protokół**: Działa na różnych platformach i narzędziach AI

### Nowy w MCP?

Jeśli dopiero zaczynasz przygodę z Model Context Protocol, zalecamy rozpoczęcie od kompleksowych zasobów dla początkujących od Microsoftu:

**📖 [Przewodnik MCP dla początkujących](https://aka.ms/mcp-for-beginners)**

Ten zasób zawiera:
- Wprowadzenie do koncepcji i architektury MCP
- Samouczki krok po kroku dotyczące budowy pierwszego serwera MCP
- Najlepsze praktyki w rozwoju MCP
- Przykłady integracji z popularnymi platformami AI
- Zasoby społecznościowe i wsparcie

Gdy zrozumiesz podstawy, wróć tutaj, aby zgłębić zaawansowaną implementację analizy sprzedaży detalicznej!

## 📚 Kompletny przewodnik edukacyjny: /walkthrough

To repozytorium zawiera kompletny **12-modułowy przewodnik edukacyjny**, który rozkłada ten przykład serwera MCP na przystępne, krok po kroku lekcje. Przewodnik przekształca ten działający przykład w kompleksowy zasób edukacyjny, idealny dla programistów, którzy chcą zrozumieć, jak budować gotowe do produkcji serwery MCP z integracją bazy danych.

### Czego się nauczysz

Przewodnik obejmuje wszystko, od podstawowych koncepcji MCP po zaawansowane wdrożenie produkcyjne, w tym:

- **Podstawy MCP**: Zrozumienie Model Context Protocol i jego zastosowań w rzeczywistości
- **Integracja bazy danych**: Implementacja bezpiecznego połączenia z PostgreSQL z Row Level Security
- **Funkcje wspierane przez AI**: Dodawanie możliwości wyszukiwania semantycznego za pomocą osadzeń Azure OpenAI
- **Implementacja bezpieczeństwa**: Uwierzytelnianie klasy korporacyjnej, autoryzacja i izolacja danych
- **Rozwój narzędzi**: Tworzenie zaawansowanych narzędzi MCP do analizy danych i inteligencji biznesowej
- **Testowanie i debugowanie**: Kompleksowe strategie testowania i techniki debugowania
- **Integracja z VS Code**: Konfiguracja AI Chat do zapytań w języku naturalnym do bazy danych
- **Wdrożenie produkcyjne**: Konteneryzacja, skalowanie i strategie wdrożenia w chmurze
- **Monitorowanie i obserwowalność**: Application Insights, logowanie i monitorowanie wydajności

### Przegląd ścieżki edukacyjnej

Przewodnik podąża za progresywną strukturą nauki, zaprojektowaną dla programistów na każdym poziomie zaawansowania:

| Moduł | Obszar tematyczny | Opis | Szacowany czas |
|-------|-------------------|-------|----------------|
| **[00-Wprowadzenie](walkthrough/00-Introduction/README.md)** | Podstawy | Koncepcje MCP, studium przypadku Zava Retail, przegląd architektury | 30 minut |
| **[01-Architektura](walkthrough/01-Architecture/README.md)** | Wzorce projektowe | Architektura techniczna, projekt warstwowy, komponenty systemu | 45 minut |
| **[02-Bezpieczeństwo](walkthrough/02-Security/README.md)** | Bezpieczeństwo korporacyjne | Uwierzytelnianie Azure, Row Level Security, izolacja wielodostępowa | 60 minut |
| **[03-Konfiguracja](walkthrough/03-Setup/README.md)** | Środowisko | Konfiguracja Dockera, Azure CLI, konfiguracja projektu, walidacja | 45 minut |
| **[04-Baza danych](walkthrough/04-Database/README.md)** | Warstwa danych | Schemat PostgreSQL, pgvector, polityki RLS, dane przykładowe | 60 minut |
| **[05-Serwer MCP](walkthrough/05-MCP-Server/README.md)** | Implementacja rdzenia | Framework FastMCP, integracja bazy danych, zarządzanie połączeniami | 90 minut |
| **[06-Narzędzia](walkthrough/06-Tools/README.md)** | Rozwój narzędzi | Tworzenie narzędzi MCP, walidacja zapytań, funkcje BI | 75 minut |
| **[07-Wyszukiwanie semantyczne](walkthrough/07-Semantic-Search/README.md)** | Integracja AI | Osadzenia Azure OpenAI, wyszukiwanie wektorowe, strategie hybrydowe | 60 minut |
| **[08-Testowanie](walkthrough/08-Testing/README.md)** | Zapewnienie jakości | Testy jednostkowe, integracyjne, wydajnościowe, debugowanie | 75 minut |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Doświadczenie programisty | Konfiguracja VS Code, integracja AI Chat, przepływy debugowania | 45 minut |
| **[10-Wdrożenie](walkthrough/10-Deployment/README.md)** | Gotowość produkcyjna | Konteneryzacja, Azure Container Apps, CI/CD, skalowanie | 90 minut |
| **[11-Monitorowanie](walkthrough/11-Monitoring/README.md)** | Obserwowalność | Application Insights, logowanie strukturalne, metryki wydajności | 60 minut |
| **[12-Najlepsze praktyki](walkthrough/12-Best-Practices/README.md)** | Doskonałość produkcyjna | Wzmacnianie bezpieczeństwa, optymalizacja wydajności, wzorce korporacyjne | 45 minut |

**Całkowity czas nauki**: ~12-15 godzin kompleksowej nauki praktycznej

### 🎯 Jak korzystać z przewodnika

**Dla początkujących**:
1. Zacznij od [Modułu 00: Wprowadzenie](walkthrough/00-Introduction/README.md), aby zrozumieć podstawy MCP
2. Przechodź przez moduły w kolejności, aby uzyskać pełne doświadczenie edukacyjne
3. Każdy moduł buduje na poprzednich koncepcjach i zawiera ćwiczenia praktyczne

**Dla doświadczonych programistów**:
1. Przejrzyj [Główny przegląd przewodnika](walkthrough/README.md), aby zobaczyć podsumowanie modułów
2. Przejdź do interesujących Cię modułów (np. Moduł 07 dotyczący integracji AI)
3. Używaj poszczególnych modułów jako materiału referencyjnego dla własnych projektów

**Dla wdrożeń produkcyjnych**:
1. Skup się na Modułach 02 (Bezpieczeństwo), 10 (Wdrożenie) i 11 (Monitorowanie)
2. Przejrzyj Moduł 12 (Najlepsze praktyki) dla wytycznych korporacyjnych
3. Używaj przykładów kodu jako szablonów gotowych do produkcji

### 🚀 Opcje szybkiego startu

**Opcja 1: Kompletny ścieżka edukacyjna** (Zalecane dla początkujących)  
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```
  
**Opcja 2: Praktyczna implementacja** (Od razu zacznij budować)  
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```
  
**Opcja 3: Skupienie na produkcji** (Wdrożenie korporacyjne)  
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```
  
### 📋 Wymagania wstępne do nauki

**Zalecane przygotowanie**:
- Podstawowa znajomość programowania w Pythonie
- Znajomość REST API i baz danych
- Ogólne zrozumienie koncepcji AI/ML
- Podstawowa wiedza o pracy w terminalu i Dockerze

**Nie wymagane (ale pomocne)**:
- Doświadczenie z MCP (omawiamy to od podstaw)
- Znajomość chmury Azure (zapewniamy szczegółowe instrukcje)
- Zaawansowana znajomość PostgreSQL (wyjaśniamy koncepcje w miarę potrzeb)

### 💡 Wskazówki do nauki

1. **Praktyczne podejście**: Każdy moduł zawiera działające przykłady kodu, które można uruchomić i modyfikować
2. **Stopniowa złożoność**: Koncepcje są budowane stopniowo, od prostych do zaawansowanych
3. **Kontekst rzeczywisty**: Wszystkie przykłady opierają się na realistycznych scenariuszach biznesowych w handlu detalicznym
4. **Gotowość produkcyjna**: Przykłady kodu są zaprojektowane do rzeczywistego użycia w produkcji
5. **Wsparcie społeczności**: Dołącz do naszej [społeczności na Discordzie](https://discord.com/invite/ByRwuEEgH4) po pomoc i dyskusje

### 🔗 Powiązane zasoby

- **[MCP dla początkujących](https://aka.ms/mcp-for-beginners)**: Podstawowe materiały do nauki
- **[Przykładowy przewodnik](Sample_Walkthrough.md)**: Ogólny przegląd techniczny
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Platforma chmurowa używana w przykładach
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Framework MCP w Pythonie

**Gotowy, by zacząć naukę?** Rozpocznij od **[Modułu 00: Wprowadzenie](walkthrough/00-Introduction/README.md)** lub przejrzyj **[pełny przegląd przewodnika](walkthrough/README.md)**.

## Wymagania wstępne

1. Zainstalowany Docker Desktop
2. Zainstalowany Git
3. **Azure CLI**: Zainstaluj i uwierzytelnij się w Azure CLI
4. Dostęp do modelu OpenAI `text-embedding-3-small` i opcjonalnie modelu `gpt-4o-mini`.

## Pierwsze kroki

Otwórz terminal i wykonaj następujące polecenia:

1. Uwierzytelnij się w Azure CLI

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

Uruchom poniższe skrypty, aby zautomatyzować wdrożenie zasobów Azure potrzebnych dla serwera MCP.

Skrypty wdrożeniowe automatycznie wdrożą model `text-embedding-3-small`. Podczas wdrożenia będziesz mieć możliwość uwzględnienia również modelu `gpt-4o-mini`. Zauważ, że model `gpt-4o-mini` **nie jest wymagany** dla tego projektu i jest uwzględniony jedynie jako potencjalne rozszerzenie w przyszłości.

**Wybierz skrypt dla swojego systemu operacyjnego:**

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

Najprostszym sposobem uruchomienia całego stosu (PostgreSQL + serwer MCP) jest użycie Docker Compose:

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

Poniższe kroki zakładają, że będziesz korzystać z wbudowanego wsparcia dla serwera MCP w VS Code.

1. Otwórz projekt w VS Code. W terminalu uruchom:

    ```bash
    code .
    ```

2. Uruchom jeden lub więcej serwerów MCP, korzystając z konfiguracji w pliku `.vscode/mcp.json`. Plik zawiera cztery różne konfiguracje serwera, każda reprezentująca rolę innego menedżera sklepu:

   - Każda konfiguracja używa unikalnego identyfikatora użytkownika RLS (Row Level Security)
   - Te identyfikatory użytkowników symulują różne tożsamości menedżerów sklepów uzyskujących dostęp do bazy danych
   - System RLS ogranicza dostęp do danych na podstawie przypisanego sklepu menedżera
   - Odzwierciedla to rzeczywiste scenariusze, w których menedżerowie sklepów logują się za pomocą różnych kont Entra ID

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

1. Włącz tryb AI Chat w VS Code
2. Wpisz **#zava** i wybierz jeden z uruchomionych serwerów MCP
3. Zadawaj pytania dotyczące danych sprzedażowych - zobacz przykładowe zapytania poniżej

### Przykładowe zapytania

1. Pokaż 20 najlepszych produktów według przychodów ze sprzedaży
2. Pokaż sprzedaż według sklepów
3. Jak wyglądała sprzedaż w ostatnim kwartale według kategorii?
4. Jakie produkty sprzedajemy, które są podobne do "pojemników na farbę"?

## Funkcje

- **Dostęp do schematów wielu tabel**: Pobieranie schematów dla wielu tabel bazy danych w jednym żądaniu
- **Bezpieczne wykonywanie zapytań**: Wykonywanie zapytań PostgreSQL z obsługą Row Level Security (RLS)
- **Dane w czasie rzeczywistym**: Dostęp do aktualnych danych sprzedażowych, magazynowych i klientów
- **Narzędzia daty/czasu**: Pobieranie aktualnych znaczników czasu UTC do analizy wrażliwej na czas
- **Elastyczne wdrożenie**: Obsługa trybu serwera HTTP

## Obsługiwane tabele

Serwer zapewnia dostęp do następujących tabel bazy danych handlu detalicznego:

- `retail.customers` - Informacje o klientach i ich profile
- `retail.stores` - Lokalizacje i szczegóły sklepów
- `retail.categories` - Kategorie produktów i hierarchie
- `retail.product_types` - Klasyfikacje typów produktów
- `retail.products` - Katalog produktów i specyfikacje
- `retail.orders` - Zamówienia klientów i transakcje
- `retail.order_items` - Poszczególne pozycje w zamówieniach
- `retail.inventory` - Aktualne poziomy zapasów i dane magazynowe

## Dostępne narzędzia

### `get_multiple_table_schemas`

Pobierz schematy bazy danych dla wielu tabel w jednym żądaniu.

**Parametry:**

- `table_names` (list[str]): Lista poprawnych nazw tabel z powyższych obsługiwanych tabel

**Zwraca:** Połączone ciągi schematów dla żądanych tabel

### `execute_sales_query`

Wykonaj zapytania PostgreSQL w bazie danych sprzedaży z obsługą Row Level Security.

**Parametry:**

- `postgresql_query` (str): Poprawnie sformułowane zapytanie PostgreSQL

**Zwraca:** Wyniki zapytania sformatowane jako ciąg znaków (ograniczone do 20 wierszy dla czytelności)

**Najlepsze praktyki:**

- Zawsze najpierw pobieraj schematy tabel
- Używaj dokładnych nazw kolumn z schematów
- Łącz powiązane tabele dla kompleksowej analizy
- Agreguj wyniki, gdy to konieczne
- Ograniczaj wyniki dla czytelności

### `get_current_utc_date`

Pobierz aktualną datę i czas UTC w formacie ISO.

**Zwraca:** Aktualna data/czas UTC w formacie ISO (YYYY-MM-DDTHH:MM:SS.fffffZ)

### `semantic_search_products`

Wykonaj semantyczne wyszukiwanie produktów na podstawie zapytań użytkownika.

**Parametry:**

- `query` (str): Ciąg zapytania wyszukiwania

**Zwraca:** Lista produktów pasujących do kryteriów wyszukiwania

## Funkcje bezpieczeństwa

### Row Level Security (RLS)

Serwer implementuje Row Level Security, aby zapewnić, że użytkownicy mają dostęp tylko do danych, do których są uprawnieni:

- **Tryb HTTP**: Używa nagłówka `x-rls-user-id` do identyfikacji użytkownika
- **Domyślne ustawienie**: Używa zastępczego UUID, gdy nie podano identyfikatora użytkownika

#### Unikalne identyfikatory użytkowników RLS dla sklepów

Każda lokalizacja sklepu Zava Retail ma unikalny identyfikator użytkownika RLS, który określa, do jakich danych użytkownik ma dostęp:

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

Gdy użytkownik łączy się z określonym identyfikatorem użytkownika RLS sklepu, widzi tylko:

- Klientów powiązanych z tym sklepem
- Zamówienia złożone w tej lokalizacji sklepu
- Dane magazynowe dla tego konkretnego sklepu
- Metryki sprzedaży i wydajności specyficzne dla sklepu

Zapewnia to izolację danych między różnymi lokalizacjami sklepów przy zachowaniu jednolitego schematu bazy danych.

## Architektura

### Kontekst aplikacji

Serwer korzysta z zarządzanego kontekstu aplikacji z:

- **Pula połączeń z bazą danych**: Efektywne zarządzanie połączeniami w trybie HTTP
- **Zarządzanie cyklem życia**: Prawidłowe czyszczenie zasobów podczas zamykania
- **Bezpieczeństwo typów**: Silnie typowany kontekst z klasą `AppContext`

### Kontekst żądania

- **Parsowanie nagłówków**: Bezpieczne przetwarzanie nagłówków w celu identyfikacji użytkownika
- **Integracja RLS**: Automatyczne rozwiązywanie identyfikatora użytkownika z kontekstu żądania
- **Obsługa błędów**: Kompleksowa obsługa błędów z przyjaznymi komunikatami

## Integracja z bazą danych

Serwer integruje się z bazą danych PostgreSQL za pomocą klasy `PostgreSQLSchemaProvider`:

- **Pula połączeń**: Używa asynchronicznych pul połączeń dla skalowalności
- **Metadane schematu**: Dostarcza szczegółowe informacje o schematach tabel
- **Wykonywanie zapytań**: Bezpieczne wykonywanie zapytań z obsługą RLS
- **Zarządzanie zasobami**: Automatyczne czyszczenie zasobów bazy danych

## Obsługa błędów

Serwer implementuje solidną obsługę błędów:

- **Walidacja tabel**: Zapewnia dostęp tylko do poprawnych nazw tabel
- **Walidacja zapytań**: Waliduje zapytania PostgreSQL przed ich wykonaniem
- **Zarządzanie zasobami**: Prawidłowe czyszczenie nawet w przypadku błędów
- **Przyjazne komunikaty**: Jasne komunikaty o błędach ułatwiające rozwiązywanie problemów

## Rozważania dotyczące bezpieczeństwa

1. **Row Level Security**: Wszystkie zapytania respektują zasady RLS na podstawie tożsamości użytkownika
2. **Izolacja danych sklepu**: Identyfikator użytkownika RLS każdego sklepu zapewnia dostęp tylko do danych tego sklepu
3. **Walidacja wejścia**: Nazwy tabel i zapytania są walidowane przed wykonaniem
4. **Limity zasobów**: Wyniki zapytań są ograniczane, aby zapobiec nadmiernemu zużyciu zasobów
5. **Bezpieczeństwo połączeń**: Używa bezpiecznych praktyk połączeń z bazą danych
6. **Weryfikacja tożsamości użytkownika**: Zawsze upewnij się, że używany jest poprawny identyfikator użytkownika RLS dla zamierzonej lokalizacji sklepu

### Ważne uwagi dotyczące bezpieczeństwa

- **Nigdy nie używaj identyfikatorów użytkowników RLS produkcji w środowiskach deweloperskich**
- **Zawsze weryfikuj, czy identyfikator użytkownika RLS odpowiada zamierzonemu sklepowi przed uruchomieniem zapytań**
- **Domyślny UUID (`00000000-0000-0000-0000-000000000000`) zapewnia ograniczony dostęp**
- **Każdy menedżer sklepu powinien mieć dostęp tylko do identyfikatora użytkownika RLS swojego sklepu**

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

Podczas wnoszenia wkładu w rozwój tego serwera:

1. Upewnij się, że wszystkie zapytania do bazy danych respektują Row Level Security
2. Dodaj odpowiednią obsługę błędów dla nowych narzędzi
3. Zaktualizuj ten plik README o nowe funkcje lub zmiany
4. Przetestuj tryb serwera HTTP
5. Waliduj parametry wejściowe i dostarczaj jasne komunikaty o błędach

## [Licencja](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Ten serwer MCP umożliwia bezpieczny i efektywny dostęp do danych sprzedażowych Zava Retail w celu analizy i uzyskiwania wniosków wspieranych przez AI.*

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy wszelkich starań, aby tłumaczenie było precyzyjne, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji o kluczowym znaczeniu zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.