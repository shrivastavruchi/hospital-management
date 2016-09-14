class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :date
      t.string :time
      t.string :progress
      t.string :treatment
      t.integer :user_id
      t.integer :visit_id
      t.string :remarks
      t.integer :addmission_id

      t.timestamps null: false
    end
  end
end
