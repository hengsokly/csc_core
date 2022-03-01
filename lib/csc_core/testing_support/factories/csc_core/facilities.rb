# frozen_string_literal: true

FactoryBot.define do
  factory :facility, class: "CscCore::Facility" do
    name_en        { FFaker::Name.name }
    name_km        { name_en }
    code           { name.upcase.split(" ").map { |n| n[0] }.join("") }
    program

    trait :with_indicators do
      transient do
        indicator_count { 1 }
      end

      after(:create) do |facility, evaluator|
        create_list(:indicator, evaluator.indicator_count, :with_languages_indicators, categorizable: facility)
      end
    end

    trait :with_parent do
      before(:create) do |facility, evaluator|
        facility.parent_id = create(:facility, program_id: facility.program_id).id
      end
    end

    trait :dataset do
      dataset { "ps" }

      before(:create) do |_facility, _evaluator|
        create(:primary_school)
      end
    end
  end
end
