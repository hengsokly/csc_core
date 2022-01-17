module CscCore
  class SuggestedAction < ApplicationRecord
    self.table_name = "suggested_actions"

    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true
    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true

    scope :selecteds, -> { where(selected: true) }
  end
end
