# frozen_string_literal: true
require_relative 'helpers/exceptions'
require_relative 'helpers/client'
module FactPulse
  module Helpers
    def self.create_client(**opts); FactPulseClient.new(**opts); end
    def self.format_amount(m); AmountHelpers.amount(m); end
    def self.amount(m); AmountHelpers.amount(m); end
    def self.invoice_totals(*args, **kwargs); AmountHelpers.invoice_totals(*args, **kwargs); end
    def self.invoice_line(*args, **kwargs); AmountHelpers.invoice_line(*args, **kwargs); end
    def self.vat_line(*args, **kwargs); AmountHelpers.vat_line(*args, **kwargs); end
  end
end
