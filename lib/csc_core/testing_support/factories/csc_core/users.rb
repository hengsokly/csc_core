FactoryBot.define do
  factory :user, aliases: [:creator], class: 'CscCore::User' do
    email         { FFaker::Internet.email }
    password      { FFaker::Internet.password }
    role          { "program_admin" }
    confirmed_at  { DateTime.now }
    program
    skip_callback { true }

    trait :allow_callback do
      skip_callback { false }
    end

    trait :system_admin do
      role { "system_admin" }
      program_id     { nil }
    end

    trait :staff do
      role { "staff" }
    end

    trait :guest do
      role { "guest" }
    end

    trait :lngo do
      role { "lngo" }
      local_ngo_id { create(:local_ngo).id }
    end
  end
end
