# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  provider   :string
#  emails     :text             default([]), is an Array
#  message_id :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe Notification, type: :model do
    it { is_expected.to belong_to(:message) }
    it { is_expected.to have_one(:program) }
    it { is_expected.to have_many(:chat_groups_notifications) }
    it { is_expected.to have_many(:chat_groups).through(:chat_groups_notifications) }

    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_inclusion_of(:provider).in_array(%w(CscCore::Notifications::Telegram CscCore::Notifications::Email)) }
  end
end
