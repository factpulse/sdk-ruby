# FactPulse::StatusCodesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **codes** | [**Array&lt;StatusCodeInfo&gt;**](StatusCodeInfo.md) | Liste des codes statut |  |
| **count** | **Integer** | Nombre de codes |  |
| **source** | **String** | Règle source | [optional][default to &#39;BR-FR-CDV-CL-06&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::StatusCodesResponse.new(
  codes: null,
  count: null,
  source: null
)
```

