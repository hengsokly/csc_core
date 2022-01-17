require 'rails_helper'

module CscCore
  RSpec.describe RatingScale, type: :model do
    it { is_expected.to belong_to(:program) }
    it { is_expected.to have_many(:language_rating_scales).dependent(:destroy) }
  end
end
