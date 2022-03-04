# frozen_string_literal: true

require "rails_helper"

module CscCore
  RSpec.describe Spreadsheets::DatasetSpreadsheet do
    describe "#process, primary school" do
      let(:category) { create(:category) }
      let(:spreadsheet) { Spreadsheets::DatasetSpreadsheet.new(category) }

      context "row with full info" do
        let(:row) do
          { "location_id" => "090101", "code" => "090101_1", "name_en" => "Andaung Teuk",
            "name_km" => "អណ្តូងទឹក" }
        end

        it "creates a new valid record" do
          expect { spreadsheet.process(row) }.to change { category.datasets.count }.from(0).to(1)
        end

        it "create a record with code is 090101_1" do
          spreadsheet.process(row)

          expect(category.datasets.last.code).to eq("090101_1")
        end
      end

      context "row without code" do
        let(:row) do
          { "location_id" => "090101", "code" => "", "name_en" => "Andaung Teuk",
            "name_km" => "អណ្តូងទឹក" }
        end

        it "create a record with code is 090101_category_id_1" do
          spreadsheet.process(row)

          expect(category.datasets.last.code).to eq("090101_#{category.id}_1")
        end
      end

      context "row without location_id" do
        let(:row) do
          { "location_id" => "", "code" => "123", "name_en" => "Andaung Teuk",
            "name_km" => "អណ្តូងទឹក" }
        end

        it "doesn't create a record" do
          expect { spreadsheet.process(row) }.to_not change(category.datasets, :count)
        end
      end

      context "existing record" do
        let!(:ps) do
          create(:dataset, province_id: "09", district_id: "0901", commune_id: "090101", code: "090101_1",
                           name_en: "Andaung Teuk", name_km: "អណ្តូងទឹក", category_id: category.id)
        end

        let(:row) do
          { "location_id" => "090101", "code" => "090101_1", "name_en" => "Andaung Teuk 1", "name_km" => "អណ្តូងទឹក 1" }
        end

        it "updates the dataset" do
          spreadsheet.process(row)

          expect(ps.reload.name_en).to eq("Andaung Teuk 1")
        end
      end
    end
  end

  describe "#process, health center" do
    let(:category) { create(:category, :health_center) }
    let(:spreadsheet) { Spreadsheets::DatasetSpreadsheet.new(category) }

    context "row with full info" do
      let(:row) do
        { "location_id" => "090101", "code" => "090101_1", "name_en" => "Andaung Teuk",
          "name_km" => "អណ្តូងទឹក" }
      end

      it "creates a new valid record" do
        expect { spreadsheet.process(row) }.to change { category.datasets.count }.from(0).to(1)
      end

      it "create a record with code is 090101_1" do
        spreadsheet.process(row)

        expect(category.datasets.last.code).to eq("090101_1")
      end
    end

    context "row without code and location_id missing digit" do
      let(:row) do
        { "location_id" => "901", "code" => "", "name_en" => "Andaung Teuk",
          "name_km" => "អណ្តូងទឹក" }
      end

      it "create a record with code is 0901_category_id_1" do
        spreadsheet.process(row)

        expect(category.datasets.last.code).to eq("0901_#{category.id}_1")
      end
    end
  end
end
