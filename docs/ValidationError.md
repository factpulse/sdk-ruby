# FactPulse::ValidationError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **loc** | [**Array&lt;LocationInner&gt;**](LocationInner.md) |  |  |
| **msg** | **String** |  |  |
| **type** | **String** |  |  |
| **input** | **Object** |  | [optional] |
| **ctx** | **Object** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidationError.new(
  loc: null,
  msg: null,
  type: null,
  input: null,
  ctx: null
)
```

