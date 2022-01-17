require 'rails_helper'

module CscCore
  RSpec.describe ScorecardKnowledge, type: :model do
    it { is_expected.to have_many(:cafs) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name_en) }
    it { is_expected.to validate_presence_of(:name_km) }
  end
end
