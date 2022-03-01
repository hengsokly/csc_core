# frozen_string_literal: true

# == Schema Information
#
# Table name: educational_backgrounds
#
#  id         :bigint           not null, primary key
#  code       :string
#  name_en    :string
#  name_km    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module CscCore
  class EducationalBackground < ApplicationRecord
    self.table_name = "educational_backgrounds"

    has_many :cafs

    validates :code, presence: true
    validates :name_en, presence: true
    validates :name_km, presence: true

    def name
      self["name_#{I18n.locale}"]
    end
  end
end
