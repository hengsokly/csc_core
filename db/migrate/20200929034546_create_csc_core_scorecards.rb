# frozen_string_literal: true

class CreateCscCoreScorecards < ActiveRecord::Migration[6.1]
  def change
    create_table :scorecards do |t|
      t.string   :uuid
      t.integer  :unit_type_id
      t.integer  :facility_id
      t.string   :name
      t.text     :description

      t.string   :province_id, limit: 2
      t.string   :district_id, limit: 4
      t.string   :commune_id, limit: 6
      t.string   :location_code
      t.string   :primary_school_code

      t.integer  :year
      t.datetime :conducted_date

      t.integer  :number_of_caf
      t.integer  :number_of_participant
      t.integer  :number_of_female
      t.integer  :number_of_disability
      t.integer  :number_of_ethnic_minority
      t.integer  :number_of_youth
      t.integer  :number_of_id_poor

      t.datetime :planned_start_date
      t.datetime :planned_end_date
      t.integer  :status
      t.integer  :program_id
      t.integer  :local_ngo_id
      t.integer  :scorecard_type

      t.integer  :creator_id
      t.datetime :locked_at
      t.integer  :downloaded_count
      t.integer  :progress
      t.string   :language_conducted_code
      t.datetime :finished_date
      t.datetime :running_date
      t.datetime :deleted_at
      t.boolean  :published, default: false
      t.string   :device_type
      t.string   :device_token
      t.datetime :submitted_at
      t.datetime :completed_at
      t.integer  :completor_id

      t.timestamps
    end

    add_index :scorecards, :deleted_at
    add_index :scorecards, :uuid
  end
end
