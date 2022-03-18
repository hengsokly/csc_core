# frozen_string_literal: true

class CreateCscCoreParticipantsProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :participants_profiles, id: :uuid do |t|
      t.string :participant_id
      t.uuid   :profile_id

      t.timestamps
    end
  end
end
