class CreateInterviews < ActiveRecord::Migration[8.0]
  def change
    create_table :interviews do |t|
      t.string :stage

      t.timestamps
    end
  end
end
