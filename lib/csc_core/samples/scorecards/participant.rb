# frozen_string_literal: true

module CscCore
  module Samples
    module Scorecards
      class Participant
        def self.load(scorecard)
          scorecard.number_of_female.to_i.times do |_i|
            create_participant(scorecard, "female")
          end

          other = scorecard.number_of_participant - scorecard.number_of_female
          other.times do |_i|
            create_participant(scorecard)
          end
        end

        def self.create_participant(scorecard, gender = nil)
          participant = scorecard.participants.create(
            age: rand(20..65),
            gender: CscCore::Participant::GENDERS.sample
          )

          participant.profile_ids = CscCore::Profile.pluck(:id).take(rand(1..4))
        end
      end
    end
  end
end
