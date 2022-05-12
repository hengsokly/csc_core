# frozen_string_literal: true

# == Schema Information
#
# Table name: scorecard_knowledges
#
#  id               :bigint           not null, primary key
#  code             :string
#  name_en          :string
#  name_km          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shortcut_name_en :string
#  shortcut_name_km :string
#
require "rails_helper"

module CscCore
  RSpec.describe ScorecardKnowledge, type: :model do
    it { is_expected.to have_many(:cafs_scorecard_knowledges) }
    it { is_expected.to have_many(:cafs).through(:cafs_scorecard_knowledges) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name_en) }
    it { is_expected.to validate_presence_of(:name_km) }
  end
end
