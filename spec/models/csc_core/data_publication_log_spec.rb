require 'rails_helper'

module CscCore
  RSpec.describe DataPublicationLog, type: :model do
    it { is_expected.to belong_to(:program) }
  end
end
