# frozen_string_literal: true

module CscCore
  class PdfTemplateInterpreter
    attr_reader :scorecard, :message, :pdf_template

    def initialize(scorecard_uuid)
      @scorecard = Scorecard.find_by uuid: scorecard_uuid
      @pdf_template = @scorecard.program.pdf_templates.find_by(language_code: I18n.locale) || @scorecard.program.pdf_templates.first
      @message = @pdf_template.try(:content)
    end

    def interpreted_message
      return "" if scorecard.nil? || message.blank?

      sms = message
      embeded_fields.each do |embeded_field|
        sms = sms.gsub(/#{"{{#{embeded_field}}}"}/, get_field_value(embeded_field).to_s)
      end
      sms
    end

    private
      def get_field_value(embeded_field)
        model = embeded_field.split(".")[0]
        field = embeded_field.split(".")[1]

        "CscCore::PdfTemplates::#{model.camelcase}Interpreter".constantize.new(scorecard).load(field)
      rescue StandardError
        Rails.logger.warn "Model #{model} and field #{field} is unknwon"
        ""
      end

      def embeded_fields
        @embeded_fields ||= message.scan(/{{([^}]*)}}/).flatten.uniq
      end
  end
end
