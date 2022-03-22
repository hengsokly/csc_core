# frozen_string_literal: true

module CscCore
  module Programs
    module Dashboard
      extend ActiveSupport::Concern

      included do
        def create_dashboard
          CscCore::Dashboard.new(self).create
        end

        def update_dashboard
          CscCore::Dashboard.new(self).update
        end

        private
          def create_dashboard_async
            CscCore::DashboardWorker.perform_async(id)
          end
      end
    end
  end
end
