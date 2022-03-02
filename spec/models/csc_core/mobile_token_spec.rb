# == Schema Information
#
# Table name: mobile_tokens
#
#  id         :bigint           not null, primary key
#  token      :string
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe MobileToken, type: :model do
    it { is_expected.to validate_presence_of(:token) }
  end
end
