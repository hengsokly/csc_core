# frozen_string_literal: true

class CreateCscCorePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string  :name
      t.string  :datetime_format, default: "DD-MM-YYYY"
      t.boolean :enable_email_notification, default: false
      t.string  :shortcut_name
      t.text    :dashboard_user_emails, default: [], array: true
      t.string  :dashboard_user_roles, default: [], array: true

      t.timestamps
    end
  end
end
