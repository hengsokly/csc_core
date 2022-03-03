# frozen_string_literal: true

# == Schema Information
#
# Table name: programs
#
#  id                        :bigint           not null, primary key
#  name                      :string
#  datetime_format           :string           default("DD-MM-YYYY")
#  enable_email_notification :boolean          default(FALSE)
#  shortcut_name             :string
#  dashboard_user_emails     :text             default([]), is an Array
#  dashboard_user_roles      :string           default([]), is an Array
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  uuid                      :uuid
#
require "rails_helper"

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
        expect do
          create(:program, :allow_callback)
        end.to change(DashboardWorker.jobs, :count)
      end
    end

    describe "#quota_reached?" do
      context "unset quota quantity" do
        let!(:quota)   { create(:quota, quantity: nil) }
        let!(:program) { quota.program }

        it { expect(program.quota_reached?).to be_falsey }
      end

      context "quota quantity bigger than program scorecards quantity" do
        let!(:quota)   { create(:quota, quantity: 2) }
        let!(:program) { quota.program }
        let!(:scorecard) { create(:scorecard, program: program) }

        it { expect(program.quota_reached?).to be_falsey }
      end

      context "quota quantity equal to program scorecards quantity" do
        let!(:quota)   { create(:quota, quantity: 1) }
        let!(:program) { quota.program }
        let!(:scorecard) { create(:scorecard, program: program) }

        it { expect(program.quota_reached?).to be_truthy }
      end
    end

    describe "#quota_warning?" do
      context "unset quota quantity" do
        let!(:quota)   { create(:quota, quantity: nil) }
        let!(:program) { quota.program }

        it { expect(program.quota_warning?).to be_falsey }
      end

      context "quota quantity reach 70%" do
        let!(:quota)   { create(:quota, quantity: 2) }
        let!(:program) { quota.program }
        let!(:scorecard) { create(:scorecard, program: program) }

        it { expect(program.quota_warning?).to be_truthy }
      end

      context "quota quantity equal to program scorecards quantity" do
        let!(:quota)   { create(:quota, quantity: 1) }
        let!(:program) { quota.program }
        let!(:scorecard) { create(:scorecard, program: program) }

        it { expect(program.quota_warning?).to be_falsey }
      end
    end
  end
end
