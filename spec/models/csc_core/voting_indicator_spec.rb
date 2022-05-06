# frozen_string_literal: true

# == Schema Information
#
# Table name: voting_indicators
#
#  id                 :string
#  uuid               :string           default("uuid_generate_v4()"), not null, primary key
#  indicatorable_id   :integer
#  indicatorable_type :string
#  scorecard_uuid     :string
#  median             :integer
#  strength           :text
#  weakness           :text
#  suggested_action   :text
#  display_order      :integer
#  indicator_uuid     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "rails_helper"

module CscCore
  RSpec.describe VotingIndicator, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
    it { is_expected.to belong_to(:indicatorable).optional }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
    it { is_expected.to have_many(:raised_indicators) }
  end
end
