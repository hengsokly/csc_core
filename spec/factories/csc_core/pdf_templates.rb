FactoryBot.define do
  factory :pdf_template, class: 'CscCore::PdfTemplate' do
    name { FFaker::Name.name }
    language_code { "km" }
    program
  end
end
