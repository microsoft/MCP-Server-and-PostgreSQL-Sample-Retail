<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "09c7975912db719927ad32946b55e621",
  "translation_date": "2025-09-30T13:24:08+00:00",
  "source_file": "azd/infra/README.md",
  "language_code": "mr"
}
-->
# इन्फ्रास्ट्रक्चर टेम्पलेट्स

या फोल्डरमध्ये MCP रिटेल अॅनालिटिक्स प्रकल्पासाठी इन्फ्रास्ट्रक्चर डिप्लॉयमेंट टेम्पलेट्स आहेत.

## 📁 फाइल्सचा आढावा

| फाइल | वर्णन | उपयोग |
|------|-------------|----------|
| `azuredeploy.json` | **ARM टेम्पलेट** - संपूर्ण सबस्क्रिप्शन-स्कोप डिप्लॉयमेंट | सर्व डिप्लॉयमेंटसाठी शिफारस |
| `azuredeploy.parameters.json` | **ARM पॅरामीटर्स** - स्थिर कॉन्फिगरेशन मूल्ये | `azuredeploy.json` सोबत वापरले जाते |
| `ARM-DEPLOYMENT.md` | **ARM डिप्लॉयमेंट मार्गदर्शक** - सविस्तर सूचना | संपूर्ण डिप्लॉयमेंट दस्तऐवज |
| `README.md` | **ही फाइल** - इन्फ्रास्ट्रक्चरचा आढावा | जलद संदर्भ |

## 🚀 डिप्लॉयमेंट पर्याय

### पर्याय 1: Azure CLI (शिफारस केलेले)
रिसोर्स ग्रुप तयार करून संपूर्ण डिप्लॉयमेंट:
```bash
az deployment sub create \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json \
  --parameters resourcePrefix=mcpretail uniqueSuffix=demo
```

### पर्याय 2: PowerShell
```powershell
New-AzSubscriptionDeployment `
  -Location "westus2" `
  -TemplateFile "azuredeploy.json" `
  -TemplateParameterFile "azuredeploy.parameters.json" `
  -resourcePrefix "mcpretail" `
  -uniqueSuffix "demo"
```

### पर्याय 3: Azure पोर्टल
1. [Azure पोर्टल](https://portal.azure.com) वर जा
2. "Deploy a custom template" शोधा
3. `azuredeploy.json` अपलोड करा
4. पॅरामीटर्स कॉन्फिगर करा आणि डिप्लॉय करा

## 🏗️ इन्फ्रास्ट्रक्चर घटक

ARM टेम्पलेट खालील इन्फ्रास्ट्रक्चर डिप्लॉय करते:

- **रिसोर्स ग्रुप**: सर्व संसाधनांसाठी सुसंगत नाव असलेला कंटेनर
- **लॉग अॅनालिटिक्स वर्कस्पेस**: केंद्रीय लॉगिंग आणि मॉनिटरिंग (30 दिवसांची रिटेन्शन)
- **अॅप्लिकेशन इनसाइट्स**: लॉग अॅनालिटिक्ससह समाकलित अॅप्लिकेशन कार्यक्षमता मॉनिटरिंग
- **Azure AI Services**: मल्टी-सर्व्हिस AI हब (S0 टियर) व्यवस्थापित ओळखीसह
- **OpenAI मॉडेल्स**:
  - `gpt-4o-mini` (120 क्षमता) - चॅट आणि पूर्णता मॉडेल
  - `text-embedding-3-small` (50 क्षमता) - सेमॅंटिक शोधासाठी टेक्स्ट एम्बेडिंग

## 🔧 टेम्पलेट कॉन्फिगरेशन

### पॅरामीटर्स
ARM टेम्पलेट खालील सानुकूल करण्यायोग्य पॅरामीटर्स स्वीकारते:

| पॅरामीटर | डीफॉल्ट | वर्णन |
|-----------|---------|-------------|
| `resourcePrefix` | `mcpretail` | सर्व संसाधनांच्या नावांसाठी प्रीफिक्स |
| `location` | `westus2` | डिप्लॉयमेंटसाठी Azure प्रदेश |
| `uniqueSuffix` | स्वयंचलित निर्मित | 4-अक्षरांचा अद्वितीय ओळखकर्ता |
| `aiProjectFriendlyName` | `MCP Retail Analytics Project` | डिस्प्ले नाव |
| `gptModelCapacity` | `120` | GPT मॉडेल टोकन क्षमता |
| `embeddingModelCapacity` | `50` | एम्बेडिंग मॉडेल क्षमता |

### संसाधन नामकरण पद्धत
सर्व संसाधने खालील नमुन्याचे अनुसरण करतात: `{type}-{resourcePrefix}-{uniqueSuffix}`

उदाहरणे:
- रिसोर्स ग्रुप: `rg-mcpretail-demo`
- AI सेवा: `fdy-mcpretail-demo`
- अॅप्लिकेशन इनसाइट्स: `appi-mcpretail-demo`

## 🔍 टेम्पलेट व्हॅलिडेशन

### डिप्लॉयमेंटपूर्वी व्हॅलिडेट करा
```bash
az deployment sub validate \
  --location westus2 \
  --template-file azuredeploy.json \
  --parameters @azuredeploy.parameters.json
```

### डिप्लॉयमेंट स्थिती तपासा
```bash
az deployment sub list --output table
```


## 💰 खर्चाचा अंदाज

विकसन कार्यभारासाठी अंदाजे मासिक खर्च:

| सेवा | कॉन्फिगरेशन | अंदाजे खर्च/महिना |
|---------|---------------|-----------------|
| Azure AI Services | S0 टियर | $15-50 |
| OpenAI GPT-4o-mini | 120K टोकन्स | $15-30 |
| OpenAI एम्बेडिंग्स | 50K टोकन्स | $5-15 |
| अॅप्लिकेशन इनसाइट्स | मूलभूत मॉनिटरिंग | $5-15 |
| लॉग अॅनालिटिक्स | 1GB/महिना | $2-5 |
| **एकूण** | | **$42-115** |

## 📚 अतिरिक्त संसाधने

- [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) - समस्या सोडवण्यासह सविस्तर डिप्लॉयमेंट मार्गदर्शक
- [ARM टेम्पलेट दस्तऐवज](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure AI Services दस्तऐवज](https://docs.microsoft.com/en-us/azure/cognitive-services/)
- [VALIDATION-SUMMARY.md](./VALIDATION-SUMMARY.md) - फाइल व्हॅलिडेशन परिणाम

## 🆘 जलद समस्या निवारण

### सामान्य समस्या
- **प्रमाणीकरण**: `az login` चालवून प्रमाणीकरण करा
- **कोटा मर्यादा**: लक्ष्य प्रदेशातील OpenAI मॉडेल उपलब्धता तपासा
- **नामकरण संघर्ष**: वेगळ्या `uniqueSuffix` पॅरामीटरचा उपयोग करा
- **परवानग्या**: खात्याकडे सबस्क्रिप्शनवर Contributor भूमिका असणे आवश्यक आहे

### मदत मिळवा
- सविस्तर समस्या निवारणासाठी [ARM-DEPLOYMENT.md](./ARM-DEPLOYMENT.md) पहा
- Azure पोर्टलमध्ये डिप्लॉयमेंट लॉग तपासा
- [GitHub Issues](https://github.com/microsoft/MCP-Server-and-PostgreSQL-Sample-Retail/issues) ला भेट द्या

---

संपूर्ण प्रकल्प सेटअपसाठी [मुख्य README](../../README.md) किंवा [प्रकल्प वॉकथ्रू](../../walkthrough/README.md) पहा.

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपयास लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.