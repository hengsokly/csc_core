# frozen_string_literal: true

module CscCore
  class NotificationMailer < ApplicationMailer
    def notify(emails, body_message)
      @body_message = body_message
      mail(to: emails, subject: "Scorecard Notification")
    end

    def notify_request_change(emails, option)
      @body_message = option[:body_message]
      @scorecard = option[:scorecard]
      @request_change = option[:request_change]

      mail(to: emails, subject: "Scorecard RequestChange Notification")
    end

    def notify_locked_user(email)
      @user = User.find_by email: email
      @contacts = Contact.where('program_id = ? OR program_id is NULL', @user.program_id)

      mail(to: email, subject: "Your account is locked")
    end

  end
end
