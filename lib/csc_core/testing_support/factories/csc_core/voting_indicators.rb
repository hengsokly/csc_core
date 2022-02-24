FactoryBot.define do
  factory :voting_indicator, class: 'CscCore::VotingIndicator' do
    indicatorable  { create(:indicator) }
    scorecard
    median         { rand(1..5) }
    strength       { %w(strength1) }
    weakness       { %w(weakness1) }
    suggested_action { %w(solution1) }
  end
end
