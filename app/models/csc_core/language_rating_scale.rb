module CscCore
  class LanguageRatingScale < ApplicationRecord
    self.table_name = "language_rating_scales"

    include Audio

    belongs_to :language
    belongs_to :rating_scale

    validates :content, presence: true
  end
end
