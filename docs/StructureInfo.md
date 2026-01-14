# OpenapiClient::StructureInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **structure_id** | **Integer** | Chorus Pro structure ID |  |
| **structure_identifier** | **String** | Identifier (SIRET, SIREN) |  |
| **structure_name** | **String** | Structure name |  |
| **structure_identifier_type** | **String** | Identifier type |  |
| **status** | **String** | Status (ACTIVE, INACTIVE) |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::StructureInfo.new(
  structure_id: null,
  structure_identifier: null,
  structure_name: null,
  structure_identifier_type: null,
  status: null
)
```

