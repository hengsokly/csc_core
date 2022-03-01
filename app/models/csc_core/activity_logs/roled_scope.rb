# frozen_string_literal: true

module CscCore
  module ActivityLogs
    module RoledScope
      def system_admin(_args)
        all
      end

      def program_admin(args)
        where(program_id: args[:program_id])
      end

      def staff(args)
        where(user_id: args[:user_id], program_id: args[:program_id])
      end

      alias lngo staff
    end
  end
end
