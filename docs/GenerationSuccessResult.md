# FactPulse::GenerationSuccessResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;SUCCESS&#39;] |
| **content_b64** | **String** |  | [optional] |
| **xml_content** | **String** |  | [optional] |
| **filename** | **String** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerationSuccessResult.new(
  status: null,
  content_b64: null,
  xml_content: null,
  filename: null
)
```

