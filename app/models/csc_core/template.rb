module CscCore
  class Template < ApplicationRecord
    self.table_name = "templates"

    include Categorizable

    belongs_to :program

    validates :name, presence: true, uniqueness: { scope: :program_id }
  end
end
