FactoryBot.define do
  factory :indicator_activity, class: 'CscCore::IndicatorActivity' do
  end

  factory :strength_indicator_activity, class: 'CscCore::StrengthIndicatorActivity' do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end

  factory :weakness_indicator_activity, class: 'CscCore::WeaknessIndicatorActivity' do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end

  factory :suggested_indicator_activity, class: 'CscCore::SuggestedIndicatorActivity' do
    content { FFaker::Name.name }
    voting_indicator
    scorecard
  end
end
