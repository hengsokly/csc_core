# frozen_string_literal: true

FactoryBot.define do
  factory :language, class: "CscCore::Language" do
    code     { FFaker::Locale.code }
    name_en  { FFaker::Locale.language }
    name_km  { name_en }
    program
  end
end
