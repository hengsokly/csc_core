# frozen_string_literal: true

class AddDatasetIdToScorecards < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecards, :dataset_code, :string
  end
end
