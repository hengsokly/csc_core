module CscCore
  class GfDashboard < ApplicationRecord
    self.table_name = "gf_dashboards"

    belongs_to :program
  end
end
