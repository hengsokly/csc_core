FactoryBot.define do
  factory :template, class: 'CscCore::Template' do
    name        { FFaker::Name.name }
    program

    trait :with_indicators do
      transient do
        indicator_count { 1 }
      end

      after(:create) do |template, evaluator|
        create_list(:indicator, evaluator.indicator_count, :with_languages_indicators, categorizable: template)
      end
    end
  end
end
