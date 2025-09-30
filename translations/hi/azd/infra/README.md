<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:23:26+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "hi"
}
-->
# इंफ्रास्ट्रक्चर टेम्पलेट्स

यह फ़ोल्डर MCP रिटेल एनालिटिक्स प्रोजेक्ट के लिए इंफ्रास्ट्रक्चर डिप्लॉयमेंट टेम्पलेट्स को संग्रहीत करता है।

## 📁 फाइलों का अवलोकन

| फाइल | विवरण | उपयोग का मामला |
|------|-------|----------------|
| `azuredeploy.json` | **ARM टेम्पलेट** - संपूर्ण सब्सक्रिप्शन-स्कोप्ड डिप्लॉयमेंट | सभी डिप्लॉयमेंट्स के लिए अनुशंसित |
| `azuredeploy.parameters.json` | **ARM पैरामीटर्स** - स्थिर कॉन्फ़िगरेशन मान | `azuredeploy.json` के साथ उपयोग किया जाता है |
| `ARM-DEPLOYMENT.md` | **ARM डिप्लॉयमेंट गाइड** - विस्तृत निर्देश | संपूर्ण डिप्लॉयमेंट दस्तावेज़ |
| `README.md` | **यह फाइल** - इंफ्रास्ट्रक्चर का अवलोकन | त्वरित संदर्भ |

## 🚀 डिप्लॉयमेंट विकल्प

### विकल्प 1: Azure CLI (अनुशंसित)
रिसोर्स ग्रुप निर्माण के साथ संपूर्ण डिप्लॉयमेंट:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### विकल्प 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### विकल्प 3: Azure पोर्टल
1. [Azure पोर्टल](https://portal.azure.com) पर जाएं
2. "Deploy a custom template" खोजें
3. `azuredeploy.json` अपलोड करें
4. पैरामीटर्स कॉन्फ़िगर करें और डिप्लॉय करें

## 🏗️ इंफ्रास्ट्रक्चर घटक

ARM टेम्पलेट निम्नलिखित इंफ्रास्ट्रक्चर को डिप्लॉय करता है:

- **रिसोर्स ग्रुप**: सभी संसाधनों के लिए एक कंटेनर जिसमें सुसंगत नामकरण होता है
- **लॉग एनालिटिक्स वर्कस्पेस**: केंद्रीय लॉगिंग और मॉनिटरिंग (30-दिन की रिटेंशन)
- **एप्लिकेशन इनसाइट्स**: एप्लिकेशन प्रदर्शन मॉनिटरिंग जो लॉग एनालिटिक्स के साथ एकीकृत है
- **Azure AI सेवाएं**: मल्टी-सर्विस AI हब (S0 टियर) प्रबंधित पहचान के साथ
- **OpenAI मॉडल्स**:
  - `gpt-4o-mini` (120 क्षमता) - चैट और कंप्लीशन मॉडल
  - `text-embedding-3-small` (50 क्षमता) - टेक्स्ट एम्बेडिंग्स के लिए सेमांटिक सर्च

## 🔧 टेम्पलेट कॉन्फ़िगरेशन

### पैरामीटर्स
ARM टेम्पलेट निम्नलिखित कस्टमाइज़ेबल पैरामीटर्स को स्वीकार करता है:

| पैरामीटर | डिफ़ॉल्ट | विवरण |
|----------|----------|-------|
| `resourcePrefix` | `mcpretail` | सभी संसाधनों के नामों के लिए प्रीफिक्स |
| `location` | `westus2` | डिप्लॉयमेंट के लिए Azure क्षेत्र |
| `uniqueSuffix` | ऑटो-जनरेटेड | 4-अक्षर का यूनिक पहचानकर्ता |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | डिस्प्ले नाम |
| `gptModelCapacity` | `120` | GPT मॉडल टोकन क्षमता |
| `embeddingModelCapacity` | `50` | एम्बेडिंग मॉडल क्षमता |

### रिसोर्स नामकरण परंपरा
सभी संसाधन निम्नलिखित पैटर्न का पालन करते हैं: `{type}-{resourcePrefix}-{uniqueSuffix}`

उदाहरण:
- रिसोर्स ग्रुप: `rg-mcpretail-demo`
- AI सेवा: `fdy-mcpretail-demo`
- एप्लिकेशन इनसाइट्स: `appi-mcpretail-demo`

## 🔍 टेम्पलेट मान्यता

### डिप्लॉयमेंट से पहले मान्यता करें
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### डिप्लॉयमेंट स्थिति जांचें
```bash
az deployment sub list --output table
```


## 💰 लागत अनुमान

डेवलपमेंट वर्कलोड के लिए अनुमानित मासिक लागत:

| सेवा | कॉन्फ़िगरेशन | अनुमानित लागत/माह |
|------|-------------|--------------------|
| Azure AI सेवाएं | S0 टियर | $15-50 |
| OpenAI GPT-4o-mini | 120K टोकन | $15-30 |
| OpenAI एम्बेडिंग्स | 50K टोकन | $5-15 |
| एप्लिकेशन इनसाइट्स | बेसिक मॉनिटरिंग | $5-15 |
| लॉग एनालिटिक्स | 1GB/माह | $2-5 |
| **कुल** | | **$42-115** |

## 📚 अतिरिक्त संसाधन

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - विस्तृत डिप्लॉयमेंट गाइड और समस्या निवारण
- [ARM टेम्पलेट दस्तावेज़](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI सेवाएं दस्तावेज़](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - फाइल मान्यता परिणाम

## 🆘 त्वरित समस्या निवारण

### सामान्य समस्याएं
- **प्रमाणीकरण**: `az login` चलाकर प्रमाणित करें
- **कोटा सीमाएं**: लक्षित क्षेत्र में OpenAI मॉडल उपलब्धता जांचें
- **नामकरण संघर्ष**: अलग `uniqueSuffix` पैरामीटर का उपयोग करें
- **अनुमतियां**: सुनिश्चित करें कि खाते में सब्सक्रिप्शन पर Contributor भूमिका है

### सहायता प्राप्त करें
- विस्तृत समस्या निवारण के लिए [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) देखें
- Azure पोर्टल में डिप्लॉयमेंट लॉग जांचें
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) पर जाएं

---

पूर्ण प्रोजेक्ट सेटअप के लिए, [मुख्य README](../../README.md) या [प्रोजेक्ट वॉकथ्रू](../../walkthrough/README.md) देखें।

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।