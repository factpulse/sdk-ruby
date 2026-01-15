# FactPulse::FactureElectroniqueRestApiSchemasChorusProChorusProCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **piste_client_id** | **String** | PISTE Client ID (government API portal) |  |
| **piste_client_secret** | **String** | PISTE Client Secret |  |
| **chorus_pro_login** | **String** | Chorus Pro login |  |
| **chorus_pro_password** | **String** | Chorus Pro password |  |
| **sandbox** | **Boolean** | Use sandbox environment (true) or production (false) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureElectroniqueRestApiSchemasChorusProChorusProCredentials.new(
  piste_client_id: null,
  piste_client_secret: null,
  chorus_pro_login: null,
  chorus_pro_password: null,
  sandbox: null
)
```

