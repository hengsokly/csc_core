module CscCore
  class Location < ApplicationRecord
    self.table_name = "locations"

    validates :code, :name_en, :name_km, :kind, presence: true
    validates_inclusion_of :kind, in: %w[province district commune village], message: "type %{value} is invalid"
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, allow_blank: true
    validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_blank: true
    validate  :presence_of_lat_lng

    has_many :children, class_name: "Location", foreign_key: :parent_id
    belongs_to :parent, class_name: "Location", optional: true

    def self.location_kind(code)
      return if code.blank?

      { 2 => "province", 4 => "district", 6 => "commune", 8 => "village" }[code.to_s.length]
    end

    private
      def presence_of_lat_lng
        return unless latitude.present? != longitude.present?

        errors.add(:longitude, "can't be blank") if latitude.present?
        errors.add(:latitude, "can't be blank") if longitude.present?
      end
  end
end
