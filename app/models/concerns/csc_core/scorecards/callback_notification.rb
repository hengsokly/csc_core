# frozen_string_literal: true

module CscCore
  module Scorecards
    module CallbackNotification
      extend ActiveSupport::Concern

      included do
        after_update :send_notification, if: :saved_change_to_progress?

        private
          def send_notification
            message = program.messages.find_by milestone: progress
            return if message.nil?

            message.notifications.each do |notification|
              notification.notify_async(id)
            end
          end
      end
    end
  end
end
