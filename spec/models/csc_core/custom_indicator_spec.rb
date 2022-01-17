require 'rails_helper'

module CscCore
  RSpec.describe CustomIndicator, type: :model do
    it { is_expected.to belong_to(:tag).optional }
    it { is_expected.to belong_to(:scorecard) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
