# frozen_string_literal: true

module CscCore
  class Programs::RatingScaleService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def clone_from_program(source_program)
      source_program.rating_scales.each do |rating_scale|
        new_rating_scale = program.rating_scales.find_or_initialize_by(code: rating_scale.code)
        new_rating_scale.update(name: rating_scale.name, value: rating_scale.value)

        clone_languages_rating_scales(rating_scale, new_rating_scale)
      end
    end

    private
      def clone_languages_rating_scales(rating_scale, new_rating_scale)
        rating_scale.language_rating_scales.each do |language_rating_scale|
          language = program.languages.find_by(code: language_rating_scale.language_code)

          new_language_rating_scale = new_rating_scale.language_rating_scales.find_or_initialize_by(language_code: language_rating_scale.language_code)
          new_language_rating_scale.update(language_id: language.id, audio: language_rating_scale.audio, content: language_rating_scale.content)
        end
      end
  end
end
