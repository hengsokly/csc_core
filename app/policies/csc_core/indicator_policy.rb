# frozen_string_literal: true

module CscCore
  class IndicatorPolicy < ApplicationPolicy
    def index?
      user.program_admin? || user.staff? || user.lngo?
    end

    def create?
      user.program_admin? || user.staff?
    end

    def update?
      create?
    end

    def destroy?
      create?
    end

    def custom?
      user.lngo? && record.custom?
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
