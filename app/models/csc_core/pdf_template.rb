module CscCore
  class PdfTemplate < ApplicationRecord
    self.table_name = "pdf_templates"

    belongs_to :program

    validates :name, presence: true
    validates :language_code, presence: true
    validates :language_code, uniqueness: { scope: :program_id }
  end
end
