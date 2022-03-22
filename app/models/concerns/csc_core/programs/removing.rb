# frozen_string_literal: true

module CscCore
  module Programs
    module Removing
      extend ActiveSupport::Concern

      included do
        def remove!(program_name)
          raise "Program name does not match!" unless name == program_name

          self.really_remove!
        end

        private
          def really_remove!
            ActiveRecord::Base.transaction do
              scorecards.with_deleted.each do |scorecard|
                scorecard.facilitators.destroy_all
                scorecard.participants.destroy_all
                scorecard.custom_indicators.destroy_all
                scorecard.raised_indicators.destroy_all
                scorecard.voting_indicators.destroy_all
                scorecard.ratings.destroy_all
                scorecard.scorecard_progresses.destroy_all
                scorecard.suggested_actions.destroy_all
                scorecard.scorecard_references.destroy_all
                scorecard.request_changes.destroy_all
                scorecard.indicator_activities.destroy_all
                scorecard.really_destroy!
              end

              users.with_deleted.each do |user|
                user.really_destroy!
              end

              destroy!
            end
        end
      end
    end
  end
end
