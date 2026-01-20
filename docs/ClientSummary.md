# FactPulse::ClientSummary

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Unique client identifier |  |
| **name** | **String** | Client name |  |
| **siret** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **is_active** | **Boolean** | Whether the client is active |  |
| **has_config_pdp** | **Boolean** | Whether PDP config exists |  |
| **pdp_is_active** | **Boolean** |  | [optional] |
| **pdp_is_mock** | **Boolean** |  | [optional] |
| **has_config_chorus** | **Boolean** | Whether Chorus Pro config exists |  |
| **created_at** | **Time** | Creation date |  |
| **updated_at** | **Time** | Last update date |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ClientSummary.new(
  uid: null,
  name: null,
  siret: null,
  description: null,
  is_active: null,
  has_config_pdp: null,
  pdp_is_active: null,
  pdp_is_mock: null,
  has_config_chorus: null,
  created_at: null,
  updated_at: null
)
```

