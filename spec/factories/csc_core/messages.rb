FactoryBot.define do
  factory :message, class: 'CscCore::Message' do
    content   { "message" }
    program
  end
end
