# frozen_string_literal: true

# == Schema Information
#
# Table name: quotas
#
#  id              :uuid             not null, primary key
#  program_uuid    :string
#  scorecard_quota :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "rails_helper"

module CscCore
  RSpec.describe Quota, type: :model do
    it { is_expected.to belong_to(:program).optional }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0) }

    describe "#unlimited?" do
      context "unset quantity" do
        let(:quota) { build(:quota, quantity: nil) }

        it { expect(quota.unlimited?).to be_truthy }
      end

      context "set quantity" do
        let(:quota) { build(:quota, quantity: 2) }

        it { expect(quota.unlimited?).to be_falsey }
      end
    end

    describe "#display" do
      context "unset quantity" do
        let(:quota) { build(:quota, quantity: nil) }

        it { expect(quota.display).to eq(I18n.t("quota.unlimited")) }
      end

      context "set quantity" do
        let(:quota) { build(:quota, quantity: 2) }

        it { expect(quota.display).to eq(2) }
      end
    end
  end
end
