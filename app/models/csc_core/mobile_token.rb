module CscCore
  class MobileToken < ApplicationRecord
    self.table_name = "mobile_tokens"

    validates :token, presence: true
  end
end
