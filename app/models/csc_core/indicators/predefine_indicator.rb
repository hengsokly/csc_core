# frozen_string_literal: true

# == Schema Information
#
# Table name: indicators
#
#  id                 :bigint           not null, primary key
#  categorizable_id   :integer
#  categorizable_type :string
#  name               :string
#  tag_id             :integer
#  display_order      :integer
#  image              :string
#  uuid               :string
#  audio              :string
#  type               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
module CscCore
  module Indicators
    class PredefineIndicator < ::CscCore::Indicator
    end
  end
end
