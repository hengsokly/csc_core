# frozen_string_literal: true

# == Schema Information
#
# Table name: programs
#
#  id                        :bigint           not null, primary key
#  name                      :string
#  datetime_format           :string           default("DD-MM-YYYY")
#  enable_email_notification :boolean          default(FALSE)
#  shortcut_name             :string
#  dashboard_user_emails     :text             default([]), is an Array
#  dashboard_user_roles      :string           default([]), is an Array
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  uuid                      :uuid
#
module CscCore
  class Program < ApplicationRecord
    self.table_name = "programs"

    include Programs::Elasticsearch
    include Programs::Quota
    include Programs::Dashboard
    include Programs::Removing

    attr_accessor :skip_callback

    has_many :users, dependent: :destroy
    has_many :languages, dependent: :destroy
    has_many :facilities, dependent: :destroy
    has_many :indicators, through: :facilities
    has_many :templates, dependent: :destroy
    has_many :local_ngos, dependent: :destroy
    has_many :scorecards, dependent: :destroy
    has_many :rating_scales, dependent: :destroy
    has_many :contacts, dependent: :destroy
    has_many :pdf_templates, dependent: :destroy
    has_many :chat_groups, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :mobile_tokens, dependent: :destroy
    has_many :activity_logs, dependent: :destroy
    has_one  :data_publication, dependent: :destroy
    has_many :data_publication_logs, dependent: :destroy
    has_one  :telegram_bot, dependent: :destroy
    has_one  :gf_dashboard, dependent: :destroy
    has_one  :quota, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :shortcut_name, presence: true, uniqueness: true

    after_create :create_default_language
    after_create :create_default_rating_scale, unless: :skip_callback
    after_create :create_dashboard_async, unless: :skip_callback

    DATETIME_FORMATS = {
      "YYYY-MM-DD" => "%Y-%m-%d",
      "DD-MM-YYYY" => "%d-%m-%Y"
    }.freeze

    accepts_nested_attributes_for :rating_scales, allow_destroy: true
    accepts_nested_attributes_for :contacts, allow_destroy: true
    accepts_nested_attributes_for :telegram_bot, allow_destroy: true
    accepts_nested_attributes_for :quota, allow_destroy: true
    accepts_nested_attributes_for :data_publication, allow_destroy: true

    delegate :enabled, to: :telegram_bot, prefix: :telegram_bot, allow_nil: true

    private
      def create_default_language
        languages.create(code: "km", name_en: "Khmer", name_km: "ខ្មែរ")
      end

      def create_default_rating_scale
        rating_scales.create_defaults(languages.first)
      end
  end
end
