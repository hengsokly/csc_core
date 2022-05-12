# frozen_string_literal: true

# == Schema Information
#
# Table name: voting_indicators
#
#  id                 :string
#  uuid               :string           default("uuid_generate_v4()"), not null, primary key
#  indicatorable_id   :integer
#  indicatorable_type :string
#  scorecard_uuid     :string
#  median             :integer
#  strength           :text
#  weakness           :text
#  suggested_action   :text
#  display_order      :integer
#  indicator_uuid     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
module CscCore
  class VotingIndicator < ApplicationRecord
    self.table_name = "voting_indicators"

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
    belongs_to :indicator, foreign_key: :indicator_uuid, primary_key: :uuid, optional: true
    belongs_to :indicatorable, polymorphic: true, optional: true
    has_many :ratings, foreign_key: :voting_indicator_uuid, dependent: :destroy
    has_many :suggested_actions, foreign_key: :voting_indicator_uuid, dependent: :destroy
    has_many :raised_indicators, foreign_key: :voting_indicator_uuid

    has_many   :indicator_activities, foreign_key: :voting_indicator_uuid, dependent: :destroy, class_name: "::IndicatorActivity"
    has_many   :strength_indicator_activities, foreign_key: :voting_indicator_uuid, dependent: :destroy, class_name: "::StrengthIndicatorActivity"
    has_many   :weakness_indicator_activities, foreign_key: :voting_indicator_uuid, dependent: :destroy, class_name: "::WeaknessIndicatorActivity"
    has_many   :suggested_indicator_activities, foreign_key: :voting_indicator_uuid, dependent: :destroy, class_name: "::SuggestedIndicatorActivity"

    accepts_nested_attributes_for :suggested_actions, allow_destroy: true
    accepts_nested_attributes_for :indicator_activities, allow_destroy: true

    enum median: {
      very_bad: 1,
      bad: 2,
      acceptable: 3,
      good: 4,
      very_good: 5
    }

    serialize :strength, Array
    serialize :weakness, Array
    serialize :suggested_action, Array

    before_create :secure_uuid
    after_validation :set_indicator_uuid

    private
      def set_indicator_uuid
        self.indicator_uuid ||= indicatorable.try(:uuid)
      end
  end
end
