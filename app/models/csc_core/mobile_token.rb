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
module CscCore
  class MobileToken < ApplicationRecord
    self.table_name = "mobile_tokens"

    validates :token, presence: true
  end
end
