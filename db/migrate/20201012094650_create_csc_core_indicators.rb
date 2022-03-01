# frozen_string_literal: true

class CreateCscCoreIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :indicators do |t|
      t.integer :categorizable_id
      t.string  :categorizable_type
      t.string  :name
      t.integer :tag_id
      t.integer :display_order
      t.string  :image
      t.string  :uuid
      t.string  :audio
      t.string  :type

      t.timestamps
    end
  end
end
