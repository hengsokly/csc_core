require 'rails_helper'

module CscCore
  RSpec.describe ChatGroupsNotification, type: :model do
    it { is_expected.to belong_to(:notification) }
    it { is_expected.to belong_to(:chat_group) }
  end
end
