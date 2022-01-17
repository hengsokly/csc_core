module CscCore
  class Caf < ApplicationRecord
    self.table_name = "cafs"

    belongs_to :local_ngo
    has_many :facilitators
    has_many :scorecards, through: :facilitators
    belongs_to :educational_background, optional: true
    belongs_to :scorecard_knowledge, optional: true

    acts_as_paranoid if column_names.include? "deleted_at"

    delegate :name, to: :educational_background, prefix: :educational_background, allow_nil: true
    delegate :name, to: :scorecard_knowledge, prefix: :scorecard_knowledge, allow_nil: true

    GENDERS = %w(female male other)

    validates :name, presence: true
    validates :sex, inclusion: { in: GENDERS }, allow_blank: true

    scope :actives, -> { where(actived: true) }

    def self.filter(params)
      scope = all
      scope = scope.where("LOWER(name) LIKE ? OR tel LIKE ?", "%#{params[:keyword].downcase}%", "%#{params[:keyword].downcase}%") if params[:keyword].present?
      scope = scope.where(local_ngo_id: params[:local_ngo_id]) if params[:local_ngo_id].present?
      scope
    end
  end
end
