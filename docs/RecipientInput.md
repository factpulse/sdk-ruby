# FactPulse::RecipientInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **role** | **String** | Code rôle (BY, SE, WK, etc.) | [optional][default to &#39;BY&#39;] |
| **email** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RecipientInput.new(
  siren: null,
  siret: null,
  name: null,
  role: null,
  email: null
)
```

