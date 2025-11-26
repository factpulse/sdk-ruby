# frozen_string_literal: true
require_relative 'helpers/exceptions'
require_relative 'helpers/client'
module FactPulse
  module Helpers
    def self.create_client(**opts); FactPulseClient.new(**opts); end
    def self.format_montant(m); MontantHelpers.montant(m); end
    def self.montant(m); MontantHelpers.montant(m); end
    def self.montant_total(*args, **kwargs); MontantHelpers.montant_total(*args, **kwargs); end
    def self.ligne_de_poste(*args, **kwargs); MontantHelpers.ligne_de_poste(*args, **kwargs); end
    def self.ligne_de_tva(*args, **kwargs); MontantHelpers.ligne_de_tva(*args, **kwargs); end
  end
end
