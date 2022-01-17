module CscCore
  class ScorecardReference < ApplicationRecord
    self.table_name = "scorecard_references"
    # Uploader
    mount_uploader :attachment, AttachmentUploader

    before_create :secure_uuid

    belongs_to :scorecard, primary_key: "uuid", foreign_key: "scorecard_uuid"

    validates :attachment, presence: true
  end
end
