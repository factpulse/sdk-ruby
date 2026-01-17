# FactPulse::ReasonCodesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **codes** | [**Array&lt;ReasonCodeInfo&gt;**](ReasonCodeInfo.md) | Liste des codes motif |  |
| **count** | **Integer** | Nombre de codes |  |
| **source** | **String** | Règle source | [optional][default to &#39;BR-FR-CDV-CL-09&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReasonCodesResponse.new(
  codes: null,
  count: null,
  source: null
)
```

