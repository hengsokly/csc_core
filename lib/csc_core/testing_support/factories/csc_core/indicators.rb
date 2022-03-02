# frozen_string_literal: true

FactoryBot.define do
  factory :indicator, class: "CscCore::Indicator" do
    categorizable   { create(:facility) }
    # tag
    name            { FFaker::Name.name }

    trait :with_languages_indicators do
      transient do
        count { 1 }
      end

      after(:create) do |indicator, evaluator|
        create_list(:languages_indicator, evaluator.count, indicator: indicator)
      end
    end
  end
end
