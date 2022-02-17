# frozen_string_literal: true

module CscCore
  module Samples
    module Scorecards
      class VotingIndicator
        def self.load(scorecard)
          predefineds = scorecard.facility.indicators.predefines
          customs = scorecard.facility.indicators.customs

          predefineds.take(4).each_with_index do |indi, index|
            scorecard.voting_indicators.create(
              indicatorable_id: indi["id"],
              indicatorable_type: "CscCore::Indicators::PredefineIndicator",
              indicator_uuid: indi["uuid"],
              indicator_activities_attributes: [
                { scorecard_uuid: scorecard.uuid, content: "action1_#{index}", selected: true, type: "CscCore::SuggestedIndicatorActivity" },
                { scorecard_uuid: scorecard.uuid, content: "action2_#{index}", selected: false, type: "CscCore::SuggestedIndicatorActivity" },
              ]
            )
          end

          customs.take(1).each do |indi|
            scorecard.voting_indicators.create(indicator_uuid: indi["uuid"], indicatorable_id: indi["id"], indicatorable_type: "CscCore::Indicators::CustomIndicator")
          end
        end
      end
    end
  end
end
