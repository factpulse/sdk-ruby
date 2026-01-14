# OpenapiClient::AFNORRoutingCodePost201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **Integer** | Platform instance identifier in the directory | [optional] |
| **siret** | **String** | SIRET Number | [optional] |
| **routing_identifier** | **String** | Routing identifier od a routing code. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORRoutingCodePost201Response.new(
  id_instance: 120,
  siret: 70204275500240,
  routing_identifier: dcsc456sdcsdcs556
)
```

