# == Schema Information
#
# Table name: gf_dashboards
#
#  id            :uuid             not null, primary key
#  dashboard_id  :integer
#  dashboard_uid :string
#  dashboard_url :string
#  org_id        :integer
#  org_token     :string
#  program_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

module CscCore
  RSpec.describe GfDashboard, type: :model do
    it { is_expected.to belong_to(:program) }
  end
end
