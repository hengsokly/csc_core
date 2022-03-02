# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Programs::LanguageService do
    describe "#clone_from_program" do
      let!(:program1)  { create(:program, :allow_callback) }
      let!(:program2)  { create(:program, name: "World Vision", shortcut_name: "WVI") }
      let(:service)    { Programs::LanguageService.new(program2.id) }

      before {
        program2.languages.delete_all
        service.clone_from_program(program1)
        program2.reload
      }

      it { expect(program2.languages.length).to eq(1) }
      it { expect(program2.languages.length).to eq(program1.languages.length) }
    end
  end
end
