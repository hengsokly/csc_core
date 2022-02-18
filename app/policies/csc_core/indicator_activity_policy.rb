# frozen_string_literal: true

module CscCore
  class IndicatorActivityPolicy < ApplicationPolicy
    def index?
      user.program_admin? || user.staff? || user.lngo?
    end

    def create?
      index?
    end

    def update?
      user.lngo?
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
