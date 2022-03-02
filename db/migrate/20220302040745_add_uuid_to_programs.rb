class AddUuidToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :uuid, :uuid, default: "uuid_generate_v4()"
  end
end
