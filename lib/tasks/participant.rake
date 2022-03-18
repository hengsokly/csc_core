# frozen_string_literal: true

namespace :csc_core_participant do
  desc "Migrate participants_profiles"
  task migrate_participants_profiles: :environment do
    CscCore::Participant.find_each do |participant|
      participant.update_profiles
    end
  end
end
