require 'rails_helper'

module CscCore
  RSpec.describe RaisedIndicator, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
    it { is_expected.to belong_to(:indicatorable) }
    it { is_expected.to belong_to(:voting_indicator).optional }
  end
end
