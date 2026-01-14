# OpenapiClient::AFNORSearchSiret

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filters** | [**AFNORSearchSiretFilters**](AFNORSearchSiretFilters.md) |  | [optional] |
| **sorting** | [**Array&lt;AFNORSearchSiretSortingInner&gt;**](AFNORSearchSiretSortingInner.md) | Sorting criteria on a field and an order (ascending or descending). | [optional] |
| **fields** | [**Array&lt;AFNORSiretField&gt;**](AFNORSiretField.md) | Allows you to filter the desired fields in the response. | [optional] |
| **include** | **Array&lt;String&gt;** |  | [optional] |
| **limit** | **Integer** | Maximum number of results | [optional] |
| **ignore** | **Integer** | Number of results to skip | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSiret.new(
  filters: null,
  sorting: [{champ&#x3D;siret, order&#x3D;ascending}, {champ&#x3D;name, order&#x3D;descending}],
  fields: [siret, siren, name, facilityType, address, diffusible, administrativeStatus, pmStatus, pmOnly, managesPaymentStatus, managesLegalCommitment, managesLegalCommitmentOrService, serviceCodeStatus, idInstance],
  include: [siren],
  limit: 50,
  ignore: 20
)
```

