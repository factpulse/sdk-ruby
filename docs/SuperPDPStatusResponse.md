# FactPulse::SuperPDPStatusResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **connected** | **Boolean** | Whether this client has connected its SuperPDP account |  |
| **connected_at** | **Time** |  | [optional] |
| **expires_at** | **Time** |  | [optional] |
| **mode_sandbox** | **Boolean** |  | [optional] |
| **last_error** | **String** | Last token refresh error, if any | [optional][default to &#39;&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SuperPDPStatusResponse.new(
  connected: null,
  connected_at: null,
  expires_at: null,
  mode_sandbox: null,
  last_error: null
)
```

