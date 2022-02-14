# frozen_string_literal: true

module CscCore
  class MessagePolicy < ApplicationPolicy
    def index?
      user.program_admin?
    end

    def create?
      user.program_admin?
    end

    def update?
      create?
    end

    def destroy?
      create?
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
