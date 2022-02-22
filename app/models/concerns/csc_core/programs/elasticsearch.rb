# frozen_string_literal: true
module CscCore::Programs::Elasticsearch
  extend ActiveSupport::Concern

  included do
    after_create { CscCore::ProgramWorker.perform_async(id) if ENV["ELASTICSEARCH_ENABLED"] == "true" }

    def reindex_documents
      return unless ENV["ELASTICSEARCH_ENABLED"] == "true"

      delete_index
      create_index
      index_documents
    end

    def index_name
      @index_name ||= "#{CscCore::Scorecard.index_name}_#{name.downcase.split(' ').join('_')}"
    end

    def create_index
      return if client.indices.exists(index: index_name)

      client.indices.create \
        index: index_name,
        body: { settings: CscCore::Scorecard.settings.to_hash, mappings: CscCore::Scorecard.mappings.to_hash }
    end

    private
      def delete_index
        client.delete_by_query(index: index_name, q: "*"); rescue
      end

      def index_documents
        scorecards.each do |scorecard|
          scorecard.index_document_async
        end
      end

      def client
        @client ||= ::Elasticsearch::Model.client
      end
  end
end
