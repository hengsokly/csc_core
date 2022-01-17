module CscCore
  class LanguagesIndicator < ApplicationRecord
    self.table_name = "languages_indicators"

    include Audio

    belongs_to :language
    belongs_to :indicator, touch: true

    validates :content, presence: true

    before_update :increase_version

    private
      def increase_version
        self.version += 1
      end
  end
end
