# frozen_string_literal: true

class CscCore::ProgramWorker
  include Sidekiq::Worker

  def perform(program_id)
    program = CscCore::Program.find_by(id: program_id)
    program.create_index if program.present?
  end
end
