# FactPulse::ConvertResumeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **overrides** | **Hash&lt;String, Object&gt;** | Sous-ensemble de FacturXInvoice a mettre a jour (merge profond) | [optional] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Mode de livraison webhook: &#39;inline&#39; ou &#39;download_url&#39; | [optional][default to &#39;inline&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConvertResumeRequest.new(
  overrides: null,
  callback_url: null,
  webhook_mode: null
)
```

