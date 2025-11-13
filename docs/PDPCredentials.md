# FactPulse::PDPCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_service_url** | **String** | URL de base du Flow Service AFNOR |  |
| **token_url** | **String** | URL du serveur OAuth2 |  |
| **client_id** | **String** | Client ID OAuth2 |  |
| **client_secret** | **String** | Client Secret OAuth2 (sensible) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PDPCredentials.new(
  flow_service_url: https://api.pdp-example.fr/flow/v1,
  token_url: https://auth.pdp-example.fr/oauth/token,
  client_id: factpulse_prod_abc123,
  client_secret: secret_xyz789
)
```

