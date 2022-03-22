# frozen_string_literal: true

module CscCore
  module Programs
    module Quota
      extend ActiveSupport::Concern

      included do
        def quota
          super || build_quota
        end

        def quota_reached?
          !quota.unlimited? && scorecards.persisteds.length >= quota.quantity
        end

        def quota_warning?
          return false if quota.unlimited? || scorecards.length >= quota.quantity

          scorecards.length >= (quota.quantity * 0.7).floor
        end
      end
    end
  end
end
