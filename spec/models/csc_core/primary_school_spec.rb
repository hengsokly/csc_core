require 'rails_helper'

module CscCore
  RSpec.describe PrimarySchool, type: :model do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name_km) }
    it { is_expected.to validate_presence_of(:name_en) }
    it { is_expected.to validate_presence_of(:commune_id) }
  end
end
