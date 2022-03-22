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
  RSpec.describe Programs::Removing, type: :model do
    describe "#remove!" do
      let!(:program) { create(:program, skip_callback: false) }
      let!(:scorecard) { create(:scorecard, program: program) }

      context "valid param name" do
        before {
          program.remove!(program.name)
        }

        it { expect(CscCore::Language.count).to eq(0) }
        it { expect(CscCore::User.with_deleted.count).to eq(0) }
        it { expect(CscCore::Scorecard.with_deleted.count).to eq(0) }
      end

      context "invalid param name" do
        it { expect { program.remove!("invalid_name") }.to raise_error(RuntimeError, "Program name does not match!") }
      end
    end
  end
end
