require 'rails_helper'

module CscCore
  RSpec.describe ChatGroup, type: :model do
    it { is_expected.to belong_to(:program) }
    it { is_expected.to have_many(:chat_groups_notifications) }
    it { is_expected.to have_many(:notifications).through(:chat_groups_notifications) }
  end
end
