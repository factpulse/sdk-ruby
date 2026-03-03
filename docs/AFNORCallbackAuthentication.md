# FactPulse::AFNORCallbackAuthentication

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::AFNORCallbackAuthentication.openapi_one_of
# =>
# [
#   :'AFNORBasicAuthentication',
#   :'AFNOROAuth2Authentication'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::AFNORCallbackAuthentication.build(data)
# => #<AFNORBasicAuthentication:0x00007fdd4aab02a0>

FactPulse::AFNORCallbackAuthentication.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `AFNORBasicAuthentication`
- `AFNOROAuth2Authentication`
- `nil` (if no type matches)

