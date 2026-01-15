# frozen_string_literal: true
module FactPulse
  module Helpers
    class FactPulseError < StandardError; end
    class FactPulseAuthError < FactPulseError; end
    class FactPulsePollingTimeout < FactPulseError
      attr_reader :task_id, :timeout
      def initialize(task_id, timeout); @task_id, @timeout = task_id, timeout; super("Timeout (#{timeout}ms) for #{task_id}"); end
    end
    class ValidationErrorDetail
      attr_accessor :level, :item, :reason, :source, :code
      def initialize(level: '', item: '', reason: '', source: nil, code: nil); @level, @item, @reason, @source, @code = level, item, reason, source, code; end
      def to_s; "[#{@item.to_s.empty? ? 'unknown' : @item}] #{@reason.to_s.empty? ? 'Unknown error' : @reason}"; end
      def self.from_hash(h); new(level: h['level']||'', item: h['item']||'', reason: h['reason']||'', source: h['source'], code: h['code']); end
    end
    class FactPulseValidationError < FactPulseError
      attr_reader :errors
      def initialize(msg, errors = []); @errors = errors; super(errors.empty? ? msg : "#{msg}\n\nDetails:\n#{errors.map{|e| "  - #{e}"}.join("\n")}"); end
    end
  end
end
