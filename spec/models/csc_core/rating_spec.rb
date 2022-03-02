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
require "rails_helper"

module CscCore
  RSpec.describe Rating, type: :model do
    it { is_expected.to belong_to(:voting_indicator).optional }
    it { is_expected.to belong_to(:scorecard).optional }
    it { is_expected.to belong_to(:participant).optional }
  end
end
