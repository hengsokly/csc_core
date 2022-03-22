# frozen_string_literal: true

require "csv"

module CscCore
  module Samples
    class Dataset < Base
      def self.load
        categories = [
          { code: "D_PS", filename: "primary_schools.xlsx" },
          { code: "D_HC", filename: "health_centers.xlsx" }
        ]

        categories.each do |cate|
          category = CscCore::Category.find_by(code: cate[:code])
          CscCore::Spreadsheets::DatasetSpreadsheet.new(category).import(file_path(cate[:filename]))
        end
      end
    end
  end
end
