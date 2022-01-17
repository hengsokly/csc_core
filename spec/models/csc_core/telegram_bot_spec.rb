require 'rails_helper'

module CscCore
  RSpec.describe TelegramBot, type: :model do
    it { is_expected.to belong_to(:program) }
  end
end
