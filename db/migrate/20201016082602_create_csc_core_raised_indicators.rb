class CreateCscCoreRaisedIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :raised_indicators do |t|
      t.integer :indicatorable_id
      t.string  :indicatorable_type
      t.string  :scorecard_uuid
      t.integer :tag_id
      t.string  :participant_uuid
      t.boolean :selected, default: false
      t.string  :voting_indicator_uuid

      t.timestamps
    end
  end
end
