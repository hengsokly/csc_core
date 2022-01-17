module CscCore
  class Contact < ApplicationRecord
    self.table_name = "contacts"

    enum contact_type: {
      tel: 1,
      email: 2
    }

    CONTACT_TYPES = contact_types.keys.map { |key| [I18n.t("contact.#{key}"), key] }

    belongs_to :program, optional: true

    scope :no_program, -> { where(program: nil) }

    validates :contact_type, presence: true
    validates :value, presence: true
    validates :value, email: true, if: :email?, allow_blank: true
    validates :value, tel: true, if: :tel?, allow_blank: true
  end
end
