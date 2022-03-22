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
require "rails_helper"

module CscCore
  RSpec.describe ParticipantsProfile, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
