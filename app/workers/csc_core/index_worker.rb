# frozen_string_literal: true

class CscCore::IndexWorker
  include Sidekiq::Worker
  sidekiq_options queue: "index_document"

  def perform(operation, scorecard_uuid)
    scorecard = CscCore::Scorecard.with_deleted.find_by(uuid: scorecard_uuid)

    return if scorecard.nil?

    case operation.to_s
    when /index/
      scorecard.index_document
    when /delete/
      scorecard.delete_document
    else
      raise ArgumentError, "Unknown operation '#{operation}'"
    end
  end
end
