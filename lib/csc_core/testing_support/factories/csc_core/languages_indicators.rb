FactoryBot.define do
  factory :languages_indicator, class: 'CscCore::LanguagesIndicator' do
    language
    language_code { language.code }
    content       { FFaker::Name.name }
    indicator
    audio         { Rack::Test::UploadedFile.new(fixture_attachment_path("audio.mp3")) }
  end
end
