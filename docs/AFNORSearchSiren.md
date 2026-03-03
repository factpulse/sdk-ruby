# FactPulse::AFNORSearchSiren

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filters** | [**AFNORSearchSirenFilters**](AFNORSearchSirenFilters.md) |  | [optional] |
| **sorting** | [**Array&lt;AFNORSearchSirenSortingInner&gt;**](AFNORSearchSirenSortingInner.md) | Sorting criteria on a field and an order (ascending or descending). | [optional] |
| **fields** | [**Array&lt;AFNORSirenField&gt;**](AFNORSirenField.md) | Allows you to filter the desired fields in the response. | [optional] |
| **limit** | **Integer** | Maximum number of results | [optional] |
| **ignore** | **Integer** | Number of results to skip | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiren.new(
  filters: null,
  sorting: [{field&#x3D;siren, order&#x3D;ascending}, {field&#x3D;administrativeStatus, order&#x3D;descending}],
  fields: [siren, businessName, entityType, administrativeStatus, instructions],
  limit: 50,
  ignore: 20
)
```

