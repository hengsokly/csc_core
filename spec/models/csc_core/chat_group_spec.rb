# == Schema Information
#
# Table name: chat_groups
#
#  id         :bigint           not null, primary key
#  title      :string
#  chat_id    :string
#  actived    :boolean          default(TRUE)
#  reason     :text
#  provider   :string
#  program_id :integer
#  chat_type  :string           default("group")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe ChatGroup, type: :model do
    it { is_expected.to belong_to(:program) }
    it { is_expected.to have_many(:chat_groups_notifications) }
    it { is_expected.to have_many(:notifications).through(:chat_groups_notifications) }
  end
end
