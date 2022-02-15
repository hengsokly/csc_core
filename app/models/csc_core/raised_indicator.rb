module CscCore
  class RaisedIndicator < ApplicationRecord
    self.table_name = "raised_indicators"

    include Tagable

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :indicatorable, polymorphic: true
    belongs_to :indicator, foreign_key: :indicator_uuid, primary_key: :uuid, optional: true
    belongs_to :tag, optional: true
    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true

    scope :selecteds, -> { where(selected: true) }

    after_validation :set_indicator_uuid

    private
      def set_indicator_uuid
        self.indicator_uuid ||= indicatorable.try(:uuid)
      end
  end
end
