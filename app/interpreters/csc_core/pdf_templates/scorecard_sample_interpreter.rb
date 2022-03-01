# frozen_string_literal: true

module CscCore
  module PdfTemplates
    class ScorecardSampleInterpreter
      def load(field)
        if respond_to?(field.to_sym)
          send(field.to_sym)
        else
          fill_in_value.to_s
        end
      end

      def facilitators
        html = [1, 2].map { |_caf| "<li>#{fill_in_value}</li>" }.join("")

        "<ol>#{html}</ol>"
      end

      private
        def fill_in_value
          "&lt;#{I18n.t('interpreter.pdf_template.fill_in')}&gt;"
        end
    end
  end
end
