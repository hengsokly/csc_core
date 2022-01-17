FactoryBot.define do
  factory :participant, class: 'CscCore::Participant' do
    scorecard
    age      { rand(20..65) }
    gender   { CscCore::Participant::GENDERS.sample }
  end
end
