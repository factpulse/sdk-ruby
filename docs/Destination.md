# FactPulse::Destination

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::Destination.openapi_one_of
# =>
# [
#   :'DestinationAFNOR',
#   :'DestinationChorusPro'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'factpulse'

FactPulse::Destination.openapi_discriminator_name
# => :'type'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'factpulse'

FactPulse::Destination.openapi_discriminator_mapping
# =>
# {
#   :'afnor' => :'DestinationAFNOR',
#   :'chorus_pro' => :'DestinationChorusPro'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::Destination.build(data)
# => #<DestinationAFNOR:0x00007fdd4aab02a0>

FactPulse::Destination.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `DestinationAFNOR`
- `DestinationChorusPro`
- `nil` (if no type matches)

