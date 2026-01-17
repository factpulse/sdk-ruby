# FactPulse::ActionCodesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **codes** | [**Array&lt;ActionCodeInfo&gt;**](ActionCodeInfo.md) | Liste des codes action |  |
| **count** | **Integer** | Nombre de codes |  |
| **source** | **String** | Règle source | [optional][default to &#39;BR-FR-CDV-CL-10&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ActionCodesResponse.new(
  codes: null,
  count: null,
  source: null
)
```

