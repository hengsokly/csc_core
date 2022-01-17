class CreateCscCoreActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_logs do |t|
      t.string  :controller_name
      t.string  :action_name
      t.string  :http_format, index: true
      t.string  :http_method, index: true
      t.string  :path
      t.integer :http_status
      t.bigint  :user_id, index: true
      t.bigint  :program_id, index: true
      t.json    :payload, default: {}
      t.string  :remote_ip

      t.timestamps
    end
  end
end
