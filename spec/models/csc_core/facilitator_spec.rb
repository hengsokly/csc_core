require 'rails_helper'

module CscCore
  RSpec.describe Facilitator, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
  end
end
