# frozen_string_literal: true

require_relative "base_exporter"
require "ndjson"

module CscCore
  module Exporters
    class NdjsonExporter < Exporters::BaseExporter
      def export(filename)
        generator = NDJSON::Generator.new(get_file_path("#{filename}_ndjson"))

        datasource.find_each do |item|
          generator.write("CscCore::#{item.class}JsonBuilder".constantize.new(item).build)
        end
      end
    end
  end
end
