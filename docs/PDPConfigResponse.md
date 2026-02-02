# FactPulse::PDPConfigResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_configured** | **Boolean** | Whether PDP config exists |  |
| **id** | **Integer** |  | [optional] |
| **is_active** | **Boolean** |  | [optional] |
| **mode_sandbox** | **Boolean** |  | [optional] |
| **flow_service_url** | **String** |  | [optional] |
| **token_url** | **String** |  | [optional] |
| **oauth_client_id** | **String** |  | [optional] |
| **encryption_mode** | **String** |  | [optional] |
| **secret_status** | [**SecretStatus**](SecretStatus.md) |  | [optional] |
| **last_test_at** | **Time** |  | [optional] |
| **last_test_success** | **Boolean** |  | [optional] |
| **last_test_error** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **updated_at** | **Time** |  | [optional] |
| **message** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PDPConfigResponse.new(
  is_configured: null,
  id: null,
  is_active: null,
  mode_sandbox: null,
  flow_service_url: null,
  token_url: null,
  oauth_client_id: null,
  encryption_mode: null,
  secret_status: null,
  last_test_at: null,
  last_test_success: null,
  last_test_error: null,
  created_at: null,
  updated_at: null,
  message: null
)
```

