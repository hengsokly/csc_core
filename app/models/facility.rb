# frozen_string_literal: true

# == Schema Information
#
# Table name: facilities
#
#  id             :bigint           not null, primary key
#  code           :string
#  name_en        :string
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  program_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dataset        :string
#  default        :boolean          default(FALSE)
#  name_km        :string
#
class Facility < CscCore::ApplicationRecord
  has_many :indicators, as: :categorizable
end
