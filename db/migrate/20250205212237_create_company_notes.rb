class CreateCompanyNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :company_notes do |t|
      t.references :company, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
