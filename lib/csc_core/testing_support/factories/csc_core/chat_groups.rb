# frozen_string_literal: true

FactoryBot.define do
  factory :chat_group, class: "CscCore::ChatGroup" do
    program

    trait :telegram do
      title     { "mygroup" }
      chat_type { "group" }
      actived   { true }
      chat_id   { "111" }
      provider  { "Telegram" }
    end
  end
end
