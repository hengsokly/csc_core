# frozen_string_literal: true

module CscCore
  module Messages
    class DateInterpreter
      def initialize(scorecard)
        @scorecard = scorecard
      end

      def load(field)
        send(field.to_sym) if respond_to?(field.to_sym)
      end

      def today
        I18n.l(Date.today)
      end
    end
  end
end
