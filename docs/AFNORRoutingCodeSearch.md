# OpenapiClient::AFNORRoutingCodeSearch

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filters** | [**AFNORRoutingCodeSearchFilters**](AFNORRoutingCodeSearchFilters.md) |  | [optional] |
| **sorting** | [**Array&lt;AFNORRoutingCodeSearchSortingInner&gt;**](AFNORRoutingCodeSearchSortingInner.md) | Sorting criteria on a field and an order (ascending or descending). | [optional] |
| **fields** | [**Array&lt;AFNORRoutingCodeField&gt;**](AFNORRoutingCodeField.md) | Allows you to filter the desired fields in the response. | [optional] |
| **include** | **Array&lt;String&gt;** |  | [optional] |
| **limit** | **Integer** | Maximum number of results | [optional] |
| **ignore** | **Integer** | Number of results to skip | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORRoutingCodeSearch.new(
  filters: null,
  sorting: [{field&#x3D;siret, order&#x3D;ascendant}, {field&#x3D;routingIdentifier, order&#x3D;ascendant}],
  fields: [siret, routingIdentifierType, routingCodeName, routingIdentifier, managesLegalCommitmentCode, administrativeStatus, address, idInstance],
  include: [siren, siret],
  limit: 50,
  ignore: 20
)
```

