module CscCore
  class Programs::IndicatorService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def clone_from_program(source_program)
      source_program.facilities.where.not(parent_id: nil).each do |facility|
        new_facility = program.facilities.find_by(code: facility.code)
        facility.indicators.each do |indicator|
          new_indicator = new_facility.indicators.find_or_initialize_by(name: indicator.name)
          new_indicator.update(tag_id: indicator.tag_id, display_order: indicator.display_order)

          clone_language_indicators(indicator, new_indicator)
        end
      end
    end

    private
      def clone_language_indicators(indicator, new_indicator)
        indicator.languages_indicators.each do |lang_indi|
          language = program.languages.find_by(code: lang_indi.language_code)

          next if language.nil?

          new_lang_indi = new_indicator.languages_indicators.find_or_initialize_by(language_code: lang_indi.language_code)
          new_lang_indi.update(language_id: language.id, content: lang_indi.content, audio: lang_indi.audio, version: lang_indi.version)
        end
      end
  end
end
