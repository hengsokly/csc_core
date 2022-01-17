class CreateCscCoreLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :code
      t.string :name_en
      t.string :name_km
      t.integer :program_id

      t.timestamps
    end
  end
end
