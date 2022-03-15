# frozen_string_literal: true

module CscCore
  class Programs::FacilityService
    attr_reader :program

    def initialize(program_id)
      @program = Program.find(program_id)
    end

    def clone_from_program(source_program)
      source_program.facilities.roots.each do |facility|
        create_facility(facility)
      end
    end

    private
      def create_facility(facility, parent = nil)
        new_facility = program.facilities.find_or_initialize_by(code: facility.code)
        new_facility.update(
          facility.attributes.extract!("name_en", "name_km", "dataset", "category_id", "default")
                             .merge("parent_id" => parent.try(:id))
        )

        create_nested_facility(facility, new_facility) if facility.children.present?
      end

      def create_nested_facility(facility, parent = nil)
        facility.children.each do |child|
          create_facility(child, parent)
        end
      end
  end
end
