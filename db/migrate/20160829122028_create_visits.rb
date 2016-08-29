class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :date

      t.timestamps null: false
    end
  end
end
