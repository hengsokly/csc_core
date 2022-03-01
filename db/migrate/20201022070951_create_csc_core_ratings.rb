# frozen_string_literal: true

class CreateCscCoreRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings, id: false do |t|
      t.string :id
      t.primary_key :uuid, :string, default: "uuid_generate_v4()", null: false
      t.integer :score
      t.string  :scorecard_uuid
      t.string  :voting_indicator_uuid
      t.string  :participant_uuid

      t.timestamps
    end
  end
end
