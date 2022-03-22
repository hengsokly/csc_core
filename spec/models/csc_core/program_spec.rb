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

    it { is_expected.to have_many(:users).dependent(:destroy) }
    it { is_expected.to have_many(:languages).dependent(:destroy) }
    it { is_expected.to have_many(:facilities).dependent(:destroy) }
    it { is_expected.to have_many(:templates).dependent(:destroy) }
    it { is_expected.to have_many(:local_ngos).dependent(:destroy) }
    it { is_expected.to have_many(:scorecards).dependent(:destroy) }
    it { is_expected.to have_many(:rating_scales).dependent(:destroy) }
    it { is_expected.to have_many(:contacts).dependent(:destroy) }
    it { is_expected.to have_many(:pdf_templates).dependent(:destroy) }
    it { is_expected.to have_many(:chat_groups).dependent(:destroy) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
    it { is_expected.to have_many(:mobile_tokens).dependent(:destroy) }
    it { is_expected.to have_many(:activity_logs).dependent(:destroy) }
    it { is_expected.to have_one(:data_publication).dependent(:destroy) }
    it { is_expected.to have_many(:data_publication_logs).dependent(:destroy) }
    it { is_expected.to have_one(:telegram_bot).dependent(:destroy) }
    it { is_expected.to have_one(:gf_dashboard).dependent(:destroy) }
    it { is_expected.to have_one(:quota).dependent(:destroy) }

    describe "#after_create" do
      let!(:program) { create(:program) }

      it { expect(program.languages.length).to eq(1) }
    end
  end
end
