# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Programs::IndicatorService do
    describe "#clone_from_program" do
      let!(:program1)  { create(:program, :allow_callback) }
      let!(:facility)  { create(:facility, :with_parent, :with_indicators, program: program1) }
      let!(:program2)  { create(:program, name: "World Vision", shortcut_name: "WVI") }
      let(:service)    { Programs::IndicatorService.new(program2.id) }
      let(:program2_facilities) { program2.facilities.where.not(parent_id: nil) }

      context "no language" do
        before {
          Programs::FacilityService.new(program2.id).clone_from_program(program1)
          service.clone_from_program(program1)
          program2.reload
        }

        it { expect(program2_facilities.first.indicators.length).to eq(1) }
        it { expect(program2.indicators.length).to eq(1) }
        it { expect(program2.indicators.length).to eq(program1.indicators.length) }
      end

      context "has language" do
        before {
          program1.indicators.each do |indicator|
            indicator.languages_indicators.update_all(language_code: program1.languages.first.code)
          end

          Programs::LanguageService.new(program2.id).clone_from_program(program1)
          Programs::FacilityService.new(program2.id).clone_from_program(program1)
          service.clone_from_program(program1)
          program2.reload
        }

        it { expect(program2.facilities.where.not(parent_id: nil).first.indicators.length).to eq(1) }
        it { expect(program2.indicators.length).to eq(1) }
        it { expect(program2.indicators.first.languages_indicators.length).to eq(1) }
      end
    end
  end
end
