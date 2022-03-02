# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Programs::PdfTemplateService do
    describe "#clone_from_program" do
      let!(:program1)  { create(:program, :allow_callback) }
      let!(:pdf_template) { create(:pdf_template, program: program1, language_code: program1.languages.first.code) }
      let!(:program2)  { create(:program, name: 'World Vision', shortcut_name: 'WVI')}
      let(:service)    { Programs::PdfTemplateService.new(program2.id) }

      before {
        program2.pdf_templates.delete_all
        service.clone_from_program(program1)
        program2.reload
      }

      it { expect(program2.pdf_templates.length).to eq(1) }
      it { expect(program2.pdf_templates.length).to eq(program1.pdf_templates.length) }
     end
  end
end
