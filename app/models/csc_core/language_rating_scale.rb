# frozen_string_literal: true

# == Schema Information
#
# Table name: language_rating_scales
#
#  id              :bigint           not null, primary key
#  rating_scale_id :integer
#  language_id     :integer
#  language_code   :string
#  audio           :string
#  content         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
module CscCore
  class LanguageRatingScale < ApplicationRecord
    self.table_name = "language_rating_scales"

    include Audio

    belongs_to :language
    belongs_to :rating_scale

    validates :content, presence: true
  end
end
