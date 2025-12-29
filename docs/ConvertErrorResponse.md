# FactPulse::ConvertErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;error&#39;] |
| **error** | **String** | Code erreur |  |
| **message** | **String** | Message d&#39;erreur |  |
| **conversion_id** | **String** |  | [optional] |
| **resume_url** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConvertErrorResponse.new(
  status: null,
  error: null,
  message: null,
  conversion_id: null,
  resume_url: null
)
```

