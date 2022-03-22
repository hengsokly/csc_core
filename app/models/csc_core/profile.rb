# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :uuid             not null, primary key
#  code       :string
#  name_en    :string
#  name_km    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module CscCore
  class Profile < ApplicationRecord
    self.table_name = "profiles"

    has_many :participants_profiles
    has_many :participants, through: :participants_profiles

    def self.defaults
      [
        { code: "DI", name_en: "Disability", name_km: "ពិការភាព" },
        { code: "ET", name_en: "Ethnicity", name_km: "ជនជាតិដើម" },
        { code: "PO", name_en: "ID Poor", name_km: "មានប័ណ្ណក្រីក្រ" },
        { code: "YO", name_en: "Youth", name_km: "យុវជន" }
      ]
    end

    def self.create_defaults
      defaults.each do |p|
        profile = self.find_or_initialize_by(code: p[:code])
        profile.update(p)
      end
    end
  end
end
