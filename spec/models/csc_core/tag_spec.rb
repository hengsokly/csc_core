require 'rails_helper'

module CscCore
  RSpec.describe Tag, type: :model do
    it { is_expected.to have_many(:indicators) }
    it { is_expected.to have_many(:raised_indicators) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
