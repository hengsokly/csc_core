# frozen_string_literal: true

# == Schema Information
#
# Table name: datasets
#
#  id          :uuid             not null, primary key
#  code        :string
#  name_en     :string
#  name_km     :string
#  category_id :string
#  province_id :string
#  district_id :string
#  commune_id  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

module CscCore
  RSpec.describe Dataset, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
