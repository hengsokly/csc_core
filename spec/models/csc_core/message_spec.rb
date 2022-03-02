# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text
#  milestone  :string
#  program_id :integer
#  actived    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe Message, type: :model do
    it { is_expected.to belong_to(:program) }

    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:milestone) }
    # it { is_expected.to validate_inclusion_of(:milestone).in_array(%w(female male other)).allow_nil }
  end
end
