require 'rails_helper'

module CscCore
  RSpec.describe VotingIndicator, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
    it { is_expected.to belong_to(:indicatorable) }
    it { is_expected.to have_many(:ratings).dependent(:destroy) }
    it { is_expected.to have_many(:raised_indicators) }
  end
end
