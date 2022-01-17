module CscCore
  class CustomIndicator < ApplicationRecord
    self.table_name = "custom_indicators"

    include Indicatorable
    include Tagable

    mount_uploader :audio, AudioUploader

    belongs_to :scorecard, foreign_key: :scorecard_uuid

    validates :name, presence: true

    before_create :secure_uuid
  end
end
