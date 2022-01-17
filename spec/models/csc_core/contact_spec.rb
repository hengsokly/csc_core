require 'rails_helper'

module CscCore
  RSpec.describe Contact, type: :model do
    it { is_expected.to belong_to(:program).optional }

    it { is_expected.to validate_presence_of(:contact_type) }
    it { is_expected.to validate_presence_of(:value) }
  end
end
