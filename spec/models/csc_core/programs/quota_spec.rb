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
  RSpec.describe Programs::Quota, type: :model do
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
