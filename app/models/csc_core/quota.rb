# frozen_string_literal: true

# == Schema Information
#
# Table name: quotas
#
#  id              :uuid             not null, primary key
#  program_uuid    :string
#  scorecard_quota :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module CscCore
  class Quota < ApplicationRecord
    self.table_name = "quotas"

    belongs_to :program, optional: true

    validates_numericality_of :quantity, greater_than: 0, allow_nil: true

    def unlimited?
      quantity.nil?
    end

    def display
      unlimited? ? I18n.t("quota.unlimited") : quantity
    end
  end
end
