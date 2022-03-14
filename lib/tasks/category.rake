# frozen_string_literal: true

namespace :csc_core_category do
  desc "Migrate category"
  task migrate_primary_school_category: :environment do
    ActiveRecord::Base.transaction do
      upsert_category
      migrate_primary_school
      migrate_facility_category_id
      migrate_scorecard_dataset_code
    end
  end

  private
    def upsert_category
      categories = [
        { code: "D_PS", name_en: "Primary School", name_km: "បឋមសិក្សា", hierarchy: ["province", "district", "commune"] }
      ]

      categories.each do |cat|
        category = CscCore::Category.find_or_initialize_by(code: cat[:code])
        category.update(cat)
      end
    end

    def migrate_primary_school
      CscCore::PrimarySchool.all.each do |school|
        ps = primary_school_category.datasets.find_or_initialize_by(code: school.code)
        ps.update(school.attributes.extract!("name_en", "name_km", "commune_id", "district_id", "province_id"))
      end
    end

    def primary_school_category
      @primary_school_category ||= CscCore::Category.find_by(code: "D_PS")
    end

    def migrate_facility_category_id
      facilities = CscCore::Facility.where(code: "PS")
      facilities.update_all(category_id: primary_school_category.id)
    end

    def migrate_scorecard_dataset_code
      CscCore::Scorecard.where.not(primary_school_code: nil).each do |scorecard|
        scorecard.update(dataset_code: scorecard.primary_school_code)
      end
    end
end
