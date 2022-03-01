# == Schema Information
#
# Table name: languages_indicators
#
#  id            :bigint           not null, primary key
#  language_id   :integer
#  language_code :string
#  indicator_id  :integer
#  content       :string
#  audio         :string
#  version       :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
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
