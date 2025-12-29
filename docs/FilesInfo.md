# FactPulse::FilesInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **facturx_pdf** | [**FileInfo**](FileInfo.md) |  | [optional] |
| **xml** | [**FileInfo**](FileInfo.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FilesInfo.new(
  facturx_pdf: null,
  xml: null
)
```

