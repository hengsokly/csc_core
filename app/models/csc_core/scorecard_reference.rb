# frozen_string_literal: true

# == Schema Information
#
# Table name: scorecard_references
#
#  id             :bigint           not null, primary key
#  uuid           :string
#  scorecard_uuid :string
#  attachment     :string
#  kind           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
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
