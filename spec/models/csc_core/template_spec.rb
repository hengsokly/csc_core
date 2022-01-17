require 'rails_helper'

module CscCore
  RSpec.describe Template, type: :model do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:program_id) }
  end
end
