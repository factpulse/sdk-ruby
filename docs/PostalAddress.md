# FactPulse::PostalAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **postal_code** | **String** |  | [optional] |
| **line_one** | **String** |  | [optional] |
| **line_two** | **String** |  | [optional] |
| **city** | **String** |  | [optional] |
| **country_code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PostalAddress.new(
  postal_code: null,
  line_one: null,
  line_two: null,
  city: null,
  country_code: null
)
```

