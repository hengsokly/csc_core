# frozen_string_literal: true

# == Schema Information
#
# Table name: custom_indicators
#
#  id             :bigint           not null, primary key
#  name           :string
#  audio          :string
#  scorecard_uuid :string
#  tag_id         :integer
#  uuid           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module Indicators
  class CustomIndicator < ::Indicator
  end
end
