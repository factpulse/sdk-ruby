# FactPulse::ValidationTaskStatusResult

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::ValidationTaskStatusResult.openapi_one_of
# =>
# [
#   :'TaskErrorResult',
#   :'ValidationSuccessTaskResult'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'factpulse'

FactPulse::ValidationTaskStatusResult.openapi_discriminator_name
# => :'status'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'factpulse'

FactPulse::ValidationTaskStatusResult.openapi_discriminator_mapping
# =>
# {
#   :'ERROR' => :'TaskErrorResult',
#   :'SUCCESS' => :'ValidationSuccessTaskResult'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::ValidationTaskStatusResult.build(data)
# => #<TaskErrorResult:0x00007fdd4aab02a0>

FactPulse::ValidationTaskStatusResult.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `TaskErrorResult`
- `ValidationSuccessTaskResult`
- `nil` (if no type matches)

