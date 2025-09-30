<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3ef1c97c5c40577da3be422d29276383",
  "translation_date": "2025-09-30T12:19:11+00:00",
  "source_file": "azd/README.md",
  "language_code": "es"
}
-->
# Azure Developer CLI (azd) Guía Rápida

## 🚀 Despliega con Azure Developer CLI

Este proyecto es completamente compatible con Azure Developer CLI (azd) para el despliegue automatizado tanto de la infraestructura como de la aplicación del servidor MCP.

### Requisitos Previos

1. **Instalar Azure Developer CLI**:
   ```bash
   # Windows (winget)
   winget install microsoft.azurecli
   winget install Microsoft.AzureDeveloperCLI
   
   # macOS (brew)
   brew install azure-cli
   brew install azd
   
   # Linux
   curl -fsSL https://aka.ms/install-azd.sh | bash
   ```

2. **Iniciar sesión en Azure**:
   ```bash
   az login
   azd auth login
   ```

### 🎯 Despliegue con un solo comando

```bash
# Navigate to azd folder
cd azd

# Initialize new environment (first time only)
azd env new <your-environment-name>

# Set your preferred Azure location
azd env set AZURE_LOCATION westus2

# Deploy everything (infrastructure + application)
azd up
```

### 🔧 Flujo de trabajo de desarrollo

```bash
# Deploy only infrastructure changes
azd provision

# Deploy only application changes  
azd deploy

# View deployed resources
azd show

# View environment variables
azd env get-values

# Clean up all resources
azd down
```

### 📦 Qué se despliega

#### **Infraestructura**
- Grupo de recursos
- Espacio de trabajo de Log Analytics  
- Application Insights
- Servicios de Azure AI (con modelos OpenAI)
- Entorno de aplicaciones en contenedor

#### **Aplicación**
- Servidor MCP (Aplicación en contenedor)
- Monitoreo de salud habilitado
- Variables de entorno configuradas
- Integración con Application Insights

### 🌍 Variables de entorno

Después del despliegue, estas variables estarán disponibles automáticamente:

```bash
AZURE_RESOURCE_GROUP       # Resource group name
AZURE_LOCATION             # Deployment region
AZURE_OPENAI_ENDPOINT      # AI Services endpoint
AZURE_OPENAI_API_KEY       # AI Services key
AZURE_OPENAI_DEPLOYMENT_NAME # GPT model name
AZURE_OPENAI_EMBEDDING_DEPLOYMENT_NAME # Embedding model name
APPLICATIONINSIGHTS_CONNECTION_STRING  # Monitoring connection
```

### 🔍 Monitoreo y gestión

- **Portal de Azure**: Visualiza todos los recursos en tu grupo de recursos
- **Application Insights**: Monitorea el rendimiento y los registros de la aplicación
- **Aplicaciones en contenedor**: Consulta los registros y métricas de la aplicación
- **AI Studio**: Administra los despliegues de modelos OpenAI

### 📋 Resolución de problemas

#### **Problemas comunes**

1. **Ubicación no compatible**:
   ```bash
   azd env set AZURE_LOCATION eastus2
   ```

2. **Cuotas de recursos excedidas**:
   - Revisa los límites de tu suscripción en el Portal de Azure
   - Prueba con una región diferente

3. **Problemas de autenticación**:
   ```bash
   azd auth login --use-device-code
   ```

4. **Ver registros de despliegue**:
   ```bash
   azd show --output json
   ```

### 🔄 Alternativa: Despliegue manual

Si prefieres un despliegue manual, aún puedes usar la infraestructura en la carpeta `/infra`:

```bash
cd ../infra
./deploy.ps1  # Windows
./deploy.sh   # macOS/Linux
```

### 📚 Aprende más

- [Documentación de Azure Developer CLI](https://docs.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentación de Aplicaciones en Contenedor](https://docs.microsoft.com/azure/container-apps/)
- [Documentación de Servicios de Azure AI](https://docs.microsoft.com/azure/ai-services/)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.