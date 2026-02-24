# FactPulse::VATEXCodesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **codes** | [**Array&lt;VATEXCodeInfo&gt;**](VATEXCodeInfo.md) |  |  |
| **count** | **Integer** |  |  |
| **source** | **String** |  | [optional][default to &#39;https://docs.peppol.eu/poacc/billing/3.0/codelist/vatex/&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::VATEXCodesResponse.new(
  codes: null,
  count: null,
  source: null
)
```

