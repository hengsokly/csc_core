module CscCore
  class DataPublicationLog < ApplicationRecord
    self.table_name = "data_publication_logs"

    belongs_to :program

    enum published_options: DataPublication.published_options
  end
end
