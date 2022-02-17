# frozen_string_literal: true

module CscCore
  module Samples
    class Program
      def self.load
        u = CscCore::User.new(email: "admin@instedd.org", role: :system_admin, password: "123456", program_id: nil)
        u.confirm

        %w[CARE].each do |program_name|
          CscCore::Program.create(name: program_name, shortcut_name: program_name[0..9])
        end
      end
    end
  end
end
