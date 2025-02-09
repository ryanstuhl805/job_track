class Company < ApplicationRecord
  has_many :company_notes
  has_many :notes, through: :company_notes

  accepts_nested_attributes_for :notes, allow_destroy: true

  before_destroy :destroy_orphaned_notes

  validates :name, presence: true, uniqueness: true

  def destroy_orphaned_notes
    company_notes.destroy_all
    notes.destroy_all
  end
end
