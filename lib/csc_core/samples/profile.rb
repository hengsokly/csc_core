# frozen_string_literal: true

module CscCore
  module Samples
    class Profile < Base
      def self.load
        ::CscCore::Profile.create_defaults
      end
    end
  end
end
