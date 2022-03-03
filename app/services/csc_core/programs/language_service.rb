# frozen_string_literal: true

module CscCore
  class Programs::LanguageService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def clone_from_program(source_program)
      source_program.languages.each do |language|
        new_language = program.languages.find_or_initialize_by(code: language.code)
        new_language.update(name_en: language.name_en, name_km: language.name_km)
      end
    end
  end
end
