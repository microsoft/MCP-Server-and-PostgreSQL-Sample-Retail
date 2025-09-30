<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee91deccd2043611426905bac9610752",
  "translation_date": "2025-09-30T13:02:33+00:00",
  "source_file": "azd/infra/ARM-DEPLOYMENT.md",
  "language_code": "es"
}
-->
# Instrucciones de Implementación de Plantillas ARM

Este documento proporciona instrucciones para desplegar la infraestructura de MCP Retail Analytics utilizando la plantilla ARM.

## 📋 Resumen

La plantilla ARM `azuredeploy.json` ofrece un despliegue completo de:
- Grupo de recursos de Azure
- Espacio de trabajo de Log Analytics  
- Application Insights
- Servicios de Azure AI (Foundry)
- Despliegues de modelos OpenAI (GPT-4o-mini, text-embedding-3-small)

## 🚀 Opciones de Despliegue

### Opción 1: Despliegue con Azure CLI

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

### Opción 2: Despliegue con PowerShell

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

### Opción 3: Portal de Azure

1. Navega al [Portal de Azure](https://portal.azure.com)
2. Busca "Deploy a custom template" (Desplegar una plantilla personalizada)
3. Haz clic en "Build your own template in the editor" (Crear tu propia plantilla en el editor)
4. Copia y pega el contenido de `azuredeploy.json`
5. Haz clic en "Save" (Guardar) y luego en "Review + create" (Revisar y crear)
6. Completa los parámetros requeridos y despliega

## 🔧 Parámetros de la Plantilla

| Parámetro | Tipo | Predeterminado | Descripción |
|-----------|------|---------------|-------------|
| `resourcePrefix` | string | `mcpretail` | Prefijo para los nombres de los recursos |
| `location` | string | `westus2` | Región de Azure para el despliegue |
| `uniqueSuffix` | string | Generado automáticamente | Identificador único de 4 caracteres |
| `aiProjectFriendlyName` | string | `MCP Retail Analytics Project` | Nombre para mostrar del proyecto de AI |
| `aiProjectDescription` | string | Descripción del proyecto | Descripción mostrada en Azure AI Foundry |
| `gptModelCapacity` | int | `120` | Capacidad de tokens para el modelo GPT |
| `embeddingModelCapacity` | int | `50` | Capacidad de tokens para el modelo de embedding |
| `tags` | object | Etiquetas predeterminadas | Etiquetas de recursos para gobernanza |

## 📤 Salidas de la Plantilla

La plantilla proporciona las siguientes salidas:

| Salida | Descripción |
|--------|-------------|
| `subscriptionId` | ID de suscripción de Azure |
| `resourceGroupName` | Nombre del grupo de recursos creado |
| `aiFoundryName` | Nombre del servicio Azure AI Foundry |
| `foundryEndpoint` | URL del endpoint del servicio AI |
| `foundryAccountKey` | Clave de acceso al servicio AI |
| `deployedModels` | Array de modelos OpenAI desplegados |
| `applicationInsightsConnectionString` | Cadena de conexión de Application Insights |
| `logAnalyticsWorkspaceName` | Nombre del espacio de trabajo de Log Analytics |

## 🔍 Comandos de Verificación

Después del despliegue, verifica los recursos:

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

Este proyecto ofrece plantillas tanto en ARM como en Bicep:

### Plantilla ARM (`azuredeploy.json`)
- ✅ Formato nativo de Azure Resource Manager
- ✅ Funciona en cualquier lugar donde se soporte ARM
- ✅ No requiere herramientas adicionales
- ❌ Sintaxis JSON más extensa
- ❌ Más difícil de leer y mantener

### Plantilla Bicep (`main.bicep`)
- ✅ Sintaxis moderna y limpia
- ✅ Mejor soporte de herramientas e IntelliSense
- ✅ Más fácil de leer y mantener
- ✅ Validación en tiempo de compilación
- ❌ Requiere CLI de Bicep
- ❌ Paso adicional de compilación

**Recomendación**: Usa plantillas Bicep (`main.bicep`) para desarrollo y la plantilla ARM (`azuredeploy.json`) para escenarios que requieran JSON puro de ARM.

## 🔧 Personalización

### Agregar Recursos Personalizados

Para agregar recursos adicionales a la plantilla ARM:

1. Agrega la definición del recurso al array `resources` de la plantilla anidada
2. Agrega los nuevos parámetros a la sección `parameters`
3. Agrega las salidas correspondientes si es necesario
4. Actualiza el archivo de parámetros con valores predeterminados

### Ejemplo: Agregar una Cuenta de Almacenamiento

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

## 🐛 Resolución de Problemas

### Problemas Comunes

#### 1. Errores de Validación de Plantillas
```bash
# Validate template before deployment
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

#### 2. Conflictos de Nombres de Recursos
- Asegúrate de que `uniqueSuffix` sea realmente único
- Usa la función `uniqueString()` para generación automática
- Verifica los recursos existentes en la región objetivo

#### 3. Límites de Cuotas
- Verifica la disponibilidad de modelos OpenAI en la región objetivo
- Revisa las cuotas de suscripción para servicios de AI
- Considera usar diferentes regiones si se alcanzan los límites

#### 4. Problemas de Permisos
- Asegúrate de que la cuenta tenga el rol de Colaborador en la suscripción
- Verifica que la suscripción esté habilitada para servicios de AI
- Confirma el registro de proveedores de recursos

### Comandos de Depuración

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

## 🔐 Consideraciones de Seguridad

### Control de Acceso
- El servicio AI utiliza identidad administrada para acceso seguro
- El grupo de recursos proporciona un límite para RBAC
- Application Insights tiene controles de acceso separados

### Seguridad de Red
- El acceso a la red pública está habilitado por defecto
- Considera usar endpoints privados para producción
- Las ACL de red pueden configurarse para mayor seguridad

### Gestión de Claves
- Las claves del servicio AI se generan automáticamente
- Usa Azure Key Vault para secretos en producción
- Rota las claves regularmente para mayor seguridad

## 📚 Próximos Pasos

Después de un despliegue exitoso:

1. **Configura Variables de Entorno**:
   ```bash
   export AZURE_OPENAI_ENDPOINT="<foundryEndpoint>"
   export AZURE_OPENAI_KEY="<foundryAccountKey>"
   export APPLICATION_INSIGHTS_CONNECTION_STRING="<connectionString>"
   ```

2. **Inicia el Servidor MCP**:
   ```bash
   cd .. && docker compose up -d
   ```

3. **Prueba la Integración**:
   - Abre VS Code con el proyecto
   - Configura los servidores MCP en `.vscode/mcp.json`
   - Prueba el chat de AI con consultas de datos de retail

4. **Monitorea el Rendimiento**:
   - Visualiza métricas en Application Insights
   - Revisa los logs en el espacio de trabajo de Log Analytics
   - Configura alertas para eventos importantes

---

Para más información, consulta el [README principal](../README.md) o la [guía QUICKSTART](../QUICKSTART.md).

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.