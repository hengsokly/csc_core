module CscCore
  class Rating < ApplicationRecord
    self.table_name = "ratings"

    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true
    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :participant, foreign_key: :participant_uuid, optional: true

    before_create :secure_uuid
  end
end
