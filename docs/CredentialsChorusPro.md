# FactPulse::CredentialsChorusPro

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **piste_client_id** | **String** |  | [optional] |
| **piste_client_secret** | **String** |  | [optional] |
| **chorus_login** | **String** |  | [optional] |
| **chorus_password** | **String** |  | [optional] |
| **mode_sandbox** | **Boolean** | [MODE 2] Utiliser le mode sandbox (défaut: True) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::CredentialsChorusPro.new(
  piste_client_id: null,
  piste_client_secret: null,
  chorus_login: null,
  chorus_password: null,
  mode_sandbox: null
)
```

