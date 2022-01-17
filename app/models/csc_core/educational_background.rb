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
