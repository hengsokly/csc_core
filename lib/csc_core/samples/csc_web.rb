# frozen_string_literal: true

require_relative "sample"

module CscCore
  module Samples
    class CscWeb
      def self.load_samples
        CscCore::Samples::Program.load
        CscCore::Samples::Language.load
        CscCore::Samples::PdfTemplate.load
        CscCore::Samples::Location.load
        CscCore::Samples::Category.load
        CscCore::Samples::Dataset.load
        CscCore::Samples::LocalNgo.load
        CscCore::Samples::User.load
        CscCore::Samples::Facility.load
        CscCore::Samples::Indicator.load
        CscCore::Samples::Caf.load
        CscCore::Samples::RatingScale.load
        CscCore::Samples::EducationalBackground.load
        CscCore::Samples::ScorecardKnowledge.load

        CscCore::Samples::Scorecard.load
      end

      def self.export(filetype = "json")
        CscCore::Samples::Scorecard.export(filetype)
      end
    end
  end
end
