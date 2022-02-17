class CreateCscCoreVotingIndicators < ActiveRecord::Migration[6.1]
  def change
    create_table :voting_indicators, id: false do |t|
      t.string  :id
      t.primary_key :uuid, :string, default: "uuid_generate_v4()", null: false
      t.integer :indicatorable_id
      t.string  :indicatorable_type
      t.string  :scorecard_uuid
      t.integer :median
      t.text    :strength
      t.text    :weakness
      t.text    :suggested_action
      t.integer :display_order
      t.string  :indicator_uuid

      t.timestamps
    end
  end
end
