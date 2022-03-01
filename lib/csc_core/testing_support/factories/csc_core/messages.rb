# frozen_string_literal: true

FactoryBot.define do
  factory :message, class: "CscCore::Message" do
    content { "message" }
    program
  end
end
