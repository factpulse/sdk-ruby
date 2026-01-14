# OpenapiClient::MissingField

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **field** | **String** | Nom du champ |  |
| **bt_code** | **String** | Code Business Term (BT-XX) |  |
| **description** | **String** | Description du champ |  |
| **required_for** | **Array&lt;String&gt;** | Profils necessitant ce champ |  |
| **suggested_value** | **String** |  | [optional] |
| **confidence** | **Float** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::MissingField.new(
  field: null,
  bt_code: null,
  description: null,
  required_for: null,
  suggested_value: null,
  confidence: null
)
```

