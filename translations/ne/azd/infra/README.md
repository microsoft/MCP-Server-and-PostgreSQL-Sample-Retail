<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:24:30+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "ne"
}
-->
# पूर्वाधार टेम्प्लेटहरू

यो फोल्डरमा MCP Retail Analytics परियोजनाको पूर्वाधार परिनियोजन टेम्प्लेटहरू समावेश छन्।

## 📁 फाइलहरूको अवलोकन

| फाइल | विवरण | प्रयोग केस |
|------|-------------|----------|
| `azuredeploy.json` | **ARM टेम्प्लेट** - सम्पूर्ण सब्सक्रिप्शन-स्कोप परिनियोजन | सबै परिनियोजनहरूको लागि सिफारिस गरिएको |
| `azuredeploy.parameters.json` | **ARM प्यारामिटरहरू** - स्थिर कन्फिगरेसन मानहरू | `azuredeploy.json` सँग प्रयोग गरिन्छ |
| `ARM-DEPLOYMENT.md` | **ARM परिनियोजन गाइड** - विस्तृत निर्देशनहरू | सम्पूर्ण परिनियोजन दस्तावेजीकरण |
| `README.md` | **यो फाइल** - पूर्वाधारको अवलोकन | छिटो सन्दर्भ |

## 🚀 परिनियोजन विकल्पहरू

### विकल्प १: Azure CLI (सिफारिस गरिएको)
रिसोर्स समूह सिर्जनासहित सम्पूर्ण परिनियोजन:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### विकल्प २: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### विकल्प ३: Azure Portal
1. [Azure Portal](https://portal.azure.com) मा जानुहोस्
2. "Deploy a custom template" खोज्नुहोस्
3. `azuredeploy.json` अपलोड गर्नुहोस्
4. प्यारामिटरहरू कन्फिगर गरेर परिनियोजन गर्नुहोस्

## 🏗️ पूर्वाधार घटकहरू

ARM टेम्प्लेटले निम्न पूर्वाधार परिनियोजन गर्दछ:

- **रिसोर्स समूह**: सबै रिसोर्सहरूको लागि समान नामकरणको कन्टेनर
- **Log Analytics Workspace**: केन्द्रीय लगिङ र अनुगमन (३०-दिनको रिटेन्सन)
- **Application Insights**: एप्लिकेसन प्रदर्शन अनुगमन, Log Analytics सँग एकीकृत
- **Azure AI Services**: बहु-सेवा AI हब (S0 टियर) व्यवस्थापित पहिचानसहित
- **OpenAI मोडेलहरू**:
  - `gpt-4o-mini` (१२० क्षमता) - च्याट र कम्प्लिशन मोडेल
  - `text-embedding-3-small` (५० क्षमता) - टेक्स्ट एम्बेडिङहरू सेम्यान्टिक सर्चको लागि

## 🔧 टेम्प्लेट कन्फिगरेसन

### प्यारामिटरहरू
ARM टेम्प्लेटले निम्न अनुकूलन योग्य प्यारामिटरहरू स्वीकार गर्दछ:

| प्यारामिटर | डिफल्ट | विवरण |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | सबै रिसोर्स नामहरूको लागि प्रिफिक्स |
| `location` | `westus2` | परिनियोजनको लागि Azure क्षेत्र |
| `uniqueSuffix` | स्वतः उत्पन्न | ४-वर्णको अद्वितीय पहिचानकर्ता |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | प्रदर्शन नाम |
| `gptModelCapacity` | `120` | GPT मोडेल टोकन क्षमता |
| `embeddingModelCapacity` | `50` | एम्बेडिङ मोडेल क्षमता |

### रिसोर्स नामकरण परम्परा
सबै रिसोर्सहरूले निम्न ढाँचा अनुसरण गर्छन्: `{type}-{resourcePrefix}-{uniqueSuffix}`

उदाहरणहरू:
- रिसोर्स समूह: `rg-mcpretail-demo`
- AI सेवा: `fdy-mcpretail-demo`
- एप्लिकेसन इनसाइट्स: `appi-mcpretail-demo`

## 🔍 टेम्प्लेट मान्यता

### परिनियोजन अघि मान्यता गर्नुहोस्
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### परिनियोजन स्थिति जाँच गर्नुहोस्
```bash
az deployment sub list --output table
```


## 💰 लागत अनुमान

विकास कार्यभारको लागि अनुमानित मासिक लागत:

| सेवा | कन्फिगरेसन | अनुमानित लागत/महिना |
|---------|---------------|-----------------|
| Azure AI Services | S0 टियर | $15-50 |
| OpenAI GPT-4o-mini | १२०K टोकन | $15-30 |
| OpenAI Embeddings | ५०K टोकन | $5-15 |
| Application Insights | आधारभूत अनुगमन | $5-15 |
| Log Analytics | १GB/महिना | $2-5 |
| **कुल** | | **$42-115** |

## 📚 थप स्रोतहरू

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - समस्या समाधानसहित विस्तृत परिनियोजन गाइड
- [ARM टेम्प्लेट दस्तावेजीकरण](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI सेवाहरू दस्तावेजीकरण](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - फाइल मान्यता परिणामहरू

## 🆘 छिटो समस्या समाधान

### सामान्य समस्याहरू
- **प्रमाणीकरण**: `az login` चलाएर प्रमाणीकरण गर्नुहोस्
- **कोटा सीमा**: लक्षित क्षेत्रमा OpenAI मोडेल उपलब्धता जाँच गर्नुहोस्
- **नामकरण द्वन्द्वहरू**: फरक `uniqueSuffix` प्यारामिटर प्रयोग गर्नुहोस्
- **अनुमतिहरू**: खातामा सब्सक्रिप्शनमा Contributor भूमिका सुनिश्चित गर्नुहोस्

### सहयोग प्राप्त गर्नुहोस्
- विस्तृत समस्या समाधानको लागि [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) हेर्नुहोस्
- Azure Portal मा परिनियोजन लगहरू जाँच गर्नुहोस्
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) मा जानुहोस्

---

सम्पूर्ण परियोजना सेटअपको लागि, [मुख्य README](../../README.md) वा [परियोजना वाकथ्रु](../../walkthrough/README.md) हेर्नुहोस्।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी यथार्थताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। मूल दस्तावेज़ यसको मातृभाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौं।