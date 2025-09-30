<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94449afc70ef625a5360a67829a017b3",
  "translation_date": "2025-09-30T09:10:15+00:00",
  "source_file": "README.md",
  "language_code": "es"
}
-->
# Ejemplo de Servidor MCP y PostgreSQL - Análisis de Ventas Minoristas

## Aprende MCP con Integración de Bases de Datos a través de Ejemplos Prácticos

[![Colaboradores en GitHub](https://img.shields.io/github/contributors/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/graphs/contributors)
[![Problemas en GitHub](https://img.shields.io/github/issues/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)
[![Solicitudes de Extracción en GitHub](https://img.shields.io/github/issues-pr/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.svg)](https://GitHub.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/pulls)
[![PRs Bienvenidos](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![Únete al Discord de Azure AI Foundry](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

Sigue estos pasos para comenzar a usar estos recursos:

1. **Haz un Fork del Repositorio**: Haz clic [aquí para hacer un fork](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/fork)
2. **Clona el Repositorio**: `git clone https://github.com/TU-NOMBRE-DE-USUARIO/MCP-Server-and-PostgreSQL-Sample-Retail.git`
3. **Únete al Discord de Azure AI Foundry**: [Conoce a expertos y otros desarrolladores](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Soporte Multilenguaje

#### Disponible a través de GitHub Action (Automatizado y Siempre Actualizado)

[Francés](../fr/README.md) | [Español](./README.md) | [Alemán](../de/README.md) | [Ruso](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chino (Simplificado)](../zh/README.md) | [Chino (Tradicional, Macao)](../mo/README.md) | [Chino (Tradicional, Hong Kong)](../hk/README.md) | [Chino (Tradicional, Taiwán)](../tw/README.md) | [Japonés](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalí](../bn/README.md) | [Maratí](../mr/README.md) | [Nepalí](../ne/README.md) | [Panyabí (Gurmukhi)](../pa/README.md) | [Portugués (Portugal)](../pt/README.md) | [Portugués (Brasil)](../br/README.md) | [Italiano](../it/README.md) | [Polaco](../pl/README.md) | [Turco](../tr/README.md) | [Griego](../el/README.md) | [Tailandés](../th/README.md) | [Sueco](../sv/README.md) | [Danés](../da/README.md) | [Noruego](../no/README.md) | [Finlandés](../fi/README.md) | [Holandés](../nl/README.md) | [Hebreo](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonesio](../id/README.md) | [Malayo](../ms/README.md) | [Tagalo (Filipino)](../tl/README.md) | [Suajili](../sw/README.md) | [Húngaro](../hu/README.md) | [Checo](../cs/README.md) | [Eslovaco](../sk/README.md) | [Rumano](../ro/README.md) | [Búlgaro](../bg/README.md) | [Serbio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmano (Myanmar)](../my/README.md)

**Si deseas que se admitan idiomas adicionales, consulta la lista [aquí](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introducción

Este ejemplo demuestra cómo construir y desplegar un completo **servidor Model Context Protocol (MCP)** que proporciona a los asistentes de IA acceso seguro e inteligente a datos de ventas minoristas a través de PostgreSQL. El proyecto incluye características de nivel empresarial como **Seguridad a Nivel de Fila (RLS)**, **capacidades de búsqueda semántica**, e **integración con Azure AI** para escenarios reales de análisis minorista.

**Casos de Uso Clave:**
- **Análisis de Ventas Potenciado por IA**: Permite que los asistentes de IA consulten y analicen datos de ventas minoristas mediante lenguaje natural
- **Acceso Seguro Multi-Tenant**: Demuestra la implementación de Seguridad a Nivel de Fila donde diferentes gerentes de tienda solo pueden acceder a los datos de su tienda
- **Búsqueda Semántica de Productos**: Muestra descubrimiento de productos mejorado con IA utilizando incrustaciones de texto
- **Integración Empresarial**: Ilustra cómo integrar servidores MCP con servicios de Azure y bases de datos PostgreSQL

**Ideal para:**
- Desarrolladores que desean aprender a construir servidores MCP con integración de bases de datos
- Ingenieros de datos que implementan soluciones de análisis multi-tenant seguras
- Desarrolladores de aplicaciones de IA que trabajan con datos minoristas o de comercio electrónico
- Cualquier persona interesada en combinar asistentes de IA con bases de datos empresariales

## Únete a la Comunidad de Discord de Azure AI Foundry
Comparte tus experiencias con MCP y conoce a expertos y grupos de productos

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/ByRwuEEgH4)](https://discord.com/invite/ByRwuEEgH4)

# Servidor MCP para Análisis de Ventas

Un servidor Model Context Protocol (MCP) que proporciona acceso completo a la base de datos de ventas de clientes para el negocio de bricolaje Zava Retail. Este servidor permite que los asistentes de IA consulten y analicen datos de ventas minoristas a través de una interfaz segura y consciente del esquema.

## 📚 Guía de Implementación Completa

Para un desglose detallado de cómo se construye esta solución y cómo implementar servidores MCP similares, consulta nuestra **[Guía de Ejemplo](Sample_Walkthrough.md)**. Esta guía incluye:

- **Análisis de Arquitectura**: Componentes y patrones de diseño
- **Construcción Paso a Paso**: Desde la configuración del proyecto hasta el despliegue
- **Desglose del Código**: Explicación detallada de la implementación del servidor MCP
- **Características Avanzadas**: Seguridad a Nivel de Fila, búsqueda semántica y monitoreo
- **Mejores Prácticas**: Directrices de seguridad, rendimiento y desarrollo
- **Resolución de Problemas**: Problemas comunes y soluciones

Perfecto para desarrolladores que desean entender los detalles de la implementación y construir soluciones similares.

## 🤖 ¿Qué es MCP (Model Context Protocol)?

**Model Context Protocol (MCP)** es un estándar abierto que permite a los asistentes de IA acceder de manera segura a fuentes de datos externas y herramientas en tiempo real. Piénsalo como un puente que permite a los modelos de IA conectarse con bases de datos, APIs, sistemas de archivos y otros recursos mientras se mantiene la seguridad y el control.

### Beneficios Clave:
- **Acceso a Datos en Tiempo Real**: Los asistentes de IA pueden consultar bases de datos y APIs en vivo
- **Integración Segura**: Acceso controlado con autenticación y permisos  
- **Extensibilidad de Herramientas**: Agrega capacidades personalizadas a los asistentes de IA
- **Protocolo Estandarizado**: Funciona en diferentes plataformas y herramientas de IA

### ¿Nuevo en MCP?

Si eres nuevo en Model Context Protocol, te recomendamos comenzar con los recursos para principiantes de Microsoft:

**📖 [Guía para Principiantes de MCP](https://aka.ms/mcp-for-beginners)**

Este recurso incluye:
- Introducción a los conceptos y arquitectura de MCP
- Tutoriales paso a paso para construir tu primer servidor MCP
- Mejores prácticas para el desarrollo de MCP
- Ejemplos de integración con plataformas de IA populares
- Recursos comunitarios y soporte

Una vez que entiendas los conceptos básicos, regresa aquí para explorar esta implementación avanzada de análisis minorista.

## 📚 Guía de Aprendizaje Completa: /walkthrough

Este repositorio incluye un **recorrido de aprendizaje de 12 módulos** que descompone este ejemplo de servidor MCP minorista en lecciones prácticas y paso a paso. El recorrido transforma este ejemplo funcional en un recurso educativo completo, perfecto para desarrolladores que desean aprender a construir servidores MCP listos para producción con integración de bases de datos.

### Lo que Aprenderás

El recorrido cubre todo, desde conceptos básicos de MCP hasta despliegue avanzado en producción, incluyendo:

- **Fundamentos de MCP**: Comprender el Model Context Protocol y sus aplicaciones en el mundo real
- **Integración de Bases de Datos**: Implementar conectividad segura con PostgreSQL y Seguridad a Nivel de Fila
- **Características Mejoradas con IA**: Agregar capacidades de búsqueda semántica con incrustaciones de Azure OpenAI
- **Implementación de Seguridad**: Autenticación, autorización y aislamiento de datos de nivel empresarial
- **Desarrollo de Herramientas**: Construir herramientas MCP sofisticadas para análisis de datos e inteligencia empresarial
- **Pruebas y Depuración**: Estrategias de pruebas completas y técnicas de depuración
- **Integración con VS Code**: Configuración de AI Chat para consultas de bases de datos en lenguaje natural
- **Despliegue en Producción**: Estrategias de contenedorización, escalado y despliegue en la nube
- **Monitoreo y Observabilidad**: Application Insights, registro estructurado y monitoreo de rendimiento

### Resumen del Camino de Aprendizaje

El recorrido sigue una estructura de aprendizaje progresiva diseñada para desarrolladores de todos los niveles:

| Módulo | Área de Enfoque | Descripción | Tiempo Estimado |
|--------|-----------------|-------------|-----------------|
| **[00-Introducción](walkthrough/00-Introduction/README.md)** | Fundamentos | Conceptos de MCP, caso de estudio de Zava Retail, visión general de la arquitectura | 30 minutos |
| **[01-Arquitectura](walkthrough/01-Architecture/README.md)** | Patrones de Diseño | Arquitectura técnica, diseño por capas, componentes del sistema | 45 minutos |
| **[02-Seguridad](walkthrough/02-Security/README.md)** | Seguridad Empresarial | Autenticación de Azure, Seguridad a Nivel de Fila, aislamiento multi-tenant | 60 minutos |
| **[03-Configuración](walkthrough/03-Setup/README.md)** | Entorno | Configuración de Docker, Azure CLI, configuración del proyecto, validación | 45 minutos |
| **[04-Base de Datos](walkthrough/04-Database/README.md)** | Capa de Datos | Esquema de PostgreSQL, pgvector, políticas de RLS, datos de ejemplo | 60 minutos |
| **[05-Servidor MCP](walkthrough/05-MCP-Server/README.md)** | Implementación Principal | Framework FastMCP, integración de bases de datos, gestión de conexiones | 90 minutos |
| **[06-Herramientas](walkthrough/06-Tools/README.md)** | Desarrollo de Herramientas | Creación de herramientas MCP, validación de consultas, características de inteligencia empresarial | 75 minutos |
| **[07-Búsqueda Semántica](walkthrough/07-Semantic-Search/README.md)** | Integración con IA | Incrustaciones de Azure OpenAI, búsqueda vectorial, estrategias de búsqueda híbrida | 60 minutos |
| **[08-Pruebas](walkthrough/08-Testing/README.md)** | Aseguramiento de Calidad | Pruebas unitarias, pruebas de integración, pruebas de rendimiento, depuración | 75 minutos |
| **[09-VS Code](walkthrough/09-VS-Code/README.md)** | Experiencia de Desarrollo | Configuración de VS Code, integración de AI Chat, flujos de trabajo de depuración | 45 minutos |
| **[10-Despliegue](walkthrough/10-Deployment/README.md)** | Listo para Producción | Contenedorización, Azure Container Apps, pipelines CI/CD, escalado | 90 minutos |
| **[11-Monitoreo](walkthrough/11-Monitoring/README.md)** | Observabilidad | Application Insights, registro estructurado, métricas de rendimiento | 60 minutos |
| **[12-Mejores Prácticas](walkthrough/12-Best-Practices/README.md)** | Excelencia en Producción | Fortalecimiento de seguridad, optimización de rendimiento, patrones empresariales | 45 minutos |

**Tiempo Total de Aprendizaje**: ~12-15 horas de aprendizaje práctico completo

### 🎯 Cómo Usar el Recorrido

**Para Principiantes**:
1. Comienza con el [Módulo 00: Introducción](walkthrough/00-Introduction/README.md) para entender los fundamentos de MCP
2. Sigue los módulos en orden para una experiencia de aprendizaje completa
3. Cada módulo se basa en conceptos previos e incluye ejercicios prácticos

**Para Desarrolladores Experimentados**:
1. Revisa el [Resumen Principal del Recorrido](walkthrough/README.md) para un resumen completo de los módulos
2. Salta a módulos específicos que te interesen (por ejemplo, Módulo 07 para integración con IA)
3. Usa los módulos individuales como material de referencia para tus propios proyectos

**Para Implementación en Producción**:
1. Enfócate en los Módulos 02 (Seguridad), 10 (Despliegue) y 11 (Monitoreo)
2. Revisa el Módulo 12 (Mejores Prácticas) para directrices empresariales
3. Usa los ejemplos de código como plantillas listas para producción

### 🚀 Opciones de Inicio Rápido

**Opción 1: Camino de Aprendizaje Completo** (Recomendado para principiantes)
```bash
# Clone and start with the introduction
git clone https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail.git
cd MCP-Server-and-PostgreSQL-Sample-Retail/walkthrough
# Follow along starting with 00-Introduction/README.md
```

**Opción 2: Implementación Práctica** (Comienza directamente a construir)
```bash
# Start with setup and build as you learn
cd walkthrough/03-Setup
# Follow the setup guide and continue through implementation modules
```

**Opción 3: Enfoque en Producción** (Despliegue empresarial)
```bash
# Focus on production-ready aspects
# Review modules: 02-Security, 10-Deployment, 11-Monitoring, 12-Best-Practices
```

### 📋 Requisitos previos para el aprendizaje

**Conocimientos recomendados**:
- Experiencia básica en programación con Python
- Familiaridad con REST APIs y bases de datos
- Comprensión general de conceptos de IA/ML
- Conocimientos básicos de línea de comandos y Docker

**No requeridos (pero útiles)**:
- Experiencia previa con MCP (lo cubrimos desde cero)
- Experiencia en la nube de Azure (proporcionamos una guía paso a paso)
- Conocimientos avanzados de PostgreSQL (explicamos los conceptos según sea necesario)

### 💡 Consejos para el aprendizaje

1. **Enfoque práctico**: Cada módulo incluye ejemplos de código funcionales que puedes ejecutar y modificar.
2. **Complejidad progresiva**: Los conceptos se desarrollan gradualmente, de simples a avanzados.
3. **Contexto del mundo real**: Todos los ejemplos utilizan escenarios realistas de negocios minoristas.
4. **Listo para producción**: Los ejemplos de código están diseñados para su uso en producción.
5. **Soporte comunitario**: Únete a nuestra [comunidad en Discord](https://discord.com/invite/ByRwuEEgH4) para obtener ayuda y participar en discusiones.

### 🔗 Recursos relacionados

- **[MCP para principiantes](https://aka.ms/mcp-for-beginners)**: Lectura esencial de antecedentes
- **[Recorrido de ejemplo](Sample_Walkthrough.md)**: Descripción técnica de alto nivel
- **[Azure AI Foundry](https://azure.microsoft.com/en-us/products/ai-foundry)**: Plataforma en la nube utilizada en los ejemplos
- **[FastMCP Framework](https://github.com/jlowin/fastmcp)**: Marco de implementación de MCP en Python

**¿Listo para comenzar a aprender?** Comienza con **[Módulo 00: Introducción](walkthrough/00-Introduction/README.md)** o explora la **[visión general del recorrido completo](walkthrough/README.md)**.

## Requisitos previos

1. Docker Desktop instalado
2. Git instalado
3. **Azure CLI**: Instala y autentica con Azure CLI
4. Acceso al modelo OpenAI `text-embedding-3-small` y, opcionalmente, al modelo `gpt-4o-mini`.

## Primeros pasos

Abre una ventana de terminal y ejecuta los siguientes comandos:

1. Autentícate con Azure CLI

    ```bash
    az login
    ```

2. Clona el repositorio

    ```bash
    git clone https://github.com/gloveboxes/Zava-MCP-Server-and-PostgreSQL-Sample
    ```

3. Navega al directorio del proyecto

    ```bash
    cd Zava-MCP-Server-and-PostgreSQL-Sample
    ```

### Despliega recursos de Azure

Ejecuta los siguientes scripts para automatizar el despliegue de los recursos de Azure necesarios para el servidor MCP.

Los scripts de despliegue implementarán automáticamente el modelo `text-embedding-3-small`. Durante el despliegue, tendrás la opción de incluir también el modelo `gpt-4o-mini`. Ten en cuenta que `gpt-4o-mini` **no es necesario** para este proyecto y solo se incluye para posibles mejoras futuras.

**Elige el script para tu plataforma:**

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

## Ejecutar el servidor MCP

La forma más sencilla de ejecutar toda la pila (PostgreSQL + Servidor MCP) es utilizando Docker Compose:

### Inicia la pila

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

## Uso

Se asume que utilizarás el soporte integrado de VS Code para el servidor MCP.

1. Abre el proyecto en VS Code. Desde el terminal, ejecuta:

    ```bash
    code .
    ```

2. Inicia uno o más servidores MCP utilizando las configuraciones en `.vscode/mcp.json`. El archivo contiene cuatro configuraciones diferentes de servidor, cada una representando un rol distinto de gerente de tienda:

   - Cada configuración utiliza un ID de usuario único para RLS (Row Level Security).
   - Estos IDs de usuario simulan diferentes identidades de gerentes de tienda accediendo a la base de datos.
   - El sistema RLS restringe el acceso a los datos según la tienda asignada al gerente.
   - Esto imita escenarios del mundo real donde los gerentes de tienda inician sesión con diferentes cuentas de Entra ID.

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

### Abre el chat de IA en VS Code

1. Abre el modo de chat de IA en VS Code.
2. Escribe **#zava** y selecciona uno de los servidores MCP que iniciaste.
3. Haz preguntas sobre los datos de ventas. Consulta las consultas de ejemplo a continuación.

### Consultas de ejemplo

1. Muestra los 20 productos principales por ingresos de ventas.
2. Muestra las ventas por tienda.
3. ¿Cuáles fueron las ventas del último trimestre por categoría?
4. ¿Qué productos vendemos que son similares a "contenedores para pintura"?

## Funcionalidades

- **Acceso a esquemas de múltiples tablas**: Recupera esquemas de varias tablas de la base de datos en una sola solicitud.
- **Ejecución segura de consultas**: Ejecuta consultas de PostgreSQL con soporte para Row Level Security (RLS).
- **Datos en tiempo real**: Accede a datos actuales de ventas, inventario y clientes.
- **Utilidades de fecha/hora**: Obtén marcas de tiempo UTC actuales para análisis sensibles al tiempo.
- **Despliegue flexible**: Compatible con el modo de servidor HTTP.

## Tablas compatibles

El servidor proporciona acceso a las siguientes tablas de la base de datos minorista:

- `retail.customers` - Información y perfiles de clientes
- `retail.stores` - Ubicaciones y detalles de tiendas
- `retail.categories` - Categorías de productos y jerarquías
- `retail.product_types` - Clasificaciones de tipos de productos
- `retail.products` - Catálogo y especificaciones de productos
- `retail.orders` - Pedidos y transacciones de clientes
- `retail.order_items` - Artículos individuales dentro de los pedidos
- `retail.inventory` - Niveles actuales de inventario y datos de existencias

## Herramientas disponibles

### `get_multiple_table_schemas`

Recupera esquemas de base de datos para múltiples tablas en una sola solicitud.

**Parámetros:**

- `table_names` (list[str]): Lista de nombres de tablas válidos de las tablas compatibles mencionadas anteriormente.

**Devuelve:** Cadenas de esquemas concatenadas para las tablas solicitadas.

### `execute_sales_query`

Ejecuta consultas de PostgreSQL en la base de datos de ventas con soporte para Row Level Security.

**Parámetros:**

- `postgresql_query` (str): Una consulta de PostgreSQL bien formada.

**Devuelve:** Resultados de la consulta formateados como una cadena (limitados a 20 filas para facilitar la lectura).

**Mejores prácticas:**

- Siempre recupera primero los esquemas de las tablas.
- Usa nombres de columnas exactos de los esquemas.
- Une tablas relacionadas para un análisis integral.
- Agrega resultados cuando sea apropiado.
- Limita la salida para facilitar la lectura.

### `get_current_utc_date`

Obtén la fecha y hora UTC actual en formato ISO.

**Devuelve:** Fecha/hora UTC actual en formato ISO (YYYY-MM-DDTHH:MM:SS.fffffZ).

### `semantic_search_products`

Realiza una búsqueda semántica de productos basada en consultas del usuario.

**Devuelve:** Una lista de productos que coinciden con los criterios de búsqueda.

**Parámetros:**

- `query` (str): La cadena de consulta de búsqueda.

**Devuelve:** Una lista de productos que coinciden con los criterios de búsqueda.

## Funciones de seguridad

### Row Level Security (RLS)

El servidor implementa Row Level Security para garantizar que los usuarios solo accedan a los datos que están autorizados a ver:

- **Modo HTTP**: Utiliza el encabezado `x-rls-user-id` para identificar al usuario solicitante.
- **Fallback predeterminado**: Utiliza un UUID de marcador de posición cuando no se proporciona un ID de usuario.

#### IDs de usuario RLS específicos por tienda

Cada ubicación de tienda de Zava Retail tiene un ID de usuario RLS único que determina qué datos puede acceder el usuario:

| Ubicación de la tienda | ID de usuario RLS | Descripción |
|-------------------------|-------------------|-------------|
| **Acceso global**       | `00000000-0000-0000-0000-000000000000` | Fallback predeterminado: acceso a todas las tiendas |
| **Seattle**             | `f47ac10b-58cc-4372-a567-0e02b2c3d479` | Datos de la tienda de Seattle |
| **Bellevue**            | `6ba7b810-9dad-11d1-80b4-00c04fd430c8` | Datos de la tienda de Bellevue |
| **Tacoma**              | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` | Datos de la tienda de Tacoma |
| **Spokane**             | `d8e9f0a1-b2c3-4567-8901-234567890abc` | Datos de la tienda de Spokane |
| **Everett**             | `3b9ac9fa-cd5e-4b92-a7f2-b8c1d0e9f2a3` | Datos de la tienda de Everett |
| **Redmond**             | `e7f8a9b0-c1d2-3e4f-5678-90abcdef1234` | Datos de la tienda de Redmond |
| **Kirkland**            | `9c8b7a65-4321-fed0-9876-543210fedcba` | Datos de la tienda de Kirkland |
| **Online**              | `2f4e6d8c-1a3b-5c7e-9f0a-b2d4f6e8c0a2` | Datos de la tienda en línea |

#### Implementación de RLS

Cuando un usuario se conecta con el ID de usuario RLS de una tienda específica, solo verá:

- Clientes asociados con esa tienda.
- Pedidos realizados en esa ubicación de tienda.
- Datos de inventario para esa tienda específica.
- Métricas de ventas y rendimiento específicas de la tienda.

Esto garantiza el aislamiento de datos entre diferentes ubicaciones de tiendas mientras se mantiene un esquema de base de datos unificado.

## Arquitectura

### Contexto de la aplicación

El servidor utiliza un contexto de aplicación gestionado con:

- **Pool de conexiones a la base de datos**: Gestión eficiente de conexiones para el modo HTTP.
- **Gestión del ciclo de vida**: Limpieza adecuada de recursos al apagar.
- **Seguridad de tipos**: Contexto fuertemente tipado con la clase `AppContext`.

### Contexto de la solicitud

- **Extracción de encabezados**: Análisis seguro de encabezados para la identificación del usuario.
- **Integración de RLS**: Resolución automática del ID de usuario desde el contexto de la solicitud.
- **Gestión de errores**: Manejo integral de errores con mensajes amigables para el usuario.

## Integración con la base de datos

El servidor se integra con una base de datos PostgreSQL a través de la clase `PostgreSQLSchemaProvider`:

- **Pooling de conexiones**: Utiliza pools de conexiones asíncronas para escalabilidad.
- **Metadatos de esquemas**: Proporciona información detallada de esquemas de tablas.
- **Ejecución de consultas**: Ejecución segura de consultas con soporte para RLS.
- **Gestión de recursos**: Limpieza automática de recursos de la base de datos.

## Manejo de errores

El servidor implementa un manejo robusto de errores:

- **Validación de tablas**: Garantiza que solo se accedan a nombres de tablas válidos.
- **Validación de consultas**: Valida las consultas de PostgreSQL antes de ejecutarlas.
- **Gestión de recursos**: Limpieza adecuada incluso durante errores.
- **Mensajes amigables**: Mensajes de error claros para la resolución de problemas.

## Consideraciones de seguridad

1. **Row Level Security**: Todas las consultas respetan las políticas de RLS basadas en la identidad del usuario.
2. **Aislamiento de datos de tiendas**: El ID de usuario RLS de cada tienda garantiza el acceso solo a los datos de esa tienda.
3. **Validación de entradas**: Los nombres de tablas y las consultas se validan antes de ejecutarse.
4. **Límites de recursos**: Los resultados de las consultas están limitados para evitar el uso excesivo de recursos.
5. **Seguridad de conexiones**: Utiliza prácticas seguras de conexión a la base de datos.
6. **Verificación de identidad del usuario**: Siempre asegúrate de que el ID de usuario RLS sea el correcto para la tienda deseada.

### Notas importantes de seguridad

- **Nunca uses IDs de usuario RLS de producción en entornos de desarrollo.**
- **Siempre verifica que el ID de usuario RLS coincida con la tienda deseada antes de ejecutar consultas.**
- **El UUID predeterminado (`00000000-0000-0000-0000-000000000000`) proporciona acceso limitado.**
- **Cada gerente de tienda solo debe tener acceso al ID de usuario RLS de su tienda.**

## Desarrollo

### Estructura del proyecto

```text
mcp_server/
├── sales_analysis.py          # Main MCP server implementation
├── sales_analysis_postgres.py # PostgreSQL integration layer
├── sales_analysis_text_embedding.py # Text embedding for semantic search tool
```

### Componentes clave

- **Servidor FastMCP**: Implementación moderna del servidor MCP con soporte asíncrono.
- **Proveedor de PostgreSQL**: Capa de abstracción de base de datos con soporte para RLS.
- **Gestión de contextos**: Manejo de contextos de aplicación y solicitud con seguridad de tipos.
- **Registro de herramientas**: Registro declarativo de herramientas con validación de Pydantic.

## Contribuciones

Al contribuir a este servidor:

1. Asegúrate de que todas las consultas a la base de datos respeten Row Level Security.
2. Agrega un manejo adecuado de errores para las nuevas herramientas.
3. Actualiza este README con cualquier nueva funcionalidad o cambio.
4. Prueba el modo de servidor HTTP.
5. Valida los parámetros de entrada y proporciona mensajes de error claros.

## [Licencia](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/blob/main/LICENSE)

---

*Este servidor MCP permite un acceso seguro y eficiente a los datos de ventas de Zava Retail para análisis e información impulsados por IA.*

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.