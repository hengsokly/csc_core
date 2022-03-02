# frozen_string_literal: true

module CscCore
  module JsonBuilder
    class ParticipantJsonBuilder
      attr_accessor :scorecard

      def initialize(scorecard)
        @scorecard = scorecard
      end

      def build
        {
          total: scorecard.participants.length,
          profiles: build_profiles
        }
      end

      private
        # [
        #   { type: "female",  count: 10 },
        #   ...
        # ]
        def build_profiles
          profiles = [{ type: "female", count: scorecard.participants.select do |participant|
                                                 participant.gender == "female"
                                               end.length }]

          %w[disability minority poor_card youth].each do |type|
            profiles << { type: type, count: scorecard.participants.select do |participant|
                                               participant.send(type).nil?
                                             end.length }
          end

          profiles
        end
    end
  end
end
