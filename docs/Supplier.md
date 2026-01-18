# FactPulse::Supplier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_address** | [**ElectronicAddress**](ElectronicAddress.md) |  | [optional] |
| **supplier_id** | **Integer** |  |  |
| **private_id** | **String** |  | [optional] |
| **supplier_bank_account_code** | **Integer** |  | [optional] |
| **supplier_service_id** | **Integer** |  | [optional] |
| **name** | **String** |  | [optional] |
| **trading_business_name** | **String** |  | [optional] |
| **legal_description** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **vat_number** | **String** |  | [optional] |
| **iban** | **String** |  | [optional] |
| **bic** | **String** |  | [optional] |
| **bank_account_name** | **String** |  | [optional] |
| **proprietary_id** | **String** |  | [optional] |
| **postal_address** | [**PostalAddress**](PostalAddress.md) |  | [optional] |
| **contact** | [**Contact**](Contact.md) |  | [optional] |
| **global_ids** | [**Array&lt;ElectronicAddress&gt;**](ElectronicAddress.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Supplier.new(
  electronic_address: null,
  supplier_id: null,
  private_id: null,
  supplier_bank_account_code: null,
  supplier_service_id: null,
  name: null,
  trading_business_name: null,
  legal_description: null,
  siren: null,
  siret: null,
  vat_number: null,
  iban: null,
  bic: null,
  bank_account_name: null,
  proprietary_id: null,
  postal_address: null,
  contact: null,
  global_ids: null
)
```

