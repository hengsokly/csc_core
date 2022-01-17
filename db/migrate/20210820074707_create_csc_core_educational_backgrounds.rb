class CreateCscCoreEducationalBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :educational_backgrounds do |t|
      t.string :code
      t.string :name_en
      t.string :name_km

      t.timestamps
    end
  end
end
