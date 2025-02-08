class Note < ApplicationRecord
    has_many :company_notes
    has_one :company, through: :company_notes

    accepts_nested_attributes_for :company_notes, allow_destroy: true
end
