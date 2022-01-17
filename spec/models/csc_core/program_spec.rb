require 'rails_helper'

module CscCore
  RSpec.describe Program, type: :model do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:languages) }
    it { is_expected.to have_many(:facilities) }
    it { is_expected.to have_many(:local_ngos) }
    it { is_expected.to have_many(:rating_scales) }
    it { is_expected.to have_one(:data_publication).dependent(:destroy) }
    it { is_expected.to have_many(:data_publication_logs).dependent(:destroy) }

    describe "#after_create" do
      let!(:program) { create(:program) }

      it { expect(program.languages.length).to eq(1) }
    end

    describe "#after_create, create_dashboard_async" do
      it "adds a job to DashboardWorker" do
        expect {
          create(:program, :allow_callback)
        }.to change(DashboardWorker.jobs, :count)
      end
    end
  end
end
