# frozen_string_literal: true

config = {
  host: "http://elasticsearch:9200/",
  transport_options: {
    request: { timeout: 5 }
  }
}

file_path = "#{CscCore::Engine.root}/config/elasticsearch.yml"
if File.exist?(file_path)
  config.merge!(YAML.load(ERB.new(File.read(file_path)).result)[Rails.env].deep_symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
