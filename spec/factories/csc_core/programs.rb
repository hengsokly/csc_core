FactoryBot.define do
  factory :program, class: 'CscCore::Program' do
    name    { FFaker::Name.name }
    shortcut_name {
      start = rand(0..9)
      en = rand(start+1..start+10)
      Devise.friendly_token[start..en]
    }
    skip_callback { true }

    trait :allow_callback do
      skip_callback { false }
    end
  end
end
