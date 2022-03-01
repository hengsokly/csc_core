# frozen_string_literal: true

# == Schema Information
#
# Table name: indicator_activities
#
#  id                    :uuid             not null, primary key
#  voting_indicator_uuid :string
#  scorecard_uuid        :string
#  content               :text
#  selected              :boolean
#  type                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
module CscCore
  class IndicatorActivity < ApplicationRecord
    self.table_name = "indicator_activities"

    belongs_to :voting_indicator, foreign_key: :voting_indicator_uuid, optional: true
    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true

    default_scope { order(created_at: :asc) }
    scope :selecteds, -> { where(selected: true) }

    # TODO: after interim period of v1 and v2, it should be removed
    after_validation :secure_uniqness

    def self.inherited(child)
      child.instance_eval do
        def model_name
          CscCore::IndicatorActivity.model_name
        end
      end
      super
    end

    private
      def secure_uniqness
        activity = IndicatorActivity.find_by(content: content, voting_indicator_uuid: voting_indicator_uuid, type: type)
        activity.delete if activity.present?
      end
  end
end
