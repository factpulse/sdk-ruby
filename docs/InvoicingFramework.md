# FactPulse::InvoicingFramework

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoicing_framework_code** | [**InvoicingFrameworkCode**](InvoicingFrameworkCode.md) | Chorus Pro framework code (A1, A2, A9, A12) |  |
| **operation_nature** | [**OperationNature**](OperationNature.md) |  | [optional] |
| **approver_service_code** | **String** |  | [optional] |
| **approver_structure_code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoicingFramework.new(
  invoicing_framework_code: null,
  operation_nature: null,
  approver_service_code: null,
  approver_structure_code: null
)
```

