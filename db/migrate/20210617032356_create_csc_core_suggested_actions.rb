class CreateCscCoreSuggestedActions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggested_actions do |t|
      t.string  :voting_indicator_uuid
      t.string  :content
      t.boolean :selected
      t.string  :scorecard_uuid

      t.timestamps
    end
  end
end
