# FactPulse::ConversionTaskStatusResult

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::ConversionTaskStatusResult.openapi_one_of
# =>
# [
#   :'ConversionErrorResult',
#   :'ConversionPendingInputResult',
#   :'ConversionSuccessTaskResult',
#   :'ConversionValidationFailedResult'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'factpulse'

FactPulse::ConversionTaskStatusResult.openapi_discriminator_name
# => :'status'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'factpulse'

FactPulse::ConversionTaskStatusResult.openapi_discriminator_mapping
# =>
# {
#   :'ERROR' => :'ConversionErrorResult',
#   :'PENDING_INPUT' => :'ConversionPendingInputResult',
#   :'SUCCESS' => :'ConversionSuccessTaskResult',
#   :'VALIDATION_FAILED' => :'ConversionValidationFailedResult'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::ConversionTaskStatusResult.build(data)
# => #<ConversionErrorResult:0x00007fdd4aab02a0>

FactPulse::ConversionTaskStatusResult.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `ConversionErrorResult`
- `ConversionPendingInputResult`
- `ConversionSuccessTaskResult`
- `ConversionValidationFailedResult`
- `nil` (if no type matches)

