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
