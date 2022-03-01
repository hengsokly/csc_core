# == Schema Information
#
# Table name: participants
#
#  id             :string
#  uuid           :string           not null, primary key
#  scorecard_uuid :string
#  age            :integer
#  gender         :string
#  disability     :boolean          default(FALSE)
#  minority       :boolean          default(FALSE)
#  poor_card      :boolean          default(FALSE)
#  youth          :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
module CscCore
  class Participant < ApplicationRecord
    self.table_name = "participants"

    belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true

    before_create :secure_uuid

    GENDERS=%w(female male other)
    GENDER_MALE = "male"
    GENDER_FEMALE = "female"
    GENDER_OTHER = "other"
  end
end
