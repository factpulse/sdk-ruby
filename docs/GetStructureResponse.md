# FactPulse::GetStructureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** |  |  |
| **message** | **String** |  |  |
| **structure_id** | **Integer** |  | [optional] |
| **structure_identifier** | **String** |  | [optional] |
| **structure_label** | **String** |  | [optional] |
| **company_name** | **String** |  | [optional] |
| **vat_number** | **String** |  | [optional] |
| **structure_email** | **String** |  | [optional] |
| **parameters** | [**StructureParameters**](StructureParameters.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetStructureResponse.new(
  return_code: null,
  message: null,
  structure_id: null,
  structure_identifier: null,
  structure_label: null,
  company_name: null,
  vat_number: null,
  structure_email: null,
  parameters: null
)
```

