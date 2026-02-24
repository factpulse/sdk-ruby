# FactPulse::VATEXCodeInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | VATEX code (e.g. VATEX-EU-IC) |  |
| **name** | **String** | Short name (e.g. &#39;Intra-Community supply&#39;) |  |
| **description** | **String** | Detailed description / remark |  |
| **category** | **String** | Associated VAT category code (E, AE, K, G, O) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::VATEXCodeInfo.new(
  code: null,
  name: null,
  description: null,
  category: null
)
```

