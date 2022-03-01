# frozen_string_literal: true

FactoryBot.define do
  factory :scorecard, class: "CscCore::Scorecard" do
    year         { Date.today.year }
    facility     { create(:facility, :with_parent) }
    unit_type_id { facility.parent_id }
    program
    creator
    local_ngo
    status { "" }
    scorecard_type { CscCore::Scorecard::SCORECARD_TYPES.sample.last }
    commune_id   { Pumi::Commune.all.sample.id }
    district_id  { Pumi::Commune.find_by_id(commune_id).try(:district_id) }
    province_id  { Pumi::Commune.find_by_id(commune_id).province_id }
    planned_start_date { 7.days.from_now }
    planned_end_date { planned_start_date }

    trait :with_primary_school do
      facility            { create(:facility, :with_parent, :dataset) }
      primary_school_code { PrimarySchool.first.code }
      commune_id          { PrimarySchool.first.commune_id }
    end
  end
end
