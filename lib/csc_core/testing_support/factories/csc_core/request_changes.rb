FactoryBot.define do
  factory :request_change, class: 'CscCore::RequestChange' do
    changed_reason { FFaker::BaconIpsum.sentence }
    scorecard
    proposer { create(:user) }
  end
end
