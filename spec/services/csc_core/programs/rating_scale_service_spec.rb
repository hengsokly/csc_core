# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Programs::RatingScaleService do
    describe "#clone_from_program" do
      let!(:program1)  { create(:program, :allow_callback) }
      let!(:program2)  { create(:program, name: 'World Vision', shortcut_name: 'WVI')}
      let(:service)    { Programs::RatingScaleService.new(program2.id) }

      before {
        program2.rating_scales.delete_all
        service.clone_from_program(program1)
        program2.reload
      }

      it { expect(program2.rating_scales.length).to eq(5) }
      it { expect(program2.rating_scales.length).to eq(program1.rating_scales.length) }
     end
  end
end
