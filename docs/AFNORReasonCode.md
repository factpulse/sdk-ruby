# FactPulse::AFNORReasonCode

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::AFNORReasonCode.openapi_one_of
# =>
# [
#   :'AFNORReasonCodeEnum',
#   :'String'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::AFNORReasonCode.build(data)
# => #<AFNORReasonCodeEnum:0x00007fdd4aab02a0>

FactPulse::AFNORReasonCode.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `AFNORReasonCodeEnum`
- `String`
- `nil` (if no type matches)

