module CscCore
  class RaisedIndicator < ApplicationRecord
    self.table_name = "raised_indicators"

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :indicatorable, polymorphic: true
    belongs_to :tag, optional: true
    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true

    scope :selecteds, -> { where(selected: true) }
  end
end
