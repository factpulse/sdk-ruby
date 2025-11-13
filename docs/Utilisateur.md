# FactPulse::Utilisateur

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  |  |
| **username** | **String** |  |  |
| **email** | **String** |  |  |
| **is_active** | **Boolean** |  |  |
| **is_superuser** | **Boolean** |  | [optional][default to false] |
| **is_staff** | **Boolean** |  | [optional][default to false] |
| **bypass_quota** | **Boolean** |  | [optional][default to false] |
| **team_id** | **Integer** |  | [optional] |
| **has_quota** | **Boolean** |  | [optional][default to true] |
| **quota_info** | [**QuotaInfo**](QuotaInfo.md) |  | [optional] |
| **is_trial** | **Boolean** |  | [optional][default to false] |
| **client_uid** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Utilisateur.new(
  id: null,
  username: null,
  email: null,
  is_active: null,
  is_superuser: null,
  is_staff: null,
  bypass_quota: null,
  team_id: null,
  has_quota: null,
  quota_info: null,
  is_trial: null,
  client_uid: null
)
```

