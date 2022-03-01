# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id                    :string
#  uuid                  :string           default("uuid_generate_v4()"), not null, primary key
#  score                 :integer
#  scorecard_uuid        :string
#  voting_indicator_uuid :string
#  participant_uuid      :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
module CscCore
  class Rating < ApplicationRecord
    self.table_name = "ratings"

    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true
    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :participant, foreign_key: :participant_uuid, optional: true

    before_create :secure_uuid
  end
end
