module CscCore
  class Facilitator < ApplicationRecord
    self.table_name = "facilitators"

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :caf, -> { with_deleted }
  end
end
