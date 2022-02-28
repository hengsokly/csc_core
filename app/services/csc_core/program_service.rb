# frozen_string_literal: true

module CscCore
  class ProgramService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def self.templates
      [
        { value: "language", label: I18n.t("program.lanuages") },
        { value: "rating_scale", label: I18n.t("program.rating_scales") },
        { value: "pdf_template", label: I18n.t("program.pdf_templates") },
        { value: "facility", label: I18n.t("program.facilities"), children: [
            { value: "indicator", label: I18n.t("program.indicators") }
          ]
        }
      ]
    end

    def clone_from_program(source_program, options = [])
      options.each do |option|
        clone(option, source_program)
      end
    end

    def clone(klass_name, source_program)
      klass_name = klass_name.to_s.titleize.split(" ").join()
      model = "CscCore::Programs::#{klass_name}Service".constantize
      model.new(program.id).clone_from_program(source_program)

      rescue
        Rails.logger.warn "Model #{model} is unknown"
    end
  end
end
