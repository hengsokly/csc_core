# frozen_string_literal: true

module CscCore
  class ActivityLogPolicy < ApplicationPolicy
    def index?
      user.system_admin?
    end
  end
end
