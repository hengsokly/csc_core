# frozen_string_literal: true

FactoryBot.define do
  factory :caf, class: "CscCore::Caf" do
    name          { FFaker::Name.name }
    sex           { %w[female male other].sample }
    date_of_birth { rand(18..70).years.ago }
    tel           { FFaker::PhoneNumber.phone_number }
    address       { FFaker::Address.street_name }
    local_ngo
  end
end
