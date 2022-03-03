# frozen_string_literal: true

class MigrateProgramQuotas < ActiveRecord::Migration[6.1]
  def up
    Rake::Task["csc_core_program:migrate_program_quota"].invoke
  end

  def down
    CscCore::Quota.delete_all
  end
end
