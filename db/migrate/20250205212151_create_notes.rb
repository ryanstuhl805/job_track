class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.text :status
      t.text :links
      t.string :callout

      t.timestamps
    end
  end
end
