# frozen_string_literal: true

# == Schema Information
#
# Table name: languages
#
#  id         :bigint           not null, primary key
#  code       :string
#  name_en    :string
#  name_km    :string
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :uuid
#  deleted_at :datetime
#
module CscCore
  class Language < ApplicationRecord
    self.table_name = "languages"

    # Soft delete
    acts_as_paranoid if column_names.include? "deleted_at"

    belongs_to :program
    has_many :languages_indicators
    has_many :indicators, through: :languages_indicators
    has_many :scorecards, foreign_key: :language_conducted_code, primary_key: :code

    validates :code, presence: true
    validates :name_en, presence: true
    validates :name_km, presence: true

    def name
      self["name_#{I18n.locale}"]
    end

    def locked?
      scorecards.present?
    end

    def remove!
      return if locked?

      self.destroy
    end
  end
end
