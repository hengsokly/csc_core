# frozen_string_literal: true

class CreateCscCoreCafs < ActiveRecord::Migration[6.1]
  def change
    create_table :cafs do |t|
      t.string :name
      t.string :sex
      t.string :date_of_birth
      t.string :tel
      t.string :address
      t.integer :local_ngo_id
      t.boolean :actived, default: true
      t.string :educational_background_id
      t.string :scorecard_knowledge_id
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :cafs, :deleted_at
  end
end
