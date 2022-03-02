# frozen_string_literal: true

FactoryBot.define do
  factory :custom_indicator, class: "CscCore::CustomIndicator" do
    name { FFaker::Name.name }
    scorecard
  end
end
