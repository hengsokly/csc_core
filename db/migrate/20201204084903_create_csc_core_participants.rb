# frozen_string_literal: true

class CreateCscCoreParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants, id: false do |t|
      t.string :id
      t.primary_key :uuid, :string
      t.string  :scorecard_uuid
      t.integer :age
      t.string  :gender
      t.boolean :disability, default: false
      t.boolean :minority, default: false
      t.boolean :poor_card, default: false
      t.boolean :youth, default: false

      t.timestamps
    end
  end
end
