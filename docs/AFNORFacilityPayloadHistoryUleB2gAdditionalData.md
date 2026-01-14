# OpenapiClient::AFNORFacilityPayloadHistoryUleB2gAdditionalData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pm** | **Boolean** | Indicates whether the public structure acts as project manager for work invoices in addition to receiving simple invoices. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **pm_only** | **Boolean** | Indicates whether the public structure only acts as a project manager; if so, it can only receive invoices for work. This attribute is only returned if the directory line is defined for a public structure at the SIREN/SIRET or SIREN/SIRET/Routing code level. | [optional] |
| **manages_payment_status** | **Boolean** | Indicates whether the public structure manages the payment status of invoices. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **manages_legal_commitment_code** | **Boolean** | Indicates whether the public structure requires a legal commitment number. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **manages_legal_commitment_or_service_code** | **Boolean** | Indicates whether the public structure requires a service code or a commitment code in its exchanges. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **service_code_status** | **Boolean** | Indicates whether the structure requires a service code. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORFacilityPayloadHistoryUleB2gAdditionalData.new(
  pm: true,
  pm_only: true,
  manages_payment_status: true,
  manages_legal_commitment_code: true,
  manages_legal_commitment_or_service_code: true,
  service_code_status: true
)
```

