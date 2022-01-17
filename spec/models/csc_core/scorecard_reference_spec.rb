require 'rails_helper'

module CscCore
  RSpec.describe ScorecardReference, type: :model do
    it { is_expected.to belong_to(:scorecard).with_foreign_key(:scorecard_uuid) }
  end
end
