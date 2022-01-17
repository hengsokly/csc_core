module CscCore
  class Language < ApplicationRecord
    self.table_name = "languages"

    belongs_to :program
    has_many :languages_indicators
    has_many :indicators, through: :languages_indicators

    validates :code, presence: true
    validates :name_en, presence: true
    validates :name_km, presence: true

    def name
      self["name_#{I18n.locale}"]
    end
  end
end
