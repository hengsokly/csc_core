# frozen_string_literal: true

# == Schema Information
#
# Table name: participants_profiles
#
#  id             :uuid             not null, primary key
#  participant_id :string
#  profile_id     :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module CscCore
  class ParticipantsProfile < ApplicationRecord
    self.table_name = "participants_profiles"

    belongs_to :profile
    belongs_to :participant, optional: true
  end
end
