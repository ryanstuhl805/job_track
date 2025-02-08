class Company < ApplicationRecord
  has_many :company_notes
  has_many :notes, through: :company_notes

  accepts_nested_attributes_for :notes, allow_destroy: true

  after_destroy :destroy_orphaned_notes

  validates :name, presence: true, uniqueness: true

  def destroy_orphaned_notes
    notes.each do |note|
      note.destroy if note.companies.empty?
      company_note.destroy if company_note.company.nil?
    end
  end
end
