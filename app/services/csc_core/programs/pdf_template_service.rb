module CscCore
  class Programs::PdfTemplateService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def clone_from_program(source_program)
      source_program.pdf_templates.each do |pdf_template|
        new_template = program.pdf_templates.find_or_initialize_by(language_code: pdf_template.language_code)
        new_template.update(name: pdf_template.name, content: pdf_template.content)
      end
    end
  end
end
