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
require "rails_helper"

module CscCore
  RSpec.describe ScorecardReference, type: :model do
    it { is_expected.to belong_to(:scorecard).with_foreign_key(:scorecard_uuid) }
  end
end
