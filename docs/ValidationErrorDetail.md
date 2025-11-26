# FactPulse::ValidationErrorDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **level** | [**ErrorLevel**](ErrorLevel.md) | Niveau de gravité : &#39;Error&#39; ou &#39;Warning&#39; | [optional] |
| **item** | **String** | Identifiant de l&#39;élément concerné (XPath, champ, règle BR-FR, etc.) |  |
| **reason** | **String** | Description de l&#39;erreur |  |
| **source** | [**ErrorSource**](ErrorSource.md) |  | [optional] |
| **code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidationErrorDetail.new(
  level: null,
  item: null,
  reason: null,
  source: null,
  code: null
)
```

