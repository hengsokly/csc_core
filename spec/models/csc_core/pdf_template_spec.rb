require 'rails_helper'

module CscCore
  RSpec.describe PdfTemplate, type: :model do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:language_code) }
    it { is_expected.to validate_uniqueness_of(:language_code).scoped_to(:program_id) }
  end
end
