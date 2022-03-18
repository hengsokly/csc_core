# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id             :string
#  uuid           :string           not null, primary key
#  scorecard_uuid :string
#  age            :integer
#  gender         :string
#  disability     :boolean          default(FALSE)
#  minority       :boolean          default(FALSE)
#  poor_card      :boolean          default(FALSE)
#  youth          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module CscCore
  class Participant < ApplicationRecord
    self.table_name = "participants"

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    has_many :participants_profiles
    has_many :profiles, through: :participants_profiles

    before_create :secure_uuid
    # Will remove after api v1 is removed
    after_save :update_profiles

    GENDERS = %w[female male other].freeze
    FEMALE = "female"
    MALE = "male"
    OTHER = "other"

    def update_profiles
      { disability: "DI", minority: "ET", poor_card: "PO", youth: "YO" }.each do |key, value|
        next unless self[key]

        self.profile_ids = profile_ids | [ CscCore::Profile.find_by(code: value).try(:id) ]
      end
    end
  end
end
