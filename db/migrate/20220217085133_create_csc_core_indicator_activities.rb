# frozen_string_literal: true

class CreateCscCoreIndicatorActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :indicator_activities, id: :uuid do |t|
      t.string  :voting_indicator_uuid
      t.string  :scorecard_uuid
      t.text    :content
      t.boolean :selected
      t.string  :type

      t.timestamps
    end
  end
end
