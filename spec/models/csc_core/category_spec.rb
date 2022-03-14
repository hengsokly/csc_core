# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :uuid             not null, primary key
#  code       :string
#  name_en    :string
#  name_km    :string
#  hierarchy  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

module CscCore
  RSpec.describe Category, type: :model do
    it { is_expected.to have_many(:facilities) }
  end
end
