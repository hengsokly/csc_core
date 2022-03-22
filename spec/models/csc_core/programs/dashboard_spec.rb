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
  RSpec.describe Programs::Dashboard, type: :model do
    describe "#after_create, create_dashboard_async" do
      it "adds a job to DashboardWorker" do
        expect do
          create(:program, :allow_callback)
        end.to change(DashboardWorker.jobs, :count)
      end
    end
  end
end
