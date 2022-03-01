# == Schema Information
#
# Table name: pdf_templates
#
#  id            :bigint           not null, primary key
#  name          :string
#  content       :text
#  language_code :string
#  program_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
module CscCore
  class PdfTemplate < ApplicationRecord
    self.table_name = "pdf_templates"

    belongs_to :program

    validates :name, presence: true
    validates :language_code, presence: true
    validates :language_code, uniqueness: { scope: :program_id }
  end
end
