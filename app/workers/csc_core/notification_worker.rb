# frozen_string_literal: true

module CscCore
  class NotificationWorker
    include Sidekiq::Worker

    def perform(id, scorecard_id)
      notification = Notification.find_by(id: id)

      return if notification.nil?

      display_message = notification.message.display_content(scorecard_id)
      notification.notify_groups(display_message)
    end
  end
end
