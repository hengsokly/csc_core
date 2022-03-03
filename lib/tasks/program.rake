# frozen_string_literal: true

namespace :csc_core_program do
  desc "Migrate program quota"
  task migrate_program_quota: :environment do
    CscCore::Program.find_each do |program|
      program.quota.save
    end
  end
end
