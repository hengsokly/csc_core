# frozen_string_literal: true

# == Schema Information
#
# Table name: raised_indicators
#
#  id                    :bigint           not null, primary key
#  indicatorable_id      :integer
#  indicatorable_type    :string
#  scorecard_uuid        :string
#  tag_id                :integer
#  participant_uuid      :string
#  selected              :boolean          default(FALSE)
#  voting_indicator_uuid :string
#  indicator_uuid        :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
require "rails_helper"

module CscCore
  RSpec.describe RaisedIndicator, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
    it { is_expected.to belong_to(:indicatorable).optional }
    it { is_expected.to belong_to(:voting_indicator).optional }
  end
end
