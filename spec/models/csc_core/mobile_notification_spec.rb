require 'rails_helper'

module CscCore
  RSpec.describe MobileNotification, type: :model do
    it { is_expected.to belong_to(:creator).with_foreign_key(:creator_id).class_name("User") }
    it { is_expected.to validate_presence_of(:body) }
  end
end
