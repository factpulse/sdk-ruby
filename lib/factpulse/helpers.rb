# frozen_string_literal: true
require_relative 'helpers/exceptions'
require_relative 'helpers/client'

module FactPulse
  module Helpers
    def self.create_client(**opts); FactPulseClient.new(**opts); end
    def self.format_montant(m); FactPulseClient.format_montant(m); end
  end
end
