# FactPulse::AFNORSearchDirectoryLine

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **filters** | [**AFNORSearchDirectoryLineFilters**](AFNORSearchDirectoryLineFilters.md) |  | [optional] |
| **sorting** | [**Array&lt;AFNORSearchDirectoryLineSortingInner&gt;**](AFNORSearchDirectoryLineSortingInner.md) | Sorting criteria on a field and an order (ascending or descending). | [optional] |
| **fields** | [**Array&lt;AFNORDirectoryLineField&gt;**](AFNORDirectoryLineField.md) | Allows you to filter the desired fields in the response. | [optional] |
| **include** | **Array&lt;String&gt;** |  | [optional] |
| **limit** | **Integer** | Maximum number of results | [optional] |
| **ignore** | **Integer** | Number of results to skip | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchDirectoryLine.new(
  filters: null,
  sorting: [{field&#x3D;addressingIdentifier, order&#x3D;ascending}],
  fields: [addressingIdentifier, siren, siret, addressingSuffix, routingIdentifier],
  include: [siren, siret, routingCode],
  limit: 50,
  ignore: 0
)
```

