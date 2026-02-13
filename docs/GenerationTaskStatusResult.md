# FactPulse::GenerationTaskStatusResult

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::GenerationTaskStatusResult.openapi_one_of
# =>
# [
#   :'GenerationSuccessResult',
#   :'TaskErrorResult'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'factpulse'

FactPulse::GenerationTaskStatusResult.openapi_discriminator_name
# => :'status'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'factpulse'

FactPulse::GenerationTaskStatusResult.openapi_discriminator_mapping
# =>
# {
#   :'ERROR' => :'TaskErrorResult',
#   :'SUCCESS' => :'GenerationSuccessResult'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::GenerationTaskStatusResult.build(data)
# => #<GenerationSuccessResult:0x00007fdd4aab02a0>

FactPulse::GenerationTaskStatusResult.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `GenerationSuccessResult`
- `TaskErrorResult`
- `nil` (if no type matches)

