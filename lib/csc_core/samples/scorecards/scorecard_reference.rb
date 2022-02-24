# frozen_string_literal: true

module CscCore
  module Samples
    module Scorecards
      class ScorecardReference
        def self.load(scorecard)
          scorecard.scorecard_references.create(kind: "swot_result", attachment: File.open("#{CscCore::Engine.root}/lib/csc_core/testing_support/fixtures/images/reference_image.png"))
        end
      end
    end
  end
end
