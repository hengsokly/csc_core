# == Schema Information
#
# Table name: data_publication_logs
#
#  id               :uuid             not null, primary key
#  program_id       :integer
#  published_option :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
module CscCore
  class DataPublicationLog < ApplicationRecord
    self.table_name = "data_publication_logs"

    belongs_to :program

    enum published_options: DataPublication.published_options
  end
end
