# FactPulse::SuperPDPDisconnectResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** | Whether the disconnection completed successfully |  |
| **deleted** | **Boolean** | Whether a SuperPDP connection existed and was removed |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SuperPDPDisconnectResponse.new(
  success: null,
  deleted: null
)
```

