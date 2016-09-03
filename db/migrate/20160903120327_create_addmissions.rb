class CreateAddmissions < ActiveRecord::Migration
  def change
    create_table :addmissions do |t|
      t.string :visit_id
      t.integer :doctor_id
      t.integer :patient_id
      t.string :addmission_date
      t.string :discharge_date


      t.timestamps null: false
    end
  end
end
