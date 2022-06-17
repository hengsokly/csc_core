# frozen_string_literal: true

FactoryBot.define do
  factory :indicator_activity, class: "CscCore::IndicatorActivity" do
  end

  factory :strength_indicator_activity, class: "CscCore::StrengthIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end

  factory :weakness_indicator_activity, class: "CscCore::WeaknessIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end

  factory :suggested_indicator_activity, class: "CscCore::SuggestedIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end

  # Todo: remove it after web portal is on production
  factory :tmp_strength_indicator_activity, class: "::StrengthIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator_uuid { create(:voting_indicator).uuid }
  end

  factory :tmp_weakness_indicator_activity, class: "::WeaknessIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator_uuid { create(:voting_indicator).uuid }
  end

  factory :tmp_suggested_indicator_activity, class: "::SuggestedIndicatorActivity" do
    content { FFaker::Name.name }
    voting_indicator_uuid { create(:voting_indicator).uuid }
  end
end
