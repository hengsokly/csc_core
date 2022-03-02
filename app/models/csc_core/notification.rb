# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  provider   :string
#  emails     :text             default([]), is an Array
#  message_id :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Todo: migration for Notifications::Telegram under CscCore

module CscCore
  class Notification < ApplicationRecord
    self.table_name = "notifications"
    self.inheritance_column = :provider

    PROVIDERS = %w[CscCore::Notifications::Telegram CscCore::Notifications::Email].freeze

    belongs_to :message
    has_one  :program, through: :message
    has_many :chat_groups_notifications
    has_many :chat_groups, through: :chat_groups_notifications

    validates :provider, presence: true, inclusion: { in: PROVIDERS }

    accepts_nested_attributes_for :chat_groups_notifications, allow_destroy: true

    scope :telegrams, -> { where(provider: "CscCore::Notifications::Telegram") }
    scope :emails, -> { where(provider: "CscCore::Notifications::Email") }

    def notify_groups
      raise "Abstract Method"
    end

    # Class Methods
    def self.providers
      PROVIDERS
    end
  end
end
