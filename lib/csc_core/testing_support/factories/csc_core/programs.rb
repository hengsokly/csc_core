# frozen_string_literal: true

FactoryBot.define do
  factory :program, class: "CscCore::Program" do
    name { FFaker::Name.name }
    shortcut_name do
      start = rand(0..9)
      en = rand(start + 1..start + 10)
      Devise.friendly_token[start..en]
    end
    skip_callback { true }

    trait :allow_callback do
      skip_callback { false }
    end
  end
end
