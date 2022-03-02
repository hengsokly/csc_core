# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Programs::FacilityService do
    let!(:program1)  { create(:program, :allow_callback) }
    let!(:facility1) { create(:facility, program: program1) }
    let!(:program2)  { create(:program, name: 'World Vision', shortcut_name: 'WVI')}
    let(:service)    { Programs::FacilityService.new(program2.id) }

    describe "#clone_from_program" do
      let!(:facility2) { create(:facility, program: program1, parent: facility1) }

      before {
        service.clone_from_program(program1)
      }

      it { expect(program2.facilities.roots.length).to eq(1) }
      it { expect(program2.facilities.length).to eq(2) }
    end

    describe "#create_facility" do
      context "root facility" do
        before {
          service.send("create_facility", facility1)
        }

        it { expect(program2.facilities.roots.length).to eq(1) }
        it { expect(program2.facilities.roots.first.name).to eq(facility1.name) }
      end

      context "nested facility" do
        let!(:facility2) { create(:facility, program: program1, parent: facility1) }
        let!(:facility3) { create(:facility, program: program2, parent_id: nil) }

        it "should call 'create_nested_facility'" do
          expect(service).to receive(:create_nested_facility)
          service.send("create_facility", facility1)
        end

        it "creates nested facility" do
          service.send("create_facility", facility2, facility3)
          expect(program2.facilities.last.parent_id).to eq(facility3.id)
        end
      end
    end
  end
end
