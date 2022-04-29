# frozen_string_literal: true

module CscCore
  module Indicators
    module Removing
      extend ActiveSupport::Concern

      included do
        def remove!
          return if locked?

          self.destroy
        end

        def locked?
          raised_indicators.present? || voting_indicators.present?
        end
      end
    end
  end
end
