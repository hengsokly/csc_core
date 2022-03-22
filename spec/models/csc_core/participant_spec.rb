# frozen_string_literal: true

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
require "rails_helper"

module CscCore
  RSpec.describe Participant, type: :model do
    it { is_expected.to belong_to(:scorecard).optional }

    describe "#after_create, update_profiles" do
      let!(:scorecard) { create(:scorecard) }
      let!(:participant) { create(:participant, scorecard: scorecard) }
      let(:id_poor)  { CscCore::Profile.find_by code: "PO" }
      let(:ethnic)  { CscCore::Profile.find_by code: "ET" }

      before {
        CscCore::Profile.create_defaults
        participant.profile_ids = [id_poor.id]
        participant.update(poor_card: true, minority: true)
      }

      it { expect(participant.profile_ids.length).to eq(2) }
      it { expect(participant.profile_ids).to include(id_poor.id) }
      it { expect(participant.profile_ids).to include(ethnic.id) }
    end
  end
end
