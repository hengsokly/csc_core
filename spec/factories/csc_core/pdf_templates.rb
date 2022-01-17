FactoryBot.define do
  factory :pdf_template do
    name { FFaker::Name.name }
    language_code { "km" }
    program
  end
end
