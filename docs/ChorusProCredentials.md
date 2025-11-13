# FactPulse::ChorusProCredentials

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **piste_client_id** | **String** | Client ID PISTE (portail API gouvernement) |  |
| **piste_client_secret** | **String** | Client Secret PISTE |  |
| **chorus_pro_login** | **String** | Login Chorus Pro |  |
| **chorus_pro_password** | **String** | Mot de passe Chorus Pro |  |
| **sandbox** | **Boolean** | Utiliser l&#39;environnement sandbox (true) ou production (false) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ChorusProCredentials.new(
  piste_client_id: null,
  piste_client_secret: null,
  chorus_pro_login: null,
  chorus_pro_password: null,
  sandbox: null
)
```

