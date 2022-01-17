class CreateCscCoreMobileTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :mobile_tokens do |t|
      t.string   :token
      t.integer  :program_id

      t.timestamps
    end
  end
end
