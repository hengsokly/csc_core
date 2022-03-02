# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module CscCore
  class Tag < ApplicationRecord
    self.table_name = "tags"

    has_many :indicators
    has_many :raised_indicators

    validates :name, presence: true

    before_create :set_color

    private
      def set_color
        self.color = "##{format('%06x', (rand * 0xffffff))}"
      end
  end
end
