# FactPulse::SearchStructureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **structure_identifier** | **String** |  | [optional] |
| **structure_identifier_type** | **String** |  | [optional] |
| **company_name** | **String** |  | [optional] |
| **restrict_private_structures** | **Boolean** | Limit search to private structures only | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SearchStructureRequest.new(
  credentials: null,
  structure_identifier: null,
  structure_identifier_type: null,
  company_name: null,
  restrict_private_structures: null
)
```

