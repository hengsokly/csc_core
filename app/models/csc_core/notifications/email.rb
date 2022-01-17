module CscCore
  module Notifications
    class Email < ::CscCore::Notification
      def notify_async(scorecard_id)
        return unless program.enable_email_notification? && message.actived?

        NotificationWorker.perform_async(id, scorecard_id)
      end

      def notify_groups(display_message)
        return unless emails.present?

        NotificationMailer.notify(emails.join(","), display_message).deliver_now
      end
    end
  end
end
