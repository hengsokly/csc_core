# frozen_string_literal: true

require "axlsx"
require_relative "base_exporter"
require_relative "../builders/scorecard_excel_builder"

module CscCore
  module Exporters
    class ExcelExporter < Exporters::BaseExporter
      def initialize(datasource)
        @datasource = datasource
      end

      def export(filename)
        package = Axlsx::Package.new
        model = "#{@datasource.first.class}ExcelBuilder".constantize
        model.new(package.workbook, @datasource).build
        package.serialize "#{filename}.xlsx"
      rescue StandardError
        Rails.logger.warn "Model #{model} is unknown"
      end
    end
  end
end
