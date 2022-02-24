FactoryBot.define do
  factory :primary_school, class: 'CscCore::PrimarySchool' do
    code       { FFaker::Code.npi }
    name_en    { FFaker::Name.name }
    name_km    { FFaker::Name.name }
    commune_id { Pumi::Commune.all.sample.id }
  end
end
