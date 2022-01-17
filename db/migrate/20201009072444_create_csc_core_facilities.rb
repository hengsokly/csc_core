class CreateCscCoreFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string  :code
      t.string  :name_en
      t.string  :name_km
      t.integer :parent_id, null: true, index: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :depth, null: false, default: 0
      t.integer :children_count, null: false, default: 0
      t.integer :program_id
      t.string  :dataset
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
