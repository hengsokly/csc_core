# frozen_string_literal: true

class CreateCscCoreTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.string "name"
      t.integer "program_id"

      t.timestamps
    end
  end
end
