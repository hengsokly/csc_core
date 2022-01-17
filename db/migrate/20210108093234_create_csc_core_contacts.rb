class CreateCscCoreContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :contact_type
      t.string  :value
      t.integer :program_id

      t.timestamps
    end
  end
end
