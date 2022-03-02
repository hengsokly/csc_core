# frozen_string_literal: true

FactoryBot.define do
  factory :contact, class: "CscCore::Contact" do
    contact_type   { :tel }
    value          { FFaker::PhoneNumber.short_phone_number }
    program

    trait :email do
      contact_type { :email }
      value        { FFaker::Internet.email }
    end

    trait :no_program do
      program { nil }
    end

    trait :system_email do
      contact_type { :email }
      value { "email@system.com" }
    end

    trait :system_tel do
      contact_type { :tel }
      value { "012333444" }
    end
  end
end
