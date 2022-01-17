require 'rails_helper'

module CscCore
  RSpec.describe Caf, type: :model do
    it { is_expected.to belong_to(:local_ngo) }
    it { is_expected.to belong_to(:educational_background).optional }
    it { is_expected.to belong_to(:scorecard_knowledge).optional }
    it { is_expected.to have_many(:facilitators) }
    it { is_expected.to have_many(:scorecards).through(:facilitators) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_inclusion_of(:sex).in_array(%w(female male other)).allow_nil }

    describe "soft delete" do
      let(:caf) { create(:caf) }

      context "with scorecards" do
        it "is soft delete" do
          expect { caf.destroy }.to change { Caf.only_deleted.count }.by 1
        end
      end
    end
  end
end
