module CscCore
  class MobileNotification < ApplicationRecord
    self.table_name = "mobile_notifications"

    validates :body, presence: true
    belongs_to :creator, foreign_key: :creator_id, class_name: "User"

    after_commit :push_notification_async, on: [:create]

    def push_notification_async
      MobileNotificationWorker.perform_async(id)
    end

    def build_content
      { notification: { title: title, body: body } }
    end
  end
end
