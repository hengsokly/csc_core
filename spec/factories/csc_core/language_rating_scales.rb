FactoryBot.define do
  factory :language_rating_scale, class: 'CscCore::LanguageRatingScale' do
    content       { CscCore::RatingScale.defaults.sample[:name] }
    language
    language_code { language.code }
    rating_scale
    audio         { Rack::Test::UploadedFile.new("./spec/fixtures/files/audio.mp3") }
  end
end
