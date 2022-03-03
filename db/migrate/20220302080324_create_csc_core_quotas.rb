# frozen_string_literal: true

class CreateCscCoreQuotas < ActiveRecord::Migration[6.1]
  def change
    create_table :quotas, id: :uuid do |t|
      t.integer :program_id
      t.integer :quantity

      t.timestamps
    end
  end
end
