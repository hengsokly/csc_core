# frozen_string_literal: true

# == Schema Information
#
# Table name: facilities
#
#  id             :bigint           not null, primary key
#  code           :string
#  name_en        :string
#  name_km        :string
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  program_id     :integer
#  dataset        :string
#  default        :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :string
#
module CscCore
  class Facility < ApplicationRecord
    self.table_name = "facilities"

    include CscCore::Categorizable

    attr_accessor :has_child

    acts_as_nested_set scope: [:program_id]

    belongs_to :program
    belongs_to :category, optional: true
    has_many :unit_scorecards, foreign_key: :unit_type_id, class_name: "CscCore::Scorecard"
    has_many :scorecards, foreign_key: :facility_id

    validates :name_en, presence: true
    validates :name_km, presence: true
    validates :code, presence: true
    validates :category_id, presence: true, if: -> { has_child }

    delegate :name, to: :category, prefix: true, allow_nil: true

    DATASETS = [
      { code: "ps", name_en: "Primary School", name_km: "បឋមសិក្សា", dataset: "PrimarySchool" }
    ].freeze

    def has_child
      @has_child == "on" || dataset.present?
    end

    def name
      self["name_#{I18n.locale}"]
    end

    def locked?
      default? || unit_scorecards.present? || scorecards.present?
    end
  end
end
