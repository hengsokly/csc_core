# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe PdfTemplateInterpreter do
    describe "#pdf_template" do
      let!(:pdf_template_km) { create(:pdf_template) }
      let!(:program) { pdf_template_km.program }
      let!(:scorecard) { create(:scorecard, program: program) }
      let(:interpretor) { PdfTemplateInterpreter.new(scorecard.uuid) }

      context "program pdf_template en exist" do
        let!(:pdf_template_en) { create(:pdf_template, language_code: "en", program: program) }

        before { allow(I18n).to receive(:locale).and_return(:en) }

        it { expect(interpretor.pdf_template.id).to eq(pdf_template_en.id) }
      end

      context "program pdf_template en doesn't exist" do
        before { allow(I18n).to receive(:locale).and_return(:en) }

        it { expect(interpretor.pdf_template.id).to eq(pdf_template_km.id) }
      end
    end

    describe "#message" do
      let!(:program) { create(:program) }
      let!(:scorecard) { create(:scorecard, program: program) }
      let(:interpretor) { PdfTemplateInterpreter.new(scorecard.uuid) }

      context "no program pdf_template" do
        it { expect(interpretor.pdf_template).to eq(nil) }
        it { expect(interpretor.interpreted_message).to eq("") }
      end

      context "template code 'swot.result_table' exist" do
        let!(:pdf_template_km) { create(:pdf_template, content: "<div>{{swot.result_table}}</div>", program: program) }
        let!(:voting_indicator) { create(:voting_indicator, scorecard: scorecard, median: 1) }
        let!(:strength_indicator_activity) do
          create(:strength_indicator_activity, voting_indicator: voting_indicator,
                                               scorecard: voting_indicator.scorecard)
        end
        let!(:weakness_indicator_activity) do
          create(:weakness_indicator_activity, voting_indicator: voting_indicator,
                                               scorecard: voting_indicator.scorecard)
        end
        let!(:suggested_indicator_activity) do
          create(:suggested_indicator_activity, voting_indicator: voting_indicator, scorecard: voting_indicator.scorecard,
                                                selected: true)
        end
        let(:t_head) do
          str = %w[indicator average_score strength weakness suggested_action].map do |col|
            "<th class='text-center'>#{I18n.t("interpreter.pdf_template.#{col}")}</th>"
          end.join("")

          "<tr>#{str}</tr>"
        end

        let(:t_body) do
          str = "<tr>"
          str += "<td>#{voting_indicator.indicator.name}</td>"
          str += "<td class='text-center'>មិនពេញចិត្តខ្លាំង (1)</td>"
          str += "<td><ul><li>#{strength_indicator_activity.content} </li></ul></td>"
          str += "<td><ul><li>#{weakness_indicator_activity.content} </li></ul></td>"
          str += "<td><ul><li>#{suggested_indicator_activity.content} (#{I18n.t('interpreter.pdf_template.selected')})</li></ul></td>"
          "#{str}</tr>"
        end

        let(:html) do
          str = "<div><table class='table table-bordered'>"
          str += "<thead>#{t_head}</thead>"
          str += "<tbody>#{t_body}</tbody>"
          "#{str}</table></div>"
        end

        before { I18n.locale = :km }
        it { expect(interpretor.interpreted_message).to eq(html) }
      end
    end
  end
end
