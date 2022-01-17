require 'rails_helper'

module CscCore
  RSpec.describe MobileToken, type: :model do
    it { is_expected.to validate_presence_of(:token) }
  end
end
