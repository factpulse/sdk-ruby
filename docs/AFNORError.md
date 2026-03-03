# FactPulse::AFNORError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | Short numerical or alphanumerical code that identifies precisely a unique error. |  |
| **error_message** | **String** | Contains information on the error. Not intended to be displayed to an end user. For security reasons, a tradeoff between clarity &amp; security shall be found. | [optional] |
| **type** | **String** |  | [optional][default to &#39;about:blank&#39;] |
| **details** | **String** |  | [optional] |
| **instance** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORError.new(
  error_code: MISSING_REQUIRED_FIELD,
  error_message: Invalid request format,
  type: /path/reference-url,
  details: Error detailed description,
  instance: /chemin/url-de-reference#instance-du-contexte
)
```

