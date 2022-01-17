class CreateCscCoreScorecardKnowledges < ActiveRecord::Migration[6.1]
  def change
    create_table :scorecard_knowledges do |t|
      t.string :code
      t.string :name_en
      t.string :name_km

      t.timestamps
    end
  end
end
