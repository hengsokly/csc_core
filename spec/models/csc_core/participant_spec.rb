# == Schema Information
#
# Table name: participants
#
#  id             :string
#  uuid           :string           not null, primary key
#  scorecard_uuid :string
#  age            :integer
#  gender         :string
#  disability     :boolean          default(FALSE)
#  minority       :boolean          default(FALSE)
#  poor_card      :boolean          default(FALSE)
#  youth          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe Participant, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }
  end
end
