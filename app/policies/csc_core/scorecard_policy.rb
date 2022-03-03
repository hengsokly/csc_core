# frozen_string_literal: true

module CscCore
  class ScorecardPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      return true if user.system_admin?
      return true if default_user? && (user.program_id == record.program_id)
      return true if user.local_ngo_id == record.local_ngo_id

      false
    end

    def create?
      default_user? && !user.program.quota_reached?
    end

    def update?
      default_user? && !record.access_locked?
    end

    def destroy?
      default_user? && !%w[running downloaded].include?(record.progress)
    end

    # Custom methods
    def download?
      (user.program_id == record.program_id) && (default_user? || user.local_ngo_id == record.local_ngo_id)
    end

    def download_pdf?
      download? && record.access_locked?
    end

    def submit?
      download? && !record.submit_locked?
    end

    def setting?
      default_user? || user.lngo?
    end

    def request_change?
      user.lngo? || (default_user? && record.request_changes.length.positive?)
    end

    def in_review?
      user.lngo? && record.in_review?
    end

    class Scope < Scope
      def resolve
        return scope.all if user.system_admin?
        return scope.where(local_ngo_id: user.local_ngo_id) if user.lngo?

        scope.where(program_id: user.program_id)
      end
    end

    private
      def default_user?
        user.program_admin? || user.staff?
      end
  end
end
