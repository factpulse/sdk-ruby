# FactPulse::PDPConfigUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_active** | **Boolean** | Whether config is active | [optional][default to true] |
| **mode_sandbox** | **Boolean** | Sandbox mode | [optional][default to false] |
| **flow_service_url** | **String** | PDP Flow Service URL |  |
| **token_url** | **String** | PDP OAuth token URL |  |
| **oauth_client_id** | **String** | OAuth Client ID |  |
| **client_secret** | **String** | OAuth Client Secret (sent but never returned) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PDPConfigUpdateRequest.new(
  is_active: null,
  mode_sandbox: null,
  flow_service_url: null,
  token_url: null,
  oauth_client_id: null,
  client_secret: null
)
```

