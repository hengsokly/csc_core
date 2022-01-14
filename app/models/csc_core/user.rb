module CscCore
  class User < ApplicationRecord
    self.table_name = "users"

    attr_accessor :skip_callback

    devise :database_authenticatable, :registerable, :confirmable, :lockable, :trackable,
           :recoverable, :rememberable, :validatable
           # :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

    acts_as_paranoid

    enum role: {
      system_admin: 1,
      program_admin: 2,
      staff: 3,
      lngo: 4
    }

    ROLES = [
      ["System Admin", "system_admin"],
      ["Admin", "program_admin"],
      ["Staff/Officer", "staff"],
      ["Lngo", "lngo"]
    ]

    # Validation
    validates :role, presence: true
    validates :program_id, presence: true, unless: -> { system_admin? }
    validates :local_ngo_id, presence: true, if: -> { lngo? }
    validate  :validate_archived_email

    # Callback
    before_create :generate_authentication_token

    def display_name
      email.split("@").first.upcase
    end

    def regenerate_authentication_token!
      return if token_expired_date > Time.zone.now

      generate_authentication_token
      self.save
    end

    def status
      return "archived" if deleted?
      return "locked" if access_locked?
      return "actived" if confirmed? && actived?
      return "deactivated" unless actived?

      "pending"
    end

    def active_for_authentication?
      super and self.actived?
    end

    private
      # Instant methods
      def validate_archived_email
        if self.class.only_deleted.where(email: email).length > 0
          errors.add :email, :uniqueness, message: I18n.t("user.is_being_archived")
        end
      end

      def generate_authentication_token
        self.encrypted_password ||= ""
        self.authentication_token = Devise.friendly_token
        self.token_expired_date = (ENV.fetch("TOKEN_EXPIRED_IN_DAY") { 1 }).to_i.day.from_now
      end
  end
end
