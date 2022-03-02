# frozen_string_literal: true

module CscCore
  class DashboardWorker
    include Sidekiq::Worker

    def perform(program_id)
      program = CscCore::Program.find_by(id: program_id)
      program.create_dashboard if program.present?
    end
  end
end
