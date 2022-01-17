require 'rails_helper'

module CscCore
  RSpec.describe Language, type: :model do
    it { is_expected.to belong_to(:program) }
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name_en) }
    it { is_expected.to validate_presence_of(:name_km) }
  end
end
