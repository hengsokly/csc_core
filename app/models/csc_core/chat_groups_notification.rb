module CscCore
  class ChatGroupsNotification < ApplicationRecord
    self.table_name = "chat_groups_notifications"

    belongs_to :notification
    belongs_to :chat_group
  end
end
