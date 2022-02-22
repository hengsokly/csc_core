# frozen_string_literal: true

module CscCore
  class ProgramPolicy < ApplicationPolicy
    def index?
      user.system_admin?
    end

    def create?
      user.system_admin?
    end

    def update?
      user.system_admin? || user.program_admin?
    end

    def destroy?
      user.system_admin?
    end

    def es_reindex?
      user.system_admin? && ENV["ELASTICSEARCH_ENABLED"] == "true"
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
