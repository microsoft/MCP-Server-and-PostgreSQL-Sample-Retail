<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:19:43+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "es"
}
-->
# Plantillas de Infraestructura

Esta carpeta contiene las plantillas de despliegue de infraestructura para el proyecto MCP Retail Analytics.

## 📁 Resumen de Archivos

| Archivo | Descripción | Caso de Uso |
|---------|-------------|-------------|
| `azuredeploy.json` | **Plantilla ARM** - Despliegue completo a nivel de suscripción | Recomendado para todos los despliegues |
| `azuredeploy.parameters.json` | **Parámetros ARM** - Valores de configuración estáticos | Usado con `azuredeploy.json` |
| `ARM-DEPLOYMENT.md` | **Guía de despliegue ARM** - Instrucciones detalladas | Documentación completa del despliegue |
| `README.md` | **Este archivo** - Resumen de infraestructura | Referencia rápida |

## 🚀 Opciones de Despliegue

### Opción 1: Azure CLI (Recomendado)
Despliegue completo con creación de grupo de recursos:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### Opción 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### Opción 3: Portal de Azure
1. Ve al [Portal de Azure](https://portal.azure.com)
2. Busca "Deploy a custom template"
3. Sube el archivo `azuredeploy.json`
4. Configura los parámetros y despliega

## 🏗️ Componentes de Infraestructura

La plantilla ARM despliega la siguiente infraestructura:

- **Grupo de Recursos**: Contenedor para todos los recursos con nombres consistentes
- **Log Analytics Workspace**: Registro y monitoreo centralizado (retención de 30 días)
- **Application Insights**: Monitoreo de rendimiento de aplicaciones integrado con Log Analytics
- **Azure AI Services**: Centro de servicios de inteligencia artificial (nivel S0) con identidad administrada
- **Modelos OpenAI**:
  - `gpt-4o-mini` (capacidad de 120) - Modelo de chat y completado
  - `text-embedding-3-small` (capacidad de 50) - Embeddings de texto para búsqueda semántica

## 🔧 Configuración de la Plantilla

### Parámetros
La plantilla ARM acepta los siguientes parámetros personalizables:

| Parámetro | Predeterminado | Descripción |
|-----------|----------------|-------------|
| `resourcePrefix` | `mcpretail` | Prefijo para todos los nombres de recursos |
| `location` | `westus2` | Región de Azure para el despliegue |
| `uniqueSuffix` | Generado automáticamente | Identificador único de 4 caracteres |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | Nombre para mostrar |
| `gptModelCapacity` | `120` | Capacidad de tokens del modelo GPT |
| `embeddingModelCapacity` | `50` | Capacidad de tokens del modelo de embeddings |

### Convención de Nombres de Recursos
Todos los recursos siguen el patrón: `{type}-{resourcePrefix}-{uniqueSuffix}`

Ejemplos:
- Grupo de Recursos: `rg-mcpretail-demo`
- Servicio AI: `fdy-mcpretail-demo`
- Application Insights: `appi-mcpretail-demo`

## 🔍 Validación de la Plantilla

### Validar Antes del Despliegue
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### Verificar el Estado del Despliegue
```bash
az deployment sub list --output table
```


## 💰 Estimación de Costos

Costos mensuales estimados para una carga de trabajo de desarrollo:

| Servicio | Configuración | Costo Estimado/Mes |
|----------|---------------|--------------------|
| Azure AI Services | Nivel S0 | $15-50 |
| OpenAI GPT-4o-mini | 120K tokens | $15-30 |
| OpenAI Embeddings | 50K tokens | $5-15 |
| Application Insights | Monitoreo básico | $5-15 |
| Log Analytics | 1GB/mes | $2-5 |
| **Total** | | **$42-115** |

## 📚 Recursos Adicionales

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - Guía detallada de despliegue con resolución de problemas
- [Documentación de Plantillas ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Documentación de Azure AI Services](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - Resultados de validación de archivos

## 🆘 Resolución Rápida de Problemas

### Problemas Comunes
- **Autenticación**: Ejecuta `az login` para autenticarte
- **Límites de Cuota**: Verifica la disponibilidad del modelo OpenAI en la región objetivo
- **Conflictos de Nombres**: Usa un parámetro `uniqueSuffix` diferente
- **Permisos**: Asegúrate de que tu cuenta tenga el rol de Colaborador en la suscripción

### Obtener Ayuda
- Consulta [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) para resolución de problemas detallada
- Revisa los registros de despliegue en el Portal de Azure
- Visita [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues)

---

Para la configuración completa del proyecto, consulta el [README principal](../../README.md) o el [recorrido del proyecto](../../walkthrough/README.md).

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.