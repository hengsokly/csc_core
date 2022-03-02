# frozen_string_literal: true

FactoryBot.define do
  factory :data_publication, class: "CscCore::DataPublication" do
    published_option { CscCore::DataPublication.published_options.to_a.sample.first }
    program
  end
end
