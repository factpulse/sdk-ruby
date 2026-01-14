# OpenapiClient::PDPCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_service_url** | **String** | Base URL of the AFNOR Flow Service |  |
| **directory_service_url** | **String** |  | [optional] |
| **token_url** | **String** | OAuth2 server URL |  |
| **client_id** | **String** | OAuth2 Client ID |  |
| **client_secret** | **String** | OAuth2 Client Secret (sensitive) |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PDPCredentials.new(
  flow_service_url: https://api.pdp-example.fr/flow/v1,
  directory_service_url: null,
  token_url: https://auth.pdp-example.fr/oauth/token,
  client_id: factpulse_prod_abc123,
  client_secret: secret_xyz789
)
```

