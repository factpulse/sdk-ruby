# frozen_string_literal: true

# Load client first (defines FactPulse::Error base class)
require_relative 'client'
# Then load additional exception types
require_relative 'exceptions'

module FactPulse
  module Helpers
    def self.create_client(**opts)
      FactPulse::Client.new(**opts)
    end
  end
end
